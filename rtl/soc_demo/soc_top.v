/*------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Copyright (c) 2016, Loongson Technology Corporation Limited.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this 
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3. Neither the name of Loongson Technology Corporation Limited nor the names of 
its contributors may be used to endorse or promote products derived from this 
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL LOONGSON TECHNOLOGY CORPORATION LIMITED BE LIABLE
TO ANY PARTY FOR DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------*/

`include "config.h"

module soc_top(
    input         resetn, 
    input         clk,

    //------gpio----------------
    output [15:0] led,
    output [1 :0] led_rg0,
    output [1 :0] led_rg1,
    output [7 :0] num_csn,
    output [6 :0] num_a_g,
    input  [7 :0] switch, 
    output [3 :0] btn_key_col,
    input  [3 :0] btn_key_row,
    input  [1 :0] btn_step,

    //------DDR3 interface------
    inout  [15:0] ddr3_dq,
    output [12:0] ddr3_addr,
    output [2 :0] ddr3_ba,
    output        ddr3_ras_n,
    output        ddr3_cas_n,
    output        ddr3_we_n,
    output        ddr3_odt,
    output        ddr3_reset_n,
    output        ddr3_cke,
    output [1:0]  ddr3_dm,
    inout  [1:0]  ddr3_dqs_p,
    inout  [1:0]  ddr3_dqs_n,
    output        ddr3_ck_p,
    output        ddr3_ck_n,

    //------mac controller-------
    //TX
    input         mtxclk_0,     
    output        mtxen_0,      
    output [3:0]  mtxd_0,       
    output        mtxerr_0,
    //RX
    input         mrxclk_0,      
    input         mrxdv_0,     
    input  [3:0]  mrxd_0,        
    input         mrxerr_0,
    input         mcoll_0,
    input         mcrs_0,
    // MIIM
    output        mdc_0,
    inout         mdio_0,
    
    output        phy_rstn,
 
    //------EJTAG-------
    input         EJTAG_TRST,
    input         EJTAG_TCK,
    input         EJTAG_TDI,
    input         EJTAG_TMS,
    output        EJTAG_TDO,

    //------uart-------
    inout         UART_RX,
    inout         UART_TX,

    //------debug-uart------
    input         UART_RX2,
    output        UART_TX2,

    //------nand-------
    output        NAND_CLE ,
    output        NAND_ALE ,
    input         NAND_RDY ,
    inout [7:0]   NAND_DATA,
    output        NAND_RD  ,
    output        NAND_CE  ,  //low active
    output        NAND_WR  ,  
       
    //------spi flash-------
    output        SPI_CLK,
    output        SPI_CS,
    inout         SPI_MISO,
    inout         SPI_MOSI,

    //------VGA-------------
    output [3:0]  FPGA_VGA_R,
    output [3:0]  FPGA_VGA_G,
    output [3:0]  FPGA_VGA_B,
    output        VGA_HSYNC,
    output        VGA_VSYNC,

    //------USB3500 UTMI+------
    input         FPGA_USB_PHY0_CLK,
    inout  [7:0]  FPGA_USB_PHY0_DATA,
    input         USB_TXREADY,
    input         USB_RXVALID,
    input         USB_RXACTIVE,
    input         USB_RXERROR,
    input  [1:0]  USB_LINESTATE,
    input         USB_VBUSVLD,
    input         USB_SESSVLD,
    input         USB_SESSEND,
    input         USB_HOSTDISC,
    input         USB_ID_DIG,
    output        USB_TXVALID,
    output [1:0]  USB_XCVRSEL,
    output        USB_TERMSEL,
    output [1:0]  USB_OPMODE,
    output        USB_DPPD,
    output        USB_DMPD,
    output        USB_SUSPENDn,
    output        FPGA_USB_PHY0_RST,
    output        USB_ID_PULLUP,
    output        USB_CHRGVBUS,
    output        USB_DISCHRGVBUS
);
wire        aclk;
wire        aresetn;
wire        cpu_clk;
wire        uncore_clk;

wire [`LID         -1 :0] m0_awid;
wire [`Lawaddr     -1 :0] m0_awaddr;
wire [`Lawlen      -1 :0] m0_awlen;
wire [`Lawsize     -1 :0] m0_awsize;
wire [`Lawburst    -1 :0] m0_awburst;
wire [`Lawlock     -1 :0] m0_awlock;
wire [`Lawcache    -1 :0] m0_awcache;
wire [`Lawprot     -1 :0] m0_awprot;
wire                      m0_awvalid;
wire                      m0_awready;
wire [`LID         -1 :0] m0_wid;
wire [`Lwdata      -1 :0] m0_wdata;
wire [`Lwstrb      -1 :0] m0_wstrb;
wire                      m0_wlast;
wire                      m0_wvalid;
wire                      m0_wready;
wire [`LID         -1 :0] m0_bid;
wire [`Lbresp      -1 :0] m0_bresp;
wire                      m0_bvalid;
wire                      m0_bready;
wire [`LID         -1 :0] m0_arid;
wire [`Laraddr     -1 :0] m0_araddr;
wire [`Larlen      -1 :0] m0_arlen;
wire [`Larsize     -1 :0] m0_arsize;
wire [`Larburst    -1 :0] m0_arburst;
wire [`Larlock     -1 :0] m0_arlock;
wire [`Larcache    -1 :0] m0_arcache;
wire [`Larprot     -1 :0] m0_arprot;
wire                      m0_arvalid;
wire                      m0_arready;
wire [`LID         -1 :0] m0_rid;
wire [`Lrdata      -1 :0] m0_rdata;
wire [`Lrresp      -1 :0] m0_rresp;
wire                      m0_rlast;
wire                      m0_rvalid;
wire                      m0_rready;

wire [`LID         -1 :0] m0_async_awid;
wire [`Lawaddr     -1 :0] m0_async_awaddr;
wire [`Lawlen      -1 :0] m0_async_awlen;
wire [`Lawsize     -1 :0] m0_async_awsize;
wire [`Lawburst    -1 :0] m0_async_awburst;
wire [`Lawlock     -1 :0] m0_async_awlock;
wire [`Lawcache    -1 :0] m0_async_awcache;
wire [`Lawprot     -1 :0] m0_async_awprot;
wire                      m0_async_awvalid;
wire                      m0_async_awready;
wire [`LID         -1 :0] m0_async_wid;
wire [`Lwdata      -1 :0] m0_async_wdata;
wire [`Lwstrb      -1 :0] m0_async_wstrb;
wire                      m0_async_wlast;
wire                      m0_async_wvalid;
wire                      m0_async_wready;
wire [`LID         -1 :0] m0_async_bid;
wire [`Lbresp      -1 :0] m0_async_bresp;
wire                      m0_async_bvalid;
wire                      m0_async_bready;
wire [`LID         -1 :0] m0_async_arid;
wire [`Laraddr     -1 :0] m0_async_araddr;
wire [`Larlen      -1 :0] m0_async_arlen;
wire [`Larsize     -1 :0] m0_async_arsize;
wire [`Larburst    -1 :0] m0_async_arburst;
wire [`Larlock     -1 :0] m0_async_arlock;
wire [`Larcache    -1 :0] m0_async_arcache;
wire [`Larprot     -1 :0] m0_async_arprot;
wire                      m0_async_arvalid;
wire                      m0_async_arready;
wire [`LID         -1 :0] m0_async_rid;
wire [`Lrdata      -1 :0] m0_async_rdata;
wire [`Lrresp      -1 :0] m0_async_rresp;
wire                      m0_async_rlast;
wire                      m0_async_rvalid;
wire                      m0_async_rready;

wire [`LID         -1 :0] spi_s_awid;
wire [`Lawaddr     -1 :0] spi_s_awaddr;
wire [`Lawlen      -1 :0] spi_s_awlen;
wire [`Lawsize     -1 :0] spi_s_awsize;
wire [`Lawburst    -1 :0] spi_s_awburst;
wire [`Lawlock     -1 :0] spi_s_awlock;
wire [`Lawcache    -1 :0] spi_s_awcache;
wire [`Lawprot     -1 :0] spi_s_awprot;
wire                      spi_s_awvalid;
wire                      spi_s_awready;
wire [`LID         -1 :0] spi_s_wid;
wire [`Lwdata      -1 :0] spi_s_wdata;
wire [`Lwstrb      -1 :0] spi_s_wstrb;
wire                      spi_s_wlast;
wire                      spi_s_wvalid;
wire                      spi_s_wready;
wire [`LID         -1 :0] spi_s_bid;
wire [`Lbresp      -1 :0] spi_s_bresp;
wire                      spi_s_bvalid;
wire                      spi_s_bready;
wire [`LID         -1 :0] spi_s_arid;
wire [`Laraddr     -1 :0] spi_s_araddr;
wire [`Larlen      -1 :0] spi_s_arlen;
wire [`Larsize     -1 :0] spi_s_arsize;
wire [`Larburst    -1 :0] spi_s_arburst;
wire [`Larlock     -1 :0] spi_s_arlock;
wire [`Larcache    -1 :0] spi_s_arcache;
wire [`Larprot     -1 :0] spi_s_arprot;
wire                      spi_s_arvalid;
wire                      spi_s_arready;
wire [`LID         -1 :0] spi_s_rid;
wire [`Lrdata      -1 :0] spi_s_rdata;
wire [`Lrresp      -1 :0] spi_s_rresp;
wire                      spi_s_rlast;
wire                      spi_s_rvalid;
wire                      spi_s_rready;

wire [`LID         -1 :0] conf_s_awid;
wire [`Lawaddr     -1 :0] conf_s_awaddr;
wire [`Lawlen      -1 :0] conf_s_awlen;
wire [`Lawsize     -1 :0] conf_s_awsize;
wire [`Lawburst    -1 :0] conf_s_awburst;
wire [`Lawlock     -1 :0] conf_s_awlock;
wire [`Lawcache    -1 :0] conf_s_awcache;
wire [`Lawprot     -1 :0] conf_s_awprot;
wire                      conf_s_awvalid;
wire                      conf_s_awready;
wire [`LID         -1 :0] conf_s_wid;
wire [`Lwdata      -1 :0] conf_s_wdata;
wire [`Lwstrb      -1 :0] conf_s_wstrb;
wire                      conf_s_wlast;
wire                      conf_s_wvalid;
wire                      conf_s_wready;
wire [`LID         -1 :0] conf_s_bid;
wire [`Lbresp      -1 :0] conf_s_bresp;
wire                      conf_s_bvalid;
wire                      conf_s_bready;
wire [`LID         -1 :0] conf_s_arid;
wire [`Laraddr     -1 :0] conf_s_araddr;
wire [`Larlen      -1 :0] conf_s_arlen;
wire [`Larsize     -1 :0] conf_s_arsize;
wire [`Larburst    -1 :0] conf_s_arburst;
wire [`Larlock     -1 :0] conf_s_arlock;
wire [`Larcache    -1 :0] conf_s_arcache;
wire [`Larprot     -1 :0] conf_s_arprot;
wire                      conf_s_arvalid;
wire                      conf_s_arready;
wire [`LID         -1 :0] conf_s_rid;
wire [`Lrdata      -1 :0] conf_s_rdata;
wire [`Lrresp      -1 :0] conf_s_rresp;
wire                      conf_s_rlast;
wire                      conf_s_rvalid;
wire                      conf_s_rready;

wire [`LID         -1 :0] mac_s_awid;
wire [`Lawaddr     -1 :0] mac_s_awaddr;
wire [`Lawlen      -1 :0] mac_s_awlen;
wire [`Lawsize     -1 :0] mac_s_awsize;
wire [`Lawburst    -1 :0] mac_s_awburst;
wire [`Lawlock     -1 :0] mac_s_awlock;
wire [`Lawcache    -1 :0] mac_s_awcache;
wire [`Lawprot     -1 :0] mac_s_awprot;
wire                      mac_s_awvalid;
wire                      mac_s_awready;
wire [`LID         -1 :0] mac_s_wid;
wire [`Lwdata      -1 :0] mac_s_wdata;
wire [`Lwstrb      -1 :0] mac_s_wstrb;
wire                      mac_s_wlast;
wire                      mac_s_wvalid;
wire                      mac_s_wready;
wire [`LID         -1 :0] mac_s_bid;
wire [`Lbresp      -1 :0] mac_s_bresp;
wire                      mac_s_bvalid;
wire                      mac_s_bready;
wire [`LID         -1 :0] mac_s_arid;
wire [`Laraddr     -1 :0] mac_s_araddr;
wire [`Larlen      -1 :0] mac_s_arlen;
wire [`Larsize     -1 :0] mac_s_arsize;
wire [`Larburst    -1 :0] mac_s_arburst;
wire [`Larlock     -1 :0] mac_s_arlock;
wire [`Larcache    -1 :0] mac_s_arcache;
wire [`Larprot     -1 :0] mac_s_arprot;
wire                      mac_s_arvalid;
wire                      mac_s_arready;
wire [`LID         -1 :0] mac_s_rid;
wire [`Lrdata      -1 :0] mac_s_rdata;
wire [`Lrresp      -1 :0] mac_s_rresp;
wire                      mac_s_rlast;
wire                      mac_s_rvalid;
wire                      mac_s_rready;

wire [`LID         -1 :0] mac_m_awid;
wire [`Lawaddr     -1 :0] mac_m_awaddr;
wire [`Lawlen      -1 :0] mac_m_awlen;
wire [`Lawsize     -1 :0] mac_m_awsize;
wire [`Lawburst    -1 :0] mac_m_awburst;
wire [`Lawlock     -1 :0] mac_m_awlock;
wire [`Lawcache    -1 :0] mac_m_awcache;
wire [`Lawprot     -1 :0] mac_m_awprot;
wire                      mac_m_awvalid;
wire                      mac_m_awready;
wire [`LID         -1 :0] mac_m_wid;
wire [`Lwdata      -1 :0] mac_m_wdata;
wire [`Lwstrb      -1 :0] mac_m_wstrb;
wire                      mac_m_wlast;
wire                      mac_m_wvalid;
wire                      mac_m_wready;
wire [`LID         -1 :0] mac_m_bid;
wire [`Lbresp      -1 :0] mac_m_bresp;
wire                      mac_m_bvalid;
wire                      mac_m_bready;
wire [`LID         -1 :0] mac_m_arid;
wire [`Laraddr     -1 :0] mac_m_araddr;
wire [`Larlen      -1 :0] mac_m_arlen;
wire [`Larsize     -1 :0] mac_m_arsize;
wire [`Larburst    -1 :0] mac_m_arburst;
wire [`Larlock     -1 :0] mac_m_arlock;
wire [`Larcache    -1 :0] mac_m_arcache;
wire [`Larprot     -1 :0] mac_m_arprot;
wire                      mac_m_arvalid;
wire                      mac_m_arready;
wire [`LID         -1 :0] mac_m_rid;
wire [`Lrdata      -1 :0] mac_m_rdata;
wire [`Lrresp      -1 :0] mac_m_rresp;
wire                      mac_m_rlast;
wire                      mac_m_rvalid;
wire                      mac_m_rready;

wire [`LID         -1 :0] s0_awid;
wire [`Lawaddr     -1 :0] s0_awaddr;
wire [`Lawlen      -1 :0] s0_awlen;
wire [`Lawsize     -1 :0] s0_awsize;
wire [`Lawburst    -1 :0] s0_awburst;
wire [`Lawlock     -1 :0] s0_awlock;
wire [`Lawcache    -1 :0] s0_awcache;
wire [`Lawprot     -1 :0] s0_awprot;
wire                      s0_awvalid;
wire                      s0_awready;
wire [`LID         -1 :0] s0_wid;
wire [`Lwdata      -1 :0] s0_wdata;
wire [`Lwstrb      -1 :0] s0_wstrb;
wire                      s0_wlast;
wire                      s0_wvalid;
wire                      s0_wready;
wire [`LID         -1 :0] s0_bid;
wire [`Lbresp      -1 :0] s0_bresp;
wire                      s0_bvalid;
wire                      s0_bready;
wire [`LID         -1 :0] s0_arid;
wire [`Laraddr     -1 :0] s0_araddr;
wire [`Larlen      -1 :0] s0_arlen;
wire [`Larsize     -1 :0] s0_arsize;
wire [`Larburst    -1 :0] s0_arburst;
wire [`Larlock     -1 :0] s0_arlock;
wire [`Larcache    -1 :0] s0_arcache;
wire [`Larprot     -1 :0] s0_arprot;
wire                      s0_arvalid;
wire                      s0_arready;
wire [`LID         -1 :0] s0_rid;
wire [`Lrdata      -1 :0] s0_rdata;
wire [`Lrresp      -1 :0] s0_rresp;
wire                      s0_rlast;
wire                      s0_rvalid;
wire                      s0_rready;

// AXI Crossbar: one CPU AXI3 input and nine AXI3 output interfaces.
wire [35:0]  xbar_m_awid;
wire [287:0] xbar_m_awaddr;
wire [35:0]  xbar_m_awlen;
wire [26:0]  xbar_m_awsize;
wire [17:0]  xbar_m_awburst;
wire [17:0]  xbar_m_awlock;
wire [35:0]  xbar_m_awcache;
wire [26:0]  xbar_m_awprot;
wire [35:0]  xbar_m_awqos;
wire [8:0]   xbar_m_awvalid;
wire [8:0]   xbar_m_awready;
wire [35:0]  xbar_m_wid;
wire [287:0] xbar_m_wdata;
wire [35:0]  xbar_m_wstrb;
wire [8:0]   xbar_m_wlast;
wire [8:0]   xbar_m_wvalid;
wire [8:0]   xbar_m_wready;
wire [35:0]  xbar_m_bid;
wire [17:0]  xbar_m_bresp;
wire [8:0]   xbar_m_bvalid;
wire [8:0]   xbar_m_bready;
wire [35:0]  xbar_m_arid;
wire [287:0] xbar_m_araddr;
wire [35:0]  xbar_m_arlen;
wire [26:0]  xbar_m_arsize;
wire [17:0]  xbar_m_arburst;
wire [17:0]  xbar_m_arlock;
wire [35:0]  xbar_m_arcache;
wire [26:0]  xbar_m_arprot;
wire [35:0]  xbar_m_arqos;
wire [8:0]   xbar_m_arvalid;
wire [8:0]   xbar_m_arready;
wire [35:0]  xbar_m_rid;
wire [287:0] xbar_m_rdata;
wire [17:0]  xbar_m_rresp;
wire [8:0]   xbar_m_rlast;
wire [8:0]   xbar_m_rvalid;
wire [8:0]   xbar_m_rready;

// M07 USB register path: AXI3 at aclk -> AXI3 at USB PHY clock -> AXI4-Lite.
// Address space: 0x1FB20000 - 0x1FB2FFFF (core registers use offsets 0x00-0x24).
wire        usb_clk;
reg  [7:0]  usb_reset_release;
wire        usb_aresetn;
wire        usb_host_reset;

wire [3:0]  usb_axi3_awid;
wire [31:0] usb_axi3_awaddr;
wire [3:0]  usb_axi3_awlen;
wire [2:0]  usb_axi3_awsize;
wire [1:0]  usb_axi3_awburst;
wire [1:0]  usb_axi3_awlock;
wire [3:0]  usb_axi3_awcache;
wire [2:0]  usb_axi3_awprot;
wire [3:0]  usb_axi3_awqos;
wire        usb_axi3_awvalid;
wire        usb_axi3_awready;
wire [3:0]  usb_axi3_wid;
wire [31:0] usb_axi3_wdata;
wire [3:0]  usb_axi3_wstrb;
wire        usb_axi3_wlast;
wire        usb_axi3_wvalid;
wire        usb_axi3_wready;
wire [3:0]  usb_axi3_bid;
wire [1:0]  usb_axi3_bresp;
wire        usb_axi3_bvalid;
wire        usb_axi3_bready;
wire [3:0]  usb_axi3_arid;
wire [31:0] usb_axi3_araddr;
wire [3:0]  usb_axi3_arlen;
wire [2:0]  usb_axi3_arsize;
wire [1:0]  usb_axi3_arburst;
wire [1:0]  usb_axi3_arlock;
wire [3:0]  usb_axi3_arcache;
wire [2:0]  usb_axi3_arprot;
wire [3:0]  usb_axi3_arqos;
wire        usb_axi3_arvalid;
wire        usb_axi3_arready;
wire [3:0]  usb_axi3_rid;
wire [31:0] usb_axi3_rdata;
wire [1:0]  usb_axi3_rresp;
wire        usb_axi3_rlast;
wire        usb_axi3_rvalid;
wire        usb_axi3_rready;

wire [31:0] usb_axil_awaddr;
wire [2:0]  usb_axil_awprot;
wire        usb_axil_awvalid;
wire        usb_axil_awready;
wire [31:0] usb_axil_wdata;
wire [3:0]  usb_axil_wstrb;
wire        usb_axil_wvalid;
wire        usb_axil_wready;
wire [1:0]  usb_axil_bresp;
wire        usb_axil_bvalid;
wire        usb_axil_bready;
wire [31:0] usb_axil_araddr;
wire [2:0]  usb_axil_arprot;
wire        usb_axil_arvalid;
wire        usb_axil_arready;
wire [31:0] usb_axil_rdata;
wire [1:0]  usb_axil_rresp;
wire        usb_axil_rvalid;
wire        usb_axil_rready;

wire [7:0]  usb_utmi_data_in;
wire [7:0]  usb_utmi_data_out;
wire        usb_utmi_txvalid;
wire [1:0]  usb_utmi_op_mode;
wire [1:0]  usb_utmi_xcvrselect;
wire        usb_utmi_termselect;
wire        usb_utmi_dppulldown;
wire        usb_utmi_dmpulldown;
wire        usb_irq;

// AXI4-Lite control interface between the protocol converters and VDMA/VTC.
wire [31:0] vdma_axil_awaddr;
wire [2:0]  vdma_axil_awprot;
wire        vdma_axil_awvalid;
wire        vdma_axil_awready;
wire [31:0] vdma_axil_wdata;
wire [3:0]  vdma_axil_wstrb;
wire        vdma_axil_wvalid;
wire        vdma_axil_wready;
wire [1:0]  vdma_axil_bresp;
wire        vdma_axil_bvalid;
wire        vdma_axil_bready;
wire [31:0] vdma_axil_araddr;
wire [2:0]  vdma_axil_arprot;
wire        vdma_axil_arvalid;
wire        vdma_axil_arready;
wire [31:0] vdma_axil_rdata;
wire [1:0]  vdma_axil_rresp;
wire        vdma_axil_rvalid;
wire        vdma_axil_rready;

wire [31:0] vtc_axil_awaddr;
wire [2:0]  vtc_axil_awprot;
wire        vtc_axil_awvalid;
wire        vtc_axil_awready;
wire [31:0] vtc_axil_wdata;
wire [3:0]  vtc_axil_wstrb;
wire        vtc_axil_wvalid;
wire        vtc_axil_wready;
wire [1:0]  vtc_axil_bresp;
wire        vtc_axil_bvalid;
wire        vtc_axil_bready;
wire [31:0] vtc_axil_araddr;
wire [2:0]  vtc_axil_arprot;
wire        vtc_axil_arvalid;
wire        vtc_axil_arready;
wire [31:0] vtc_axil_rdata;
wire [1:0]  vtc_axil_rresp;
wire        vtc_axil_rvalid;
wire        vtc_axil_rready;

// M08 AXI4-Lite register interface: programmable VGA pixel clock.
wire [31:0] vga_clk_axil_awaddr;
wire [2:0]  vga_clk_axil_awprot;
wire        vga_clk_axil_awvalid;
wire        vga_clk_axil_awready;
wire [31:0] vga_clk_axil_wdata;
wire [3:0]  vga_clk_axil_wstrb;
wire        vga_clk_axil_wvalid;
wire        vga_clk_axil_wready;
wire [1:0]  vga_clk_axil_bresp;
wire        vga_clk_axil_bvalid;
wire        vga_clk_axil_bready;
wire [31:0] vga_clk_axil_araddr;
wire [2:0]  vga_clk_axil_arprot;
wire        vga_clk_axil_arvalid;
wire        vga_clk_axil_arready;
wire [31:0] vga_clk_axil_rdata;
wire [1:0]  vga_clk_axil_rresp;
wire        vga_clk_axil_rvalid;
wire        vga_clk_axil_rready;

// VDMA MM2S memory and AXI4-Stream video interfaces.
wire [31:0] vdma_mm2s_araddr;
wire [7:0]  vdma_mm2s_arlen;
wire [2:0]  vdma_mm2s_arsize;
wire [1:0]  vdma_mm2s_arburst;
wire [2:0]  vdma_mm2s_arprot;
wire [3:0]  vdma_mm2s_arcache;
wire        vdma_mm2s_arvalid;
wire        vdma_mm2s_arready;
wire [31:0] vdma_mm2s_rdata;
wire [1:0]  vdma_mm2s_rresp;
wire        vdma_mm2s_rlast;
wire        vdma_mm2s_rvalid;
wire        vdma_mm2s_rready;
wire [23:0] vdma_axis_tdata;
wire [2:0]  vdma_axis_tkeep;
wire        vdma_axis_tuser;
wire        vdma_axis_tvalid;
wire        vdma_axis_tready;
wire        vdma_axis_tlast;
wire [5:0]  vdma_frame_ptr;
wire        vdma_mm2s_introut;

// VTC and AXI4-Stream to native-video signals.
wire        vtc_hsync;
wire        vtc_hblank;
wire        vtc_vsync;
wire        vtc_vblank;
wire        vtc_active_video;
wire [0:0]  vtc_fsync;
wire        video_vtg_ce;
wire        video_locked;
wire        video_overflow;
wire        video_underflow;
wire [11:0] video_fifo_read_level;
wire [31:0] video_status;
wire        video_sof_state;
wire        video_active;
wire        video_vsync;
wire        video_hsync;
wire        video_vblank;
wire        video_hblank;
wire        video_field_id;
wire [23:0] video_data;
wire        vga_pixel_clk;
wire        vga_clk_locked;
reg  [1:0]  vga_pixel_reset_sync;
wire        vga_pixel_reset_asyncn;
wire        vga_pixel_aresetn;

wire [8            -1 :0] mig_awid;
wire [`Lawaddr     -1 :0] mig_awaddr;
wire [8            -1 :0] mig_awlen;
wire [`Lawsize     -1 :0] mig_awsize;
wire [`Lawburst    -1 :0] mig_awburst;
wire [`Lawlock     -1 :0] mig_awlock;
wire [`Lawcache    -1 :0] mig_awcache;
wire [`Lawprot     -1 :0] mig_awprot;
wire                      mig_awvalid;
wire                      mig_awready;
wire [8            -1 :0] mig_wid;
wire [`Lwdata      -1 :0] mig_wdata;
wire [`Lwstrb      -1 :0] mig_wstrb;
wire                      mig_wlast;
wire                      mig_wvalid;
wire                      mig_wready;
wire [8            -1 :0] mig_bid;
wire [`Lbresp      -1 :0] mig_bresp;
wire                      mig_bvalid;
wire                      mig_bready;
wire [8            -1 :0] mig_arid;
wire [`Laraddr     -1 :0] mig_araddr;
wire [8            -1 :0] mig_arlen;
wire [`Larsize     -1 :0] mig_arsize;
wire [`Larburst    -1 :0] mig_arburst;
wire [`Larlock     -1 :0] mig_arlock;
wire [`Larcache    -1 :0] mig_arcache;
wire [`Larprot     -1 :0] mig_arprot;
wire                      mig_arvalid;
wire                      mig_arready;
wire [8            -1 :0] mig_rid;
wire [`Lrdata      -1 :0] mig_rdata;
wire [`Lrresp      -1 :0] mig_rresp;
wire                      mig_rlast;
wire                      mig_rvalid;
wire                      mig_rready;

wire [`LID         -1 :0] dma0_awid       ;
wire [`Lawaddr     -1 :0] dma0_awaddr     ;
wire [`Lawlen      -1 :0] dma0_awlen      ;
wire [`Lawsize     -1 :0] dma0_awsize     ;
wire [`Lawburst    -1 :0] dma0_awburst    ;
wire [`Lawlock     -1 :0] dma0_awlock     ;
wire [`Lawcache    -1 :0] dma0_awcache    ;
wire [`Lawprot     -1 :0] dma0_awprot     ;
wire                      dma0_awvalid    ;
wire                      dma0_awready    ;
wire [`LID         -1 :0] dma0_wid        ;
wire [64           -1 :0] dma0_wdata      ;
wire [8            -1 :0] dma0_wstrb      ;
wire                      dma0_wlast      ;
wire                      dma0_wvalid     ;
wire                      dma0_wready     ;
wire [`LID         -1 :0] dma0_bid        ;
wire [`Lbresp      -1 :0] dma0_bresp      ;
wire                      dma0_bvalid     ;
wire                      dma0_bready     ;
wire [`LID         -1 :0] dma0_arid       ;
wire [`Laraddr     -1 :0] dma0_araddr     ;
wire [`Larlen      -1 :0] dma0_arlen      ;
wire [`Larsize     -1 :0] dma0_arsize     ;
wire [`Larburst    -1 :0] dma0_arburst    ;
wire [`Larlock     -1 :0] dma0_arlock     ;
wire [`Larcache    -1 :0] dma0_arcache    ;
wire [`Larprot     -1 :0] dma0_arprot     ;
wire                      dma0_arvalid    ;
wire                      dma0_arready    ;
wire [`LID         -1 :0] dma0_rid        ;
wire [64           -1 :0] dma0_rdata      ;
wire [`Lrresp      -1 :0] dma0_rresp      ;
wire                      dma0_rlast      ;
wire                      dma0_rvalid     ;
wire                      dma0_rready     ;

wire [`LID         -1 :0] apb_s_awid;
wire [`Lawaddr     -1 :0] apb_s_awaddr;
wire [`Lawlen      -1 :0] apb_s_awlen;
wire [`Lawsize     -1 :0] apb_s_awsize;
wire [`Lawburst    -1 :0] apb_s_awburst;
wire [`Lawlock     -1 :0] apb_s_awlock;
wire [`Lawcache    -1 :0] apb_s_awcache;
wire [`Lawprot     -1 :0] apb_s_awprot;
wire                      apb_s_awvalid;
wire                      apb_s_awready;
wire [`LID         -1 :0] apb_s_wid;
wire [`Lwdata      -1 :0] apb_s_wdata;
wire [`Lwstrb      -1 :0] apb_s_wstrb;
wire                      apb_s_wlast;
wire                      apb_s_wvalid;
wire                      apb_s_wready;
wire [`LID         -1 :0] apb_s_bid;
wire [`Lbresp      -1 :0] apb_s_bresp;
wire                      apb_s_bvalid;
wire                      apb_s_bready;
wire [`LID         -1 :0] apb_s_arid;
wire [`Laraddr     -1 :0] apb_s_araddr;
wire [`Larlen      -1 :0] apb_s_arlen;
wire [`Larsize     -1 :0] apb_s_arsize;
wire [`Larburst    -1 :0] apb_s_arburst;
wire [`Larlock     -1 :0] apb_s_arlock;
wire [`Larcache    -1 :0] apb_s_arcache;
wire [`Larprot     -1 :0] apb_s_arprot;
wire                      apb_s_arvalid;
wire                      apb_s_arready;
wire [`LID         -1 :0] apb_s_rid;
wire [`Lrdata      -1 :0] apb_s_rdata;
wire [`Lrresp      -1 :0] apb_s_rresp;
wire                      apb_s_rlast;
wire                      apb_s_rvalid;
wire                      apb_s_rready;

wire          apb_ready_dma0;
wire          apb_start_dma0;
wire          apb_rw_dma0;
wire          apb_psel_dma0;
wire          apb_penable_dma0;
wire[31:0]    apb_addr_dma0;
wire[31:0]    apb_wdata_dma0;
wire[31:0]    apb_rdata_dma0;

wire         dma_int;
wire         dma_ack;
wire         dma_req;

wire                      dma0_gnt;
wire[31:0]                order_addr_in;
wire                      write_dma_end;
wire                      finish_read_order;

//spi
wire [3:0]spi_csn_o ;
wire [3:0]spi_csn_en;
wire spi_sck_o ;
wire spi_sdo_i ;
wire spi_sdo_o ;
wire spi_sdo_en;
wire spi_sdi_i ;
wire spi_sdi_o ;
wire spi_sdi_en;
wire spi_inta_o;
assign     SPI_CLK = spi_sck_o;
assign     SPI_CS  = ~spi_csn_en[0] & spi_csn_o[0];
assign     SPI_MOSI = spi_sdo_en ? 1'bz : spi_sdo_o ;
assign     SPI_MISO = spi_sdi_en ? 1'bz : spi_sdi_o ;
assign     spi_sdo_i = SPI_MOSI;
assign     spi_sdi_i = SPI_MISO;

// confreg 
wire   [31:0] cr00,cr01,cr02,cr03,cr04,cr05,cr06,cr07;

//mac
wire md_i_0;      // MII data input (from I/O cell)
wire md_o_0;      // MII data output (to I/O cell)
wire md_oe_0;     // MII data output enable (to I/O cell)
IOBUF mac_mdio(.IO(mdio_0),.I(md_o_0),.T(~md_oe_0),.O(md_i_0));
assign phy_rstn = aresetn;

//nand
wire       nand_cle   ;
wire       nand_ale   ;
wire [3:0] nand_rdy   ;
wire [3:0] nand_ce    ;
wire       nand_rd    ;
wire       nand_wr    ;
wire       nand_dat_oe;
wire [7:0] nand_dat_i ;
wire [7:0] nand_dat_o ;
wire       nand_int   ;
assign     NAND_CLE = nand_cle;
assign     NAND_ALE = nand_ale;
assign     nand_rdy = {3'd0,NAND_RDY};
assign     NAND_RD  = nand_rd;
assign     NAND_CE  = nand_ce[0];  //low active
assign     NAND_WR  = nand_wr;  
generate
    genvar i;
    for(i=0;i<8;i=i+1)
    begin: nand_data_loop
        IOBUF nand_data(.IO(NAND_DATA[i]),.I(nand_dat_o[i]),.T(nand_dat_oe),.O(nand_dat_i[i]));
    end
endgenerate

//uart
wire UART_CTS,   UART_RTS;
wire UART_DTR,   UART_DSR;
wire UART_RI,    UART_DCD;
assign UART_CTS = 1'b0;
assign UART_DSR = 1'b0;
assign UART_DCD = 1'b0;
wire uart0_int   ;
wire uart0_txd_o ;
wire uart0_txd_i ;
wire uart0_txd_oe;
wire uart0_rxd_o ;
wire uart0_rxd_i ;
wire uart0_rxd_oe;
wire uart0_rts_o ;
wire uart0_cts_i ;
wire uart0_dsr_i ;
wire uart0_dcd_i ;
wire uart0_dtr_o ;
wire uart0_ri_i  ;
assign     UART_RX     = uart0_rxd_oe ? 1'bz : uart0_rxd_o ;
assign     UART_TX     = uart0_txd_oe ? 1'bz : uart0_txd_o ;
assign     UART_RTS    = uart0_rts_o ;
assign     UART_DTR    = uart0_dtr_o ;
assign     uart0_txd_i = UART_TX;
assign     uart0_rxd_i = UART_RX;
assign     uart0_cts_i = UART_CTS;
assign     uart0_dcd_i = UART_DCD;
assign     uart0_dsr_i = UART_DSR;
assign     uart0_ri_i  = UART_RI ;

//interrupt
wire mac_int;
wire [7:0] int_out;
wire [7:0] int_n_i;
wire [7:0] cpu_intrpt;
reg  usb_irq_cpu_meta;
reg  usb_irq_cpu_sync;
reg  vdma_irq_cpu_meta;
reg  vdma_irq_cpu_sync;
assign int_out = {vdma_irq_cpu_sync,1'b0,usb_irq_cpu_sync,dma_int,nand_int,spi_inta_o,uart0_int,mac_int};
assign int_n_i = ~int_out;
assign cpu_intrpt = int_out;

reg cpu_aresetn_1;
reg cpu_aresetn_2;

wire cpu_aresetn;

always @(posedge cpu_clk or negedge aresetn) begin
    if (!aresetn) begin
        cpu_aresetn_1 <= 1'b0;
        cpu_aresetn_2 <= 1'b0;
    end else begin
        cpu_aresetn_1 <= 1'b1;
        cpu_aresetn_2 <= cpu_aresetn_1;
    end
end

assign cpu_aresetn = cpu_aresetn_2;

// core_usb_host interrupt is a level signal in the 60 MHz USB clock domain.
always @(posedge cpu_clk or negedge cpu_aresetn) begin
    if (!cpu_aresetn) begin
        usb_irq_cpu_meta <= 1'b0;
        usb_irq_cpu_sync <= 1'b0;
    end else begin
        usb_irq_cpu_meta <= usb_irq;
        usb_irq_cpu_sync <= usb_irq_cpu_meta;
    end
end

// Synchronize the active-high VDMA level interrupt from aclk into the CPU
// clock domain before driving cpu_intrpt[7].
always @(posedge cpu_clk or negedge cpu_aresetn) begin
    if (!cpu_aresetn) begin
        vdma_irq_cpu_meta <= 1'b0;
        vdma_irq_cpu_sync <= 1'b0;
    end else begin
        vdma_irq_cpu_meta <= vdma_mm2s_introut;
        vdma_irq_cpu_sync <= vdma_irq_cpu_meta;
    end
end

// USB3500 supplies the 60 MHz UTMI clock.  Keep its active-high reset asserted
// first, then release the AXI/core reset after another five PHY clock edges.
BUFG USB_PHY_CLK_BUFG (
    .I (FPGA_USB_PHY0_CLK),
    .O (usb_clk)
);

always @(posedge usb_clk or negedge aresetn) begin
    if (!aresetn)
        usb_reset_release <= 8'b0;
    else
        usb_reset_release <= {usb_reset_release[6:0], 1'b1};
end

assign FPGA_USB_PHY0_RST = ~usb_reset_release[2];
assign usb_aresetn       =  usb_reset_release[7];
assign usb_host_reset    = ~usb_aresetn;

// USB3500 DATA[7:0] is a bidirectional UTMI bus; the link drives it only while
// TXVALID is asserted.
assign usb_utmi_data_in    = FPGA_USB_PHY0_DATA;
assign FPGA_USB_PHY0_DATA  = usb_utmi_txvalid ? usb_utmi_data_out : 8'bz;

assign USB_TXVALID  = usb_utmi_txvalid;
assign USB_XCVRSEL  = usb_utmi_xcvrselect;
assign USB_TERMSEL  = usb_utmi_termselect;
assign USB_OPMODE   = usb_utmi_op_mode;
assign USB_DPPD     = usb_utmi_dppulldown;
assign USB_DMPD     = usb_utmi_dmpulldown;
assign USB_SUSPENDn = usb_aresetn;

// Fixed-host board wiring: ID is already pulled low on the board and neither
// VBUS charge circuit is needed during normal host operation.
assign USB_ID_PULLUP   = 1'b0;
assign USB_CHRGVBUS    = 1'b0;
assign USB_DISCHRGVBUS = 1'b0;

// Assert reset asynchronously when the clock loses lock, then release it
// synchronously after two valid pixel-clock edges.
assign vga_pixel_reset_asyncn = cpu_aresetn & vga_clk_locked;

always @(posedge vga_pixel_clk or negedge vga_pixel_reset_asyncn) begin
    if (!vga_pixel_reset_asyncn)
        vga_pixel_reset_sync <= 2'b00;
    else
        vga_pixel_reset_sync <= {vga_pixel_reset_sync[0],1'b1};
end

assign vga_pixel_aresetn = vga_pixel_reset_sync[1];

// AXI4-Stream component order is {R,B,G}.  The board provides three direct
// 4-bit resistor DACs; bit 3 is the MSB (499 ohm) and bit 0 is the LSB
// (4.02 kohm).
assign FPGA_VGA_R = video_active ? video_data[23:20] : 4'h0;
assign FPGA_VGA_G = video_active ? video_data[7:4]   : 4'h0;
assign FPGA_VGA_B = video_active ? video_data[15:12] : 4'h0;

// v_tc_0 is configured for active-low 640x480 HSYNC/VSYNC.  The schematic
// connects both syncs to the VGA connector through 100-ohm series resistors.
assign VGA_HSYNC = video_hsync;
assign VGA_VSYNC = video_vsync;

//debug signals
wire [31:0] debug_wb_pc;
wire [3 :0] debug_wb_rf_wen;
wire [4 :0] debug_wb_rf_wnum;
wire [31:0] debug_wb_rf_wdata;
wire        ws_valid;
wire        break_point;
wire        infor_flag;
wire [ 4:0] reg_num;
wire [31:0] rf_rdata;

//uart_ram signals
wire [3 :0] uart_arid   ;
wire [31:0] uart_araddr ;
wire [7 :0] uart_arlen  ;
wire [2 :0] uart_arsize ;
wire [1 :0] uart_arburst;
wire [1 :0] uart_arlock ;
wire [3 :0] uart_arcache;
wire [2 :0] uart_arprot ;
wire        uart_arvalid;
wire        uart_arready;
wire [3 :0] uart_rid    ;
wire [31:0] uart_rdata  ;
wire [1 :0] uart_rresp  ;
wire        uart_rlast  ;
wire        uart_rvalid ;
wire        uart_rready ;

wire        infom_flag;
wire [31:0] start_addr;
wire        mem_flag;
wire [ 7:0] mem_rdata;

//axi_2x1 signals
wire [`LID         -1 :0] m1_arid;
wire [`Laraddr     -1 :0] m1_araddr;
wire [`Larlen      -1 :0] m1_arlen;
wire [`Larsize     -1 :0] m1_arsize;
wire [`Larburst    -1 :0] m1_arburst;
wire [`Larlock     -1 :0] m1_arlock;
wire [`Larcache    -1 :0] m1_arcache;
wire [`Larprot     -1 :0] m1_arprot;
wire                      m1_arvalid;
wire                      m1_arready;
wire [`LID         -1 :0] m1_rid;
wire [`Lrdata      -1 :0] m1_rdata;
wire [`Lrresp      -1 :0] m1_rresp;
wire                      m1_rlast;
wire                      m1_rvalid;
wire                      m1_rready;

debug_top u_debug_top(
    .sys_clk              (cpu_clk          ),
    .sys_rst_n            (resetn           ),
    .uart_rxd             (UART_RX2         ),
    .debug_wb_pc          (debug_wb_pc      ),
    .debug_wb_rf_wnum     (debug_wb_rf_wnum ),
    .debug_wb_rf_wdata    (debug_wb_rf_wdata),
    .ws_valid             (ws_valid         ),
    .break_point          (break_point      ),
    .infor_flag           (infor_flag       ),
    .reg_num              (reg_num          ),
    .rf_rdata             (rf_rdata         ),
    .infom_flag           (infom_flag       ),
    .start_addr           (start_addr       ),
    .mem_flag             (mem_flag         ),
    .mem_rdata            (mem_rdata        ),
    .uart_txd             (UART_TX2         )

);


debug_sram u_debug_sram(
    .clk       (cpu_clk        ),
    .aresetn   (resetn         ),   

    .arid      (uart_arid      ),
    .araddr    (uart_araddr    ),
    .arlen     (uart_arlen     ),
    .arsize    (uart_arsize    ),
    .arburst   (uart_arburst   ),
    .arlock    (uart_arlock    ),
    .arcache   (uart_arcache   ),
    .arprot    (uart_arprot    ),
    .arvalid   (uart_arvalid   ),
    .arready   (uart_arready   ),
                
    .rid       (uart_rid       ),
    .rdata     (uart_rdata     ),
    .rresp     (uart_rresp     ),
    .rlast     (uart_rlast     ),
    .rvalid    (uart_rvalid    ),
    .rready    (uart_rready    ),

    .break_point(              ),
    .cpu_rready (              ),  
    .rvalid_r   (              ),
    .rid_r      (              ),
    .rdata_r    (              ),
    .rlast_r    (              ),
    .flag       (              ),

    .infom_flag(infom_flag    ),
    .start_addr(start_addr    ),
    .mem_flag  (mem_flag      ),
    .mem_rdata (mem_rdata     ) 

);

// debug UART is disconnected.
assign uart_arready = 1'b0;
assign uart_rid     = 4'b0;
assign uart_rdata   = 32'b0;
assign uart_rresp   = 2'b0;
assign uart_rlast   = 1'b0;
assign uart_rvalid  = 1'b0;

// cpu
core_top cpu_mid(
  .aclk         (cpu_clk),
  .intrpt       (cpu_intrpt),
  //.nmi              (1'b1),

  .aresetn      (cpu_aresetn  ),
  .arid         (m0_arid[3:0] ),
  .araddr       (m0_araddr    ),
  .arlen        (m0_arlen     ),
  .arsize       (m0_arsize    ),
  .arburst      (m0_arburst   ),
  .arlock       (m0_arlock    ),
  .arcache      (m0_arcache   ),
  .arprot       (m0_arprot    ),
  .arvalid      (m0_arvalid   ),
  .arready      (m0_arready   ),
  .rid          (m0_rid[3:0]  ),
  .rdata        (m0_rdata     ),
  .rresp        (m0_rresp     ),
  .rlast        (m0_rlast     ),
  .rvalid       (m0_rvalid    ),
  .rready       (m0_rready    ),
  .awid         (m0_awid[3:0] ),
  .awaddr       (m0_awaddr    ),
  .awlen        (m0_awlen     ),
  .awsize       (m0_awsize    ),
  .awburst      (m0_awburst   ),
  .awlock       (m0_awlock    ),
  .awcache      (m0_awcache   ),
  .awprot       (m0_awprot    ),
  .awvalid      (m0_awvalid   ),
  .awready      (m0_awready   ),
  .wid          (m0_wid[3:0]  ),
  .wdata        (m0_wdata     ),
  .wstrb        (m0_wstrb     ),
  .wlast        (m0_wlast     ),
  .wvalid       (m0_wvalid    ),
  .wready       (m0_wready    ),
  .bid          (m0_bid[3:0]  ),
  .bresp        (m0_bresp     ),
  .bvalid       (m0_bvalid    ),
  .bready       (m0_bready    ),

  .ws_valid     (ws_valid     ),
  .break_point  (break_point  ),
  .infor_flag   (infor_flag   ),
  .reg_num      (reg_num      ),
  .rf_rdata     (rf_rdata     ),

  .debug0_wb_pc        (debug_wb_pc      ),
  .debug0_wb_rf_wen    (debug_wb_rf_wen  ),
  .debug0_wb_rf_wnum   (debug_wb_rf_wnum ),
  .debug0_wb_rf_wdata  (debug_wb_rf_wdata)
);

/*
//AXI_2x1_MUX
axi_2x1_mux u_axi_2x1_mux
(
    .INTERCONNECT_ACLK   (cpu_clk     ),
    .INTERCONNECT_ARESETN(resetn      ),
    .S00_AXI_ACLK        (cpu_clk     ),
    .S00_AXI_ARESET_OUT_N(            ),
    .S00_AXI_ARADDR      (m0_araddr   ),
    .S00_AXI_ARBURST     (m0_arburst  ),
    .S00_AXI_ARCACHE     (m0_arcache  ),
    .S00_AXI_ARID        (m0_arid[3:0]),
    .S00_AXI_ARLEN       (m0_arlen    ),
    .S00_AXI_ARLOCK      (m0_arlock   ),
    .S00_AXI_ARPROT      (m0_arprot   ),
    .S00_AXI_ARQOS       (4'b0        ),
    .S00_AXI_ARREADY     (m0_arready  ),
    .S00_AXI_ARSIZE      (m0_arsize   ),
    .S00_AXI_ARVALID     (m0_arvalid  ),
    .S00_AXI_RDATA       (m0_rdata    ),
    .S00_AXI_RID         (m0_rid[3:0] ),
    .S00_AXI_RLAST       (m0_rlast    ),
    .S00_AXI_RREADY      (m0_rready   ),
    .S00_AXI_RRESP       (m0_rresp    ),
    .S00_AXI_RVALID      (m0_rvalid   ),
    .S00_AXI_AWADDR      (`Lawaddr'b0 ),
    .S00_AXI_AWBURST     (`Lawburst'b0),
    .S00_AXI_AWCACHE     (`Lawcache'b0),
    .S00_AXI_AWID        (`LID'b0     ),
    .S00_AXI_AWLEN       (`Lawlen'b0  ),
    .S00_AXI_AWLOCK      (`Lawlock'b0 ),
    .S00_AXI_AWPROT      (`Lawprot'b0 ),
    .S00_AXI_AWQOS       (4'b0        ),
    .S00_AXI_AWREADY     (            ),
    .S00_AXI_AWSIZE      (`Lawsize'b0 ),
    .S00_AXI_AWVALID     (1'b0        ),
    .S00_AXI_WDATA       (`Lwdata'b0  ),
    .S00_AXI_WLAST       (1'b0        ),
    .S00_AXI_WREADY      (            ),
    .S00_AXI_WSTRB       (`Lwstrb'b0  ),
    .S00_AXI_WVALID      (1'b0        ),
    .S00_AXI_BID         (            ),
    .S00_AXI_BREADY      (1'b0        ),
    .S00_AXI_BRESP       (            ),
    .S00_AXI_BVALID      (            ),
   
    .S01_AXI_ACLK        (cpu_clk     ),
    .S01_AXI_ARESET_OUT_N(            ),
    .S01_AXI_ARADDR      (uart_araddr ),
    .S01_AXI_ARBURST     (uart_arburst),
    .S01_AXI_ARCACHE     (uart_arcache),
    .S01_AXI_ARID        (uart_arid   ),
    .S01_AXI_ARLEN       (uart_arlen  ),
    .S01_AXI_ARLOCK      (uart_arlock ),
    .S01_AXI_ARPROT      (uart_arprot ),
    .S01_AXI_ARQOS       (4'b0        ),
    .S01_AXI_ARREADY     (uart_arready),
    .S01_AXI_ARSIZE      (uart_arsize ),
    .S01_AXI_ARVALID     (uart_arvalid),
    .S01_AXI_RDATA       (uart_rdata  ),
    .S01_AXI_RID         (uart_rid    ),
    .S01_AXI_RLAST       (uart_rlast  ),
    .S01_AXI_RREADY      (uart_rready ),
    .S01_AXI_RRESP       (uart_rresp  ),
    .S01_AXI_RVALID      (uart_rvalid ),
    .S01_AXI_AWADDR      (`Lawaddr'b0 ),
    .S01_AXI_AWBURST     (`Lawburst'b0),
    .S01_AXI_AWCACHE     (`Lawcache'b0),
    .S01_AXI_AWID        (`LID'b0     ),
    .S01_AXI_AWLEN       (`Lawlen'b0  ),
    .S01_AXI_AWLOCK      (`Lawlock'b0 ),
    .S01_AXI_AWPROT      (`Lawprot'b0 ),
    .S01_AXI_AWQOS       (4'b0        ),
    .S01_AXI_AWREADY     (            ),
    .S01_AXI_AWSIZE      (`Lawsize'b0 ),
    .S01_AXI_AWVALID     (1'b0        ),
    .S01_AXI_WDATA       (`Lwdata'b0  ),
    .S01_AXI_WLAST       (1'b0        ),
    .S01_AXI_WREADY      (            ),
    .S01_AXI_WSTRB       (`Lwstrb'b0  ),
    .S01_AXI_WVALID      (1'b0        ),
    .S01_AXI_BID         (            ),
    .S01_AXI_BREADY      (1'b0        ),
    .S01_AXI_BRESP       (            ),
    .S01_AXI_BVALID      (            ),
    
    .M00_AXI_ACLK        (cpu_clk     ),
    .M00_AXI_ARESET_OUT_N(            ),
    .M00_AXI_ARADDR      (m1_araddr   ),
    .M00_AXI_ARBURST     (m1_arburst  ),
    .M00_AXI_ARCACHE     (m1_arcache  ),
    .M00_AXI_ARID        (m1_arid[3:0]),
    .M00_AXI_ARLEN       (m1_arlen    ),
    .M00_AXI_ARLOCK      (m1_arlock   ),
    .M00_AXI_ARPROT      (m1_arprot   ),
    .M00_AXI_ARQOS       (4'b0        ),
    .M00_AXI_ARREADY     (m1_arready  ),
    .M00_AXI_ARSIZE      (m1_arsize   ),
    .M00_AXI_ARVALID     (m1_arvalid  ),
    .M00_AXI_RDATA       (m1_rdata    ),
    .M00_AXI_RID         ({1'b0,m1_rid[3:0]} ),
    .M00_AXI_RLAST       (m1_rlast    ),
    .M00_AXI_RREADY      (m1_rready   ),
    .M00_AXI_RRESP       (m1_rresp    ),
    .M00_AXI_RVALID      (m1_rvalid   ),
    .M00_AXI_AWADDR      (            ),
    .M00_AXI_AWBURST     (            ),
    .M00_AXI_AWCACHE     (            ),
    .M00_AXI_AWID        (            ),
    .M00_AXI_AWLEN       (            ),
    .M00_AXI_AWLOCK      (            ),
    .M00_AXI_AWPROT      (            ),
    .M00_AXI_AWQOS       (            ),
    .M00_AXI_AWREADY     (1'b0        ),
    .M00_AXI_AWSIZE      (            ),
    .M00_AXI_AWVALID     (            ),
    .M00_AXI_WDATA       (            ),
    .M00_AXI_WLAST       (            ),
    .M00_AXI_WREADY      (1'b0        ),
    .M00_AXI_WSTRB       (            ),
    .M00_AXI_WVALID      (            ),
    .M00_AXI_BID         (5'b0        ),
    .M00_AXI_BREADY      (            ),
    .M00_AXI_BRESP       (`Lbresp'b0  ),
    .M00_AXI_BVALID      (1'b0        )
);
*/

// cpu_axi asyn
axi_clock_converter_0 AXI_CLK_CONVERTER (
    .s_axi_awid       (m0_awid[3:0]       ),	
    .s_axi_awaddr     (m0_awaddr          ),
    .s_axi_awlen      (m0_awlen           ),
    .s_axi_awsize     (m0_awsize          ),
    .s_axi_awburst    (m0_awburst         ),
    .s_axi_awlock     (m0_awlock          ),
    .s_axi_awcache    (m0_awcache         ),
    .s_axi_awprot     (m0_awprot          ),
    .s_axi_awqos      (4'b0               ),
    .s_axi_awvalid    (m0_awvalid         ),
    .s_axi_awready    (m0_awready         ),
    .s_axi_wid        (m0_wid[3:0]        ),
    .s_axi_wdata      (m0_wdata           ),
    .s_axi_wstrb      (m0_wstrb           ),
    .s_axi_wlast      (m0_wlast           ),
    .s_axi_wvalid     (m0_wvalid          ),
    .s_axi_wready     (m0_wready          ),
    .s_axi_bid        (m0_bid[3:0]        ),
    .s_axi_bresp      (m0_bresp           ),
    .s_axi_bvalid     (m0_bvalid          ),
    .s_axi_bready     (m0_bready          ),
    .s_axi_arid       (m0_arid[3:0]       ),
    .s_axi_araddr     (m0_araddr          ),
    .s_axi_arlen      (m0_arlen           ),
    .s_axi_arsize     (m0_arsize          ),
    .s_axi_arburst    (m0_arburst         ),
    .s_axi_arlock     (m0_arlock          ),
    .s_axi_arcache    (m0_arcache         ),
    .s_axi_arprot     (m0_arprot          ),
    .s_axi_arqos      (4'b0               ),
    .s_axi_arvalid    (m0_arvalid         ),
    .s_axi_arready    (m0_arready         ),
    .s_axi_rid        (m0_rid[3:0]        ),
    .s_axi_rdata      (m0_rdata           ),
    .s_axi_rresp      (m0_rresp           ),
    .s_axi_rlast      (m0_rlast           ),
    .s_axi_rvalid     (m0_rvalid          ),
    .s_axi_rready     (m0_rready          ),

    .s_axi_aclk	      (cpu_clk            ),
    .s_axi_aresetn    (cpu_aresetn        ),
    
    .m_axi_awid       (m0_async_awid[3:0] ),
    .m_axi_awaddr     (m0_async_awaddr    ),
    .m_axi_awlen      (m0_async_awlen     ),
    .m_axi_awsize     (m0_async_awsize    ),
    .m_axi_awburst    (m0_async_awburst   ),
    .m_axi_awlock     (m0_async_awlock    ),
    .m_axi_awcache    (m0_async_awcache   ),
    .m_axi_awprot     (m0_async_awprot    ),
    .m_axi_awqos      (                   ),
    .m_axi_awvalid    (m0_async_awvalid   ),
    .m_axi_awready    (m0_async_awready   ),
    .m_axi_wid        (m0_async_wid[3:0]  ),
    .m_axi_wdata      (m0_async_wdata     ),
    .m_axi_wstrb      (m0_async_wstrb     ),
    .m_axi_wlast      (m0_async_wlast     ),
    .m_axi_wvalid     (m0_async_wvalid    ),
    .m_axi_wready     (m0_async_wready    ),
    .m_axi_bid        (m0_async_bid[3:0]  ),
    .m_axi_bresp      (m0_async_bresp     ),
    .m_axi_bvalid     (m0_async_bvalid    ),
    .m_axi_bready     (m0_async_bready    ),
    .m_axi_arid       (m0_async_arid[3:0] ),
    .m_axi_araddr     (m0_async_araddr    ),
    .m_axi_arlen      (m0_async_arlen     ),
    .m_axi_arsize     (m0_async_arsize    ),
    .m_axi_arburst    (m0_async_arburst   ),
    .m_axi_arlock     (m0_async_arlock    ),
    .m_axi_arcache    (m0_async_arcache   ),
    .m_axi_arprot     (m0_async_arprot    ),
    .m_axi_arqos      (                   ),
    .m_axi_arvalid    (m0_async_arvalid   ),
    .m_axi_arready    (m0_async_arready   ),
    .m_axi_rid        (m0_async_rid[3:0]  ),
    .m_axi_rdata      (m0_async_rdata     ),
    .m_axi_rresp      (m0_async_rresp     ),
    .m_axi_rlast      (m0_async_rlast     ),
    .m_axi_rvalid     (m0_async_rvalid    ),
    .m_axi_rready     (m0_async_rready    ),

    .m_axi_aclk	      (aclk               ),
    .m_axi_aresetn    (aresetn            )
);

/* Legacy AXI slave mux; replaced by axi_crossbar_0 below.
axi_slave_mux AXI_SLAVE_MUX
(
.axi_s_aresetn     (aresetn              ),
.spi_boot          (1'b1                 ),  

.axi_s_awid        (m0_async_awid        ),
.axi_s_awaddr      (m0_async_awaddr      ),
.axi_s_awlen       (m0_async_awlen       ),
.axi_s_awsize      (m0_async_awsize      ),
.axi_s_awburst     (m0_async_awburst     ),
.axi_s_awlock      (m0_async_awlock      ),
.axi_s_awcache     (m0_async_awcache     ),
.axi_s_awprot      (m0_async_awprot      ),
.axi_s_awvalid     (m0_async_awvalid     ),
.axi_s_awready     (m0_async_awready     ),
.axi_s_wready      (m0_async_wready      ),
.axi_s_wid         (m0_async_wid         ),
.axi_s_wdata       (m0_async_wdata       ),
.axi_s_wstrb       (m0_async_wstrb       ),
.axi_s_wlast       (m0_async_wlast       ),
.axi_s_wvalid      (m0_async_wvalid      ),
.axi_s_bid         (m0_async_bid         ),
.axi_s_bresp       (m0_async_bresp       ),
.axi_s_bvalid      (m0_async_bvalid      ),
.axi_s_bready      (m0_async_bready      ),
.axi_s_arid        (m0_async_arid        ),
.axi_s_araddr      (m0_async_araddr      ),
.axi_s_arlen       (m0_async_arlen       ),
.axi_s_arsize      (m0_async_arsize      ),
.axi_s_arburst     (m0_async_arburst     ),
.axi_s_arlock      (m0_async_arlock      ),
.axi_s_arcache     (m0_async_arcache     ),
.axi_s_arprot      (m0_async_arprot      ),
.axi_s_arvalid     (m0_async_arvalid     ),
.axi_s_arready     (m0_async_arready     ),
.axi_s_rready      (m0_async_rready      ),
.axi_s_rid         (m0_async_rid         ),
.axi_s_rdata       (m0_async_rdata       ),
.axi_s_rresp       (m0_async_rresp       ),
.axi_s_rlast       (m0_async_rlast       ),
.axi_s_rvalid      (m0_async_rvalid      ),

.s0_awid           (s0_awid         ),
.s0_awaddr         (s0_awaddr       ),
.s0_awlen          (s0_awlen        ),
.s0_awsize         (s0_awsize       ),
.s0_awburst        (s0_awburst      ),
.s0_awlock         (s0_awlock       ),
.s0_awcache        (s0_awcache      ),
.s0_awprot         (s0_awprot       ),
.s0_awvalid        (s0_awvalid      ),
.s0_awready        (s0_awready      ),
.s0_wid            (s0_wid          ),
.s0_wdata          (s0_wdata        ),
.s0_wstrb          (s0_wstrb        ),
.s0_wlast          (s0_wlast        ),
.s0_wvalid         (s0_wvalid       ),
.s0_wready         (s0_wready       ),
.s0_bid            (s0_bid          ),
.s0_bresp          (s0_bresp        ),
.s0_bvalid         (s0_bvalid       ),
.s0_bready         (s0_bready       ),
.s0_arid           (s0_arid         ),
.s0_araddr         (s0_araddr       ),
.s0_arlen          (s0_arlen        ),
.s0_arsize         (s0_arsize       ),
.s0_arburst        (s0_arburst      ),
.s0_arlock         (s0_arlock       ),
.s0_arcache        (s0_arcache      ),
.s0_arprot         (s0_arprot       ),
.s0_arvalid        (s0_arvalid      ),
.s0_arready        (s0_arready      ),
.s0_rid            (s0_rid          ),
.s0_rdata          (s0_rdata        ),
.s0_rresp          (s0_rresp        ),
.s0_rlast          (s0_rlast        ),
.s0_rvalid         (s0_rvalid       ),
.s0_rready         (s0_rready       ),

.s1_awid           (spi_s_awid          ),
.s1_awaddr         (spi_s_awaddr        ),
.s1_awlen          (spi_s_awlen         ),
.s1_awsize         (spi_s_awsize        ),
.s1_awburst        (spi_s_awburst       ),
.s1_awlock         (spi_s_awlock        ),
.s1_awcache        (spi_s_awcache       ),
.s1_awprot         (spi_s_awprot        ),
.s1_awvalid        (spi_s_awvalid       ),
.s1_awready        (spi_s_awready       ),
.s1_wid            (spi_s_wid           ),
.s1_wdata          (spi_s_wdata         ),
.s1_wstrb          (spi_s_wstrb         ),
.s1_wlast          (spi_s_wlast         ),
.s1_wvalid         (spi_s_wvalid        ),
.s1_wready         (spi_s_wready        ),
.s1_bid            (spi_s_bid           ),
.s1_bresp          (spi_s_bresp         ),
.s1_bvalid         (spi_s_bvalid        ),
.s1_bready         (spi_s_bready        ),
.s1_arid           (spi_s_arid          ),
.s1_araddr         (spi_s_araddr        ),
.s1_arlen          (spi_s_arlen         ),
.s1_arsize         (spi_s_arsize        ),
.s1_arburst        (spi_s_arburst       ),
.s1_arlock         (spi_s_arlock        ),
.s1_arcache        (spi_s_arcache       ),
.s1_arprot         (spi_s_arprot        ),
.s1_arvalid        (spi_s_arvalid       ),
.s1_arready        (spi_s_arready       ),
.s1_rid            (spi_s_rid           ),
.s1_rdata          (spi_s_rdata         ),
.s1_rresp          (spi_s_rresp         ),
.s1_rlast          (spi_s_rlast         ),
.s1_rvalid         (spi_s_rvalid        ),
.s1_rready         (spi_s_rready        ),

.s2_awid           (apb_s_awid         ),
.s2_awaddr         (apb_s_awaddr       ),
.s2_awlen          (apb_s_awlen        ),
.s2_awsize         (apb_s_awsize       ),
.s2_awburst        (apb_s_awburst      ),
.s2_awlock         (apb_s_awlock       ),
.s2_awcache        (apb_s_awcache      ),
.s2_awprot         (apb_s_awprot       ),
.s2_awvalid        (apb_s_awvalid      ),
.s2_awready        (apb_s_awready      ),
.s2_wid            (apb_s_wid          ),
.s2_wdata          (apb_s_wdata        ),
.s2_wstrb          (apb_s_wstrb        ),
.s2_wlast          (apb_s_wlast        ),
.s2_wvalid         (apb_s_wvalid       ),
.s2_wready         (apb_s_wready       ),
.s2_bid            (apb_s_bid          ),
.s2_bresp          (apb_s_bresp        ),
.s2_bvalid         (apb_s_bvalid       ),
.s2_bready         (apb_s_bready       ),
.s2_arid           (apb_s_arid         ),
.s2_araddr         (apb_s_araddr       ),
.s2_arlen          (apb_s_arlen        ),
.s2_arsize         (apb_s_arsize       ),
.s2_arburst        (apb_s_arburst      ),
.s2_arlock         (apb_s_arlock       ),
.s2_arcache        (apb_s_arcache      ),
.s2_arprot         (apb_s_arprot       ),
.s2_arvalid        (apb_s_arvalid      ),
.s2_arready        (apb_s_arready      ),
.s2_rid            (apb_s_rid          ),
.s2_rdata          (apb_s_rdata        ),
.s2_rresp          (apb_s_rresp        ),
.s2_rlast          (apb_s_rlast        ),
.s2_rvalid         (apb_s_rvalid       ),
.s2_rready         (apb_s_rready       ),

.s3_awid           (conf_s_awid         ),
.s3_awaddr         (conf_s_awaddr       ),
.s3_awlen          (conf_s_awlen        ),
.s3_awsize         (conf_s_awsize       ),
.s3_awburst        (conf_s_awburst      ),
.s3_awlock         (conf_s_awlock       ),
.s3_awcache        (conf_s_awcache      ),
.s3_awprot         (conf_s_awprot       ),
.s3_awvalid        (conf_s_awvalid      ),
.s3_awready        (conf_s_awready      ),
.s3_wid            (conf_s_wid          ),
.s3_wdata          (conf_s_wdata        ),
.s3_wstrb          (conf_s_wstrb        ),
.s3_wlast          (conf_s_wlast        ),
.s3_wvalid         (conf_s_wvalid       ),
.s3_wready         (conf_s_wready       ),
.s3_bid            (conf_s_bid          ),
.s3_bresp          (conf_s_bresp        ),
.s3_bvalid         (conf_s_bvalid       ),
.s3_bready         (conf_s_bready       ),
.s3_arid           (conf_s_arid         ),
.s3_araddr         (conf_s_araddr       ),
.s3_arlen          (conf_s_arlen        ),
.s3_arsize         (conf_s_arsize       ),
.s3_arburst        (conf_s_arburst      ),
.s3_arlock         (conf_s_arlock       ),
.s3_arcache        (conf_s_arcache      ),
.s3_arprot         (conf_s_arprot       ),
.s3_arvalid        (conf_s_arvalid      ),
.s3_arready        (conf_s_arready      ),
.s3_rid            (conf_s_rid          ),
.s3_rdata          (conf_s_rdata        ),
.s3_rresp          (conf_s_rresp        ),
.s3_rlast          (conf_s_rlast        ),
.s3_rvalid         (conf_s_rvalid       ),
.s3_rready         (conf_s_rready       ),

.s4_awid           (mac_s_awid         ),
.s4_awaddr         (mac_s_awaddr       ),
.s4_awlen          (mac_s_awlen        ),
.s4_awsize         (mac_s_awsize       ),
.s4_awburst        (mac_s_awburst      ),
.s4_awlock         (mac_s_awlock       ),
.s4_awcache        (mac_s_awcache      ),
.s4_awprot         (mac_s_awprot       ),
.s4_awvalid        (mac_s_awvalid      ),
.s4_awready        (mac_s_awready      ),
.s4_wid            (mac_s_wid          ),
.s4_wdata          (mac_s_wdata        ),
.s4_wstrb          (mac_s_wstrb        ),
.s4_wlast          (mac_s_wlast        ),
.s4_wvalid         (mac_s_wvalid       ),
.s4_wready         (mac_s_wready       ),
.s4_bid            (mac_s_bid          ),
.s4_bresp          (mac_s_bresp        ),
.s4_bvalid         (mac_s_bvalid       ),
.s4_bready         (mac_s_bready       ),
.s4_arid           (mac_s_arid         ),
.s4_araddr         (mac_s_araddr       ),
.s4_arlen          (mac_s_arlen        ),
.s4_arsize         (mac_s_arsize       ),
.s4_arburst        (mac_s_arburst      ),
.s4_arlock         (mac_s_arlock       ),
.s4_arcache        (mac_s_arcache      ),
.s4_arprot         (mac_s_arprot       ),
.s4_arvalid        (mac_s_arvalid      ),
.s4_arready        (mac_s_arready      ),
.s4_rid            (mac_s_rid          ),
.s4_rdata          (mac_s_rdata        ),
.s4_rresp          (mac_s_rresp        ),
.s4_rlast          (mac_s_rlast        ),
.s4_rvalid         (mac_s_rvalid       ),
.s4_rready         (mac_s_rready       ),

.axi_s_aclk        (aclk                )
);
*/

// AXI address space (configured in axi_crossbar_0):
// M00  DDR      0x00000000-0x07FFFFFF (Addr Width 27, Read/Write Issuing 4)
// M01  SPI      0x1C000000-0x1C0FFFFF, 0x1FE80000-0x1FE8FFFF
// M02  APB_DEV  0x1FE00000-0x1FE0FFFF, 0x1FE70000-0x1FE7FFFF
// M03  CONFREG  0x1FD00000-0x1FD0FFFF
// M04  MAC      0x1FF00000-0x1FF0FFFF
// M05  VDMA     0x1FB00000-0x1FB0FFFF
// M06  VTC      0x1FB10000-0x1FB1FFFF
// M07  USB      0x1FB20000-0x1FB2FFFF
// M08  VGA_CLK  0x1FB40000-0x1FB4FFFF
// M01-M08 are register/control targets and use Read/Write Issuing 1.

// Crossbar outputs M00-M04 retain the original SoC signal names.
assign {mac_s_awid,    conf_s_awid,    apb_s_awid,    spi_s_awid,    s0_awid}    = xbar_m_awid[19:0];
assign {mac_s_awaddr,  conf_s_awaddr,  apb_s_awaddr,  spi_s_awaddr,  s0_awaddr}  = xbar_m_awaddr[159:0];
assign {mac_s_awlen,   conf_s_awlen,   apb_s_awlen,   spi_s_awlen,   s0_awlen}   = xbar_m_awlen[19:0];
assign {mac_s_awsize,  conf_s_awsize,  apb_s_awsize,  spi_s_awsize,  s0_awsize}  = xbar_m_awsize[14:0];
assign {mac_s_awburst, conf_s_awburst, apb_s_awburst, spi_s_awburst, s0_awburst} = xbar_m_awburst[9:0];
assign {mac_s_awlock,  conf_s_awlock,  apb_s_awlock,  spi_s_awlock,  s0_awlock}  = xbar_m_awlock[9:0];
assign {mac_s_awcache, conf_s_awcache, apb_s_awcache, spi_s_awcache, s0_awcache} = xbar_m_awcache[19:0];
assign {mac_s_awprot,  conf_s_awprot,  apb_s_awprot,  spi_s_awprot,  s0_awprot}  = xbar_m_awprot[14:0];
assign {mac_s_awvalid, conf_s_awvalid, apb_s_awvalid, spi_s_awvalid, s0_awvalid} = xbar_m_awvalid[4:0];
assign xbar_m_awready[4:0] = {mac_s_awready,conf_s_awready,apb_s_awready,spi_s_awready,s0_awready};

assign {mac_s_wid,    conf_s_wid,    apb_s_wid,    spi_s_wid,    s0_wid}    = xbar_m_wid[19:0];
assign {mac_s_wdata,  conf_s_wdata,  apb_s_wdata,  spi_s_wdata,  s0_wdata}  = xbar_m_wdata[159:0];
assign {mac_s_wstrb,  conf_s_wstrb,  apb_s_wstrb,  spi_s_wstrb,  s0_wstrb}  = xbar_m_wstrb[19:0];
assign {mac_s_wlast,  conf_s_wlast,  apb_s_wlast,  spi_s_wlast,  s0_wlast}  = xbar_m_wlast[4:0];
assign {mac_s_wvalid, conf_s_wvalid, apb_s_wvalid, spi_s_wvalid, s0_wvalid} = xbar_m_wvalid[4:0];
assign xbar_m_wready[4:0] = {mac_s_wready,conf_s_wready,apb_s_wready,spi_s_wready,s0_wready};

assign xbar_m_bid[19:0]    = {mac_s_bid,conf_s_bid,apb_s_bid,spi_s_bid,s0_bid};
assign xbar_m_bresp[9:0]   = {mac_s_bresp,conf_s_bresp,apb_s_bresp,spi_s_bresp,s0_bresp};
assign xbar_m_bvalid[4:0]  = {mac_s_bvalid,conf_s_bvalid,apb_s_bvalid,spi_s_bvalid,s0_bvalid};
assign {mac_s_bready,conf_s_bready,apb_s_bready,spi_s_bready,s0_bready} = xbar_m_bready[4:0];

assign {mac_s_arid,    conf_s_arid,    apb_s_arid,    spi_s_arid,    s0_arid}    = xbar_m_arid[19:0];
assign {mac_s_araddr,  conf_s_araddr,  apb_s_araddr,  spi_s_araddr,  s0_araddr}  = xbar_m_araddr[159:0];
assign {mac_s_arlen,   conf_s_arlen,   apb_s_arlen,   spi_s_arlen,   s0_arlen}   = xbar_m_arlen[19:0];
assign {mac_s_arsize,  conf_s_arsize,  apb_s_arsize,  spi_s_arsize,  s0_arsize}  = xbar_m_arsize[14:0];
assign {mac_s_arburst, conf_s_arburst, apb_s_arburst, spi_s_arburst, s0_arburst} = xbar_m_arburst[9:0];
assign {mac_s_arlock,  conf_s_arlock,  apb_s_arlock,  spi_s_arlock,  s0_arlock}  = xbar_m_arlock[9:0];
assign {mac_s_arcache, conf_s_arcache, apb_s_arcache, spi_s_arcache, s0_arcache} = xbar_m_arcache[19:0];
assign {mac_s_arprot,  conf_s_arprot,  apb_s_arprot,  spi_s_arprot,  s0_arprot}  = xbar_m_arprot[14:0];
assign {mac_s_arvalid, conf_s_arvalid, apb_s_arvalid, spi_s_arvalid, s0_arvalid} = xbar_m_arvalid[4:0];
assign xbar_m_arready[4:0] = {mac_s_arready,conf_s_arready,apb_s_arready,spi_s_arready,s0_arready};

assign xbar_m_rid[19:0]     = {mac_s_rid,conf_s_rid,apb_s_rid,spi_s_rid,s0_rid};
assign xbar_m_rdata[159:0]  = {mac_s_rdata,conf_s_rdata,apb_s_rdata,spi_s_rdata,s0_rdata};
assign xbar_m_rresp[9:0]    = {mac_s_rresp,conf_s_rresp,apb_s_rresp,spi_s_rresp,s0_rresp};
assign xbar_m_rlast[4:0]    = {mac_s_rlast,conf_s_rlast,apb_s_rlast,spi_s_rlast,s0_rlast};
assign xbar_m_rvalid[4:0]   = {mac_s_rvalid,conf_s_rvalid,apb_s_rvalid,spi_s_rvalid,s0_rvalid};
assign {mac_s_rready,conf_s_rready,apb_s_rready,spi_s_rready,s0_rready} = xbar_m_rready[4:0];

axi_crossbar_0 AXI_CROSSBAR (
    .aclk          (aclk),
    .aresetn       (aresetn),
    .s_axi_awid    (m0_async_awid[3:0]),
    .s_axi_awaddr  (m0_async_awaddr),
    .s_axi_awlen   (m0_async_awlen),
    .s_axi_awsize  (m0_async_awsize),
    .s_axi_awburst (m0_async_awburst),
    .s_axi_awlock  (m0_async_awlock),
    .s_axi_awcache (m0_async_awcache),
    .s_axi_awprot  (m0_async_awprot),
    .s_axi_awqos   (4'b0),
    .s_axi_awvalid (m0_async_awvalid),
    .s_axi_awready (m0_async_awready),
    .s_axi_wid     (m0_async_wid[3:0]),
    .s_axi_wdata   (m0_async_wdata),
    .s_axi_wstrb   (m0_async_wstrb),
    .s_axi_wlast   (m0_async_wlast),
    .s_axi_wvalid  (m0_async_wvalid),
    .s_axi_wready  (m0_async_wready),
    .s_axi_bid     (m0_async_bid[3:0]),
    .s_axi_bresp   (m0_async_bresp),
    .s_axi_bvalid  (m0_async_bvalid),
    .s_axi_bready  (m0_async_bready),
    .s_axi_arid    (m0_async_arid[3:0]),
    .s_axi_araddr  (m0_async_araddr),
    .s_axi_arlen   (m0_async_arlen),
    .s_axi_arsize  (m0_async_arsize),
    .s_axi_arburst (m0_async_arburst),
    .s_axi_arlock  (m0_async_arlock),
    .s_axi_arcache (m0_async_arcache),
    .s_axi_arprot  (m0_async_arprot),
    .s_axi_arqos   (4'b0),
    .s_axi_arvalid (m0_async_arvalid),
    .s_axi_arready (m0_async_arready),
    .s_axi_rid     (m0_async_rid[3:0]),
    .s_axi_rdata   (m0_async_rdata),
    .s_axi_rresp   (m0_async_rresp),
    .s_axi_rlast   (m0_async_rlast),
    .s_axi_rvalid  (m0_async_rvalid),
    .s_axi_rready  (m0_async_rready),
    .m_axi_awid    (xbar_m_awid),
    .m_axi_awaddr  (xbar_m_awaddr),
    .m_axi_awlen   (xbar_m_awlen),
    .m_axi_awsize  (xbar_m_awsize),
    .m_axi_awburst (xbar_m_awburst),
    .m_axi_awlock  (xbar_m_awlock),
    .m_axi_awcache (xbar_m_awcache),
    .m_axi_awprot  (xbar_m_awprot),
    .m_axi_awqos   (xbar_m_awqos),
    .m_axi_awvalid (xbar_m_awvalid),
    .m_axi_awready (xbar_m_awready),
    .m_axi_wid     (xbar_m_wid),
    .m_axi_wdata   (xbar_m_wdata),
    .m_axi_wstrb   (xbar_m_wstrb),
    .m_axi_wlast   (xbar_m_wlast),
    .m_axi_wvalid  (xbar_m_wvalid),
    .m_axi_wready  (xbar_m_wready),
    .m_axi_bid     (xbar_m_bid),
    .m_axi_bresp   (xbar_m_bresp),
    .m_axi_bvalid  (xbar_m_bvalid),
    .m_axi_bready  (xbar_m_bready),
    .m_axi_arid    (xbar_m_arid),
    .m_axi_araddr  (xbar_m_araddr),
    .m_axi_arlen   (xbar_m_arlen),
    .m_axi_arsize  (xbar_m_arsize),
    .m_axi_arburst (xbar_m_arburst),
    .m_axi_arlock  (xbar_m_arlock),
    .m_axi_arcache (xbar_m_arcache),
    .m_axi_arprot  (xbar_m_arprot),
    .m_axi_arqos   (xbar_m_arqos),
    .m_axi_arvalid (xbar_m_arvalid),
    .m_axi_arready (xbar_m_arready),
    .m_axi_rid     (xbar_m_rid),
    .m_axi_rdata   (xbar_m_rdata),
    .m_axi_rresp   (xbar_m_rresp),
    .m_axi_rlast   (xbar_m_rlast),
    .m_axi_rvalid  (xbar_m_rvalid),
    .m_axi_rready  (xbar_m_rready)
);

// M05: AXI3 control transactions to the VDMA AXI4-Lite register interface.
axi_protocol_converter_0 VDMA_PROTOCOL_CONVERTER (
    .aclk          (aclk),
    .aresetn       (aresetn),
    .s_axi_awid    (xbar_m_awid[5*4 +: 4]),
    .s_axi_awaddr  (xbar_m_awaddr[5*32 +: 32]),
    .s_axi_awlen   (xbar_m_awlen[5*4 +: 4]),
    .s_axi_awsize  (xbar_m_awsize[5*3 +: 3]),
    .s_axi_awburst (xbar_m_awburst[5*2 +: 2]),
    .s_axi_awlock  (xbar_m_awlock[5*2 +: 2]),
    .s_axi_awcache (xbar_m_awcache[5*4 +: 4]),
    .s_axi_awprot  (xbar_m_awprot[5*3 +: 3]),
    .s_axi_awqos   (xbar_m_awqos[5*4 +: 4]),
    .s_axi_awvalid (xbar_m_awvalid[5]),
    .s_axi_awready (xbar_m_awready[5]),
    .s_axi_wid     (xbar_m_wid[5*4 +: 4]),
    .s_axi_wdata   (xbar_m_wdata[5*32 +: 32]),
    .s_axi_wstrb   (xbar_m_wstrb[5*4 +: 4]),
    .s_axi_wlast   (xbar_m_wlast[5]),
    .s_axi_wvalid  (xbar_m_wvalid[5]),
    .s_axi_wready  (xbar_m_wready[5]),
    .s_axi_bid     (xbar_m_bid[5*4 +: 4]),
    .s_axi_bresp   (xbar_m_bresp[5*2 +: 2]),
    .s_axi_bvalid  (xbar_m_bvalid[5]),
    .s_axi_bready  (xbar_m_bready[5]),
    .s_axi_arid    (xbar_m_arid[5*4 +: 4]),
    .s_axi_araddr  (xbar_m_araddr[5*32 +: 32]),
    .s_axi_arlen   (xbar_m_arlen[5*4 +: 4]),
    .s_axi_arsize  (xbar_m_arsize[5*3 +: 3]),
    .s_axi_arburst (xbar_m_arburst[5*2 +: 2]),
    .s_axi_arlock  (xbar_m_arlock[5*2 +: 2]),
    .s_axi_arcache (xbar_m_arcache[5*4 +: 4]),
    .s_axi_arprot  (xbar_m_arprot[5*3 +: 3]),
    .s_axi_arqos   (xbar_m_arqos[5*4 +: 4]),
    .s_axi_arvalid (xbar_m_arvalid[5]),
    .s_axi_arready (xbar_m_arready[5]),
    .s_axi_rid     (xbar_m_rid[5*4 +: 4]),
    .s_axi_rdata   (xbar_m_rdata[5*32 +: 32]),
    .s_axi_rresp   (xbar_m_rresp[5*2 +: 2]),
    .s_axi_rlast   (xbar_m_rlast[5]),
    .s_axi_rvalid  (xbar_m_rvalid[5]),
    .s_axi_rready  (xbar_m_rready[5]),
    .m_axi_awaddr  (vdma_axil_awaddr),
    .m_axi_awprot  (vdma_axil_awprot),
    .m_axi_awvalid (vdma_axil_awvalid),
    .m_axi_awready (vdma_axil_awready),
    .m_axi_wdata   (vdma_axil_wdata),
    .m_axi_wstrb   (vdma_axil_wstrb),
    .m_axi_wvalid  (vdma_axil_wvalid),
    .m_axi_wready  (vdma_axil_wready),
    .m_axi_bresp   (vdma_axil_bresp),
    .m_axi_bvalid  (vdma_axil_bvalid),
    .m_axi_bready  (vdma_axil_bready),
    .m_axi_araddr  (vdma_axil_araddr),
    .m_axi_arprot  (vdma_axil_arprot),
    .m_axi_arvalid (vdma_axil_arvalid),
    .m_axi_arready (vdma_axil_arready),
    .m_axi_rdata   (vdma_axil_rdata),
    .m_axi_rresp   (vdma_axil_rresp),
    .m_axi_rvalid  (vdma_axil_rvalid),
    .m_axi_rready  (vdma_axil_rready)
);

// M06: AXI3 control transactions to the VTC AXI4-Lite register interface.
axi_protocol_converter_0 VTC_PROTOCOL_CONVERTER (
    .aclk          (aclk),
    .aresetn       (aresetn),
    .s_axi_awid    (xbar_m_awid[6*4 +: 4]),
    .s_axi_awaddr  (xbar_m_awaddr[6*32 +: 32]),
    .s_axi_awlen   (xbar_m_awlen[6*4 +: 4]),
    .s_axi_awsize  (xbar_m_awsize[6*3 +: 3]),
    .s_axi_awburst (xbar_m_awburst[6*2 +: 2]),
    .s_axi_awlock  (xbar_m_awlock[6*2 +: 2]),
    .s_axi_awcache (xbar_m_awcache[6*4 +: 4]),
    .s_axi_awprot  (xbar_m_awprot[6*3 +: 3]),
    .s_axi_awqos   (xbar_m_awqos[6*4 +: 4]),
    .s_axi_awvalid (xbar_m_awvalid[6]),
    .s_axi_awready (xbar_m_awready[6]),
    .s_axi_wid     (xbar_m_wid[6*4 +: 4]),
    .s_axi_wdata   (xbar_m_wdata[6*32 +: 32]),
    .s_axi_wstrb   (xbar_m_wstrb[6*4 +: 4]),
    .s_axi_wlast   (xbar_m_wlast[6]),
    .s_axi_wvalid  (xbar_m_wvalid[6]),
    .s_axi_wready  (xbar_m_wready[6]),
    .s_axi_bid     (xbar_m_bid[6*4 +: 4]),
    .s_axi_bresp   (xbar_m_bresp[6*2 +: 2]),
    .s_axi_bvalid  (xbar_m_bvalid[6]),
    .s_axi_bready  (xbar_m_bready[6]),
    .s_axi_arid    (xbar_m_arid[6*4 +: 4]),
    .s_axi_araddr  (xbar_m_araddr[6*32 +: 32]),
    .s_axi_arlen   (xbar_m_arlen[6*4 +: 4]),
    .s_axi_arsize  (xbar_m_arsize[6*3 +: 3]),
    .s_axi_arburst (xbar_m_arburst[6*2 +: 2]),
    .s_axi_arlock  (xbar_m_arlock[6*2 +: 2]),
    .s_axi_arcache (xbar_m_arcache[6*4 +: 4]),
    .s_axi_arprot  (xbar_m_arprot[6*3 +: 3]),
    .s_axi_arqos   (xbar_m_arqos[6*4 +: 4]),
    .s_axi_arvalid (xbar_m_arvalid[6]),
    .s_axi_arready (xbar_m_arready[6]),
    .s_axi_rid     (xbar_m_rid[6*4 +: 4]),
    .s_axi_rdata   (xbar_m_rdata[6*32 +: 32]),
    .s_axi_rresp   (xbar_m_rresp[6*2 +: 2]),
    .s_axi_rlast   (xbar_m_rlast[6]),
    .s_axi_rvalid  (xbar_m_rvalid[6]),
    .s_axi_rready  (xbar_m_rready[6]),
    .m_axi_awaddr  (vtc_axil_awaddr),
    .m_axi_awprot  (vtc_axil_awprot),
    .m_axi_awvalid (vtc_axil_awvalid),
    .m_axi_awready (vtc_axil_awready),
    .m_axi_wdata   (vtc_axil_wdata),
    .m_axi_wstrb   (vtc_axil_wstrb),
    .m_axi_wvalid  (vtc_axil_wvalid),
    .m_axi_wready  (vtc_axil_wready),
    .m_axi_bresp   (vtc_axil_bresp),
    .m_axi_bvalid  (vtc_axil_bvalid),
    .m_axi_bready  (vtc_axil_bready),
    .m_axi_araddr  (vtc_axil_araddr),
    .m_axi_arprot  (vtc_axil_arprot),
    .m_axi_arvalid (vtc_axil_arvalid),
    .m_axi_arready (vtc_axil_arready),
    .m_axi_rdata   (vtc_axil_rdata),
    .m_axi_rresp   (vtc_axil_rresp),
    .m_axi_rvalid  (vtc_axil_rvalid),
    .m_axi_rready  (vtc_axil_rready)
);

// M07 USB host registers: 0x1FB20000-0x1FB2FFFF.
// The Crossbar runs at aclk; core_usb_host and USB3500 UTMI run together at
// the PHY-supplied 60 MHz clock, so conversion is performed before AXI3-Lite.
axi_clock_converter_0 USB_AXI_CLOCK_CONVERTER (
    .s_axi_awid       (xbar_m_awid[7*4 +: 4]),
    .s_axi_awaddr     (xbar_m_awaddr[7*32 +: 32]),
    .s_axi_awlen      (xbar_m_awlen[7*4 +: 4]),
    .s_axi_awsize     (xbar_m_awsize[7*3 +: 3]),
    .s_axi_awburst    (xbar_m_awburst[7*2 +: 2]),
    .s_axi_awlock     (xbar_m_awlock[7*2 +: 2]),
    .s_axi_awcache    (xbar_m_awcache[7*4 +: 4]),
    .s_axi_awprot     (xbar_m_awprot[7*3 +: 3]),
    .s_axi_awqos      (xbar_m_awqos[7*4 +: 4]),
    .s_axi_awvalid    (xbar_m_awvalid[7]),
    .s_axi_awready    (xbar_m_awready[7]),
    .s_axi_wid        (xbar_m_wid[7*4 +: 4]),
    .s_axi_wdata      (xbar_m_wdata[7*32 +: 32]),
    .s_axi_wstrb      (xbar_m_wstrb[7*4 +: 4]),
    .s_axi_wlast      (xbar_m_wlast[7]),
    .s_axi_wvalid     (xbar_m_wvalid[7]),
    .s_axi_wready     (xbar_m_wready[7]),
    .s_axi_bid        (xbar_m_bid[7*4 +: 4]),
    .s_axi_bresp      (xbar_m_bresp[7*2 +: 2]),
    .s_axi_bvalid     (xbar_m_bvalid[7]),
    .s_axi_bready     (xbar_m_bready[7]),
    .s_axi_arid       (xbar_m_arid[7*4 +: 4]),
    .s_axi_araddr     (xbar_m_araddr[7*32 +: 32]),
    .s_axi_arlen      (xbar_m_arlen[7*4 +: 4]),
    .s_axi_arsize     (xbar_m_arsize[7*3 +: 3]),
    .s_axi_arburst    (xbar_m_arburst[7*2 +: 2]),
    .s_axi_arlock     (xbar_m_arlock[7*2 +: 2]),
    .s_axi_arcache    (xbar_m_arcache[7*4 +: 4]),
    .s_axi_arprot     (xbar_m_arprot[7*3 +: 3]),
    .s_axi_arqos      (xbar_m_arqos[7*4 +: 4]),
    .s_axi_arvalid    (xbar_m_arvalid[7]),
    .s_axi_arready    (xbar_m_arready[7]),
    .s_axi_rid        (xbar_m_rid[7*4 +: 4]),
    .s_axi_rdata      (xbar_m_rdata[7*32 +: 32]),
    .s_axi_rresp      (xbar_m_rresp[7*2 +: 2]),
    .s_axi_rlast      (xbar_m_rlast[7]),
    .s_axi_rvalid     (xbar_m_rvalid[7]),
    .s_axi_rready     (xbar_m_rready[7]),
    .s_axi_aclk       (aclk),
    .s_axi_aresetn    (aresetn),

    .m_axi_awid       (usb_axi3_awid),
    .m_axi_awaddr     (usb_axi3_awaddr),
    .m_axi_awlen      (usb_axi3_awlen),
    .m_axi_awsize     (usb_axi3_awsize),
    .m_axi_awburst    (usb_axi3_awburst),
    .m_axi_awlock     (usb_axi3_awlock),
    .m_axi_awcache    (usb_axi3_awcache),
    .m_axi_awprot     (usb_axi3_awprot),
    .m_axi_awqos      (usb_axi3_awqos),
    .m_axi_awvalid    (usb_axi3_awvalid),
    .m_axi_awready    (usb_axi3_awready),
    .m_axi_wid        (usb_axi3_wid),
    .m_axi_wdata      (usb_axi3_wdata),
    .m_axi_wstrb      (usb_axi3_wstrb),
    .m_axi_wlast      (usb_axi3_wlast),
    .m_axi_wvalid     (usb_axi3_wvalid),
    .m_axi_wready     (usb_axi3_wready),
    .m_axi_bid        (usb_axi3_bid),
    .m_axi_bresp      (usb_axi3_bresp),
    .m_axi_bvalid     (usb_axi3_bvalid),
    .m_axi_bready     (usb_axi3_bready),
    .m_axi_arid       (usb_axi3_arid),
    .m_axi_araddr     (usb_axi3_araddr),
    .m_axi_arlen      (usb_axi3_arlen),
    .m_axi_arsize     (usb_axi3_arsize),
    .m_axi_arburst    (usb_axi3_arburst),
    .m_axi_arlock     (usb_axi3_arlock),
    .m_axi_arcache    (usb_axi3_arcache),
    .m_axi_arprot     (usb_axi3_arprot),
    .m_axi_arqos      (usb_axi3_arqos),
    .m_axi_arvalid    (usb_axi3_arvalid),
    .m_axi_arready    (usb_axi3_arready),
    .m_axi_rid        (usb_axi3_rid),
    .m_axi_rdata      (usb_axi3_rdata),
    .m_axi_rresp      (usb_axi3_rresp),
    .m_axi_rlast      (usb_axi3_rlast),
    .m_axi_rvalid     (usb_axi3_rvalid),
    .m_axi_rready     (usb_axi3_rready),
    .m_axi_aclk       (usb_clk),
    .m_axi_aresetn    (usb_aresetn)
);

axi_protocol_converter_0 USB_PROTOCOL_CONVERTER (
    .aclk          (usb_clk),
    .aresetn       (usb_aresetn),
    .s_axi_awid    (usb_axi3_awid),
    .s_axi_awaddr  (usb_axi3_awaddr),
    .s_axi_awlen   (usb_axi3_awlen),
    .s_axi_awsize  (usb_axi3_awsize),
    .s_axi_awburst (usb_axi3_awburst),
    .s_axi_awlock  (usb_axi3_awlock),
    .s_axi_awcache (usb_axi3_awcache),
    .s_axi_awprot  (usb_axi3_awprot),
    .s_axi_awqos   (usb_axi3_awqos),
    .s_axi_awvalid (usb_axi3_awvalid),
    .s_axi_awready (usb_axi3_awready),
    .s_axi_wid     (usb_axi3_wid),
    .s_axi_wdata   (usb_axi3_wdata),
    .s_axi_wstrb   (usb_axi3_wstrb),
    .s_axi_wlast   (usb_axi3_wlast),
    .s_axi_wvalid  (usb_axi3_wvalid),
    .s_axi_wready  (usb_axi3_wready),
    .s_axi_bid     (usb_axi3_bid),
    .s_axi_bresp   (usb_axi3_bresp),
    .s_axi_bvalid  (usb_axi3_bvalid),
    .s_axi_bready  (usb_axi3_bready),
    .s_axi_arid    (usb_axi3_arid),
    .s_axi_araddr  (usb_axi3_araddr),
    .s_axi_arlen   (usb_axi3_arlen),
    .s_axi_arsize  (usb_axi3_arsize),
    .s_axi_arburst (usb_axi3_arburst),
    .s_axi_arlock  (usb_axi3_arlock),
    .s_axi_arcache (usb_axi3_arcache),
    .s_axi_arprot  (usb_axi3_arprot),
    .s_axi_arqos   (usb_axi3_arqos),
    .s_axi_arvalid (usb_axi3_arvalid),
    .s_axi_arready (usb_axi3_arready),
    .s_axi_rid     (usb_axi3_rid),
    .s_axi_rdata   (usb_axi3_rdata),
    .s_axi_rresp   (usb_axi3_rresp),
    .s_axi_rlast   (usb_axi3_rlast),
    .s_axi_rvalid  (usb_axi3_rvalid),
    .s_axi_rready  (usb_axi3_rready),
    .m_axi_awaddr  (usb_axil_awaddr),
    .m_axi_awprot  (usb_axil_awprot),
    .m_axi_awvalid (usb_axil_awvalid),
    .m_axi_awready (usb_axil_awready),
    .m_axi_wdata   (usb_axil_wdata),
    .m_axi_wstrb   (usb_axil_wstrb),
    .m_axi_wvalid  (usb_axil_wvalid),
    .m_axi_wready  (usb_axil_wready),
    .m_axi_bresp   (usb_axil_bresp),
    .m_axi_bvalid  (usb_axil_bvalid),
    .m_axi_bready  (usb_axil_bready),
    .m_axi_araddr  (usb_axil_araddr),
    .m_axi_arprot  (usb_axil_arprot),
    .m_axi_arvalid (usb_axil_arvalid),
    .m_axi_arready (usb_axil_arready),
    .m_axi_rdata   (usb_axil_rdata),
    .m_axi_rresp   (usb_axil_rresp),
    .m_axi_rvalid  (usb_axil_rvalid),
    .m_axi_rready  (usb_axil_rready)
);

usbh_host #(
    .USB_CLK_FREQ (60000000)
) USB_HOST (
    .clk_i               (usb_clk),
    .rst_i               (usb_host_reset),
    .cfg_awvalid_i       (usb_axil_awvalid),
    .cfg_awaddr_i        (usb_axil_awaddr),
    .cfg_wvalid_i        (usb_axil_wvalid),
    .cfg_wdata_i         (usb_axil_wdata),
    .cfg_wstrb_i         (usb_axil_wstrb),
    .cfg_bready_i        (usb_axil_bready),
    .cfg_arvalid_i       (usb_axil_arvalid),
    .cfg_araddr_i        (usb_axil_araddr),
    .cfg_rready_i        (usb_axil_rready),
    .cfg_awready_o       (usb_axil_awready),
    .cfg_wready_o        (usb_axil_wready),
    .cfg_bvalid_o        (usb_axil_bvalid),
    .cfg_bresp_o         (usb_axil_bresp),
    .cfg_arready_o       (usb_axil_arready),
    .cfg_rvalid_o        (usb_axil_rvalid),
    .cfg_rdata_o         (usb_axil_rdata),
    .cfg_rresp_o         (usb_axil_rresp),
    .intr_o              (usb_irq),
    .utmi_data_in_i      (usb_utmi_data_in),
    .utmi_txready_i      (USB_TXREADY),
    .utmi_rxvalid_i      (USB_RXVALID),
    .utmi_rxactive_i     (USB_RXACTIVE),
    .utmi_rxerror_i      (USB_RXERROR),
    .utmi_linestate_i    (USB_LINESTATE),
    .utmi_data_out_o     (usb_utmi_data_out),
    .utmi_txvalid_o      (usb_utmi_txvalid),
    .utmi_op_mode_o      (usb_utmi_op_mode),
    .utmi_xcvrselect_o   (usb_utmi_xcvrselect),
    .utmi_termselect_o   (usb_utmi_termselect),
    .utmi_dppulldown_o   (usb_utmi_dppulldown),
    .utmi_dmpulldown_o   (usb_utmi_dmpulldown)
);

//SPI
spi_flash_ctrl SPI                    
(                                         
.aclk           (aclk              ),       
.aresetn        (aresetn           ),       
.spi_addr       (16'h1fe8          ),
.fast_startup   (1'b0              ),
.s_awid         (spi_s_awid        ),
.s_awaddr       (spi_s_awaddr      ),
.s_awlen        (spi_s_awlen       ),
.s_awsize       (spi_s_awsize      ),
.s_awburst      (spi_s_awburst     ),
.s_awlock       (spi_s_awlock      ),
.s_awcache      (spi_s_awcache     ),
.s_awprot       (spi_s_awprot      ),
.s_awvalid      (spi_s_awvalid     ),
.s_awready      (spi_s_awready     ),
.s_wready       (spi_s_wready      ),
.s_wid          (spi_s_wid         ),
.s_wdata        (spi_s_wdata       ),
.s_wstrb        (spi_s_wstrb       ),
.s_wlast        (spi_s_wlast       ),
.s_wvalid       (spi_s_wvalid      ),
.s_bid          (spi_s_bid         ),
.s_bresp        (spi_s_bresp       ),
.s_bvalid       (spi_s_bvalid      ),
.s_bready       (spi_s_bready      ),
.s_arid         (spi_s_arid        ),
.s_araddr       (spi_s_araddr      ),
.s_arlen        (spi_s_arlen       ),
.s_arsize       (spi_s_arsize      ),
.s_arburst      (spi_s_arburst     ),
.s_arlock       (spi_s_arlock      ),
.s_arcache      (spi_s_arcache     ),
.s_arprot       (spi_s_arprot      ),
.s_arvalid      (spi_s_arvalid     ),
.s_arready      (spi_s_arready     ),
.s_rready       (spi_s_rready      ),
.s_rid          (spi_s_rid         ),
.s_rdata        (spi_s_rdata       ),
.s_rresp        (spi_s_rresp       ),
.s_rlast        (spi_s_rlast       ),
.s_rvalid       (spi_s_rvalid      ),

.power_down_req (1'b0              ),
.power_down_ack (                  ),
.csn_o          (spi_csn_o         ),
.csn_en         (spi_csn_en        ), 
.sck_o          (spi_sck_o         ),
.sdo_i          (spi_sdo_i         ),
.sdo_o          (spi_sdo_o         ),
.sdo_en         (spi_sdo_en        ), // active low
.sdi_i          (spi_sdi_i         ),
.sdi_o          (spi_sdi_o         ),
.sdi_en         (spi_sdi_en        ),
.inta_o         (spi_inta_o        )
);

//confreg
confreg CONFREG(
.aclk              (aclk               ),       
.aresetn           (aresetn            ),       
.s_awid            (conf_s_awid        ),
.s_awaddr          (conf_s_awaddr      ),
.s_awlen           (conf_s_awlen       ),
.s_awsize          (conf_s_awsize      ),
.s_awburst         (conf_s_awburst     ),
.s_awlock          (conf_s_awlock      ),
.s_awcache         (conf_s_awcache     ),
.s_awprot          (conf_s_awprot      ),
.s_awvalid         (conf_s_awvalid     ),
.s_awready         (conf_s_awready     ),
.s_wready          (conf_s_wready      ),
.s_wid             (conf_s_wid         ),
.s_wdata           (conf_s_wdata       ),
.s_wstrb           (conf_s_wstrb       ),
.s_wlast           (conf_s_wlast       ),
.s_wvalid          (conf_s_wvalid      ),
.s_bid             (conf_s_bid         ),
.s_bresp           (conf_s_bresp       ),
.s_bvalid          (conf_s_bvalid      ),
.s_bready          (conf_s_bready      ),
.s_arid            (conf_s_arid        ),
.s_araddr          (conf_s_araddr      ),
.s_arlen           (conf_s_arlen       ),
.s_arsize          (conf_s_arsize      ),
.s_arburst         (conf_s_arburst     ),
.s_arlock          (conf_s_arlock      ),
.s_arcache         (conf_s_arcache     ),
.s_arprot          (conf_s_arprot      ),
.s_arvalid         (conf_s_arvalid     ),
.s_arready         (conf_s_arready     ),
.s_rready          (conf_s_rready      ),
.s_rid             (conf_s_rid         ),
.s_rdata           (conf_s_rdata       ),
.s_rresp           (conf_s_rresp       ),
.s_rlast           (conf_s_rlast       ),
.s_rvalid          (conf_s_rvalid      ),

//dma
.order_addr_reg    (order_addr_in      ),
.write_dma_end     (write_dma_end      ),
.finish_read_order (finish_read_order  ),

//cr00~cr07
.cr00              (cr00        ),
.cr01              (cr01        ),
.cr02              (cr02        ),
.cr03              (cr03        ),
.cr04              (cr04        ),
.cr05              (cr05        ),
.cr06              (cr06        ),
.cr07              (cr07        ),

.led               (led         ),
.led_rg0           (led_rg0     ),
.led_rg1           (led_rg1     ),
.num_csn           (num_csn     ),
.num_a_g           (num_a_g     ),
.switch            (switch      ),
.btn_key_col       (btn_key_col ),
.btn_key_row       (btn_key_row ),
.btn_step          (btn_step    )
);

//MAC top
ethernet_top ETHERNET_TOP(

    .hclk       (aclk   ),
    .hrst_      (aresetn),      
    //axi master
    .mawid_o    (mac_m_awid    ),
    .mawaddr_o  (mac_m_awaddr  ),
    .mawlen_o   (mac_m_awlen   ),
    .mawsize_o  (mac_m_awsize  ),
    .mawburst_o (mac_m_awburst ),
    .mawlock_o  (mac_m_awlock  ),
    .mawcache_o (mac_m_awcache ),
    .mawprot_o  (mac_m_awprot  ),
    .mawvalid_o (mac_m_awvalid ),
    .mawready_i (mac_m_awready ),
    .mwid_o     (mac_m_wid     ),
    .mwdata_o   (mac_m_wdata   ),
    .mwstrb_o   (mac_m_wstrb   ),
    .mwlast_o   (mac_m_wlast   ),
    .mwvalid_o  (mac_m_wvalid  ),
    .mwready_i  (mac_m_wready  ),
    .mbid_i     (mac_m_bid     ),
    .mbresp_i   (mac_m_bresp   ),
    .mbvalid_i  (mac_m_bvalid  ),
    .mbready_o  (mac_m_bready  ),
    .marid_o    (mac_m_arid    ),
    .maraddr_o  (mac_m_araddr  ),
    .marlen_o   (mac_m_arlen   ),
    .marsize_o  (mac_m_arsize  ),
    .marburst_o (mac_m_arburst ),
    .marlock_o  (mac_m_arlock  ),
    .marcache_o (mac_m_arcache ),
    .marprot_o  (mac_m_arprot  ),
    .marvalid_o (mac_m_arvalid ),
    .marready_i (mac_m_arready ),
    .mrid_i     (mac_m_rid     ),
    .mrdata_i   (mac_m_rdata   ),
    .mrresp_i   (mac_m_rresp   ),
    .mrlast_i   (mac_m_rlast   ),
    .mrvalid_i  (mac_m_rvalid  ),
    .mrready_o  (mac_m_rready  ),
    //axi slaver
    .sawid_i    (mac_s_awid    ),
    .sawaddr_i  (mac_s_awaddr  ),
    .sawlen_i   (mac_s_awlen   ),
    .sawsize_i  (mac_s_awsize  ),
    .sawburst_i (mac_s_awburst ),
    .sawlock_i  (mac_s_awlock  ),
    .sawcache_i (mac_s_awcache ),
    .sawprot_i  (mac_s_awprot  ),
    .sawvalid_i (mac_s_awvalid ),
    .sawready_o (mac_s_awready ),   
    .swid_i     (mac_s_wid     ),
    .swdata_i   (mac_s_wdata   ),
    .swstrb_i   (mac_s_wstrb   ),
    .swlast_i   (mac_s_wlast   ),
    .swvalid_i  (mac_s_wvalid  ),
    .swready_o  (mac_s_wready  ),
    .sbid_o     (mac_s_bid     ),
    .sbresp_o   (mac_s_bresp   ),
    .sbvalid_o  (mac_s_bvalid  ),
    .sbready_i  (mac_s_bready  ),
    .sarid_i    (mac_s_arid    ),
    .saraddr_i  (mac_s_araddr  ),
    .sarlen_i   (mac_s_arlen   ),
    .sarsize_i  (mac_s_arsize  ),
    .sarburst_i (mac_s_arburst ),
    .sarlock_i  (mac_s_arlock  ),
    .sarcache_i (mac_s_arcache ),
    .sarprot_i  (mac_s_arprot  ),
    .sarvalid_i (mac_s_arvalid ),
    .sarready_o (mac_s_arready ),
    .srid_o     (mac_s_rid     ),
    .srdata_o   (mac_s_rdata   ),
    .srresp_o   (mac_s_rresp   ),
    .srlast_o   (mac_s_rlast   ),
    .srvalid_o  (mac_s_rvalid  ),
    .srready_i  (mac_s_rready  ),                 

    .interrupt_0 (mac_int),
 
    // I/O pad interface signals
    //TX
    .mtxclk_0    (mtxclk_0 ),     
    .mtxen_0     (mtxen_0  ),      
    .mtxd_0      (mtxd_0   ),       
    .mtxerr_0    (mtxerr_0 ),
    //RX
    .mrxclk_0    (mrxclk_0 ),      
    .mrxdv_0     (mrxdv_0  ),     
    .mrxd_0      (mrxd_0   ),        
    .mrxerr_0    (mrxerr_0 ),
    .mcoll_0     (mcoll_0  ),
    .mcrs_0      (mcrs_0   ),
    // MIIM
    .mdc_0       (mdc_0    ),
    .md_i_0      (md_i_0   ),
    .md_o_0      (md_o_0   ),       
    .md_oe_0     (md_oe_0  )

);

// M08: AXI3 control transactions to clk_wiz_vga dynamic reconfiguration.
axi_protocol_converter_0 VGA_CLK_PROTOCOL_CONVERTER (
    .aclk          (aclk),
    .aresetn       (aresetn),
    .s_axi_awid    (xbar_m_awid[8*4 +: 4]),
    .s_axi_awaddr  (xbar_m_awaddr[8*32 +: 32]),
    .s_axi_awlen   (xbar_m_awlen[8*4 +: 4]),
    .s_axi_awsize  (xbar_m_awsize[8*3 +: 3]),
    .s_axi_awburst (xbar_m_awburst[8*2 +: 2]),
    .s_axi_awlock  (xbar_m_awlock[8*2 +: 2]),
    .s_axi_awcache (xbar_m_awcache[8*4 +: 4]),
    .s_axi_awprot  (xbar_m_awprot[8*3 +: 3]),
    .s_axi_awqos   (xbar_m_awqos[8*4 +: 4]),
    .s_axi_awvalid (xbar_m_awvalid[8]),
    .s_axi_awready (xbar_m_awready[8]),
    .s_axi_wid     (xbar_m_wid[8*4 +: 4]),
    .s_axi_wdata   (xbar_m_wdata[8*32 +: 32]),
    .s_axi_wstrb   (xbar_m_wstrb[8*4 +: 4]),
    .s_axi_wlast   (xbar_m_wlast[8]),
    .s_axi_wvalid  (xbar_m_wvalid[8]),
    .s_axi_wready  (xbar_m_wready[8]),
    .s_axi_bid     (xbar_m_bid[8*4 +: 4]),
    .s_axi_bresp   (xbar_m_bresp[8*2 +: 2]),
    .s_axi_bvalid  (xbar_m_bvalid[8]),
    .s_axi_bready  (xbar_m_bready[8]),
    .s_axi_arid    (xbar_m_arid[8*4 +: 4]),
    .s_axi_araddr  (xbar_m_araddr[8*32 +: 32]),
    .s_axi_arlen   (xbar_m_arlen[8*4 +: 4]),
    .s_axi_arsize  (xbar_m_arsize[8*3 +: 3]),
    .s_axi_arburst (xbar_m_arburst[8*2 +: 2]),
    .s_axi_arlock  (xbar_m_arlock[8*2 +: 2]),
    .s_axi_arcache (xbar_m_arcache[8*4 +: 4]),
    .s_axi_arprot  (xbar_m_arprot[8*3 +: 3]),
    .s_axi_arqos   (xbar_m_arqos[8*4 +: 4]),
    .s_axi_arvalid (xbar_m_arvalid[8]),
    .s_axi_arready (xbar_m_arready[8]),
    .s_axi_rid     (xbar_m_rid[8*4 +: 4]),
    .s_axi_rdata   (xbar_m_rdata[8*32 +: 32]),
    .s_axi_rresp   (xbar_m_rresp[8*2 +: 2]),
    .s_axi_rlast   (xbar_m_rlast[8]),
    .s_axi_rvalid  (xbar_m_rvalid[8]),
    .s_axi_rready  (xbar_m_rready[8]),
    .m_axi_awaddr  (vga_clk_axil_awaddr),
    .m_axi_awprot  (vga_clk_axil_awprot),
    .m_axi_awvalid (vga_clk_axil_awvalid),
    .m_axi_awready (vga_clk_axil_awready),
    .m_axi_wdata   (vga_clk_axil_wdata),
    .m_axi_wstrb   (vga_clk_axil_wstrb),
    .m_axi_wvalid  (vga_clk_axil_wvalid),
    .m_axi_wready  (vga_clk_axil_wready),
    .m_axi_bresp   (vga_clk_axil_bresp),
    .m_axi_bvalid  (vga_clk_axil_bvalid),
    .m_axi_bready  (vga_clk_axil_bready),
    .m_axi_araddr  (vga_clk_axil_araddr),
    .m_axi_arprot  (vga_clk_axil_arprot),
    .m_axi_arvalid (vga_clk_axil_arvalid),
    .m_axi_arready (vga_clk_axil_arready),
    .m_axi_rdata   (vga_clk_axil_rdata),
    .m_axi_rresp   (vga_clk_axil_rresp),
    .m_axi_rvalid  (vga_clk_axil_rvalid),
    .m_axi_rready  (vga_clk_axil_rready)
);

// Programmable VGA pixel clock registers: 0x1FB40000-0x1FB4FFFF.
clk_wiz_vga VGA_PIXEL_CLOCK (
    .s_axi_aclk       (aclk),
    .s_axi_aresetn    (aresetn),
    .s_axi_awaddr     (vga_clk_axil_awaddr[10:0]),
    .s_axi_awvalid    (vga_clk_axil_awvalid),
    .s_axi_awready    (vga_clk_axil_awready),
    .s_axi_wdata      (vga_clk_axil_wdata),
    .s_axi_wstrb      (vga_clk_axil_wstrb),
    .s_axi_wvalid     (vga_clk_axil_wvalid),
    .s_axi_wready     (vga_clk_axil_wready),
    .s_axi_bresp      (vga_clk_axil_bresp),
    .s_axi_bvalid     (vga_clk_axil_bvalid),
    .s_axi_bready     (vga_clk_axil_bready),
    .s_axi_araddr     (vga_clk_axil_araddr[10:0]),
    .s_axi_arvalid    (vga_clk_axil_arvalid),
    .s_axi_arready    (vga_clk_axil_arready),
    .s_axi_rdata      (vga_clk_axil_rdata),
    .s_axi_rresp      (vga_clk_axil_rresp),
    .s_axi_rvalid     (vga_clk_axil_rvalid),
    .s_axi_rready     (vga_clk_axil_rready),
    .vga_pixel_clk    (vga_pixel_clk),
    .vga_clk_locked   (vga_clk_locked),
    .clk_in1          (cpu_clk)
);

// VGA VDMA control registers: 0x1FB00000-0x1FB0FFFF.
axi_vdma_0 VGA_VDMA (
    .s_axi_lite_aclk       (aclk),
    .m_axi_mm2s_aclk       (aclk),
    .m_axis_mm2s_aclk      (cpu_clk),
    .axi_resetn            (aresetn),
    .s_axi_lite_awvalid    (vdma_axil_awvalid),
    .s_axi_lite_awready    (vdma_axil_awready),
    .s_axi_lite_awaddr     (vdma_axil_awaddr[8:0]),
    .s_axi_lite_wvalid     (vdma_axil_wvalid),
    .s_axi_lite_wready     (vdma_axil_wready),
    .s_axi_lite_wdata      (vdma_axil_wdata),
    .s_axi_lite_bresp      (vdma_axil_bresp),
    .s_axi_lite_bvalid     (vdma_axil_bvalid),
    .s_axi_lite_bready     (vdma_axil_bready),
    .s_axi_lite_arvalid    (vdma_axil_arvalid),
    .s_axi_lite_arready    (vdma_axil_arready),
    .s_axi_lite_araddr     (vdma_axil_araddr[8:0]),
    .s_axi_lite_rvalid     (vdma_axil_rvalid),
    .s_axi_lite_rready     (vdma_axil_rready),
    .s_axi_lite_rdata      (vdma_axil_rdata),
    .s_axi_lite_rresp      (vdma_axil_rresp),
    .mm2s_fsync            (vtc_fsync[0]),
    .mm2s_frame_ptr_out    (vdma_frame_ptr),
    .m_axi_mm2s_araddr     (vdma_mm2s_araddr),
    .m_axi_mm2s_arlen      (vdma_mm2s_arlen),
    .m_axi_mm2s_arsize     (vdma_mm2s_arsize),
    .m_axi_mm2s_arburst    (vdma_mm2s_arburst),
    .m_axi_mm2s_arprot     (vdma_mm2s_arprot),
    .m_axi_mm2s_arcache    (vdma_mm2s_arcache),
    .m_axi_mm2s_arvalid    (vdma_mm2s_arvalid),
    .m_axi_mm2s_arready    (vdma_mm2s_arready),
    .m_axi_mm2s_rdata      (vdma_mm2s_rdata),
    .m_axi_mm2s_rresp      (vdma_mm2s_rresp),
    .m_axi_mm2s_rlast      (vdma_mm2s_rlast),
    .m_axi_mm2s_rvalid     (vdma_mm2s_rvalid),
    .m_axi_mm2s_rready     (vdma_mm2s_rready),
    .m_axis_mm2s_tdata     (vdma_axis_tdata),
    .m_axis_mm2s_tkeep     (vdma_axis_tkeep),
    .m_axis_mm2s_tuser     (vdma_axis_tuser),
    .m_axis_mm2s_tvalid    (vdma_axis_tvalid),
    .m_axis_mm2s_tready    (vdma_axis_tready),
    .m_axis_mm2s_tlast     (vdma_axis_tlast),
    .mm2s_introut          (vdma_mm2s_introut)
);

// VGA timing controller registers: 0x1FB10000-0x1FB1FFFF.
v_tc_0 VGA_VTC (
    .clk              (vga_pixel_clk),
    .clken            (1'b1),
    .s_axi_aclk       (aclk),
    .s_axi_aclken     (1'b1),
    .gen_clken        (video_vtg_ce),
    .sof_state        (video_sof_state),
    .hsync_out        (vtc_hsync),
    .hblank_out       (vtc_hblank),
    .vsync_out        (vtc_vsync),
    .vblank_out       (vtc_vblank),
    .active_video_out (vtc_active_video),
    .resetn           (vga_pixel_aresetn),
    .s_axi_aresetn    (aresetn),
    .s_axi_awaddr     (vtc_axil_awaddr[8:0]),
    .s_axi_awvalid    (vtc_axil_awvalid),
    .s_axi_awready    (vtc_axil_awready),
    .s_axi_wdata      (vtc_axil_wdata),
    .s_axi_wstrb      (vtc_axil_wstrb),
    .s_axi_wvalid     (vtc_axil_wvalid),
    .s_axi_wready     (vtc_axil_wready),
    .s_axi_bresp      (vtc_axil_bresp),
    .s_axi_bvalid     (vtc_axil_bvalid),
    .s_axi_bready     (vtc_axil_bready),
    .s_axi_araddr     (vtc_axil_araddr[8:0]),
    .s_axi_arvalid    (vtc_axil_arvalid),
    .s_axi_arready    (vtc_axil_arready),
    .s_axi_rdata      (vtc_axil_rdata),
    .s_axi_rresp      (vtc_axil_rresp),
    .s_axi_rvalid     (vtc_axil_rvalid),
    .s_axi_rready     (vtc_axil_rready),
    .irq              (),
    .fsync_in         (1'b0),
    .fsync_out        (vtc_fsync)
);

v_axi4s_vid_out_0 VGA_VIDEO_OUT (
    .aclk                (cpu_clk),
    .aclken              (1'b1),
    .aresetn             (cpu_aresetn),
    .s_axis_video_tdata  (vdma_axis_tdata),
    .s_axis_video_tvalid (vdma_axis_tvalid),
    .s_axis_video_tready (vdma_axis_tready),
    .s_axis_video_tuser  (vdma_axis_tuser),
    .s_axis_video_tlast  (vdma_axis_tlast),
    .fid                 (1'b0),
    .vid_io_out_clk      (vga_pixel_clk),
    .vid_io_out_reset    (~vga_pixel_aresetn),
    .vid_io_out_ce       (1'b1),
    .vid_active_video    (video_active),
    .vid_vsync           (video_vsync),
    .vid_hsync           (video_hsync),
    .vid_vblank          (video_vblank),
    .vid_hblank          (video_hblank),
    .vid_field_id        (video_field_id),
    .vid_data            (video_data),
    .vtg_vsync           (vtc_vsync),
    .vtg_hsync           (vtc_hsync),
    .vtg_vblank          (vtc_vblank),
    .vtg_hblank          (vtc_hblank),
    .vtg_active_video    (vtc_active_video),
    .vtg_field_id        (1'b0),
    .vtg_ce              (video_vtg_ce),
    .locked              (video_locked),
    .overflow            (video_overflow),
    .underflow           (video_underflow),
    .fifo_read_level     (video_fifo_read_level),
    .status              (video_status),
    .sof_state_out       (video_sof_state)
);

/* Removed: VDMA now uses axi_interconnect_0/S03_AXI directly.
// Reuse the existing 2x1 AXI interconnect to merge the CPU DDR path (S00)
// and the read-only VDMA MM2S path (S01) before mig_axi_interconnect/S00_AXI.
axi_2x1_mux VGA_DDR_MUX (
    .INTERCONNECT_ACLK    (aclk),
    .INTERCONNECT_ARESETN (aresetn),
    .S00_AXI_ACLK         (aclk),
    .S00_AXI_ARESET_OUT_N (),
    .S00_AXI_AWID         (s0_awid),
    .S00_AXI_AWADDR       (s0_awaddr),
    .S00_AXI_AWLEN        (s0_awlen),
    .S00_AXI_AWSIZE       (s0_awsize),
    .S00_AXI_AWBURST      (s0_awburst),
    .S00_AXI_AWLOCK       (s0_awlock),
    .S00_AXI_AWCACHE      (s0_awcache),
    .S00_AXI_AWPROT       (s0_awprot),
    .S00_AXI_AWQOS        (4'b0),
    .S00_AXI_AWVALID      (s0_awvalid),
    .S00_AXI_AWREADY      (s0_awready),
    .S00_AXI_WDATA        (s0_wdata),
    .S00_AXI_WSTRB        (s0_wstrb),
    .S00_AXI_WLAST        (s0_wlast),
    .S00_AXI_WVALID       (s0_wvalid),
    .S00_AXI_WREADY       (s0_wready),
    .S00_AXI_BID          (s0_bid),
    .S00_AXI_BRESP        (s0_bresp),
    .S00_AXI_BVALID       (s0_bvalid),
    .S00_AXI_BREADY       (s0_bready),
    .S00_AXI_ARID         (s0_arid),
    .S00_AXI_ARADDR       (s0_araddr),
    .S00_AXI_ARLEN        (s0_arlen),
    .S00_AXI_ARSIZE       (s0_arsize),
    .S00_AXI_ARBURST      (s0_arburst),
    .S00_AXI_ARLOCK       (s0_arlock),
    .S00_AXI_ARCACHE      (s0_arcache),
    .S00_AXI_ARPROT       (s0_arprot),
    .S00_AXI_ARQOS        (4'b0),
    .S00_AXI_ARVALID      (s0_arvalid),
    .S00_AXI_ARREADY      (s0_arready),
    .S00_AXI_RID          (s0_rid),
    .S00_AXI_RDATA        (s0_rdata),
    .S00_AXI_RRESP        (s0_rresp),
    .S00_AXI_RLAST        (s0_rlast),
    .S00_AXI_RVALID       (s0_rvalid),
    .S00_AXI_RREADY       (s0_rready),

    .S01_AXI_ACLK         (aclk),
    .S01_AXI_ARESET_OUT_N (),
    .S01_AXI_AWID         (4'b0),
    .S01_AXI_AWADDR       (32'b0),
    .S01_AXI_AWLEN        (8'b0),
    .S01_AXI_AWSIZE       (3'b0),
    .S01_AXI_AWBURST      (2'b0),
    .S01_AXI_AWLOCK       (2'b0),
    .S01_AXI_AWCACHE      (4'b0),
    .S01_AXI_AWPROT       (3'b0),
    .S01_AXI_AWQOS        (4'b0),
    .S01_AXI_AWVALID      (1'b0),
    .S01_AXI_AWREADY      (),
    .S01_AXI_WDATA        (32'b0),
    .S01_AXI_WSTRB        (4'b0),
    .S01_AXI_WLAST        (1'b0),
    .S01_AXI_WVALID       (1'b0),
    .S01_AXI_WREADY       (),
    .S01_AXI_BID          (),
    .S01_AXI_BRESP        (),
    .S01_AXI_BVALID       (),
    .S01_AXI_BREADY       (1'b0),
    .S01_AXI_ARID         (4'b0),
    .S01_AXI_ARADDR       (vdma_mm2s_araddr),
    .S01_AXI_ARLEN        (vdma_mm2s_arlen),
    .S01_AXI_ARSIZE       (vdma_mm2s_arsize),
    .S01_AXI_ARBURST      (vdma_mm2s_arburst),
    .S01_AXI_ARLOCK       (2'b0),
    .S01_AXI_ARCACHE      (vdma_mm2s_arcache),
    .S01_AXI_ARPROT       (vdma_mm2s_arprot),
    .S01_AXI_ARQOS        (4'b0),
    .S01_AXI_ARVALID      (vdma_mm2s_arvalid),
    .S01_AXI_ARREADY      (vdma_mm2s_arready),
    .S01_AXI_RID          (),
    .S01_AXI_RDATA        (vdma_mm2s_rdata),
    .S01_AXI_RRESP        (vdma_mm2s_rresp),
    .S01_AXI_RLAST        (vdma_mm2s_rlast),
    .S01_AXI_RVALID       (vdma_mm2s_rvalid),
    .S01_AXI_RREADY       (vdma_mm2s_rready),

    .M00_AXI_ACLK         (aclk),
    .M00_AXI_ARESET_OUT_N (),
    .M00_AXI_AWID         (vga_ddr_awid),
    .M00_AXI_AWADDR       (vga_ddr_awaddr),
    .M00_AXI_AWLEN        (vga_ddr_awlen),
    .M00_AXI_AWSIZE       (vga_ddr_awsize),
    .M00_AXI_AWBURST      (vga_ddr_awburst),
    .M00_AXI_AWLOCK       (vga_ddr_awlock),
    .M00_AXI_AWCACHE      (vga_ddr_awcache),
    .M00_AXI_AWPROT       (vga_ddr_awprot),
    .M00_AXI_AWQOS        (),
    .M00_AXI_AWVALID      (vga_ddr_awvalid),
    .M00_AXI_AWREADY      (vga_ddr_awready),
    .M00_AXI_WDATA        (vga_ddr_wdata),
    .M00_AXI_WSTRB        (vga_ddr_wstrb),
    .M00_AXI_WLAST        (vga_ddr_wlast),
    .M00_AXI_WVALID       (vga_ddr_wvalid),
    .M00_AXI_WREADY       (vga_ddr_wready),
    .M00_AXI_BID          ({1'b0,vga_ddr_bid}),
    .M00_AXI_BRESP        (vga_ddr_bresp),
    .M00_AXI_BVALID       (vga_ddr_bvalid),
    .M00_AXI_BREADY       (vga_ddr_bready),
    .M00_AXI_ARID         (vga_ddr_arid),
    .M00_AXI_ARADDR       (vga_ddr_araddr),
    .M00_AXI_ARLEN        (vga_ddr_arlen),
    .M00_AXI_ARSIZE       (vga_ddr_arsize),
    .M00_AXI_ARBURST      (vga_ddr_arburst),
    .M00_AXI_ARLOCK       (vga_ddr_arlock),
    .M00_AXI_ARCACHE      (vga_ddr_arcache),
    .M00_AXI_ARPROT       (vga_ddr_arprot),
    .M00_AXI_ARQOS        (),
    .M00_AXI_ARVALID      (vga_ddr_arvalid),
    .M00_AXI_ARREADY      (vga_ddr_arready),
    .M00_AXI_RID          ({1'b0,vga_ddr_rid}),
    .M00_AXI_RDATA        (vga_ddr_rdata),
    .M00_AXI_RRESP        (vga_ddr_rresp),
    .M00_AXI_RLAST        (vga_ddr_rlast),
    .M00_AXI_RVALID       (vga_ddr_rvalid),
    .M00_AXI_RREADY       (vga_ddr_rready)
);
*/

//ddr3
wire   c1_sys_clk_i;
wire   c1_clk_ref_i;
wire   c1_sys_rst_i;
wire   c1_calib_done;
wire   c1_clk0;
wire   c1_rst0;
wire        ddr_aresetn;
reg         interconnect_aresetn;

clk_pll_33  clk_pll_33
 (
  // Clock out ports
  .clk_out1(cpu_clk),  //50MHz
  .clk_out2(uncore_clk), //33MHz
 // Clock in ports
  .clk_in1(clk)        //100MHz
 );

clk_wiz_0  clk_pll_1
(
    .clk_out1(c1_clk_ref_i),  //200MHz
    .clk_in1(clk)             //100MHz
);

assign c1_sys_clk_i      = clk;
assign c1_sys_rst_i      = resetn;
assign aclk              = uncore_clk;
//assign aclk              = c1_clk0;
// Reset to the AXI shim
reg c1_calib_done_0;
reg c1_calib_done_1;
reg c1_rst0_0;
reg c1_rst0_1;
reg interconnect_aresetn_0;
/*always @(posedge aclk)
begin
    c1_calib_done_0 <= c1_calib_done;
    c1_calib_done_1 <= c1_calib_done_0;
    c1_rst0_0       <= c1_rst0;
    c1_rst0_1       <= c1_rst0_0;

    interconnect_aresetn_0 <= ~c1_rst0_1 && c1_calib_done_1;
    interconnect_aresetn   <= interconnect_aresetn_0 ;
end*/
always @(posedge c1_clk0)
begin
    interconnect_aresetn <= ~c1_rst0 && c1_calib_done;
end

//axi 4x1: CPU, MAC, NAND DMA and VGA VDMA share DDR
axi_interconnect_0 mig_axi_interconnect (
    .INTERCONNECT_ACLK    (c1_clk0             ),
    .INTERCONNECT_ARESETN (interconnect_aresetn),
    .S00_AXI_ARESET_OUT_N (aresetn             ),
    .S00_AXI_ACLK         (aclk                ),
    .S00_AXI_AWID         (s0_awid[3:0]        ),
    .S00_AXI_AWADDR       (s0_awaddr           ),
    .S00_AXI_AWLEN        ({4'b0,s0_awlen}     ),
    .S00_AXI_AWSIZE       (s0_awsize           ),
    .S00_AXI_AWBURST      (s0_awburst          ),
    .S00_AXI_AWLOCK       (s0_awlock[0:0]      ),
    .S00_AXI_AWCACHE      (s0_awcache          ),
    .S00_AXI_AWPROT       (s0_awprot           ),
    .S00_AXI_AWQOS        (4'b0                ),
    .S00_AXI_AWVALID      (s0_awvalid          ),
    .S00_AXI_AWREADY      (s0_awready          ),
    .S00_AXI_WDATA        (s0_wdata            ),
    .S00_AXI_WSTRB        (s0_wstrb            ),
    .S00_AXI_WLAST        (s0_wlast            ),
    .S00_AXI_WVALID       (s0_wvalid           ),
    .S00_AXI_WREADY       (s0_wready           ),
    .S00_AXI_BID          (s0_bid[3:0]         ),
    .S00_AXI_BRESP        (s0_bresp            ),
    .S00_AXI_BVALID       (s0_bvalid           ),
    .S00_AXI_BREADY       (s0_bready           ),
    .S00_AXI_ARID         (s0_arid[3:0]        ),
    .S00_AXI_ARADDR       (s0_araddr           ),
    .S00_AXI_ARLEN        ({4'b0,s0_arlen}     ),
    .S00_AXI_ARSIZE       (s0_arsize           ),
    .S00_AXI_ARBURST      (s0_arburst          ),
    .S00_AXI_ARLOCK       (s0_arlock[0:0]      ),
    .S00_AXI_ARCACHE      (s0_arcache          ),
    .S00_AXI_ARPROT       (s0_arprot           ),
    .S00_AXI_ARQOS        (4'b0                ),
    .S00_AXI_ARVALID      (s0_arvalid          ),
    .S00_AXI_ARREADY      (s0_arready          ),
    .S00_AXI_RID          (s0_rid[3:0]         ),
    .S00_AXI_RDATA        (s0_rdata            ),
    .S00_AXI_RRESP        (s0_rresp            ),
    .S00_AXI_RLAST        (s0_rlast            ),
    .S00_AXI_RVALID       (s0_rvalid           ),
    .S00_AXI_RREADY       (s0_rready           ),

    .S01_AXI_ARESET_OUT_N (                    ),
    .S01_AXI_ACLK         (aclk                ),
    .S01_AXI_AWID         (mac_m_awid[3:0]     ),
    .S01_AXI_AWADDR       (mac_m_awaddr        ),
    .S01_AXI_AWLEN        ({4'b0,mac_m_awlen}  ),
    .S01_AXI_AWSIZE       (mac_m_awsize        ),
    .S01_AXI_AWBURST      (mac_m_awburst       ),
    .S01_AXI_AWLOCK       (mac_m_awlock[0:0]   ),
    .S01_AXI_AWCACHE      (mac_m_awcache       ),
    .S01_AXI_AWPROT       (mac_m_awprot        ),
    .S01_AXI_AWQOS        (4'b0                ),
    .S01_AXI_AWVALID      (mac_m_awvalid       ),
    .S01_AXI_AWREADY      (mac_m_awready       ),
    .S01_AXI_WDATA        (mac_m_wdata         ),
    .S01_AXI_WSTRB        (mac_m_wstrb         ),
    .S01_AXI_WLAST        (mac_m_wlast         ),
    .S01_AXI_WVALID       (mac_m_wvalid        ),
    .S01_AXI_WREADY       (mac_m_wready        ),
    .S01_AXI_BID          (mac_m_bid[3:0]      ),
    .S01_AXI_BRESP        (mac_m_bresp         ),
    .S01_AXI_BVALID       (mac_m_bvalid        ),
    .S01_AXI_BREADY       (mac_m_bready        ),
    .S01_AXI_ARID         (mac_m_arid[3:0]     ),
    .S01_AXI_ARADDR       (mac_m_araddr        ),
    .S01_AXI_ARLEN        ({4'b0,mac_m_arlen}  ),
    .S01_AXI_ARSIZE       (mac_m_arsize        ),
    .S01_AXI_ARBURST      (mac_m_arburst       ),
    .S01_AXI_ARLOCK       (mac_m_arlock[0:0]   ),
    .S01_AXI_ARCACHE      (mac_m_arcache       ),
    .S01_AXI_ARPROT       (mac_m_arprot        ),
    .S01_AXI_ARQOS        (4'b0                ),
    .S01_AXI_ARVALID      (mac_m_arvalid       ),
    .S01_AXI_ARREADY      (mac_m_arready       ),
    .S01_AXI_RID          (mac_m_rid[3:0]      ),
    .S01_AXI_RDATA        (mac_m_rdata         ),
    .S01_AXI_RRESP        (mac_m_rresp         ),
    .S01_AXI_RLAST        (mac_m_rlast         ),
    .S01_AXI_RVALID       (mac_m_rvalid        ),
    .S01_AXI_RREADY       (mac_m_rready        ),

    .S02_AXI_ARESET_OUT_N (                    ),
    .S02_AXI_ACLK         (aclk                ),
    .S02_AXI_AWID         (dma0_awid           ),
    .S02_AXI_AWADDR       (dma0_awaddr         ),
    .S02_AXI_AWLEN        ({4'd0,dma0_awlen}   ),
    .S02_AXI_AWSIZE       (dma0_awsize         ),
    .S02_AXI_AWBURST      (dma0_awburst        ),
    .S02_AXI_AWLOCK       (dma0_awlock[0:0]    ),
    .S02_AXI_AWCACHE      (dma0_awcache        ),
    .S02_AXI_AWPROT       (dma0_awprot         ),
    .S02_AXI_AWQOS        (4'b0                ),
    .S02_AXI_AWVALID      (dma0_awvalid        ),
    .S02_AXI_AWREADY      (dma0_awready        ),
    .S02_AXI_WDATA        (dma0_wdata          ),
    .S02_AXI_WSTRB        (dma0_wstrb          ),
    .S02_AXI_WLAST        (dma0_wlast          ),
    .S02_AXI_WVALID       (dma0_wvalid         ),
    .S02_AXI_WREADY       (dma0_wready         ),
    .S02_AXI_BID          (dma0_bid            ),
    .S02_AXI_BRESP        (dma0_bresp          ),
    .S02_AXI_BVALID       (dma0_bvalid         ),
    .S02_AXI_BREADY       (dma0_bready         ),
    .S02_AXI_ARID         (dma0_arid           ),
    .S02_AXI_ARADDR       (dma0_araddr         ),
    .S02_AXI_ARLEN        ({4'd0,dma0_arlen}   ),
    .S02_AXI_ARSIZE       (dma0_arsize         ),
    .S02_AXI_ARBURST      (dma0_arburst        ),
    .S02_AXI_ARLOCK       (dma0_arlock[0:0]    ),
    .S02_AXI_ARCACHE      (dma0_arcache        ),
    .S02_AXI_ARPROT       (dma0_arprot         ),
    .S02_AXI_ARQOS        (4'b0                ),
    .S02_AXI_ARVALID      (dma0_arvalid        ),
    .S02_AXI_ARREADY      (dma0_arready        ),
    .S02_AXI_RID          (dma0_rid            ),
    .S02_AXI_RDATA        (dma0_rdata          ),
    .S02_AXI_RRESP        (dma0_rresp          ),
    .S02_AXI_RLAST        (dma0_rlast          ),
    .S02_AXI_RVALID       (dma0_rvalid         ),
    .S02_AXI_RREADY       (dma0_rready         ),

    // S03: VGA VDMA MM2S, AXI4 read-only traffic. Write channels are inactive.
    .S03_AXI_ARESET_OUT_N (                    ),
    .S03_AXI_ACLK         (aclk                ),
    .S03_AXI_AWID         (4'b0                ),
    .S03_AXI_AWADDR       (32'b0               ),
    .S03_AXI_AWLEN        (8'b0                ),
    .S03_AXI_AWSIZE       (3'b0                ),
    .S03_AXI_AWBURST      (2'b0                ),
    .S03_AXI_AWLOCK       (1'b0                ),
    .S03_AXI_AWCACHE      (4'b0                ),
    .S03_AXI_AWPROT       (3'b0                ),
    .S03_AXI_AWQOS        (4'b0                ),
    .S03_AXI_AWVALID      (1'b0                ),
    .S03_AXI_AWREADY      (                    ),
    .S03_AXI_WDATA        (32'b0               ),
    .S03_AXI_WSTRB        (4'b0                ),
    .S03_AXI_WLAST        (1'b0                ),
    .S03_AXI_WVALID       (1'b0                ),
    .S03_AXI_WREADY       (                    ),
    .S03_AXI_BID          (                    ),
    .S03_AXI_BRESP        (                    ),
    .S03_AXI_BVALID       (                    ),
    .S03_AXI_BREADY       (1'b0                ),
    .S03_AXI_ARID         (4'b0                ),
    .S03_AXI_ARADDR       (vdma_mm2s_araddr    ),
    .S03_AXI_ARLEN        (vdma_mm2s_arlen     ),
    .S03_AXI_ARSIZE       (vdma_mm2s_arsize    ),
    .S03_AXI_ARBURST      (vdma_mm2s_arburst   ),
    .S03_AXI_ARLOCK       (1'b0                ),
    .S03_AXI_ARCACHE      (vdma_mm2s_arcache   ),
    .S03_AXI_ARPROT       (vdma_mm2s_arprot    ),
    .S03_AXI_ARQOS        (4'b0                ),
    .S03_AXI_ARVALID      (vdma_mm2s_arvalid   ),
    .S03_AXI_ARREADY      (vdma_mm2s_arready   ),
    .S03_AXI_RID          (                    ),
    .S03_AXI_RDATA        (vdma_mm2s_rdata     ),
    .S03_AXI_RRESP        (vdma_mm2s_rresp     ),
    .S03_AXI_RLAST        (vdma_mm2s_rlast     ),
    .S03_AXI_RVALID       (vdma_mm2s_rvalid    ),
    .S03_AXI_RREADY       (vdma_mm2s_rready    ),

    .M00_AXI_ARESET_OUT_N (ddr_aresetn         ),
    .M00_AXI_ACLK         (c1_clk0             ),
    .M00_AXI_AWID         (mig_awid            ),
    .M00_AXI_AWADDR       (mig_awaddr          ),
    .M00_AXI_AWLEN        ({mig_awlen}         ),
    .M00_AXI_AWSIZE       (mig_awsize          ),
    .M00_AXI_AWBURST      (mig_awburst         ),
    .M00_AXI_AWLOCK       (mig_awlock[0:0]     ),
    .M00_AXI_AWCACHE      (mig_awcache         ),
    .M00_AXI_AWPROT       (mig_awprot          ),
    .M00_AXI_AWQOS        (                    ),
    .M00_AXI_AWVALID      (mig_awvalid         ),
    .M00_AXI_AWREADY      (mig_awready         ),
    .M00_AXI_WDATA        (mig_wdata           ),
    .M00_AXI_WSTRB        (mig_wstrb           ),
    .M00_AXI_WLAST        (mig_wlast           ),
    .M00_AXI_WVALID       (mig_wvalid          ),
    .M00_AXI_WREADY       (mig_wready          ),
    .M00_AXI_BID          (mig_bid             ),
    .M00_AXI_BRESP        (mig_bresp           ),
    .M00_AXI_BVALID       (mig_bvalid          ),
    .M00_AXI_BREADY       (mig_bready          ),
    .M00_AXI_ARID         (mig_arid            ),
    .M00_AXI_ARADDR       (mig_araddr          ),
    .M00_AXI_ARLEN        ({mig_arlen}         ),
    .M00_AXI_ARSIZE       (mig_arsize          ),
    .M00_AXI_ARBURST      (mig_arburst         ),
    .M00_AXI_ARLOCK       (mig_arlock[0:0]     ),
    .M00_AXI_ARCACHE      (mig_arcache         ),
    .M00_AXI_ARPROT       (mig_arprot          ),
    .M00_AXI_ARQOS        (                    ),
    .M00_AXI_ARVALID      (mig_arvalid         ),
    .M00_AXI_ARREADY      (mig_arready         ),
    .M00_AXI_RID          (mig_rid             ),
    .M00_AXI_RDATA        (mig_rdata           ),
    .M00_AXI_RRESP        (mig_rresp           ),
    .M00_AXI_RLAST        (mig_rlast           ),
    .M00_AXI_RVALID       (mig_rvalid          ),
    .M00_AXI_RREADY       (mig_rready          )
);
//ddr3 controller
mig_axi_32 mig_axi (
    // Inouts
    .ddr3_dq             (ddr3_dq         ),  
    .ddr3_dqs_p          (ddr3_dqs_p      ),    // for X16 parts 
    .ddr3_dqs_n          (ddr3_dqs_n      ),  // for X16 parts
    // Outputs
    .ddr3_addr           (ddr3_addr       ),  
    .ddr3_ba             (ddr3_ba         ),
    .ddr3_ras_n          (ddr3_ras_n      ),                        
    .ddr3_cas_n          (ddr3_cas_n      ),                        
    .ddr3_we_n           (ddr3_we_n       ),                          
    .ddr3_reset_n        (ddr3_reset_n    ),
    .ddr3_ck_p           (ddr3_ck_p       ),                          
    .ddr3_ck_n           (ddr3_ck_n       ),       
    .ddr3_cke            (ddr3_cke        ),                          
    .ddr3_dm             (ddr3_dm         ),
    .ddr3_odt            (ddr3_odt        ),
    
	.ui_clk              (c1_clk0         ),
    .ui_clk_sync_rst     (c1_rst0         ),
 
    .sys_clk_i           (c1_sys_clk_i    ),
    .sys_rst             (c1_sys_rst_i    ),                        
    .init_calib_complete (c1_calib_done   ),
    .clk_ref_i           (c1_clk_ref_i    ),
    .mmcm_locked         (                ),
	
	.app_sr_active       (                ),
    .app_ref_ack         (                ),
    .app_zq_ack          (                ),
    .app_sr_req          (1'b0            ),
    .app_ref_req         (1'b0            ),
    .app_zq_req          (1'b0            ),
    
    .aresetn             (ddr_aresetn     ),
    .s_axi_awid          (mig_awid        ),
    .s_axi_awaddr        (mig_awaddr[26:0]),
    .s_axi_awlen         ({mig_awlen}     ),
    .s_axi_awsize        (mig_awsize      ),
    .s_axi_awburst       (mig_awburst     ),
    .s_axi_awlock        (mig_awlock[0:0] ),
    .s_axi_awcache       (mig_awcache     ),
    .s_axi_awprot        (mig_awprot      ),
    .s_axi_awqos         (4'b0            ),
    .s_axi_awvalid       (mig_awvalid     ),
    .s_axi_awready       (mig_awready     ),
    .s_axi_wdata         (mig_wdata       ),
    .s_axi_wstrb         (mig_wstrb       ),
    .s_axi_wlast         (mig_wlast       ),
    .s_axi_wvalid        (mig_wvalid      ),
    .s_axi_wready        (mig_wready      ),
    .s_axi_bid           (mig_bid         ),
    .s_axi_bresp         (mig_bresp       ),
    .s_axi_bvalid        (mig_bvalid      ),
    .s_axi_bready        (mig_bready      ),
    .s_axi_arid          (mig_arid        ),
    .s_axi_araddr        (mig_araddr[26:0]),
    .s_axi_arlen         ({mig_arlen}     ),
    .s_axi_arsize        (mig_arsize      ),
    .s_axi_arburst       (mig_arburst     ),
    .s_axi_arlock        (mig_arlock[0:0] ),
    .s_axi_arcache       (mig_arcache     ),
    .s_axi_arprot        (mig_arprot      ),
    .s_axi_arqos         (4'b0            ),
    .s_axi_arvalid       (mig_arvalid     ),
    .s_axi_arready       (mig_arready     ),
    .s_axi_rid           (mig_rid         ),
    .s_axi_rdata         (mig_rdata       ),
    .s_axi_rresp         (mig_rresp       ),
    .s_axi_rlast         (mig_rlast       ),
    .s_axi_rvalid        (mig_rvalid      ),
    .s_axi_rready        (mig_rready      )
);

//DMA
dma_master DMA_MASTER0
(
.clk                (aclk                   ),
.rst_n		        (aresetn                ),
.awid               (dma0_awid              ), 
.awaddr             (dma0_awaddr            ), 
.awlen              (dma0_awlen             ), 
.awsize             (dma0_awsize            ), 
.awburst            (dma0_awburst           ),
.awlock             (dma0_awlock            ), 
.awcache            (dma0_awcache           ), 
.awprot             (dma0_awprot            ), 
.awvalid            (dma0_awvalid           ), 
.awready            (dma0_awready           ), 
.wid                (dma0_wid               ), 
.wdata              (dma0_wdata             ), 
.wstrb              (dma0_wstrb             ), 
.wlast              (dma0_wlast             ), 
.wvalid             (dma0_wvalid            ), 
.wready             (dma0_wready            ),
.bid                (dma0_bid               ), 
.bresp              (dma0_bresp             ), 
.bvalid             (dma0_bvalid            ), 
.bready             (dma0_bready            ),
.arid               (dma0_arid              ), 
.araddr             (dma0_araddr            ), 
.arlen              (dma0_arlen             ), 
.arsize             (dma0_arsize            ), 
.arburst            (dma0_arburst           ), 
.arlock             (dma0_arlock            ), 
.arcache            (dma0_arcache           ),
.arprot             (dma0_arprot            ),
.arvalid            (dma0_arvalid           ), 
.arready            (dma0_arready           ),
.rid                (dma0_rid               ), 
.rdata              (dma0_rdata             ), 
.rresp              (dma0_rresp             ),
.rlast              (dma0_rlast             ), 
.rvalid             (dma0_rvalid            ), 
.rready             (dma0_rready            ),

.dma_int            (dma_int                ), 
.dma_req_in         (dma_req                ), 
.dma_ack_out        (dma_ack                ), 

.dma_gnt            (dma0_gnt               ),
.apb_rw             (apb_rw_dma0            ),
.apb_psel           (apb_psel_dma0          ),
.apb_valid_req      (apb_start_dma0	        ),
.apb_penable        (apb_penable_dma0       ),
.apb_addr           (apb_addr_dma0          ),
.apb_wdata          (apb_wdata_dma0         ),
.apb_rdata          (apb_rdata_dma0         ),

.order_addr_in      (order_addr_in          ),
.write_dma_end      (write_dma_end          ),
.finish_read_order  (finish_read_order      ) 
);

//AXI2APB
axi2apb_misc APB_DEV 
(
.clk                (aclk               ),
.rst_n              (aresetn            ),

.axi_s_awid         (apb_s_awid         ),
.axi_s_awaddr       (apb_s_awaddr       ),
.axi_s_awlen        (apb_s_awlen        ),
.axi_s_awsize       (apb_s_awsize       ),
.axi_s_awburst      (apb_s_awburst      ),
.axi_s_awlock       (apb_s_awlock       ),
.axi_s_awcache      (apb_s_awcache      ),
.axi_s_awprot       (apb_s_awprot       ),
.axi_s_awvalid      (apb_s_awvalid      ),
.axi_s_awready      (apb_s_awready      ),
.axi_s_wid          (apb_s_wid          ),
.axi_s_wdata        (apb_s_wdata        ),
.axi_s_wstrb        (apb_s_wstrb        ),
.axi_s_wlast        (apb_s_wlast        ),
.axi_s_wvalid       (apb_s_wvalid       ),
.axi_s_wready       (apb_s_wready       ),
.axi_s_bid          (apb_s_bid          ),
.axi_s_bresp        (apb_s_bresp        ),
.axi_s_bvalid       (apb_s_bvalid       ),
.axi_s_bready       (apb_s_bready       ),
.axi_s_arid         (apb_s_arid         ),
.axi_s_araddr       (apb_s_araddr       ),
.axi_s_arlen        (apb_s_arlen        ),
.axi_s_arsize       (apb_s_arsize       ),
.axi_s_arburst      (apb_s_arburst      ),
.axi_s_arlock       (apb_s_arlock       ),
.axi_s_arcache      (apb_s_arcache      ),
.axi_s_arprot       (apb_s_arprot       ),
.axi_s_arvalid      (apb_s_arvalid      ),
.axi_s_arready      (apb_s_arready      ),
.axi_s_rid          (apb_s_rid          ),
.axi_s_rdata        (apb_s_rdata        ),
.axi_s_rresp        (apb_s_rresp        ),
.axi_s_rlast        (apb_s_rlast        ),
.axi_s_rvalid       (apb_s_rvalid       ),
.axi_s_rready       (apb_s_rready       ),

.apb_rw_dma         (apb_rw_dma0        ),
.apb_psel_dma       (apb_psel_dma0      ),
.apb_enab_dma       (apb_penable_dma0   ),
.apb_addr_dma       (apb_addr_dma0[19:0]),
.apb_valid_dma      (apb_start_dma0     ),
.apb_wdata_dma      (apb_wdata_dma0     ),
.apb_rdata_dma      (apb_rdata_dma0     ),
.apb_ready_dma      (                   ), //output, no use
.dma_grant          (dma0_gnt           ),

.dma_req_o          (dma_req            ),
.dma_ack_i          (dma_ack            ),

//UART0
.uart0_txd_i        (uart0_txd_i      ),
.uart0_txd_o        (uart0_txd_o      ),
.uart0_txd_oe       (uart0_txd_oe     ),
.uart0_rxd_i        (uart0_rxd_i      ),
.uart0_rxd_o        (uart0_rxd_o      ),
.uart0_rxd_oe       (uart0_rxd_oe     ),
.uart0_rts_o        (uart0_rts_o      ),
.uart0_dtr_o        (uart0_dtr_o      ),
.uart0_cts_i        (uart0_cts_i      ),
.uart0_dsr_i        (uart0_dsr_i      ),
.uart0_dcd_i        (uart0_dcd_i      ),
.uart0_ri_i         (uart0_ri_i       ),
.uart0_int          (uart0_int        ),

.nand_type          (2'h2             ),  //1Gbit
.nand_cle           (nand_cle         ),
.nand_ale           (nand_ale         ),
.nand_rdy           (nand_rdy         ),
.nand_rd            (nand_rd          ),
.nand_ce            (nand_ce          ),
.nand_wr            (nand_wr          ),
.nand_dat_i         (nand_dat_i       ),
.nand_dat_o         (nand_dat_o       ),
.nand_dat_oe        (nand_dat_oe      ),

.nand_int           (nand_int         )
);
endmodule
