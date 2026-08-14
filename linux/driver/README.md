# mySOC Linux drivers

This directory contains drivers for the register map and VGA pipeline in the
current `soc_top.v`.

## Devices

- `confreg/loongson_confreg.c` binds to `loongson,confreg` at
  `0x1fd00000-0x1fd0ffff` and creates `/dev/confreg`.
- `vga/loongson_vga.c` binds to `loongson,mysoc-vga`, owns
  `axi_vdma_0` at `0x1fb00000` and `v_tc_0` at `0x1fb10000`, and creates
  `/dev/fb0`.
- `clk_wiz_vga` at `0x1fb40000` continues to use the upstream Xilinx Clocking
  Wizard driver. The VDMA MM2S interrupt is connected directly to CPU IRQ9.

The VGA driver uses a 640x480 24-bit scanout buffer.  The unusual fbdev color
layout is intentional: the RTL stream is `{R,B,G}`, so the fbdev bit offsets
are red 16, green 0, and blue 8.  Changing this to a standard DRM format first
requires changing the RTL component order.

The framebuffer mode is intentionally fixed to the native `display-timings`
entry (currently 640x480). This board revision has no VGA DDC connection.

## Kernel integration

Copy this directory to `drivers/mysoc` in the target kernel tree, add

```text
source "drivers/mysoc/Kconfig"
```

to `drivers/Kconfig`, and add

```text
obj-y += mysoc/
```

to `drivers/Makefile`. Enable these options:

```text
CONFIG_LOONGSON_CONFREG=y
CONFIG_FB_LOONGSON_MYSOC_VGA=y
CONFIG_FB=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
```

The last clock-wizard symbol is kernel-version dependent; select the Xilinx
Clocking Wizard provider offered by the target kernel.

Use `linux/dts/loongson32_mysoc.dts`.  Do not simultaneously enable separate
generic `xlnx,axi-vdma-*` or `xlnx,v-tc-*` nodes for these two MMIO windows,
because the composite VGA driver owns both resources.

## CONFREG userspace ABI

All transfers are 32-bit and aligned.  Examples using standard system calls:

```c
uint32_t value = 0x55aa;
pwrite(fd, &value, sizeof(value), LOONGSON_CONFREG_LED);
pread(fd, &value, sizeof(value), LOONGSON_CONFREG_SWITCH);
```

Writing requires `CAP_SYS_RAWIO`. The `ORDER` register at offset `0x1160` is
shared with the original NAND/APB DMA handshake and must not be changed while
that DMA is active. Raw `mmap()` is disabled unless the DT node explicitly has
the `loongson,allow-mmap` property.
