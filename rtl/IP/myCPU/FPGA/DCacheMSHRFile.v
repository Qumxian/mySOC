module DCacheMSHRFile(
  input          clock,
  input          reset,
  output         io_missReq_ready, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_missReq_valid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [31:0]  io_missReq_bits_paddr, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [3:0]   io_missReq_bits_lqIdx, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [3:0]   io_missReq_bits_sqIdx, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [5:0]   io_missReq_bits_robIdx_value, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_missReq_bits_robIdx_flag, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [3:0]   io_missReq_bits_lsuOp, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [31:0]  io_missReq_bits_storeData, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_missReq_bits_isLoad, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_missReq_bits_isStore, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_missReq_bits_cacheable, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [1:0]   io_missReq_bits_victimWay, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_missReq_bits_victimDirty, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [17:0]  io_missReq_bits_victimTag, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [511:0] io_missReq_bits_victimData, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [25:0]  io_probeBlockAddr, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_isFirstMiss, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_hasStore, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_refillWriteReq_valid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [7:0]   io_refillWriteReq_bits_idx, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [1:0]   io_refillWriteReq_bits_way, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [17:0]  io_refillWriteReq_bits_tag, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [511:0] io_refillWriteReq_bits_data, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_refillWriteAck_valid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_refillWriteAck_bits, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_refillWritePrimId, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_lsReady, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [1:0]   io_lsIdx, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_lsIsUncache, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [31:0]  io_lsUncacheData, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [31:0]  io_lsPaddr, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [3:0]   io_lsLqIdx, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [3:0]   io_lsSqIdx, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [3:0]   io_lsLsuOp, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [31:0]  io_lsStoreData, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_lsIsLoad, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_lsIsStore, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_lsAck_valid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [1:0]   io_lsAck_bits, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [3:0]   io_axi_ar_data_arid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [31:0]  io_axi_ar_data_araddr, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [7:0]   io_axi_ar_data_arlen, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [2:0]   io_axi_ar_data_arsize, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_axi_ar_data_arvalid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_axi_ar_arready, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [3:0]   io_axi_aw_data_awid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [31:0]  io_axi_aw_data_awaddr, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [7:0]   io_axi_aw_data_awlen, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [2:0]   io_axi_aw_data_awsize, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_axi_aw_data_awvalid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_axi_aw_awready, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [3:0]   io_axi_w_data_wid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [31:0]  io_axi_w_data_wdata, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output [3:0]   io_axi_w_data_wstrb, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_axi_w_data_wlast, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_axi_w_data_wvalid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_axi_w_wready, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [3:0]   io_axi_r_data_rid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [31:0]  io_axi_r_data_rdata, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_axi_r_data_rlast, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_axi_r_data_rvalid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_axi_r_rready, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [3:0]   io_axi_b_data_bid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_axi_b_data_bvalid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  output         io_axi_b_bready, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_redirectInfo_valid, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_redirectInfo_bits_doRedirect, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input  [5:0]   io_redirectInfo_bits_robIdx_value, // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
  input          io_redirectInfo_bits_robIdx_flag // @[src/main/scala/memory/dcache/DCacheMSHR.scala 18:14]
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
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
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
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
`endif // RANDOMIZE_REG_INIT
  wire  primaries_0_clock; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_reset; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_id; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_req_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_req_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_0_io_req_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [1:0] primaries_0_io_req_bits_reqType; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [1:0] primaries_0_io_req_bits_victimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_req_bits_victimDirty; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [17:0] primaries_0_io_req_bits_victimTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [511:0] primaries_0_io_req_bits_victimData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_0_io_req_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_0_io_req_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_ar_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_ar_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_0_io_ar_bits_arid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_0_io_ar_bits_araddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [7:0] primaries_0_io_ar_bits_arlen; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_r_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_r_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_0_io_r_bits_rdata; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_r_bits_rlast; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_aw_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_aw_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_0_io_aw_bits_awid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_0_io_aw_bits_awaddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [7:0] primaries_0_io_aw_bits_awlen; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [2:0] primaries_0_io_aw_bits_awsize; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_w_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_w_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_0_io_w_bits_wid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_0_io_w_bits_wdata; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_0_io_w_bits_wstrb; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_w_bits_wlast; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_b_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_b_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_refillWriteReq; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_refillWriteAck; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_0_io_uncacheData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [511:0] primaries_0_io_refillData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [17:0] primaries_0_io_refillTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_release; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_busy; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_done; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [25:0] primaries_0_io_blockAddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [7:0] primaries_0_io_setIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [1:0] primaries_0_io_mshrVictimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_canAccept; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_0_io_isUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_clock; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_reset; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_id; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_req_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_req_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_1_io_req_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [1:0] primaries_1_io_req_bits_reqType; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [1:0] primaries_1_io_req_bits_victimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_req_bits_victimDirty; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [17:0] primaries_1_io_req_bits_victimTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [511:0] primaries_1_io_req_bits_victimData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_1_io_req_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_1_io_req_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_ar_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_ar_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_1_io_ar_bits_arid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_1_io_ar_bits_araddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [7:0] primaries_1_io_ar_bits_arlen; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_r_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_r_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_1_io_r_bits_rdata; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_r_bits_rlast; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_aw_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_aw_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_1_io_aw_bits_awid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_1_io_aw_bits_awaddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [7:0] primaries_1_io_aw_bits_awlen; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [2:0] primaries_1_io_aw_bits_awsize; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_w_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_w_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_1_io_w_bits_wid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_1_io_w_bits_wdata; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [3:0] primaries_1_io_w_bits_wstrb; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_w_bits_wlast; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_b_ready; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_b_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_refillWriteReq; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_refillWriteAck; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [31:0] primaries_1_io_uncacheData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [511:0] primaries_1_io_refillData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [17:0] primaries_1_io_refillTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_release; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_busy; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_done; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [25:0] primaries_1_io_blockAddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [7:0] primaries_1_io_setIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire [1:0] primaries_1_io_mshrVictimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_canAccept; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  wire  primaries_1_io_isUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
  reg  lsValid_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
  reg  lsValid_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
  reg  lsValid_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
  reg  lsValid_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
  reg  lsReadyReg_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
  reg  lsReadyReg_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
  reg  lsReadyReg_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
  reg  lsReadyReg_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
  reg [31:0] lsPaddr_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
  reg [31:0] lsPaddr_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
  reg [31:0] lsPaddr_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
  reg [31:0] lsPaddr_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
  reg [3:0] lsLqIdx_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
  reg [3:0] lsLqIdx_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
  reg [3:0] lsLqIdx_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
  reg [3:0] lsLqIdx_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
  reg [3:0] lsSqIdx_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
  reg [3:0] lsSqIdx_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
  reg [3:0] lsSqIdx_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
  reg [3:0] lsSqIdx_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
  reg [5:0] lsRobIdx_0_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg  lsRobIdx_0_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg [5:0] lsRobIdx_1_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg  lsRobIdx_1_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg [5:0] lsRobIdx_2_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg  lsRobIdx_2_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg [5:0] lsRobIdx_3_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg  lsRobIdx_3_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
  reg [3:0] lsLsuOp_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
  reg [3:0] lsLsuOp_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
  reg [3:0] lsLsuOp_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
  reg [3:0] lsLsuOp_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
  reg [31:0] lsStoreData_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
  reg [31:0] lsStoreData_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
  reg [31:0] lsStoreData_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
  reg [31:0] lsStoreData_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
  reg  lsIsLoad_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
  reg  lsIsLoad_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
  reg  lsIsLoad_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
  reg  lsIsLoad_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
  reg  lsIsStore_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
  reg  lsIsStore_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
  reg  lsIsStore_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
  reg  lsIsStore_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
  reg  lsPrimaryId_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
  reg  lsPrimaryId_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
  reg  lsPrimaryId_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
  reg  lsPrimaryId_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
  reg  lsIsUncache_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
  reg  lsIsUncache_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
  reg  lsIsUncache_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
  reg  lsIsUncache_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
  reg  lsFlushed_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
  reg  lsFlushed_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
  reg  lsFlushed_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
  reg  lsFlushed_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
  wire  reqIsUncache = ~io_missReq_bits_cacheable; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 88:23]
  wire  blockMatchVec_0 = primaries_0_io_busy & ~primaries_0_io_isUncache & primaries_0_io_blockAddr ==
    io_probeBlockAddr & ~reqIsUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 90:111]
  wire  blockMatchVec_1 = primaries_1_io_busy & ~primaries_1_io_isUncache & primaries_1_io_blockAddr ==
    io_probeBlockAddr & ~reqIsUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 90:111]
  wire [1:0] _io_probeMatch_T = {blockMatchVec_1,blockMatchVec_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 91:44]
  wire  _io_probeMatch_T_1 = |_io_probeMatch_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 91:51]
  wire  _io_isFirstMiss_T_2 = ~_io_probeMatch_T_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 92:21]
  wire  _io_matchPrimId_T = blockMatchVec_0 ? 1'h0 : 1'h1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  _io_hasStore_T_1 = ~lsFlushed_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:80]
  wire  _io_hasStore_T_2 = lsValid_0 & lsIsStore_0 & ~lsFlushed_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:77]
  wire  _io_hasStore_T_4 = ~lsFlushed_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:80]
  wire  _io_hasStore_T_5 = lsValid_1 & lsIsStore_1 & ~lsFlushed_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:77]
  wire  _io_hasStore_T_7 = ~lsFlushed_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:80]
  wire  _io_hasStore_T_8 = lsValid_2 & lsIsStore_2 & ~lsFlushed_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:77]
  wire  _io_hasStore_T_10 = ~lsFlushed_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:80]
  wire  _io_hasStore_T_11 = lsValid_3 & lsIsStore_3 & ~lsFlushed_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:77]
  wire [3:0] _io_hasStore_T_12 = {_io_hasStore_T_11,_io_hasStore_T_8,_io_hasStore_T_5,_io_hasStore_T_2}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:96]
  wire [25:0] reqBlockAddr = io_missReq_bits_paddr[31:6]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 99:44]
  wire [7:0] reqSetIdx = io_missReq_bits_paddr[13:6]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 100:44]
  wire  _freePrimMask_WIRE_1 = primaries_1_io_canAccept; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 106:{29,29}]
  wire  _freePrimMask_WIRE_0 = primaries_0_io_canAccept; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 106:{29,29}]
  wire [1:0] freePrimMask = {_freePrimMask_WIRE_1,_freePrimMask_WIRE_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 106:61]
  wire  hasFreePrim = |freePrimMask; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 107:35]
  wire  allocPrimId = freePrimMask[0] ? 1'h0 : 1'h1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  _freeSecMask_T = ~lsValid_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 110:53]
  wire  _freeSecMask_T_1 = ~lsValid_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 110:53]
  wire  _freeSecMask_T_2 = ~lsValid_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 110:53]
  wire  _freeSecMask_T_3 = ~lsValid_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 110:53]
  wire [3:0] freeSecMask = {_freeSecMask_T_3,_freeSecMask_T_2,_freeSecMask_T_1,_freeSecMask_T}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 110:67]
  wire  hasFreeSec = |freeSecMask; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 111:33]
  wire [1:0] _allocSecIdx_T_4 = freeSecMask[2] ? 2'h2 : 2'h3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _allocSecIdx_T_5 = freeSecMask[1] ? 2'h1 : _allocSecIdx_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] allocSecIdx = freeSecMask[0] ? 2'h0 : _allocSecIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  setConflictVec_0 = primaries_0_io_busy & primaries_0_io_setIdx == reqSetIdx & primaries_0_io_blockAddr !=
    reqBlockAddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 115:44]
  wire  setConflictVec_1 = primaries_1_io_busy & primaries_1_io_setIdx == reqSetIdx & primaries_1_io_blockAddr !=
    reqBlockAddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 115:44]
  wire [1:0] _setConflict_T = {setConflictVec_1,setConflictVec_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 117:45]
  wire  setConflict = |_setConflict_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 117:52]
  wire  canAllocFirst = hasFreePrim & hasFreeSec & ~setConflict; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 120:50]
  wire  _canAllocReq_T = _io_isFirstMiss_T_2 ? canAllocFirst : hasFreeSec; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 125:24]
  wire  _lsAllDone_T_3 = lsValid_0 & ~lsPrimaryId_0 & _io_hasStore_T_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire  _lsAllDone_T_7 = lsValid_1 & ~lsPrimaryId_1 & _io_hasStore_T_4; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire  _lsAllDone_T_11 = lsValid_2 & ~lsPrimaryId_2 & _io_hasStore_T_7; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire  _lsAllDone_T_15 = lsValid_3 & ~lsPrimaryId_3 & _io_hasStore_T_10; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire [3:0] _lsAllDone_T_16 = {_lsAllDone_T_15,_lsAllDone_T_11,_lsAllDone_T_7,_lsAllDone_T_3}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 135:8]
  wire  _lsAllDone_T_17 = |_lsAllDone_T_16; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 135:15]
  wire  lsAllDone = ~_lsAllDone_T_17; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 133:21]
  wire  _allocThisPrim_T = ~allocPrimId; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 140:55]
  wire  allocThisPrim = _io_isFirstMiss_T_2 & ~allocPrimId; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 140:40]
  wire  allocUncacheThis = reqIsUncache & _allocThisPrim_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 141:41]
  wire  _primaries_0_io_req_valid_T = io_missReq_ready & io_missReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [1:0] _primaries_0_io_req_bits_reqType_T = io_missReq_bits_isLoad ? 2'h1 : 2'h2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 145:10]
  wire  _lsAllDone_T_21 = lsValid_0 & lsPrimaryId_0 & _io_hasStore_T_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire  _lsAllDone_T_25 = lsValid_1 & lsPrimaryId_1 & _io_hasStore_T_4; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire  _lsAllDone_T_29 = lsValid_2 & lsPrimaryId_2 & _io_hasStore_T_7; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire  _lsAllDone_T_33 = lsValid_3 & lsPrimaryId_3 & _io_hasStore_T_10; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 134:44]
  wire [3:0] _lsAllDone_T_34 = {_lsAllDone_T_33,_lsAllDone_T_29,_lsAllDone_T_25,_lsAllDone_T_21}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 135:8]
  wire  _lsAllDone_T_35 = |_lsAllDone_T_34; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 135:15]
  wire  lsAllDone_1 = ~_lsAllDone_T_35; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 133:21]
  wire  allocThisPrim_1 = _io_isFirstMiss_T_2 & allocPrimId; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 140:40]
  wire  allocUncacheThis_1 = reqIsUncache & allocPrimId; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 141:41]
  wire  _GEN_222 = 2'h0 == allocSecIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_0 = 2'h0 == allocSecIdx | lsValid_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_223 = 2'h1 == allocSecIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_1 = 2'h1 == allocSecIdx | lsValid_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_224 = 2'h2 == allocSecIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_2 = 2'h2 == allocSecIdx | lsValid_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_225 = 2'h3 == allocSecIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_3 = 2'h3 == allocSecIdx | lsValid_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 158:{22,22} 73:28]
  wire  _GEN_4 = 2'h0 == allocSecIdx ? 1'h0 : lsReadyReg_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 159:{22,22} 74:28]
  wire  _GEN_5 = 2'h1 == allocSecIdx ? 1'h0 : lsReadyReg_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 159:{22,22} 74:28]
  wire  _GEN_6 = 2'h2 == allocSecIdx ? 1'h0 : lsReadyReg_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 159:{22,22} 74:28]
  wire  _GEN_7 = 2'h3 == allocSecIdx ? 1'h0 : lsReadyReg_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 159:{22,22} 74:28]
  wire  _GEN_48 = 2'h0 == allocSecIdx ? 1'h0 : lsFlushed_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 169:{22,22} 85:28]
  wire  _GEN_49 = 2'h1 == allocSecIdx ? 1'h0 : lsFlushed_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 169:{22,22} 85:28]
  wire  _GEN_50 = 2'h2 == allocSecIdx ? 1'h0 : lsFlushed_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 169:{22,22} 85:28]
  wire  _GEN_51 = 2'h3 == allocSecIdx ? 1'h0 : lsFlushed_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 169:{22,22} 85:28]
  wire  primId = _io_isFirstMiss_T_2 ? allocPrimId : _io_matchPrimId_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 171:21]
  wire  _fastDone_T_1 = primaries_0_io_done & ~primId; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 176:17]
  wire  _fastDone_T_3 = primaries_1_io_done & primId; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 176:17]
  wire [1:0] _fastDone_T_4 = {_fastDone_T_3,_fastDone_T_1}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 177:8]
  wire  fastDone = |_fastDone_T_4; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 177:15]
  wire  _GEN_60 = fastDone ? _GEN_222 | _GEN_4 : _GEN_4; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 178:20]
  wire  _GEN_61 = fastDone ? _GEN_223 | _GEN_5 : _GEN_5; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 178:20]
  wire  _GEN_62 = fastDone ? _GEN_224 | _GEN_6 : _GEN_6; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 178:20]
  wire  _GEN_63 = fastDone ? _GEN_225 | _GEN_7 : _GEN_7; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 178:20]
  wire  _GEN_64 = _primaries_0_io_req_valid_T ? _GEN_0 : lsValid_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 73:28]
  wire  _GEN_65 = _primaries_0_io_req_valid_T ? _GEN_1 : lsValid_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 73:28]
  wire  _GEN_66 = _primaries_0_io_req_valid_T ? _GEN_2 : lsValid_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 73:28]
  wire  _GEN_67 = _primaries_0_io_req_valid_T ? _GEN_3 : lsValid_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 73:28]
  wire  _GEN_68 = _primaries_0_io_req_valid_T ? _GEN_60 : lsReadyReg_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 74:28]
  wire  _GEN_69 = _primaries_0_io_req_valid_T ? _GEN_61 : lsReadyReg_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 74:28]
  wire  _GEN_70 = _primaries_0_io_req_valid_T ? _GEN_62 : lsReadyReg_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 74:28]
  wire  _GEN_71 = _primaries_0_io_req_valid_T ? _GEN_63 : lsReadyReg_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 74:28]
  wire  _GEN_112 = _primaries_0_io_req_valid_T ? _GEN_48 : lsFlushed_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 85:28]
  wire  _GEN_113 = _primaries_0_io_req_valid_T ? _GEN_49 : lsFlushed_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 85:28]
  wire  _GEN_114 = _primaries_0_io_req_valid_T ? _GEN_50 : lsFlushed_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 85:28]
  wire  _GEN_115 = _primaries_0_io_req_valid_T ? _GEN_51 : lsFlushed_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25 85:28]
  reg  prevDone; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
  wire  _GEN_120 = _lsAllDone_T_3 | _GEN_68; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_121 = _lsAllDone_T_7 | _GEN_69; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_122 = _lsAllDone_T_11 | _GEN_70; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_123 = _lsAllDone_T_15 | _GEN_71; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_124 = primaries_0_io_done & ~prevDone ? _GEN_120 : _GEN_68; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  wire  _GEN_125 = primaries_0_io_done & ~prevDone ? _GEN_121 : _GEN_69; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  wire  _GEN_126 = primaries_0_io_done & ~prevDone ? _GEN_122 : _GEN_70; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  wire  _GEN_127 = primaries_0_io_done & ~prevDone ? _GEN_123 : _GEN_71; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  reg  prevDone_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
  wire  _GEN_128 = _lsAllDone_T_21 | _GEN_124; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_129 = _lsAllDone_T_25 | _GEN_125; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_130 = _lsAllDone_T_29 | _GEN_126; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_131 = _lsAllDone_T_33 | _GEN_127; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 186:69 187:25]
  wire  _GEN_132 = primaries_1_io_done & ~prevDone_1 ? _GEN_128 : _GEN_124; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  wire  _GEN_133 = primaries_1_io_done & ~prevDone_1 ? _GEN_129 : _GEN_125; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  wire  _GEN_134 = primaries_1_io_done & ~prevDone_1 ? _GEN_130 : _GEN_126; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  wire  _GEN_135 = primaries_1_io_done & ~prevDone_1 ? _GEN_131 : _GEN_127; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 184:45]
  wire  _T_39 = ~lsIsStore_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 196:41]
  wire  _T_44 = lsRobIdx_0_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _T_45 = lsRobIdx_0_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _T_46 = lsRobIdx_0_flag == io_redirectInfo_bits_robIdx_flag ? _T_44 : _T_45; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_136 = _T_46 | _GEN_112; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 197:64 198:24]
  wire  _T_48 = ~lsIsStore_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 196:41]
  wire  _T_53 = lsRobIdx_1_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _T_54 = lsRobIdx_1_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _T_55 = lsRobIdx_1_flag == io_redirectInfo_bits_robIdx_flag ? _T_53 : _T_54; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_138 = _T_55 | _GEN_113; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 197:64 198:24]
  wire  _T_57 = ~lsIsStore_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 196:41]
  wire  _T_62 = lsRobIdx_2_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _T_63 = lsRobIdx_2_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _T_64 = lsRobIdx_2_flag == io_redirectInfo_bits_robIdx_flag ? _T_62 : _T_63; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_140 = _T_64 | _GEN_114; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 197:64 198:24]
  wire  _T_71 = lsRobIdx_3_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _T_72 = lsRobIdx_3_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _T_73 = lsRobIdx_3_flag == io_redirectInfo_bits_robIdx_flag ? _T_71 : _T_72; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_142 = _T_73 | _GEN_115; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 197:64 198:24]
  wire  _GEN_148 = lsValid_0 & lsFlushed_0 ? 1'h0 : _GEN_64; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 207:21]
  wire  _GEN_149 = lsValid_0 & lsFlushed_0 ? 1'h0 : _GEN_132; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 208:21]
  wire  _GEN_151 = lsValid_1 & lsFlushed_1 ? 1'h0 : _GEN_65; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 207:21]
  wire  _GEN_152 = lsValid_1 & lsFlushed_1 ? 1'h0 : _GEN_133; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 208:21]
  wire  _GEN_154 = lsValid_2 & lsFlushed_2 ? 1'h0 : _GEN_66; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 207:21]
  wire  _GEN_155 = lsValid_2 & lsFlushed_2 ? 1'h0 : _GEN_134; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 208:21]
  wire  _GEN_157 = lsValid_3 & lsFlushed_3 ? 1'h0 : _GEN_67; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 207:21]
  wire  _GEN_158 = lsValid_3 & lsFlushed_3 ? 1'h0 : _GEN_135; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38 208:21]
  wire  _readyStores_0_T = lsValid_0 & lsReadyReg_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:34]
  wire  readyStores_0 = lsValid_0 & lsReadyReg_0 & lsIsStore_0 & _io_hasStore_T_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:67]
  wire  readyLoads_0 = _readyStores_0_T & _T_39 & _io_hasStore_T_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 225:68]
  wire  _readyStores_1_T = lsValid_1 & lsReadyReg_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:34]
  wire  readyStores_1 = lsValid_1 & lsReadyReg_1 & lsIsStore_1 & _io_hasStore_T_4; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:67]
  wire  readyLoads_1 = _readyStores_1_T & _T_48 & _io_hasStore_T_4; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 225:68]
  wire  _readyStores_2_T = lsValid_2 & lsReadyReg_2; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:34]
  wire  readyStores_2 = lsValid_2 & lsReadyReg_2 & lsIsStore_2 & _io_hasStore_T_7; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:67]
  wire  readyLoads_2 = _readyStores_2_T & _T_57 & _io_hasStore_T_7; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 225:68]
  wire  _readyStores_3_T = lsValid_3 & lsReadyReg_3; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:34]
  wire  readyStores_3 = lsValid_3 & lsReadyReg_3 & lsIsStore_3 & _io_hasStore_T_10; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 224:67]
  wire [3:0] _hasReadyStore_T = {readyStores_3,readyStores_2,readyStores_1,readyStores_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 227:35]
  wire  hasReadyStore = |_hasReadyStore_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 227:42]
  wire  _hasReadyLs_T_2 = _readyStores_0_T & _io_hasStore_T_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 229:33]
  wire  _hasReadyLs_T_5 = _readyStores_1_T & _io_hasStore_T_4; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 229:33]
  wire  _hasReadyLs_T_8 = _readyStores_2_T & _io_hasStore_T_7; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 229:33]
  wire  _hasReadyLs_T_11 = _readyStores_3_T & _io_hasStore_T_10; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 229:33]
  wire [3:0] _hasReadyLs_T_12 = {_hasReadyLs_T_11,_hasReadyLs_T_8,_hasReadyLs_T_5,_hasReadyLs_T_2}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 230:6]
  wire [1:0] _selectedLsIdx_T = readyStores_2 ? 2'h2 : 2'h3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _selectedLsIdx_T_1 = readyStores_1 ? 2'h1 : _selectedLsIdx_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _selectedLsIdx_T_2 = readyStores_0 ? 2'h0 : _selectedLsIdx_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _selectedLsIdx_T_3 = readyLoads_2 ? 2'h2 : 2'h3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _selectedLsIdx_T_4 = readyLoads_1 ? 2'h1 : _selectedLsIdx_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] _selectedLsIdx_T_5 = readyLoads_0 ? 2'h0 : _selectedLsIdx_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [1:0] selectedLsIdx = hasReadyStore ? _selectedLsIdx_T_2 : _selectedLsIdx_T_5; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 231:26]
  wire  _GEN_177 = 2'h1 == selectedLsIdx ? lsIsUncache_1 : lsIsUncache_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 235:{20,20}]
  wire  _GEN_178 = 2'h2 == selectedLsIdx ? lsIsUncache_2 : _GEN_177; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 235:{20,20}]
  wire  _GEN_181 = 2'h1 == selectedLsIdx ? lsPrimaryId_1 : lsPrimaryId_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 236:{20,20}]
  wire  _GEN_182 = 2'h2 == selectedLsIdx ? lsPrimaryId_2 : _GEN_181; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 236:{20,20}]
  wire  _GEN_183 = 2'h3 == selectedLsIdx ? lsPrimaryId_3 : _GEN_182; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 236:{20,20}]
  wire [31:0] _io_lsUncacheData_WIRE_0 = primaries_0_io_uncacheData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 236:{30,30}]
  wire [31:0] _io_lsUncacheData_WIRE_1 = primaries_1_io_uncacheData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 236:{30,30}]
  wire [31:0] _GEN_187 = 2'h1 == selectedLsIdx ? lsPaddr_1 : lsPaddr_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 237:{20,20}]
  wire [31:0] _GEN_188 = 2'h2 == selectedLsIdx ? lsPaddr_2 : _GEN_187; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 237:{20,20}]
  wire [3:0] _GEN_191 = 2'h1 == selectedLsIdx ? lsLqIdx_1 : lsLqIdx_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 238:{20,20}]
  wire [3:0] _GEN_192 = 2'h2 == selectedLsIdx ? lsLqIdx_2 : _GEN_191; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 238:{20,20}]
  wire [3:0] _GEN_195 = 2'h1 == selectedLsIdx ? lsSqIdx_1 : lsSqIdx_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 239:{20,20}]
  wire [3:0] _GEN_196 = 2'h2 == selectedLsIdx ? lsSqIdx_2 : _GEN_195; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 239:{20,20}]
  wire [3:0] _GEN_199 = 2'h1 == selectedLsIdx ? lsLsuOp_1 : lsLsuOp_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 240:{20,20}]
  wire [3:0] _GEN_200 = 2'h2 == selectedLsIdx ? lsLsuOp_2 : _GEN_199; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 240:{20,20}]
  wire [31:0] _GEN_203 = 2'h1 == selectedLsIdx ? lsStoreData_1 : lsStoreData_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 241:{20,20}]
  wire [31:0] _GEN_204 = 2'h2 == selectedLsIdx ? lsStoreData_2 : _GEN_203; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 241:{20,20}]
  wire  _GEN_207 = 2'h1 == selectedLsIdx ? lsIsLoad_1 : lsIsLoad_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 242:{20,20}]
  wire  _GEN_208 = 2'h2 == selectedLsIdx ? lsIsLoad_2 : _GEN_207; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 242:{20,20}]
  wire  _GEN_211 = 2'h1 == selectedLsIdx ? lsIsStore_1 : lsIsStore_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 243:{20,20}]
  wire  _GEN_212 = 2'h2 == selectedLsIdx ? lsIsStore_2 : _GEN_211; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 243:{20,20}]
  wire  refillWritePrimVec_1 = primaries_1_io_refillWriteReq; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 246:{35,35}]
  wire  refillWritePrimVec_0 = primaries_0_io_refillWriteReq; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 246:{35,35}]
  wire [1:0] _hasRefillWrite_T = {refillWritePrimVec_1,refillWritePrimVec_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 247:47]
  wire  refillWritePrimSel = refillWritePrimVec_0 ? 1'h0 : 1'h1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [7:0] primSetIdxVec_0 = primaries_0_io_setIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 250:{33,33}]
  wire [7:0] primSetIdxVec_1 = primaries_1_io_setIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 250:{33,33}]
  wire [1:0] primVictimWayVec_0 = primaries_0_io_mshrVictimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 251:{33,33}]
  wire [1:0] primVictimWayVec_1 = primaries_1_io_mshrVictimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 251:{33,33}]
  wire [17:0] primRefillTagVec_0 = primaries_0_io_refillTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 252:{33,33}]
  wire [17:0] primRefillTagVec_1 = primaries_1_io_refillTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 252:{33,33}]
  wire [511:0] primRefillDataVec_0 = primaries_0_io_refillData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 253:{34,34}]
  wire [511:0] primRefillDataVec_1 = primaries_1_io_refillData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 253:{34,34}]
  wire  arValids_0 = primaries_0_io_ar_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 263:{25,25}]
  wire [1:0] arSelOH = arValids_0 ? 2'h1 : 2'h2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _io_axi_ar_data_arid_T_2 = arSelOH[0] ? primaries_0_io_ar_bits_arid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_ar_data_arid_T_3 = arSelOH[1] ? primaries_1_io_ar_bits_arid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_2 = arSelOH[0] ? primaries_0_io_ar_bits_araddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_ar_data_araddr_T_3 = arSelOH[1] ? primaries_1_io_ar_bits_araddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_2 = arSelOH[0] ? primaries_0_io_ar_bits_arlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_ar_data_arlen_T_3 = arSelOH[1] ? primaries_1_io_ar_bits_arlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_2 = arSelOH[0] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_ar_data_arsize_T_3 = arSelOH[1] ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  arValids_1 = primaries_1_io_ar_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 263:{25,25}]
  wire [1:0] _io_axi_ar_data_arvalid_T = {arValids_1,arValids_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 275:38]
  wire  rId = io_axi_r_data_rid[0]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 281:32]
  wire [1:0] rIdOH = 2'h1 << rId; // @[src/main/scala/chisel3/util/OneHot.scala 65:12]
  wire  awValids_0 = primaries_0_io_aw_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 290:{25,25}]
  wire [1:0] awSelOH = awValids_0 ? 2'h1 : 2'h2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _io_axi_aw_data_awid_T_2 = awSelOH[0] ? primaries_0_io_aw_bits_awid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_aw_data_awid_T_3 = awSelOH[1] ? primaries_1_io_aw_bits_awid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_2 = awSelOH[0] ? primaries_0_io_aw_bits_awaddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_aw_data_awaddr_T_3 = awSelOH[1] ? primaries_1_io_aw_bits_awaddr : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_2 = awSelOH[0] ? primaries_0_io_aw_bits_awlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [7:0] _io_axi_aw_data_awlen_T_3 = awSelOH[1] ? primaries_1_io_aw_bits_awlen : 8'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_2 = awSelOH[0] ? primaries_0_io_aw_bits_awsize : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_axi_aw_data_awsize_T_3 = awSelOH[1] ? primaries_1_io_aw_bits_awsize : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  awValids_1 = primaries_1_io_aw_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 290:{25,25}]
  wire [1:0] _io_axi_aw_data_awvalid_T = {awValids_1,awValids_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 302:38]
  wire  wValids_0 = primaries_0_io_w_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 308:{24,24}]
  wire [1:0] wSelOH = wValids_0 ? 2'h1 : 2'h2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _io_axi_w_data_wid_T_2 = wSelOH[0] ? primaries_0_io_w_bits_wid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wid_T_3 = wSelOH[1] ? primaries_1_io_w_bits_wid : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_2 = wSelOH[0] ? primaries_0_io_w_bits_wdata : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_axi_w_data_wdata_T_3 = wSelOH[1] ? primaries_1_io_w_bits_wdata : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_2 = wSelOH[0] ? primaries_0_io_w_bits_wstrb : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_axi_w_data_wstrb_T_3 = wSelOH[1] ? primaries_1_io_w_bits_wstrb : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  wValids_1 = primaries_1_io_w_valid; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 308:{24,24}]
  wire [1:0] _io_axi_w_data_wvalid_T = {wValids_1,wValids_0}; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 316:35]
  wire  bId = io_axi_b_data_bid[0]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 322:32]
  wire [1:0] bIdOH = 2'h1 << bId; // @[src/main/scala/chisel3/util/OneHot.scala 65:12]
  MSHREntry primaries_0 ( // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
    .clock(primaries_0_clock),
    .reset(primaries_0_reset),
    .io_id(primaries_0_io_id),
    .io_req_ready(primaries_0_io_req_ready),
    .io_req_valid(primaries_0_io_req_valid),
    .io_req_bits_paddr(primaries_0_io_req_bits_paddr),
    .io_req_bits_reqType(primaries_0_io_req_bits_reqType),
    .io_req_bits_victimWay(primaries_0_io_req_bits_victimWay),
    .io_req_bits_victimDirty(primaries_0_io_req_bits_victimDirty),
    .io_req_bits_victimTag(primaries_0_io_req_bits_victimTag),
    .io_req_bits_victimData(primaries_0_io_req_bits_victimData),
    .io_req_bits_storeData(primaries_0_io_req_bits_storeData),
    .io_req_bits_lsuOp(primaries_0_io_req_bits_lsuOp),
    .io_ar_ready(primaries_0_io_ar_ready),
    .io_ar_valid(primaries_0_io_ar_valid),
    .io_ar_bits_arid(primaries_0_io_ar_bits_arid),
    .io_ar_bits_araddr(primaries_0_io_ar_bits_araddr),
    .io_ar_bits_arlen(primaries_0_io_ar_bits_arlen),
    .io_r_ready(primaries_0_io_r_ready),
    .io_r_valid(primaries_0_io_r_valid),
    .io_r_bits_rdata(primaries_0_io_r_bits_rdata),
    .io_r_bits_rlast(primaries_0_io_r_bits_rlast),
    .io_aw_ready(primaries_0_io_aw_ready),
    .io_aw_valid(primaries_0_io_aw_valid),
    .io_aw_bits_awid(primaries_0_io_aw_bits_awid),
    .io_aw_bits_awaddr(primaries_0_io_aw_bits_awaddr),
    .io_aw_bits_awlen(primaries_0_io_aw_bits_awlen),
    .io_aw_bits_awsize(primaries_0_io_aw_bits_awsize),
    .io_w_ready(primaries_0_io_w_ready),
    .io_w_valid(primaries_0_io_w_valid),
    .io_w_bits_wid(primaries_0_io_w_bits_wid),
    .io_w_bits_wdata(primaries_0_io_w_bits_wdata),
    .io_w_bits_wstrb(primaries_0_io_w_bits_wstrb),
    .io_w_bits_wlast(primaries_0_io_w_bits_wlast),
    .io_b_ready(primaries_0_io_b_ready),
    .io_b_valid(primaries_0_io_b_valid),
    .io_refillWriteReq(primaries_0_io_refillWriteReq),
    .io_refillWriteAck(primaries_0_io_refillWriteAck),
    .io_uncacheData(primaries_0_io_uncacheData),
    .io_refillData(primaries_0_io_refillData),
    .io_refillTag(primaries_0_io_refillTag),
    .io_release(primaries_0_io_release),
    .io_busy(primaries_0_io_busy),
    .io_done(primaries_0_io_done),
    .io_blockAddr(primaries_0_io_blockAddr),
    .io_setIdx(primaries_0_io_setIdx),
    .io_mshrVictimWay(primaries_0_io_mshrVictimWay),
    .io_canAccept(primaries_0_io_canAccept),
    .io_isUncache(primaries_0_io_isUncache)
  );
  MSHREntry primaries_1 ( // @[src/main/scala/memory/dcache/DCacheMSHR.scala 70:50]
    .clock(primaries_1_clock),
    .reset(primaries_1_reset),
    .io_id(primaries_1_io_id),
    .io_req_ready(primaries_1_io_req_ready),
    .io_req_valid(primaries_1_io_req_valid),
    .io_req_bits_paddr(primaries_1_io_req_bits_paddr),
    .io_req_bits_reqType(primaries_1_io_req_bits_reqType),
    .io_req_bits_victimWay(primaries_1_io_req_bits_victimWay),
    .io_req_bits_victimDirty(primaries_1_io_req_bits_victimDirty),
    .io_req_bits_victimTag(primaries_1_io_req_bits_victimTag),
    .io_req_bits_victimData(primaries_1_io_req_bits_victimData),
    .io_req_bits_storeData(primaries_1_io_req_bits_storeData),
    .io_req_bits_lsuOp(primaries_1_io_req_bits_lsuOp),
    .io_ar_ready(primaries_1_io_ar_ready),
    .io_ar_valid(primaries_1_io_ar_valid),
    .io_ar_bits_arid(primaries_1_io_ar_bits_arid),
    .io_ar_bits_araddr(primaries_1_io_ar_bits_araddr),
    .io_ar_bits_arlen(primaries_1_io_ar_bits_arlen),
    .io_r_ready(primaries_1_io_r_ready),
    .io_r_valid(primaries_1_io_r_valid),
    .io_r_bits_rdata(primaries_1_io_r_bits_rdata),
    .io_r_bits_rlast(primaries_1_io_r_bits_rlast),
    .io_aw_ready(primaries_1_io_aw_ready),
    .io_aw_valid(primaries_1_io_aw_valid),
    .io_aw_bits_awid(primaries_1_io_aw_bits_awid),
    .io_aw_bits_awaddr(primaries_1_io_aw_bits_awaddr),
    .io_aw_bits_awlen(primaries_1_io_aw_bits_awlen),
    .io_aw_bits_awsize(primaries_1_io_aw_bits_awsize),
    .io_w_ready(primaries_1_io_w_ready),
    .io_w_valid(primaries_1_io_w_valid),
    .io_w_bits_wid(primaries_1_io_w_bits_wid),
    .io_w_bits_wdata(primaries_1_io_w_bits_wdata),
    .io_w_bits_wstrb(primaries_1_io_w_bits_wstrb),
    .io_w_bits_wlast(primaries_1_io_w_bits_wlast),
    .io_b_ready(primaries_1_io_b_ready),
    .io_b_valid(primaries_1_io_b_valid),
    .io_refillWriteReq(primaries_1_io_refillWriteReq),
    .io_refillWriteAck(primaries_1_io_refillWriteAck),
    .io_uncacheData(primaries_1_io_uncacheData),
    .io_refillData(primaries_1_io_refillData),
    .io_refillTag(primaries_1_io_refillTag),
    .io_release(primaries_1_io_release),
    .io_busy(primaries_1_io_busy),
    .io_done(primaries_1_io_done),
    .io_blockAddr(primaries_1_io_blockAddr),
    .io_setIdx(primaries_1_io_setIdx),
    .io_mshrVictimWay(primaries_1_io_mshrVictimWay),
    .io_canAccept(primaries_1_io_canAccept),
    .io_isUncache(primaries_1_io_isUncache)
  );
  assign io_missReq_ready = reqIsUncache ? hasFreePrim : _canAllocReq_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 124:24]
  assign io_isFirstMiss = ~_io_probeMatch_T_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 92:21]
  assign io_hasStore = |_io_hasStore_T_12; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 96:103]
  assign io_refillWriteReq_valid = |_hasRefillWrite_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 247:54]
  assign io_refillWriteReq_bits_idx = refillWritePrimSel ? primSetIdxVec_1 : primSetIdxVec_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 256:{31,31}]
  assign io_refillWriteReq_bits_way = refillWritePrimSel ? primVictimWayVec_1 : primVictimWayVec_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 257:{31,31}]
  assign io_refillWriteReq_bits_tag = refillWritePrimSel ? primRefillTagVec_1 : primRefillTagVec_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 258:{31,31}]
  assign io_refillWriteReq_bits_data = refillWritePrimSel ? primRefillDataVec_1 : primRefillDataVec_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 259:{31,31}]
  assign io_refillWritePrimId = refillWritePrimVec_0 ? 1'h0 : 1'h1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  assign io_lsReady = |_hasReadyLs_T_12; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 230:13]
  assign io_lsIdx = hasReadyStore ? _selectedLsIdx_T_2 : _selectedLsIdx_T_5; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 231:26]
  assign io_lsIsUncache = 2'h3 == selectedLsIdx ? lsIsUncache_3 : _GEN_178; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 235:{20,20}]
  assign io_lsUncacheData = _GEN_183 ? _io_lsUncacheData_WIRE_1 : _io_lsUncacheData_WIRE_0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 236:{20,20}]
  assign io_lsPaddr = 2'h3 == selectedLsIdx ? lsPaddr_3 : _GEN_188; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 237:{20,20}]
  assign io_lsLqIdx = 2'h3 == selectedLsIdx ? lsLqIdx_3 : _GEN_192; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 238:{20,20}]
  assign io_lsSqIdx = 2'h3 == selectedLsIdx ? lsSqIdx_3 : _GEN_196; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 239:{20,20}]
  assign io_lsLsuOp = 2'h3 == selectedLsIdx ? lsLsuOp_3 : _GEN_200; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 240:{20,20}]
  assign io_lsStoreData = 2'h3 == selectedLsIdx ? lsStoreData_3 : _GEN_204; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 241:{20,20}]
  assign io_lsIsLoad = 2'h3 == selectedLsIdx ? lsIsLoad_3 : _GEN_208; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 242:{20,20}]
  assign io_lsIsStore = 2'h3 == selectedLsIdx ? lsIsStore_3 : _GEN_212; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 243:{20,20}]
  assign io_axi_ar_data_arid = _io_axi_ar_data_arid_T_2 | _io_axi_ar_data_arid_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_araddr = _io_axi_ar_data_araddr_T_2 | _io_axi_ar_data_araddr_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_arlen = _io_axi_ar_data_arlen_T_2 | _io_axi_ar_data_arlen_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_arsize = _io_axi_ar_data_arsize_T_2 | _io_axi_ar_data_arsize_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_ar_data_arvalid = |_io_axi_ar_data_arvalid_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 275:45]
  assign io_axi_aw_data_awid = _io_axi_aw_data_awid_T_2 | _io_axi_aw_data_awid_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awaddr = _io_axi_aw_data_awaddr_T_2 | _io_axi_aw_data_awaddr_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awlen = _io_axi_aw_data_awlen_T_2 | _io_axi_aw_data_awlen_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awsize = _io_axi_aw_data_awsize_T_2 | _io_axi_aw_data_awsize_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_aw_data_awvalid = |_io_axi_aw_data_awvalid_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 302:45]
  assign io_axi_w_data_wid = _io_axi_w_data_wid_T_2 | _io_axi_w_data_wid_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wdata = _io_axi_w_data_wdata_T_2 | _io_axi_w_data_wdata_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wstrb = _io_axi_w_data_wstrb_T_2 | _io_axi_w_data_wstrb_T_3; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wlast = wSelOH[0] & primaries_0_io_w_bits_wlast | wSelOH[1] & primaries_1_io_w_bits_wlast; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_w_data_wvalid = |_io_axi_w_data_wvalid_T; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 316:42]
  assign io_axi_r_rready = rIdOH[0] & primaries_0_io_r_ready | rIdOH[1] & primaries_1_io_r_ready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_axi_b_bready = bIdOH[0] & primaries_0_io_b_ready | bIdOH[1] & primaries_1_io_b_ready; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign primaries_0_clock = clock;
  assign primaries_0_reset = reset;
  assign primaries_0_io_id = 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 131:16]
  assign primaries_0_io_req_valid = _primaries_0_io_req_valid_T & (allocThisPrim | allocUncacheThis); // @[src/main/scala/memory/dcache/DCacheMSHR.scala 142:42]
  assign primaries_0_io_req_bits_paddr = io_missReq_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 143:34]
  assign primaries_0_io_req_bits_reqType = reqIsUncache ? _primaries_0_io_req_bits_reqType_T : 2'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 144:40]
  assign primaries_0_io_req_bits_victimWay = io_missReq_bits_victimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 147:34]
  assign primaries_0_io_req_bits_victimDirty = io_missReq_bits_victimDirty; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 148:34]
  assign primaries_0_io_req_bits_victimTag = io_missReq_bits_victimTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 149:34]
  assign primaries_0_io_req_bits_victimData = io_missReq_bits_victimData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 150:34]
  assign primaries_0_io_req_bits_storeData = io_missReq_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 151:34]
  assign primaries_0_io_req_bits_lsuOp = io_missReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 152:34]
  assign primaries_0_io_ar_ready = io_axi_ar_arready & arSelOH[0]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 277:43]
  assign primaries_0_io_r_valid = io_axi_r_data_rvalid & rIdOH[0]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 284:45]
  assign primaries_0_io_r_bits_rdata = io_axi_r_data_rdata; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 285:21]
  assign primaries_0_io_r_bits_rlast = io_axi_r_data_rlast; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 285:21]
  assign primaries_0_io_aw_ready = io_axi_aw_awready & awSelOH[0]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 304:43]
  assign primaries_0_io_w_ready = io_axi_w_wready & wSelOH[0]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 318:40]
  assign primaries_0_io_b_valid = io_axi_b_data_bvalid & bIdOH[0]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 325:45]
  assign primaries_0_io_refillWriteAck = io_refillWriteAck_valid & ~io_refillWriteAck_bits; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 138:55]
  assign primaries_0_io_release = primaries_0_io_done & lsAllDone; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 136:37]
  assign primaries_1_clock = clock;
  assign primaries_1_reset = reset;
  assign primaries_1_io_id = 1'h1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 131:16]
  assign primaries_1_io_req_valid = _primaries_0_io_req_valid_T & (allocThisPrim_1 | allocUncacheThis_1); // @[src/main/scala/memory/dcache/DCacheMSHR.scala 142:42]
  assign primaries_1_io_req_bits_paddr = io_missReq_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 143:34]
  assign primaries_1_io_req_bits_reqType = reqIsUncache ? _primaries_0_io_req_bits_reqType_T : 2'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 144:40]
  assign primaries_1_io_req_bits_victimWay = io_missReq_bits_victimWay; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 147:34]
  assign primaries_1_io_req_bits_victimDirty = io_missReq_bits_victimDirty; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 148:34]
  assign primaries_1_io_req_bits_victimTag = io_missReq_bits_victimTag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 149:34]
  assign primaries_1_io_req_bits_victimData = io_missReq_bits_victimData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 150:34]
  assign primaries_1_io_req_bits_storeData = io_missReq_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 151:34]
  assign primaries_1_io_req_bits_lsuOp = io_missReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 152:34]
  assign primaries_1_io_ar_ready = io_axi_ar_arready & arSelOH[1]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 277:43]
  assign primaries_1_io_r_valid = io_axi_r_data_rvalid & rIdOH[1]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 284:45]
  assign primaries_1_io_r_bits_rdata = io_axi_r_data_rdata; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 285:21]
  assign primaries_1_io_r_bits_rlast = io_axi_r_data_rlast; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 285:21]
  assign primaries_1_io_aw_ready = io_axi_aw_awready & awSelOH[1]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 304:43]
  assign primaries_1_io_w_ready = io_axi_w_wready & wSelOH[1]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 318:40]
  assign primaries_1_io_b_valid = io_axi_b_data_bvalid & bIdOH[1]; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 325:45]
  assign primaries_1_io_refillWriteAck = io_refillWriteAck_valid & io_refillWriteAck_bits; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 138:55]
  assign primaries_1_io_release = primaries_1_io_done & lsAllDone_1; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 136:37]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
      lsValid_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h0 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
        lsValid_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
      end else begin
        lsValid_0 <= _GEN_148;
      end
    end else begin
      lsValid_0 <= _GEN_148;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
      lsValid_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h1 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
        lsValid_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
      end else begin
        lsValid_1 <= _GEN_151;
      end
    end else begin
      lsValid_1 <= _GEN_151;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
      lsValid_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h2 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
        lsValid_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
      end else begin
        lsValid_2 <= _GEN_154;
      end
    end else begin
      lsValid_2 <= _GEN_154;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
      lsValid_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 73:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h3 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
        lsValid_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 216:21]
      end else begin
        lsValid_3 <= _GEN_157;
      end
    end else begin
      lsValid_3 <= _GEN_157;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
      lsReadyReg_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h0 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
        lsReadyReg_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
      end else begin
        lsReadyReg_0 <= _GEN_149;
      end
    end else begin
      lsReadyReg_0 <= _GEN_149;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
      lsReadyReg_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h1 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
        lsReadyReg_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
      end else begin
        lsReadyReg_1 <= _GEN_152;
      end
    end else begin
      lsReadyReg_1 <= _GEN_152;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
      lsReadyReg_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h2 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
        lsReadyReg_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
      end else begin
        lsReadyReg_2 <= _GEN_155;
      end
    end else begin
      lsReadyReg_2 <= _GEN_155;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
      lsReadyReg_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 74:28]
    end else if (io_lsAck_valid) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 214:24]
      if (2'h3 == io_lsAck_bits) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
        lsReadyReg_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 217:21]
      end else begin
        lsReadyReg_3 <= _GEN_158;
      end
    end else begin
      lsReadyReg_3 <= _GEN_158;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
      lsPaddr_0 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
        lsPaddr_0 <= io_missReq_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
      lsPaddr_1 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
        lsPaddr_1 <= io_missReq_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
      lsPaddr_2 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
        lsPaddr_2 <= io_missReq_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
      lsPaddr_3 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 75:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
        lsPaddr_3 <= io_missReq_bits_paddr; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 160:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
      lsLqIdx_0 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
        lsLqIdx_0 <= io_missReq_bits_lqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
      lsLqIdx_1 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
        lsLqIdx_1 <= io_missReq_bits_lqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
      lsLqIdx_2 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
        lsLqIdx_2 <= io_missReq_bits_lqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
      lsLqIdx_3 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 76:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
        lsLqIdx_3 <= io_missReq_bits_lqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 161:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
      lsSqIdx_0 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
        lsSqIdx_0 <= io_missReq_bits_sqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
      lsSqIdx_1 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
        lsSqIdx_1 <= io_missReq_bits_sqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
      lsSqIdx_2 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
        lsSqIdx_2 <= io_missReq_bits_sqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
      lsSqIdx_3 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 77:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
        lsSqIdx_3 <= io_missReq_bits_sqIdx; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 162:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_0_value <= 6'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_0_value <= io_missReq_bits_robIdx_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_0_flag <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_0_flag <= io_missReq_bits_robIdx_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_1_value <= 6'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_1_value <= io_missReq_bits_robIdx_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_1_flag <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_1_flag <= io_missReq_bits_robIdx_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_2_value <= 6'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_2_value <= io_missReq_bits_robIdx_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_2_flag <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_2_flag <= io_missReq_bits_robIdx_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_3_value <= 6'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_3_value <= io_missReq_bits_robIdx_value; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
      lsRobIdx_3_flag <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 78:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
        lsRobIdx_3_flag <= io_missReq_bits_robIdx_flag; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 163:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
      lsLsuOp_0 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
        lsLsuOp_0 <= io_missReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
      lsLsuOp_1 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
        lsLsuOp_1 <= io_missReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
      lsLsuOp_2 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
        lsLsuOp_2 <= io_missReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
      lsLsuOp_3 <= 4'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 79:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
        lsLsuOp_3 <= io_missReq_bits_lsuOp; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 164:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
      lsStoreData_0 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
        lsStoreData_0 <= io_missReq_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
      lsStoreData_1 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
        lsStoreData_1 <= io_missReq_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
      lsStoreData_2 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
        lsStoreData_2 <= io_missReq_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
      lsStoreData_3 <= 32'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 80:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
        lsStoreData_3 <= io_missReq_bits_storeData; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 165:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
      lsIsLoad_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
        lsIsLoad_0 <= io_missReq_bits_isLoad; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
      lsIsLoad_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
        lsIsLoad_1 <= io_missReq_bits_isLoad; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
      lsIsLoad_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
        lsIsLoad_2 <= io_missReq_bits_isLoad; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
      lsIsLoad_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 81:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
        lsIsLoad_3 <= io_missReq_bits_isLoad; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 166:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
      lsIsStore_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
        lsIsStore_0 <= io_missReq_bits_isStore; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
      lsIsStore_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
        lsIsStore_1 <= io_missReq_bits_isStore; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
      lsIsStore_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
        lsIsStore_2 <= io_missReq_bits_isStore; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
      lsIsStore_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 82:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
        lsIsStore_3 <= io_missReq_bits_isStore; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 167:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
      lsPrimaryId_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 172:22]
        if (_io_isFirstMiss_T_2) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 171:21]
          lsPrimaryId_0 <= allocPrimId;
        end else begin
          lsPrimaryId_0 <= _io_matchPrimId_T;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
      lsPrimaryId_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 172:22]
        if (_io_isFirstMiss_T_2) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 171:21]
          lsPrimaryId_1 <= allocPrimId;
        end else begin
          lsPrimaryId_1 <= _io_matchPrimId_T;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
      lsPrimaryId_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 172:22]
        if (_io_isFirstMiss_T_2) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 171:21]
          lsPrimaryId_2 <= allocPrimId;
        end else begin
          lsPrimaryId_2 <= _io_matchPrimId_T;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
      lsPrimaryId_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 83:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 172:22]
        if (_io_isFirstMiss_T_2) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 171:21]
          lsPrimaryId_3 <= allocPrimId;
        end else begin
          lsPrimaryId_3 <= _io_matchPrimId_T;
        end
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
      lsIsUncache_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h0 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
        lsIsUncache_0 <= reqIsUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
      lsIsUncache_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h1 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
        lsIsUncache_1 <= reqIsUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
      lsIsUncache_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h2 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
        lsIsUncache_2 <= reqIsUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
      lsIsUncache_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 84:28]
    end else if (_primaries_0_io_req_valid_T) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 156:25]
      if (2'h3 == allocSecIdx) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
        lsIsUncache_3 <= reqIsUncache; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 168:22]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
      lsFlushed_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
    end else if (lsValid_0 & lsFlushed_0) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38]
      lsFlushed_0 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 209:21]
    end else if (io_redirectInfo_valid & io_redirectInfo_bits_doRedirect) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 194:66]
      if (lsValid_0 & lsIsLoad_0 & ~lsIsStore_0 & _io_hasStore_T_1) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 196:73]
        lsFlushed_0 <= _GEN_136;
      end else begin
        lsFlushed_0 <= _GEN_112;
      end
    end else begin
      lsFlushed_0 <= _GEN_112;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
      lsFlushed_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
    end else if (lsValid_1 & lsFlushed_1) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38]
      lsFlushed_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 209:21]
    end else if (io_redirectInfo_valid & io_redirectInfo_bits_doRedirect) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 194:66]
      if (lsValid_1 & lsIsLoad_1 & ~lsIsStore_1 & _io_hasStore_T_4) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 196:73]
        lsFlushed_1 <= _GEN_138;
      end else begin
        lsFlushed_1 <= _GEN_113;
      end
    end else begin
      lsFlushed_1 <= _GEN_113;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
      lsFlushed_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
    end else if (lsValid_2 & lsFlushed_2) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38]
      lsFlushed_2 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 209:21]
    end else if (io_redirectInfo_valid & io_redirectInfo_bits_doRedirect) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 194:66]
      if (lsValid_2 & lsIsLoad_2 & ~lsIsStore_2 & _io_hasStore_T_7) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 196:73]
        lsFlushed_2 <= _GEN_140;
      end else begin
        lsFlushed_2 <= _GEN_114;
      end
    end else begin
      lsFlushed_2 <= _GEN_114;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
      lsFlushed_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 85:28]
    end else if (lsValid_3 & lsFlushed_3) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 206:38]
      lsFlushed_3 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 209:21]
    end else if (io_redirectInfo_valid & io_redirectInfo_bits_doRedirect) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 194:66]
      if (lsValid_3 & lsIsLoad_3 & ~lsIsStore_3 & _io_hasStore_T_10) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 196:73]
        lsFlushed_3 <= _GEN_142;
      end else begin
        lsFlushed_3 <= _GEN_115;
      end
    end else begin
      lsFlushed_3 <= _GEN_115;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
      prevDone <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
    end else begin
      prevDone <= primaries_0_io_done; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
      prevDone_1 <= 1'h0; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
    end else begin
      prevDone_1 <= primaries_1_io_done; // @[src/main/scala/memory/dcache/DCacheMSHR.scala 183:27]
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
  lsValid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lsValid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lsValid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lsValid_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  lsReadyReg_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  lsReadyReg_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  lsReadyReg_2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  lsReadyReg_3 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  lsPaddr_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  lsPaddr_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  lsPaddr_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  lsPaddr_3 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  lsLqIdx_0 = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  lsLqIdx_1 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  lsLqIdx_2 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  lsLqIdx_3 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  lsSqIdx_0 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  lsSqIdx_1 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  lsSqIdx_2 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  lsSqIdx_3 = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  lsRobIdx_0_value = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  lsRobIdx_0_flag = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  lsRobIdx_1_value = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  lsRobIdx_1_flag = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  lsRobIdx_2_value = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  lsRobIdx_2_flag = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  lsRobIdx_3_value = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  lsRobIdx_3_flag = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  lsLsuOp_0 = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  lsLsuOp_1 = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  lsLsuOp_2 = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  lsLsuOp_3 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  lsStoreData_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  lsStoreData_1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  lsStoreData_2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  lsStoreData_3 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  lsIsLoad_0 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  lsIsLoad_1 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  lsIsLoad_2 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  lsIsLoad_3 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  lsIsStore_0 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  lsIsStore_1 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  lsIsStore_2 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  lsIsStore_3 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  lsPrimaryId_0 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  lsPrimaryId_1 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  lsPrimaryId_2 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  lsPrimaryId_3 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  lsIsUncache_0 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  lsIsUncache_1 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  lsIsUncache_2 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  lsIsUncache_3 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  lsFlushed_0 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  lsFlushed_1 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  lsFlushed_2 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  lsFlushed_3 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  prevDone = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  prevDone_1 = _RAND_57[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
