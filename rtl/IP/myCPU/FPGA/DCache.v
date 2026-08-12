module DCache(
  input         clock,
  input         reset,
  output        io_loadReq_ready, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_loadReq_valid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [3:0]  io_loadReq_bits_lqIdx, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [5:0]  io_loadReq_bits_robIdx_value, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_loadReq_bits_robIdx_flag, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [31:0] io_loadReq_bits_paddr, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_loadReq_bits_cacheable, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [3:0]  io_loadReq_bits_lsuOp, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_loadResp_valid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [3:0]  io_loadResp_bits_lqIdx, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [31:0] io_loadResp_bits_data, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_storeReq_ready, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_storeReq_valid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [31:0] io_storeReq_bits_paddr, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [31:0] io_storeReq_bits_data, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [3:0]  io_storeReq_bits_lsuOp, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_storeReq_bits_cacheable, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [3:0]  io_storeReq_bits_sqIdx, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_storeAck_valid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [3:0]  io_storeAck_bits_sqIdx, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [3:0]  io_axi_ar_data_arid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [31:0] io_axi_ar_data_araddr, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [7:0]  io_axi_ar_data_arlen, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [2:0]  io_axi_ar_data_arsize, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_axi_ar_data_arvalid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_axi_ar_arready, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [3:0]  io_axi_aw_data_awid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [31:0] io_axi_aw_data_awaddr, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [7:0]  io_axi_aw_data_awlen, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [2:0]  io_axi_aw_data_awsize, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_axi_aw_data_awvalid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_axi_aw_awready, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [3:0]  io_axi_w_data_wid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [31:0] io_axi_w_data_wdata, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output [3:0]  io_axi_w_data_wstrb, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_axi_w_data_wlast, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_axi_w_data_wvalid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_axi_w_wready, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [3:0]  io_axi_r_data_rid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [31:0] io_axi_r_data_rdata, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_axi_r_data_rlast, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_axi_r_data_rvalid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_axi_r_rready, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [3:0]  io_axi_b_data_bid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_axi_b_data_bvalid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  output        io_axi_b_bready, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_redirectInfo_valid, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/memory/dcache/DCache.scala 14:14]
  input         io_redirectInfo_bits_robIdx_flag // @[src/main/scala/memory/dcache/DCache.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [511:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [511:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [511:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [511:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [511:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
`endif // RANDOMIZE_REG_INIT
  wire  array_clock; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_reset; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_valid; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [7:0] array_io_read_idx; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_0_valid; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_0_dirty; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [17:0] array_io_read_resp_ways_0_tag; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [511:0] array_io_read_resp_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_1_valid; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_1_dirty; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [17:0] array_io_read_resp_ways_1_tag; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [511:0] array_io_read_resp_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_2_valid; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_2_dirty; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [17:0] array_io_read_resp_ways_2_tag; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [511:0] array_io_read_resp_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_3_valid; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_read_resp_ways_3_dirty; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [17:0] array_io_read_resp_ways_3_tag; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [511:0] array_io_read_resp_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_write_valid; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [7:0] array_io_write_idx; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [1:0] array_io_write_way; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [17:0] array_io_write_tag; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_write_dirty; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [511:0] array_io_write_data; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  array_io_metaWrite_valid; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [7:0] array_io_metaWrite_idx; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire [1:0] array_io_metaWrite_way; // @[src/main/scala/memory/dcache/DCache.scala 45:24]
  wire  replacer_clock; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire  replacer_reset; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire  replacer_io_touch_valid; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire [7:0] replacer_io_touch_idx; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire [1:0] replacer_io_touch_way; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire  replacer_io_victim_req; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire [7:0] replacer_io_victim_idx; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire [1:0] replacer_io_victim_resp; // @[src/main/scala/memory/dcache/DCache.scala 46:24]
  wire  mshr_clock; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_reset; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_missReq_ready; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_missReq_valid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_missReq_bits_paddr; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_missReq_bits_lqIdx; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_missReq_bits_sqIdx; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [5:0] mshr_io_missReq_bits_robIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_missReq_bits_robIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_missReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_missReq_bits_storeData; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_missReq_bits_isLoad; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_missReq_bits_isStore; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_missReq_bits_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [1:0] mshr_io_missReq_bits_victimWay; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_missReq_bits_victimDirty; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [17:0] mshr_io_missReq_bits_victimTag; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [511:0] mshr_io_missReq_bits_victimData; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [25:0] mshr_io_probeBlockAddr; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_isFirstMiss; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_hasStore; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_refillWriteReq_valid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [7:0] mshr_io_refillWriteReq_bits_idx; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [1:0] mshr_io_refillWriteReq_bits_way; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [17:0] mshr_io_refillWriteReq_bits_tag; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [511:0] mshr_io_refillWriteReq_bits_data; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_refillWriteAck_valid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_refillWriteAck_bits; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_refillWritePrimId; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_lsReady; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [1:0] mshr_io_lsIdx; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_lsIsUncache; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_lsUncacheData; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_lsPaddr; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_lsLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_lsSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_lsLsuOp; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_lsStoreData; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_lsIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_lsIsStore; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_lsAck_valid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [1:0] mshr_io_lsAck_bits; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_axi_ar_data_arid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_axi_ar_data_araddr; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [7:0] mshr_io_axi_ar_data_arlen; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [2:0] mshr_io_axi_ar_data_arsize; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_ar_data_arvalid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_ar_arready; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_axi_aw_data_awid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_axi_aw_data_awaddr; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [7:0] mshr_io_axi_aw_data_awlen; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [2:0] mshr_io_axi_aw_data_awsize; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_aw_data_awvalid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_aw_awready; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_axi_w_data_wid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_axi_w_data_wdata; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_axi_w_data_wstrb; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_w_data_wlast; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_w_data_wvalid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_w_wready; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_axi_r_data_rid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [31:0] mshr_io_axi_r_data_rdata; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_r_data_rlast; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_r_data_rvalid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_r_rready; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [3:0] mshr_io_axi_b_data_bid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_b_data_bvalid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_axi_b_bready; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_redirectInfo_valid; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire [5:0] mshr_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  wire  mshr_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 47:24]
  reg [2:0] state; // @[src/main/scala/memory/dcache/DCache.scala 54:22]
  reg [31:0] curPaddr; // @[src/main/scala/memory/dcache/DCache.scala 59:29]
  reg [3:0] curLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 60:29]
  reg [3:0] curSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 61:29]
  reg [5:0] curRobIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 62:29]
  reg  curRobIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 62:29]
  reg [3:0] curLsuOp; // @[src/main/scala/memory/dcache/DCache.scala 63:29]
  reg [31:0] curStoreData; // @[src/main/scala/memory/dcache/DCache.scala 64:29]
  reg  curIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 65:29]
  reg  curIsStore; // @[src/main/scala/memory/dcache/DCache.scala 66:29]
  reg  curCacheable; // @[src/main/scala/memory/dcache/DCache.scala 67:29]
  reg  curIsReplay; // @[src/main/scala/memory/dcache/DCache.scala 68:29]
  reg [1:0] curLsIdx; // @[src/main/scala/memory/dcache/DCache.scala 69:29]
  reg  curArrayData_ways_0_dirty; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [17:0] curArrayData_ways_0_tag; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [511:0] curArrayData_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg  curArrayData_ways_1_dirty; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [17:0] curArrayData_ways_1_tag; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [511:0] curArrayData_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg  curArrayData_ways_2_dirty; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [17:0] curArrayData_ways_2_tag; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [511:0] curArrayData_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg  curArrayData_ways_3_dirty; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [17:0] curArrayData_ways_3_tag; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [511:0] curArrayData_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
  reg [1:0] curHitWay; // @[src/main/scala/memory/dcache/DCache.scala 71:29]
  reg [1:0] curVictimWay; // @[src/main/scala/memory/dcache/DCache.scala 72:29]
  reg [31:0] curUcData; // @[src/main/scala/memory/dcache/DCache.scala 73:29]
  reg [31:0] pendPaddr; // @[src/main/scala/memory/dcache/DCache.scala 77:30]
  reg [3:0] pendLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 78:30]
  reg [3:0] pendSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 79:30]
  reg [5:0] pendRobIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 80:30]
  reg  pendRobIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 80:30]
  reg [3:0] pendLsuOp; // @[src/main/scala/memory/dcache/DCache.scala 81:30]
  reg [31:0] pendStoreData; // @[src/main/scala/memory/dcache/DCache.scala 82:30]
  reg  pendIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 83:30]
  reg  pendIsStore; // @[src/main/scala/memory/dcache/DCache.scala 84:30]
  reg  pendCacheable; // @[src/main/scala/memory/dcache/DCache.scala 85:30]
  reg  pendingMiss; // @[src/main/scala/memory/dcache/DCache.scala 89:28]
  reg [7:0] refillIdx; // @[src/main/scala/memory/dcache/DCache.scala 92:29]
  reg [1:0] refillWay; // @[src/main/scala/memory/dcache/DCache.scala 93:29]
  reg [17:0] refillTag; // @[src/main/scala/memory/dcache/DCache.scala 94:29]
  reg [511:0] refillData; // @[src/main/scala/memory/dcache/DCache.scala 95:29]
  reg  refillPrimId; // @[src/main/scala/memory/dcache/DCache.scala 96:29]
  reg [7:0] storeWaitCnt; // @[src/main/scala/memory/dcache/DCache.scala 101:30]
  wire  storeStarving = storeWaitCnt >= 8'h8; // @[src/main/scala/memory/dcache/DCache.scala 102:36]
  wire  _T = ~io_loadReq_valid; // @[src/main/scala/memory/dcache/DCache.scala 103:29]
  wire  _T_3 = ~storeStarving; // @[src/main/scala/memory/dcache/DCache.scala 105:55]
  wire [7:0] _storeWaitCnt_T_1 = storeWaitCnt + 8'h1; // @[src/main/scala/memory/dcache/DCache.scala 106:34]
  wire  loadSelected = io_loadReq_valid & (~io_storeReq_valid | _T_3); // @[src/main/scala/memory/dcache/DCache.scala 110:40]
  wire  storeSelected = io_storeReq_valid & (_T | storeStarving); // @[src/main/scala/memory/dcache/DCache.scala 111:41]
  wire  lsuHasReq = io_loadReq_valid | io_storeReq_valid; // @[src/main/scala/memory/dcache/DCache.scala 112:40]
  wire  _idle_doUcLoad_T = ~mshr_io_refillWriteReq_valid; // @[src/main/scala/memory/dcache/DCache.scala 273:25]
  wire  idle_doUcLoad = ~mshr_io_refillWriteReq_valid & mshr_io_lsReady & mshr_io_lsIsUncache & mshr_io_lsIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 273:83]
  wire  _idle_doUcStore_T_2 = _idle_doUcLoad_T & ~idle_doUcLoad; // @[src/main/scala/memory/dcache/DCache.scala 274:41]
  wire  idle_doUcStore = _idle_doUcLoad_T & ~idle_doUcLoad & mshr_io_lsReady & mshr_io_lsIsUncache & mshr_io_lsIsStore; // @[src/main/scala/memory/dcache/DCache.scala 274:101]
  wire  _idle_doReplay_T_4 = _idle_doUcStore_T_2 & ~idle_doUcStore; // @[src/main/scala/memory/dcache/DCache.scala 275:59]
  wire  idle_doReplay = _idle_doUcStore_T_2 & ~idle_doUcStore & mshr_io_lsReady & ~mshr_io_lsIsUncache; // @[src/main/scala/memory/dcache/DCache.scala 275:97]
  wire  _idle_doPending_T_5 = ~idle_doReplay; // @[src/main/scala/memory/dcache/DCache.scala 276:81]
  wire  _idle_doPending_T_6 = _idle_doReplay_T_4 & ~idle_doReplay; // @[src/main/scala/memory/dcache/DCache.scala 276:78]
  wire  idle_doPending = _idle_doReplay_T_4 & ~idle_doReplay & pendingMiss; // @[src/main/scala/memory/dcache/DCache.scala 276:96]
  wire  _idle_doLsu_T_9 = _idle_doPending_T_6 & ~idle_doPending & lsuHasReq; // @[src/main/scala/memory/dcache/DCache.scala 277:115]
  wire  idle_doLsu = _idle_doLsu_T_9 & ~mshr_io_hasStore; // @[src/main/scala/memory/dcache/DCache.scala 278:35]
  wire  _pendingFlushed_T_1 = pendRobIdx_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _pendingFlushed_T_2 = pendRobIdx_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _pendingFlushed_T_3 = pendRobIdx_flag == io_redirectInfo_bits_robIdx_flag ? _pendingFlushed_T_1 :
    _pendingFlushed_T_2; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _pendingFlushed_T_5 = _pendingFlushed_T_3 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/dcache/DCache.scala 123:75]
  wire  pendingFlushed = pendingMiss & _pendingFlushed_T_5; // @[src/main/scala/memory/dcache/DCache.scala 281:36]
  wire [31:0] lsuPaddr = loadSelected ? io_loadReq_bits_paddr : io_storeReq_bits_paddr; // @[src/main/scala/memory/dcache/DCache.scala 284:25]
  wire [7:0] lsuSetIdx = lsuPaddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 285:30]
  wire  lsuIsUncache = loadSelected ? ~io_loadReq_bits_cacheable : ~io_storeReq_bits_cacheable; // @[src/main/scala/memory/dcache/DCache.scala 286:25]
  wire [17:0] ptag = curPaddr[31:14]; // @[src/main/scala/memory/dcache/DCache.scala 129:21]
  wire  hits_0 = array_io_read_resp_ways_0_valid & array_io_read_resp_ways_0_tag == ptag; // @[src/main/scala/memory/dcache/DCache.scala 132:37]
  wire  hits_1 = array_io_read_resp_ways_1_valid & array_io_read_resp_ways_1_tag == ptag; // @[src/main/scala/memory/dcache/DCache.scala 132:37]
  wire  hits_2 = array_io_read_resp_ways_2_valid & array_io_read_resp_ways_2_tag == ptag; // @[src/main/scala/memory/dcache/DCache.scala 132:37]
  wire  hits_3 = array_io_read_resp_ways_3_valid & array_io_read_resp_ways_3_tag == ptag; // @[src/main/scala/memory/dcache/DCache.scala 132:37]
  wire [3:0] _hit_T = {hits_3,hits_2,hits_1,hits_0}; // @[src/main/scala/memory/dcache/DCache.scala 133:23]
  wire  s1Hit = |_hit_T & curCacheable; // @[src/main/scala/memory/dcache/DCache.scala 133:34]
  wire [1:0] hitWay_hi_1 = _hit_T[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] hitWay_lo_1 = _hit_T[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _hitWay_T_2 = hitWay_hi_1 | hitWay_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] s1HitWay = {|hitWay_hi_1,_hitWay_T_2[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire  _mshr_io_missReq_valid_T = state == 3'h4; // @[src/main/scala/memory/dcache/DCache.scala 306:40]
  wire  _mshr_io_missReq_valid_T_2 = curRobIdx_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _mshr_io_missReq_valid_T_3 = curRobIdx_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _mshr_io_missReq_valid_T_4 = curRobIdx_flag == io_redirectInfo_bits_robIdx_flag ? _mshr_io_missReq_valid_T_2 :
    _mshr_io_missReq_valid_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _mshr_io_missReq_valid_T_6 = _mshr_io_missReq_valid_T_4 & io_redirectInfo_valid &
    io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/dcache/DCache.scala 123:75]
  wire  _GEN_3 = 2'h1 == curVictimWay ? curArrayData_ways_1_dirty : curArrayData_ways_0_dirty; // @[src/main/scala/memory/dcache/DCache.scala 317:{52,52}]
  wire  _GEN_4 = 2'h2 == curVictimWay ? curArrayData_ways_2_dirty : _GEN_3; // @[src/main/scala/memory/dcache/DCache.scala 317:{52,52}]
  wire  _GEN_5 = 2'h3 == curVictimWay ? curArrayData_ways_3_dirty : _GEN_4; // @[src/main/scala/memory/dcache/DCache.scala 317:{52,52}]
  wire [17:0] _GEN_7 = 2'h1 == curVictimWay ? curArrayData_ways_1_tag : curArrayData_ways_0_tag; // @[src/main/scala/memory/dcache/DCache.scala 318:{42,42}]
  wire [17:0] _GEN_8 = 2'h2 == curVictimWay ? curArrayData_ways_2_tag : _GEN_7; // @[src/main/scala/memory/dcache/DCache.scala 318:{42,42}]
  wire [17:0] _GEN_9 = 2'h3 == curVictimWay ? curArrayData_ways_3_tag : _GEN_8; // @[src/main/scala/memory/dcache/DCache.scala 318:{42,42}]
  wire [511:0] _GEN_11 = 2'h1 == curVictimWay ? curArrayData_ways_1_data : curArrayData_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 319:{42,42}]
  wire [511:0] _GEN_12 = 2'h2 == curVictimWay ? curArrayData_ways_2_data : _GEN_11; // @[src/main/scala/memory/dcache/DCache.scala 319:{42,42}]
  wire [511:0] _GEN_13 = 2'h3 == curVictimWay ? curArrayData_ways_3_data : _GEN_12; // @[src/main/scala/memory/dcache/DCache.scala 319:{42,42}]
  wire  _mshr_io_refillWriteAck_valid_T = state == 3'h5; // @[src/main/scala/memory/dcache/DCache.scala 322:41]
  wire  _mshr_io_lsAck_valid_T = state == 3'h2; // @[src/main/scala/memory/dcache/DCache.scala 326:49]
  wire  _mshr_io_lsAck_valid_T_3 = state == 3'h3; // @[src/main/scala/memory/dcache/DCache.scala 327:33]
  wire  _mshr_io_lsAck_valid_T_5 = state == 3'h3 & io_storeAck_valid; // @[src/main/scala/memory/dcache/DCache.scala 327:51]
  wire  _mshr_io_lsAck_valid_T_6 = state == 3'h2 & io_loadResp_valid | _mshr_io_lsAck_valid_T_5; // @[src/main/scala/memory/dcache/DCache.scala 326:88]
  wire  _mshr_io_lsAck_valid_T_7 = state == 3'h6; // @[src/main/scala/memory/dcache/DCache.scala 328:33]
  wire  _mshr_io_lsAck_valid_T_9 = state == 3'h6 & io_loadResp_valid; // @[src/main/scala/memory/dcache/DCache.scala 328:51]
  wire  _mshr_io_lsAck_valid_T_10 = _mshr_io_lsAck_valid_T_6 | _mshr_io_lsAck_valid_T_9; // @[src/main/scala/memory/dcache/DCache.scala 327:73]
  wire  _mshr_io_lsAck_valid_T_11 = state == 3'h7; // @[src/main/scala/memory/dcache/DCache.scala 329:33]
  wire  _mshr_io_lsAck_valid_T_13 = state == 3'h7 & io_storeAck_valid; // @[src/main/scala/memory/dcache/DCache.scala 329:51]
  wire  _mshr_io_lsAck_valid_T_14 = _mshr_io_lsAck_valid_T_10 | _mshr_io_lsAck_valid_T_13; // @[src/main/scala/memory/dcache/DCache.scala 328:73]
  wire  _array_io_read_valid_T = state == 3'h0; // @[src/main/scala/memory/dcache/DCache.scala 334:33]
  wire  _array_io_read_valid_T_2 = ~lsuIsUncache; // @[src/main/scala/memory/dcache/DCache.scala 335:40]
  wire  _array_io_read_valid_T_3 = idle_doLsu & ~lsuIsUncache; // @[src/main/scala/memory/dcache/DCache.scala 335:37]
  wire  _array_io_read_valid_T_4 = idle_doPending & curCacheable | _array_io_read_valid_T_3; // @[src/main/scala/memory/dcache/DCache.scala 334:79]
  wire  _array_io_read_valid_T_5 = _array_io_read_valid_T_4 | idle_doReplay; // @[src/main/scala/memory/dcache/DCache.scala 335:54]
  wire [7:0] _array_io_read_idx_T_2 = idle_doPending ? curPaddr[13:6] : lsuSetIdx; // @[src/main/scala/memory/dcache/DCache.scala 337:28]
  wire [3:0] array_io_write_data_wordOff = curPaddr[5:2]; // @[src/main/scala/memory/dcache/DCache.scala 203:23]
  wire [1:0] array_io_write_data_byteOff = curPaddr[1:0]; // @[src/main/scala/memory/dcache/DCache.scala 204:23]
  wire [511:0] _GEN_15 = 2'h1 == curHitWay ? curArrayData_ways_1_data : curArrayData_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 209:{26,26}]
  wire [511:0] _GEN_16 = 2'h2 == curHitWay ? curArrayData_ways_2_data : _GEN_15; // @[src/main/scala/memory/dcache/DCache.scala 209:{26,26}]
  wire [511:0] _GEN_17 = 2'h3 == curHitWay ? curArrayData_ways_3_data : _GEN_16; // @[src/main/scala/memory/dcache/DCache.scala 209:{26,26}]
  wire  _array_io_write_data_T = array_io_write_data_wordOff == 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_18 = array_io_write_data_wordOff == 4'h0 ? _GEN_17[31:0] : 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 213:14 215:{29,42}]
  wire  _array_io_write_data_T_1 = array_io_write_data_wordOff == 4'h1; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_19 = array_io_write_data_wordOff == 4'h1 ? _GEN_17[63:32] : _GEN_18; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_2 = array_io_write_data_wordOff == 4'h2; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_20 = array_io_write_data_wordOff == 4'h2 ? _GEN_17[95:64] : _GEN_19; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_3 = array_io_write_data_wordOff == 4'h3; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_21 = array_io_write_data_wordOff == 4'h3 ? _GEN_17[127:96] : _GEN_20; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_4 = array_io_write_data_wordOff == 4'h4; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_22 = array_io_write_data_wordOff == 4'h4 ? _GEN_17[159:128] : _GEN_21; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_5 = array_io_write_data_wordOff == 4'h5; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_23 = array_io_write_data_wordOff == 4'h5 ? _GEN_17[191:160] : _GEN_22; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_6 = array_io_write_data_wordOff == 4'h6; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_24 = array_io_write_data_wordOff == 4'h6 ? _GEN_17[223:192] : _GEN_23; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_7 = array_io_write_data_wordOff == 4'h7; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_25 = array_io_write_data_wordOff == 4'h7 ? _GEN_17[255:224] : _GEN_24; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_8 = array_io_write_data_wordOff == 4'h8; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_26 = array_io_write_data_wordOff == 4'h8 ? _GEN_17[287:256] : _GEN_25; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_9 = array_io_write_data_wordOff == 4'h9; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_27 = array_io_write_data_wordOff == 4'h9 ? _GEN_17[319:288] : _GEN_26; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_10 = array_io_write_data_wordOff == 4'ha; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_28 = array_io_write_data_wordOff == 4'ha ? _GEN_17[351:320] : _GEN_27; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_11 = array_io_write_data_wordOff == 4'hb; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_29 = array_io_write_data_wordOff == 4'hb ? _GEN_17[383:352] : _GEN_28; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_12 = array_io_write_data_wordOff == 4'hc; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_30 = array_io_write_data_wordOff == 4'hc ? _GEN_17[415:384] : _GEN_29; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_13 = array_io_write_data_wordOff == 4'hd; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_31 = array_io_write_data_wordOff == 4'hd ? _GEN_17[447:416] : _GEN_30; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_14 = array_io_write_data_wordOff == 4'he; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] _GEN_32 = array_io_write_data_wordOff == 4'he ? _GEN_17[479:448] : _GEN_31; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire  _array_io_write_data_T_15 = array_io_write_data_wordOff == 4'hf; // @[src/main/scala/memory/dcache/DCache.scala 215:20]
  wire [31:0] array_io_write_data_targetWord = array_io_write_data_wordOff == 4'hf ? _GEN_17[511:480] : _GEN_32; // @[src/main/scala/memory/dcache/DCache.scala 215:{29,42}]
  wire [3:0] _array_io_write_data_byteEnable_T = 4'h1 << array_io_write_data_byteOff; // @[src/main/scala/chisel3/util/OneHot.scala 65:12]
  wire [3:0] _array_io_write_data_byteEnable_T_11 = 4'h4 == curLsuOp ? _array_io_write_data_byteEnable_T : 4'hf; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] array_io_write_data_shEnable = array_io_write_data_byteOff[1] ? 4'hc : 4'h3; // @[src/main/scala/memory/dcache/DCache.scala 235:21]
  wire [3:0] _array_io_write_data_finalEnable_T_3 = 4'h5 == curLsuOp ? array_io_write_data_shEnable :
    _array_io_write_data_byteEnable_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] array_io_write_data_finalEnable = 4'h6 == curLsuOp ? 4'hf : _array_io_write_data_finalEnable_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [5:0] _array_io_write_data_shiftedStoreData_T_1 = array_io_write_data_byteOff * 4'h8; // @[src/main/scala/memory/dcache/DCache.scala 248:47]
  wire [70:0] _GEN_2 = {{63'd0}, curStoreData[7:0]}; // @[src/main/scala/memory/dcache/DCache.scala 248:35]
  wire [70:0] _array_io_write_data_shiftedStoreData_T_2 = _GEN_2 << _array_io_write_data_shiftedStoreData_T_1; // @[src/main/scala/memory/dcache/DCache.scala 248:35]
  wire [1:0] _array_io_write_data_shiftedStoreData_T_5 = {array_io_write_data_byteOff[1],1'h0}; // @[src/main/scala/memory/dcache/DCache.scala 249:43]
  wire [5:0] _array_io_write_data_shiftedStoreData_T_6 = _array_io_write_data_shiftedStoreData_T_5 * 4'h8; // @[src/main/scala/memory/dcache/DCache.scala 249:66]
  wire [78:0] _GEN_6 = {{63'd0}, curStoreData[15:0]}; // @[src/main/scala/memory/dcache/DCache.scala 249:36]
  wire [78:0] _array_io_write_data_shiftedStoreData_T_7 = _GEN_6 << _array_io_write_data_shiftedStoreData_T_6; // @[src/main/scala/memory/dcache/DCache.scala 249:36]
  wire [70:0] _array_io_write_data_shiftedStoreData_T_9 = 4'h4 == curLsuOp ? _array_io_write_data_shiftedStoreData_T_2
     : {{39'd0}, curStoreData}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [78:0] _array_io_write_data_shiftedStoreData_T_11 = 4'h5 == curLsuOp ? _array_io_write_data_shiftedStoreData_T_7
     : {{8'd0}, _array_io_write_data_shiftedStoreData_T_9}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [78:0] array_io_write_data_shiftedStoreData = 4'h6 == curLsuOp ? {{47'd0}, curStoreData} :
    _array_io_write_data_shiftedStoreData_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [7:0] _array_io_write_data_newWord_T_3 = array_io_write_data_finalEnable[3] ?
    array_io_write_data_shiftedStoreData[31:24] : array_io_write_data_targetWord[31:24]; // @[src/main/scala/memory/dcache/DCache.scala 255:8]
  wire [7:0] _array_io_write_data_newWord_T_7 = array_io_write_data_finalEnable[2] ?
    array_io_write_data_shiftedStoreData[23:16] : array_io_write_data_targetWord[23:16]; // @[src/main/scala/memory/dcache/DCache.scala 256:8]
  wire [7:0] _array_io_write_data_newWord_T_11 = array_io_write_data_finalEnable[1] ?
    array_io_write_data_shiftedStoreData[15:8] : array_io_write_data_targetWord[15:8]; // @[src/main/scala/memory/dcache/DCache.scala 257:8]
  wire [7:0] _array_io_write_data_newWord_T_15 = array_io_write_data_finalEnable[0] ?
    array_io_write_data_shiftedStoreData[7:0] : array_io_write_data_targetWord[7:0]; // @[src/main/scala/memory/dcache/DCache.scala 258:8]
  wire [31:0] array_io_write_data_newWord = {_array_io_write_data_newWord_T_3,_array_io_write_data_newWord_T_7,
    _array_io_write_data_newWord_T_11,_array_io_write_data_newWord_T_15}; // @[src/main/scala/memory/dcache/DCache.scala 254:17]
  wire [31:0] array_io_write_data_merged_0 = _array_io_write_data_T ? array_io_write_data_newWord : _GEN_17[31:0]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_1 = _array_io_write_data_T_1 ? array_io_write_data_newWord : _GEN_17[63:32]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_2 = _array_io_write_data_T_2 ? array_io_write_data_newWord : _GEN_17[95:64]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_3 = _array_io_write_data_T_3 ? array_io_write_data_newWord : _GEN_17[127:96]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_4 = _array_io_write_data_T_4 ? array_io_write_data_newWord : _GEN_17[159:128]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_5 = _array_io_write_data_T_5 ? array_io_write_data_newWord : _GEN_17[191:160]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_6 = _array_io_write_data_T_6 ? array_io_write_data_newWord : _GEN_17[223:192]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_7 = _array_io_write_data_T_7 ? array_io_write_data_newWord : _GEN_17[255:224]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_8 = _array_io_write_data_T_8 ? array_io_write_data_newWord : _GEN_17[287:256]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_9 = _array_io_write_data_T_9 ? array_io_write_data_newWord : _GEN_17[319:288]; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_10 = _array_io_write_data_T_10 ? array_io_write_data_newWord : _GEN_17[351:320]
    ; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_11 = _array_io_write_data_T_11 ? array_io_write_data_newWord : _GEN_17[383:352]
    ; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_12 = _array_io_write_data_T_12 ? array_io_write_data_newWord : _GEN_17[415:384]
    ; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_13 = _array_io_write_data_T_13 ? array_io_write_data_newWord : _GEN_17[447:416]
    ; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_14 = _array_io_write_data_T_14 ? array_io_write_data_newWord : _GEN_17[479:448]
    ; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [31:0] array_io_write_data_merged_15 = _array_io_write_data_T_15 ? array_io_write_data_newWord : _GEN_17[511:480]
    ; // @[src/main/scala/memory/dcache/DCache.scala 209:15 263:{27,39}]
  wire [255:0] array_io_write_data_lo = {array_io_write_data_merged_7,array_io_write_data_merged_6,
    array_io_write_data_merged_5,array_io_write_data_merged_4,array_io_write_data_merged_3,array_io_write_data_merged_2,
    array_io_write_data_merged_1,array_io_write_data_merged_0}; // @[src/main/scala/memory/dcache/DCache.scala 265:6]
  wire [511:0] _array_io_write_data_T_32 = {array_io_write_data_merged_15,array_io_write_data_merged_14,
    array_io_write_data_merged_13,array_io_write_data_merged_12,array_io_write_data_merged_11,
    array_io_write_data_merged_10,array_io_write_data_merged_9,array_io_write_data_merged_8,array_io_write_data_lo}; // @[src/main/scala/memory/dcache/DCache.scala 265:6]
  wire  _array_io_metaWrite_valid_T_3 = mshr_io_missReq_ready & mshr_io_missReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _io_loadReq_ready_T_1 = _array_io_read_valid_T & idle_doLsu; // @[src/main/scala/memory/dcache/DCache.scala 390:41]
  wire  _io_loadResp_bits_data_byteData_T_5 = 2'h1 == array_io_write_data_byteOff; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [7:0] _io_loadResp_bits_data_byteData_T_6 = 2'h1 == array_io_write_data_byteOff ? curUcData[15:8] : curUcData[7:0
    ]; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_loadResp_bits_data_byteData_T_7 = 2'h2 == array_io_write_data_byteOff; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [7:0] _io_loadResp_bits_data_byteData_T_8 = 2'h2 == array_io_write_data_byteOff ? curUcData[23:16] :
    _io_loadResp_bits_data_byteData_T_6; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_loadResp_bits_data_byteData_T_9 = 2'h3 == array_io_write_data_byteOff; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [7:0] io_loadResp_bits_data_byteData = 2'h3 == array_io_write_data_byteOff ? curUcData[31:24] :
    _io_loadResp_bits_data_byteData_T_8; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [15:0] io_loadResp_bits_data_halfData = array_io_write_data_byteOff[1] ? curUcData[31:16] : curUcData[15:0]; // @[src/main/scala/memory/dcache/DCache.scala 188:21]
  wire [15:0] _io_loadResp_bits_data_T_2 = io_loadResp_bits_data_halfData[15] ? 16'hffff : 16'h0; // @[src/main/scala/memory/dcache/DCache.scala 192:27]
  wire [31:0] _io_loadResp_bits_data_T_3 = {_io_loadResp_bits_data_T_2,io_loadResp_bits_data_halfData}; // @[src/main/scala/memory/dcache/DCache.scala 192:22]
  wire [31:0] _io_loadResp_bits_data_T_4 = {16'h0,io_loadResp_bits_data_halfData}; // @[src/main/scala/memory/dcache/DCache.scala 193:22]
  wire [23:0] _io_loadResp_bits_data_T_6 = io_loadResp_bits_data_byteData[7] ? 24'hffffff : 24'h0; // @[src/main/scala/memory/dcache/DCache.scala 194:27]
  wire [31:0] _io_loadResp_bits_data_T_7 = {_io_loadResp_bits_data_T_6,io_loadResp_bits_data_byteData}; // @[src/main/scala/memory/dcache/DCache.scala 194:22]
  wire [31:0] _io_loadResp_bits_data_T_8 = {24'h0,io_loadResp_bits_data_byteData}; // @[src/main/scala/memory/dcache/DCache.scala 195:22]
  wire [31:0] _io_loadResp_bits_data_T_12 = 4'h2 == curLsuOp ? _io_loadResp_bits_data_T_3 : curUcData; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadResp_bits_data_T_14 = 4'h8 == curLsuOp ? _io_loadResp_bits_data_T_4 : _io_loadResp_bits_data_T_12; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadResp_bits_data_T_16 = 4'h1 == curLsuOp ? _io_loadResp_bits_data_T_7 : _io_loadResp_bits_data_T_14; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadResp_bits_data_T_18 = 4'h7 == curLsuOp ? _io_loadResp_bits_data_T_8 : _io_loadResp_bits_data_T_16; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [7:0] _GEN_66 = _io_loadResp_bits_data_byteData_T_9 ? array_io_write_data_targetWord[31:24] : 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 151:12 152:19 156:24]
  wire [7:0] _GEN_67 = _io_loadResp_bits_data_byteData_T_7 ? array_io_write_data_targetWord[23:16] : _GEN_66; // @[src/main/scala/memory/dcache/DCache.scala 152:19 155:24]
  wire [7:0] _GEN_68 = _io_loadResp_bits_data_byteData_T_5 ? array_io_write_data_targetWord[15:8] : _GEN_67; // @[src/main/scala/memory/dcache/DCache.scala 152:19 154:24]
  wire [7:0] io_loadResp_bits_data_byteData_1 = 2'h0 == array_io_write_data_byteOff ? array_io_write_data_targetWord[7:0
    ] : _GEN_68; // @[src/main/scala/memory/dcache/DCache.scala 152:19 153:24]
  wire [15:0] _GEN_70 = array_io_write_data_byteOff[1] ? array_io_write_data_targetWord[31:16] : 16'h0; // @[src/main/scala/memory/dcache/DCache.scala 160:12 161:31 163:24]
  wire [15:0] io_loadResp_bits_data_halfData_1 = ~array_io_write_data_byteOff[1] ? array_io_write_data_targetWord[15:0]
     : _GEN_70; // @[src/main/scala/memory/dcache/DCache.scala 161:31 162:24]
  wire [15:0] _io_loadResp_bits_data_T_43 = io_loadResp_bits_data_halfData_1[15] ? 16'hffff : 16'h0; // @[src/main/scala/memory/dcache/DCache.scala 169:27]
  wire [31:0] _io_loadResp_bits_data_T_44 = {_io_loadResp_bits_data_T_43,io_loadResp_bits_data_halfData_1}; // @[src/main/scala/memory/dcache/DCache.scala 169:22]
  wire [31:0] _io_loadResp_bits_data_T_45 = {16'h0,io_loadResp_bits_data_halfData_1}; // @[src/main/scala/memory/dcache/DCache.scala 170:22]
  wire [23:0] _io_loadResp_bits_data_T_47 = io_loadResp_bits_data_byteData_1[7] ? 24'hffffff : 24'h0; // @[src/main/scala/memory/dcache/DCache.scala 171:27]
  wire [31:0] _io_loadResp_bits_data_T_48 = {_io_loadResp_bits_data_T_47,io_loadResp_bits_data_byteData_1}; // @[src/main/scala/memory/dcache/DCache.scala 171:22]
  wire [31:0] _io_loadResp_bits_data_T_49 = {24'h0,io_loadResp_bits_data_byteData_1}; // @[src/main/scala/memory/dcache/DCache.scala 172:22]
  wire [31:0] _io_loadResp_bits_data_T_53 = 4'h2 == curLsuOp ? _io_loadResp_bits_data_T_44 :
    array_io_write_data_targetWord; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadResp_bits_data_T_55 = 4'h8 == curLsuOp ? _io_loadResp_bits_data_T_45 : _io_loadResp_bits_data_T_53
    ; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadResp_bits_data_T_57 = 4'h1 == curLsuOp ? _io_loadResp_bits_data_T_48 : _io_loadResp_bits_data_T_55
    ; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadResp_bits_data_T_59 = 4'h7 == curLsuOp ? _io_loadResp_bits_data_T_49 : _io_loadResp_bits_data_T_57
    ; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _curLqIdx_T = loadSelected ? io_loadReq_bits_lqIdx : 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 464:28]
  wire [3:0] _curSqIdx_T = storeSelected ? io_storeReq_bits_sqIdx : 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 465:28]
  wire [5:0] _curRobIdx_T_value = loadSelected ? io_loadReq_bits_robIdx_value : 6'h0; // @[src/main/scala/memory/dcache/DCache.scala 466:28]
  wire [3:0] _curLsuOp_T = loadSelected ? io_loadReq_bits_lsuOp : io_storeReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCache.scala 467:28]
  wire [31:0] _curStoreData_T = storeSelected ? io_storeReq_bits_data : 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 468:28]
  wire [2:0] _state_T = lsuIsUncache ? 3'h4 : 3'h1; // @[src/main/scala/memory/dcache/DCache.scala 475:28]
  wire [31:0] _GEN_72 = idle_doLsu ? lsuPaddr : curPaddr; // @[src/main/scala/memory/dcache/DCache.scala 461:30 463:22 59:29]
  wire [3:0] _GEN_73 = idle_doLsu ? _curLqIdx_T : curLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 461:30 464:22 60:29]
  wire [3:0] _GEN_74 = idle_doLsu ? _curSqIdx_T : curSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 461:30 465:22 61:29]
  wire [5:0] _GEN_75 = idle_doLsu ? _curRobIdx_T_value : curRobIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 461:30 466:22 62:29]
  wire  _GEN_76 = idle_doLsu ? loadSelected & io_loadReq_bits_robIdx_flag : curRobIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 461:30 466:22 62:29]
  wire [3:0] _GEN_77 = idle_doLsu ? _curLsuOp_T : curLsuOp; // @[src/main/scala/memory/dcache/DCache.scala 461:30 467:22 63:29]
  wire [31:0] _GEN_78 = idle_doLsu ? _curStoreData_T : curStoreData; // @[src/main/scala/memory/dcache/DCache.scala 461:30 468:22 64:29]
  wire  _GEN_79 = idle_doLsu ? loadSelected : curIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 461:30 469:22 65:29]
  wire  _GEN_80 = idle_doLsu ? storeSelected : curIsStore; // @[src/main/scala/memory/dcache/DCache.scala 461:30 470:22 66:29]
  wire  _GEN_81 = idle_doLsu ? _array_io_read_valid_T_2 : curCacheable; // @[src/main/scala/memory/dcache/DCache.scala 461:30 471:22 67:29]
  wire  _GEN_82 = idle_doLsu ? 1'h0 : curIsReplay; // @[src/main/scala/memory/dcache/DCache.scala 461:30 472:22 68:29]
  wire  _GEN_83 = idle_doLsu ? 1'h0 : pendingMiss; // @[src/main/scala/memory/dcache/DCache.scala 461:30 473:22 89:28]
  wire [1:0] _GEN_84 = idle_doLsu ? mshr_io_lsIdx : curLsIdx; // @[src/main/scala/memory/dcache/DCache.scala 461:30 474:22 69:29]
  wire [2:0] _GEN_85 = idle_doLsu ? _state_T : state; // @[src/main/scala/memory/dcache/DCache.scala 461:30 475:22 54:22]
  wire [2:0] _GEN_86 = idle_doPending ? 3'h1 : _GEN_85; // @[src/main/scala/memory/dcache/DCache.scala 446:34 448:15]
  wire [31:0] _GEN_87 = idle_doPending ? pendPaddr : _GEN_72; // @[src/main/scala/memory/dcache/DCache.scala 446:34 450:22]
  wire [3:0] _GEN_88 = idle_doPending ? pendLqIdx : _GEN_73; // @[src/main/scala/memory/dcache/DCache.scala 446:34 451:22]
  wire [3:0] _GEN_89 = idle_doPending ? pendSqIdx : _GEN_74; // @[src/main/scala/memory/dcache/DCache.scala 446:34 452:22]
  wire [5:0] _GEN_90 = idle_doPending ? pendRobIdx_value : _GEN_75; // @[src/main/scala/memory/dcache/DCache.scala 446:34 453:22]
  wire  _GEN_91 = idle_doPending ? pendRobIdx_flag : _GEN_76; // @[src/main/scala/memory/dcache/DCache.scala 446:34 453:22]
  wire [3:0] _GEN_92 = idle_doPending ? pendLsuOp : _GEN_77; // @[src/main/scala/memory/dcache/DCache.scala 446:34 454:22]
  wire [31:0] _GEN_93 = idle_doPending ? pendStoreData : _GEN_78; // @[src/main/scala/memory/dcache/DCache.scala 446:34 455:22]
  wire  _GEN_94 = idle_doPending ? pendIsLoad : _GEN_79; // @[src/main/scala/memory/dcache/DCache.scala 446:34 456:22]
  wire  _GEN_95 = idle_doPending ? pendIsStore : _GEN_80; // @[src/main/scala/memory/dcache/DCache.scala 446:34 457:22]
  wire  _GEN_96 = idle_doPending ? pendCacheable : _GEN_81; // @[src/main/scala/memory/dcache/DCache.scala 446:34 458:22]
  wire  _GEN_97 = idle_doPending ? 1'h0 : _GEN_82; // @[src/main/scala/memory/dcache/DCache.scala 446:34 459:22]
  wire  _GEN_98 = idle_doPending ? pendingMiss : _GEN_83; // @[src/main/scala/memory/dcache/DCache.scala 446:34 89:28]
  wire [1:0] _GEN_99 = idle_doPending ? curLsIdx : _GEN_84; // @[src/main/scala/memory/dcache/DCache.scala 446:34 69:29]
  wire [31:0] _GEN_100 = idle_doReplay ? mshr_io_lsPaddr : _GEN_87; // @[src/main/scala/memory/dcache/DCache.scala 434:33 435:22]
  wire [3:0] _GEN_101 = idle_doReplay ? mshr_io_lsLqIdx : _GEN_88; // @[src/main/scala/memory/dcache/DCache.scala 434:33 436:22]
  wire [3:0] _GEN_102 = idle_doReplay ? mshr_io_lsSqIdx : _GEN_89; // @[src/main/scala/memory/dcache/DCache.scala 434:33 437:22]
  wire [3:0] _GEN_103 = idle_doReplay ? mshr_io_lsLsuOp : _GEN_92; // @[src/main/scala/memory/dcache/DCache.scala 434:33 438:22]
  wire [31:0] _GEN_104 = idle_doReplay ? mshr_io_lsStoreData : _GEN_93; // @[src/main/scala/memory/dcache/DCache.scala 434:33 439:22]
  wire  _GEN_105 = idle_doReplay ? mshr_io_lsIsLoad : _GEN_94; // @[src/main/scala/memory/dcache/DCache.scala 434:33 440:22]
  wire  _GEN_106 = idle_doReplay ? mshr_io_lsIsStore : _GEN_95; // @[src/main/scala/memory/dcache/DCache.scala 434:33 441:22]
  wire  _GEN_107 = idle_doReplay | _GEN_96; // @[src/main/scala/memory/dcache/DCache.scala 434:33 442:22]
  wire  _GEN_108 = idle_doReplay | _GEN_97; // @[src/main/scala/memory/dcache/DCache.scala 434:33 443:22]
  wire [1:0] _GEN_109 = idle_doReplay ? mshr_io_lsIdx : _GEN_99; // @[src/main/scala/memory/dcache/DCache.scala 434:33 444:22]
  wire [2:0] _GEN_110 = idle_doReplay ? 3'h1 : _GEN_86; // @[src/main/scala/memory/dcache/DCache.scala 434:33 445:22]
  wire [5:0] _GEN_111 = idle_doReplay ? curRobIdx_value : _GEN_90; // @[src/main/scala/memory/dcache/DCache.scala 434:33 62:29]
  wire  _GEN_112 = idle_doReplay ? curRobIdx_flag : _GEN_91; // @[src/main/scala/memory/dcache/DCache.scala 434:33 62:29]
  wire  _GEN_113 = idle_doReplay ? pendingMiss : _GEN_98; // @[src/main/scala/memory/dcache/DCache.scala 434:33 89:28]
  wire [3:0] _GEN_114 = idle_doUcStore ? mshr_io_lsSqIdx : _GEN_102; // @[src/main/scala/memory/dcache/DCache.scala 429:34 430:21]
  wire [1:0] _GEN_115 = idle_doUcStore ? mshr_io_lsIdx : _GEN_109; // @[src/main/scala/memory/dcache/DCache.scala 429:34 431:21]
  wire  _GEN_116 = idle_doUcStore | _GEN_108; // @[src/main/scala/memory/dcache/DCache.scala 429:34 432:21]
  wire [2:0] _GEN_117 = idle_doUcStore ? 3'h7 : _GEN_110; // @[src/main/scala/memory/dcache/DCache.scala 429:34 433:21]
  wire [31:0] _GEN_118 = idle_doUcStore ? curPaddr : _GEN_100; // @[src/main/scala/memory/dcache/DCache.scala 429:34 59:29]
  wire [3:0] _GEN_119 = idle_doUcStore ? curLqIdx : _GEN_101; // @[src/main/scala/memory/dcache/DCache.scala 429:34 60:29]
  wire [3:0] _GEN_120 = idle_doUcStore ? curLsuOp : _GEN_103; // @[src/main/scala/memory/dcache/DCache.scala 429:34 63:29]
  wire [31:0] _GEN_121 = idle_doUcStore ? curStoreData : _GEN_104; // @[src/main/scala/memory/dcache/DCache.scala 429:34 64:29]
  wire  _GEN_122 = idle_doUcStore ? curIsLoad : _GEN_105; // @[src/main/scala/memory/dcache/DCache.scala 429:34 65:29]
  wire  _GEN_123 = idle_doUcStore ? curIsStore : _GEN_106; // @[src/main/scala/memory/dcache/DCache.scala 429:34 66:29]
  wire  _GEN_124 = idle_doUcStore ? curCacheable : _GEN_107; // @[src/main/scala/memory/dcache/DCache.scala 429:34 67:29]
  wire [5:0] _GEN_125 = idle_doUcStore ? curRobIdx_value : _GEN_111; // @[src/main/scala/memory/dcache/DCache.scala 429:34 62:29]
  wire  _GEN_126 = idle_doUcStore ? curRobIdx_flag : _GEN_112; // @[src/main/scala/memory/dcache/DCache.scala 429:34 62:29]
  wire  _GEN_127 = idle_doUcStore ? pendingMiss : _GEN_113; // @[src/main/scala/memory/dcache/DCache.scala 429:34 89:28]
  wire [3:0] _GEN_128 = idle_doUcLoad ? mshr_io_lsLqIdx : _GEN_119; // @[src/main/scala/memory/dcache/DCache.scala 420:33 421:21]
  wire [1:0] _GEN_129 = idle_doUcLoad ? mshr_io_lsIdx : _GEN_115; // @[src/main/scala/memory/dcache/DCache.scala 420:33 422:21]
  wire [31:0] _GEN_130 = idle_doUcLoad ? mshr_io_lsPaddr : _GEN_118; // @[src/main/scala/memory/dcache/DCache.scala 420:33 423:21]
  wire [3:0] _GEN_131 = idle_doUcLoad ? mshr_io_lsLsuOp : _GEN_120; // @[src/main/scala/memory/dcache/DCache.scala 420:33 424:21]
  wire  _GEN_132 = idle_doUcLoad | _GEN_116; // @[src/main/scala/memory/dcache/DCache.scala 420:33 425:21]
  wire [31:0] _GEN_133 = idle_doUcLoad ? mshr_io_lsUncacheData : curUcData; // @[src/main/scala/memory/dcache/DCache.scala 420:33 426:21 73:29]
  wire [2:0] _GEN_134 = idle_doUcLoad ? 3'h6 : _GEN_117; // @[src/main/scala/memory/dcache/DCache.scala 420:33 427:21]
  wire [3:0] _GEN_135 = idle_doUcLoad ? curSqIdx : _GEN_114; // @[src/main/scala/memory/dcache/DCache.scala 420:33 61:29]
  wire [31:0] _GEN_136 = idle_doUcLoad ? curStoreData : _GEN_121; // @[src/main/scala/memory/dcache/DCache.scala 420:33 64:29]
  wire  _GEN_137 = idle_doUcLoad ? curIsLoad : _GEN_122; // @[src/main/scala/memory/dcache/DCache.scala 420:33 65:29]
  wire  _GEN_138 = idle_doUcLoad ? curIsStore : _GEN_123; // @[src/main/scala/memory/dcache/DCache.scala 420:33 66:29]
  wire  _GEN_139 = idle_doUcLoad ? curCacheable : _GEN_124; // @[src/main/scala/memory/dcache/DCache.scala 420:33 67:29]
  wire [5:0] _GEN_140 = idle_doUcLoad ? curRobIdx_value : _GEN_125; // @[src/main/scala/memory/dcache/DCache.scala 420:33 62:29]
  wire  _GEN_141 = idle_doUcLoad ? curRobIdx_flag : _GEN_126; // @[src/main/scala/memory/dcache/DCache.scala 420:33 62:29]
  wire  _GEN_142 = idle_doUcLoad ? pendingMiss : _GEN_127; // @[src/main/scala/memory/dcache/DCache.scala 420:33 89:28]
  wire  _T_14 = ~curIsStore; // @[src/main/scala/memory/dcache/DCache.scala 483:52]
  wire  _T_15 = _mshr_io_missReq_valid_T_6 & curIsLoad & ~curIsStore; // @[src/main/scala/memory/dcache/DCache.scala 483:49]
  wire  _T_21 = s1Hit & curIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 491:24]
  wire  _T_24 = s1Hit & curIsStore; // @[src/main/scala/memory/dcache/DCache.scala 498:24]
  wire [1:0] _GEN_183 = s1Hit & curIsStore ? s1HitWay : curHitWay; // @[src/main/scala/memory/dcache/DCache.scala 498:39 499:19 71:29]
  wire [2:0] _GEN_184 = s1Hit & curIsStore ? 3'h3 : 3'h4; // @[src/main/scala/memory/dcache/DCache.scala 498:39 500:19 502:15]
  wire [1:0] _GEN_185 = _T_21 ? s1HitWay : _GEN_183; // @[src/main/scala/memory/dcache/DCache.scala 495:38 496:19]
  wire [1:0] _GEN_187 = s1Hit & curIsLoad & curIsStore ? s1HitWay : _GEN_185; // @[src/main/scala/memory/dcache/DCache.scala 491:52 493:19]
  wire [1:0] _GEN_190 = s1Hit & ~curIsLoad & _T_14 ? curHitWay : _GEN_187; // @[src/main/scala/memory/dcache/DCache.scala 488:54 71:29]
  wire [1:0] _GEN_192 = ~curCacheable ? curHitWay : _GEN_190; // @[src/main/scala/memory/dcache/DCache.scala 486:33 71:29]
  wire [1:0] _GEN_195 = _mshr_io_missReq_valid_T_6 & curIsLoad & ~curIsStore ? curHitWay : _GEN_192; // @[src/main/scala/memory/dcache/DCache.scala 483:65 71:29]
  wire [1:0] _GEN_196 = _T_24 ? s1HitWay : _GEN_195; // @[src/main/scala/memory/dcache/DCache.scala 507:39 508:19]
  wire  _GEN_200 = pendLqIdx == curLqIdx ? 1'h0 : pendingMiss; // @[src/main/scala/memory/dcache/DCache.scala 516:35 517:25 89:28]
  wire [2:0] _GEN_201 = io_loadResp_valid ? 3'h0 : state; // @[src/main/scala/memory/dcache/DCache.scala 519:{30,38} 54:22]
  wire  _GEN_202 = pendSqIdx == curSqIdx ? 1'h0 : pendingMiss; // @[src/main/scala/memory/dcache/DCache.scala 523:35 524:25 89:28]
  wire [2:0] _GEN_203 = io_storeAck_valid ? 3'h0 : state; // @[src/main/scala/memory/dcache/DCache.scala 526:{30,38} 54:22]
  wire  _GEN_204 = _array_io_metaWrite_valid_T_3 ? 1'h0 : 1'h1; // @[src/main/scala/memory/dcache/DCache.scala 533:40 534:21 538:25]
  wire [31:0] _GEN_206 = _array_io_metaWrite_valid_T_3 ? pendPaddr : curPaddr; // @[src/main/scala/memory/dcache/DCache.scala 533:40 539:25 77:30]
  wire [3:0] _GEN_207 = _array_io_metaWrite_valid_T_3 ? pendLqIdx : curLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 533:40 540:25 78:30]
  wire [3:0] _GEN_208 = _array_io_metaWrite_valid_T_3 ? pendSqIdx : curSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 533:40 541:25 79:30]
  wire [5:0] _GEN_209 = _array_io_metaWrite_valid_T_3 ? pendRobIdx_value : curRobIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 533:40 542:25 80:30]
  wire  _GEN_210 = _array_io_metaWrite_valid_T_3 ? pendRobIdx_flag : curRobIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 533:40 542:25 80:30]
  wire [3:0] _GEN_211 = _array_io_metaWrite_valid_T_3 ? pendLsuOp : curLsuOp; // @[src/main/scala/memory/dcache/DCache.scala 533:40 543:25 81:30]
  wire [31:0] _GEN_212 = _array_io_metaWrite_valid_T_3 ? pendStoreData : curStoreData; // @[src/main/scala/memory/dcache/DCache.scala 533:40 544:25 82:30]
  wire  _GEN_213 = _array_io_metaWrite_valid_T_3 ? pendIsLoad : curIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 533:40 545:25 83:30]
  wire  _GEN_214 = _array_io_metaWrite_valid_T_3 ? pendIsStore : curIsStore; // @[src/main/scala/memory/dcache/DCache.scala 533:40 546:25 84:30]
  wire  _GEN_215 = _array_io_metaWrite_valid_T_3 ? pendCacheable : curCacheable; // @[src/main/scala/memory/dcache/DCache.scala 533:40 547:25 85:30]
  wire  _GEN_217 = _T_15 ? 1'h0 : _GEN_204; // @[src/main/scala/memory/dcache/DCache.scala 530:64 532:21]
  wire [31:0] _GEN_218 = _T_15 ? pendPaddr : _GEN_206; // @[src/main/scala/memory/dcache/DCache.scala 530:64 77:30]
  wire [3:0] _GEN_219 = _T_15 ? pendLqIdx : _GEN_207; // @[src/main/scala/memory/dcache/DCache.scala 530:64 78:30]
  wire [3:0] _GEN_220 = _T_15 ? pendSqIdx : _GEN_208; // @[src/main/scala/memory/dcache/DCache.scala 530:64 79:30]
  wire [5:0] _GEN_221 = _T_15 ? pendRobIdx_value : _GEN_209; // @[src/main/scala/memory/dcache/DCache.scala 530:64 80:30]
  wire  _GEN_222 = _T_15 ? pendRobIdx_flag : _GEN_210; // @[src/main/scala/memory/dcache/DCache.scala 530:64 80:30]
  wire [3:0] _GEN_223 = _T_15 ? pendLsuOp : _GEN_211; // @[src/main/scala/memory/dcache/DCache.scala 530:64 81:30]
  wire [31:0] _GEN_224 = _T_15 ? pendStoreData : _GEN_212; // @[src/main/scala/memory/dcache/DCache.scala 530:64 82:30]
  wire  _GEN_225 = _T_15 ? pendIsLoad : _GEN_213; // @[src/main/scala/memory/dcache/DCache.scala 530:64 83:30]
  wire  _GEN_226 = _T_15 ? pendIsStore : _GEN_214; // @[src/main/scala/memory/dcache/DCache.scala 530:64 84:30]
  wire  _GEN_227 = _T_15 ? pendCacheable : _GEN_215; // @[src/main/scala/memory/dcache/DCache.scala 530:64 85:30]
  wire [2:0] _GEN_230 = 3'h7 == state ? _GEN_203 : state; // @[src/main/scala/memory/dcache/DCache.scala 409:17 54:22]
  wire [2:0] _GEN_231 = 3'h6 == state ? _GEN_201 : _GEN_230; // @[src/main/scala/memory/dcache/DCache.scala 409:17]
  wire [2:0] _GEN_232 = 3'h5 == state ? 3'h0 : _GEN_231; // @[src/main/scala/memory/dcache/DCache.scala 409:17 554:13]
  wire [2:0] _GEN_233 = 3'h4 == state ? 3'h0 : _GEN_232; // @[src/main/scala/memory/dcache/DCache.scala 409:17]
  wire  _GEN_234 = 3'h4 == state ? _GEN_217 : pendingMiss; // @[src/main/scala/memory/dcache/DCache.scala 409:17 89:28]
  wire [31:0] _GEN_235 = 3'h4 == state ? _GEN_218 : pendPaddr; // @[src/main/scala/memory/dcache/DCache.scala 409:17 77:30]
  wire [3:0] _GEN_236 = 3'h4 == state ? _GEN_219 : pendLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 409:17 78:30]
  wire [3:0] _GEN_237 = 3'h4 == state ? _GEN_220 : pendSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 409:17 79:30]
  wire [5:0] _GEN_238 = 3'h4 == state ? _GEN_221 : pendRobIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 409:17 80:30]
  wire  _GEN_239 = 3'h4 == state ? _GEN_222 : pendRobIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 409:17 80:30]
  wire [3:0] _GEN_240 = 3'h4 == state ? _GEN_223 : pendLsuOp; // @[src/main/scala/memory/dcache/DCache.scala 409:17 81:30]
  wire [31:0] _GEN_241 = 3'h4 == state ? _GEN_224 : pendStoreData; // @[src/main/scala/memory/dcache/DCache.scala 409:17 82:30]
  wire  _GEN_242 = 3'h4 == state ? _GEN_225 : pendIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 409:17 83:30]
  wire  _GEN_243 = 3'h4 == state ? _GEN_226 : pendIsStore; // @[src/main/scala/memory/dcache/DCache.scala 409:17 84:30]
  wire  _GEN_244 = 3'h4 == state ? _GEN_227 : pendCacheable; // @[src/main/scala/memory/dcache/DCache.scala 409:17 85:30]
  wire  _GEN_245 = 3'h3 == state ? _GEN_202 : _GEN_234; // @[src/main/scala/memory/dcache/DCache.scala 409:17]
  wire [2:0] _GEN_246 = 3'h3 == state ? _GEN_203 : _GEN_233; // @[src/main/scala/memory/dcache/DCache.scala 409:17]
  wire [31:0] _GEN_247 = 3'h3 == state ? pendPaddr : _GEN_235; // @[src/main/scala/memory/dcache/DCache.scala 409:17 77:30]
  wire [3:0] _GEN_248 = 3'h3 == state ? pendLqIdx : _GEN_236; // @[src/main/scala/memory/dcache/DCache.scala 409:17 78:30]
  wire [3:0] _GEN_249 = 3'h3 == state ? pendSqIdx : _GEN_237; // @[src/main/scala/memory/dcache/DCache.scala 409:17 79:30]
  wire [5:0] _GEN_250 = 3'h3 == state ? pendRobIdx_value : _GEN_238; // @[src/main/scala/memory/dcache/DCache.scala 409:17 80:30]
  wire  _GEN_251 = 3'h3 == state ? pendRobIdx_flag : _GEN_239; // @[src/main/scala/memory/dcache/DCache.scala 409:17 80:30]
  wire [3:0] _GEN_252 = 3'h3 == state ? pendLsuOp : _GEN_240; // @[src/main/scala/memory/dcache/DCache.scala 409:17 81:30]
  wire [31:0] _GEN_253 = 3'h3 == state ? pendStoreData : _GEN_241; // @[src/main/scala/memory/dcache/DCache.scala 409:17 82:30]
  wire  _GEN_254 = 3'h3 == state ? pendIsLoad : _GEN_242; // @[src/main/scala/memory/dcache/DCache.scala 409:17 83:30]
  wire  _GEN_255 = 3'h3 == state ? pendIsStore : _GEN_243; // @[src/main/scala/memory/dcache/DCache.scala 409:17 84:30]
  wire  _GEN_256 = 3'h3 == state ? pendCacheable : _GEN_244; // @[src/main/scala/memory/dcache/DCache.scala 409:17 85:30]
  DCacheArray array ( // @[src/main/scala/memory/dcache/DCache.scala 45:24]
    .clock(array_clock),
    .reset(array_reset),
    .io_read_valid(array_io_read_valid),
    .io_read_idx(array_io_read_idx),
    .io_read_resp_ways_0_valid(array_io_read_resp_ways_0_valid),
    .io_read_resp_ways_0_dirty(array_io_read_resp_ways_0_dirty),
    .io_read_resp_ways_0_tag(array_io_read_resp_ways_0_tag),
    .io_read_resp_ways_0_data(array_io_read_resp_ways_0_data),
    .io_read_resp_ways_1_valid(array_io_read_resp_ways_1_valid),
    .io_read_resp_ways_1_dirty(array_io_read_resp_ways_1_dirty),
    .io_read_resp_ways_1_tag(array_io_read_resp_ways_1_tag),
    .io_read_resp_ways_1_data(array_io_read_resp_ways_1_data),
    .io_read_resp_ways_2_valid(array_io_read_resp_ways_2_valid),
    .io_read_resp_ways_2_dirty(array_io_read_resp_ways_2_dirty),
    .io_read_resp_ways_2_tag(array_io_read_resp_ways_2_tag),
    .io_read_resp_ways_2_data(array_io_read_resp_ways_2_data),
    .io_read_resp_ways_3_valid(array_io_read_resp_ways_3_valid),
    .io_read_resp_ways_3_dirty(array_io_read_resp_ways_3_dirty),
    .io_read_resp_ways_3_tag(array_io_read_resp_ways_3_tag),
    .io_read_resp_ways_3_data(array_io_read_resp_ways_3_data),
    .io_write_valid(array_io_write_valid),
    .io_write_idx(array_io_write_idx),
    .io_write_way(array_io_write_way),
    .io_write_tag(array_io_write_tag),
    .io_write_dirty(array_io_write_dirty),
    .io_write_data(array_io_write_data),
    .io_metaWrite_valid(array_io_metaWrite_valid),
    .io_metaWrite_idx(array_io_metaWrite_idx),
    .io_metaWrite_way(array_io_metaWrite_way)
  );
  ICacheReplacer_1 replacer ( // @[src/main/scala/memory/dcache/DCache.scala 46:24]
    .clock(replacer_clock),
    .reset(replacer_reset),
    .io_touch_valid(replacer_io_touch_valid),
    .io_touch_idx(replacer_io_touch_idx),
    .io_touch_way(replacer_io_touch_way),
    .io_victim_req(replacer_io_victim_req),
    .io_victim_idx(replacer_io_victim_idx),
    .io_victim_resp(replacer_io_victim_resp)
  );
  DCacheMSHRFile mshr ( // @[src/main/scala/memory/dcache/DCache.scala 47:24]
    .clock(mshr_clock),
    .reset(mshr_reset),
    .io_missReq_ready(mshr_io_missReq_ready),
    .io_missReq_valid(mshr_io_missReq_valid),
    .io_missReq_bits_paddr(mshr_io_missReq_bits_paddr),
    .io_missReq_bits_lqIdx(mshr_io_missReq_bits_lqIdx),
    .io_missReq_bits_sqIdx(mshr_io_missReq_bits_sqIdx),
    .io_missReq_bits_robIdx_value(mshr_io_missReq_bits_robIdx_value),
    .io_missReq_bits_robIdx_flag(mshr_io_missReq_bits_robIdx_flag),
    .io_missReq_bits_lsuOp(mshr_io_missReq_bits_lsuOp),
    .io_missReq_bits_storeData(mshr_io_missReq_bits_storeData),
    .io_missReq_bits_isLoad(mshr_io_missReq_bits_isLoad),
    .io_missReq_bits_isStore(mshr_io_missReq_bits_isStore),
    .io_missReq_bits_cacheable(mshr_io_missReq_bits_cacheable),
    .io_missReq_bits_victimWay(mshr_io_missReq_bits_victimWay),
    .io_missReq_bits_victimDirty(mshr_io_missReq_bits_victimDirty),
    .io_missReq_bits_victimTag(mshr_io_missReq_bits_victimTag),
    .io_missReq_bits_victimData(mshr_io_missReq_bits_victimData),
    .io_probeBlockAddr(mshr_io_probeBlockAddr),
    .io_isFirstMiss(mshr_io_isFirstMiss),
    .io_hasStore(mshr_io_hasStore),
    .io_refillWriteReq_valid(mshr_io_refillWriteReq_valid),
    .io_refillWriteReq_bits_idx(mshr_io_refillWriteReq_bits_idx),
    .io_refillWriteReq_bits_way(mshr_io_refillWriteReq_bits_way),
    .io_refillWriteReq_bits_tag(mshr_io_refillWriteReq_bits_tag),
    .io_refillWriteReq_bits_data(mshr_io_refillWriteReq_bits_data),
    .io_refillWriteAck_valid(mshr_io_refillWriteAck_valid),
    .io_refillWriteAck_bits(mshr_io_refillWriteAck_bits),
    .io_refillWritePrimId(mshr_io_refillWritePrimId),
    .io_lsReady(mshr_io_lsReady),
    .io_lsIdx(mshr_io_lsIdx),
    .io_lsIsUncache(mshr_io_lsIsUncache),
    .io_lsUncacheData(mshr_io_lsUncacheData),
    .io_lsPaddr(mshr_io_lsPaddr),
    .io_lsLqIdx(mshr_io_lsLqIdx),
    .io_lsSqIdx(mshr_io_lsSqIdx),
    .io_lsLsuOp(mshr_io_lsLsuOp),
    .io_lsStoreData(mshr_io_lsStoreData),
    .io_lsIsLoad(mshr_io_lsIsLoad),
    .io_lsIsStore(mshr_io_lsIsStore),
    .io_lsAck_valid(mshr_io_lsAck_valid),
    .io_lsAck_bits(mshr_io_lsAck_bits),
    .io_axi_ar_data_arid(mshr_io_axi_ar_data_arid),
    .io_axi_ar_data_araddr(mshr_io_axi_ar_data_araddr),
    .io_axi_ar_data_arlen(mshr_io_axi_ar_data_arlen),
    .io_axi_ar_data_arsize(mshr_io_axi_ar_data_arsize),
    .io_axi_ar_data_arvalid(mshr_io_axi_ar_data_arvalid),
    .io_axi_ar_arready(mshr_io_axi_ar_arready),
    .io_axi_aw_data_awid(mshr_io_axi_aw_data_awid),
    .io_axi_aw_data_awaddr(mshr_io_axi_aw_data_awaddr),
    .io_axi_aw_data_awlen(mshr_io_axi_aw_data_awlen),
    .io_axi_aw_data_awsize(mshr_io_axi_aw_data_awsize),
    .io_axi_aw_data_awvalid(mshr_io_axi_aw_data_awvalid),
    .io_axi_aw_awready(mshr_io_axi_aw_awready),
    .io_axi_w_data_wid(mshr_io_axi_w_data_wid),
    .io_axi_w_data_wdata(mshr_io_axi_w_data_wdata),
    .io_axi_w_data_wstrb(mshr_io_axi_w_data_wstrb),
    .io_axi_w_data_wlast(mshr_io_axi_w_data_wlast),
    .io_axi_w_data_wvalid(mshr_io_axi_w_data_wvalid),
    .io_axi_w_wready(mshr_io_axi_w_wready),
    .io_axi_r_data_rid(mshr_io_axi_r_data_rid),
    .io_axi_r_data_rdata(mshr_io_axi_r_data_rdata),
    .io_axi_r_data_rlast(mshr_io_axi_r_data_rlast),
    .io_axi_r_data_rvalid(mshr_io_axi_r_data_rvalid),
    .io_axi_r_rready(mshr_io_axi_r_rready),
    .io_axi_b_data_bid(mshr_io_axi_b_data_bid),
    .io_axi_b_data_bvalid(mshr_io_axi_b_data_bvalid),
    .io_axi_b_bready(mshr_io_axi_b_bready),
    .io_redirectInfo_valid(mshr_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(mshr_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(mshr_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(mshr_io_redirectInfo_bits_robIdx_flag)
  );
  assign io_loadReq_ready = _array_io_read_valid_T & idle_doLsu & loadSelected; // @[src/main/scala/memory/dcache/DCache.scala 390:55]
  assign io_loadResp_valid = _mshr_io_lsAck_valid_T | _mshr_io_lsAck_valid_T_7; // @[src/main/scala/memory/dcache/DCache.scala 395:47]
  assign io_loadResp_bits_lqIdx = curLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 396:26]
  assign io_loadResp_bits_data = _mshr_io_lsAck_valid_T_7 ? _io_loadResp_bits_data_T_18 : _io_loadResp_bits_data_T_59; // @[src/main/scala/memory/dcache/DCache.scala 397:32]
  assign io_storeReq_ready = _io_loadReq_ready_T_1 & storeSelected; // @[src/main/scala/memory/dcache/DCache.scala 391:53]
  assign io_storeAck_valid = _mshr_io_lsAck_valid_T_3 | _mshr_io_lsAck_valid_T_11; // @[src/main/scala/memory/dcache/DCache.scala 403:49]
  assign io_storeAck_bits_sqIdx = curSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 404:26]
  assign io_axi_ar_data_arid = mshr_io_axi_ar_data_arid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_ar_data_araddr = mshr_io_axi_ar_data_araddr; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_ar_data_arlen = mshr_io_axi_ar_data_arlen; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_ar_data_arsize = mshr_io_axi_ar_data_arsize; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_ar_data_arvalid = mshr_io_axi_ar_data_arvalid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_aw_data_awid = mshr_io_axi_aw_data_awid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_aw_data_awaddr = mshr_io_axi_aw_data_awaddr; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_aw_data_awlen = mshr_io_axi_aw_data_awlen; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_aw_data_awsize = mshr_io_axi_aw_data_awsize; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_aw_data_awvalid = mshr_io_axi_aw_data_awvalid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_w_data_wid = mshr_io_axi_w_data_wid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_w_data_wdata = mshr_io_axi_w_data_wdata; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_w_data_wstrb = mshr_io_axi_w_data_wstrb; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_w_data_wlast = mshr_io_axi_w_data_wlast; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_w_data_wvalid = mshr_io_axi_w_data_wvalid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_r_rready = mshr_io_axi_r_rready; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign io_axi_b_bready = mshr_io_axi_b_bready; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign array_clock = clock;
  assign array_reset = reset;
  assign array_io_read_valid = state == 3'h0 & _array_io_read_valid_T_5; // @[src/main/scala/memory/dcache/DCache.scala 334:44]
  assign array_io_read_idx = idle_doReplay ? mshr_io_lsPaddr[13:6] : _array_io_read_idx_T_2; // @[src/main/scala/memory/dcache/DCache.scala 336:29]
  assign array_io_write_valid = _mshr_io_lsAck_valid_T_5 | _mshr_io_refillWriteAck_valid_T; // @[src/main/scala/memory/dcache/DCache.scala 344:44]
  assign array_io_write_idx = _mshr_io_refillWriteAck_valid_T ? refillIdx : curPaddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 345:30]
  assign array_io_write_way = _mshr_io_refillWriteAck_valid_T ? refillWay : curHitWay; // @[src/main/scala/memory/dcache/DCache.scala 346:30]
  assign array_io_write_tag = _mshr_io_refillWriteAck_valid_T ? refillTag : ptag; // @[src/main/scala/memory/dcache/DCache.scala 347:30]
  assign array_io_write_dirty = _mshr_io_refillWriteAck_valid_T ? 1'h0 : 1'h1; // @[src/main/scala/memory/dcache/DCache.scala 348:30]
  assign array_io_write_data = _mshr_io_refillWriteAck_valid_T ? refillData : _array_io_write_data_T_32; // @[src/main/scala/memory/dcache/DCache.scala 349:30]
  assign array_io_metaWrite_valid = _mshr_io_missReq_valid_T & mshr_io_isFirstMiss & curCacheable &
    _array_io_metaWrite_valid_T_3; // @[src/main/scala/memory/dcache/DCache.scala 355:91]
  assign array_io_metaWrite_idx = curPaddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 356:43]
  assign array_io_metaWrite_way = curVictimWay; // @[src/main/scala/memory/dcache/DCache.scala 357:32]
  assign replacer_clock = clock;
  assign replacer_reset = reset;
  assign replacer_io_touch_valid = _mshr_io_lsAck_valid_T_6 | _mshr_io_refillWriteAck_valid_T; // @[src/main/scala/memory/dcache/DCache.scala 367:76]
  assign replacer_io_touch_idx = _mshr_io_refillWriteAck_valid_T ? refillIdx : curPaddr[13:6]; // @[src/main/scala/memory/dcache/DCache.scala 369:33]
  assign replacer_io_touch_way = _mshr_io_refillWriteAck_valid_T ? refillWay : curHitWay; // @[src/main/scala/memory/dcache/DCache.scala 371:33]
  assign replacer_io_victim_req = array_io_read_valid & _idle_doPending_T_5; // @[src/main/scala/memory/dcache/DCache.scala 363:49]
  assign replacer_io_victim_idx = array_io_read_idx; // @[src/main/scala/memory/dcache/DCache.scala 364:26]
  assign mshr_clock = clock;
  assign mshr_reset = reset;
  assign mshr_io_missReq_valid = state == 3'h4 & ~_mshr_io_missReq_valid_T_6; // @[src/main/scala/memory/dcache/DCache.scala 306:51]
  assign mshr_io_missReq_bits_paddr = curPaddr; // @[src/main/scala/memory/dcache/DCache.scala 307:36]
  assign mshr_io_missReq_bits_lqIdx = curLqIdx; // @[src/main/scala/memory/dcache/DCache.scala 308:36]
  assign mshr_io_missReq_bits_sqIdx = curSqIdx; // @[src/main/scala/memory/dcache/DCache.scala 309:36]
  assign mshr_io_missReq_bits_robIdx_value = curRobIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 310:36]
  assign mshr_io_missReq_bits_robIdx_flag = curRobIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 310:36]
  assign mshr_io_missReq_bits_lsuOp = curLsuOp; // @[src/main/scala/memory/dcache/DCache.scala 311:36]
  assign mshr_io_missReq_bits_storeData = curStoreData; // @[src/main/scala/memory/dcache/DCache.scala 312:36]
  assign mshr_io_missReq_bits_isLoad = curIsLoad; // @[src/main/scala/memory/dcache/DCache.scala 313:36]
  assign mshr_io_missReq_bits_isStore = curIsStore; // @[src/main/scala/memory/dcache/DCache.scala 314:36]
  assign mshr_io_missReq_bits_cacheable = curCacheable; // @[src/main/scala/memory/dcache/DCache.scala 315:36]
  assign mshr_io_missReq_bits_victimWay = curVictimWay; // @[src/main/scala/memory/dcache/DCache.scala 316:36]
  assign mshr_io_missReq_bits_victimDirty = curCacheable & _GEN_5; // @[src/main/scala/memory/dcache/DCache.scala 317:52]
  assign mshr_io_missReq_bits_victimTag = curCacheable ? _GEN_9 : 18'h0; // @[src/main/scala/memory/dcache/DCache.scala 318:42]
  assign mshr_io_missReq_bits_victimData = curCacheable ? _GEN_13 : 512'h0; // @[src/main/scala/memory/dcache/DCache.scala 319:42]
  assign mshr_io_probeBlockAddr = curPaddr[31:6]; // @[src/main/scala/memory/dcache/DCache.scala 303:37]
  assign mshr_io_refillWriteAck_valid = state == 3'h5; // @[src/main/scala/memory/dcache/DCache.scala 322:41]
  assign mshr_io_refillWriteAck_bits = refillPrimId; // @[src/main/scala/memory/dcache/DCache.scala 323:32]
  assign mshr_io_lsAck_valid = curIsReplay & _mshr_io_lsAck_valid_T_14; // @[src/main/scala/memory/dcache/DCache.scala 326:38]
  assign mshr_io_lsAck_bits = curLsIdx; // @[src/main/scala/memory/dcache/DCache.scala 330:23]
  assign mshr_io_axi_ar_arready = io_axi_ar_arready; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_aw_awready = io_axi_aw_awready; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_w_wready = io_axi_w_wready; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_r_data_rid = io_axi_r_data_rid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_r_data_rdata = io_axi_r_data_rdata; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_r_data_rlast = io_axi_r_data_rlast; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_r_data_rvalid = io_axi_r_data_rvalid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_b_data_bid = io_axi_b_data_bid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_axi_b_data_bvalid = io_axi_b_data_bvalid; // @[src/main/scala/memory/dcache/DCache.scala 300:15]
  assign mshr_io_redirectInfo_valid = io_redirectInfo_valid; // @[src/main/scala/memory/dcache/DCache.scala 299:24]
  assign mshr_io_redirectInfo_bits_doRedirect = io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/dcache/DCache.scala 299:24]
  assign mshr_io_redirectInfo_bits_robIdx_value = io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/dcache/DCache.scala 299:24]
  assign mshr_io_redirectInfo_bits_robIdx_flag = io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/dcache/DCache.scala 299:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 54:22]
      state <= 3'h0; // @[src/main/scala/memory/dcache/DCache.scala 54:22]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (mshr_io_refillWriteReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          state <= 3'h5; // @[src/main/scala/memory/dcache/DCache.scala 419:22]
        end else begin
          state <= _GEN_134;
        end
      end
    end else if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (_T_21) begin // @[src/main/scala/memory/dcache/DCache.scala 495:38]
        state <= 3'h2; // @[src/main/scala/memory/dcache/DCache.scala 497:19]
      end else begin
        state <= _GEN_184;
      end
    end else if (3'h2 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      state <= _GEN_201;
    end else begin
      state <= _GEN_246;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 59:29]
      curPaddr <= 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 59:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curPaddr <= _GEN_130;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 60:29]
      curLqIdx <= 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 60:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curLqIdx <= _GEN_128;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 61:29]
      curSqIdx <= 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 61:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curSqIdx <= _GEN_135;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 62:29]
      curRobIdx_value <= 6'h0; // @[src/main/scala/memory/dcache/DCache.scala 62:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curRobIdx_value <= _GEN_140;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 62:29]
      curRobIdx_flag <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 62:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curRobIdx_flag <= _GEN_141;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 63:29]
      curLsuOp <= 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 63:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curLsuOp <= _GEN_131;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 64:29]
      curStoreData <= 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 64:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curStoreData <= _GEN_136;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 65:29]
      curIsLoad <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 65:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curIsLoad <= _GEN_137;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 66:29]
      curIsStore <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 66:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curIsStore <= _GEN_138;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 67:29]
      curCacheable <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 67:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curCacheable <= _GEN_139;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 68:29]
      curIsReplay <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 68:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curIsReplay <= _GEN_132;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 69:29]
      curLsIdx <= 2'h0; // @[src/main/scala/memory/dcache/DCache.scala 69:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curLsIdx <= _GEN_129;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_0_dirty <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_0_dirty <= array_io_read_resp_ways_0_dirty; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_0_tag <= 18'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_0_tag <= array_io_read_resp_ways_0_tag; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_0_data <= 512'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_0_data <= array_io_read_resp_ways_0_data; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_1_dirty <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_1_dirty <= array_io_read_resp_ways_1_dirty; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_1_tag <= 18'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_1_tag <= array_io_read_resp_ways_1_tag; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_1_data <= 512'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_1_data <= array_io_read_resp_ways_1_data; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_2_dirty <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_2_dirty <= array_io_read_resp_ways_2_dirty; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_2_tag <= 18'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_2_tag <= array_io_read_resp_ways_2_tag; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_2_data <= 512'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_2_data <= array_io_read_resp_ways_2_data; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_3_dirty <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_3_dirty <= array_io_read_resp_ways_3_dirty; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_3_tag <= 18'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_3_tag <= array_io_read_resp_ways_3_tag; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 70:29]
      curArrayData_ways_3_data <= 512'h0; // @[src/main/scala/memory/dcache/DCache.scala 70:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curArrayData_ways_3_data <= array_io_read_resp_ways_3_data; // @[src/main/scala/memory/dcache/DCache.scala 481:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 71:29]
      curHitWay <= 2'h0; // @[src/main/scala/memory/dcache/DCache.scala 71:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (_T_21) begin // @[src/main/scala/memory/dcache/DCache.scala 504:32]
          curHitWay <= s1HitWay; // @[src/main/scala/memory/dcache/DCache.scala 505:19]
        end else begin
          curHitWay <= _GEN_196;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 72:29]
      curVictimWay <= 2'h0; // @[src/main/scala/memory/dcache/DCache.scala 72:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        curVictimWay <= replacer_io_victim_resp; // @[src/main/scala/memory/dcache/DCache.scala 482:20]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 73:29]
      curUcData <= 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 73:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          curUcData <= _GEN_133;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 77:30]
      pendPaddr <= 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 77:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendPaddr <= _GEN_247;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 78:30]
      pendLqIdx <= 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 78:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendLqIdx <= _GEN_248;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 79:30]
      pendSqIdx <= 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 79:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendSqIdx <= _GEN_249;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 80:30]
      pendRobIdx_value <= 6'h0; // @[src/main/scala/memory/dcache/DCache.scala 80:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendRobIdx_value <= _GEN_250;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 80:30]
      pendRobIdx_flag <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 80:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendRobIdx_flag <= _GEN_251;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 81:30]
      pendLsuOp <= 4'h0; // @[src/main/scala/memory/dcache/DCache.scala 81:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendLsuOp <= _GEN_252;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 82:30]
      pendStoreData <= 32'h0; // @[src/main/scala/memory/dcache/DCache.scala 82:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendStoreData <= _GEN_253;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 83:30]
      pendIsLoad <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 83:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendIsLoad <= _GEN_254;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 84:30]
      pendIsStore <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 84:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendIsStore <= _GEN_255;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 85:30]
      pendCacheable <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 85:30]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
          pendCacheable <= _GEN_256;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 89:28]
      pendingMiss <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 89:28]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (pendingFlushed) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        pendingMiss <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 412:21]
      end else if (!(mshr_io_refillWriteReq_valid)) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
        pendingMiss <= _GEN_142;
      end
    end else if (3'h1 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (_mshr_io_missReq_valid_T_6 & curIsLoad & ~curIsStore) begin // @[src/main/scala/memory/dcache/DCache.scala 483:65]
        pendingMiss <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 485:22]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      pendingMiss <= _GEN_200;
    end else begin
      pendingMiss <= _GEN_245;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 92:29]
      refillIdx <= 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 92:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (mshr_io_refillWriteReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          refillIdx <= mshr_io_refillWriteReq_bits_idx; // @[src/main/scala/memory/dcache/DCache.scala 414:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 93:29]
      refillWay <= 2'h0; // @[src/main/scala/memory/dcache/DCache.scala 93:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (mshr_io_refillWriteReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          refillWay <= mshr_io_refillWriteReq_bits_way; // @[src/main/scala/memory/dcache/DCache.scala 415:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 94:29]
      refillTag <= 18'h0; // @[src/main/scala/memory/dcache/DCache.scala 94:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (mshr_io_refillWriteReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          refillTag <= mshr_io_refillWriteReq_bits_tag; // @[src/main/scala/memory/dcache/DCache.scala 416:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 95:29]
      refillData <= 512'h0; // @[src/main/scala/memory/dcache/DCache.scala 95:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (mshr_io_refillWriteReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          refillData <= mshr_io_refillWriteReq_bits_data; // @[src/main/scala/memory/dcache/DCache.scala 417:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 96:29]
      refillPrimId <= 1'h0; // @[src/main/scala/memory/dcache/DCache.scala 96:29]
    end else if (3'h0 == state) begin // @[src/main/scala/memory/dcache/DCache.scala 409:17]
      if (!(pendingFlushed)) begin // @[src/main/scala/memory/dcache/DCache.scala 411:28]
        if (mshr_io_refillWriteReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 413:33]
          refillPrimId <= mshr_io_refillWritePrimId; // @[src/main/scala/memory/dcache/DCache.scala 418:22]
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCache.scala 101:30]
      storeWaitCnt <= 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 101:30]
    end else if (io_storeReq_valid & ~io_loadReq_valid) begin // @[src/main/scala/memory/dcache/DCache.scala 103:48]
      storeWaitCnt <= 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 104:18]
    end else if (io_storeReq_valid & io_loadReq_valid & ~storeStarving) begin // @[src/main/scala/memory/dcache/DCache.scala 105:71]
      storeWaitCnt <= _storeWaitCnt_T_1; // @[src/main/scala/memory/dcache/DCache.scala 106:18]
    end else begin
      storeWaitCnt <= 8'h0; // @[src/main/scala/memory/dcache/DCache.scala 108:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  curPaddr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  curLqIdx = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  curSqIdx = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  curRobIdx_value = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  curRobIdx_flag = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  curLsuOp = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  curStoreData = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  curIsLoad = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  curIsStore = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  curCacheable = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  curIsReplay = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  curLsIdx = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  curArrayData_ways_0_dirty = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  curArrayData_ways_0_tag = _RAND_14[17:0];
  _RAND_15 = {16{`RANDOM}};
  curArrayData_ways_0_data = _RAND_15[511:0];
  _RAND_16 = {1{`RANDOM}};
  curArrayData_ways_1_dirty = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  curArrayData_ways_1_tag = _RAND_17[17:0];
  _RAND_18 = {16{`RANDOM}};
  curArrayData_ways_1_data = _RAND_18[511:0];
  _RAND_19 = {1{`RANDOM}};
  curArrayData_ways_2_dirty = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  curArrayData_ways_2_tag = _RAND_20[17:0];
  _RAND_21 = {16{`RANDOM}};
  curArrayData_ways_2_data = _RAND_21[511:0];
  _RAND_22 = {1{`RANDOM}};
  curArrayData_ways_3_dirty = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  curArrayData_ways_3_tag = _RAND_23[17:0];
  _RAND_24 = {16{`RANDOM}};
  curArrayData_ways_3_data = _RAND_24[511:0];
  _RAND_25 = {1{`RANDOM}};
  curHitWay = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  curVictimWay = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  curUcData = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  pendPaddr = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  pendLqIdx = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  pendSqIdx = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  pendRobIdx_value = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  pendRobIdx_flag = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  pendLsuOp = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  pendStoreData = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  pendIsLoad = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  pendIsStore = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  pendCacheable = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  pendingMiss = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  refillIdx = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  refillWay = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  refillTag = _RAND_41[17:0];
  _RAND_42 = {16{`RANDOM}};
  refillData = _RAND_42[511:0];
  _RAND_43 = {1{`RANDOM}};
  refillPrimId = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  storeWaitCnt = _RAND_44[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
