module AXI3Crossbar2to1(
  input  [3:0]  io_in_icache_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [31:0] io_in_icache_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [7:0]  io_in_icache_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [2:0]  io_in_icache_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_icache_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_icache_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [3:0]  io_in_icache_r_data_rid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [31:0] io_in_icache_r_data_rdata, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_icache_r_data_rlast, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_icache_r_data_rvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_icache_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [3:0]  io_in_dcache_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [31:0] io_in_dcache_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [7:0]  io_in_dcache_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [2:0]  io_in_dcache_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_dcache_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_dcache_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [3:0]  io_in_dcache_aw_data_awid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [31:0] io_in_dcache_aw_data_awaddr, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [7:0]  io_in_dcache_aw_data_awlen, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [2:0]  io_in_dcache_aw_data_awsize, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_dcache_aw_data_awvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_dcache_aw_awready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [3:0]  io_in_dcache_w_data_wid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [31:0] io_in_dcache_w_data_wdata, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [3:0]  io_in_dcache_w_data_wstrb, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_dcache_w_data_wlast, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_dcache_w_data_wvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_dcache_w_wready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [3:0]  io_in_dcache_r_data_rid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [31:0] io_in_dcache_r_data_rdata, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_dcache_r_data_rlast, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_dcache_r_data_rvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_dcache_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [3:0]  io_in_dcache_b_data_bid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_in_dcache_b_data_bvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_in_dcache_b_bready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [3:0]  io_out_ar_data_arid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [31:0] io_out_ar_data_araddr, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [7:0]  io_out_ar_data_arlen, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [2:0]  io_out_ar_data_arsize, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_out_ar_data_arvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_out_ar_arready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [3:0]  io_out_aw_data_awid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [31:0] io_out_aw_data_awaddr, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [7:0]  io_out_aw_data_awlen, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [2:0]  io_out_aw_data_awsize, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_out_aw_data_awvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_out_aw_awready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [3:0]  io_out_w_data_wid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [31:0] io_out_w_data_wdata, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output [3:0]  io_out_w_data_wstrb, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_out_w_data_wlast, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_out_w_data_wvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_out_w_wready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [3:0]  io_out_r_data_rid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [31:0] io_out_r_data_rdata, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_out_r_data_rlast, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_out_r_data_rvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_out_r_rready, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input  [3:0]  io_out_b_data_bid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  input         io_out_b_data_bvalid, // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
  output        io_out_b_bready // @[src/main/scala/axi/AXI3Crossbar.scala 24:14]
);
  wire  arArb_io_in_0_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire  arArb_io_in_0_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [3:0] arArb_io_in_0_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [31:0] arArb_io_in_0_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [7:0] arArb_io_in_0_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [2:0] arArb_io_in_0_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire  arArb_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire  arArb_io_in_1_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [3:0] arArb_io_in_1_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [31:0] arArb_io_in_1_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [7:0] arArb_io_in_1_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [2:0] arArb_io_in_1_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire  arArb_io_out_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire  arArb_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [3:0] arArb_io_out_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [31:0] arArb_io_out_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [7:0] arArb_io_out_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire [2:0] arArb_io_out_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
  wire  awArb_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire  awArb_io_in_1_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [3:0] awArb_io_in_1_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [31:0] awArb_io_in_1_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [7:0] awArb_io_in_1_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [2:0] awArb_io_in_1_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire  awArb_io_out_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire  awArb_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [3:0] awArb_io_out_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [31:0] awArb_io_out_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [7:0] awArb_io_out_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire [2:0] awArb_io_out_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
  wire  wArb_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire  wArb_io_in_1_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire [3:0] wArb_io_in_1_bits_wid; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire [31:0] wArb_io_in_1_bits_wdata; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire [3:0] wArb_io_in_1_bits_wstrb; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire  wArb_io_in_1_bits_wlast; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire  wArb_io_out_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire  wArb_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire [3:0] wArb_io_out_bits_wid; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire [31:0] wArb_io_out_bits_wdata; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire [3:0] wArb_io_out_bits_wstrb; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire  wArb_io_out_bits_wlast; // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
  wire  rToIcache = io_out_r_data_rid >= 4'h4; // @[src/main/scala/axi/AXI3Crossbar.scala 32:45]
  wire  bToIcache = io_out_b_data_bid >= 4'h4; // @[src/main/scala/axi/AXI3Crossbar.scala 32:45]
  Arbiter arArb ( // @[src/main/scala/axi/AXI3Crossbar.scala 37:21]
    .io_in_0_ready(arArb_io_in_0_ready),
    .io_in_0_valid(arArb_io_in_0_valid),
    .io_in_0_bits_arid(arArb_io_in_0_bits_arid),
    .io_in_0_bits_araddr(arArb_io_in_0_bits_araddr),
    .io_in_0_bits_arlen(arArb_io_in_0_bits_arlen),
    .io_in_0_bits_arsize(arArb_io_in_0_bits_arsize),
    .io_in_1_ready(arArb_io_in_1_ready),
    .io_in_1_valid(arArb_io_in_1_valid),
    .io_in_1_bits_arid(arArb_io_in_1_bits_arid),
    .io_in_1_bits_araddr(arArb_io_in_1_bits_araddr),
    .io_in_1_bits_arlen(arArb_io_in_1_bits_arlen),
    .io_in_1_bits_arsize(arArb_io_in_1_bits_arsize),
    .io_out_ready(arArb_io_out_ready),
    .io_out_valid(arArb_io_out_valid),
    .io_out_bits_arid(arArb_io_out_bits_arid),
    .io_out_bits_araddr(arArb_io_out_bits_araddr),
    .io_out_bits_arlen(arArb_io_out_bits_arlen),
    .io_out_bits_arsize(arArb_io_out_bits_arsize)
  );
  Arbiter_1 awArb ( // @[src/main/scala/axi/AXI3Crossbar.scala 80:21]
    .io_in_1_ready(awArb_io_in_1_ready),
    .io_in_1_valid(awArb_io_in_1_valid),
    .io_in_1_bits_awid(awArb_io_in_1_bits_awid),
    .io_in_1_bits_awaddr(awArb_io_in_1_bits_awaddr),
    .io_in_1_bits_awlen(awArb_io_in_1_bits_awlen),
    .io_in_1_bits_awsize(awArb_io_in_1_bits_awsize),
    .io_out_ready(awArb_io_out_ready),
    .io_out_valid(awArb_io_out_valid),
    .io_out_bits_awid(awArb_io_out_bits_awid),
    .io_out_bits_awaddr(awArb_io_out_bits_awaddr),
    .io_out_bits_awlen(awArb_io_out_bits_awlen),
    .io_out_bits_awsize(awArb_io_out_bits_awsize)
  );
  Arbiter_2 wArb ( // @[src/main/scala/axi/AXI3Crossbar.scala 101:20]
    .io_in_1_ready(wArb_io_in_1_ready),
    .io_in_1_valid(wArb_io_in_1_valid),
    .io_in_1_bits_wid(wArb_io_in_1_bits_wid),
    .io_in_1_bits_wdata(wArb_io_in_1_bits_wdata),
    .io_in_1_bits_wstrb(wArb_io_in_1_bits_wstrb),
    .io_in_1_bits_wlast(wArb_io_in_1_bits_wlast),
    .io_out_ready(wArb_io_out_ready),
    .io_out_valid(wArb_io_out_valid),
    .io_out_bits_wid(wArb_io_out_bits_wid),
    .io_out_bits_wdata(wArb_io_out_bits_wdata),
    .io_out_bits_wstrb(wArb_io_out_bits_wstrb),
    .io_out_bits_wlast(wArb_io_out_bits_wlast)
  );
  assign io_in_icache_ar_arready = arArb_io_in_0_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 51:27]
  assign io_in_icache_r_data_rid = io_out_r_data_rid; // @[src/main/scala/axi/AXI3Crossbar.scala 64:29]
  assign io_in_icache_r_data_rdata = io_out_r_data_rdata; // @[src/main/scala/axi/AXI3Crossbar.scala 65:29]
  assign io_in_icache_r_data_rlast = io_out_r_data_rlast; // @[src/main/scala/axi/AXI3Crossbar.scala 67:29]
  assign io_in_icache_r_data_rvalid = io_out_r_data_rvalid & rToIcache; // @[src/main/scala/axi/AXI3Crossbar.scala 60:54]
  assign io_in_dcache_ar_arready = arArb_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 52:27]
  assign io_in_dcache_aw_awready = awArb_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 92:27]
  assign io_in_dcache_w_wready = wArb_io_in_1_ready; // @[src/main/scala/axi/AXI3Crossbar.scala 113:25]
  assign io_in_dcache_r_data_rid = io_out_r_data_rid; // @[src/main/scala/axi/AXI3Crossbar.scala 69:29]
  assign io_in_dcache_r_data_rdata = io_out_r_data_rdata; // @[src/main/scala/axi/AXI3Crossbar.scala 70:29]
  assign io_in_dcache_r_data_rlast = io_out_r_data_rlast; // @[src/main/scala/axi/AXI3Crossbar.scala 72:29]
  assign io_in_dcache_r_data_rvalid = io_out_r_data_rvalid & ~rToIcache; // @[src/main/scala/axi/AXI3Crossbar.scala 61:54]
  assign io_in_dcache_b_data_bid = io_out_b_data_bid; // @[src/main/scala/axi/AXI3Crossbar.scala 126:29]
  assign io_in_dcache_b_data_bvalid = io_out_b_data_bvalid & ~bToIcache; // @[src/main/scala/axi/AXI3Crossbar.scala 121:54]
  assign io_out_ar_data_arid = arArb_io_out_bits_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 46:18]
  assign io_out_ar_data_araddr = arArb_io_out_bits_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 46:18]
  assign io_out_ar_data_arlen = arArb_io_out_bits_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 46:18]
  assign io_out_ar_data_arsize = arArb_io_out_bits_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 46:18]
  assign io_out_ar_data_arvalid = arArb_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 47:26]
  assign io_out_aw_data_awid = awArb_io_out_bits_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 87:18]
  assign io_out_aw_data_awaddr = awArb_io_out_bits_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 87:18]
  assign io_out_aw_data_awlen = awArb_io_out_bits_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 87:18]
  assign io_out_aw_data_awsize = awArb_io_out_bits_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 87:18]
  assign io_out_aw_data_awvalid = awArb_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 88:26]
  assign io_out_w_data_wid = wArb_io_out_bits_wid; // @[src/main/scala/axi/AXI3Crossbar.scala 108:17]
  assign io_out_w_data_wdata = wArb_io_out_bits_wdata; // @[src/main/scala/axi/AXI3Crossbar.scala 108:17]
  assign io_out_w_data_wstrb = wArb_io_out_bits_wstrb; // @[src/main/scala/axi/AXI3Crossbar.scala 108:17]
  assign io_out_w_data_wlast = wArb_io_out_bits_wlast; // @[src/main/scala/axi/AXI3Crossbar.scala 108:17]
  assign io_out_w_data_wvalid = wArb_io_out_valid; // @[src/main/scala/axi/AXI3Crossbar.scala 109:24]
  assign io_out_r_rready = rToIcache ? io_in_icache_r_rready : io_in_dcache_r_rready; // @[src/main/scala/axi/AXI3Crossbar.scala 75:25]
  assign io_out_b_bready = bToIcache ? 1'h0 : io_in_dcache_b_bready; // @[src/main/scala/axi/AXI3Crossbar.scala 129:25]
  assign arArb_io_in_0_valid = io_in_icache_ar_data_arvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 40:24]
  assign arArb_io_in_0_bits_arid = io_in_icache_ar_data_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 41:24]
  assign arArb_io_in_0_bits_araddr = io_in_icache_ar_data_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 41:24]
  assign arArb_io_in_0_bits_arlen = io_in_icache_ar_data_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 41:24]
  assign arArb_io_in_0_bits_arsize = io_in_icache_ar_data_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 41:24]
  assign arArb_io_in_1_valid = io_in_dcache_ar_data_arvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 42:24]
  assign arArb_io_in_1_bits_arid = io_in_dcache_ar_data_arid; // @[src/main/scala/axi/AXI3Crossbar.scala 43:24]
  assign arArb_io_in_1_bits_araddr = io_in_dcache_ar_data_araddr; // @[src/main/scala/axi/AXI3Crossbar.scala 43:24]
  assign arArb_io_in_1_bits_arlen = io_in_dcache_ar_data_arlen; // @[src/main/scala/axi/AXI3Crossbar.scala 43:24]
  assign arArb_io_in_1_bits_arsize = io_in_dcache_ar_data_arsize; // @[src/main/scala/axi/AXI3Crossbar.scala 43:24]
  assign arArb_io_out_ready = io_out_ar_arready; // @[src/main/scala/axi/AXI3Crossbar.scala 50:22]
  assign awArb_io_in_1_valid = io_in_dcache_aw_data_awvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 84:24]
  assign awArb_io_in_1_bits_awid = io_in_dcache_aw_data_awid; // @[src/main/scala/axi/AXI3Crossbar.scala 85:24]
  assign awArb_io_in_1_bits_awaddr = io_in_dcache_aw_data_awaddr; // @[src/main/scala/axi/AXI3Crossbar.scala 85:24]
  assign awArb_io_in_1_bits_awlen = io_in_dcache_aw_data_awlen; // @[src/main/scala/axi/AXI3Crossbar.scala 85:24]
  assign awArb_io_in_1_bits_awsize = io_in_dcache_aw_data_awsize; // @[src/main/scala/axi/AXI3Crossbar.scala 85:24]
  assign awArb_io_out_ready = io_out_aw_awready; // @[src/main/scala/axi/AXI3Crossbar.scala 90:22]
  assign wArb_io_in_1_valid = io_in_dcache_w_data_wvalid; // @[src/main/scala/axi/AXI3Crossbar.scala 105:23]
  assign wArb_io_in_1_bits_wid = io_in_dcache_w_data_wid; // @[src/main/scala/axi/AXI3Crossbar.scala 106:23]
  assign wArb_io_in_1_bits_wdata = io_in_dcache_w_data_wdata; // @[src/main/scala/axi/AXI3Crossbar.scala 106:23]
  assign wArb_io_in_1_bits_wstrb = io_in_dcache_w_data_wstrb; // @[src/main/scala/axi/AXI3Crossbar.scala 106:23]
  assign wArb_io_in_1_bits_wlast = io_in_dcache_w_data_wlast; // @[src/main/scala/axi/AXI3Crossbar.scala 106:23]
  assign wArb_io_out_ready = io_out_w_wready; // @[src/main/scala/axi/AXI3Crossbar.scala 111:21]
endmodule
