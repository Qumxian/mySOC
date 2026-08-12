module RedirectController(
  input         clock,
  input         reset,
  input         io_bruRedirect_valid, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input         io_bruRedirect_bits_doRedirect, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [2:0]  io_bruRedirect_bits_snptId, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [5:0]  io_bruRedirect_bits_robIdx_value, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input         io_bruRedirect_bits_robIdx_flag, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [31:0] io_bruRedirect_bits_target, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input         io_robRedirect_valid, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [5:0]  io_robRedirect_robIdx_value, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input         io_robRedirect_robIdx_flag, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input         io_robRedirect_isException, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [16:0] io_robRedirect_excp_excpVec, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [31:0] io_robRedirect_pc, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [31:0] io_robRedirect_excpVaddr, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input         io_robRollbackDone, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_redirectInfo_valid, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_redirectInfo_bits_flushSelf, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_redirectInfo_bits_fromBru, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output [2:0]  io_redirectInfo_bits_snptId, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_redirectInfo_bits_robIdx_flag, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_redirectInfo_bits_fromRob, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output [31:0] io_redirectInfo_bits_target, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_robRedirectPause, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_robNeedRollback, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_excpEvent_excp, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_excpEvent_ertn, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output        io_excpInfo_vaddrError, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output [31:0] io_excpInfo_era, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output [5:0]  io_excpInfo_ecode, // @[src/main/scala/backend/RedirectController.scala 26:14]
  output [31:0] io_excpInfo_badVaddr, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [31:0] io_redirectAddrFromCsr_eentry, // @[src/main/scala/backend/RedirectController.scala 26:14]
  input  [31:0] io_redirectAddrFromCsr_era // @[src/main/scala/backend/RedirectController.scala 26:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  bruReg_bits_doRedirect; // @[src/main/scala/backend/RedirectController.scala 64:23]
  reg [2:0] bruReg_bits_snptId; // @[src/main/scala/backend/RedirectController.scala 64:23]
  reg [5:0] bruReg_bits_robIdx_value; // @[src/main/scala/backend/RedirectController.scala 64:23]
  reg  bruReg_bits_robIdx_flag; // @[src/main/scala/backend/RedirectController.scala 64:23]
  reg [31:0] bruReg_bits_target; // @[src/main/scala/backend/RedirectController.scala 64:23]
  reg [1:0] state; // @[src/main/scala/backend/RedirectController.scala 74:22]
  reg  robInfoIsException; // @[src/main/scala/backend/RedirectController.scala 77:35]
  reg [16:0] robInfoExcpVec_excpVec; // @[src/main/scala/backend/RedirectController.scala 78:35]
  reg [31:0] robInfoPc; // @[src/main/scala/backend/RedirectController.scala 79:35]
  reg [5:0] robInfoRobIdx_value; // @[src/main/scala/backend/RedirectController.scala 80:35]
  reg  robInfoRobIdx_flag; // @[src/main/scala/backend/RedirectController.scala 80:35]
  wire  _GEN_2 = io_robRedirect_valid ? io_robRedirect_isException : robInfoIsException; // @[src/main/scala/backend/RedirectController.scala 84:26 86:29 77:35]
  wire [16:0] _GEN_3 = io_robRedirect_valid ? io_robRedirect_excp_excpVec : robInfoExcpVec_excpVec; // @[src/main/scala/backend/RedirectController.scala 84:26 87:29 78:35]
  wire [31:0] _GEN_4 = io_robRedirect_valid ? io_robRedirect_pc : robInfoPc; // @[src/main/scala/backend/RedirectController.scala 84:26 88:29 79:35]
  wire [5:0] _GEN_5 = io_robRedirect_valid ? io_robRedirect_robIdx_value : robInfoRobIdx_value; // @[src/main/scala/backend/RedirectController.scala 84:26 89:29 80:35]
  wire  _GEN_6 = io_robRedirect_valid ? io_robRedirect_robIdx_flag : robInfoRobIdx_flag; // @[src/main/scala/backend/RedirectController.scala 84:26 89:29 80:35]
  wire [1:0] _GEN_7 = io_bruRedirect_valid ? 2'h1 : 2'h0; // @[src/main/scala/backend/RedirectController.scala 101:40 102:15 104:15]
  wire [1:0] _GEN_9 = io_robRollbackDone ? 2'h0 : state; // @[src/main/scala/backend/RedirectController.scala 108:32 109:15 74:22]
  wire  isRollingBack = state == 2'h2; // @[src/main/scala/backend/RedirectController.scala 118:31]
  wire  rollbackDone = isRollingBack & io_robRollbackDone; // @[src/main/scala/backend/RedirectController.scala 119:38]
  wire  isNormalExcp = robInfoIsException & ~robInfoExcpVec_excpVec[16]; // @[src/main/scala/backend/RedirectController.scala 136:41]
  wire  isErtnExcp = robInfoIsException & robInfoExcpVec_excpVec[16]; // @[src/main/scala/backend/RedirectController.scala 137:39]
  wire [31:0] _robTarget_T_1 = robInfoPc + 32'h4; // @[src/main/scala/backend/RedirectController.scala 146:15]
  wire [31:0] _robTarget_T_2 = isErtnExcp ? io_redirectAddrFromCsr_era : _robTarget_T_1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] robTarget = isNormalExcp ? io_redirectAddrFromCsr_eentry : _robTarget_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  bruRedirecting = state == 2'h1; // @[src/main/scala/backend/RedirectController.scala 160:31]
  wire  _io_excpEvent_excp_T = io_robRedirect_valid & io_robRedirect_isException; // @[src/main/scala/backend/RedirectController.scala 181:45]
  wire [4:0] _io_excpInfo_vaddrError_T_17 = io_robRedirect_excp_excpVec[16] ? 5'h10 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_18 = io_robRedirect_excp_excpVec[15] ? 5'hf : _io_excpInfo_vaddrError_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_19 = io_robRedirect_excp_excpVec[14] ? 5'he : _io_excpInfo_vaddrError_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_20 = io_robRedirect_excp_excpVec[13] ? 5'hd : _io_excpInfo_vaddrError_T_19; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_21 = io_robRedirect_excp_excpVec[12] ? 5'hc : _io_excpInfo_vaddrError_T_20; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_22 = io_robRedirect_excp_excpVec[11] ? 5'hb : _io_excpInfo_vaddrError_T_21; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_23 = io_robRedirect_excp_excpVec[10] ? 5'ha : _io_excpInfo_vaddrError_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_24 = io_robRedirect_excp_excpVec[9] ? 5'h9 : _io_excpInfo_vaddrError_T_23; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_25 = io_robRedirect_excp_excpVec[8] ? 5'h8 : _io_excpInfo_vaddrError_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_26 = io_robRedirect_excp_excpVec[7] ? 5'h7 : _io_excpInfo_vaddrError_T_25; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_27 = io_robRedirect_excp_excpVec[6] ? 5'h6 : _io_excpInfo_vaddrError_T_26; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_28 = io_robRedirect_excp_excpVec[5] ? 5'h5 : _io_excpInfo_vaddrError_T_27; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_29 = io_robRedirect_excp_excpVec[4] ? 5'h4 : _io_excpInfo_vaddrError_T_28; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_30 = io_robRedirect_excp_excpVec[3] ? 5'h3 : _io_excpInfo_vaddrError_T_29; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_31 = io_robRedirect_excp_excpVec[2] ? 5'h2 : _io_excpInfo_vaddrError_T_30; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_32 = io_robRedirect_excp_excpVec[1] ? 5'h1 : _io_excpInfo_vaddrError_T_31; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_excpInfo_vaddrError_T_33 = io_robRedirect_excp_excpVec[0] ? 5'h0 : _io_excpInfo_vaddrError_T_32; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_excpInfo_vaddrError_T_70 = _io_excpInfo_vaddrError_T_33 == 5'h1 | _io_excpInfo_vaddrError_T_33 == 5'h9; // @[src/main/scala/config/ExceptionDef.scala 139:66]
  wire [5:0] _io_excpInfo_ecode_T_3 = 5'h1 == _io_excpInfo_vaddrError_T_33 ? 6'h8 : 6'h0; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_5 = 5'h2 == _io_excpInfo_vaddrError_T_33 ? 6'h3f : _io_excpInfo_ecode_T_3; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_7 = 5'h3 == _io_excpInfo_vaddrError_T_33 ? 6'h3 : _io_excpInfo_ecode_T_5; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_9 = 5'h4 == _io_excpInfo_vaddrError_T_33 ? 6'h7 : _io_excpInfo_ecode_T_7; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_11 = 5'h5 == _io_excpInfo_vaddrError_T_33 ? 6'hb : _io_excpInfo_ecode_T_9; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_13 = 5'h6 == _io_excpInfo_vaddrError_T_33 ? 6'hc : _io_excpInfo_ecode_T_11; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_15 = 5'h7 == _io_excpInfo_vaddrError_T_33 ? 6'hd : _io_excpInfo_ecode_T_13; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_17 = 5'h8 == _io_excpInfo_vaddrError_T_33 ? 6'he : _io_excpInfo_ecode_T_15; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_19 = 5'h9 == _io_excpInfo_vaddrError_T_33 ? 6'h9 : _io_excpInfo_ecode_T_17; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_21 = 5'ha == _io_excpInfo_vaddrError_T_33 ? 6'h0 : _io_excpInfo_ecode_T_19; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_23 = 5'hb == _io_excpInfo_vaddrError_T_33 ? 6'h3f : _io_excpInfo_ecode_T_21; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_25 = 5'hc == _io_excpInfo_vaddrError_T_33 ? 6'h4 : _io_excpInfo_ecode_T_23; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_27 = 5'hd == _io_excpInfo_vaddrError_T_33 ? 6'h7 : _io_excpInfo_ecode_T_25; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_29 = 5'he == _io_excpInfo_vaddrError_T_33 ? 6'h2 : _io_excpInfo_ecode_T_27; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  wire [5:0] _io_excpInfo_ecode_T_31 = 5'hf == _io_excpInfo_vaddrError_T_33 ? 6'h1 : _io_excpInfo_ecode_T_29; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  assign io_redirectInfo_valid = bruRedirecting | rollbackDone; // @[src/main/scala/backend/RedirectController.scala 163:57]
  assign io_redirectInfo_bits_doRedirect = bruRedirecting ? bruReg_bits_doRedirect : rollbackDone; // @[src/main/scala/backend/RedirectController.scala 164:45]
  assign io_redirectInfo_bits_flushSelf = bruRedirecting ? 1'h0 : robInfoIsException; // @[src/main/scala/backend/RedirectController.scala 165:45]
  assign io_redirectInfo_bits_fromBru = state == 2'h1; // @[src/main/scala/backend/RedirectController.scala 160:31]
  assign io_redirectInfo_bits_snptId = bruReg_bits_snptId; // @[src/main/scala/backend/RedirectController.scala 167:39]
  assign io_redirectInfo_bits_robIdx_value = bruRedirecting ? bruReg_bits_robIdx_value : robInfoRobIdx_value; // @[src/main/scala/backend/RedirectController.scala 168:45]
  assign io_redirectInfo_bits_robIdx_flag = bruRedirecting ? bruReg_bits_robIdx_flag : robInfoRobIdx_flag; // @[src/main/scala/backend/RedirectController.scala 168:45]
  assign io_redirectInfo_bits_fromRob = isRollingBack & io_robRollbackDone; // @[src/main/scala/backend/RedirectController.scala 119:38]
  assign io_redirectInfo_bits_target = bruRedirecting ? bruReg_bits_target : robTarget; // @[src/main/scala/backend/RedirectController.scala 170:45]
  assign io_robRedirectPause = state == 2'h2; // @[src/main/scala/backend/RedirectController.scala 118:31]
  assign io_robNeedRollback = state == 2'h2; // @[src/main/scala/backend/RedirectController.scala 127:34]
  assign io_excpEvent_excp = io_robRedirect_valid & io_robRedirect_isException & ~io_robRedirect_excp_excpVec[16]; // @[src/main/scala/backend/RedirectController.scala 181:75]
  assign io_excpEvent_ertn = _io_excpEvent_excp_T & io_robRedirect_excp_excpVec[16]; // @[src/main/scala/backend/RedirectController.scala 182:75]
  assign io_excpInfo_vaddrError = _io_excpInfo_vaddrError_T_70 & io_robRedirect_valid & io_robRedirect_isException; // @[src/main/scala/backend/RedirectController.scala 189:86]
  assign io_excpInfo_era = io_robRedirect_pc; // @[src/main/scala/backend/RedirectController.scala 190:19]
  assign io_excpInfo_ecode = 5'h10 == _io_excpInfo_vaddrError_T_33 ? 6'h0 : _io_excpInfo_ecode_T_31; // @[src/main/scala/config/ExceptionDef.scala 127:24]
  assign io_excpInfo_badVaddr = _io_excpInfo_vaddrError_T_33 >= 5'h9 ? io_robRedirect_excpVaddr : io_robRedirect_pc; // @[src/main/scala/config/ExceptionDef.scala 148:8]
  always @(posedge clock) begin
    bruReg_bits_doRedirect <= io_bruRedirect_bits_doRedirect; // @[src/main/scala/backend/RedirectController.scala 64:23]
    bruReg_bits_snptId <= io_bruRedirect_bits_snptId; // @[src/main/scala/backend/RedirectController.scala 64:23]
    bruReg_bits_robIdx_value <= io_bruRedirect_bits_robIdx_value; // @[src/main/scala/backend/RedirectController.scala 64:23]
    bruReg_bits_robIdx_flag <= io_bruRedirect_bits_robIdx_flag; // @[src/main/scala/backend/RedirectController.scala 64:23]
    bruReg_bits_target <= io_bruRedirect_bits_target; // @[src/main/scala/backend/RedirectController.scala 64:23]
    if (reset) begin // @[src/main/scala/backend/RedirectController.scala 74:22]
      state <= 2'h0; // @[src/main/scala/backend/RedirectController.scala 74:22]
    end else if (2'h0 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      if (io_robRedirect_valid) begin // @[src/main/scala/backend/RedirectController.scala 84:26]
        state <= 2'h2; // @[src/main/scala/backend/RedirectController.scala 85:29]
      end else if (io_bruRedirect_valid) begin // @[src/main/scala/backend/RedirectController.scala 90:40]
        state <= 2'h1; // @[src/main/scala/backend/RedirectController.scala 91:15]
      end
    end else if (2'h1 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      if (io_robRedirect_valid) begin // @[src/main/scala/backend/RedirectController.scala 95:26]
        state <= 2'h2; // @[src/main/scala/backend/RedirectController.scala 96:29]
      end else begin
        state <= _GEN_7;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      state <= _GEN_9;
    end
    if (reset) begin // @[src/main/scala/backend/RedirectController.scala 77:35]
      robInfoIsException <= 1'h0; // @[src/main/scala/backend/RedirectController.scala 77:35]
    end else if (2'h0 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoIsException <= _GEN_2;
    end else if (2'h1 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoIsException <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/backend/RedirectController.scala 78:35]
      robInfoExcpVec_excpVec <= 17'h0; // @[src/main/scala/backend/RedirectController.scala 78:35]
    end else if (2'h0 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoExcpVec_excpVec <= _GEN_3;
    end else if (2'h1 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoExcpVec_excpVec <= _GEN_3;
    end
    if (reset) begin // @[src/main/scala/backend/RedirectController.scala 79:35]
      robInfoPc <= 32'h0; // @[src/main/scala/backend/RedirectController.scala 79:35]
    end else if (2'h0 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoPc <= _GEN_4;
    end else if (2'h1 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoPc <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/backend/RedirectController.scala 80:35]
      robInfoRobIdx_value <= 6'h0; // @[src/main/scala/backend/RedirectController.scala 80:35]
    end else if (2'h0 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoRobIdx_value <= _GEN_5;
    end else if (2'h1 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoRobIdx_value <= _GEN_5;
    end
    if (reset) begin // @[src/main/scala/backend/RedirectController.scala 80:35]
      robInfoRobIdx_flag <= 1'h0; // @[src/main/scala/backend/RedirectController.scala 80:35]
    end else if (2'h0 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoRobIdx_flag <= _GEN_6;
    end else if (2'h1 == state) begin // @[src/main/scala/backend/RedirectController.scala 82:17]
      robInfoRobIdx_flag <= _GEN_6;
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
  bruReg_bits_doRedirect = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bruReg_bits_snptId = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  bruReg_bits_robIdx_value = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  bruReg_bits_robIdx_flag = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bruReg_bits_target = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  robInfoIsException = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  robInfoExcpVec_excpVec = _RAND_7[16:0];
  _RAND_8 = {1{`RANDOM}};
  robInfoPc = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  robInfoRobIdx_value = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  robInfoRobIdx_flag = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
