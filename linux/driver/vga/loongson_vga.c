// SPDX-License-Identifier: GPL-2.0
/*
 * Framebuffer driver for the VGA path in rtl/soc_demo/soc_top.v:
 *
 * DDR -> axi_vdma_0 (MM2S) -> v_axi4s_vid_out_0 -> RGB444 board DAC
 *                                  ^
 *                               v_tc_0
 *
 * This driver deliberately owns the VDMA and VTC MMIO ranges directly.  The
 * corresponding generic Xilinx VDMA/VTC DT nodes must therefore be disabled.
 * The VDMA MM2S interrupt is connected directly to the CPU interrupt input.
 */

#include <linux/atomic.h>
#include <linux/bitops.h>
#include <linux/clk.h>
#include <linux/dma-mapping.h>
#include <linux/fb.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/iopoll.h>
#include <linux/module.h>
#include <linux/mutex.h>
#include <linux/of.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/string.h>

#include <video/display_timing.h>
#include <video/of_videomode.h>
#include <video/videomode.h>

/* axi_vdma_0 MM2S control registers. */
#define VDMA_MM2S_DMACR                 0x0000
#define VDMA_MM2S_DMASR                 0x0004
#define VDMA_DMACR_ERR_IRQ              BIT(14)
#define VDMA_DMACR_GENLOCK_EN           BIT(3)
#define VDMA_DMACR_RESET                BIT(2)
#define VDMA_DMACR_CIRC_EN              BIT(1)
#define VDMA_DMACR_RUNSTOP              BIT(0)
#define VDMA_DMASR_ERR_IRQ              BIT(14)
#define VDMA_DMASR_DLY_CNT_IRQ          BIT(13)
#define VDMA_DMASR_FRM_CNT_IRQ          BIT(12)
#define VDMA_DMASR_IRQ_MASK             GENMASK(14, 12)
#define VDMA_DMASR_ERROR_MASK           GENMASK(15, 4)
#define VDMA_MM2S_DESC                   0x0050
#define VDMA_DESC_VSIZE                 0x0000
#define VDMA_DESC_HSIZE                 0x0004
#define VDMA_DESC_FRMDLY_STRIDE         0x0008
#define VDMA_DESC_START_ADDRESS(n)      (0x000c + 4 * (n))
#define VDMA_FRAME_STORES               3
#define VDMA_MEMORY_BEAT_BYTES          8

/* v_tc_0 common and generator registers. */
#define VTC_CONTROL                     0x0000
#define VTC_CONTROL_REG_UPDATE          BIT(1)
#define VTC_CONTROL_ACTIVE_CHROMA_SRC   BIT(25)
#define VTC_CONTROL_ACTIVE_VIDEO_SRC    BIT(24)
#define VTC_CONTROL_HSYNC_POL_SRC       BIT(23)
#define VTC_CONTROL_VSYNC_POL_SRC       BIT(22)
#define VTC_CONTROL_HBLANK_POL_SRC      BIT(21)
#define VTC_CONTROL_VBLANK_POL_SRC      BIT(20)
#define VTC_CONTROL_CHROMA_SRC          BIT(18)
#define VTC_CONTROL_VBLANK_HOFF_SRC     BIT(17)
#define VTC_CONTROL_VSYNC_END_SRC       BIT(16)
#define VTC_CONTROL_VSYNC_START_SRC     BIT(15)
#define VTC_CONTROL_ACTIVE_VSIZE_SRC    BIT(14)
#define VTC_CONTROL_FRAME_VSIZE_SRC     BIT(13)
#define VTC_CONTROL_HSYNC_END_SRC       BIT(11)
#define VTC_CONTROL_HSYNC_START_SRC     BIT(10)
#define VTC_CONTROL_ACTIVE_HSIZE_SRC    BIT(9)
#define VTC_CONTROL_FRAME_HSIZE_SRC     BIT(8)
#define VTC_CONTROL_GEN_ENABLE          BIT(2)

#define VTC_GENERATOR_OFFSET            0x0060
#define VTC_ACTIVE_SIZE                 0x0000
#define VTC_ENCODING                    0x0008
#define VTC_ENCODING_RGB                2
#define VTC_POLARITY                    0x000c
#define VTC_POL_ACTIVE_CHROMA           BIT(5)
#define VTC_POL_ACTIVE_VIDEO            BIT(4)
#define VTC_POL_HSYNC                   BIT(3)
#define VTC_POL_VSYNC                   BIT(2)
#define VTC_POL_HBLANK                  BIT(1)
#define VTC_POL_VBLANK                  BIT(0)
#define VTC_HSIZE                       0x0010
#define VTC_VSIZE                       0x0014
#define VTC_HSYNC                       0x0018
#define VTC_F0_VBLANK_H                 0x001c
#define VTC_F0_VSYNC_V                  0x0020
#define VTC_F0_VSYNC_H                  0x0024
#define VTC_FRAME_SYNC_0                0x0100

#define LOONGSON_VGA_BYTES_PER_PIXEL    3
#define LOONGSON_VGA_MAX_DIMENSION      4096

struct loongson_vga {
	struct device *dev;
	struct fb_info *info;
	void __iomem *vdma;
	void __iomem *vtc;
	struct clk *pixel_clk;
	struct videomode mode;
	void *fb_virt;
	dma_addr_t fb_dma;
	size_t fb_size;
	u32 pseudo_palette[16];
	struct mutex lock;
	atomic64_t dma_errors;
	bool running;
};

static inline void vtc_gen_write(struct loongson_vga *vga, u32 reg, u32 value)
{
	writel(value, vga->vtc + VTC_GENERATOR_OFFSET + reg);
}

static void loongson_vga_vtc_stop(struct loongson_vga *vga)
{
	writel(0, vga->vtc + VTC_CONTROL);
}

static void loongson_vga_vtc_start(struct loongson_vga *vga)
{
	const struct videomode *mode = &vga->mode;
	u32 hsync_start = mode->hactive + mode->hfront_porch;
	u32 hsync_end = hsync_start + mode->hsync_len;
	u32 htotal = hsync_end + mode->hback_porch;
	u32 vsync_start = mode->vactive + mode->vfront_porch;
	u32 vsync_end = vsync_start + mode->vsync_len;
	u32 vtotal = vsync_end + mode->vback_porch;
	u32 polarity;
	u32 control;

	/* Active video and blanking are high in the native-video pipeline. */
	polarity = VTC_POL_ACTIVE_CHROMA | VTC_POL_ACTIVE_VIDEO |
		   VTC_POL_HBLANK | VTC_POL_VBLANK;
	if (mode->flags & DISPLAY_FLAGS_HSYNC_HIGH)
		polarity |= VTC_POL_HSYNC;
	if (mode->flags & DISPLAY_FLAGS_VSYNC_HIGH)
		polarity |= VTC_POL_VSYNC;

	vtc_gen_write(vga, VTC_POLARITY, polarity);
	vtc_gen_write(vga, VTC_ENCODING, VTC_ENCODING_RGB);
	vtc_gen_write(vga, VTC_ACTIVE_SIZE,
		      (mode->vactive << 16) | mode->hactive);
	vtc_gen_write(vga, VTC_HSIZE, htotal);
	vtc_gen_write(vga, VTC_VSIZE, vtotal);
	vtc_gen_write(vga, VTC_HSYNC, (hsync_end << 16) | hsync_start);
	vtc_gen_write(vga, VTC_F0_VBLANK_H, 0);
	vtc_gen_write(vga, VTC_F0_VSYNC_V,
		      (vsync_end << 16) | vsync_start);
	vtc_gen_write(vga, VTC_F0_VSYNC_H, 0);
	/* mm2s_fsync is wired to vtc_fsync[0]. */
	writel(0, vga->vtc + VTC_FRAME_SYNC_0);

	control = VTC_CONTROL_ACTIVE_CHROMA_SRC |
		  VTC_CONTROL_ACTIVE_VIDEO_SRC |
		  VTC_CONTROL_HSYNC_POL_SRC |
		  VTC_CONTROL_VSYNC_POL_SRC |
		  VTC_CONTROL_HBLANK_POL_SRC |
		  VTC_CONTROL_VBLANK_POL_SRC |
		  VTC_CONTROL_CHROMA_SRC |
		  VTC_CONTROL_VBLANK_HOFF_SRC |
		  VTC_CONTROL_VSYNC_END_SRC |
		  VTC_CONTROL_VSYNC_START_SRC |
		  VTC_CONTROL_ACTIVE_VSIZE_SRC |
		  VTC_CONTROL_FRAME_VSIZE_SRC |
		  VTC_CONTROL_HSYNC_END_SRC |
		  VTC_CONTROL_HSYNC_START_SRC |
		  VTC_CONTROL_ACTIVE_HSIZE_SRC |
		  VTC_CONTROL_FRAME_HSIZE_SRC |
		  VTC_CONTROL_GEN_ENABLE |
		  VTC_CONTROL_REG_UPDATE;
	writel(control, vga->vtc + VTC_CONTROL);
}

static void loongson_vga_vdma_stop(struct loongson_vga *vga)
{
	u32 control = readl(vga->vdma + VDMA_MM2S_DMACR);

	control &= ~(VDMA_DMACR_RUNSTOP | VDMA_DMACR_ERR_IRQ);
	writel(control, vga->vdma + VDMA_MM2S_DMACR);
}

static int loongson_vga_vdma_start(struct loongson_vga *vga)
{
	struct fb_info *info = vga->info;
	u32 control;
	u32 value;
	unsigned int index;
	int ret;

	if ((u64)vga->fb_dma > U32_MAX ||
	    (vga->fb_dma & (VDMA_MEMORY_BEAT_BYTES - 1)) ||
	    (info->fix.line_length & (VDMA_MEMORY_BEAT_BYTES - 1)))
		return -EINVAL;

	writel(VDMA_DMACR_RESET, vga->vdma + VDMA_MM2S_DMACR);
	ret = readl_poll_timeout(vga->vdma + VDMA_MM2S_DMACR, value,
				 !(value & VDMA_DMACR_RESET), 10, 100000);
	if (ret) {
		dev_err(vga->dev, "axi_vdma_0 MM2S reset timed out\n");
		return ret;
	}

	/* Clear stale interrupt state before enabling the channel. */
	writel(VDMA_DMASR_IRQ_MASK, vga->vdma + VDMA_MM2S_DMASR);
	control = VDMA_DMACR_RUNSTOP | VDMA_DMACR_CIRC_EN |
		  VDMA_DMACR_GENLOCK_EN | VDMA_DMACR_ERR_IRQ;
	writel(control, vga->vdma + VDMA_MM2S_DMACR);

	for (index = 0; index < VDMA_FRAME_STORES; ++index)
		writel(lower_32_bits(vga->fb_dma),
		       vga->vdma + VDMA_MM2S_DESC +
		       VDMA_DESC_START_ADDRESS(index));

	writel(info->fix.line_length,
	       vga->vdma + VDMA_MM2S_DESC + VDMA_DESC_FRMDLY_STRIDE);
	writel(vga->mode.hactive * LOONGSON_VGA_BYTES_PER_PIXEL,
	       vga->vdma + VDMA_MM2S_DESC + VDMA_DESC_HSIZE);
	/* VSIZE is written last; in direct-register mode this starts transfers. */
	wmb();
	writel(vga->mode.vactive,
	       vga->vdma + VDMA_MM2S_DESC + VDMA_DESC_VSIZE);
	return 0;
}

static int loongson_vga_hw_start(struct loongson_vga *vga)
{
	int ret;

	loongson_vga_vtc_stop(vga);
	ret = loongson_vga_vdma_start(vga);
	if (ret)
		return ret;

	loongson_vga_vtc_start(vga);
	vga->running = true;
	return 0;
}

static void loongson_vga_hw_stop(struct loongson_vga *vga)
{
	loongson_vga_vtc_stop(vga);
	loongson_vga_vdma_stop(vga);
	vga->running = false;
}

static irqreturn_t loongson_vga_irq(int irq, void *data)
{
	struct loongson_vga *vga = data;
	u32 status = readl(vga->vdma + VDMA_MM2S_DMASR);
	u32 pending = status & VDMA_DMASR_IRQ_MASK;

	if (!pending)
		return IRQ_NONE;

	writel(pending, vga->vdma + VDMA_MM2S_DMASR);
	if ((pending & VDMA_DMASR_ERR_IRQ) ||
	    (status & VDMA_DMASR_ERROR_MASK)) {
		atomic64_inc(&vga->dma_errors);
		dev_warn_ratelimited(vga->dev,
			"axi_vdma_0 MM2S error, status=0x%08x\n", status);
	}

	return IRQ_HANDLED;
}

static int loongson_vga_check_var(struct fb_var_screeninfo *var,
				  struct fb_info *info)
{
	struct loongson_vga *vga = info->par;

	/* The instantiated stream is fixed at 24 bits/pixel and has no scaler. */
	if (var->xres != vga->mode.hactive ||
	    var->yres != vga->mode.vactive || var->bits_per_pixel != 24)
		return -EINVAL;

	var->xres_virtual = var->xres;
	var->yres_virtual = var->yres;
	var->xoffset = 0;
	var->yoffset = 0;
	var->grayscale = 0;
	var->nonstd = 0;

	/* soc_top.v defines the AXI stream as {R,B,G}. */
	var->red.offset = 16;
	var->red.length = 8;
	var->green.offset = 0;
	var->green.length = 8;
	var->blue.offset = 8;
	var->blue.length = 8;
	var->transp.offset = 0;
	var->transp.length = 0;
	return 0;
}

static int loongson_vga_set_par(struct fb_info *info)
{
	struct loongson_vga *vga = info->par;
	int ret;

	mutex_lock(&vga->lock);
	loongson_vga_hw_stop(vga);
	ret = loongson_vga_hw_start(vga);
	mutex_unlock(&vga->lock);
	return ret;
}

static int loongson_vga_blank(int blank, struct fb_info *info)
{
	struct loongson_vga *vga = info->par;
	int ret = 0;

	mutex_lock(&vga->lock);
	if (blank == FB_BLANK_UNBLANK) {
		if (!vga->running)
			ret = loongson_vga_hw_start(vga);
	} else if (vga->running) {
		loongson_vga_hw_stop(vga);
	}
	mutex_unlock(&vga->lock);
	return ret;
}

static u32 loongson_vga_chan_to_field(u32 channel,
				      const struct fb_bitfield *field)
{
	channel &= 0xffff;
	channel >>= 16 - field->length;
	return channel << field->offset;
}

static int loongson_vga_setcolreg(unsigned int regno, unsigned int red,
				  unsigned int green, unsigned int blue,
				  unsigned int transp, struct fb_info *info)
{
	u32 value;

	if (regno >= ARRAY_SIZE(((struct loongson_vga *)info->par)->pseudo_palette))
		return -EINVAL;

	value = loongson_vga_chan_to_field(red, &info->var.red) |
		loongson_vga_chan_to_field(green, &info->var.green) |
		loongson_vga_chan_to_field(blue, &info->var.blue);
	((u32 *)info->pseudo_palette)[regno] = value;
	return 0;
}

static int loongson_vga_mmap(struct fb_info *info,
			     struct vm_area_struct *vma)
{
	struct loongson_vga *vga = info->par;

	return dma_mmap_wc(vga->dev, vma, vga->fb_virt,
			   vga->fb_dma, vga->fb_size);
}

static const struct fb_ops loongson_vga_ops = {
	.owner = THIS_MODULE,
	.fb_read = fb_sys_read,
	.fb_write = fb_sys_write,
	.fb_check_var = loongson_vga_check_var,
	.fb_set_par = loongson_vga_set_par,
	.fb_setcolreg = loongson_vga_setcolreg,
	.fb_blank = loongson_vga_blank,
	.fb_fillrect = cfb_fillrect,
	.fb_copyarea = cfb_copyarea,
	.fb_imageblit = cfb_imageblit,
	.fb_mmap = loongson_vga_mmap,
};

static int loongson_vga_validate_mode(struct device *dev,
				      const struct videomode *mode)
{
	u32 htotal = mode->hactive + mode->hfront_porch + mode->hsync_len +
		     mode->hback_porch;
	u32 vtotal = mode->vactive + mode->vfront_porch + mode->vsync_len +
		     mode->vback_porch;

	if (!mode->pixelclock || !mode->hactive || !mode->vactive ||
	    htotal > LOONGSON_VGA_MAX_DIMENSION ||
	    vtotal > LOONGSON_VGA_MAX_DIMENSION) {
		dev_err(dev, "invalid or unsupported display-timings entry\n");
		return -EINVAL;
	}
	return 0;
}

static int loongson_vga_set_pixel_clock(struct loongson_vga *vga)
{
	unsigned long requested = vga->mode.pixelclock;
	unsigned long actual;
	unsigned long difference;
	int ret;

	ret = clk_set_rate(vga->pixel_clk, requested);
	actual = clk_get_rate(vga->pixel_clk);
	if (!actual)
		return ret ? ret : -EINVAL;

	difference = actual > requested ? actual - requested : requested - actual;
	if (difference > requested / 50) {
		dev_err(vga->dev,
			"pixel clock %lu Hz differs from requested %lu Hz by more than 2%%\n",
			actual, requested);
		return ret ? ret : -EINVAL;
	}
	if (ret)
		dev_warn(vga->dev,
			 "clock cannot be reprogrammed; using existing %lu Hz\n",
			 actual);
	else if (actual != requested)
		dev_info(vga->dev, "pixel clock rounded from %lu to %lu Hz\n",
			 requested, actual);
	return 0;
}

static int loongson_vga_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct loongson_vga *vga;
	struct fb_info *info;
	struct resource *resource;
	int irq;
	int ret;

	info = framebuffer_alloc(sizeof(*vga), dev);
	if (!info)
		return -ENOMEM;

	vga = info->par;
	vga->dev = dev;
	vga->info = info;
	mutex_init(&vga->lock);
	atomic64_set(&vga->dma_errors, 0);

	resource = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vdma");
	if (!resource) {
		ret = -ENODEV;
		goto err_release_info;
	}
	vga->vdma = devm_ioremap_resource(dev, resource);
	if (IS_ERR(vga->vdma)) {
		ret = PTR_ERR(vga->vdma);
		goto err_release_info;
	}

	resource = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vtc");
	if (!resource) {
		ret = -ENODEV;
		goto err_release_info;
	}
	vga->vtc = devm_ioremap_resource(dev, resource);
	if (IS_ERR(vga->vtc)) {
		ret = PTR_ERR(vga->vtc);
		goto err_release_info;
	}

	vga->pixel_clk = devm_clk_get(dev, "pixel");
	if (IS_ERR(vga->pixel_clk)) {
		ret = PTR_ERR(vga->pixel_clk);
		goto err_release_info;
	}

	ret = of_get_videomode(dev->of_node, &vga->mode, OF_USE_NATIVE_MODE);
	if (ret) {
		dev_err(dev, "missing native display-timings entry\n");
		goto err_release_info;
	}
	ret = loongson_vga_validate_mode(dev, &vga->mode);
	if (ret)
		goto err_release_info;

	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
	if (ret) {
		dev_err(dev, "a 32-bit DMA mask is required by axi_vdma_0\n");
		goto err_release_info;
	}

	info->fix.line_length = ALIGN(vga->mode.hactive *
				       LOONGSON_VGA_BYTES_PER_PIXEL,
				       VDMA_MEMORY_BEAT_BYTES);
	vga->fb_size = PAGE_ALIGN((size_t)info->fix.line_length *
				  vga->mode.vactive);
	vga->fb_virt = dma_alloc_wc(dev, vga->fb_size, &vga->fb_dma,
				    GFP_KERNEL);
	if (!vga->fb_virt) {
		ret = -ENOMEM;
		goto err_release_info;
	}
	memset(vga->fb_virt, 0, vga->fb_size);

	strscpy(info->fix.id, "loongson-vga", sizeof(info->fix.id));
	info->fix.smem_start = vga->fb_dma;
	info->fix.smem_len = vga->fb_size;
	info->fix.type = FB_TYPE_PACKED_PIXELS;
	info->fix.visual = FB_VISUAL_TRUECOLOR;
	info->fix.accel = FB_ACCEL_NONE;

	info->var.xres = vga->mode.hactive;
	info->var.yres = vga->mode.vactive;
	info->var.xres_virtual = vga->mode.hactive;
	info->var.yres_virtual = vga->mode.vactive;
	info->var.pixclock = KHZ2PICOS(vga->mode.pixelclock / 1000);
	info->var.left_margin = vga->mode.hback_porch;
	info->var.right_margin = vga->mode.hfront_porch;
	info->var.upper_margin = vga->mode.vback_porch;
	info->var.lower_margin = vga->mode.vfront_porch;
	info->var.hsync_len = vga->mode.hsync_len;
	info->var.vsync_len = vga->mode.vsync_len;
	info->var.sync = 0;
	if (vga->mode.flags & DISPLAY_FLAGS_HSYNC_HIGH)
		info->var.sync |= FB_SYNC_HOR_HIGH_ACT;
	if (vga->mode.flags & DISPLAY_FLAGS_VSYNC_HIGH)
		info->var.sync |= FB_SYNC_VERT_HIGH_ACT;
	info->var.vmode = FB_VMODE_NONINTERLACED;
	info->var.activate = FB_ACTIVATE_NOW;
	info->var.width = -1;
	info->var.height = -1;
	info->var.bits_per_pixel = 24;
	loongson_vga_check_var(&info->var, info);

	info->fbops = &loongson_vga_ops;
	info->screen_base = (char __iomem *)vga->fb_virt;
	info->screen_size = vga->fb_size;
	info->pseudo_palette = vga->pseudo_palette;
	info->flags = FBINFO_FLAG_DEFAULT;

	ret = fb_alloc_cmap(&info->cmap, 256, 0);
	if (ret)
		goto err_free_dma;

	ret = loongson_vga_set_pixel_clock(vga);
	if (ret)
		goto err_free_cmap;
	ret = clk_prepare_enable(vga->pixel_clk);
	if (ret)
		goto err_free_cmap;

	irq = platform_get_irq(pdev, 0);
	if (irq < 0) {
		ret = irq;
		goto err_disable_clock;
	}
	ret = devm_request_irq(dev, irq, loongson_vga_irq, 0,
			       dev_name(dev), vga);
	if (ret)
		goto err_disable_clock;

	ret = loongson_vga_hw_start(vga);
	if (ret)
		goto err_disable_clock;

	ret = register_framebuffer(info);
	if (ret)
		goto err_stop;

	platform_set_drvdata(pdev, vga);
	dev_info(dev,
		 "fb%d: %ux%u, 24-bit {R,B,G}, stride %u, DMA %pad\n",
		 info->node, vga->mode.hactive, vga->mode.vactive,
		 info->fix.line_length, &vga->fb_dma);
	return 0;

err_stop:
	loongson_vga_hw_stop(vga);
err_disable_clock:
	clk_disable_unprepare(vga->pixel_clk);
err_free_cmap:
	fb_dealloc_cmap(&info->cmap);
err_free_dma:
	dma_free_wc(dev, vga->fb_size, vga->fb_virt, vga->fb_dma);
err_release_info:
	framebuffer_release(info);
	return ret;
}

static int loongson_vga_remove(struct platform_device *pdev)
{
	struct loongson_vga *vga = platform_get_drvdata(pdev);
	struct fb_info *info = vga->info;

	unregister_framebuffer(info);
	mutex_lock(&vga->lock);
	loongson_vga_hw_stop(vga);
	mutex_unlock(&vga->lock);
	clk_disable_unprepare(vga->pixel_clk);
	fb_dealloc_cmap(&info->cmap);
	dma_free_wc(vga->dev, vga->fb_size, vga->fb_virt, vga->fb_dma);
	framebuffer_release(info);
	return 0;
}

static const struct of_device_id loongson_vga_of_match[] = {
	{ .compatible = "loongson,mysoc-vga" },
	{ }
};
MODULE_DEVICE_TABLE(of, loongson_vga_of_match);

static struct platform_driver loongson_vga_driver = {
	.probe = loongson_vga_probe,
	.remove = loongson_vga_remove,
	.driver = {
		.name = "loongson-mysoc-vga",
		.of_match_table = loongson_vga_of_match,
	},
};
module_platform_driver(loongson_vga_driver);

MODULE_AUTHOR("mySOC project");
MODULE_DESCRIPTION("Loongson mySOC AXI VDMA/VTC VGA framebuffer driver");
MODULE_LICENSE("GPL");
