module BPU(
  input         clock,
  input         reset,
  input  [31:0] io_predictReq_nextPC, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_predictReq_rdBpu, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [31:0] io_predictReq_pc, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_predictReq_crossLine, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_taken, // @[src/main/scala/frontend/BPU.scala 13:14]
  output [31:0] io_predictResp_target, // @[src/main/scala/frontend/BPU.scala 13:14]
  output [1:0]  io_predictResp_takenOffset, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_meta_valid, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_meta_btbHit, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_meta_btbIsJalr, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_meta_btbIsJal, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_meta_btbIsCall, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_meta_btbIsRet, // @[src/main/scala/frontend/BPU.scala 13:14]
  output [1:0]  io_predictResp_meta_btbOffset, // @[src/main/scala/frontend/BPU.scala 13:14]
  output [1:0]  io_predictResp_meta_phtCounter, // @[src/main/scala/frontend/BPU.scala 13:14]
  output        io_predictResp_meta_predTaken, // @[src/main/scala/frontend/BPU.scala 13:14]
  output [31:0] io_predictResp_meta_predTarget, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_pd_valid, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_pd_validEntry, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [31:0] io_update_pd_pc, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_pd_taken, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [31:0] io_update_pd_target, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [1:0]  io_update_pd_oldPhtCounter, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_pd_isJalr, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_pd_isJal, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_pd_isCall, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_pd_isRet, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [1:0]  io_update_pd_offset, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_br_valid, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [31:0] io_update_br_pc, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_br_taken, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [31:0] io_update_br_target, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [1:0]  io_update_br_oldPhtCounter, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_br_isJalr, // @[src/main/scala/frontend/BPU.scala 13:14]
  input         io_update_br_isJal, // @[src/main/scala/frontend/BPU.scala 13:14]
  input  [1:0]  io_update_br_offset // @[src/main/scala/frontend/BPU.scala 13:14]
);
  wire  btbMem0_clock; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire  btbMem0_reset; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire  btbMem0_io_wr_en; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire [3:0] btbMem0_io_wr_addr; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire [62:0] btbMem0_io_wr_data; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire  btbMem0_io_rd_en; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire [3:0] btbMem0_io_rd_addr; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire [62:0] btbMem0_io_rd_data; // @[src/main/scala/frontend/BPU.scala 39:23]
  wire  phtMem0_clock; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire  phtMem0_reset; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire  phtMem0_io_wr_en; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire [5:0] phtMem0_io_wr_addr; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire [1:0] phtMem0_io_wr_data; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire  phtMem0_io_rd_en; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire [5:0] phtMem0_io_rd_addr; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire [1:0] phtMem0_io_rd_data; // @[src/main/scala/frontend/BPU.scala 42:23]
  wire  btbMem1_clock; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire  btbMem1_reset; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire  btbMem1_io_wr_en; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire [3:0] btbMem1_io_wr_addr; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire [62:0] btbMem1_io_wr_data; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire  btbMem1_io_rd_en; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire [3:0] btbMem1_io_rd_addr; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire [62:0] btbMem1_io_rd_data; // @[src/main/scala/frontend/BPU.scala 45:23]
  wire  phtMem1_clock; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire  phtMem1_reset; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire  phtMem1_io_wr_en; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire [5:0] phtMem1_io_wr_addr; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire [1:0] phtMem1_io_wr_data; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire  phtMem1_io_rd_en; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire [5:0] phtMem1_io_rd_addr; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire [1:0] phtMem1_io_rd_data; // @[src/main/scala/frontend/BPU.scala 48:23]
  wire [3:0] readBlockIdx = io_predictReq_nextPC[7:4]; // @[src/main/scala/frontend/BPU.scala 51:42]
  wire [1:0] fetchOffset = io_predictReq_pc[3:2]; // @[src/main/scala/frontend/BPU.scala 65:37]
  wire [23:0] tag0 = io_predictReq_pc[31:8]; // @[src/main/scala/frontend/BPU.scala 68:30]
  wire [27:0] _nextBlockBase_T_2 = io_predictReq_pc[31:4] + 28'h1; // @[src/main/scala/frontend/BPU.scala 70:69]
  wire [31:0] nextBlockBase = {_nextBlockBase_T_2,4'h0}; // @[src/main/scala/frontend/BPU.scala 70:26]
  wire [23:0] tag1 = nextBlockBase[31:8]; // @[src/main/scala/frontend/BPU.scala 71:27]
  wire [62:0] _btbEntry0_WIRE = btbMem0_io_rd_data; // @[src/main/scala/frontend/BPU.scala 74:{47,47}]
  wire [1:0] btbEntry0_offset = _btbEntry0_WIRE[1:0]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire  btbEntry0_isRet = _btbEntry0_WIRE[2]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire  btbEntry0_isCall = _btbEntry0_WIRE[3]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire  btbEntry0_isJal = _btbEntry0_WIRE[4]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire  btbEntry0_isJalr = _btbEntry0_WIRE[5]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire [31:0] btbEntry0_target = _btbEntry0_WIRE[37:6]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire [23:0] btbEntry0_tag = _btbEntry0_WIRE[61:38]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire  btbEntry0_valid = _btbEntry0_WIRE[62]; // @[src/main/scala/frontend/BPU.scala 74:47]
  wire  phtTaken0 = phtMem0_io_rd_data[1]; // @[src/main/scala/frontend/BPU.scala 76:31]
  wire  btbHit0 = btbEntry0_valid & btbEntry0_tag == tag0 & btbEntry0_offset >= fetchOffset; // @[src/main/scala/frontend/BPU.scala 78:64]
  wire  predTaken0 = btbHit0 & (btbEntry0_isJalr | btbEntry0_isJal | phtTaken0); // @[src/main/scala/frontend/BPU.scala 79:28]
  wire [62:0] _btbEntry1_WIRE = btbMem1_io_rd_data; // @[src/main/scala/frontend/BPU.scala 82:{47,47}]
  wire [1:0] btbEntry1_offset = _btbEntry1_WIRE[1:0]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire  btbEntry1_isRet = _btbEntry1_WIRE[2]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire  btbEntry1_isCall = _btbEntry1_WIRE[3]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire  btbEntry1_isJal = _btbEntry1_WIRE[4]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire  btbEntry1_isJalr = _btbEntry1_WIRE[5]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire [31:0] btbEntry1_target = _btbEntry1_WIRE[37:6]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire [23:0] btbEntry1_tag = _btbEntry1_WIRE[61:38]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire  btbEntry1_valid = _btbEntry1_WIRE[62]; // @[src/main/scala/frontend/BPU.scala 82:47]
  wire  phtTaken1 = phtMem1_io_rd_data[1]; // @[src/main/scala/frontend/BPU.scala 84:31]
  wire  btbHit1 = btbEntry1_valid & btbEntry1_tag == tag1 & btbEntry1_offset < fetchOffset & ~io_predictReq_crossLine; // @[src/main/scala/frontend/BPU.scala 87:100]
  wire  predTaken1 = btbHit1 & (btbEntry1_isJalr | btbEntry1_isJal | phtTaken1); // @[src/main/scala/frontend/BPU.scala 88:28]
  wire [1:0] offset0_out = btbEntry0_offset - fetchOffset; // @[src/main/scala/frontend/BPU.scala 97:38]
  wire [2:0] _GEN_9 = {{1'd0}, btbEntry1_offset}; // @[src/main/scala/frontend/BPU.scala 99:38]
  wire [2:0] _offset1_out_T_1 = _GEN_9 + 3'h4; // @[src/main/scala/frontend/BPU.scala 99:38]
  wire [2:0] _GEN_10 = {{1'd0}, fetchOffset}; // @[src/main/scala/frontend/BPU.scala 99:53]
  wire [2:0] offset1_out = _offset1_out_T_1 - _GEN_10; // @[src/main/scala/frontend/BPU.scala 99:53]
  wire [2:0] finalOffset = predTaken0 ? {{1'd0}, offset0_out} : offset1_out; // @[src/main/scala/frontend/BPU.scala 101:24]
  wire  doUpdate = io_update_br_valid | io_update_pd_valid; // @[src/main/scala/frontend/BPU.scala 123:37]
  wire  update_validEntry = io_update_br_valid | io_update_pd_validEntry; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire [31:0] update_pc = io_update_br_valid ? io_update_br_pc : io_update_pd_pc; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire  update_taken = io_update_br_valid ? io_update_br_taken : io_update_pd_taken; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire [31:0] update_target = io_update_br_valid ? io_update_br_target : io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire [1:0] update_oldPhtCounter = io_update_br_valid ? io_update_br_oldPhtCounter : io_update_pd_oldPhtCounter; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire  update_isJalr = io_update_br_valid ? io_update_br_isJalr : io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire  update_isJal = io_update_br_valid ? io_update_br_isJal : io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire  update_isCall = io_update_br_valid ? 1'h0 : io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire  update_isRet = io_update_br_valid ? 1'h0 : io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire [1:0] update_offset = io_update_br_valid ? io_update_br_offset : io_update_pd_offset; // @[src/main/scala/frontend/BPU.scala 124:21]
  wire [3:0] updateBlockIdx = update_pc[7:4]; // @[src/main/scala/frontend/BPU.scala 134:35]
  wire [23:0] updateTag = update_pc[31:8]; // @[src/main/scala/frontend/BPU.scala 135:35]
  wire [1:0] _nextCounter_T_1 = update_oldPhtCounter + 2'h1; // @[src/main/scala/frontend/BPU.scala 154:33]
  wire [1:0] _nextCounter_T_3 = update_oldPhtCounter - 2'h1; // @[src/main/scala/frontend/BPU.scala 156:33]
  wire [1:0] _GEN_0 = ~update_taken & update_oldPhtCounter != 2'h0 ? _nextCounter_T_3 : update_oldPhtCounter; // @[src/main/scala/frontend/BPU.scala 155:53 156:19 150:34]
  wire [1:0] _GEN_1 = update_taken & update_oldPhtCounter != 2'h3 ? _nextCounter_T_1 : _GEN_0; // @[src/main/scala/frontend/BPU.scala 153:52 154:19]
  wire [1:0] nextCounter = ~update_validEntry ? 2'h2 : _GEN_1; // @[src/main/scala/frontend/BPU.scala 151:29 152:19]
  wire [62:0] _btbMem0_io_wr_data_T = {update_validEntry,updateTag,update_target,update_isJalr,update_isJal,
    update_isCall,update_isRet,update_offset}; // @[src/main/scala/frontend/BPU.scala 163:36]
  wire [3:0] updateBlockIdx_minus_1 = updateBlockIdx - 4'h1; // @[src/main/scala/frontend/BPU.scala 171:49]
  wire [3:0] _GEN_4 = doUpdate ? updateBlockIdx : 4'h0; // @[src/main/scala/frontend/BPU.scala 132:18 162:24 127:51]
  wire [3:0] _GEN_7 = doUpdate ? updateBlockIdx_minus_1 : 4'h0; // @[src/main/scala/frontend/BPU.scala 132:18 174:24 129:51]
  SimpleBlockRAM btbMem0 ( // @[src/main/scala/frontend/BPU.scala 39:23]
    .clock(btbMem0_clock),
    .reset(btbMem0_reset),
    .io_wr_en(btbMem0_io_wr_en),
    .io_wr_addr(btbMem0_io_wr_addr),
    .io_wr_data(btbMem0_io_wr_data),
    .io_rd_en(btbMem0_io_rd_en),
    .io_rd_addr(btbMem0_io_rd_addr),
    .io_rd_data(btbMem0_io_rd_data)
  );
  SimpleBlockRAM_1 phtMem0 ( // @[src/main/scala/frontend/BPU.scala 42:23]
    .clock(phtMem0_clock),
    .reset(phtMem0_reset),
    .io_wr_en(phtMem0_io_wr_en),
    .io_wr_addr(phtMem0_io_wr_addr),
    .io_wr_data(phtMem0_io_wr_data),
    .io_rd_en(phtMem0_io_rd_en),
    .io_rd_addr(phtMem0_io_rd_addr),
    .io_rd_data(phtMem0_io_rd_data)
  );
  SimpleBlockRAM btbMem1 ( // @[src/main/scala/frontend/BPU.scala 45:23]
    .clock(btbMem1_clock),
    .reset(btbMem1_reset),
    .io_wr_en(btbMem1_io_wr_en),
    .io_wr_addr(btbMem1_io_wr_addr),
    .io_wr_data(btbMem1_io_wr_data),
    .io_rd_en(btbMem1_io_rd_en),
    .io_rd_addr(btbMem1_io_rd_addr),
    .io_rd_data(btbMem1_io_rd_data)
  );
  SimpleBlockRAM_1 phtMem1 ( // @[src/main/scala/frontend/BPU.scala 48:23]
    .clock(phtMem1_clock),
    .reset(phtMem1_reset),
    .io_wr_en(phtMem1_io_wr_en),
    .io_wr_addr(phtMem1_io_wr_addr),
    .io_wr_data(phtMem1_io_wr_data),
    .io_rd_en(phtMem1_io_rd_en),
    .io_rd_addr(phtMem1_io_rd_addr),
    .io_rd_data(phtMem1_io_rd_data)
  );
  assign io_predictResp_taken = predTaken0 | predTaken1; // @[src/main/scala/frontend/BPU.scala 92:32]
  assign io_predictResp_target = predTaken0 ? btbEntry0_target : btbEntry1_target; // @[src/main/scala/frontend/BPU.scala 93:24]
  assign io_predictResp_takenOffset = finalOffset[1:0]; // @[src/main/scala/frontend/BPU.scala 106:30]
  assign io_predictResp_meta_valid = predTaken0 ? btbEntry0_valid : btbEntry1_valid; // @[src/main/scala/frontend/BPU.scala 111:36]
  assign io_predictResp_meta_btbHit = btbHit0 | btbHit1; // @[src/main/scala/frontend/BPU.scala 110:45]
  assign io_predictResp_meta_btbIsJalr = predTaken0 ? btbEntry0_isJalr : btbEntry1_isJalr; // @[src/main/scala/frontend/BPU.scala 112:40]
  assign io_predictResp_meta_btbIsJal = predTaken0 ? btbEntry0_isJal : btbEntry1_isJal; // @[src/main/scala/frontend/BPU.scala 113:40]
  assign io_predictResp_meta_btbIsCall = predTaken0 ? btbEntry0_isCall : btbEntry1_isCall; // @[src/main/scala/frontend/BPU.scala 114:40]
  assign io_predictResp_meta_btbIsRet = predTaken0 ? btbEntry0_isRet : btbEntry1_isRet; // @[src/main/scala/frontend/BPU.scala 115:40]
  assign io_predictResp_meta_btbOffset = predTaken0 ? btbEntry0_offset : btbEntry1_offset; // @[src/main/scala/frontend/BPU.scala 116:40]
  assign io_predictResp_meta_phtCounter = predTaken0 ? phtMem0_io_rd_data : phtMem1_io_rd_data; // @[src/main/scala/frontend/BPU.scala 117:40]
  assign io_predictResp_meta_predTaken = predTaken0 | predTaken1; // @[src/main/scala/frontend/BPU.scala 92:32]
  assign io_predictResp_meta_predTarget = predTaken0 ? btbEntry0_target : btbEntry1_target; // @[src/main/scala/frontend/BPU.scala 93:24]
  assign btbMem0_clock = clock;
  assign btbMem0_reset = reset;
  assign btbMem0_io_wr_en = io_update_br_valid | io_update_pd_valid; // @[src/main/scala/frontend/BPU.scala 123:37]
  assign btbMem0_io_wr_addr = doUpdate ? updateBlockIdx : 4'h0; // @[src/main/scala/frontend/BPU.scala 132:18 162:24 127:51]
  assign btbMem0_io_wr_data = doUpdate ? _btbMem0_io_wr_data_T : 63'h0; // @[src/main/scala/frontend/BPU.scala 132:18 163:24 127:78]
  assign btbMem0_io_rd_en = io_predictReq_rdBpu; // @[src/main/scala/frontend/BPU.scala 54:22]
  assign btbMem0_io_rd_addr = io_predictReq_nextPC[7:4]; // @[src/main/scala/frontend/BPU.scala 51:42]
  assign phtMem0_clock = clock;
  assign phtMem0_reset = reset;
  assign phtMem0_io_wr_en = io_update_br_valid | io_update_pd_valid; // @[src/main/scala/frontend/BPU.scala 123:37]
  assign phtMem0_io_wr_addr = {{2'd0}, _GEN_4};
  assign phtMem0_io_wr_data = doUpdate ? nextCounter : 2'h0; // @[src/main/scala/frontend/BPU.scala 132:18 167:24 128:78]
  assign phtMem0_io_rd_en = io_predictReq_rdBpu; // @[src/main/scala/frontend/BPU.scala 56:22]
  assign phtMem0_io_rd_addr = {{2'd0}, readBlockIdx}; // @[src/main/scala/frontend/BPU.scala 57:22]
  assign btbMem1_clock = clock;
  assign btbMem1_reset = reset;
  assign btbMem1_io_wr_en = io_update_br_valid | io_update_pd_valid; // @[src/main/scala/frontend/BPU.scala 123:37]
  assign btbMem1_io_wr_addr = doUpdate ? updateBlockIdx_minus_1 : 4'h0; // @[src/main/scala/frontend/BPU.scala 132:18 174:24 129:51]
  assign btbMem1_io_wr_data = doUpdate ? _btbMem0_io_wr_data_T : 63'h0; // @[src/main/scala/frontend/BPU.scala 132:18 175:24 129:78]
  assign btbMem1_io_rd_en = io_predictReq_rdBpu; // @[src/main/scala/frontend/BPU.scala 59:22]
  assign btbMem1_io_rd_addr = io_predictReq_nextPC[7:4]; // @[src/main/scala/frontend/BPU.scala 51:42]
  assign phtMem1_clock = clock;
  assign phtMem1_reset = reset;
  assign phtMem1_io_wr_en = io_update_br_valid | io_update_pd_valid; // @[src/main/scala/frontend/BPU.scala 123:37]
  assign phtMem1_io_wr_addr = {{2'd0}, _GEN_7};
  assign phtMem1_io_wr_data = doUpdate ? nextCounter : 2'h0; // @[src/main/scala/frontend/BPU.scala 132:18 167:24 128:78]
  assign phtMem1_io_rd_en = io_predictReq_rdBpu; // @[src/main/scala/frontend/BPU.scala 61:22]
  assign phtMem1_io_rd_addr = {{2'd0}, readBlockIdx}; // @[src/main/scala/frontend/BPU.scala 62:22]
endmodule
