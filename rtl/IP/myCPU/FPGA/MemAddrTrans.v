module MemAddrTrans(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_in_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [3:0]  io_in_bits_uop_ctrl_lsuOp, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_in_bits_uop_ctrl_memRead, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [16:0] io_in_bits_uop_excp_excpVec, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [3:0]  io_in_bits_uop_lqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [3:0]  io_in_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_in_bits_uop_isSta, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [31:0] io_in_bits_data, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_exeRes_uop_ctrl_memRead, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [16:0] io_out_bits_exeRes_uop_excp_excpVec, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [3:0]  io_out_bits_exeRes_uop_lqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [3:0]  io_out_bits_exeRes_uop_sqIdx_value, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_exeRes_uop_isSta, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [31:0] io_out_bits_exeRes_data, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [31:0] io_out_bits_mmuRes_paddr, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_mmuRes_cacheable, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_mmuRes_error_excpTlbRefill, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_mmuRes_error_excpTlbPpi, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_out_bits_mmuRes_error_excpAle, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_mmuReq_ready, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output        io_mmuReq_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [31:0] io_mmuReq_bits_vaddr, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  output [3:0]  io_mmuReq_bits_lsuOp, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_mmuResp_valid, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input  [31:0] io_mmuResp_bits_paddr, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_mmuResp_bits_cacheable, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_mmuResp_bits_error_excpTlbRefill, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_mmuResp_bits_error_excpTlbPpi, // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
  input         io_mmuResp_bits_error_excpAle // @[src/main/scala/memory/MemAddrTrans.scala 11:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  s1_valid; // @[src/main/scala/memory/MemAddrTrans.scala 28:25]
  reg [3:0] s1_data_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
  reg  s1_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
  reg [16:0] s1_data_uop_excp_excpVec; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
  reg [3:0] s1_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
  reg [3:0] s1_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
  reg  s1_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
  reg [31:0] s1_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
  reg  s2_valid; // @[src/main/scala/memory/MemAddrTrans.scala 62:28]
  reg  s2_mmu_done; // @[src/main/scala/memory/MemAddrTrans.scala 67:28]
  wire  _s2_fire_T = s2_mmu_done | io_mmuResp_valid; // @[src/main/scala/memory/MemAddrTrans.scala 71:42]
  wire  s2_fire = s2_valid & (s2_mmu_done | io_mmuResp_valid); // @[src/main/scala/memory/MemAddrTrans.scala 71:26]
  wire  s2_ready = ~s2_valid | s2_fire; // @[src/main/scala/memory/MemAddrTrans.scala 74:25]
  wire  s1_fire = s1_valid & io_mmuReq_ready & s2_ready; // @[src/main/scala/memory/MemAddrTrans.scala 35:45]
  wire  _T = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_0 = s1_fire ? 1'h0 : s1_valid; // @[src/main/scala/memory/MemAddrTrans.scala 46:23 47:14 28:25]
  wire  _GEN_1 = _T | _GEN_0; // @[src/main/scala/memory/MemAddrTrans.scala 43:26 44:14]
  reg  s2_exe_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
  reg [16:0] s2_exe_data_uop_excp_excpVec; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
  reg [3:0] s2_exe_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
  reg [3:0] s2_exe_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
  reg  s2_exe_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
  reg [31:0] s2_exe_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
  reg [31:0] s2_mmu_resp_paddr; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
  reg  s2_mmu_resp_cacheable; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
  reg  s2_mmu_resp_error_excpTlbRefill; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
  reg  s2_mmu_resp_error_excpTlbPpi; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
  reg  s2_mmu_resp_error_excpAle; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
  wire  _GEN_260 = s1_fire | s2_valid; // @[src/main/scala/memory/MemAddrTrans.scala 92:19 93:19 62:28]
  wire  _GEN_261 = s1_fire ? 1'h0 : s2_mmu_done; // @[src/main/scala/memory/MemAddrTrans.scala 92:19 95:19 67:28]
  wire  _GEN_262 = s2_valid & ~s2_mmu_done & io_mmuResp_valid | _GEN_261; // @[src/main/scala/memory/MemAddrTrans.scala 100:56 101:19]
  assign io_in_ready = ~s1_valid | s1_fire; // @[src/main/scala/memory/MemAddrTrans.scala 38:28]
  assign io_out_valid = s2_valid & _s2_fire_T; // @[src/main/scala/memory/MemAddrTrans.scala 112:28]
  assign io_out_bits_exeRes_uop_ctrl_memRead = s2_exe_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 113:22]
  assign io_out_bits_exeRes_uop_excp_excpVec = s2_exe_data_uop_excp_excpVec; // @[src/main/scala/memory/MemAddrTrans.scala 113:22]
  assign io_out_bits_exeRes_uop_lqIdx_value = s2_exe_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 113:22]
  assign io_out_bits_exeRes_uop_sqIdx_value = s2_exe_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 113:22]
  assign io_out_bits_exeRes_uop_isSta = s2_exe_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 113:22]
  assign io_out_bits_exeRes_data = s2_exe_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 113:22]
  assign io_out_bits_mmuRes_paddr = s2_mmu_done ? s2_mmu_resp_paddr : io_mmuResp_bits_paddr; // @[src/main/scala/memory/MemAddrTrans.scala 117:28]
  assign io_out_bits_mmuRes_cacheable = s2_mmu_done ? s2_mmu_resp_cacheable : io_mmuResp_bits_cacheable; // @[src/main/scala/memory/MemAddrTrans.scala 117:28]
  assign io_out_bits_mmuRes_error_excpTlbRefill = s2_mmu_done ? s2_mmu_resp_error_excpTlbRefill :
    io_mmuResp_bits_error_excpTlbRefill; // @[src/main/scala/memory/MemAddrTrans.scala 117:28]
  assign io_out_bits_mmuRes_error_excpTlbPpi = s2_mmu_done ? s2_mmu_resp_error_excpTlbPpi :
    io_mmuResp_bits_error_excpTlbPpi; // @[src/main/scala/memory/MemAddrTrans.scala 117:28]
  assign io_out_bits_mmuRes_error_excpAle = s2_mmu_done ? s2_mmu_resp_error_excpAle : io_mmuResp_bits_error_excpAle; // @[src/main/scala/memory/MemAddrTrans.scala 117:28]
  assign io_mmuReq_valid = s1_valid & s2_ready; // @[src/main/scala/memory/MemAddrTrans.scala 51:36]
  assign io_mmuReq_bits_vaddr = s1_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 52:24]
  assign io_mmuReq_bits_lsuOp = s1_data_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemAddrTrans.scala 53:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 28:25]
      s1_valid <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 28:25]
    end else begin
      s1_valid <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
      s1_data_uop_ctrl_lsuOp <= 4'h0; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
    end else if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_ctrl_lsuOp <= io_in_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
      s1_data_uop_ctrl_memRead <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
    end else if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_ctrl_memRead <= io_in_bits_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
      s1_data_uop_excp_excpVec <= 17'h0; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
    end else if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_excp_excpVec <= io_in_bits_uop_excp_excpVec; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
      s1_data_uop_lqIdx_value <= 4'h0; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
    end else if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_lqIdx_value <= io_in_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
      s1_data_uop_sqIdx_value <= 4'h0; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
    end else if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_sqIdx_value <= io_in_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
      s1_data_uop_isSta <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
    end else if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_uop_isSta <= io_in_bits_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
      s1_data_data <= 32'h0; // @[src/main/scala/memory/MemAddrTrans.scala 29:24]
    end else if (_T) begin // @[src/main/scala/memory/MemAddrTrans.scala 43:26]
      s1_data_data <= io_in_bits_data; // @[src/main/scala/memory/MemAddrTrans.scala 45:14]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 62:28]
      s2_valid <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 62:28]
    end else if (s2_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:23]
      s2_valid <= s1_fire;
    end else begin
      s2_valid <= _GEN_260;
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 67:28]
      s2_mmu_done <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 67:28]
    end else if (s2_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:23]
      s2_mmu_done <= 1'h0;
    end else begin
      s2_mmu_done <= _GEN_262;
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
      s2_exe_data_uop_ctrl_memRead <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
    end else if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
      s2_exe_data_uop_ctrl_memRead <= s1_data_uop_ctrl_memRead; // @[src/main/scala/memory/MemAddrTrans.scala 84:19]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
      s2_exe_data_uop_excp_excpVec <= 17'h0; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
    end else if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
      s2_exe_data_uop_excp_excpVec <= s1_data_uop_excp_excpVec; // @[src/main/scala/memory/MemAddrTrans.scala 84:19]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
      s2_exe_data_uop_lqIdx_value <= 4'h0; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
    end else if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
      s2_exe_data_uop_lqIdx_value <= s1_data_uop_lqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 84:19]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
      s2_exe_data_uop_sqIdx_value <= 4'h0; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
    end else if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
      s2_exe_data_uop_sqIdx_value <= s1_data_uop_sqIdx_value; // @[src/main/scala/memory/MemAddrTrans.scala 84:19]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
      s2_exe_data_uop_isSta <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
    end else if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
      s2_exe_data_uop_isSta <= s1_data_uop_isSta; // @[src/main/scala/memory/MemAddrTrans.scala 84:19]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
      s2_exe_data_data <= 32'h0; // @[src/main/scala/memory/MemAddrTrans.scala 63:28]
    end else if (s1_fire) begin // @[src/main/scala/memory/MemAddrTrans.scala 82:19]
      s2_exe_data_data <= s1_data_data; // @[src/main/scala/memory/MemAddrTrans.scala 84:19]
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
      s2_mmu_resp_paddr <= 32'h0; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
    end else if (!(s2_fire)) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:23]
      if (s2_valid & ~s2_mmu_done & io_mmuResp_valid) begin // @[src/main/scala/memory/MemAddrTrans.scala 100:56]
        s2_mmu_resp_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/MemAddrTrans.scala 102:19]
      end
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
      s2_mmu_resp_cacheable <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
    end else if (!(s2_fire)) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:23]
      if (s2_valid & ~s2_mmu_done & io_mmuResp_valid) begin // @[src/main/scala/memory/MemAddrTrans.scala 100:56]
        s2_mmu_resp_cacheable <= io_mmuResp_bits_cacheable; // @[src/main/scala/memory/MemAddrTrans.scala 102:19]
      end
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
      s2_mmu_resp_error_excpTlbRefill <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
    end else if (!(s2_fire)) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:23]
      if (s2_valid & ~s2_mmu_done & io_mmuResp_valid) begin // @[src/main/scala/memory/MemAddrTrans.scala 100:56]
        s2_mmu_resp_error_excpTlbRefill <= io_mmuResp_bits_error_excpTlbRefill; // @[src/main/scala/memory/MemAddrTrans.scala 102:19]
      end
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
      s2_mmu_resp_error_excpTlbPpi <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
    end else if (!(s2_fire)) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:23]
      if (s2_valid & ~s2_mmu_done & io_mmuResp_valid) begin // @[src/main/scala/memory/MemAddrTrans.scala 100:56]
        s2_mmu_resp_error_excpTlbPpi <= io_mmuResp_bits_error_excpTlbPpi; // @[src/main/scala/memory/MemAddrTrans.scala 102:19]
      end
    end
    if (reset) begin // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
      s2_mmu_resp_error_excpAle <= 1'h0; // @[src/main/scala/memory/MemAddrTrans.scala 68:28]
    end else if (!(s2_fire)) begin // @[src/main/scala/memory/MemAddrTrans.scala 80:23]
      if (s2_valid & ~s2_mmu_done & io_mmuResp_valid) begin // @[src/main/scala/memory/MemAddrTrans.scala 100:56]
        s2_mmu_resp_error_excpAle <= io_mmuResp_bits_error_excpAle; // @[src/main/scala/memory/MemAddrTrans.scala 102:19]
      end
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_data_uop_ctrl_lsuOp = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  s1_data_uop_ctrl_memRead = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_data_uop_excp_excpVec = _RAND_3[16:0];
  _RAND_4 = {1{`RANDOM}};
  s1_data_uop_lqIdx_value = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  s1_data_uop_sqIdx_value = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  s1_data_uop_isSta = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_data_data = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s2_valid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s2_mmu_done = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_exe_data_uop_ctrl_memRead = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_exe_data_uop_excp_excpVec = _RAND_11[16:0];
  _RAND_12 = {1{`RANDOM}};
  s2_exe_data_uop_lqIdx_value = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  s2_exe_data_uop_sqIdx_value = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  s2_exe_data_uop_isSta = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s2_exe_data_data = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s2_mmu_resp_paddr = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s2_mmu_resp_cacheable = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s2_mmu_resp_error_excpTlbRefill = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s2_mmu_resp_error_excpTlbPpi = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s2_mmu_resp_error_excpAle = _RAND_20[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
