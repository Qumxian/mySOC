/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
#ifndef _UAPI_LOONGSON_CONFREG_H_
#define _UAPI_LOONGSON_CONFREG_H_

#include <linux/ioctl.h>
#include <linux/types.h>

/* Offsets relative to the CONFREG AXI window at 0x1fd00000. */
#define LOONGSON_CONFREG_CR00          0x0000
#define LOONGSON_CONFREG_CR01          0x0004
#define LOONGSON_CONFREG_CR02          0x0008
#define LOONGSON_CONFREG_CR03          0x000c
#define LOONGSON_CONFREG_CR04          0x0010
#define LOONGSON_CONFREG_CR05          0x0014
#define LOONGSON_CONFREG_CR06          0x0018
#define LOONGSON_CONFREG_CR07          0x001c

/* Shared with the original NAND/APB DMA handshake logic. */
#define LOONGSON_CONFREG_ORDER         0x1160

#define LOONGSON_CONFREG_TIMER         0xe000
#define LOONGSON_CONFREG_LED           0xf000
#define LOONGSON_CONFREG_LED_RG0       0xf004
#define LOONGSON_CONFREG_LED_RG1       0xf008
#define LOONGSON_CONFREG_NUM           0xf010
#define LOONGSON_CONFREG_SWITCH        0xf020
#define LOONGSON_CONFREG_BTN_KEY       0xf024
#define LOONGSON_CONFREG_BTN_STEP      0xf028
#define LOONGSON_CONFREG_FREQ          0xf030

struct loongson_confreg_access {
	__u32 offset;
	__u32 value;
};

struct loongson_confreg_info {
	__u32 size;
	__u32 reserved;
};

#define LOONGSON_CONFREG_IOC_MAGIC     'C'
#define LOONGSON_CONFREG_IOC_GET_INFO  \
	_IOR(LOONGSON_CONFREG_IOC_MAGIC, 0x00, struct loongson_confreg_info)
#define LOONGSON_CONFREG_IOC_READ32    \
	_IOWR(LOONGSON_CONFREG_IOC_MAGIC, 0x01, struct loongson_confreg_access)
#define LOONGSON_CONFREG_IOC_WRITE32   \
	_IOW(LOONGSON_CONFREG_IOC_MAGIC, 0x02, struct loongson_confreg_access)

#endif /* _UAPI_LOONGSON_CONFREG_H_ */
