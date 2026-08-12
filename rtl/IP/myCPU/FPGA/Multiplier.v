module Multiplier(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_pc, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_inst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [3:0]  io_in_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [4:0]  io_in_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [3:0]  io_in_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [3:0]  io_in_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [3:0]  io_in_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [16:0] io_in_bits_uop_excp_excpVec, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_imm, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [13:0] io_in_bits_uop_csrAddress, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_bpuInfo_target, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [1:0]  io_in_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [1:0]  io_in_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [1:0]  io_in_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [4:0]  io_in_bits_uop_ldst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [4:0]  io_in_bits_uop_lrs1, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [4:0]  io_in_bits_uop_lrs2, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [6:0]  io_in_bits_uop_pdst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [6:0]  io_in_bits_uop_prs1, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [6:0]  io_in_bits_uop_prs2, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [6:0]  io_in_bits_uop_oldPdst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_rdValid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_snptId_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_snptId_bits, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [5:0]  io_in_bits_uop_robIdx_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_robIdx_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [5:0]  io_in_bits_uop_robIdxFull_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [3:0]  io_in_bits_uop_lqIdx_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_lqIdx_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [3:0]  io_in_bits_uop_sqIdx_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_sqIdx_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [2:0]  io_in_bits_uop_issueQueue, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_isSta, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_in_bits_uop_isStd, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_rs1Data, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [31:0] io_in_bits_rs2Data, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_out_ready, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_pc, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_inst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [3:0]  io_out_bits_uop_ctrl_fuType, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [4:0]  io_out_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [3:0]  io_out_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [3:0]  io_out_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_ctrl_divOp, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [3:0]  io_out_bits_uop_ctrl_immType, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_ctrl_memRead, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_ctrl_isJump, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [16:0] io_out_bits_uop_excp_excpVec, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_imm, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [13:0] io_out_bits_uop_csrAddress, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_pdInfo_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_bpuInfo_target, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [1:0]  io_out_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [1:0]  io_out_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [1:0]  io_out_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [4:0]  io_out_bits_uop_ldst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [4:0]  io_out_bits_uop_lrs1, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [4:0]  io_out_bits_uop_lrs2, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [6:0]  io_out_bits_uop_pdst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [6:0]  io_out_bits_uop_prs1, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [6:0]  io_out_bits_uop_prs2, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [6:0]  io_out_bits_uop_oldPdst, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_rs1Valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_rs2Valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_rdValid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_snptId_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_snptId_bits, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [5:0]  io_out_bits_uop_robIdx_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_robIdx_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [5:0]  io_out_bits_uop_robIdxFull_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [3:0]  io_out_bits_uop_lqIdx_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_lqIdx_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [3:0]  io_out_bits_uop_sqIdx_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_sqIdx_flag, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [2:0]  io_out_bits_uop_issueQueue, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_prs1Busy, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_prs2Busy, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_isSta, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output        io_out_bits_uop_isStd, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  output [31:0] io_out_bits_data, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_redirectInfo_valid, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
  input         io_redirectInfo_bits_robIdx_flag // @[src/main/scala/backend/execute/Multiplier.scala 29:14]
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
  reg [63:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [63:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
`endif // RANDOMIZE_REG_INIT
  reg  s1_valid; // @[src/main/scala/backend/execute/Multiplier.scala 51:27]
  reg [31:0] s1_uop_pc; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [31:0] s1_uop_inst; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [3:0] s1_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [4:0] s1_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [3:0] s1_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [3:0] s1_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [3:0] s1_uop_ctrl_immType; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [16:0] s1_uop_excp_excpVec; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [31:0] s1_uop_imm; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [13:0] s1_uop_csrAddress; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [31:0] s1_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [31:0] s1_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [31:0] s1_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [31:0] s1_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [1:0] s1_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [1:0] s1_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [1:0] s1_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [31:0] s1_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [4:0] s1_uop_ldst; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [4:0] s1_uop_lrs1; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [4:0] s1_uop_lrs2; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [6:0] s1_uop_pdst; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [6:0] s1_uop_prs1; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [6:0] s1_uop_prs2; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [6:0] s1_uop_oldPdst; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_rs1Valid; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_rs2Valid; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_rdValid; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_snptId_valid; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_snptId_bits; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [5:0] s1_uop_robIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_robIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [5:0] s1_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [3:0] s1_uop_lqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_lqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [3:0] s1_uop_sqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_sqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [2:0] s1_uop_issueQueue; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_prs1Busy; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_prs2Busy; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_isSta; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg  s1_uop_isStd; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
  reg [63:0] s1_prod; // @[src/main/scala/backend/execute/Multiplier.scala 53:26]
  reg  s1_isMul; // @[src/main/scala/backend/execute/Multiplier.scala 54:26]
  reg  s2_valid; // @[src/main/scala/backend/execute/Multiplier.scala 60:26]
  reg [31:0] s2_uop_pc; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [31:0] s2_uop_inst; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [3:0] s2_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [4:0] s2_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [3:0] s2_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [3:0] s2_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [3:0] s2_uop_ctrl_immType; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [16:0] s2_uop_excp_excpVec; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [31:0] s2_uop_imm; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [13:0] s2_uop_csrAddress; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [31:0] s2_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [31:0] s2_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [31:0] s2_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [31:0] s2_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [1:0] s2_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [1:0] s2_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [1:0] s2_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [31:0] s2_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [4:0] s2_uop_ldst; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [4:0] s2_uop_lrs1; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [4:0] s2_uop_lrs2; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [6:0] s2_uop_pdst; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [6:0] s2_uop_prs1; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [6:0] s2_uop_prs2; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [6:0] s2_uop_oldPdst; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_rs1Valid; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_rs2Valid; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_rdValid; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_snptId_valid; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_snptId_bits; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [5:0] s2_uop_robIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_robIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [5:0] s2_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [3:0] s2_uop_lqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_lqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [3:0] s2_uop_sqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_sqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [2:0] s2_uop_issueQueue; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_prs1Busy; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_prs2Busy; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_isSta; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg  s2_uop_isStd; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
  reg [63:0] s2_prod; // @[src/main/scala/backend/execute/Multiplier.scala 62:26]
  reg  s2_isMul; // @[src/main/scala/backend/execute/Multiplier.scala 63:26]
  reg  s3_valid; // @[src/main/scala/backend/execute/Multiplier.scala 69:27]
  reg [31:0] s3_uop_pc; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_uop_inst; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [3:0] s3_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [4:0] s3_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [3:0] s3_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [3:0] s3_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [3:0] s3_uop_ctrl_immType; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [16:0] s3_uop_excp_excpVec; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_uop_imm; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [13:0] s3_uop_csrAddress; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [1:0] s3_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [1:0] s3_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [1:0] s3_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [4:0] s3_uop_ldst; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [4:0] s3_uop_lrs1; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [4:0] s3_uop_lrs2; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [6:0] s3_uop_pdst; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [6:0] s3_uop_prs1; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [6:0] s3_uop_prs2; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [6:0] s3_uop_oldPdst; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_rs1Valid; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_rs2Valid; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_rdValid; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_snptId_valid; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_snptId_bits; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [5:0] s3_uop_robIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_robIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [5:0] s3_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [3:0] s3_uop_lqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_lqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [3:0] s3_uop_sqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_sqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [2:0] s3_uop_issueQueue; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_prs1Busy; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_prs2Busy; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_isSta; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg  s3_uop_isStd; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
  reg [31:0] s3_data; // @[src/main/scala/backend/execute/Multiplier.scala 71:24]
  wire  s3_fire = s3_valid & io_out_ready; // @[src/main/scala/backend/execute/Multiplier.scala 77:26]
  wire  s2_fire = s2_valid & (~s3_valid | s3_fire); // @[src/main/scala/backend/execute/Multiplier.scala 78:26]
  wire  s1_fire = s1_valid & (~s2_valid | s2_fire); // @[src/main/scala/backend/execute/Multiplier.scala 79:26]
  wire  _in_fire_T = ~s1_valid; // @[src/main/scala/backend/execute/Multiplier.scala 80:33]
  wire  in_fire = io_in_valid & (~s1_valid | s1_fire); // @[src/main/scala/backend/execute/Multiplier.scala 80:29]
  wire  _isSignedOp_T = io_in_bits_uop_ctrl_mulOp == 3'h1; // @[src/main/scala/backend/execute/Multiplier.scala 98:27]
  wire  isSignedOp = io_in_bits_uop_ctrl_mulOp == 3'h1 | io_in_bits_uop_ctrl_mulOp == 3'h2; // @[src/main/scala/backend/execute/Multiplier.scala 98:42]
  wire [63:0] prodUnsigned = io_in_bits_rs1Data * io_in_bits_rs2Data; // @[src/main/scala/backend/execute/Multiplier.scala 101:24]
  wire [63:0] _signCorrection_T_1 = {io_in_bits_rs2Data,32'h0}; // @[src/main/scala/backend/execute/Multiplier.scala 104:44]
  wire [63:0] _signCorrection_T_2 = io_in_bits_rs1Data[31] ? _signCorrection_T_1 : 64'h0; // @[src/main/scala/backend/execute/Multiplier.scala 104:27]
  wire [63:0] _signCorrection_T_4 = {io_in_bits_rs1Data,32'h0}; // @[src/main/scala/backend/execute/Multiplier.scala 105:44]
  wire [63:0] _signCorrection_T_5 = io_in_bits_rs2Data[31] ? _signCorrection_T_4 : 64'h0; // @[src/main/scala/backend/execute/Multiplier.scala 105:27]
  wire [63:0] signCorrection = _signCorrection_T_2 + _signCorrection_T_5; // @[src/main/scala/backend/execute/Multiplier.scala 104:81]
  wire [63:0] prodSigned = prodUnsigned - signCorrection; // @[src/main/scala/backend/execute/Multiplier.scala 106:33]
  wire  doRedirect = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/execute/Multiplier.scala 114:42]
  wire  _s1DoFlush_T = in_fire & doRedirect; // @[src/main/scala/backend/execute/Multiplier.scala 116:27]
  wire  _s1DoFlush_T_2 = io_in_bits_uop_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _s1DoFlush_T_3 = io_in_bits_uop_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _s1DoFlush_T_4 = io_in_bits_uop_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _s1DoFlush_T_2 :
    _s1DoFlush_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  s1DoFlush = in_fire & doRedirect & _s1DoFlush_T_4; // @[src/main/scala/backend/execute/Multiplier.scala 116:41]
  wire  _GEN_0 = s1_fire ? 1'h0 : s1_valid; // @[src/main/scala/backend/execute/Multiplier.scala 127:23 128:14 51:27]
  wire  _GEN_1 = in_fire | _GEN_0; // @[src/main/scala/backend/execute/Multiplier.scala 121:23 122:15]
  wire  _s2DoFlush_T_2 = s1_uop_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _s2DoFlush_T_3 = s1_uop_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _s2DoFlush_T_4 = s1_uop_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _s2DoFlush_T_2 : _s2DoFlush_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  s2DoFlush = _s1DoFlush_T & _s2DoFlush_T_4; // @[src/main/scala/backend/execute/Multiplier.scala 134:41]
  wire  _GEN_149 = s2_fire ? 1'h0 : s2_valid; // @[src/main/scala/backend/execute/Multiplier.scala 144:23 145:14 60:26]
  wire  _GEN_150 = s1_fire | _GEN_149; // @[src/main/scala/backend/execute/Multiplier.scala 138:23 139:15]
  wire  _s3DoFlush_T_2 = s2_uop_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _s3DoFlush_T_3 = s2_uop_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _s3DoFlush_T_4 = s2_uop_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _s3DoFlush_T_2 : _s3DoFlush_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  s3DoFlush = _s1DoFlush_T & _s3DoFlush_T_4; // @[src/main/scala/backend/execute/Multiplier.scala 159:45]
  wire  _GEN_298 = s3_fire ? 1'h0 : s3_valid; // @[src/main/scala/backend/execute/Multiplier.scala 167:23 168:14 69:27]
  wire  _GEN_299 = s2_fire | _GEN_298; // @[src/main/scala/backend/execute/Multiplier.scala 163:23 164:14]
  assign io_in_ready = _in_fire_T | s1_fire; // @[src/main/scala/backend/execute/Multiplier.scala 82:28]
  assign io_out_valid = s3_valid; // @[src/main/scala/backend/execute/Multiplier.scala 174:29]
  assign io_out_bits_uop_pc = s3_uop_pc; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_inst = s3_uop_inst; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_fuType = s3_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_aluOp = s3_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_bruOp = s3_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_lsuOp = s3_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_csrOp = s3_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_mulOp = s3_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_divOp = s3_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_src1Type = s3_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_src2Type = s3_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_immType = s3_uop_ctrl_immType; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_rfWen = s3_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_memRead = s3_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_memWrite = s3_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_csrWen = s3_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_isBranch = s3_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_isJump = s3_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ctrl_isPriv = s3_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_excp_excpVec = s3_uop_excp_excpVec; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_imm = s3_uop_imm; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_csrAddress = s3_uop_csrAddress; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdInfo_valid = s3_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdInfo_isBr = s3_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdInfo_isJal = s3_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdInfo_isJalr = s3_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdInfo_isCall = s3_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdInfo_isRet = s3_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdInfo_jumpTarget = s3_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_pc = s3_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_fallThrough = s3_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_taken = s3_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_target = s3_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_takenOffset = s3_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_valid = s3_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_btbHit = s3_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsJalr = s3_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsJal = s3_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsCall = s3_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_btbIsRet = s3_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_btbOffset = s3_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_phtCounter = s3_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_rasTop = s3_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_predTaken = s3_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_bpuInfo_meta_predTarget = s3_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_ldst = s3_uop_ldst; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_lrs1 = s3_uop_lrs1; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_lrs2 = s3_uop_lrs2; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_pdst = s3_uop_pdst; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_prs1 = s3_uop_prs1; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_prs2 = s3_uop_prs2; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_oldPdst = s3_uop_oldPdst; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_rs1Valid = s3_uop_rs1Valid; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_rs2Valid = s3_uop_rs2Valid; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_rdValid = s3_uop_rdValid; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_snptId_valid = s3_uop_snptId_valid; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_snptId_bits = s3_uop_snptId_bits; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_robIdx_value = s3_uop_robIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_robIdx_flag = s3_uop_robIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_robIdxFull_value = s3_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_robIdxFull_flag = s3_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_lqIdx_value = s3_uop_lqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_lqIdx_flag = s3_uop_lqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_sqIdx_value = s3_uop_sqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_sqIdx_flag = s3_uop_sqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_issueQueue = s3_uop_issueQueue; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_prs1Busy = s3_uop_prs1Busy; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_prs2Busy = s3_uop_prs2Busy; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_isSta = s3_uop_isSta; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_uop_isStd = s3_uop_isStd; // @[src/main/scala/backend/execute/Multiplier.scala 175:29]
  assign io_out_bits_data = s3_data; // @[src/main/scala/backend/execute/Multiplier.scala 176:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 51:27]
      s1_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 51:27]
    end else if (s1DoFlush) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      s1_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 120:14]
    end else begin
      s1_valid <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pc <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pc <= io_in_bits_uop_pc; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_inst <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_inst <= io_in_bits_uop_inst; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_fuType <= io_in_bits_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_aluOp <= io_in_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_bruOp <= io_in_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_lsuOp <= io_in_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_csrOp <= io_in_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_mulOp <= io_in_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_divOp <= io_in_bits_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_src1Type <= io_in_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_src2Type <= io_in_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_immType <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_immType <= io_in_bits_uop_ctrl_immType; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_rfWen <= io_in_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_memRead <= io_in_bits_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_memWrite <= io_in_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_csrWen <= io_in_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_isBranch <= io_in_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_isJump <= io_in_bits_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ctrl_isPriv <= io_in_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_excp_excpVec <= 17'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_excp_excpVec <= io_in_bits_uop_excp_excpVec; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_imm <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_imm <= io_in_bits_uop_imm; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_csrAddress <= 14'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_csrAddress <= io_in_bits_uop_csrAddress; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdInfo_valid <= io_in_bits_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdInfo_isBr <= io_in_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdInfo_isJal <= io_in_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdInfo_isJalr <= io_in_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdInfo_isCall <= io_in_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdInfo_isRet <= io_in_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdInfo_jumpTarget <= io_in_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_pc <= io_in_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_fallThrough <= io_in_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_taken <= io_in_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_target <= io_in_bits_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_takenOffset <= io_in_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_valid <= io_in_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_btbHit <= io_in_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_btbIsJalr <= io_in_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_btbIsJal <= io_in_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_btbIsCall <= io_in_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_btbIsRet <= io_in_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_btbOffset <= io_in_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_phtCounter <= io_in_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_rasTop <= io_in_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_predTaken <= io_in_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_bpuInfo_meta_predTarget <= io_in_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_ldst <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_ldst <= io_in_bits_uop_ldst; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_lrs1 <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_lrs1 <= io_in_bits_uop_lrs1; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_lrs2 <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_lrs2 <= io_in_bits_uop_lrs2; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_pdst <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_pdst <= io_in_bits_uop_pdst; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_prs1 <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_prs1 <= io_in_bits_uop_prs1; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_prs2 <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_prs2 <= io_in_bits_uop_prs2; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_oldPdst <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_oldPdst <= io_in_bits_uop_oldPdst; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_rs1Valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_rs1Valid <= io_in_bits_uop_rs1Valid; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_rs2Valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_rs2Valid <= io_in_bits_uop_rs2Valid; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_rdValid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_rdValid <= io_in_bits_uop_rdValid; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_snptId_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_snptId_valid <= io_in_bits_uop_snptId_valid; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_snptId_bits <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_snptId_bits <= io_in_bits_uop_snptId_bits; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_robIdx_value <= 6'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_robIdx_value <= io_in_bits_uop_robIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_robIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_robIdxFull_value <= io_in_bits_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_robIdxFull_flag <= io_in_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_lqIdx_value <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_lqIdx_value <= io_in_bits_uop_lqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_lqIdx_flag <= io_in_bits_uop_lqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_sqIdx_value <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_sqIdx_value <= io_in_bits_uop_sqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_sqIdx_flag <= io_in_bits_uop_sqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_issueQueue <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_issueQueue <= io_in_bits_uop_issueQueue; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_prs1Busy <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_prs1Busy <= io_in_bits_uop_prs1Busy; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_prs2Busy <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_prs2Busy <= io_in_bits_uop_prs2Busy; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_isSta <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_isSta <= io_in_bits_uop_isSta; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
      s1_uop_isStd <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 52:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_uop_isStd <= io_in_bits_uop_isStd; // @[src/main/scala/backend/execute/Multiplier.scala 123:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 53:26]
      s1_prod <= 64'h0; // @[src/main/scala/backend/execute/Multiplier.scala 53:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        if (isSignedOp) begin // @[src/main/scala/backend/execute/Multiplier.scala 109:17]
          s1_prod <= prodSigned;
        end else begin
          s1_prod <= prodUnsigned;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 54:26]
      s1_isMul <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 54:26]
    end else if (!(s1DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 119:19]
      if (in_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 121:23]
        s1_isMul <= _isSignedOp_T; // @[src/main/scala/backend/execute/Multiplier.scala 125:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 60:26]
      s2_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 60:26]
    end else if (s2DoFlush) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      s2_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 137:14]
    end else begin
      s2_valid <= _GEN_150;
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pc <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pc <= s1_uop_pc; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_inst <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_inst <= s1_uop_inst; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_fuType <= s1_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_aluOp <= s1_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_bruOp <= s1_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_lsuOp <= s1_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_csrOp <= s1_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_mulOp <= s1_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_divOp <= s1_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_src1Type <= s1_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_src2Type <= s1_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_immType <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_immType <= s1_uop_ctrl_immType; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_rfWen <= s1_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_memRead <= s1_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_memWrite <= s1_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_csrWen <= s1_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_isBranch <= s1_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_isJump <= s1_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ctrl_isPriv <= s1_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_excp_excpVec <= 17'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_excp_excpVec <= s1_uop_excp_excpVec; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_imm <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_imm <= s1_uop_imm; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_csrAddress <= 14'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_csrAddress <= s1_uop_csrAddress; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdInfo_valid <= s1_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdInfo_isBr <= s1_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdInfo_isJal <= s1_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdInfo_isJalr <= s1_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdInfo_isCall <= s1_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdInfo_isRet <= s1_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdInfo_jumpTarget <= s1_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_pc <= s1_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_fallThrough <= s1_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_taken <= s1_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_target <= s1_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_takenOffset <= s1_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_valid <= s1_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_btbHit <= s1_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_btbIsJalr <= s1_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_btbIsJal <= s1_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_btbIsCall <= s1_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_btbIsRet <= s1_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_btbOffset <= s1_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_phtCounter <= s1_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_rasTop <= s1_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_predTaken <= s1_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_bpuInfo_meta_predTarget <= s1_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_ldst <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_ldst <= s1_uop_ldst; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_lrs1 <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_lrs1 <= s1_uop_lrs1; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_lrs2 <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_lrs2 <= s1_uop_lrs2; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_pdst <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_pdst <= s1_uop_pdst; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_prs1 <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_prs1 <= s1_uop_prs1; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_prs2 <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_prs2 <= s1_uop_prs2; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_oldPdst <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_oldPdst <= s1_uop_oldPdst; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_rs1Valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_rs1Valid <= s1_uop_rs1Valid; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_rs2Valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_rs2Valid <= s1_uop_rs2Valid; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_rdValid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_rdValid <= s1_uop_rdValid; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_snptId_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_snptId_valid <= s1_uop_snptId_valid; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_snptId_bits <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_snptId_bits <= s1_uop_snptId_bits; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_robIdx_value <= 6'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_robIdx_value <= s1_uop_robIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_robIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_robIdx_flag <= s1_uop_robIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_robIdxFull_value <= s1_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_robIdxFull_flag <= s1_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_lqIdx_value <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_lqIdx_value <= s1_uop_lqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_lqIdx_flag <= s1_uop_lqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_sqIdx_value <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_sqIdx_value <= s1_uop_sqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_sqIdx_flag <= s1_uop_sqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_issueQueue <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_issueQueue <= s1_uop_issueQueue; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_prs1Busy <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_prs1Busy <= s1_uop_prs1Busy; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_prs2Busy <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_prs2Busy <= s1_uop_prs2Busy; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_isSta <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_isSta <= s1_uop_isSta; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
      s2_uop_isStd <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 61:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_uop_isStd <= s1_uop_isStd; // @[src/main/scala/backend/execute/Multiplier.scala 140:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 62:26]
      s2_prod <= 64'h0; // @[src/main/scala/backend/execute/Multiplier.scala 62:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_prod <= s1_prod; // @[src/main/scala/backend/execute/Multiplier.scala 141:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 63:26]
      s2_isMul <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 63:26]
    end else if (!(s2DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 136:19]
      if (s1_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 138:23]
        s2_isMul <= s1_isMul; // @[src/main/scala/backend/execute/Multiplier.scala 142:15]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 69:27]
      s3_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 69:27]
    end else if (s3DoFlush) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      s3_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 162:14]
    end else begin
      s3_valid <= _GEN_299;
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pc <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pc <= s2_uop_pc; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_inst <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_inst <= s2_uop_inst; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_fuType <= s2_uop_ctrl_fuType; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_aluOp <= s2_uop_ctrl_aluOp; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_bruOp <= s2_uop_ctrl_bruOp; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_lsuOp <= s2_uop_ctrl_lsuOp; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_csrOp <= s2_uop_ctrl_csrOp; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_mulOp <= s2_uop_ctrl_mulOp; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_divOp <= s2_uop_ctrl_divOp; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_src1Type <= s2_uop_ctrl_src1Type; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_src2Type <= s2_uop_ctrl_src2Type; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_immType <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_immType <= s2_uop_ctrl_immType; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_rfWen <= s2_uop_ctrl_rfWen; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_memRead <= s2_uop_ctrl_memRead; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_memWrite <= s2_uop_ctrl_memWrite; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_csrWen <= s2_uop_ctrl_csrWen; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_isBranch <= s2_uop_ctrl_isBranch; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_isJump <= s2_uop_ctrl_isJump; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ctrl_isPriv <= s2_uop_ctrl_isPriv; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_excp_excpVec <= 17'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_excp_excpVec <= s2_uop_excp_excpVec; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_imm <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_imm <= s2_uop_imm; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_csrAddress <= 14'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_csrAddress <= s2_uop_csrAddress; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdInfo_valid <= s2_uop_pdInfo_valid; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdInfo_isBr <= s2_uop_pdInfo_isBr; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdInfo_isJal <= s2_uop_pdInfo_isJal; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdInfo_isJalr <= s2_uop_pdInfo_isJalr; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdInfo_isCall <= s2_uop_pdInfo_isCall; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdInfo_isRet <= s2_uop_pdInfo_isRet; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdInfo_jumpTarget <= s2_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_pc <= s2_uop_bpuInfo_pc; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_fallThrough <= s2_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_taken <= s2_uop_bpuInfo_taken; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_target <= s2_uop_bpuInfo_target; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_takenOffset <= s2_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_valid <= s2_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_btbHit <= s2_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_btbIsJalr <= s2_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_btbIsJal <= s2_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_btbIsCall <= s2_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_btbIsRet <= s2_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_btbOffset <= s2_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_phtCounter <= s2_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_rasTop <= s2_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_predTaken <= s2_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_bpuInfo_meta_predTarget <= s2_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_ldst <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_ldst <= s2_uop_ldst; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_lrs1 <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_lrs1 <= s2_uop_lrs1; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_lrs2 <= 5'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_lrs2 <= s2_uop_lrs2; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_pdst <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_pdst <= s2_uop_pdst; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_prs1 <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_prs1 <= s2_uop_prs1; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_prs2 <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_prs2 <= s2_uop_prs2; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_oldPdst <= 7'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_oldPdst <= s2_uop_oldPdst; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_rs1Valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_rs1Valid <= s2_uop_rs1Valid; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_rs2Valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_rs2Valid <= s2_uop_rs2Valid; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_rdValid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_rdValid <= s2_uop_rdValid; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_snptId_valid <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_snptId_valid <= s2_uop_snptId_valid; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_snptId_bits <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_snptId_bits <= s2_uop_snptId_bits; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_robIdx_value <= 6'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_robIdx_value <= s2_uop_robIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_robIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_robIdx_flag <= s2_uop_robIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_robIdxFull_value <= s2_uop_robIdxFull_value; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_robIdxFull_flag <= s2_uop_robIdxFull_flag; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_lqIdx_value <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_lqIdx_value <= s2_uop_lqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_lqIdx_flag <= s2_uop_lqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_sqIdx_value <= 4'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_sqIdx_value <= s2_uop_sqIdx_value; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_sqIdx_flag <= s2_uop_sqIdx_flag; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_issueQueue <= 3'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_issueQueue <= s2_uop_issueQueue; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_prs1Busy <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_prs1Busy <= s2_uop_prs1Busy; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_prs2Busy <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_prs2Busy <= s2_uop_prs2Busy; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_isSta <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_isSta <= s2_uop_isSta; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
      s3_uop_isStd <= 1'h0; // @[src/main/scala/backend/execute/Multiplier.scala 70:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        s3_uop_isStd <= s2_uop_isStd; // @[src/main/scala/backend/execute/Multiplier.scala 165:14]
      end
    end
    if (reset) begin // @[src/main/scala/backend/execute/Multiplier.scala 71:24]
      s3_data <= 32'h0; // @[src/main/scala/backend/execute/Multiplier.scala 71:24]
    end else if (!(s3DoFlush)) begin // @[src/main/scala/backend/execute/Multiplier.scala 161:19]
      if (s2_fire) begin // @[src/main/scala/backend/execute/Multiplier.scala 163:23]
        if (s2_isMul) begin // @[src/main/scala/backend/execute/Multiplier.scala 154:22]
          s3_data <= s2_prod[31:0];
        end else begin
          s3_data <= s2_prod[63:32];
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_uop_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s1_uop_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s1_uop_ctrl_fuType = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s1_uop_ctrl_aluOp = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  s1_uop_ctrl_bruOp = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  s1_uop_ctrl_lsuOp = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  s1_uop_ctrl_csrOp = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  s1_uop_ctrl_mulOp = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  s1_uop_ctrl_divOp = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  s1_uop_ctrl_src1Type = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  s1_uop_ctrl_src2Type = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  s1_uop_ctrl_immType = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  s1_uop_ctrl_rfWen = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s1_uop_ctrl_memRead = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s1_uop_ctrl_memWrite = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s1_uop_ctrl_csrWen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s1_uop_ctrl_isBranch = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s1_uop_ctrl_isJump = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s1_uop_ctrl_isPriv = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s1_uop_excp_excpVec = _RAND_20[16:0];
  _RAND_21 = {1{`RANDOM}};
  s1_uop_imm = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  s1_uop_csrAddress = _RAND_22[13:0];
  _RAND_23 = {1{`RANDOM}};
  s1_uop_pdInfo_valid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  s1_uop_pdInfo_isBr = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  s1_uop_pdInfo_isJal = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  s1_uop_pdInfo_isJalr = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  s1_uop_pdInfo_isCall = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s1_uop_pdInfo_isRet = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  s1_uop_pdInfo_jumpTarget = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  s1_uop_bpuInfo_pc = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s1_uop_bpuInfo_fallThrough = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s1_uop_bpuInfo_taken = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  s1_uop_bpuInfo_target = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  s1_uop_bpuInfo_takenOffset = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_valid = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_btbHit = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_btbIsJalr = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_btbIsJal = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_btbIsCall = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_btbIsRet = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_btbOffset = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_phtCounter = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_rasTop = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_predTaken = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  s1_uop_bpuInfo_meta_predTarget = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  s1_uop_ldst = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  s1_uop_lrs1 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  s1_uop_lrs2 = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  s1_uop_pdst = _RAND_49[6:0];
  _RAND_50 = {1{`RANDOM}};
  s1_uop_prs1 = _RAND_50[6:0];
  _RAND_51 = {1{`RANDOM}};
  s1_uop_prs2 = _RAND_51[6:0];
  _RAND_52 = {1{`RANDOM}};
  s1_uop_oldPdst = _RAND_52[6:0];
  _RAND_53 = {1{`RANDOM}};
  s1_uop_rs1Valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  s1_uop_rs2Valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  s1_uop_rdValid = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  s1_uop_snptId_valid = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  s1_uop_snptId_bits = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  s1_uop_robIdx_value = _RAND_58[5:0];
  _RAND_59 = {1{`RANDOM}};
  s1_uop_robIdx_flag = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  s1_uop_robIdxFull_value = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  s1_uop_robIdxFull_flag = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  s1_uop_lqIdx_value = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  s1_uop_lqIdx_flag = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  s1_uop_sqIdx_value = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  s1_uop_sqIdx_flag = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  s1_uop_issueQueue = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  s1_uop_prs1Busy = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  s1_uop_prs2Busy = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  s1_uop_isSta = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  s1_uop_isStd = _RAND_70[0:0];
  _RAND_71 = {2{`RANDOM}};
  s1_prod = _RAND_71[63:0];
  _RAND_72 = {1{`RANDOM}};
  s1_isMul = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  s2_valid = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  s2_uop_pc = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  s2_uop_inst = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  s2_uop_ctrl_fuType = _RAND_76[3:0];
  _RAND_77 = {1{`RANDOM}};
  s2_uop_ctrl_aluOp = _RAND_77[4:0];
  _RAND_78 = {1{`RANDOM}};
  s2_uop_ctrl_bruOp = _RAND_78[3:0];
  _RAND_79 = {1{`RANDOM}};
  s2_uop_ctrl_lsuOp = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  s2_uop_ctrl_csrOp = _RAND_80[2:0];
  _RAND_81 = {1{`RANDOM}};
  s2_uop_ctrl_mulOp = _RAND_81[2:0];
  _RAND_82 = {1{`RANDOM}};
  s2_uop_ctrl_divOp = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  s2_uop_ctrl_src1Type = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  s2_uop_ctrl_src2Type = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  s2_uop_ctrl_immType = _RAND_85[3:0];
  _RAND_86 = {1{`RANDOM}};
  s2_uop_ctrl_rfWen = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  s2_uop_ctrl_memRead = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  s2_uop_ctrl_memWrite = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  s2_uop_ctrl_csrWen = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  s2_uop_ctrl_isBranch = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  s2_uop_ctrl_isJump = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  s2_uop_ctrl_isPriv = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  s2_uop_excp_excpVec = _RAND_93[16:0];
  _RAND_94 = {1{`RANDOM}};
  s2_uop_imm = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  s2_uop_csrAddress = _RAND_95[13:0];
  _RAND_96 = {1{`RANDOM}};
  s2_uop_pdInfo_valid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  s2_uop_pdInfo_isBr = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  s2_uop_pdInfo_isJal = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  s2_uop_pdInfo_isJalr = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  s2_uop_pdInfo_isCall = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  s2_uop_pdInfo_isRet = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  s2_uop_pdInfo_jumpTarget = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  s2_uop_bpuInfo_pc = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  s2_uop_bpuInfo_fallThrough = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  s2_uop_bpuInfo_taken = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  s2_uop_bpuInfo_target = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  s2_uop_bpuInfo_takenOffset = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_valid = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_btbHit = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_btbIsJalr = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_btbIsJal = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_btbIsCall = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_btbIsRet = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_btbOffset = _RAND_114[1:0];
  _RAND_115 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_phtCounter = _RAND_115[1:0];
  _RAND_116 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_rasTop = _RAND_116[2:0];
  _RAND_117 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_predTaken = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  s2_uop_bpuInfo_meta_predTarget = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  s2_uop_ldst = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  s2_uop_lrs1 = _RAND_120[4:0];
  _RAND_121 = {1{`RANDOM}};
  s2_uop_lrs2 = _RAND_121[4:0];
  _RAND_122 = {1{`RANDOM}};
  s2_uop_pdst = _RAND_122[6:0];
  _RAND_123 = {1{`RANDOM}};
  s2_uop_prs1 = _RAND_123[6:0];
  _RAND_124 = {1{`RANDOM}};
  s2_uop_prs2 = _RAND_124[6:0];
  _RAND_125 = {1{`RANDOM}};
  s2_uop_oldPdst = _RAND_125[6:0];
  _RAND_126 = {1{`RANDOM}};
  s2_uop_rs1Valid = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  s2_uop_rs2Valid = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  s2_uop_rdValid = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  s2_uop_snptId_valid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  s2_uop_snptId_bits = _RAND_130[2:0];
  _RAND_131 = {1{`RANDOM}};
  s2_uop_robIdx_value = _RAND_131[5:0];
  _RAND_132 = {1{`RANDOM}};
  s2_uop_robIdx_flag = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  s2_uop_robIdxFull_value = _RAND_133[5:0];
  _RAND_134 = {1{`RANDOM}};
  s2_uop_robIdxFull_flag = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  s2_uop_lqIdx_value = _RAND_135[3:0];
  _RAND_136 = {1{`RANDOM}};
  s2_uop_lqIdx_flag = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  s2_uop_sqIdx_value = _RAND_137[3:0];
  _RAND_138 = {1{`RANDOM}};
  s2_uop_sqIdx_flag = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  s2_uop_issueQueue = _RAND_139[2:0];
  _RAND_140 = {1{`RANDOM}};
  s2_uop_prs1Busy = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  s2_uop_prs2Busy = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  s2_uop_isSta = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  s2_uop_isStd = _RAND_143[0:0];
  _RAND_144 = {2{`RANDOM}};
  s2_prod = _RAND_144[63:0];
  _RAND_145 = {1{`RANDOM}};
  s2_isMul = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  s3_valid = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  s3_uop_pc = _RAND_147[31:0];
  _RAND_148 = {1{`RANDOM}};
  s3_uop_inst = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  s3_uop_ctrl_fuType = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  s3_uop_ctrl_aluOp = _RAND_150[4:0];
  _RAND_151 = {1{`RANDOM}};
  s3_uop_ctrl_bruOp = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  s3_uop_ctrl_lsuOp = _RAND_152[3:0];
  _RAND_153 = {1{`RANDOM}};
  s3_uop_ctrl_csrOp = _RAND_153[2:0];
  _RAND_154 = {1{`RANDOM}};
  s3_uop_ctrl_mulOp = _RAND_154[2:0];
  _RAND_155 = {1{`RANDOM}};
  s3_uop_ctrl_divOp = _RAND_155[2:0];
  _RAND_156 = {1{`RANDOM}};
  s3_uop_ctrl_src1Type = _RAND_156[2:0];
  _RAND_157 = {1{`RANDOM}};
  s3_uop_ctrl_src2Type = _RAND_157[2:0];
  _RAND_158 = {1{`RANDOM}};
  s3_uop_ctrl_immType = _RAND_158[3:0];
  _RAND_159 = {1{`RANDOM}};
  s3_uop_ctrl_rfWen = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  s3_uop_ctrl_memRead = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  s3_uop_ctrl_memWrite = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  s3_uop_ctrl_csrWen = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  s3_uop_ctrl_isBranch = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  s3_uop_ctrl_isJump = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  s3_uop_ctrl_isPriv = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  s3_uop_excp_excpVec = _RAND_166[16:0];
  _RAND_167 = {1{`RANDOM}};
  s3_uop_imm = _RAND_167[31:0];
  _RAND_168 = {1{`RANDOM}};
  s3_uop_csrAddress = _RAND_168[13:0];
  _RAND_169 = {1{`RANDOM}};
  s3_uop_pdInfo_valid = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  s3_uop_pdInfo_isBr = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  s3_uop_pdInfo_isJal = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  s3_uop_pdInfo_isJalr = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  s3_uop_pdInfo_isCall = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  s3_uop_pdInfo_isRet = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  s3_uop_pdInfo_jumpTarget = _RAND_175[31:0];
  _RAND_176 = {1{`RANDOM}};
  s3_uop_bpuInfo_pc = _RAND_176[31:0];
  _RAND_177 = {1{`RANDOM}};
  s3_uop_bpuInfo_fallThrough = _RAND_177[31:0];
  _RAND_178 = {1{`RANDOM}};
  s3_uop_bpuInfo_taken = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  s3_uop_bpuInfo_target = _RAND_179[31:0];
  _RAND_180 = {1{`RANDOM}};
  s3_uop_bpuInfo_takenOffset = _RAND_180[1:0];
  _RAND_181 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_valid = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_btbHit = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_btbIsJalr = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_btbIsJal = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_btbIsCall = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_btbIsRet = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_btbOffset = _RAND_187[1:0];
  _RAND_188 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_phtCounter = _RAND_188[1:0];
  _RAND_189 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_rasTop = _RAND_189[2:0];
  _RAND_190 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_predTaken = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  s3_uop_bpuInfo_meta_predTarget = _RAND_191[31:0];
  _RAND_192 = {1{`RANDOM}};
  s3_uop_ldst = _RAND_192[4:0];
  _RAND_193 = {1{`RANDOM}};
  s3_uop_lrs1 = _RAND_193[4:0];
  _RAND_194 = {1{`RANDOM}};
  s3_uop_lrs2 = _RAND_194[4:0];
  _RAND_195 = {1{`RANDOM}};
  s3_uop_pdst = _RAND_195[6:0];
  _RAND_196 = {1{`RANDOM}};
  s3_uop_prs1 = _RAND_196[6:0];
  _RAND_197 = {1{`RANDOM}};
  s3_uop_prs2 = _RAND_197[6:0];
  _RAND_198 = {1{`RANDOM}};
  s3_uop_oldPdst = _RAND_198[6:0];
  _RAND_199 = {1{`RANDOM}};
  s3_uop_rs1Valid = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  s3_uop_rs2Valid = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  s3_uop_rdValid = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  s3_uop_snptId_valid = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  s3_uop_snptId_bits = _RAND_203[2:0];
  _RAND_204 = {1{`RANDOM}};
  s3_uop_robIdx_value = _RAND_204[5:0];
  _RAND_205 = {1{`RANDOM}};
  s3_uop_robIdx_flag = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  s3_uop_robIdxFull_value = _RAND_206[5:0];
  _RAND_207 = {1{`RANDOM}};
  s3_uop_robIdxFull_flag = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  s3_uop_lqIdx_value = _RAND_208[3:0];
  _RAND_209 = {1{`RANDOM}};
  s3_uop_lqIdx_flag = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  s3_uop_sqIdx_value = _RAND_210[3:0];
  _RAND_211 = {1{`RANDOM}};
  s3_uop_sqIdx_flag = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  s3_uop_issueQueue = _RAND_212[2:0];
  _RAND_213 = {1{`RANDOM}};
  s3_uop_prs1Busy = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  s3_uop_prs2Busy = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  s3_uop_isSta = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  s3_uop_isStd = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  s3_data = _RAND_217[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
