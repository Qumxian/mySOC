module Divider(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_pc, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_inst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [3:0]  io_in_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [4:0]  io_in_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [3:0]  io_in_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [3:0]  io_in_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [3:0]  io_in_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [16:0] io_in_bits_uop_excp_excpVec, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_imm, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [13:0] io_in_bits_uop_csrAddress, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_bpuInfo_target, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [1:0]  io_in_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [1:0]  io_in_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [1:0]  io_in_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [4:0]  io_in_bits_uop_ldst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [4:0]  io_in_bits_uop_lrs1, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [4:0]  io_in_bits_uop_lrs2, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [6:0]  io_in_bits_uop_pdst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [6:0]  io_in_bits_uop_prs1, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [6:0]  io_in_bits_uop_prs2, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [6:0]  io_in_bits_uop_oldPdst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_rdValid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_snptId_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_snptId_bits, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [5:0]  io_in_bits_uop_robIdx_value, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_robIdx_flag, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [5:0]  io_in_bits_uop_robIdxFull_value, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [2:0]  io_in_bits_uop_issueQueue, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_in_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_rs1Data, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [31:0] io_in_bits_rs2Data, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_out_ready, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_pc, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_inst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [3:0]  io_out_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [4:0]  io_out_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [3:0]  io_out_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [3:0]  io_out_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [3:0]  io_out_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [16:0] io_out_bits_uop_excp_excpVec, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_imm, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [13:0] io_out_bits_uop_csrAddress, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_bpuInfo_target, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [1:0]  io_out_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [1:0]  io_out_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [1:0]  io_out_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [4:0]  io_out_bits_uop_ldst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [4:0]  io_out_bits_uop_lrs1, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [4:0]  io_out_bits_uop_lrs2, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [6:0]  io_out_bits_uop_pdst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [6:0]  io_out_bits_uop_prs1, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [6:0]  io_out_bits_uop_prs2, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [6:0]  io_out_bits_uop_oldPdst, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_rdValid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_snptId_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_snptId_bits, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [5:0]  io_out_bits_uop_robIdx_value, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_robIdx_flag, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [5:0]  io_out_bits_uop_robIdxFull_value, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [2:0]  io_out_bits_uop_issueQueue, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output        io_out_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  output [31:0] io_out_bits_data, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_redirectInfo_valid, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/execute/Divider.scala 27:14]
  input         io_redirectInfo_bits_robIdx_flag // @[src/main/scala/backend/execute/Divider.scala 27:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
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
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[src/main/scala/backend/execute/Divider.scala 50:22]
  reg [5:0] count; // @[src/main/scala/backend/execute/Divider.scala 55:26]
  reg [32:0] remainder; // @[src/main/scala/backend/execute/Divider.scala 56:26]
  reg [31:0] quotient; // @[src/main/scala/backend/execute/Divider.scala 57:26]
  reg [31:0] absDiv; // @[src/main/scala/backend/execute/Divider.scala 58:26]
  reg [31:0] uop_pc; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [31:0] uop_inst; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [3:0] uop_ctrl_fuType; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [4:0] uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [3:0] uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [3:0] uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_ctrl_divOp; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [3:0] uop_ctrl_immType; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_ctrl_memRead; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_ctrl_isJump; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [16:0] uop_excp_excpVec; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [31:0] uop_imm; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [13:0] uop_csrAddress; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_pdInfo_valid; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [31:0] uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [31:0] uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [31:0] uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [31:0] uop_bpuInfo_target; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [1:0] uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [1:0] uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [1:0] uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [31:0] uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [4:0] uop_ldst; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [4:0] uop_lrs1; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [4:0] uop_lrs2; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [6:0] uop_pdst; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [6:0] uop_prs1; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [6:0] uop_prs2; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [6:0] uop_oldPdst; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_rs1Valid; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_rs2Valid; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_rdValid; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_snptId_valid; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_snptId_bits; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [5:0] uop_robIdx_value; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_robIdx_flag; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [5:0] uop_robIdxFull_value; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg [2:0] uop_issueQueue; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_prs1Busy; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  uop_prs2Busy; // @[src/main/scala/backend/execute/Divider.scala 59:26]
  reg  signA; // @[src/main/scala/backend/execute/Divider.scala 60:26]
  reg  signB; // @[src/main/scala/backend/execute/Divider.scala 61:26]
  reg  isMod; // @[src/main/scala/backend/execute/Divider.scala 62:26]
  reg  isSigned; // @[src/main/scala/backend/execute/Divider.scala 63:26]
  reg  divByZero; // @[src/main/scala/backend/execute/Divider.scala 64:26]
  wire [32:0] absDivExt = {1'h0,absDiv}; // @[src/main/scala/backend/execute/Divider.scala 80:22]
  wire [32:0] shifted = {remainder[31:0],quotient[31]}; // @[src/main/scala/backend/execute/Divider.scala 81:22]
  wire [32:0] sub = shifted - absDivExt; // @[src/main/scala/backend/execute/Divider.scala 82:27]
  wire  doRedirect = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/execute/Divider.scala 88:42]
  wire  _divDoFlush_T_3 = uop_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _divDoFlush_T_4 = uop_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _divDoFlush_T_5 = uop_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _divDoFlush_T_3 : _divDoFlush_T_4; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _divDoFlush_T_7 = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _divDoFlush_T_10 = io_in_bits_uop_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _divDoFlush_T_11 = io_in_bits_uop_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _divDoFlush_T_12 = io_in_bits_uop_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _divDoFlush_T_10 :
    _divDoFlush_T_11; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _divDoFlush_T_13 = _divDoFlush_T_7 & doRedirect & _divDoFlush_T_12; // @[src/main/scala/backend/execute/Divider.scala 95:30]
  wire  divDoFlush = ~io_in_ready & doRedirect & _divDoFlush_T_5 | _divDoFlush_T_13; // @[src/main/scala/backend/execute/Divider.scala 94:92]
  wire  _signed_T_1 = io_in_bits_uop_ctrl_divOp == 3'h2; // @[src/main/scala/backend/execute/Divider.scala 107:50]
  wire  signed_ = io_in_bits_uop_ctrl_divOp == 3'h1 | io_in_bits_uop_ctrl_divOp == 3'h2; // @[src/main/scala/backend/execute/Divider.scala 107:43]
  wire  sA = signed_ & io_in_bits_rs1Data[31]; // @[src/main/scala/backend/execute/Divider.scala 108:27]
  wire  sB = signed_ & io_in_bits_rs2Data[31]; // @[src/main/scala/backend/execute/Divider.scala 109:27]
  wire  divisorZero = io_in_bits_rs2Data == 32'h0; // @[src/main/scala/backend/execute/Divider.scala 110:32]
  wire [1:0] _state_T = divisorZero ? 2'h2 : 2'h1; // @[src/main/scala/backend/execute/Divider.scala 112:27]
  wire [31:0] _quotient_T_1 = 32'h0 - io_in_bits_rs1Data; // @[src/main/scala/backend/execute/Divider.scala 120:33]
  wire [31:0] _quotient_T_2 = sA ? _quotient_T_1 : io_in_bits_rs1Data; // @[src/main/scala/backend/execute/Divider.scala 120:27]
  wire [31:0] _absDiv_T_1 = 32'h0 - io_in_bits_rs2Data; // @[src/main/scala/backend/execute/Divider.scala 121:33]
  wire [31:0] _absDiv_T_2 = sB ? _absDiv_T_1 : io_in_bits_rs2Data; // @[src/main/scala/backend/execute/Divider.scala 121:27]
  wire [31:0] _quotient_T_4 = {quotient[30:0],1'h0}; // @[src/main/scala/backend/execute/Divider.scala 132:29]
  wire [31:0] _quotient_T_6 = {quotient[30:0],1'h1}; // @[src/main/scala/backend/execute/Divider.scala 136:29]
  wire [32:0] _GEN_80 = sub[32] ? shifted : sub; // @[src/main/scala/backend/execute/Divider.scala 129:25 131:23 135:23]
  wire [31:0] _GEN_81 = sub[32] ? _quotient_T_4 : _quotient_T_6; // @[src/main/scala/backend/execute/Divider.scala 129:25 132:23 136:23]
  wire [5:0] _count_T_1 = count + 6'h1; // @[src/main/scala/backend/execute/Divider.scala 138:26]
  wire [32:0] _GEN_82 = count < 6'h20 ? _GEN_80 : remainder; // @[src/main/scala/backend/execute/Divider.scala 128:30 56:26]
  wire [31:0] _GEN_83 = count < 6'h20 ? _GEN_81 : quotient; // @[src/main/scala/backend/execute/Divider.scala 128:30 57:26]
  wire [5:0] _GEN_84 = count < 6'h20 ? _count_T_1 : count; // @[src/main/scala/backend/execute/Divider.scala 128:30 138:17 55:26]
  wire [1:0] _GEN_85 = count < 6'h20 ? state : 2'h2; // @[src/main/scala/backend/execute/Divider.scala 128:30 140:17 50:22]
  wire  _T_6 = io_out_ready & io_out_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [1:0] _GEN_86 = _T_6 ? 2'h0 : state; // @[src/main/scala/backend/execute/Divider.scala 146:27 147:17 50:22]
  wire [1:0] _GEN_87 = 2'h2 == state ? _GEN_86 : state; // @[src/main/scala/backend/execute/Divider.scala 100:19 50:22]
  wire  quotNeg = signA != signB; // @[src/main/scala/backend/execute/Divider.scala 158:23]
  wire [31:0] _finalQ_T_2 = 32'h0 - quotient; // @[src/main/scala/backend/execute/Divider.scala 163:42]
  wire [31:0] finalQ = isSigned & quotNeg ? _finalQ_T_2 : quotient; // @[src/main/scala/backend/execute/Divider.scala 163:19]
  wire [31:0] _finalR_T_3 = 32'h0 - remainder[31:0]; // @[src/main/scala/backend/execute/Divider.scala 164:42]
  wire [31:0] finalR = isSigned & signA ? _finalR_T_3 : remainder[31:0]; // @[src/main/scala/backend/execute/Divider.scala 164:19]
  wire [31:0] origDividend = signA ? _finalQ_T_2 : quotient; // @[src/main/scala/backend/execute/Divider.scala 167:25]
  wire [31:0] resultQ = divByZero ? 32'hffffffff : finalQ; // @[src/main/scala/backend/execute/Divider.scala 168:20]
  wire [31:0] resultR = divByZero ? origDividend : finalR; // @[src/main/scala/backend/execute/Divider.scala 169:20]
  assign io_in_ready = state == 2'h0; // @[src/main/scala/backend/execute/Divider.scala 69:25]
  assign io_out_valid = state == 2'h2 & ~divDoFlush; // @[src/main/scala/backend/execute/Divider.scala 176:51]
  assign io_out_bits_uop_pc = uop_pc; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_inst = uop_inst; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_fuType = uop_ctrl_fuType; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_aluOp = uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_bruOp = uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_lsuOp = uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_csrOp = uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_mulOp = uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_divOp = uop_ctrl_divOp; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_src1Type = uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_src2Type = uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_immType = uop_ctrl_immType; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_rfWen = uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_memRead = uop_ctrl_memRead; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_memWrite = uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_csrWen = uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_isBranch = uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_isJump = uop_ctrl_isJump; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ctrl_isPriv = uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_excp_excpVec = uop_excp_excpVec; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_imm = uop_imm; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_csrAddress = uop_csrAddress; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdInfo_valid = uop_pdInfo_valid; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdInfo_isBr = uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdInfo_isJal = uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdInfo_isJalr = uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdInfo_isCall = uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdInfo_isRet = uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdInfo_jumpTarget = uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_pc = uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_fallThrough = uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_taken = uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_target = uop_bpuInfo_target; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_takenOffset = uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_valid = uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_btbHit = uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsJalr = uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsJal = uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsCall = uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsRet = uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_btbOffset = uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_phtCounter = uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_rasTop = uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_predTaken = uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_bpuInfo_meta_predTarget = uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_ldst = uop_ldst; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_lrs1 = uop_lrs1; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_lrs2 = uop_lrs2; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_pdst = uop_pdst; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_prs1 = uop_prs1; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_prs2 = uop_prs2; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_oldPdst = uop_oldPdst; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_rs1Valid = uop_rs1Valid; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_rs2Valid = uop_rs2Valid; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_rdValid = uop_rdValid; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_snptId_valid = uop_snptId_valid; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_snptId_bits = uop_snptId_bits; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_robIdx_value = uop_robIdx_value; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_robIdx_flag = uop_robIdx_flag; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_robIdxFull_value = uop_robIdxFull_value; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_robIdxFull_flag = uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_issueQueue = uop_issueQueue; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_prs1Busy = uop_prs1Busy; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_uop_prs2Busy = uop_prs2Busy; // @[src/main/scala/backend/execute/Divider.scala 177:29]
  assign io_out_bits_data = isMod ? resultR : resultQ; // @[src/main/scala/backend/execute/Divider.scala 171:19]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 50:22]
      state <= 2'h0; // @[src/main/scala/backend/execute/Divider.scala 50:22]
    end else if (divDoFlush) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      state <= 2'h0; // @[src/main/scala/backend/execute/Divider.scala 98:11]
    end else if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
      if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
        state <= _state_T; // @[src/main/scala/backend/execute/Divider.scala 112:21]
      end
    end else if (2'h1 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
      state <= _GEN_85;
    end else begin
      state <= _GEN_87;
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 55:26]
      count <= 6'h0; // @[src/main/scala/backend/execute/Divider.scala 55:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          count <= 6'h0; // @[src/main/scala/backend/execute/Divider.scala 122:21]
        end
      end else if (2'h1 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        count <= _GEN_84;
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 56:26]
      remainder <= 33'h0; // @[src/main/scala/backend/execute/Divider.scala 56:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          remainder <= 33'h0; // @[src/main/scala/backend/execute/Divider.scala 119:21]
        end
      end else if (2'h1 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        remainder <= _GEN_82;
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 57:26]
      quotient <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 57:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          quotient <= _quotient_T_2; // @[src/main/scala/backend/execute/Divider.scala 120:21]
        end
      end else if (2'h1 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        quotient <= _GEN_83;
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 58:26]
      absDiv <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 58:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          absDiv <= _absDiv_T_2; // @[src/main/scala/backend/execute/Divider.scala 121:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pc <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pc <= io_in_bits_uop_pc; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_inst <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_inst <= io_in_bits_uop_inst; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_fuType <= io_in_bits_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_aluOp <= io_in_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_bruOp <= io_in_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_lsuOp <= io_in_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_csrOp <= io_in_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_mulOp <= io_in_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_divOp <= io_in_bits_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_src1Type <= io_in_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_src2Type <= io_in_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_immType <= 4'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_immType <= io_in_bits_uop_ctrl_immType; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_memRead <= io_in_bits_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_memWrite <= io_in_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_csrWen <= io_in_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_isBranch <= io_in_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_isJump <= io_in_bits_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ctrl_isPriv <= io_in_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_excp_excpVec <= 17'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_excp_excpVec <= io_in_bits_uop_excp_excpVec; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_imm <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_imm <= io_in_bits_uop_imm; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_csrAddress <= 14'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_csrAddress <= io_in_bits_uop_csrAddress; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdInfo_valid <= io_in_bits_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdInfo_isBr <= io_in_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdInfo_isJal <= io_in_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdInfo_isJalr <= io_in_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdInfo_isCall <= io_in_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdInfo_isRet <= io_in_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdInfo_jumpTarget <= io_in_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_pc <= io_in_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_fallThrough <= io_in_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_taken <= io_in_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_target <= io_in_bits_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_takenOffset <= io_in_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_valid <= io_in_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_btbHit <= io_in_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_btbIsJalr <= io_in_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_btbIsJal <= io_in_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_btbIsCall <= io_in_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_btbIsRet <= io_in_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_btbOffset <= io_in_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_phtCounter <= io_in_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_rasTop <= io_in_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_predTaken <= io_in_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_bpuInfo_meta_predTarget <= io_in_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_ldst <= 5'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_ldst <= io_in_bits_uop_ldst; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_lrs1 <= 5'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_lrs1 <= io_in_bits_uop_lrs1; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_lrs2 <= 5'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_lrs2 <= io_in_bits_uop_lrs2; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_pdst <= 7'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_pdst <= io_in_bits_uop_pdst; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_prs1 <= 7'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_prs1 <= io_in_bits_uop_prs1; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_prs2 <= 7'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_prs2 <= io_in_bits_uop_prs2; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_oldPdst <= 7'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_oldPdst <= io_in_bits_uop_oldPdst; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_rs1Valid <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_rs1Valid <= io_in_bits_uop_rs1Valid; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_rs2Valid <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_rs2Valid <= io_in_bits_uop_rs2Valid; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_rdValid <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_rdValid <= io_in_bits_uop_rdValid; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_snptId_valid <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_snptId_valid <= io_in_bits_uop_snptId_valid; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_snptId_bits <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_snptId_bits <= io_in_bits_uop_snptId_bits; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_robIdx_value <= 6'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_robIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_robIdxFull_value <= io_in_bits_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_robIdxFull_flag <= io_in_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_issueQueue <= 3'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_issueQueue <= io_in_bits_uop_issueQueue; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_prs1Busy <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_prs1Busy <= io_in_bits_uop_prs1Busy; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 59:26]
      uop_prs2Busy <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 59:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          uop_prs2Busy <= io_in_bits_uop_prs2Busy; // @[src/main/scala/backend/execute/Divider.scala 113:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 60:26]
      signA <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 60:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          signA <= sA; // @[src/main/scala/backend/execute/Divider.scala 114:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 61:26]
      signB <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 61:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          signB <= sB; // @[src/main/scala/backend/execute/Divider.scala 115:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 62:26]
      isMod <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 62:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          isMod <= _signed_T_1 | io_in_bits_uop_ctrl_divOp == 3'h4; // @[src/main/scala/backend/execute/Divider.scala 117:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 63:26]
      isSigned <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 63:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          isSigned <= signed_; // @[src/main/scala/backend/execute/Divider.scala 116:21]
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Divider.scala 64:26]
      divByZero <= 1'h0; // @[src/main/scala/backend/execute/Divider.scala 64:26]
    end else if (!(divDoFlush)) begin // @[src/main/scala/backend/execute/Divider.scala 97:20]
      if (2'h0 == state) begin // @[src/main/scala/backend/execute/Divider.scala 100:19]
        if (_divDoFlush_T_7) begin // @[src/main/scala/backend/execute/Divider.scala 103:26]
          divByZero <= divisorZero; // @[src/main/scala/backend/execute/Divider.scala 118:21]
        end
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
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  count = _RAND_1[5:0];
  _RAND_2 = {2{`RANDOM}};
  remainder = _RAND_2[32:0];
  _RAND_3 = {1{`RANDOM}};
  quotient = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  absDiv = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  uop_pc = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  uop_inst = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  uop_ctrl_fuType = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  uop_ctrl_aluOp = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  uop_ctrl_bruOp = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  uop_ctrl_lsuOp = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  uop_ctrl_csrOp = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  uop_ctrl_mulOp = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  uop_ctrl_divOp = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  uop_ctrl_src1Type = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  uop_ctrl_src2Type = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  uop_ctrl_immType = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  uop_ctrl_rfWen = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  uop_ctrl_memRead = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  uop_ctrl_memWrite = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  uop_ctrl_csrWen = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uop_ctrl_isBranch = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  uop_ctrl_isJump = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uop_ctrl_isPriv = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  uop_excp_excpVec = _RAND_24[16:0];
  _RAND_25 = {1{`RANDOM}};
  uop_imm = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  uop_csrAddress = _RAND_26[13:0];
  _RAND_27 = {1{`RANDOM}};
  uop_pdInfo_valid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  uop_pdInfo_isBr = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uop_pdInfo_isJal = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  uop_pdInfo_isJalr = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uop_pdInfo_isCall = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  uop_pdInfo_isRet = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  uop_pdInfo_jumpTarget = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  uop_bpuInfo_pc = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  uop_bpuInfo_fallThrough = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  uop_bpuInfo_taken = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  uop_bpuInfo_target = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  uop_bpuInfo_takenOffset = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  uop_bpuInfo_meta_valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  uop_bpuInfo_meta_btbHit = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  uop_bpuInfo_meta_btbIsJalr = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  uop_bpuInfo_meta_btbIsJal = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uop_bpuInfo_meta_btbIsCall = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  uop_bpuInfo_meta_btbIsRet = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  uop_bpuInfo_meta_btbOffset = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  uop_bpuInfo_meta_phtCounter = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  uop_bpuInfo_meta_rasTop = _RAND_47[2:0];
  _RAND_48 = {1{`RANDOM}};
  uop_bpuInfo_meta_predTaken = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  uop_bpuInfo_meta_predTarget = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  uop_ldst = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  uop_lrs1 = _RAND_51[4:0];
  _RAND_52 = {1{`RANDOM}};
  uop_lrs2 = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  uop_pdst = _RAND_53[6:0];
  _RAND_54 = {1{`RANDOM}};
  uop_prs1 = _RAND_54[6:0];
  _RAND_55 = {1{`RANDOM}};
  uop_prs2 = _RAND_55[6:0];
  _RAND_56 = {1{`RANDOM}};
  uop_oldPdst = _RAND_56[6:0];
  _RAND_57 = {1{`RANDOM}};
  uop_rs1Valid = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  uop_rs2Valid = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  uop_rdValid = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  uop_snptId_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  uop_snptId_bits = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  uop_robIdx_value = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  uop_robIdx_flag = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  uop_robIdxFull_value = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  uop_robIdxFull_flag = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uop_issueQueue = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  uop_prs1Busy = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  uop_prs2Busy = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  signA = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  signB = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  isMod = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  isSigned = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  divByZero = _RAND_73[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
