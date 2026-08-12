module IFU(
  input         clock,
  input         reset,
  input         io_frontendRedirect_valid, // @[src/main/scala/frontend/IFU.scala 13:14]
  input  [31:0] io_frontendRedirect_target, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_redirectInfo_valid, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/frontend/IFU.scala 13:14]
  input  [31:0] io_redirectInfo_bits_target, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [31:0] io_predictReq_nextPC, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_predictReq_rdBpu, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [31:0] io_predictReq_pc, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_predictReq_crossLine, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_taken, // @[src/main/scala/frontend/IFU.scala 13:14]
  input  [31:0] io_predictResp_target, // @[src/main/scala/frontend/IFU.scala 13:14]
  input  [1:0]  io_predictResp_takenOffset, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_meta_valid, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_meta_btbHit, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_meta_btbIsJalr, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_meta_btbIsJal, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_meta_btbIsCall, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_meta_btbIsRet, // @[src/main/scala/frontend/IFU.scala 13:14]
  input  [1:0]  io_predictResp_meta_btbOffset, // @[src/main/scala/frontend/IFU.scala 13:14]
  input  [1:0]  io_predictResp_meta_phtCounter, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_predictResp_meta_predTaken, // @[src/main/scala/frontend/IFU.scala 13:14]
  input  [31:0] io_predictResp_meta_predTarget, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [31:0] io_icache_req_addr, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_icache_req_valid, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_icache_req_ready, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_icache_req_flush, // @[src/main/scala/frontend/IFU.scala 13:14]
  input         io_bpuInfoQueuEnq_ready, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_valid, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [31:0] io_bpuInfoQueuEnq_bits_pc, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [31:0] io_bpuInfoQueuEnq_bits_fallThrough, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_taken, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [31:0] io_bpuInfoQueuEnq_bits_target, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [1:0]  io_bpuInfoQueuEnq_bits_takenOffset, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_meta_valid, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_meta_btbHit, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_meta_btbIsJalr, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_meta_btbIsJal, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_meta_btbIsCall, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_meta_btbIsRet, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [1:0]  io_bpuInfoQueuEnq_bits_meta_btbOffset, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [1:0]  io_bpuInfoQueuEnq_bits_meta_phtCounter, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [2:0]  io_bpuInfoQueuEnq_bits_meta_rasTop, // @[src/main/scala/frontend/IFU.scala 13:14]
  output        io_bpuInfoQueuEnq_bits_meta_predTaken, // @[src/main/scala/frontend/IFU.scala 13:14]
  output [31:0] io_bpuInfoQueuEnq_bits_meta_predTarget // @[src/main/scala/frontend/IFU.scala 13:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/frontend/IFU.scala 37:25]
  reg  pcValid; // @[src/main/scala/frontend/IFU.scala 38:25]
  wire [5:0] blockOffset = pcReg[5:0]; // @[src/main/scala/frontend/IFU.scala 44:28]
  wire [6:0] _GEN_1 = {{1'd0}, blockOffset}; // @[src/main/scala/frontend/IFU.scala 45:36]
  wire [6:0] bytesInLine = 7'h40 - _GEN_1; // @[src/main/scala/frontend/IFU.scala 45:36]
  wire [4:0] instsInLine = bytesInLine[6:2]; // @[src/main/scala/frontend/IFU.scala 46:35]
  wire  crossLine = instsInLine < 5'h4; // @[src/main/scala/frontend/IFU.scala 47:35]
  wire [25:0] _seqPC_T_2 = pcReg[31:6] + 26'h1; // @[src/main/scala/frontend/IFU.scala 49:55]
  wire [31:0] _seqPC_T_3 = {_seqPC_T_2,6'h0}; // @[src/main/scala/frontend/IFU.scala 49:30]
  wire [31:0] _seqPC_T_5 = pcReg + 32'h10; // @[src/main/scala/frontend/IFU.scala 50:33]
  wire [31:0] seqPC = crossLine ? _seqPC_T_3 : _seqPC_T_5; // @[src/main/scala/frontend/IFU.scala 48:26]
  wire  backendRedirectValid = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/frontend/IFU.scala 62:53]
  wire [31:0] _nextPC_T = io_predictResp_taken ? io_predictResp_target : seqPC; // @[src/main/scala/frontend/IFU.scala 68:19]
  wire [31:0] _nextPC_T_1 = io_frontendRedirect_valid ? io_frontendRedirect_target : _nextPC_T; // @[src/main/scala/frontend/IFU.scala 67:19]
  wire  _pc_fire_T_2 = ~backendRedirectValid; // @[src/main/scala/frontend/IFU.scala 72:80]
  wire  _pc_fire_T_4 = ~io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 72:105]
  wire  pc_fire = pcValid & (io_icache_req_ready & io_bpuInfoQueuEnq_ready) & ~backendRedirectValid & ~
    io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 72:102]
  wire  pcRegRedirect = backendRedirectValid | io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 85:44]
  wire [31:0] currentPredInfo_pc = pcReg; // @[src/main/scala/frontend/IFU.scala 102:29 103:31]
  wire [31:0] currentPredInfo_fallThrough = seqPC; // @[src/main/scala/frontend/IFU.scala 48:26]
  wire  currentPredInfo_taken = io_predictResp_taken; // @[src/main/scala/frontend/IFU.scala 102:29 105:31]
  wire [31:0] currentPredInfo_target = io_predictResp_target; // @[src/main/scala/frontend/IFU.scala 102:29 106:31]
  wire [1:0] currentPredInfo_takenOffset = io_predictResp_takenOffset; // @[src/main/scala/frontend/IFU.scala 102:29 107:31]
  wire  currentPredInfo_meta_valid = io_predictResp_meta_valid; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire  currentPredInfo_meta_btbHit = io_predictResp_meta_btbHit; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire  currentPredInfo_meta_btbIsJalr = io_predictResp_meta_btbIsJalr; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire  currentPredInfo_meta_btbIsJal = io_predictResp_meta_btbIsJal; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire  currentPredInfo_meta_btbIsCall = io_predictResp_meta_btbIsCall; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire  currentPredInfo_meta_btbIsRet = io_predictResp_meta_btbIsRet; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire [1:0] currentPredInfo_meta_btbOffset = io_predictResp_meta_btbOffset; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire [1:0] currentPredInfo_meta_phtCounter = io_predictResp_meta_phtCounter; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire [2:0] currentPredInfo_meta_rasTop = 3'h0; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire  currentPredInfo_meta_predTaken = io_predictResp_meta_predTaken; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  wire [31:0] currentPredInfo_meta_predTarget = io_predictResp_meta_predTarget; // @[src/main/scala/frontend/IFU.scala 102:29 108:31]
  assign io_predictReq_nextPC = backendRedirectValid ? io_redirectInfo_bits_target : _nextPC_T_1; // @[src/main/scala/frontend/IFU.scala 66:19]
  assign io_predictReq_rdBpu = pc_fire | io_frontendRedirect_valid | backendRedirectValid; // @[src/main/scala/frontend/IFU.scala 78:60]
  assign io_predictReq_pc = pcReg; // @[src/main/scala/frontend/IFU.scala 77:20]
  assign io_predictReq_crossLine = instsInLine < 5'h4; // @[src/main/scala/frontend/IFU.scala 47:35]
  assign io_icache_req_addr = pcReg; // @[src/main/scala/frontend/IFU.scala 96:23]
  assign io_icache_req_valid = _pc_fire_T_2 & _pc_fire_T_4; // @[src/main/scala/frontend/IFU.scala 97:48]
  assign io_icache_req_flush = backendRedirectValid | io_frontendRedirect_valid; // @[src/main/scala/frontend/IFU.scala 99:48]
  assign io_bpuInfoQueuEnq_valid = pc_fire & pcReg != 32'h1bfffffc; // @[src/main/scala/frontend/IFU.scala 111:38]
  assign io_bpuInfoQueuEnq_bits_pc = currentPredInfo_pc; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_fallThrough = currentPredInfo_fallThrough; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_taken = currentPredInfo_taken; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_target = currentPredInfo_target; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_takenOffset = currentPredInfo_takenOffset; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_valid = currentPredInfo_meta_valid; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_btbHit = currentPredInfo_meta_btbHit; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_btbIsJalr = currentPredInfo_meta_btbIsJalr; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_btbIsJal = currentPredInfo_meta_btbIsJal; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_btbIsCall = currentPredInfo_meta_btbIsCall; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_btbIsRet = currentPredInfo_meta_btbIsRet; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_btbOffset = currentPredInfo_meta_btbOffset; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_phtCounter = currentPredInfo_meta_phtCounter; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_rasTop = currentPredInfo_meta_rasTop; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_predTaken = currentPredInfo_meta_predTaken; // @[src/main/scala/frontend/IFU.scala 112:27]
  assign io_bpuInfoQueuEnq_bits_meta_predTarget = currentPredInfo_meta_predTarget; // @[src/main/scala/frontend/IFU.scala 112:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/frontend/IFU.scala 37:25]
      pcReg <= 32'h1bfffffc; // @[src/main/scala/frontend/IFU.scala 37:25]
    end else if (pc_fire | pcRegRedirect) begin // @[src/main/scala/frontend/IFU.scala 91:34]
      if (backendRedirectValid) begin // @[src/main/scala/frontend/IFU.scala 66:19]
        pcReg <= io_redirectInfo_bits_target;
      end else if (io_frontendRedirect_valid) begin // @[src/main/scala/frontend/IFU.scala 67:19]
        pcReg <= io_frontendRedirect_target;
      end else begin
        pcReg <= _nextPC_T;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IFU.scala 38:25]
      pcValid <= 1'h0; // @[src/main/scala/frontend/IFU.scala 38:25]
    end else begin
      pcValid <= 1'h1; // @[src/main/scala/frontend/IFU.scala 39:11]
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
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pcValid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
