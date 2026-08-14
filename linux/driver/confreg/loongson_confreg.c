// SPDX-License-Identifier: GPL-2.0
/*
 * Driver for rtl/IP/CONFREG/confreg_syn.v.
 *
 * The hardware is a 32-bit AXI register bank.  The misc device permits
 * aligned pread()/pwrite() and ioctl access without exposing unrelated SoC
 * address space.  Writes and mmap require CAP_SYS_RAWIO because CRxx and the
 * ORDER register can control board logic and the legacy DMA handshake.
 */

#include <linux/capability.h>
#include <linux/fs.h>
#include <linux/io.h>
#include <linux/ioport.h>
#include <linux/miscdevice.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/mutex.h>
#include <linux/of.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/uaccess.h>

#include "loongson_confreg.h"

struct loongson_confreg {
	void __iomem *base;
	resource_size_t phys;
	resource_size_t size;
	struct mutex lock;
	struct miscdevice miscdev;
	bool allow_mmap;
};

static bool confreg_access_valid(struct loongson_confreg *confreg,
				 u32 offset, size_t count)
{
	return !(offset & 3) && !(count & 3) && count &&
	       offset < confreg->size && count <= confreg->size - offset;
}

static int loongson_confreg_open(struct inode *inode, struct file *file)
{
	struct miscdevice *miscdev = file->private_data;
	struct loongson_confreg *confreg;

	confreg = container_of(miscdev, struct loongson_confreg, miscdev);
	file->private_data = confreg;
	return 0;
}

static loff_t loongson_confreg_llseek(struct file *file, loff_t offset,
				      int whence)
{
	struct loongson_confreg *confreg = file->private_data;

	return fixed_size_llseek(file, offset, whence, confreg->size);
}

static ssize_t loongson_confreg_read(struct file *file, char __user *buffer,
				     size_t count, loff_t *position)
{
	struct loongson_confreg *confreg = file->private_data;
	u32 value;
	size_t done;

	if (!count)
		return 0;
	if (*position < 0 || *position > U32_MAX)
		return -EINVAL;
	if (*position == confreg->size)
		return 0;
	if (!confreg_access_valid(confreg, (u32)*position, count))
		return -EINVAL;

	mutex_lock(&confreg->lock);
	for (done = 0; done < count; done += sizeof(value)) {
		value = readl(confreg->base + *position + done);
		if (copy_to_user(buffer + done, &value, sizeof(value))) {
			mutex_unlock(&confreg->lock);
			*position += done;
			return done ? done : -EFAULT;
		}
	}
	mutex_unlock(&confreg->lock);

	*position += done;
	return done;
}

static ssize_t loongson_confreg_write(struct file *file,
				      const char __user *buffer, size_t count,
				      loff_t *position)
{
	struct loongson_confreg *confreg = file->private_data;
	u32 value;
	size_t done;

	if (!count)
		return 0;
	if (!capable(CAP_SYS_RAWIO))
		return -EPERM;
	if (*position < 0 || *position > U32_MAX)
		return -EINVAL;
	if (!confreg_access_valid(confreg, (u32)*position, count))
		return -EINVAL;

	mutex_lock(&confreg->lock);
	for (done = 0; done < count; done += sizeof(value)) {
		if (copy_from_user(&value, buffer + done, sizeof(value))) {
			mutex_unlock(&confreg->lock);
			*position += done;
			return done ? done : -EFAULT;
		}
		writel(value, confreg->base + *position + done);
	}
	mutex_unlock(&confreg->lock);

	*position += done;
	return done;
}

static long loongson_confreg_ioctl(struct file *file, unsigned int command,
				   unsigned long argument)
{
	struct loongson_confreg *confreg = file->private_data;
	void __user *argp = (void __user *)argument;
	struct loongson_confreg_access access;
	struct loongson_confreg_info info;

	switch (command) {
	case LOONGSON_CONFREG_IOC_GET_INFO:
		info.size = confreg->size;
		info.reserved = 0;
		return copy_to_user(argp, &info, sizeof(info)) ? -EFAULT : 0;

	case LOONGSON_CONFREG_IOC_READ32:
		if (copy_from_user(&access, argp, sizeof(access)))
			return -EFAULT;
		if (!confreg_access_valid(confreg, access.offset,
					  sizeof(access.value)))
			return -EINVAL;
		mutex_lock(&confreg->lock);
		access.value = readl(confreg->base + access.offset);
		mutex_unlock(&confreg->lock);
		return copy_to_user(argp, &access, sizeof(access)) ? -EFAULT : 0;

	case LOONGSON_CONFREG_IOC_WRITE32:
		if (!capable(CAP_SYS_RAWIO))
			return -EPERM;
		if (copy_from_user(&access, argp, sizeof(access)))
			return -EFAULT;
		if (!confreg_access_valid(confreg, access.offset,
					  sizeof(access.value)))
			return -EINVAL;
		mutex_lock(&confreg->lock);
		writel(access.value, confreg->base + access.offset);
		mutex_unlock(&confreg->lock);
		return 0;

	default:
		return -ENOTTY;
	}
}

static int loongson_confreg_mmap(struct file *file,
				 struct vm_area_struct *vma)
{
	struct loongson_confreg *confreg = file->private_data;
	unsigned long requested = vma->vm_end - vma->vm_start;
	resource_size_t offset = (resource_size_t)vma->vm_pgoff << PAGE_SHIFT;

	if (!confreg->allow_mmap || !capable(CAP_SYS_RAWIO))
		return -EPERM;
	if (offset >= confreg->size || requested > confreg->size - offset)
		return -EINVAL;

	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
	return remap_pfn_range(vma, vma->vm_start,
			       (confreg->phys + offset) >> PAGE_SHIFT,
			       requested, vma->vm_page_prot);
}

static const struct file_operations loongson_confreg_fops = {
	.owner = THIS_MODULE,
	.open = loongson_confreg_open,
	.llseek = loongson_confreg_llseek,
	.read = loongson_confreg_read,
	.write = loongson_confreg_write,
	.unlocked_ioctl = loongson_confreg_ioctl,
#ifdef CONFIG_COMPAT
	.compat_ioctl = loongson_confreg_ioctl,
#endif
	.mmap = loongson_confreg_mmap,
};

static int loongson_confreg_probe(struct platform_device *pdev)
{
	struct loongson_confreg *confreg;
	struct resource *resource;
	int ret;

	confreg = devm_kzalloc(&pdev->dev, sizeof(*confreg), GFP_KERNEL);
	if (!confreg)
		return -ENOMEM;

	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!resource)
		return -ENODEV;
	confreg->base = devm_ioremap_resource(&pdev->dev, resource);
	if (IS_ERR(confreg->base))
		return PTR_ERR(confreg->base);

	confreg->phys = resource->start;
	confreg->size = resource_size(resource);
	confreg->allow_mmap = of_property_read_bool(pdev->dev.of_node,
						    "loongson,allow-mmap");
	mutex_init(&confreg->lock);

	confreg->miscdev.minor = MISC_DYNAMIC_MINOR;
	confreg->miscdev.name = "confreg";
	confreg->miscdev.fops = &loongson_confreg_fops;
	confreg->miscdev.parent = &pdev->dev;

	ret = misc_register(&confreg->miscdev);
	if (ret)
		return ret;

	platform_set_drvdata(pdev, confreg);
	dev_info(&pdev->dev, "CONFREG registered as /dev/%s, %llu bytes\n",
		 confreg->miscdev.name, (unsigned long long)confreg->size);
	return 0;
}

static int loongson_confreg_remove(struct platform_device *pdev)
{
	struct loongson_confreg *confreg = platform_get_drvdata(pdev);

	misc_deregister(&confreg->miscdev);
	return 0;
}

static const struct of_device_id loongson_confreg_of_match[] = {
	{ .compatible = "loongson,confreg" },
	{ }
};
MODULE_DEVICE_TABLE(of, loongson_confreg_of_match);

static struct platform_driver loongson_confreg_driver = {
	.probe = loongson_confreg_probe,
	.remove = loongson_confreg_remove,
	.driver = {
		.name = "loongson-confreg",
		.of_match_table = loongson_confreg_of_match,
	},
};
module_platform_driver(loongson_confreg_driver);

MODULE_AUTHOR("mySOC project");
MODULE_DESCRIPTION("Loongson mySOC CONFREG driver");
MODULE_LICENSE("GPL");
