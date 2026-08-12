module MSHREntry(
  input          clock,
  input          reset,
  input          io_id, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_req_ready, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_req_valid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [31:0]  io_req_bits_paddr, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [1:0]   io_req_bits_reqType, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [1:0]   io_req_bits_victimWay, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_req_bits_victimDirty, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [17:0]  io_req_bits_victimTag, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [511:0] io_req_bits_victimData, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [31:0]  io_req_bits_storeData, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [3:0]   io_req_bits_lsuOp, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_ar_ready, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_ar_valid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [3:0]   io_ar_bits_arid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [31:0]  io_ar_bits_araddr, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [7:0]   io_ar_bits_arlen, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_r_ready, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_r_valid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input  [31:0]  io_r_bits_rdata, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_r_bits_rlast, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_aw_ready, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_aw_valid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [3:0]   io_aw_bits_awid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [31:0]  io_aw_bits_awaddr, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [7:0]   io_aw_bits_awlen, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [2:0]   io_aw_bits_awsize, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_w_ready, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_w_valid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [3:0]   io_w_bits_wid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [31:0]  io_w_bits_wdata, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [3:0]   io_w_bits_wstrb, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_w_bits_wlast, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_b_ready, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_b_valid, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_refillWriteReq, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_refillWriteAck, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [31:0]  io_uncacheData, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [511:0] io_refillData, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [17:0]  io_refillTag, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  input          io_release, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_busy, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_done, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [25:0]  io_blockAddr, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [7:0]   io_setIdx, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output [1:0]   io_mshrVictimWay, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_canAccept, // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
  output         io_isUncache // @[src/main/scala/memory/dcache/MSHREntry.scala 16:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [511:0] _RAND_5;
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
`endif // RANDOMIZE_REG_INIT
  reg [3:0] state; // @[src/main/scala/memory/dcache/MSHREntry.scala 62:22]
  reg [31:0] reqPaddr; // @[src/main/scala/memory/dcache/MSHREntry.scala 64:31]
  reg [1:0] reqType; // @[src/main/scala/memory/dcache/MSHREntry.scala 65:31]
  reg [1:0] reqVictimWay; // @[src/main/scala/memory/dcache/MSHREntry.scala 67:31]
  reg [17:0] reqVictimTag; // @[src/main/scala/memory/dcache/MSHREntry.scala 69:31]
  reg [511:0] reqVictimData; // @[src/main/scala/memory/dcache/MSHREntry.scala 70:31]
  reg [31:0] reqStoreData; // @[src/main/scala/memory/dcache/MSHREntry.scala 71:31]
  reg [3:0] reqLsuOp; // @[src/main/scala/memory/dcache/MSHREntry.scala 72:31]
  reg [4:0] beatCnt; // @[src/main/scala/memory/dcache/MSHREntry.scala 73:31]
  reg [31:0] refillBuf_0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_1; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_2; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_3; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_4; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_5; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_6; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_7; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_8; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_9; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_10; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_11; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_12; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_13; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_14; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] refillBuf_15; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
  reg [31:0] ucDataReg; // @[src/main/scala/memory/dcache/MSHREntry.scala 75:31]
  wire [7:0] setIdx = reqPaddr[13:6]; // @[src/main/scala/memory/dcache/MSHREntry.scala 77:27]
  wire  _io_done_T = state == 4'h7; // @[src/main/scala/memory/dcache/MSHREntry.scala 81:29]
  wire  _io_done_T_1 = state == 4'hd; // @[src/main/scala/memory/dcache/MSHREntry.scala 81:49]
  wire  _io_isWriteback_T = state == 4'h1; // @[src/main/scala/memory/dcache/MSHREntry.scala 86:29]
  wire  _io_isWriteback_T_1 = state == 4'h2; // @[src/main/scala/memory/dcache/MSHREntry.scala 86:50]
  wire  _io_isWriteback_T_3 = state == 4'h3; // @[src/main/scala/memory/dcache/MSHREntry.scala 86:70]
  wire  _io_refillWriteReq_T = state == 4'h6; // @[src/main/scala/memory/dcache/MSHREntry.scala 90:30]
  wire [255:0] io_refillData_lo = {refillBuf_7,refillBuf_6,refillBuf_5,refillBuf_4,refillBuf_3,refillBuf_2,refillBuf_1,
    refillBuf_0}; // @[src/main/scala/memory/dcache/MSHREntry.scala 91:26]
  wire [255:0] io_refillData_hi = {refillBuf_15,refillBuf_14,refillBuf_13,refillBuf_12,refillBuf_11,refillBuf_10,
    refillBuf_9,refillBuf_8}; // @[src/main/scala/memory/dcache/MSHREntry.scala 91:26]
  wire  _T = io_req_ready & io_req_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _state_T_2 = io_req_bits_victimDirty ? 4'h1 : 4'h4; // @[src/main/scala/memory/dcache/MSHREntry.scala 107:16]
  wire [3:0] _state_T_3 = io_req_bits_reqType == 2'h2 ? 4'ha : _state_T_2; // @[src/main/scala/memory/dcache/MSHREntry.scala 106:16]
  wire [3:0] _state_T_4 = io_req_bits_reqType == 2'h1 ? 4'h8 : _state_T_3; // @[src/main/scala/memory/dcache/MSHREntry.scala 105:17]
  wire [3:0] _GEN_8 = _T ? _state_T_4 : state; // @[src/main/scala/memory/dcache/MSHREntry.scala 105:11 96:21 62:22]
  wire [31:0] wbAddr = {reqVictimTag,setIdx,6'h0}; // @[src/main/scala/memory/dcache/MSHREntry.scala 111:19]
  wire  _io_aw_valid_T_1 = state == 4'ha; // @[src/main/scala/memory/dcache/MSHREntry.scala 112:45]
  wire [3:0] _io_aw_bits_awlen_T_1 = _io_aw_valid_T_1 ? 4'h0 : 4'hf; // @[src/main/scala/memory/dcache/MSHREntry.scala 115:28]
  wire  _io_aw_bits_awsize_T_1 = 4'h4 == reqLsuOp; // @[src/main/scala/memory/dcache/MSHREntry.scala 117:29]
  wire [1:0] _io_aw_bits_awsize_T_2 = 4'h4 == reqLsuOp ? 2'h0 : 2'h2; // @[src/main/scala/memory/dcache/MSHREntry.scala 117:29]
  wire  _io_aw_bits_awsize_T_3 = 4'h5 == reqLsuOp; // @[src/main/scala/memory/dcache/MSHREntry.scala 117:29]
  wire [1:0] _io_aw_bits_awsize_T_4 = 4'h5 == reqLsuOp ? 2'h1 : _io_aw_bits_awsize_T_2; // @[src/main/scala/memory/dcache/MSHREntry.scala 117:29]
  wire  _io_aw_bits_awsize_T_5 = 4'h6 == reqLsuOp; // @[src/main/scala/memory/dcache/MSHREntry.scala 117:29]
  wire [1:0] _io_aw_bits_awsize_T_6 = 4'h6 == reqLsuOp ? 2'h2 : _io_aw_bits_awsize_T_4; // @[src/main/scala/memory/dcache/MSHREntry.scala 117:29]
  wire [1:0] _io_aw_bits_awsize_T_7 = _io_aw_valid_T_1 ? _io_aw_bits_awsize_T_6 : 2'h2; // @[src/main/scala/memory/dcache/MSHREntry.scala 116:27]
  wire  _T_2 = io_aw_ready & io_aw_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _GEN_9 = _io_isWriteback_T & _T_2 ? 4'h2 : _GEN_8; // @[src/main/scala/memory/dcache/MSHREntry.scala 130:{41,49}]
  wire [4:0] _GEN_10 = _io_isWriteback_T & _T_2 ? 5'h0 : beatCnt; // @[src/main/scala/memory/dcache/MSHREntry.scala 130:{41,68} 73:31]
  wire [3:0] _GEN_11 = _io_aw_valid_T_1 & _T_2 ? 4'hb : _GEN_9; // @[src/main/scala/memory/dcache/MSHREntry.scala 131:{41,49}]
  wire [31:0] wbDataVec_0 = reqVictimData[31:0]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_1 = reqVictimData[63:32]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_2 = reqVictimData[95:64]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_3 = reqVictimData[127:96]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_4 = reqVictimData[159:128]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_5 = reqVictimData[191:160]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_6 = reqVictimData[223:192]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_7 = reqVictimData[255:224]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_8 = reqVictimData[287:256]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_9 = reqVictimData[319:288]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_10 = reqVictimData[351:320]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_11 = reqVictimData[383:352]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_12 = reqVictimData[415:384]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_13 = reqVictimData[447:416]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_14 = reqVictimData[479:448]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [31:0] wbDataVec_15 = reqVictimData[511:480]; // @[src/main/scala/memory/dcache/MSHREntry.scala 135:18]
  wire [1:0] byteOff = reqPaddr[1:0]; // @[src/main/scala/memory/dcache/MSHREntry.scala 139:25]
  wire [3:0] _ucWstrb_T = 4'h1 << byteOff; // @[src/main/scala/chisel3/util/OneHot.scala 65:12]
  wire [3:0] _ucWstrb_T_3 = byteOff[1] ? 4'hc : 4'h3; // @[src/main/scala/memory/dcache/MSHREntry.scala 142:23]
  wire [3:0] _ucWstrb_T_5 = _io_aw_bits_awsize_T_1 ? _ucWstrb_T : 4'hf; // @[src/main/scala/memory/dcache/MSHREntry.scala 140:48]
  wire [3:0] _ucWstrb_T_7 = _io_aw_bits_awsize_T_3 ? _ucWstrb_T_3 : _ucWstrb_T_5; // @[src/main/scala/memory/dcache/MSHREntry.scala 140:48]
  wire [3:0] ucWstrb = _io_aw_bits_awsize_T_5 ? 4'hf : _ucWstrb_T_7; // @[src/main/scala/memory/dcache/MSHREntry.scala 140:48]
  wire [5:0] _ucWdata_T_1 = byteOff * 4'h8; // @[src/main/scala/memory/dcache/MSHREntry.scala 148:50]
  wire [70:0] _GEN_3 = {{63'd0}, reqStoreData[7:0]}; // @[src/main/scala/memory/dcache/MSHREntry.scala 148:38]
  wire [70:0] _ucWdata_T_2 = _GEN_3 << _ucWdata_T_1; // @[src/main/scala/memory/dcache/MSHREntry.scala 148:38]
  wire [1:0] _ucWdata_T_5 = {byteOff[1],1'h0}; // @[src/main/scala/memory/dcache/MSHREntry.scala 149:46]
  wire [5:0] _ucWdata_T_6 = _ucWdata_T_5 * 4'h8; // @[src/main/scala/memory/dcache/MSHREntry.scala 149:69]
  wire [78:0] _GEN_13 = {{63'd0}, reqStoreData[15:0]}; // @[src/main/scala/memory/dcache/MSHREntry.scala 149:39]
  wire [78:0] _ucWdata_T_7 = _GEN_13 << _ucWdata_T_6; // @[src/main/scala/memory/dcache/MSHREntry.scala 149:39]
  wire [70:0] _ucWdata_T_9 = _io_aw_bits_awsize_T_1 ? _ucWdata_T_2 : {{39'd0}, reqStoreData}; // @[src/main/scala/memory/dcache/MSHREntry.scala 147:50]
  wire [78:0] _ucWdata_T_11 = _io_aw_bits_awsize_T_3 ? _ucWdata_T_7 : {{8'd0}, _ucWdata_T_9}; // @[src/main/scala/memory/dcache/MSHREntry.scala 147:50]
  wire [78:0] ucWdata = _io_aw_bits_awsize_T_5 ? {{47'd0}, reqStoreData} : _ucWdata_T_11; // @[src/main/scala/memory/dcache/MSHREntry.scala 147:50]
  wire  _io_w_valid_T_1 = state == 4'hb; // @[src/main/scala/memory/dcache/MSHREntry.scala 154:43]
  wire  _io_w_valid_T_2 = _io_isWriteback_T_1 | state == 4'hb; // @[src/main/scala/memory/dcache/MSHREntry.scala 154:34]
  wire [31:0] _GEN_14 = 4'h1 == beatCnt[3:0] ? wbDataVec_1 : wbDataVec_0; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_15 = 4'h2 == beatCnt[3:0] ? wbDataVec_2 : _GEN_14; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_16 = 4'h3 == beatCnt[3:0] ? wbDataVec_3 : _GEN_15; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_17 = 4'h4 == beatCnt[3:0] ? wbDataVec_4 : _GEN_16; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_18 = 4'h5 == beatCnt[3:0] ? wbDataVec_5 : _GEN_17; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_19 = 4'h6 == beatCnt[3:0] ? wbDataVec_6 : _GEN_18; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_20 = 4'h7 == beatCnt[3:0] ? wbDataVec_7 : _GEN_19; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_21 = 4'h8 == beatCnt[3:0] ? wbDataVec_8 : _GEN_20; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_22 = 4'h9 == beatCnt[3:0] ? wbDataVec_9 : _GEN_21; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_23 = 4'ha == beatCnt[3:0] ? wbDataVec_10 : _GEN_22; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_24 = 4'hb == beatCnt[3:0] ? wbDataVec_11 : _GEN_23; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_25 = 4'hc == beatCnt[3:0] ? wbDataVec_12 : _GEN_24; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_26 = 4'hd == beatCnt[3:0] ? wbDataVec_13 : _GEN_25; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_27 = 4'he == beatCnt[3:0] ? wbDataVec_14 : _GEN_26; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [31:0] _GEN_28 = 4'hf == beatCnt[3:0] ? wbDataVec_15 : _GEN_27; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:{26,26}]
  wire [78:0] _io_w_bits_wdata_T_2 = _io_w_valid_T_1 ? ucWdata : {{47'd0}, _GEN_28}; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:26]
  wire  _T_10 = io_w_ready & io_w_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [4:0] _beatCnt_T_1 = beatCnt + 5'h1; // @[src/main/scala/memory/dcache/MSHREntry.scala 161:24]
  wire [3:0] _state_T_6 = _io_w_valid_T_1 ? 4'hc : 4'h3; // @[src/main/scala/memory/dcache/MSHREntry.scala 163:19]
  wire [3:0] _GEN_29 = io_w_bits_wlast ? _state_T_6 : _GEN_11; // @[src/main/scala/memory/dcache/MSHREntry.scala 162:27 163:13]
  wire [3:0] _GEN_32 = _io_w_valid_T_2 & _T_10 ? _GEN_29 : _GEN_11; // @[src/main/scala/memory/dcache/MSHREntry.scala 160:61]
  wire  _io_b_ready_T_1 = state == 4'hc; // @[src/main/scala/memory/dcache/MSHREntry.scala 168:43]
  wire  _T_13 = io_b_ready & io_b_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _GEN_33 = _io_isWriteback_T_3 & _T_13 ? 4'h4 : _GEN_32; // @[src/main/scala/memory/dcache/MSHREntry.scala 169:{40,48}]
  wire [3:0] _GEN_34 = _io_b_ready_T_1 & _T_13 ? 4'hd : _GEN_33; // @[src/main/scala/memory/dcache/MSHREntry.scala 170:{40,48}]
  wire [31:0] refillAddr = {reqPaddr[31:6],6'h0}; // @[src/main/scala/memory/dcache/MSHREntry.scala 173:23]
  wire  _io_ar_valid_T = state == 4'h4; // @[src/main/scala/memory/dcache/MSHREntry.scala 174:24]
  wire  _io_ar_valid_T_1 = state == 4'h8; // @[src/main/scala/memory/dcache/MSHREntry.scala 174:49]
  wire [3:0] _io_ar_bits_arlen_T_1 = _io_ar_valid_T_1 ? 4'h0 : 4'hf; // @[src/main/scala/memory/dcache/MSHREntry.scala 177:28]
  wire  _T_19 = io_ar_ready & io_ar_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _GEN_35 = _io_ar_valid_T & _T_19 ? 4'h5 : _GEN_34; // @[src/main/scala/memory/dcache/MSHREntry.scala 184:{45,53}]
  wire [3:0] _GEN_36 = _io_ar_valid_T_1 & _T_19 ? 4'h9 : _GEN_35; // @[src/main/scala/memory/dcache/MSHREntry.scala 185:{45,53}]
  wire  _io_r_ready_T = state == 4'h5; // @[src/main/scala/memory/dcache/MSHREntry.scala 188:23]
  wire  _io_r_ready_T_1 = state == 4'h9; // @[src/main/scala/memory/dcache/MSHREntry.scala 188:47]
  wire  _T_25 = io_r_ready & io_r_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] _GEN_54 = io_r_bits_rlast ? 4'h6 : _GEN_36; // @[src/main/scala/memory/dcache/MSHREntry.scala 192:{27,51}]
  wire [3:0] _GEN_72 = _io_r_ready_T & _T_25 ? _GEN_54 : _GEN_36; // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
  wire [3:0] _GEN_74 = _io_r_ready_T_1 & _T_25 ? 4'hd : _GEN_72; // @[src/main/scala/memory/dcache/MSHREntry.scala 194:{39,77}]
  assign io_req_ready = state == 4'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 95:25]
  assign io_ar_valid = state == 4'h4 | state == 4'h8; // @[src/main/scala/memory/dcache/MSHREntry.scala 174:40]
  assign io_ar_bits_arid = {{3'd0}, io_id}; // @[src/main/scala/memory/dcache/MSHREntry.scala 175:22]
  assign io_ar_bits_araddr = _io_ar_valid_T_1 ? reqPaddr : refillAddr; // @[src/main/scala/memory/dcache/MSHREntry.scala 176:28]
  assign io_ar_bits_arlen = {{4'd0}, _io_ar_bits_arlen_T_1}; // @[src/main/scala/memory/dcache/MSHREntry.scala 177:22]
  assign io_r_ready = state == 4'h5 | state == 4'h9; // @[src/main/scala/memory/dcache/MSHREntry.scala 188:38]
  assign io_aw_valid = _io_isWriteback_T | state == 4'ha; // @[src/main/scala/memory/dcache/MSHREntry.scala 112:36]
  assign io_aw_bits_awid = {{3'd0}, io_id}; // @[src/main/scala/memory/dcache/MSHREntry.scala 113:22]
  assign io_aw_bits_awaddr = _io_aw_valid_T_1 ? reqPaddr : wbAddr; // @[src/main/scala/memory/dcache/MSHREntry.scala 114:28]
  assign io_aw_bits_awlen = {{4'd0}, _io_aw_bits_awlen_T_1}; // @[src/main/scala/memory/dcache/MSHREntry.scala 115:22]
  assign io_aw_bits_awsize = {{1'd0}, _io_aw_bits_awsize_T_7}; // @[src/main/scala/memory/dcache/MSHREntry.scala 116:21]
  assign io_w_valid = _io_isWriteback_T_1 | state == 4'hb; // @[src/main/scala/memory/dcache/MSHREntry.scala 154:34]
  assign io_w_bits_wid = {{3'd0}, io_id}; // @[src/main/scala/memory/dcache/MSHREntry.scala 155:20]
  assign io_w_bits_wdata = _io_w_bits_wdata_T_2[31:0]; // @[src/main/scala/memory/dcache/MSHREntry.scala 156:20]
  assign io_w_bits_wstrb = _io_w_valid_T_1 ? ucWstrb : 4'hf; // @[src/main/scala/memory/dcache/MSHREntry.scala 157:26]
  assign io_w_bits_wlast = _io_w_valid_T_1 | beatCnt == 5'hf; // @[src/main/scala/memory/dcache/MSHREntry.scala 158:26]
  assign io_b_ready = _io_isWriteback_T_3 | state == 4'hc; // @[src/main/scala/memory/dcache/MSHREntry.scala 168:34]
  assign io_refillWriteReq = state == 4'h6; // @[src/main/scala/memory/dcache/MSHREntry.scala 90:30]
  assign io_uncacheData = ucDataReg; // @[src/main/scala/memory/dcache/MSHREntry.scala 89:20]
  assign io_refillData = {io_refillData_hi,io_refillData_lo}; // @[src/main/scala/memory/dcache/MSHREntry.scala 91:26]
  assign io_refillTag = reqPaddr[31:14]; // @[src/main/scala/memory/dcache/MSHREntry.scala 78:27]
  assign io_busy = state != 4'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 80:29]
  assign io_done = state == 4'h7 | state == 4'hd; // @[src/main/scala/memory/dcache/MSHREntry.scala 81:40]
  assign io_blockAddr = reqPaddr[31:6]; // @[src/main/scala/memory/dcache/MSHREntry.scala 82:31]
  assign io_setIdx = reqPaddr[13:6]; // @[src/main/scala/memory/dcache/MSHREntry.scala 77:27]
  assign io_mshrVictimWay = reqVictimWay; // @[src/main/scala/memory/dcache/MSHREntry.scala 84:20]
  assign io_canAccept = state == 4'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 85:29]
  assign io_isUncache = reqType != 2'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 66:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 62:22]
      state <= 4'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 62:22]
    end else if (_io_done_T_1 & io_release) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 201:43]
      state <= 4'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 201:51]
    end else if (_io_done_T & io_release) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 200:43]
      state <= 4'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 200:51]
    end else if (_io_refillWriteReq_T & io_refillWriteAck) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 197:55]
      state <= 4'h7; // @[src/main/scala/memory/dcache/MSHREntry.scala 197:63]
    end else begin
      state <= _GEN_74;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 64:31]
      reqPaddr <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 64:31]
    end else if (_T) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 96:21]
      reqPaddr <= io_req_bits_paddr; // @[src/main/scala/memory/dcache/MSHREntry.scala 97:20]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 65:31]
      reqType <= 2'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 65:31]
    end else if (_T) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 96:21]
      reqType <= io_req_bits_reqType; // @[src/main/scala/memory/dcache/MSHREntry.scala 98:20]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 67:31]
      reqVictimWay <= 2'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 67:31]
    end else if (_T) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 96:21]
      reqVictimWay <= io_req_bits_victimWay; // @[src/main/scala/memory/dcache/MSHREntry.scala 99:20]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 69:31]
      reqVictimTag <= 18'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 69:31]
    end else if (_T) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 96:21]
      reqVictimTag <= io_req_bits_victimTag; // @[src/main/scala/memory/dcache/MSHREntry.scala 101:20]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 70:31]
      reqVictimData <= 512'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 70:31]
    end else if (_T) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 96:21]
      reqVictimData <= io_req_bits_victimData; // @[src/main/scala/memory/dcache/MSHREntry.scala 102:20]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 71:31]
      reqStoreData <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 71:31]
    end else if (_T) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 96:21]
      reqStoreData <= io_req_bits_storeData; // @[src/main/scala/memory/dcache/MSHREntry.scala 103:20]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 72:31]
      reqLsuOp <= 4'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 72:31]
    end else if (_T) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 96:21]
      reqLsuOp <= io_req_bits_lsuOp; // @[src/main/scala/memory/dcache/MSHREntry.scala 104:20]
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 73:31]
      beatCnt <= 5'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 73:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (io_r_bits_rlast) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 192:27]
        beatCnt <= 5'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 192:37]
      end else begin
        beatCnt <= _beatCnt_T_1; // @[src/main/scala/memory/dcache/MSHREntry.scala 191:13]
      end
    end else if (_io_w_valid_T_2 & _T_10) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 160:61]
      if (io_w_bits_wlast) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 162:27]
        beatCnt <= 5'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 163:63]
      end else begin
        beatCnt <= _beatCnt_T_1; // @[src/main/scala/memory/dcache/MSHREntry.scala 161:13]
      end
    end else if (_io_aw_valid_T_1 & _T_2) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 131:41]
      beatCnt <= 5'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 131:68]
    end else begin
      beatCnt <= _GEN_10;
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_0 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h0 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_0 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_1 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h1 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_1 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_2 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h2 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_2 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_3 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h3 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_3 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_4 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h4 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_4 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_5 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h5 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_5 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_6 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h6 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_6 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_7 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h7 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_7 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_8 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h8 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_8 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_9 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'h9 == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_9 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_10 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'ha == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_10 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_11 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'hb == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_11 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_12 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'hc == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_12 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_13 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'hd == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_13 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_14 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'he == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_14 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
      refillBuf_15 <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 74:31]
    end else if (_io_r_ready_T & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 189:43]
      if (4'hf == beatCnt[3:0]) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
        refillBuf_15 <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 190:24]
      end
    end
    if (reset) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 75:31]
      ucDataReg <= 32'h0; // @[src/main/scala/memory/dcache/MSHREntry.scala 75:31]
    end else if (_io_r_ready_T_1 & _T_25) begin // @[src/main/scala/memory/dcache/MSHREntry.scala 194:39]
      ucDataReg <= io_r_bits_rdata; // @[src/main/scala/memory/dcache/MSHREntry.scala 194:51]
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
  state = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  reqPaddr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reqType = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  reqVictimWay = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  reqVictimTag = _RAND_4[17:0];
  _RAND_5 = {16{`RANDOM}};
  reqVictimData = _RAND_5[511:0];
  _RAND_6 = {1{`RANDOM}};
  reqStoreData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reqLsuOp = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  beatCnt = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  refillBuf_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  refillBuf_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  refillBuf_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  refillBuf_3 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  refillBuf_4 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  refillBuf_5 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  refillBuf_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  refillBuf_7 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  refillBuf_8 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  refillBuf_9 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  refillBuf_10 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  refillBuf_11 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  refillBuf_12 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  refillBuf_13 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  refillBuf_14 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  refillBuf_15 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  ucDataReg = _RAND_25[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
