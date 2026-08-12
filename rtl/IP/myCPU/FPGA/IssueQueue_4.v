module IssueQueue_4(
  input         clock,
  input         reset,
  input         io_enq_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_pc, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_inst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [3:0]  io_enq_bits_ctrl_fuType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [4:0]  io_enq_bits_ctrl_aluOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [3:0]  io_enq_bits_ctrl_bruOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [3:0]  io_enq_bits_ctrl_lsuOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_ctrl_csrOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_ctrl_mulOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_ctrl_divOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_ctrl_src1Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_ctrl_src2Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [3:0]  io_enq_bits_ctrl_immType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_ctrl_rfWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_ctrl_memRead, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_ctrl_memWrite, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_ctrl_csrWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_ctrl_isBranch, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_ctrl_isJump, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_ctrl_isPriv, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [16:0] io_enq_bits_excp_excpVec, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_imm, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [13:0] io_enq_bits_csrAddress, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_pdInfo_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_pdInfo_isBr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_pdInfo_isJal, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_pdInfo_isJalr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_pdInfo_isCall, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_pdInfo_isRet, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_bpuInfo_pc, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_taken, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_bpuInfo_target, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [1:0]  io_enq_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [1:0]  io_enq_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [1:0]  io_enq_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [31:0] io_enq_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [4:0]  io_enq_bits_ldst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [4:0]  io_enq_bits_lrs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [4:0]  io_enq_bits_lrs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_enq_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_enq_bits_prs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_enq_bits_prs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_enq_bits_oldPdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_rs1Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_rs2Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_rdValid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_snptId_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_snptId_bits, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [5:0]  io_enq_bits_robIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_robIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [5:0]  io_enq_bits_robIdxFull_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_robIdxFull_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [3:0]  io_enq_bits_lqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_lqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [3:0]  io_enq_bits_sqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_sqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [2:0]  io_enq_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_prs1Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_isSta, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_isStd, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_issue_ready, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_pc, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_inst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [3:0]  io_issue_bits_ctrl_fuType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [4:0]  io_issue_bits_ctrl_aluOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [3:0]  io_issue_bits_ctrl_bruOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [3:0]  io_issue_bits_ctrl_lsuOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_ctrl_csrOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_ctrl_mulOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_ctrl_divOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_ctrl_src1Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_ctrl_src2Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [3:0]  io_issue_bits_ctrl_immType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_ctrl_rfWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_ctrl_memRead, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_ctrl_memWrite, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_ctrl_csrWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_ctrl_isBranch, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_ctrl_isJump, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_ctrl_isPriv, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [16:0] io_issue_bits_excp_excpVec, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_imm, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [13:0] io_issue_bits_csrAddress, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_pdInfo_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_pdInfo_isBr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_pdInfo_isJal, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_pdInfo_isJalr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_pdInfo_isCall, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_pdInfo_isRet, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_bpuInfo_pc, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_taken, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_bpuInfo_target, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [1:0]  io_issue_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [1:0]  io_issue_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [1:0]  io_issue_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [31:0] io_issue_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [4:0]  io_issue_bits_ldst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [4:0]  io_issue_bits_lrs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [4:0]  io_issue_bits_lrs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [6:0]  io_issue_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [6:0]  io_issue_bits_prs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [6:0]  io_issue_bits_prs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [6:0]  io_issue_bits_oldPdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_rs1Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_rs2Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_rdValid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_snptId_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_snptId_bits, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [5:0]  io_issue_bits_robIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_robIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [5:0]  io_issue_bits_robIdxFull_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_robIdxFull_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [3:0]  io_issue_bits_lqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_lqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [3:0]  io_issue_bits_sqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_sqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [2:0]  io_issue_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_prs1Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_isSta, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_isStd, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_wakeupPorts_0_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_wakeupPorts_0_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_wakeupPorts_1_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_wakeupPorts_1_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_wakeupPorts_2_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_wakeupPorts_2_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_wakeupPorts_3_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_wakeupPorts_3_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_wakeupPorts_4_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [6:0]  io_wakeupPorts_4_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_redirectInfo_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_redirectInfo_bits_robIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output [3:0]  io_freeEntries // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
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
  reg [31:0] _RAND_71;
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
  reg [31:0] _RAND_144;
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
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [31:0] _RAND_401;
  reg [31:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [31:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [31:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [31:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
  reg [31:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [31:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [31:0] _RAND_466;
  reg [31:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [31:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [31:0] _RAND_480;
  reg [31:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [31:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [31:0] _RAND_494;
  reg [31:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [31:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [31:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [31:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [31:0] _RAND_509;
  reg [31:0] _RAND_510;
  reg [31:0] _RAND_511;
  reg [31:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [31:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [31:0] _RAND_525;
  reg [31:0] _RAND_526;
  reg [31:0] _RAND_527;
  reg [31:0] _RAND_528;
  reg [31:0] _RAND_529;
  reg [31:0] _RAND_530;
  reg [31:0] _RAND_531;
  reg [31:0] _RAND_532;
  reg [31:0] _RAND_533;
  reg [31:0] _RAND_534;
  reg [31:0] _RAND_535;
  reg [31:0] _RAND_536;
  reg [31:0] _RAND_537;
  reg [31:0] _RAND_538;
  reg [31:0] _RAND_539;
  reg [31:0] _RAND_540;
  reg [31:0] _RAND_541;
  reg [31:0] _RAND_542;
  reg [31:0] _RAND_543;
  reg [31:0] _RAND_544;
  reg [31:0] _RAND_545;
  reg [31:0] _RAND_546;
  reg [31:0] _RAND_547;
  reg [31:0] _RAND_548;
  reg [31:0] _RAND_549;
  reg [31:0] _RAND_550;
  reg [31:0] _RAND_551;
  reg [31:0] _RAND_552;
  reg [31:0] _RAND_553;
  reg [31:0] _RAND_554;
  reg [31:0] _RAND_555;
  reg [31:0] _RAND_556;
  reg [31:0] _RAND_557;
  reg [31:0] _RAND_558;
  reg [31:0] _RAND_559;
  reg [31:0] _RAND_560;
  reg [31:0] _RAND_561;
  reg [31:0] _RAND_562;
  reg [31:0] _RAND_563;
  reg [31:0] _RAND_564;
  reg [31:0] _RAND_565;
  reg [31:0] _RAND_566;
  reg [31:0] _RAND_567;
  reg [31:0] _RAND_568;
  reg [31:0] _RAND_569;
  reg [31:0] _RAND_570;
  reg [31:0] _RAND_571;
  reg [31:0] _RAND_572;
  reg [31:0] _RAND_573;
  reg [31:0] _RAND_574;
  reg [31:0] _RAND_575;
  reg [31:0] _RAND_576;
  reg [31:0] _RAND_577;
  reg [31:0] _RAND_578;
  reg [31:0] _RAND_579;
  reg [31:0] _RAND_580;
  reg [31:0] _RAND_581;
  reg [31:0] _RAND_582;
  reg [31:0] _RAND_583;
  reg [31:0] _RAND_584;
  reg [31:0] _RAND_585;
  reg [31:0] _RAND_586;
  reg [31:0] _RAND_587;
  reg [31:0] _RAND_588;
  reg [31:0] _RAND_589;
  reg [31:0] _RAND_590;
  reg [31:0] _RAND_591;
  reg [31:0] _RAND_592;
  reg [31:0] _RAND_593;
  reg [31:0] _RAND_594;
  reg [31:0] _RAND_595;
  reg [31:0] _RAND_596;
  reg [31:0] _RAND_597;
  reg [31:0] _RAND_598;
  reg [31:0] _RAND_599;
  reg [31:0] _RAND_600;
  reg [31:0] _RAND_601;
  reg [31:0] _RAND_602;
  reg [31:0] _RAND_603;
  reg [31:0] _RAND_604;
  reg [31:0] _RAND_605;
  reg [31:0] _RAND_606;
  reg [31:0] _RAND_607;
  reg [31:0] _RAND_608;
  reg [31:0] _RAND_609;
  reg [31:0] _RAND_610;
  reg [31:0] _RAND_611;
  reg [31:0] _RAND_612;
  reg [31:0] _RAND_613;
  reg [31:0] _RAND_614;
  reg [31:0] _RAND_615;
  reg [31:0] _RAND_616;
  reg [31:0] _RAND_617;
  reg [31:0] _RAND_618;
  reg [31:0] _RAND_619;
  reg [31:0] _RAND_620;
  reg [31:0] _RAND_621;
  reg [31:0] _RAND_622;
  reg [31:0] _RAND_623;
  reg [31:0] _RAND_624;
  reg [31:0] _RAND_625;
  reg [31:0] _RAND_626;
  reg [31:0] _RAND_627;
  reg [31:0] _RAND_628;
  reg [31:0] _RAND_629;
  reg [31:0] _RAND_630;
  reg [31:0] _RAND_631;
  reg [31:0] _RAND_632;
  reg [31:0] _RAND_633;
  reg [31:0] _RAND_634;
  reg [31:0] _RAND_635;
  reg [31:0] _RAND_636;
  reg [31:0] _RAND_637;
  reg [31:0] _RAND_638;
  reg [31:0] _RAND_639;
`endif // RANDOMIZE_REG_INIT
  reg  entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg [31:0] entryUops_0_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_0_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_0_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_0_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_0_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_0_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_0_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_0_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_0_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_0_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_0_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_0_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_0_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_0_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_0_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_0_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_0_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_0_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_0_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_0_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_0_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_0_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_0_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_0_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_0_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_0_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_0_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_0_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_0_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_0_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_1_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_1_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_1_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_1_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_1_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_1_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_1_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_1_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_1_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_1_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_1_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_1_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_1_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_1_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_1_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_1_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_1_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_1_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_1_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_1_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_2_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_2_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_2_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_2_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_2_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_2_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_2_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_2_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_2_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_2_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_2_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_2_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_2_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_2_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_2_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_2_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_2_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_2_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_2_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_2_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_3_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_3_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_3_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_3_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_3_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_3_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_3_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_3_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_3_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_3_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_3_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_3_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_3_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_3_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_3_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_3_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_3_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_3_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_3_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_3_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_3_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_3_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_3_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_4_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_4_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_4_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_4_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_4_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_4_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_4_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_4_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_4_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_4_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_4_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_4_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_4_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_4_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_4_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_4_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_4_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_4_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_4_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_4_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_4_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_4_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_4_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_5_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_5_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_5_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_5_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_5_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_5_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_5_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_5_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_5_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_5_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_5_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_5_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_5_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_5_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_5_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_5_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_5_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_5_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_5_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_5_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_5_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_5_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_5_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_6_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_6_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_6_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_6_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_6_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_6_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_6_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_6_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_6_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_6_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_6_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_6_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_6_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_6_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_6_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_6_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_6_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_6_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_6_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_6_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_6_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_6_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_6_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_7_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_7_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_7_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_7_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_7_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_7_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_7_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_7_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_7_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_7_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_7_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_7_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_7_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_7_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_7_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_7_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_7_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_7_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_7_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_7_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_7_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_7_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_7_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryP1Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP2Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  age_0_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  wire  wValid = io_wakeupPorts_0_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_1 = io_wakeupPorts_1_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_2 = io_wakeupPorts_2_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_3 = io_wakeupPorts_3_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_4 = io_wakeupPorts_4_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_0 = wValid & entryUops_0_rs1Valid & entryUops_0_prs1 == io_wakeupPorts_0_bits_pdst | wValid_1 &
    entryUops_0_rs1Valid & entryUops_0_prs1 == io_wakeupPorts_1_bits_pdst | wValid_2 & entryUops_0_rs1Valid &
    entryUops_0_prs1 == io_wakeupPorts_2_bits_pdst | wValid_3 & entryUops_0_rs1Valid & entryUops_0_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_4 & entryUops_0_rs1Valid & entryUops_0_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_0 = wValid & entryUops_0_rs2Valid & entryUops_0_prs2 == io_wakeupPorts_0_bits_pdst | wValid_1 &
    entryUops_0_rs2Valid & entryUops_0_prs2 == io_wakeupPorts_1_bits_pdst | wValid_2 & entryUops_0_rs2Valid &
    entryUops_0_prs2 == io_wakeupPorts_2_bits_pdst | wValid_3 & entryUops_0_rs2Valid & entryUops_0_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_4 & entryUops_0_rs2Valid & entryUops_0_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_5 = io_wakeupPorts_0_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_6 = io_wakeupPorts_1_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_7 = io_wakeupPorts_2_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_8 = io_wakeupPorts_3_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_9 = io_wakeupPorts_4_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_1 = wValid_5 & entryUops_1_rs1Valid & entryUops_1_prs1 == io_wakeupPorts_0_bits_pdst | wValid_6 &
    entryUops_1_rs1Valid & entryUops_1_prs1 == io_wakeupPorts_1_bits_pdst | wValid_7 & entryUops_1_rs1Valid &
    entryUops_1_prs1 == io_wakeupPorts_2_bits_pdst | wValid_8 & entryUops_1_rs1Valid & entryUops_1_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_9 & entryUops_1_rs1Valid & entryUops_1_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_1 = wValid_5 & entryUops_1_rs2Valid & entryUops_1_prs2 == io_wakeupPorts_0_bits_pdst | wValid_6 &
    entryUops_1_rs2Valid & entryUops_1_prs2 == io_wakeupPorts_1_bits_pdst | wValid_7 & entryUops_1_rs2Valid &
    entryUops_1_prs2 == io_wakeupPorts_2_bits_pdst | wValid_8 & entryUops_1_rs2Valid & entryUops_1_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_9 & entryUops_1_rs2Valid & entryUops_1_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_10 = io_wakeupPorts_0_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_11 = io_wakeupPorts_1_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_12 = io_wakeupPorts_2_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_13 = io_wakeupPorts_3_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_14 = io_wakeupPorts_4_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_2 = wValid_10 & entryUops_2_rs1Valid & entryUops_2_prs1 == io_wakeupPorts_0_bits_pdst | wValid_11 &
    entryUops_2_rs1Valid & entryUops_2_prs1 == io_wakeupPorts_1_bits_pdst | wValid_12 & entryUops_2_rs1Valid &
    entryUops_2_prs1 == io_wakeupPorts_2_bits_pdst | wValid_13 & entryUops_2_rs1Valid & entryUops_2_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_14 & entryUops_2_rs1Valid & entryUops_2_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_2 = wValid_10 & entryUops_2_rs2Valid & entryUops_2_prs2 == io_wakeupPorts_0_bits_pdst | wValid_11 &
    entryUops_2_rs2Valid & entryUops_2_prs2 == io_wakeupPorts_1_bits_pdst | wValid_12 & entryUops_2_rs2Valid &
    entryUops_2_prs2 == io_wakeupPorts_2_bits_pdst | wValid_13 & entryUops_2_rs2Valid & entryUops_2_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_14 & entryUops_2_rs2Valid & entryUops_2_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_15 = io_wakeupPorts_0_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_16 = io_wakeupPorts_1_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_17 = io_wakeupPorts_2_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_18 = io_wakeupPorts_3_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_19 = io_wakeupPorts_4_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_3 = wValid_15 & entryUops_3_rs1Valid & entryUops_3_prs1 == io_wakeupPorts_0_bits_pdst | wValid_16 &
    entryUops_3_rs1Valid & entryUops_3_prs1 == io_wakeupPorts_1_bits_pdst | wValid_17 & entryUops_3_rs1Valid &
    entryUops_3_prs1 == io_wakeupPorts_2_bits_pdst | wValid_18 & entryUops_3_rs1Valid & entryUops_3_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_19 & entryUops_3_rs1Valid & entryUops_3_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_3 = wValid_15 & entryUops_3_rs2Valid & entryUops_3_prs2 == io_wakeupPorts_0_bits_pdst | wValid_16 &
    entryUops_3_rs2Valid & entryUops_3_prs2 == io_wakeupPorts_1_bits_pdst | wValid_17 & entryUops_3_rs2Valid &
    entryUops_3_prs2 == io_wakeupPorts_2_bits_pdst | wValid_18 & entryUops_3_rs2Valid & entryUops_3_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_19 & entryUops_3_rs2Valid & entryUops_3_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_20 = io_wakeupPorts_0_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_21 = io_wakeupPorts_1_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_22 = io_wakeupPorts_2_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_23 = io_wakeupPorts_3_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_24 = io_wakeupPorts_4_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_4 = wValid_20 & entryUops_4_rs1Valid & entryUops_4_prs1 == io_wakeupPorts_0_bits_pdst | wValid_21 &
    entryUops_4_rs1Valid & entryUops_4_prs1 == io_wakeupPorts_1_bits_pdst | wValid_22 & entryUops_4_rs1Valid &
    entryUops_4_prs1 == io_wakeupPorts_2_bits_pdst | wValid_23 & entryUops_4_rs1Valid & entryUops_4_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_24 & entryUops_4_rs1Valid & entryUops_4_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_4 = wValid_20 & entryUops_4_rs2Valid & entryUops_4_prs2 == io_wakeupPorts_0_bits_pdst | wValid_21 &
    entryUops_4_rs2Valid & entryUops_4_prs2 == io_wakeupPorts_1_bits_pdst | wValid_22 & entryUops_4_rs2Valid &
    entryUops_4_prs2 == io_wakeupPorts_2_bits_pdst | wValid_23 & entryUops_4_rs2Valid & entryUops_4_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_24 & entryUops_4_rs2Valid & entryUops_4_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_25 = io_wakeupPorts_0_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_26 = io_wakeupPorts_1_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_27 = io_wakeupPorts_2_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_28 = io_wakeupPorts_3_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_29 = io_wakeupPorts_4_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_5 = wValid_25 & entryUops_5_rs1Valid & entryUops_5_prs1 == io_wakeupPorts_0_bits_pdst | wValid_26 &
    entryUops_5_rs1Valid & entryUops_5_prs1 == io_wakeupPorts_1_bits_pdst | wValid_27 & entryUops_5_rs1Valid &
    entryUops_5_prs1 == io_wakeupPorts_2_bits_pdst | wValid_28 & entryUops_5_rs1Valid & entryUops_5_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_29 & entryUops_5_rs1Valid & entryUops_5_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_5 = wValid_25 & entryUops_5_rs2Valid & entryUops_5_prs2 == io_wakeupPorts_0_bits_pdst | wValid_26 &
    entryUops_5_rs2Valid & entryUops_5_prs2 == io_wakeupPorts_1_bits_pdst | wValid_27 & entryUops_5_rs2Valid &
    entryUops_5_prs2 == io_wakeupPorts_2_bits_pdst | wValid_28 & entryUops_5_rs2Valid & entryUops_5_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_29 & entryUops_5_rs2Valid & entryUops_5_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_30 = io_wakeupPorts_0_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_31 = io_wakeupPorts_1_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_32 = io_wakeupPorts_2_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_33 = io_wakeupPorts_3_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_34 = io_wakeupPorts_4_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_6 = wValid_30 & entryUops_6_rs1Valid & entryUops_6_prs1 == io_wakeupPorts_0_bits_pdst | wValid_31 &
    entryUops_6_rs1Valid & entryUops_6_prs1 == io_wakeupPorts_1_bits_pdst | wValid_32 & entryUops_6_rs1Valid &
    entryUops_6_prs1 == io_wakeupPorts_2_bits_pdst | wValid_33 & entryUops_6_rs1Valid & entryUops_6_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_34 & entryUops_6_rs1Valid & entryUops_6_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_6 = wValid_30 & entryUops_6_rs2Valid & entryUops_6_prs2 == io_wakeupPorts_0_bits_pdst | wValid_31 &
    entryUops_6_rs2Valid & entryUops_6_prs2 == io_wakeupPorts_1_bits_pdst | wValid_32 & entryUops_6_rs2Valid &
    entryUops_6_prs2 == io_wakeupPorts_2_bits_pdst | wValid_33 & entryUops_6_rs2Valid & entryUops_6_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_34 & entryUops_6_rs2Valid & entryUops_6_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_35 = io_wakeupPorts_0_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_36 = io_wakeupPorts_1_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_37 = io_wakeupPorts_2_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_38 = io_wakeupPorts_3_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_39 = io_wakeupPorts_4_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_7 = wValid_35 & entryUops_7_rs1Valid & entryUops_7_prs1 == io_wakeupPorts_0_bits_pdst | wValid_36 &
    entryUops_7_rs1Valid & entryUops_7_prs1 == io_wakeupPorts_1_bits_pdst | wValid_37 & entryUops_7_rs1Valid &
    entryUops_7_prs1 == io_wakeupPorts_2_bits_pdst | wValid_38 & entryUops_7_rs1Valid & entryUops_7_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_39 & entryUops_7_rs1Valid & entryUops_7_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_7 = wValid_35 & entryUops_7_rs2Valid & entryUops_7_prs2 == io_wakeupPorts_0_bits_pdst | wValid_36 &
    entryUops_7_rs2Valid & entryUops_7_prs2 == io_wakeupPorts_1_bits_pdst | wValid_37 & entryUops_7_rs2Valid &
    entryUops_7_prs2 == io_wakeupPorts_2_bits_pdst | wValid_38 & entryUops_7_rs2Valid & entryUops_7_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_39 & entryUops_7_rs2Valid & entryUops_7_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  p1Eff_0 = entryP1Ready_0 | p1Wakeup_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_0 = entryP2Ready_0 | p2Wakeup_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_1 = entryP1Ready_1 | p1Wakeup_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_1 = entryP2Ready_1 | p2Wakeup_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_2 = entryP1Ready_2 | p1Wakeup_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_2 = entryP2Ready_2 | p2Wakeup_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_3 = entryP1Ready_3 | p1Wakeup_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_3 = entryP2Ready_3 | p2Wakeup_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_4 = entryP1Ready_4 | p1Wakeup_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_4 = entryP2Ready_4 | p2Wakeup_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_5 = entryP1Ready_5 | p1Wakeup_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_5 = entryP2Ready_5 | p2Wakeup_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_6 = entryP1Ready_6 | p1Wakeup_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_6 = entryP2Ready_6 | p2Wakeup_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_7 = entryP1Ready_7 | p1Wakeup_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_7 = entryP2Ready_7 | p2Wakeup_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  sameFlag = entryUops_0_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_1 = entryUops_0_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_2 = entryUops_0_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer = sameFlag ? _isNewer_T_1 : _isNewer_T_2; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_0 = entryValid_0 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_1 = entryUops_1_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_4 = entryUops_1_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_5 = entryUops_1_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_1 = sameFlag_1 ? _isNewer_T_4 : _isNewer_T_5; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_1 = entryValid_1 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_2 = entryUops_2_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_7 = entryUops_2_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_8 = entryUops_2_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_2 = sameFlag_2 ? _isNewer_T_7 : _isNewer_T_8; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_2 = entryValid_2 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_3 = entryUops_3_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_10 = entryUops_3_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_11 = entryUops_3_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_3 = sameFlag_3 ? _isNewer_T_10 : _isNewer_T_11; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_3 = entryValid_3 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_4 = entryUops_4_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_13 = entryUops_4_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_14 = entryUops_4_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_4 = sameFlag_4 ? _isNewer_T_13 : _isNewer_T_14; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_4 = entryValid_4 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_5 = entryUops_5_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_16 = entryUops_5_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_17 = entryUops_5_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_5 = sameFlag_5 ? _isNewer_T_16 : _isNewer_T_17; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_5 = entryValid_5 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_6 = entryUops_6_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_19 = entryUops_6_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_20 = entryUops_6_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_6 = sameFlag_6 ? _isNewer_T_19 : _isNewer_T_20; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_6 = entryValid_6 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_7 = entryUops_7_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_22 = entryUops_7_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_23 = entryUops_7_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_7 = sameFlag_7 ? _isNewer_T_22 : _isNewer_T_23; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_7 = entryValid_7 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  _request_0_T_2 = ~killed_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_0 = entryValid_0 & p1Eff_0 & p2Eff_0 & ~killed_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_1_T_2 = ~killed_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_1 = entryValid_1 & p1Eff_1 & p2Eff_1 & ~killed_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_2_T_2 = ~killed_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_2 = entryValid_2 & p1Eff_2 & p2Eff_2 & ~killed_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_3_T_2 = ~killed_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_3 = entryValid_3 & p1Eff_3 & p2Eff_3 & ~killed_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_4_T_2 = ~killed_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_4 = entryValid_4 & p1Eff_4 & p2Eff_4 & ~killed_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_5_T_2 = ~killed_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_5 = entryValid_5 & p1Eff_5 & p2Eff_5 & ~killed_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_6_T_2 = ~killed_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_6 = entryValid_6 & p1Eff_6 & p2Eff_6 & ~killed_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_7_T_2 = ~killed_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_7 = entryValid_7 & p1Eff_7 & p2Eff_7 & ~killed_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _T_340 = request_1 & ~age_0_1 | request_2 & ~age_0_2 | request_3 & ~age_0_3 | request_4 & ~age_0_4 | request_5
     & ~age_0_5 | request_6 & ~age_0_6 | request_7 & ~age_0_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_0 = request_0 & ~_T_340; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_361 = request_0 & ~age_1_0 | request_2 & ~age_1_2 | request_3 & ~age_1_3 | request_4 & ~age_1_4 | request_5
     & ~age_1_5 | request_6 & ~age_1_6 | request_7 & ~age_1_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_1 = request_1 & ~_T_361; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_382 = request_0 & ~age_2_0 | request_1 & ~age_2_1 | request_3 & ~age_2_3 | request_4 & ~age_2_4 | request_5
     & ~age_2_5 | request_6 & ~age_2_6 | request_7 & ~age_2_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_2 = request_2 & ~_T_382; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_403 = request_0 & ~age_3_0 | request_1 & ~age_3_1 | request_2 & ~age_3_2 | request_4 & ~age_3_4 | request_5
     & ~age_3_5 | request_6 & ~age_3_6 | request_7 & ~age_3_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_3 = request_3 & ~_T_403; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_424 = request_0 & ~age_4_0 | request_1 & ~age_4_1 | request_2 & ~age_4_2 | request_3 & ~age_4_3 | request_5
     & ~age_4_5 | request_6 & ~age_4_6 | request_7 & ~age_4_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_4 = request_4 & ~_T_424; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_445 = request_0 & ~age_5_0 | request_1 & ~age_5_1 | request_2 & ~age_5_2 | request_3 & ~age_5_3 | request_4
     & ~age_5_4 | request_6 & ~age_5_6 | request_7 & ~age_5_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_5 = request_5 & ~_T_445; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_466 = request_0 & ~age_6_0 | request_1 & ~age_6_1 | request_2 & ~age_6_2 | request_3 & ~age_6_3 | request_4
     & ~age_6_4 | request_5 & ~age_6_5 | request_7 & ~age_6_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_6 = request_6 & ~_T_466; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_487 = request_0 & ~age_7_0 | request_1 & ~age_7_1 | request_2 & ~age_7_2 | request_3 & ~age_7_3 | request_4
     & ~age_7_4 | request_5 & ~age_7_5 | request_6 & ~age_7_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_7 = request_7 & ~_T_487; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire [2:0] _io_issue_bits_T_60 = oldest_0 ? entryUops_0_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_61 = oldest_1 ? entryUops_1_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_62 = oldest_2 ? entryUops_2_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_63 = oldest_3 ? entryUops_3_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_64 = oldest_4 ? entryUops_4_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_65 = oldest_5 ? entryUops_5_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_66 = oldest_6 ? entryUops_6_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_67 = oldest_7 ? entryUops_7_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_68 = _io_issue_bits_T_60 | _io_issue_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_69 = _io_issue_bits_T_68 | _io_issue_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_70 = _io_issue_bits_T_69 | _io_issue_bits_T_63; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_71 = _io_issue_bits_T_70 | _io_issue_bits_T_64; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_72 = _io_issue_bits_T_71 | _io_issue_bits_T_65; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_73 = _io_issue_bits_T_72 | _io_issue_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_90 = oldest_0 ? entryUops_0_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_91 = oldest_1 ? entryUops_1_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_92 = oldest_2 ? entryUops_2_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_93 = oldest_3 ? entryUops_3_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_94 = oldest_4 ? entryUops_4_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_95 = oldest_5 ? entryUops_5_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_96 = oldest_6 ? entryUops_6_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_97 = oldest_7 ? entryUops_7_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_98 = _io_issue_bits_T_90 | _io_issue_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_99 = _io_issue_bits_T_98 | _io_issue_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_100 = _io_issue_bits_T_99 | _io_issue_bits_T_93; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_101 = _io_issue_bits_T_100 | _io_issue_bits_T_94; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_102 = _io_issue_bits_T_101 | _io_issue_bits_T_95; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_103 = _io_issue_bits_T_102 | _io_issue_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_120 = oldest_0 ? entryUops_0_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_121 = oldest_1 ? entryUops_1_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_122 = oldest_2 ? entryUops_2_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_123 = oldest_3 ? entryUops_3_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_124 = oldest_4 ? entryUops_4_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_125 = oldest_5 ? entryUops_5_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_126 = oldest_6 ? entryUops_6_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_127 = oldest_7 ? entryUops_7_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_128 = _io_issue_bits_T_120 | _io_issue_bits_T_121; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_129 = _io_issue_bits_T_128 | _io_issue_bits_T_122; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_130 = _io_issue_bits_T_129 | _io_issue_bits_T_123; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_131 = _io_issue_bits_T_130 | _io_issue_bits_T_124; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_132 = _io_issue_bits_T_131 | _io_issue_bits_T_125; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_133 = _io_issue_bits_T_132 | _io_issue_bits_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_150 = oldest_0 ? entryUops_0_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_151 = oldest_1 ? entryUops_1_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_152 = oldest_2 ? entryUops_2_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_153 = oldest_3 ? entryUops_3_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_154 = oldest_4 ? entryUops_4_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_155 = oldest_5 ? entryUops_5_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_156 = oldest_6 ? entryUops_6_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_157 = oldest_7 ? entryUops_7_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_158 = _io_issue_bits_T_150 | _io_issue_bits_T_151; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_159 = _io_issue_bits_T_158 | _io_issue_bits_T_152; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_160 = _io_issue_bits_T_159 | _io_issue_bits_T_153; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_161 = _io_issue_bits_T_160 | _io_issue_bits_T_154; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_162 = _io_issue_bits_T_161 | _io_issue_bits_T_155; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_163 = _io_issue_bits_T_162 | _io_issue_bits_T_156; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_180 = oldest_0 ? entryUops_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_181 = oldest_1 ? entryUops_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_182 = oldest_2 ? entryUops_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_183 = oldest_3 ? entryUops_3_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_184 = oldest_4 ? entryUops_4_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_185 = oldest_5 ? entryUops_5_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_186 = oldest_6 ? entryUops_6_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_187 = oldest_7 ? entryUops_7_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_188 = _io_issue_bits_T_180 | _io_issue_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_189 = _io_issue_bits_T_188 | _io_issue_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_190 = _io_issue_bits_T_189 | _io_issue_bits_T_183; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_191 = _io_issue_bits_T_190 | _io_issue_bits_T_184; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_192 = _io_issue_bits_T_191 | _io_issue_bits_T_185; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_193 = _io_issue_bits_T_192 | _io_issue_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_195 = oldest_0 ? entryUops_0_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_196 = oldest_1 ? entryUops_1_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_197 = oldest_2 ? entryUops_2_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_198 = oldest_3 ? entryUops_3_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_199 = oldest_4 ? entryUops_4_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_200 = oldest_5 ? entryUops_5_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_201 = oldest_6 ? entryUops_6_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_202 = oldest_7 ? entryUops_7_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_203 = _io_issue_bits_T_195 | _io_issue_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_204 = _io_issue_bits_T_203 | _io_issue_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_205 = _io_issue_bits_T_204 | _io_issue_bits_T_198; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_206 = _io_issue_bits_T_205 | _io_issue_bits_T_199; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_207 = _io_issue_bits_T_206 | _io_issue_bits_T_200; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_208 = _io_issue_bits_T_207 | _io_issue_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_270 = oldest_0 ? entryUops_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_271 = oldest_1 ? entryUops_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_272 = oldest_2 ? entryUops_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_273 = oldest_3 ? entryUops_3_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_274 = oldest_4 ? entryUops_4_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_275 = oldest_5 ? entryUops_5_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_276 = oldest_6 ? entryUops_6_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_277 = oldest_7 ? entryUops_7_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_278 = _io_issue_bits_T_270 | _io_issue_bits_T_271; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_279 = _io_issue_bits_T_278 | _io_issue_bits_T_272; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_280 = _io_issue_bits_T_279 | _io_issue_bits_T_273; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_281 = _io_issue_bits_T_280 | _io_issue_bits_T_274; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_282 = _io_issue_bits_T_281 | _io_issue_bits_T_275; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_283 = _io_issue_bits_T_282 | _io_issue_bits_T_276; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_285 = oldest_0 ? entryUops_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_286 = oldest_1 ? entryUops_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_287 = oldest_2 ? entryUops_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_288 = oldest_3 ? entryUops_3_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_289 = oldest_4 ? entryUops_4_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_290 = oldest_5 ? entryUops_5_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_291 = oldest_6 ? entryUops_6_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_292 = oldest_7 ? entryUops_7_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_293 = _io_issue_bits_T_285 | _io_issue_bits_T_286; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_294 = _io_issue_bits_T_293 | _io_issue_bits_T_287; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_295 = _io_issue_bits_T_294 | _io_issue_bits_T_288; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_296 = _io_issue_bits_T_295 | _io_issue_bits_T_289; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_297 = _io_issue_bits_T_296 | _io_issue_bits_T_290; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_298 = _io_issue_bits_T_297 | _io_issue_bits_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_300 = oldest_0 ? entryUops_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_301 = oldest_1 ? entryUops_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_302 = oldest_2 ? entryUops_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_303 = oldest_3 ? entryUops_3_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_304 = oldest_4 ? entryUops_4_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_305 = oldest_5 ? entryUops_5_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_306 = oldest_6 ? entryUops_6_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_307 = oldest_7 ? entryUops_7_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_308 = _io_issue_bits_T_300 | _io_issue_bits_T_301; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_309 = _io_issue_bits_T_308 | _io_issue_bits_T_302; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_310 = _io_issue_bits_T_309 | _io_issue_bits_T_303; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_311 = _io_issue_bits_T_310 | _io_issue_bits_T_304; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_312 = _io_issue_bits_T_311 | _io_issue_bits_T_305; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_313 = _io_issue_bits_T_312 | _io_issue_bits_T_306; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_315 = oldest_0 ? entryUops_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_316 = oldest_1 ? entryUops_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_317 = oldest_2 ? entryUops_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_318 = oldest_3 ? entryUops_3_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_319 = oldest_4 ? entryUops_4_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_320 = oldest_5 ? entryUops_5_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_321 = oldest_6 ? entryUops_6_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_322 = oldest_7 ? entryUops_7_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_323 = _io_issue_bits_T_315 | _io_issue_bits_T_316; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_324 = _io_issue_bits_T_323 | _io_issue_bits_T_317; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_325 = _io_issue_bits_T_324 | _io_issue_bits_T_318; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_326 = _io_issue_bits_T_325 | _io_issue_bits_T_319; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_327 = _io_issue_bits_T_326 | _io_issue_bits_T_320; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_328 = _io_issue_bits_T_327 | _io_issue_bits_T_321; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_330 = oldest_0 ? entryUops_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_331 = oldest_1 ? entryUops_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_332 = oldest_2 ? entryUops_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_333 = oldest_3 ? entryUops_3_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_334 = oldest_4 ? entryUops_4_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_335 = oldest_5 ? entryUops_5_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_336 = oldest_6 ? entryUops_6_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_337 = oldest_7 ? entryUops_7_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_338 = _io_issue_bits_T_330 | _io_issue_bits_T_331; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_339 = _io_issue_bits_T_338 | _io_issue_bits_T_332; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_340 = _io_issue_bits_T_339 | _io_issue_bits_T_333; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_341 = _io_issue_bits_T_340 | _io_issue_bits_T_334; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_342 = _io_issue_bits_T_341 | _io_issue_bits_T_335; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_343 = _io_issue_bits_T_342 | _io_issue_bits_T_336; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_345 = oldest_0 ? entryUops_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_346 = oldest_1 ? entryUops_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_347 = oldest_2 ? entryUops_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_348 = oldest_3 ? entryUops_3_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_349 = oldest_4 ? entryUops_4_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_350 = oldest_5 ? entryUops_5_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_351 = oldest_6 ? entryUops_6_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_352 = oldest_7 ? entryUops_7_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_353 = _io_issue_bits_T_345 | _io_issue_bits_T_346; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_354 = _io_issue_bits_T_353 | _io_issue_bits_T_347; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_355 = _io_issue_bits_T_354 | _io_issue_bits_T_348; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_356 = _io_issue_bits_T_355 | _io_issue_bits_T_349; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_357 = _io_issue_bits_T_356 | _io_issue_bits_T_350; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_358 = _io_issue_bits_T_357 | _io_issue_bits_T_351; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_360 = oldest_0 ? entryUops_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_361 = oldest_1 ? entryUops_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_362 = oldest_2 ? entryUops_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_363 = oldest_3 ? entryUops_3_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_364 = oldest_4 ? entryUops_4_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_365 = oldest_5 ? entryUops_5_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_366 = oldest_6 ? entryUops_6_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_367 = oldest_7 ? entryUops_7_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_368 = _io_issue_bits_T_360 | _io_issue_bits_T_361; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_369 = _io_issue_bits_T_368 | _io_issue_bits_T_362; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_370 = _io_issue_bits_T_369 | _io_issue_bits_T_363; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_371 = _io_issue_bits_T_370 | _io_issue_bits_T_364; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_372 = _io_issue_bits_T_371 | _io_issue_bits_T_365; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_373 = _io_issue_bits_T_372 | _io_issue_bits_T_366; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_375 = oldest_0 ? entryUops_0_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_376 = oldest_1 ? entryUops_1_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_377 = oldest_2 ? entryUops_2_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_378 = oldest_3 ? entryUops_3_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_379 = oldest_4 ? entryUops_4_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_380 = oldest_5 ? entryUops_5_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_381 = oldest_6 ? entryUops_6_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_382 = oldest_7 ? entryUops_7_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_383 = _io_issue_bits_T_375 | _io_issue_bits_T_376; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_384 = _io_issue_bits_T_383 | _io_issue_bits_T_377; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_385 = _io_issue_bits_T_384 | _io_issue_bits_T_378; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_386 = _io_issue_bits_T_385 | _io_issue_bits_T_379; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_387 = _io_issue_bits_T_386 | _io_issue_bits_T_380; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_388 = _io_issue_bits_T_387 | _io_issue_bits_T_381; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_405 = oldest_0 ? entryUops_0_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_406 = oldest_1 ? entryUops_1_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_407 = oldest_2 ? entryUops_2_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_408 = oldest_3 ? entryUops_3_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_409 = oldest_4 ? entryUops_4_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_410 = oldest_5 ? entryUops_5_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_411 = oldest_6 ? entryUops_6_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_412 = oldest_7 ? entryUops_7_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_413 = _io_issue_bits_T_405 | _io_issue_bits_T_406; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_414 = _io_issue_bits_T_413 | _io_issue_bits_T_407; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_415 = _io_issue_bits_T_414 | _io_issue_bits_T_408; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_416 = _io_issue_bits_T_415 | _io_issue_bits_T_409; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_417 = _io_issue_bits_T_416 | _io_issue_bits_T_410; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_418 = _io_issue_bits_T_417 | _io_issue_bits_T_411; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_420 = oldest_0 ? entryUops_0_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_421 = oldest_1 ? entryUops_1_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_422 = oldest_2 ? entryUops_2_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_423 = oldest_3 ? entryUops_3_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_424 = oldest_4 ? entryUops_4_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_425 = oldest_5 ? entryUops_5_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_426 = oldest_6 ? entryUops_6_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_427 = oldest_7 ? entryUops_7_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_428 = _io_issue_bits_T_420 | _io_issue_bits_T_421; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_429 = _io_issue_bits_T_428 | _io_issue_bits_T_422; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_430 = _io_issue_bits_T_429 | _io_issue_bits_T_423; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_431 = _io_issue_bits_T_430 | _io_issue_bits_T_424; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_432 = _io_issue_bits_T_431 | _io_issue_bits_T_425; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_433 = _io_issue_bits_T_432 | _io_issue_bits_T_426; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_435 = oldest_0 ? entryUops_0_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_436 = oldest_1 ? entryUops_1_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_437 = oldest_2 ? entryUops_2_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_438 = oldest_3 ? entryUops_3_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_439 = oldest_4 ? entryUops_4_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_440 = oldest_5 ? entryUops_5_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_441 = oldest_6 ? entryUops_6_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_442 = oldest_7 ? entryUops_7_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_443 = _io_issue_bits_T_435 | _io_issue_bits_T_436; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_444 = _io_issue_bits_T_443 | _io_issue_bits_T_437; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_445 = _io_issue_bits_T_444 | _io_issue_bits_T_438; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_446 = _io_issue_bits_T_445 | _io_issue_bits_T_439; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_447 = _io_issue_bits_T_446 | _io_issue_bits_T_440; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_448 = _io_issue_bits_T_447 | _io_issue_bits_T_441; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_540 = oldest_0 ? entryUops_0_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_541 = oldest_1 ? entryUops_1_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_542 = oldest_2 ? entryUops_2_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_543 = oldest_3 ? entryUops_3_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_544 = oldest_4 ? entryUops_4_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_545 = oldest_5 ? entryUops_5_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_546 = oldest_6 ? entryUops_6_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_547 = oldest_7 ? entryUops_7_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_548 = _io_issue_bits_T_540 | _io_issue_bits_T_541; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_549 = _io_issue_bits_T_548 | _io_issue_bits_T_542; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_550 = _io_issue_bits_T_549 | _io_issue_bits_T_543; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_551 = _io_issue_bits_T_550 | _io_issue_bits_T_544; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_552 = _io_issue_bits_T_551 | _io_issue_bits_T_545; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_553 = _io_issue_bits_T_552 | _io_issue_bits_T_546; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_555 = oldest_0 ? entryUops_0_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_556 = oldest_1 ? entryUops_1_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_557 = oldest_2 ? entryUops_2_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_558 = oldest_3 ? entryUops_3_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_559 = oldest_4 ? entryUops_4_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_560 = oldest_5 ? entryUops_5_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_561 = oldest_6 ? entryUops_6_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_562 = oldest_7 ? entryUops_7_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_563 = _io_issue_bits_T_555 | _io_issue_bits_T_556; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_564 = _io_issue_bits_T_563 | _io_issue_bits_T_557; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_565 = _io_issue_bits_T_564 | _io_issue_bits_T_558; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_566 = _io_issue_bits_T_565 | _io_issue_bits_T_559; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_567 = _io_issue_bits_T_566 | _io_issue_bits_T_560; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_568 = _io_issue_bits_T_567 | _io_issue_bits_T_561; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_585 = oldest_0 ? entryUops_0_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_586 = oldest_1 ? entryUops_1_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_587 = oldest_2 ? entryUops_2_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_588 = oldest_3 ? entryUops_3_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_589 = oldest_4 ? entryUops_4_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_590 = oldest_5 ? entryUops_5_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_591 = oldest_6 ? entryUops_6_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_592 = oldest_7 ? entryUops_7_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_593 = _io_issue_bits_T_585 | _io_issue_bits_T_586; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_594 = _io_issue_bits_T_593 | _io_issue_bits_T_587; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_595 = _io_issue_bits_T_594 | _io_issue_bits_T_588; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_596 = _io_issue_bits_T_595 | _io_issue_bits_T_589; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_597 = _io_issue_bits_T_596 | _io_issue_bits_T_590; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_598 = _io_issue_bits_T_597 | _io_issue_bits_T_591; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_600 = oldest_0 ? entryUops_0_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_601 = oldest_1 ? entryUops_1_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_602 = oldest_2 ? entryUops_2_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_603 = oldest_3 ? entryUops_3_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_604 = oldest_4 ? entryUops_4_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_605 = oldest_5 ? entryUops_5_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_606 = oldest_6 ? entryUops_6_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_607 = oldest_7 ? entryUops_7_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_608 = _io_issue_bits_T_600 | _io_issue_bits_T_601; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_609 = _io_issue_bits_T_608 | _io_issue_bits_T_602; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_610 = _io_issue_bits_T_609 | _io_issue_bits_T_603; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_611 = _io_issue_bits_T_610 | _io_issue_bits_T_604; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_612 = _io_issue_bits_T_611 | _io_issue_bits_T_605; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_613 = _io_issue_bits_T_612 | _io_issue_bits_T_606; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_615 = oldest_0 ? entryUops_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_616 = oldest_1 ? entryUops_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_617 = oldest_2 ? entryUops_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_618 = oldest_3 ? entryUops_3_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_619 = oldest_4 ? entryUops_4_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_620 = oldest_5 ? entryUops_5_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_621 = oldest_6 ? entryUops_6_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_622 = oldest_7 ? entryUops_7_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_623 = _io_issue_bits_T_615 | _io_issue_bits_T_616; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_624 = _io_issue_bits_T_623 | _io_issue_bits_T_617; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_625 = _io_issue_bits_T_624 | _io_issue_bits_T_618; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_626 = _io_issue_bits_T_625 | _io_issue_bits_T_619; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_627 = _io_issue_bits_T_626 | _io_issue_bits_T_620; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_628 = _io_issue_bits_T_627 | _io_issue_bits_T_621; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_720 = oldest_0 ? entryUops_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_721 = oldest_1 ? entryUops_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_722 = oldest_2 ? entryUops_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_723 = oldest_3 ? entryUops_3_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_724 = oldest_4 ? entryUops_4_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_725 = oldest_5 ? entryUops_5_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_726 = oldest_6 ? entryUops_6_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_727 = oldest_7 ? entryUops_7_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_728 = _io_issue_bits_T_720 | _io_issue_bits_T_721; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_729 = _io_issue_bits_T_728 | _io_issue_bits_T_722; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_730 = _io_issue_bits_T_729 | _io_issue_bits_T_723; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_731 = _io_issue_bits_T_730 | _io_issue_bits_T_724; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_732 = _io_issue_bits_T_731 | _io_issue_bits_T_725; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_733 = _io_issue_bits_T_732 | _io_issue_bits_T_726; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_735 = oldest_0 ? entryUops_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_736 = oldest_1 ? entryUops_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_737 = oldest_2 ? entryUops_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_738 = oldest_3 ? entryUops_3_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_739 = oldest_4 ? entryUops_4_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_740 = oldest_5 ? entryUops_5_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_741 = oldest_6 ? entryUops_6_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_742 = oldest_7 ? entryUops_7_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_743 = _io_issue_bits_T_735 | _io_issue_bits_T_736; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_744 = _io_issue_bits_T_743 | _io_issue_bits_T_737; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_745 = _io_issue_bits_T_744 | _io_issue_bits_T_738; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_746 = _io_issue_bits_T_745 | _io_issue_bits_T_739; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_747 = _io_issue_bits_T_746 | _io_issue_bits_T_740; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_748 = _io_issue_bits_T_747 | _io_issue_bits_T_741; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_750 = oldest_0 ? entryUops_0_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_751 = oldest_1 ? entryUops_1_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_752 = oldest_2 ? entryUops_2_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_753 = oldest_3 ? entryUops_3_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_754 = oldest_4 ? entryUops_4_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_755 = oldest_5 ? entryUops_5_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_756 = oldest_6 ? entryUops_6_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_757 = oldest_7 ? entryUops_7_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_758 = _io_issue_bits_T_750 | _io_issue_bits_T_751; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_759 = _io_issue_bits_T_758 | _io_issue_bits_T_752; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_760 = _io_issue_bits_T_759 | _io_issue_bits_T_753; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_761 = _io_issue_bits_T_760 | _io_issue_bits_T_754; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_762 = _io_issue_bits_T_761 | _io_issue_bits_T_755; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_763 = _io_issue_bits_T_762 | _io_issue_bits_T_756; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_870 = oldest_0 ? entryUops_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_871 = oldest_1 ? entryUops_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_872 = oldest_2 ? entryUops_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_873 = oldest_3 ? entryUops_3_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_874 = oldest_4 ? entryUops_4_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_875 = oldest_5 ? entryUops_5_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_876 = oldest_6 ? entryUops_6_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_877 = oldest_7 ? entryUops_7_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_878 = _io_issue_bits_T_870 | _io_issue_bits_T_871; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_879 = _io_issue_bits_T_878 | _io_issue_bits_T_872; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_880 = _io_issue_bits_T_879 | _io_issue_bits_T_873; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_881 = _io_issue_bits_T_880 | _io_issue_bits_T_874; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_882 = _io_issue_bits_T_881 | _io_issue_bits_T_875; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_883 = _io_issue_bits_T_882 | _io_issue_bits_T_876; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_885 = oldest_0 ? entryUops_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_886 = oldest_1 ? entryUops_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_887 = oldest_2 ? entryUops_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_888 = oldest_3 ? entryUops_3_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_889 = oldest_4 ? entryUops_4_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_890 = oldest_5 ? entryUops_5_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_891 = oldest_6 ? entryUops_6_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_892 = oldest_7 ? entryUops_7_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_893 = _io_issue_bits_T_885 | _io_issue_bits_T_886; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_894 = _io_issue_bits_T_893 | _io_issue_bits_T_887; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_895 = _io_issue_bits_T_894 | _io_issue_bits_T_888; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_896 = _io_issue_bits_T_895 | _io_issue_bits_T_889; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_897 = _io_issue_bits_T_896 | _io_issue_bits_T_890; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_898 = _io_issue_bits_T_897 | _io_issue_bits_T_891; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_900 = oldest_0 ? entryUops_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_901 = oldest_1 ? entryUops_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_902 = oldest_2 ? entryUops_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_903 = oldest_3 ? entryUops_3_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_904 = oldest_4 ? entryUops_4_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_905 = oldest_5 ? entryUops_5_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_906 = oldest_6 ? entryUops_6_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_907 = oldest_7 ? entryUops_7_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_908 = _io_issue_bits_T_900 | _io_issue_bits_T_901; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_909 = _io_issue_bits_T_908 | _io_issue_bits_T_902; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_910 = _io_issue_bits_T_909 | _io_issue_bits_T_903; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_911 = _io_issue_bits_T_910 | _io_issue_bits_T_904; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_912 = _io_issue_bits_T_911 | _io_issue_bits_T_905; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_913 = _io_issue_bits_T_912 | _io_issue_bits_T_906; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_915 = oldest_0 ? entryUops_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_916 = oldest_1 ? entryUops_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_917 = oldest_2 ? entryUops_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_918 = oldest_3 ? entryUops_3_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_919 = oldest_4 ? entryUops_4_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_920 = oldest_5 ? entryUops_5_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_921 = oldest_6 ? entryUops_6_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_922 = oldest_7 ? entryUops_7_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_923 = _io_issue_bits_T_915 | _io_issue_bits_T_916; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_924 = _io_issue_bits_T_923 | _io_issue_bits_T_917; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_925 = _io_issue_bits_T_924 | _io_issue_bits_T_918; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_926 = _io_issue_bits_T_925 | _io_issue_bits_T_919; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_927 = _io_issue_bits_T_926 | _io_issue_bits_T_920; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_928 = _io_issue_bits_T_927 | _io_issue_bits_T_921; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_930 = oldest_0 ? entryUops_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_931 = oldest_1 ? entryUops_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_932 = oldest_2 ? entryUops_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_933 = oldest_3 ? entryUops_3_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_934 = oldest_4 ? entryUops_4_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_935 = oldest_5 ? entryUops_5_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_936 = oldest_6 ? entryUops_6_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_937 = oldest_7 ? entryUops_7_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_938 = _io_issue_bits_T_930 | _io_issue_bits_T_931; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_939 = _io_issue_bits_T_938 | _io_issue_bits_T_932; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_940 = _io_issue_bits_T_939 | _io_issue_bits_T_933; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_941 = _io_issue_bits_T_940 | _io_issue_bits_T_934; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_942 = _io_issue_bits_T_941 | _io_issue_bits_T_935; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_943 = _io_issue_bits_T_942 | _io_issue_bits_T_936; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_945 = oldest_0 ? entryUops_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_946 = oldest_1 ? entryUops_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_947 = oldest_2 ? entryUops_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_948 = oldest_3 ? entryUops_3_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_949 = oldest_4 ? entryUops_4_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_950 = oldest_5 ? entryUops_5_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_951 = oldest_6 ? entryUops_6_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_952 = oldest_7 ? entryUops_7_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_953 = _io_issue_bits_T_945 | _io_issue_bits_T_946; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_954 = _io_issue_bits_T_953 | _io_issue_bits_T_947; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_955 = _io_issue_bits_T_954 | _io_issue_bits_T_948; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_956 = _io_issue_bits_T_955 | _io_issue_bits_T_949; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_957 = _io_issue_bits_T_956 | _io_issue_bits_T_950; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_958 = _io_issue_bits_T_957 | _io_issue_bits_T_951; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_960 = oldest_0 ? entryUops_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_961 = oldest_1 ? entryUops_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_962 = oldest_2 ? entryUops_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_963 = oldest_3 ? entryUops_3_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_964 = oldest_4 ? entryUops_4_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_965 = oldest_5 ? entryUops_5_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_966 = oldest_6 ? entryUops_6_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_967 = oldest_7 ? entryUops_7_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_968 = _io_issue_bits_T_960 | _io_issue_bits_T_961; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_969 = _io_issue_bits_T_968 | _io_issue_bits_T_962; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_970 = _io_issue_bits_T_969 | _io_issue_bits_T_963; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_971 = _io_issue_bits_T_970 | _io_issue_bits_T_964; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_972 = _io_issue_bits_T_971 | _io_issue_bits_T_965; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_973 = _io_issue_bits_T_972 | _io_issue_bits_T_966; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_975 = oldest_0 ? entryUops_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_976 = oldest_1 ? entryUops_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_977 = oldest_2 ? entryUops_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_978 = oldest_3 ? entryUops_3_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_979 = oldest_4 ? entryUops_4_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_980 = oldest_5 ? entryUops_5_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_981 = oldest_6 ? entryUops_6_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_982 = oldest_7 ? entryUops_7_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_983 = _io_issue_bits_T_975 | _io_issue_bits_T_976; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_984 = _io_issue_bits_T_983 | _io_issue_bits_T_977; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_985 = _io_issue_bits_T_984 | _io_issue_bits_T_978; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_986 = _io_issue_bits_T_985 | _io_issue_bits_T_979; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_987 = _io_issue_bits_T_986 | _io_issue_bits_T_980; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_988 = _io_issue_bits_T_987 | _io_issue_bits_T_981; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_990 = oldest_0 ? entryUops_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_991 = oldest_1 ? entryUops_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_992 = oldest_2 ? entryUops_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_993 = oldest_3 ? entryUops_3_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_994 = oldest_4 ? entryUops_4_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_995 = oldest_5 ? entryUops_5_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_996 = oldest_6 ? entryUops_6_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_997 = oldest_7 ? entryUops_7_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_998 = _io_issue_bits_T_990 | _io_issue_bits_T_991; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_999 = _io_issue_bits_T_998 | _io_issue_bits_T_992; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1000 = _io_issue_bits_T_999 | _io_issue_bits_T_993; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1001 = _io_issue_bits_T_1000 | _io_issue_bits_T_994; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1002 = _io_issue_bits_T_1001 | _io_issue_bits_T_995; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1003 = _io_issue_bits_T_1002 | _io_issue_bits_T_996; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1005 = oldest_0 ? entryUops_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1006 = oldest_1 ? entryUops_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1007 = oldest_2 ? entryUops_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1008 = oldest_3 ? entryUops_3_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1009 = oldest_4 ? entryUops_4_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1010 = oldest_5 ? entryUops_5_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1011 = oldest_6 ? entryUops_6_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1012 = oldest_7 ? entryUops_7_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1013 = _io_issue_bits_T_1005 | _io_issue_bits_T_1006; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1014 = _io_issue_bits_T_1013 | _io_issue_bits_T_1007; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1015 = _io_issue_bits_T_1014 | _io_issue_bits_T_1008; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1016 = _io_issue_bits_T_1015 | _io_issue_bits_T_1009; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1017 = _io_issue_bits_T_1016 | _io_issue_bits_T_1010; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1018 = _io_issue_bits_T_1017 | _io_issue_bits_T_1011; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1020 = oldest_0 ? entryUops_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1021 = oldest_1 ? entryUops_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1022 = oldest_2 ? entryUops_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1023 = oldest_3 ? entryUops_3_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1024 = oldest_4 ? entryUops_4_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1025 = oldest_5 ? entryUops_5_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1026 = oldest_6 ? entryUops_6_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1027 = oldest_7 ? entryUops_7_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1028 = _io_issue_bits_T_1020 | _io_issue_bits_T_1021; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1029 = _io_issue_bits_T_1028 | _io_issue_bits_T_1022; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1030 = _io_issue_bits_T_1029 | _io_issue_bits_T_1023; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1031 = _io_issue_bits_T_1030 | _io_issue_bits_T_1024; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1032 = _io_issue_bits_T_1031 | _io_issue_bits_T_1025; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1033 = _io_issue_bits_T_1032 | _io_issue_bits_T_1026; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1035 = oldest_0 ? entryUops_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1036 = oldest_1 ? entryUops_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1037 = oldest_2 ? entryUops_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1038 = oldest_3 ? entryUops_3_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1039 = oldest_4 ? entryUops_4_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1040 = oldest_5 ? entryUops_5_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1041 = oldest_6 ? entryUops_6_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1042 = oldest_7 ? entryUops_7_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1043 = _io_issue_bits_T_1035 | _io_issue_bits_T_1036; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1044 = _io_issue_bits_T_1043 | _io_issue_bits_T_1037; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1045 = _io_issue_bits_T_1044 | _io_issue_bits_T_1038; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1046 = _io_issue_bits_T_1045 | _io_issue_bits_T_1039; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1047 = _io_issue_bits_T_1046 | _io_issue_bits_T_1040; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1048 = _io_issue_bits_T_1047 | _io_issue_bits_T_1041; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  issueFire = io_issue_valid & io_issue_ready; // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:34]
  wire  freeMask_0 = ~entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_1 = ~entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_2 = ~entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_3 = ~entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_4 = ~entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_5 = ~entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_6 = ~entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_7 = ~entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire [2:0] _enqIdx_T = freeMask_6 ? 3'h6 : 3'h7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_1 = freeMask_5 ? 3'h5 : _enqIdx_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_2 = freeMask_4 ? 3'h4 : _enqIdx_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_3 = freeMask_3 ? 3'h3 : _enqIdx_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_4 = freeMask_2 ? 3'h2 : _enqIdx_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_5 = freeMask_1 ? 3'h1 : _enqIdx_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] enqIdx = freeMask_0 ? 3'h0 : _enqIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [7:0] _hasFree_T = {freeMask_7,freeMask_6,freeMask_5,freeMask_4,freeMask_3,freeMask_2,freeMask_1,freeMask_0}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:27]
  wire  hasFree = |_hasFree_T; // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:34]
  wire  enqFire = io_enq_valid & hasFree; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:31]
  wire  _validAfterKillGrant_0_T_2 = oldest_0 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_0 = entryValid_0 & _request_0_T_2 & ~(oldest_0 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_1_T_2 = oldest_1 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_1 = entryValid_1 & _request_1_T_2 & ~(oldest_1 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_2_T_2 = oldest_2 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_2 = entryValid_2 & _request_2_T_2 & ~(oldest_2 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_3_T_2 = oldest_3 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_3 = entryValid_3 & _request_3_T_2 & ~(oldest_3 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_4_T_2 = oldest_4 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_4 = entryValid_4 & _request_4_T_2 & ~(oldest_4 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_5_T_2 = oldest_5 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_5 = entryValid_5 & _request_5_T_2 & ~(oldest_5 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_6_T_2 = oldest_6 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_6 = entryValid_6 & _request_6_T_2 & ~(oldest_6 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_7_T_2 = oldest_7 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_7 = entryValid_7 & _request_7_T_2 & ~(oldest_7 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _T_490 = enqFire & enqIdx == 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:24]
  wire  _GEN_0 = enqFire & enqIdx == 3'h0 | entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _T_504 = enqFire & enqIdx == 3'h1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_513 = enqFire & enqIdx == 3'h2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_522 = enqFire & enqIdx == 3'h3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_531 = enqFire & enqIdx == 3'h4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_540 = enqFire & enqIdx == 3'h5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_549 = enqFire & enqIdx == 3'h6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_558 = enqFire & enqIdx == 3'h7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _GEN_106 = _T_504 | entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_212 = _T_513 | entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_318 = _T_522 | entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_424 = _T_531 | entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_530 = _T_540 | entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_636 = _T_549 | entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_742 = _T_558 | entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire [1:0] _io_freeEntries_T = freeMask_0 + freeMask_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _io_freeEntries_T_2 = freeMask_2 + freeMask_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_4 = _io_freeEntries_T + _io_freeEntries_T_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _io_freeEntries_T_6 = freeMask_4 + freeMask_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _io_freeEntries_T_8 = freeMask_6 + freeMask_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_10 = _io_freeEntries_T_6 + _io_freeEntries_T_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  assign io_issue_valid = oldest_0 | oldest_1 | oldest_2 | oldest_3 | oldest_4 | oldest_5 | oldest_6 | oldest_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 158:36]
  assign io_issue_bits_pc = _io_issue_bits_T_1048 | _io_issue_bits_T_1042; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_inst = _io_issue_bits_T_1033 | _io_issue_bits_T_1027; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_fuType = _io_issue_bits_T_1018 | _io_issue_bits_T_1012; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_aluOp = _io_issue_bits_T_1003 | _io_issue_bits_T_997; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_bruOp = _io_issue_bits_T_988 | _io_issue_bits_T_982; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_lsuOp = _io_issue_bits_T_973 | _io_issue_bits_T_967; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrOp = _io_issue_bits_T_958 | _io_issue_bits_T_952; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_mulOp = _io_issue_bits_T_943 | _io_issue_bits_T_937; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_divOp = _io_issue_bits_T_928 | _io_issue_bits_T_922; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src1Type = _io_issue_bits_T_913 | _io_issue_bits_T_907; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src2Type = _io_issue_bits_T_898 | _io_issue_bits_T_892; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_immType = _io_issue_bits_T_883 | _io_issue_bits_T_877; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_rfWen = oldest_0 & entryUops_0_ctrl_rfWen | oldest_1 & entryUops_1_ctrl_rfWen | oldest_2 &
    entryUops_2_ctrl_rfWen | oldest_3 & entryUops_3_ctrl_rfWen | oldest_4 & entryUops_4_ctrl_rfWen | oldest_5 &
    entryUops_5_ctrl_rfWen | oldest_6 & entryUops_6_ctrl_rfWen | oldest_7 & entryUops_7_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memRead = oldest_0 & entryUops_0_ctrl_memRead | oldest_1 & entryUops_1_ctrl_memRead |
    oldest_2 & entryUops_2_ctrl_memRead | oldest_3 & entryUops_3_ctrl_memRead | oldest_4 & entryUops_4_ctrl_memRead |
    oldest_5 & entryUops_5_ctrl_memRead | oldest_6 & entryUops_6_ctrl_memRead | oldest_7 & entryUops_7_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memWrite = oldest_0 & entryUops_0_ctrl_memWrite | oldest_1 & entryUops_1_ctrl_memWrite |
    oldest_2 & entryUops_2_ctrl_memWrite | oldest_3 & entryUops_3_ctrl_memWrite | oldest_4 & entryUops_4_ctrl_memWrite
     | oldest_5 & entryUops_5_ctrl_memWrite | oldest_6 & entryUops_6_ctrl_memWrite | oldest_7 &
    entryUops_7_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrWen = oldest_0 & entryUops_0_ctrl_csrWen | oldest_1 & entryUops_1_ctrl_csrWen | oldest_2
     & entryUops_2_ctrl_csrWen | oldest_3 & entryUops_3_ctrl_csrWen | oldest_4 & entryUops_4_ctrl_csrWen | oldest_5 &
    entryUops_5_ctrl_csrWen | oldest_6 & entryUops_6_ctrl_csrWen | oldest_7 & entryUops_7_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isBranch = oldest_0 & entryUops_0_ctrl_isBranch | oldest_1 & entryUops_1_ctrl_isBranch |
    oldest_2 & entryUops_2_ctrl_isBranch | oldest_3 & entryUops_3_ctrl_isBranch | oldest_4 & entryUops_4_ctrl_isBranch
     | oldest_5 & entryUops_5_ctrl_isBranch | oldest_6 & entryUops_6_ctrl_isBranch | oldest_7 &
    entryUops_7_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isJump = oldest_0 & entryUops_0_ctrl_isJump | oldest_1 & entryUops_1_ctrl_isJump | oldest_2
     & entryUops_2_ctrl_isJump | oldest_3 & entryUops_3_ctrl_isJump | oldest_4 & entryUops_4_ctrl_isJump | oldest_5 &
    entryUops_5_ctrl_isJump | oldest_6 & entryUops_6_ctrl_isJump | oldest_7 & entryUops_7_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isPriv = oldest_0 & entryUops_0_ctrl_isPriv | oldest_1 & entryUops_1_ctrl_isPriv | oldest_2
     & entryUops_2_ctrl_isPriv | oldest_3 & entryUops_3_ctrl_isPriv | oldest_4 & entryUops_4_ctrl_isPriv | oldest_5 &
    entryUops_5_ctrl_isPriv | oldest_6 & entryUops_6_ctrl_isPriv | oldest_7 & entryUops_7_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_excp_excpVec = _io_issue_bits_T_763 | _io_issue_bits_T_757; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_imm = _io_issue_bits_T_748 | _io_issue_bits_T_742; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_csrAddress = _io_issue_bits_T_733 | _io_issue_bits_T_727; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_valid = oldest_0 & entryUops_0_pdInfo_valid | oldest_1 & entryUops_1_pdInfo_valid |
    oldest_2 & entryUops_2_pdInfo_valid | oldest_3 & entryUops_3_pdInfo_valid | oldest_4 & entryUops_4_pdInfo_valid |
    oldest_5 & entryUops_5_pdInfo_valid | oldest_6 & entryUops_6_pdInfo_valid | oldest_7 & entryUops_7_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isBr = oldest_0 & entryUops_0_pdInfo_isBr | oldest_1 & entryUops_1_pdInfo_isBr | oldest_2
     & entryUops_2_pdInfo_isBr | oldest_3 & entryUops_3_pdInfo_isBr | oldest_4 & entryUops_4_pdInfo_isBr | oldest_5 &
    entryUops_5_pdInfo_isBr | oldest_6 & entryUops_6_pdInfo_isBr | oldest_7 & entryUops_7_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJal = oldest_0 & entryUops_0_pdInfo_isJal | oldest_1 & entryUops_1_pdInfo_isJal |
    oldest_2 & entryUops_2_pdInfo_isJal | oldest_3 & entryUops_3_pdInfo_isJal | oldest_4 & entryUops_4_pdInfo_isJal |
    oldest_5 & entryUops_5_pdInfo_isJal | oldest_6 & entryUops_6_pdInfo_isJal | oldest_7 & entryUops_7_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJalr = oldest_0 & entryUops_0_pdInfo_isJalr | oldest_1 & entryUops_1_pdInfo_isJalr |
    oldest_2 & entryUops_2_pdInfo_isJalr | oldest_3 & entryUops_3_pdInfo_isJalr | oldest_4 & entryUops_4_pdInfo_isJalr
     | oldest_5 & entryUops_5_pdInfo_isJalr | oldest_6 & entryUops_6_pdInfo_isJalr | oldest_7 &
    entryUops_7_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isCall = oldest_0 & entryUops_0_pdInfo_isCall | oldest_1 & entryUops_1_pdInfo_isCall |
    oldest_2 & entryUops_2_pdInfo_isCall | oldest_3 & entryUops_3_pdInfo_isCall | oldest_4 & entryUops_4_pdInfo_isCall
     | oldest_5 & entryUops_5_pdInfo_isCall | oldest_6 & entryUops_6_pdInfo_isCall | oldest_7 &
    entryUops_7_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isRet = oldest_0 & entryUops_0_pdInfo_isRet | oldest_1 & entryUops_1_pdInfo_isRet |
    oldest_2 & entryUops_2_pdInfo_isRet | oldest_3 & entryUops_3_pdInfo_isRet | oldest_4 & entryUops_4_pdInfo_isRet |
    oldest_5 & entryUops_5_pdInfo_isRet | oldest_6 & entryUops_6_pdInfo_isRet | oldest_7 & entryUops_7_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_jumpTarget = _io_issue_bits_T_628 | _io_issue_bits_T_622; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_pc = _io_issue_bits_T_613 | _io_issue_bits_T_607; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_fallThrough = _io_issue_bits_T_598 | _io_issue_bits_T_592; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_taken = oldest_0 & entryUops_0_bpuInfo_taken | oldest_1 & entryUops_1_bpuInfo_taken |
    oldest_2 & entryUops_2_bpuInfo_taken | oldest_3 & entryUops_3_bpuInfo_taken | oldest_4 & entryUops_4_bpuInfo_taken
     | oldest_5 & entryUops_5_bpuInfo_taken | oldest_6 & entryUops_6_bpuInfo_taken | oldest_7 &
    entryUops_7_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_target = _io_issue_bits_T_568 | _io_issue_bits_T_562; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_takenOffset = _io_issue_bits_T_553 | _io_issue_bits_T_547; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_valid = oldest_0 & entryUops_0_bpuInfo_meta_valid | oldest_1 &
    entryUops_1_bpuInfo_meta_valid | oldest_2 & entryUops_2_bpuInfo_meta_valid | oldest_3 &
    entryUops_3_bpuInfo_meta_valid | oldest_4 & entryUops_4_bpuInfo_meta_valid | oldest_5 &
    entryUops_5_bpuInfo_meta_valid | oldest_6 & entryUops_6_bpuInfo_meta_valid | oldest_7 &
    entryUops_7_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbHit = oldest_0 & entryUops_0_bpuInfo_meta_btbHit | oldest_1 &
    entryUops_1_bpuInfo_meta_btbHit | oldest_2 & entryUops_2_bpuInfo_meta_btbHit | oldest_3 &
    entryUops_3_bpuInfo_meta_btbHit | oldest_4 & entryUops_4_bpuInfo_meta_btbHit | oldest_5 &
    entryUops_5_bpuInfo_meta_btbHit | oldest_6 & entryUops_6_bpuInfo_meta_btbHit | oldest_7 &
    entryUops_7_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsJalr = oldest_0 & entryUops_0_bpuInfo_meta_btbIsJalr | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsJalr | oldest_2 & entryUops_2_bpuInfo_meta_btbIsJalr | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsJalr | oldest_4 & entryUops_4_bpuInfo_meta_btbIsJalr | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsJalr | oldest_6 & entryUops_6_bpuInfo_meta_btbIsJalr | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsJal = oldest_0 & entryUops_0_bpuInfo_meta_btbIsJal | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsJal | oldest_2 & entryUops_2_bpuInfo_meta_btbIsJal | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsJal | oldest_4 & entryUops_4_bpuInfo_meta_btbIsJal | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsJal | oldest_6 & entryUops_6_bpuInfo_meta_btbIsJal | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsCall = oldest_0 & entryUops_0_bpuInfo_meta_btbIsCall | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsCall | oldest_2 & entryUops_2_bpuInfo_meta_btbIsCall | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsCall | oldest_4 & entryUops_4_bpuInfo_meta_btbIsCall | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsCall | oldest_6 & entryUops_6_bpuInfo_meta_btbIsCall | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsRet = oldest_0 & entryUops_0_bpuInfo_meta_btbIsRet | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsRet | oldest_2 & entryUops_2_bpuInfo_meta_btbIsRet | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsRet | oldest_4 & entryUops_4_bpuInfo_meta_btbIsRet | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsRet | oldest_6 & entryUops_6_bpuInfo_meta_btbIsRet | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbOffset = _io_issue_bits_T_448 | _io_issue_bits_T_442; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_phtCounter = _io_issue_bits_T_433 | _io_issue_bits_T_427; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_rasTop = _io_issue_bits_T_418 | _io_issue_bits_T_412; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_predTaken = oldest_0 & entryUops_0_bpuInfo_meta_predTaken | oldest_1 &
    entryUops_1_bpuInfo_meta_predTaken | oldest_2 & entryUops_2_bpuInfo_meta_predTaken | oldest_3 &
    entryUops_3_bpuInfo_meta_predTaken | oldest_4 & entryUops_4_bpuInfo_meta_predTaken | oldest_5 &
    entryUops_5_bpuInfo_meta_predTaken | oldest_6 & entryUops_6_bpuInfo_meta_predTaken | oldest_7 &
    entryUops_7_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_predTarget = _io_issue_bits_T_388 | _io_issue_bits_T_382; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ldst = _io_issue_bits_T_373 | _io_issue_bits_T_367; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs1 = _io_issue_bits_T_358 | _io_issue_bits_T_352; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs2 = _io_issue_bits_T_343 | _io_issue_bits_T_337; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdst = _io_issue_bits_T_328 | _io_issue_bits_T_322; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs1 = _io_issue_bits_T_313 | _io_issue_bits_T_307; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2 = _io_issue_bits_T_298 | _io_issue_bits_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_oldPdst = _io_issue_bits_T_283 | _io_issue_bits_T_277; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rs1Valid = oldest_0 & entryUops_0_rs1Valid | oldest_1 & entryUops_1_rs1Valid | oldest_2 &
    entryUops_2_rs1Valid | oldest_3 & entryUops_3_rs1Valid | oldest_4 & entryUops_4_rs1Valid | oldest_5 &
    entryUops_5_rs1Valid | oldest_6 & entryUops_6_rs1Valid | oldest_7 & entryUops_7_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rs2Valid = oldest_0 & entryUops_0_rs2Valid | oldest_1 & entryUops_1_rs2Valid | oldest_2 &
    entryUops_2_rs2Valid | oldest_3 & entryUops_3_rs2Valid | oldest_4 & entryUops_4_rs2Valid | oldest_5 &
    entryUops_5_rs2Valid | oldest_6 & entryUops_6_rs2Valid | oldest_7 & entryUops_7_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rdValid = oldest_0 & entryUops_0_rdValid | oldest_1 & entryUops_1_rdValid | oldest_2 &
    entryUops_2_rdValid | oldest_3 & entryUops_3_rdValid | oldest_4 & entryUops_4_rdValid | oldest_5 &
    entryUops_5_rdValid | oldest_6 & entryUops_6_rdValid | oldest_7 & entryUops_7_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_snptId_valid = oldest_0 & entryUops_0_snptId_valid | oldest_1 & entryUops_1_snptId_valid |
    oldest_2 & entryUops_2_snptId_valid | oldest_3 & entryUops_3_snptId_valid | oldest_4 & entryUops_4_snptId_valid |
    oldest_5 & entryUops_5_snptId_valid | oldest_6 & entryUops_6_snptId_valid | oldest_7 & entryUops_7_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_snptId_bits = _io_issue_bits_T_208 | _io_issue_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdx_value = _io_issue_bits_T_193 | _io_issue_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdx_flag = oldest_0 & entryUops_0_robIdx_flag | oldest_1 & entryUops_1_robIdx_flag | oldest_2
     & entryUops_2_robIdx_flag | oldest_3 & entryUops_3_robIdx_flag | oldest_4 & entryUops_4_robIdx_flag | oldest_5 &
    entryUops_5_robIdx_flag | oldest_6 & entryUops_6_robIdx_flag | oldest_7 & entryUops_7_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdxFull_value = _io_issue_bits_T_163 | _io_issue_bits_T_157; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdxFull_flag = oldest_0 & entryUops_0_robIdxFull_flag | oldest_1 & entryUops_1_robIdxFull_flag
     | oldest_2 & entryUops_2_robIdxFull_flag | oldest_3 & entryUops_3_robIdxFull_flag | oldest_4 &
    entryUops_4_robIdxFull_flag | oldest_5 & entryUops_5_robIdxFull_flag | oldest_6 & entryUops_6_robIdxFull_flag |
    oldest_7 & entryUops_7_robIdxFull_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lqIdx_value = _io_issue_bits_T_133 | _io_issue_bits_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lqIdx_flag = oldest_0 & entryUops_0_lqIdx_flag | oldest_1 & entryUops_1_lqIdx_flag | oldest_2 &
    entryUops_2_lqIdx_flag | oldest_3 & entryUops_3_lqIdx_flag | oldest_4 & entryUops_4_lqIdx_flag | oldest_5 &
    entryUops_5_lqIdx_flag | oldest_6 & entryUops_6_lqIdx_flag | oldest_7 & entryUops_7_lqIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_sqIdx_value = _io_issue_bits_T_103 | _io_issue_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_sqIdx_flag = oldest_0 & entryUops_0_sqIdx_flag | oldest_1 & entryUops_1_sqIdx_flag | oldest_2 &
    entryUops_2_sqIdx_flag | oldest_3 & entryUops_3_sqIdx_flag | oldest_4 & entryUops_4_sqIdx_flag | oldest_5 &
    entryUops_5_sqIdx_flag | oldest_6 & entryUops_6_sqIdx_flag | oldest_7 & entryUops_7_sqIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_issueQueue = _io_issue_bits_T_73 | _io_issue_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs1Busy = oldest_0 & entryUops_0_prs1Busy | oldest_1 & entryUops_1_prs1Busy | oldest_2 &
    entryUops_2_prs1Busy | oldest_3 & entryUops_3_prs1Busy | oldest_4 & entryUops_4_prs1Busy | oldest_5 &
    entryUops_5_prs1Busy | oldest_6 & entryUops_6_prs1Busy | oldest_7 & entryUops_7_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2Busy = oldest_0 & entryUops_0_prs2Busy | oldest_1 & entryUops_1_prs2Busy | oldest_2 &
    entryUops_2_prs2Busy | oldest_3 & entryUops_3_prs2Busy | oldest_4 & entryUops_4_prs2Busy | oldest_5 &
    entryUops_5_prs2Busy | oldest_6 & entryUops_6_prs2Busy | oldest_7 & entryUops_7_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_isSta = oldest_0 & entryUops_0_isSta | oldest_1 & entryUops_1_isSta | oldest_2 &
    entryUops_2_isSta | oldest_3 & entryUops_3_isSta | oldest_4 & entryUops_4_isSta | oldest_5 & entryUops_5_isSta |
    oldest_6 & entryUops_6_isSta | oldest_7 & entryUops_7_isSta; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_isStd = oldest_0 & entryUops_0_isStd | oldest_1 & entryUops_1_isStd | oldest_2 &
    entryUops_2_isStd | oldest_3 & entryUops_3_isStd | oldest_4 & entryUops_4_isStd | oldest_5 & entryUops_5_isStd |
    oldest_6 & entryUops_6_isStd | oldest_7 & entryUops_7_isStd; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_freeEntries = _io_freeEntries_T_4 + _io_freeEntries_T_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_0) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_0 <= _GEN_0;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_1 <= _GEN_106;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_2 <= _GEN_212;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_3 <= _GEN_318;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_4 <= _GEN_424;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_5 <= _GEN_530;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_6 <= _GEN_636;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_7 <= _GEN_742;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_lqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_sqIdx_value <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_isSta <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_isStd <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_0 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_0 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_0 <= p1Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_1 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_1 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_1 <= p1Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_2 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_2 <= p1Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_3 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_3 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_3 <= p1Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_4 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_4 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_4 <= p1Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_5 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_5 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_5 <= p1Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_6 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_6 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_6 <= p1Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_7 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_7 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_7 <= p1Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_0 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_0 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_0 <= p2Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_1 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_1 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_1 <= p2Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_2 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_2 <= p2Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_3 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_3 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_3 <= p2Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_4 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_4 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_4 <= p2Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_5 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_5 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_5 <= p2Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_6 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_6 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_6 <= p2Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_7 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_7 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_7 <= p2Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_1 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_1 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_2 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_2 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_3 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_3 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_4 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_4 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_5 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_5 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_6 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_6 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_7 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_7 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_0 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_0 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_2 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_2 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_3 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_3 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_4 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_4 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_5 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_5 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_6 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_6 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_7 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_7 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_0 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_0 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_1 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_1 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_3 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_3 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_4 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_4 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_5 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_5 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_6 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_6 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_7 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_7 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_0 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_0 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_1 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_1 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_2 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_2 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_4 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_4 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_5 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_5 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_6 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_6 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_7 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_7 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_0 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_0 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_1 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_1 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_2 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_2 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_3 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_3 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_5 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_5 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_6 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_6 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_7 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_7 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_0 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_0 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_1 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_1 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_2 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_2 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_3 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_3 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_4 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_4 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_6 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_6 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_7 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_7 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_0 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_0 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_1 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_1 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_2 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_2 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_3 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_3 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_4 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_4 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_5 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_5 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_7 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_7 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_0 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_0 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_1 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_1 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_2 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_2 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_3 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_3 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_4 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_4 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_5 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_5 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_6 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_6 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
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
  entryValid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  entryValid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  entryValid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  entryValid_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entryValid_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entryValid_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entryValid_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entryValid_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  entryUops_0_pc = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  entryUops_0_inst = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  entryUops_0_ctrl_fuType = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  entryUops_0_ctrl_aluOp = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  entryUops_0_ctrl_bruOp = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  entryUops_0_ctrl_lsuOp = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  entryUops_0_ctrl_csrOp = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  entryUops_0_ctrl_mulOp = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  entryUops_0_ctrl_divOp = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  entryUops_0_ctrl_src1Type = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  entryUops_0_ctrl_src2Type = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  entryUops_0_ctrl_immType = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  entryUops_0_ctrl_rfWen = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  entryUops_0_ctrl_memRead = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  entryUops_0_ctrl_memWrite = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entryUops_0_ctrl_csrWen = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  entryUops_0_ctrl_isBranch = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entryUops_0_ctrl_isJump = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entryUops_0_ctrl_isPriv = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  entryUops_0_excp_excpVec = _RAND_27[16:0];
  _RAND_28 = {1{`RANDOM}};
  entryUops_0_imm = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  entryUops_0_csrAddress = _RAND_29[13:0];
  _RAND_30 = {1{`RANDOM}};
  entryUops_0_pdInfo_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entryUops_0_pdInfo_isBr = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  entryUops_0_pdInfo_isJal = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  entryUops_0_pdInfo_isJalr = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  entryUops_0_pdInfo_isCall = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  entryUops_0_pdInfo_isRet = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  entryUops_0_pdInfo_jumpTarget = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  entryUops_0_bpuInfo_pc = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  entryUops_0_bpuInfo_fallThrough = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  entryUops_0_bpuInfo_taken = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  entryUops_0_bpuInfo_target = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  entryUops_0_bpuInfo_takenOffset = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbHit = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsJalr = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsJal = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsCall = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsRet = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbOffset = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_phtCounter = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_rasTop = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_predTaken = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_predTarget = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  entryUops_0_ldst = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  entryUops_0_lrs1 = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  entryUops_0_lrs2 = _RAND_55[4:0];
  _RAND_56 = {1{`RANDOM}};
  entryUops_0_pdst = _RAND_56[6:0];
  _RAND_57 = {1{`RANDOM}};
  entryUops_0_prs1 = _RAND_57[6:0];
  _RAND_58 = {1{`RANDOM}};
  entryUops_0_prs2 = _RAND_58[6:0];
  _RAND_59 = {1{`RANDOM}};
  entryUops_0_oldPdst = _RAND_59[6:0];
  _RAND_60 = {1{`RANDOM}};
  entryUops_0_rs1Valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  entryUops_0_rs2Valid = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  entryUops_0_rdValid = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  entryUops_0_snptId_valid = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  entryUops_0_snptId_bits = _RAND_64[2:0];
  _RAND_65 = {1{`RANDOM}};
  entryUops_0_robIdx_value = _RAND_65[5:0];
  _RAND_66 = {1{`RANDOM}};
  entryUops_0_robIdx_flag = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  entryUops_0_robIdxFull_value = _RAND_67[5:0];
  _RAND_68 = {1{`RANDOM}};
  entryUops_0_robIdxFull_flag = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  entryUops_0_lqIdx_value = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  entryUops_0_lqIdx_flag = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  entryUops_0_sqIdx_value = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  entryUops_0_sqIdx_flag = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  entryUops_0_issueQueue = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  entryUops_0_prs1Busy = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  entryUops_0_prs2Busy = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  entryUops_0_isSta = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  entryUops_0_isStd = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  entryUops_1_pc = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  entryUops_1_inst = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  entryUops_1_ctrl_fuType = _RAND_80[3:0];
  _RAND_81 = {1{`RANDOM}};
  entryUops_1_ctrl_aluOp = _RAND_81[4:0];
  _RAND_82 = {1{`RANDOM}};
  entryUops_1_ctrl_bruOp = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  entryUops_1_ctrl_lsuOp = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  entryUops_1_ctrl_csrOp = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  entryUops_1_ctrl_mulOp = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  entryUops_1_ctrl_divOp = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  entryUops_1_ctrl_src1Type = _RAND_87[2:0];
  _RAND_88 = {1{`RANDOM}};
  entryUops_1_ctrl_src2Type = _RAND_88[2:0];
  _RAND_89 = {1{`RANDOM}};
  entryUops_1_ctrl_immType = _RAND_89[3:0];
  _RAND_90 = {1{`RANDOM}};
  entryUops_1_ctrl_rfWen = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  entryUops_1_ctrl_memRead = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  entryUops_1_ctrl_memWrite = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  entryUops_1_ctrl_csrWen = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  entryUops_1_ctrl_isBranch = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  entryUops_1_ctrl_isJump = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  entryUops_1_ctrl_isPriv = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  entryUops_1_excp_excpVec = _RAND_97[16:0];
  _RAND_98 = {1{`RANDOM}};
  entryUops_1_imm = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  entryUops_1_csrAddress = _RAND_99[13:0];
  _RAND_100 = {1{`RANDOM}};
  entryUops_1_pdInfo_valid = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  entryUops_1_pdInfo_isBr = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  entryUops_1_pdInfo_isJal = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  entryUops_1_pdInfo_isJalr = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  entryUops_1_pdInfo_isCall = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  entryUops_1_pdInfo_isRet = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  entryUops_1_pdInfo_jumpTarget = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  entryUops_1_bpuInfo_pc = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  entryUops_1_bpuInfo_fallThrough = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  entryUops_1_bpuInfo_taken = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  entryUops_1_bpuInfo_target = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  entryUops_1_bpuInfo_takenOffset = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_valid = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbHit = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsJalr = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsJal = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsCall = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsRet = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbOffset = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_phtCounter = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_rasTop = _RAND_120[2:0];
  _RAND_121 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_predTaken = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_predTarget = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  entryUops_1_ldst = _RAND_123[4:0];
  _RAND_124 = {1{`RANDOM}};
  entryUops_1_lrs1 = _RAND_124[4:0];
  _RAND_125 = {1{`RANDOM}};
  entryUops_1_lrs2 = _RAND_125[4:0];
  _RAND_126 = {1{`RANDOM}};
  entryUops_1_pdst = _RAND_126[6:0];
  _RAND_127 = {1{`RANDOM}};
  entryUops_1_prs1 = _RAND_127[6:0];
  _RAND_128 = {1{`RANDOM}};
  entryUops_1_prs2 = _RAND_128[6:0];
  _RAND_129 = {1{`RANDOM}};
  entryUops_1_oldPdst = _RAND_129[6:0];
  _RAND_130 = {1{`RANDOM}};
  entryUops_1_rs1Valid = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entryUops_1_rs2Valid = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  entryUops_1_rdValid = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  entryUops_1_snptId_valid = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  entryUops_1_snptId_bits = _RAND_134[2:0];
  _RAND_135 = {1{`RANDOM}};
  entryUops_1_robIdx_value = _RAND_135[5:0];
  _RAND_136 = {1{`RANDOM}};
  entryUops_1_robIdx_flag = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  entryUops_1_robIdxFull_value = _RAND_137[5:0];
  _RAND_138 = {1{`RANDOM}};
  entryUops_1_robIdxFull_flag = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  entryUops_1_lqIdx_value = _RAND_139[3:0];
  _RAND_140 = {1{`RANDOM}};
  entryUops_1_lqIdx_flag = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  entryUops_1_sqIdx_value = _RAND_141[3:0];
  _RAND_142 = {1{`RANDOM}};
  entryUops_1_sqIdx_flag = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  entryUops_1_issueQueue = _RAND_143[2:0];
  _RAND_144 = {1{`RANDOM}};
  entryUops_1_prs1Busy = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  entryUops_1_prs2Busy = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  entryUops_1_isSta = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  entryUops_1_isStd = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  entryUops_2_pc = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  entryUops_2_inst = _RAND_149[31:0];
  _RAND_150 = {1{`RANDOM}};
  entryUops_2_ctrl_fuType = _RAND_150[3:0];
  _RAND_151 = {1{`RANDOM}};
  entryUops_2_ctrl_aluOp = _RAND_151[4:0];
  _RAND_152 = {1{`RANDOM}};
  entryUops_2_ctrl_bruOp = _RAND_152[3:0];
  _RAND_153 = {1{`RANDOM}};
  entryUops_2_ctrl_lsuOp = _RAND_153[3:0];
  _RAND_154 = {1{`RANDOM}};
  entryUops_2_ctrl_csrOp = _RAND_154[2:0];
  _RAND_155 = {1{`RANDOM}};
  entryUops_2_ctrl_mulOp = _RAND_155[2:0];
  _RAND_156 = {1{`RANDOM}};
  entryUops_2_ctrl_divOp = _RAND_156[2:0];
  _RAND_157 = {1{`RANDOM}};
  entryUops_2_ctrl_src1Type = _RAND_157[2:0];
  _RAND_158 = {1{`RANDOM}};
  entryUops_2_ctrl_src2Type = _RAND_158[2:0];
  _RAND_159 = {1{`RANDOM}};
  entryUops_2_ctrl_immType = _RAND_159[3:0];
  _RAND_160 = {1{`RANDOM}};
  entryUops_2_ctrl_rfWen = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  entryUops_2_ctrl_memRead = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  entryUops_2_ctrl_memWrite = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  entryUops_2_ctrl_csrWen = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  entryUops_2_ctrl_isBranch = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  entryUops_2_ctrl_isJump = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  entryUops_2_ctrl_isPriv = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  entryUops_2_excp_excpVec = _RAND_167[16:0];
  _RAND_168 = {1{`RANDOM}};
  entryUops_2_imm = _RAND_168[31:0];
  _RAND_169 = {1{`RANDOM}};
  entryUops_2_csrAddress = _RAND_169[13:0];
  _RAND_170 = {1{`RANDOM}};
  entryUops_2_pdInfo_valid = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  entryUops_2_pdInfo_isBr = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  entryUops_2_pdInfo_isJal = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  entryUops_2_pdInfo_isJalr = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  entryUops_2_pdInfo_isCall = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  entryUops_2_pdInfo_isRet = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  entryUops_2_pdInfo_jumpTarget = _RAND_176[31:0];
  _RAND_177 = {1{`RANDOM}};
  entryUops_2_bpuInfo_pc = _RAND_177[31:0];
  _RAND_178 = {1{`RANDOM}};
  entryUops_2_bpuInfo_fallThrough = _RAND_178[31:0];
  _RAND_179 = {1{`RANDOM}};
  entryUops_2_bpuInfo_taken = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  entryUops_2_bpuInfo_target = _RAND_180[31:0];
  _RAND_181 = {1{`RANDOM}};
  entryUops_2_bpuInfo_takenOffset = _RAND_181[1:0];
  _RAND_182 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_valid = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbHit = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsJalr = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsJal = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsCall = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsRet = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbOffset = _RAND_188[1:0];
  _RAND_189 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_phtCounter = _RAND_189[1:0];
  _RAND_190 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_rasTop = _RAND_190[2:0];
  _RAND_191 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_predTaken = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_predTarget = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  entryUops_2_ldst = _RAND_193[4:0];
  _RAND_194 = {1{`RANDOM}};
  entryUops_2_lrs1 = _RAND_194[4:0];
  _RAND_195 = {1{`RANDOM}};
  entryUops_2_lrs2 = _RAND_195[4:0];
  _RAND_196 = {1{`RANDOM}};
  entryUops_2_pdst = _RAND_196[6:0];
  _RAND_197 = {1{`RANDOM}};
  entryUops_2_prs1 = _RAND_197[6:0];
  _RAND_198 = {1{`RANDOM}};
  entryUops_2_prs2 = _RAND_198[6:0];
  _RAND_199 = {1{`RANDOM}};
  entryUops_2_oldPdst = _RAND_199[6:0];
  _RAND_200 = {1{`RANDOM}};
  entryUops_2_rs1Valid = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  entryUops_2_rs2Valid = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  entryUops_2_rdValid = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  entryUops_2_snptId_valid = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  entryUops_2_snptId_bits = _RAND_204[2:0];
  _RAND_205 = {1{`RANDOM}};
  entryUops_2_robIdx_value = _RAND_205[5:0];
  _RAND_206 = {1{`RANDOM}};
  entryUops_2_robIdx_flag = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  entryUops_2_robIdxFull_value = _RAND_207[5:0];
  _RAND_208 = {1{`RANDOM}};
  entryUops_2_robIdxFull_flag = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  entryUops_2_lqIdx_value = _RAND_209[3:0];
  _RAND_210 = {1{`RANDOM}};
  entryUops_2_lqIdx_flag = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  entryUops_2_sqIdx_value = _RAND_211[3:0];
  _RAND_212 = {1{`RANDOM}};
  entryUops_2_sqIdx_flag = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  entryUops_2_issueQueue = _RAND_213[2:0];
  _RAND_214 = {1{`RANDOM}};
  entryUops_2_prs1Busy = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  entryUops_2_prs2Busy = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  entryUops_2_isSta = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  entryUops_2_isStd = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  entryUops_3_pc = _RAND_218[31:0];
  _RAND_219 = {1{`RANDOM}};
  entryUops_3_inst = _RAND_219[31:0];
  _RAND_220 = {1{`RANDOM}};
  entryUops_3_ctrl_fuType = _RAND_220[3:0];
  _RAND_221 = {1{`RANDOM}};
  entryUops_3_ctrl_aluOp = _RAND_221[4:0];
  _RAND_222 = {1{`RANDOM}};
  entryUops_3_ctrl_bruOp = _RAND_222[3:0];
  _RAND_223 = {1{`RANDOM}};
  entryUops_3_ctrl_lsuOp = _RAND_223[3:0];
  _RAND_224 = {1{`RANDOM}};
  entryUops_3_ctrl_csrOp = _RAND_224[2:0];
  _RAND_225 = {1{`RANDOM}};
  entryUops_3_ctrl_mulOp = _RAND_225[2:0];
  _RAND_226 = {1{`RANDOM}};
  entryUops_3_ctrl_divOp = _RAND_226[2:0];
  _RAND_227 = {1{`RANDOM}};
  entryUops_3_ctrl_src1Type = _RAND_227[2:0];
  _RAND_228 = {1{`RANDOM}};
  entryUops_3_ctrl_src2Type = _RAND_228[2:0];
  _RAND_229 = {1{`RANDOM}};
  entryUops_3_ctrl_immType = _RAND_229[3:0];
  _RAND_230 = {1{`RANDOM}};
  entryUops_3_ctrl_rfWen = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  entryUops_3_ctrl_memRead = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  entryUops_3_ctrl_memWrite = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  entryUops_3_ctrl_csrWen = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  entryUops_3_ctrl_isBranch = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  entryUops_3_ctrl_isJump = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  entryUops_3_ctrl_isPriv = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  entryUops_3_excp_excpVec = _RAND_237[16:0];
  _RAND_238 = {1{`RANDOM}};
  entryUops_3_imm = _RAND_238[31:0];
  _RAND_239 = {1{`RANDOM}};
  entryUops_3_csrAddress = _RAND_239[13:0];
  _RAND_240 = {1{`RANDOM}};
  entryUops_3_pdInfo_valid = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  entryUops_3_pdInfo_isBr = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  entryUops_3_pdInfo_isJal = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  entryUops_3_pdInfo_isJalr = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  entryUops_3_pdInfo_isCall = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  entryUops_3_pdInfo_isRet = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  entryUops_3_pdInfo_jumpTarget = _RAND_246[31:0];
  _RAND_247 = {1{`RANDOM}};
  entryUops_3_bpuInfo_pc = _RAND_247[31:0];
  _RAND_248 = {1{`RANDOM}};
  entryUops_3_bpuInfo_fallThrough = _RAND_248[31:0];
  _RAND_249 = {1{`RANDOM}};
  entryUops_3_bpuInfo_taken = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  entryUops_3_bpuInfo_target = _RAND_250[31:0];
  _RAND_251 = {1{`RANDOM}};
  entryUops_3_bpuInfo_takenOffset = _RAND_251[1:0];
  _RAND_252 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_valid = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbHit = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsJalr = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsJal = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsCall = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsRet = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbOffset = _RAND_258[1:0];
  _RAND_259 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_phtCounter = _RAND_259[1:0];
  _RAND_260 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_rasTop = _RAND_260[2:0];
  _RAND_261 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_predTaken = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_predTarget = _RAND_262[31:0];
  _RAND_263 = {1{`RANDOM}};
  entryUops_3_ldst = _RAND_263[4:0];
  _RAND_264 = {1{`RANDOM}};
  entryUops_3_lrs1 = _RAND_264[4:0];
  _RAND_265 = {1{`RANDOM}};
  entryUops_3_lrs2 = _RAND_265[4:0];
  _RAND_266 = {1{`RANDOM}};
  entryUops_3_pdst = _RAND_266[6:0];
  _RAND_267 = {1{`RANDOM}};
  entryUops_3_prs1 = _RAND_267[6:0];
  _RAND_268 = {1{`RANDOM}};
  entryUops_3_prs2 = _RAND_268[6:0];
  _RAND_269 = {1{`RANDOM}};
  entryUops_3_oldPdst = _RAND_269[6:0];
  _RAND_270 = {1{`RANDOM}};
  entryUops_3_rs1Valid = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  entryUops_3_rs2Valid = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  entryUops_3_rdValid = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  entryUops_3_snptId_valid = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  entryUops_3_snptId_bits = _RAND_274[2:0];
  _RAND_275 = {1{`RANDOM}};
  entryUops_3_robIdx_value = _RAND_275[5:0];
  _RAND_276 = {1{`RANDOM}};
  entryUops_3_robIdx_flag = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  entryUops_3_robIdxFull_value = _RAND_277[5:0];
  _RAND_278 = {1{`RANDOM}};
  entryUops_3_robIdxFull_flag = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  entryUops_3_lqIdx_value = _RAND_279[3:0];
  _RAND_280 = {1{`RANDOM}};
  entryUops_3_lqIdx_flag = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  entryUops_3_sqIdx_value = _RAND_281[3:0];
  _RAND_282 = {1{`RANDOM}};
  entryUops_3_sqIdx_flag = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  entryUops_3_issueQueue = _RAND_283[2:0];
  _RAND_284 = {1{`RANDOM}};
  entryUops_3_prs1Busy = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  entryUops_3_prs2Busy = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  entryUops_3_isSta = _RAND_286[0:0];
  _RAND_287 = {1{`RANDOM}};
  entryUops_3_isStd = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  entryUops_4_pc = _RAND_288[31:0];
  _RAND_289 = {1{`RANDOM}};
  entryUops_4_inst = _RAND_289[31:0];
  _RAND_290 = {1{`RANDOM}};
  entryUops_4_ctrl_fuType = _RAND_290[3:0];
  _RAND_291 = {1{`RANDOM}};
  entryUops_4_ctrl_aluOp = _RAND_291[4:0];
  _RAND_292 = {1{`RANDOM}};
  entryUops_4_ctrl_bruOp = _RAND_292[3:0];
  _RAND_293 = {1{`RANDOM}};
  entryUops_4_ctrl_lsuOp = _RAND_293[3:0];
  _RAND_294 = {1{`RANDOM}};
  entryUops_4_ctrl_csrOp = _RAND_294[2:0];
  _RAND_295 = {1{`RANDOM}};
  entryUops_4_ctrl_mulOp = _RAND_295[2:0];
  _RAND_296 = {1{`RANDOM}};
  entryUops_4_ctrl_divOp = _RAND_296[2:0];
  _RAND_297 = {1{`RANDOM}};
  entryUops_4_ctrl_src1Type = _RAND_297[2:0];
  _RAND_298 = {1{`RANDOM}};
  entryUops_4_ctrl_src2Type = _RAND_298[2:0];
  _RAND_299 = {1{`RANDOM}};
  entryUops_4_ctrl_immType = _RAND_299[3:0];
  _RAND_300 = {1{`RANDOM}};
  entryUops_4_ctrl_rfWen = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  entryUops_4_ctrl_memRead = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  entryUops_4_ctrl_memWrite = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  entryUops_4_ctrl_csrWen = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  entryUops_4_ctrl_isBranch = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  entryUops_4_ctrl_isJump = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  entryUops_4_ctrl_isPriv = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  entryUops_4_excp_excpVec = _RAND_307[16:0];
  _RAND_308 = {1{`RANDOM}};
  entryUops_4_imm = _RAND_308[31:0];
  _RAND_309 = {1{`RANDOM}};
  entryUops_4_csrAddress = _RAND_309[13:0];
  _RAND_310 = {1{`RANDOM}};
  entryUops_4_pdInfo_valid = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  entryUops_4_pdInfo_isBr = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  entryUops_4_pdInfo_isJal = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  entryUops_4_pdInfo_isJalr = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  entryUops_4_pdInfo_isCall = _RAND_314[0:0];
  _RAND_315 = {1{`RANDOM}};
  entryUops_4_pdInfo_isRet = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  entryUops_4_pdInfo_jumpTarget = _RAND_316[31:0];
  _RAND_317 = {1{`RANDOM}};
  entryUops_4_bpuInfo_pc = _RAND_317[31:0];
  _RAND_318 = {1{`RANDOM}};
  entryUops_4_bpuInfo_fallThrough = _RAND_318[31:0];
  _RAND_319 = {1{`RANDOM}};
  entryUops_4_bpuInfo_taken = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  entryUops_4_bpuInfo_target = _RAND_320[31:0];
  _RAND_321 = {1{`RANDOM}};
  entryUops_4_bpuInfo_takenOffset = _RAND_321[1:0];
  _RAND_322 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_valid = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbHit = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsJalr = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsJal = _RAND_325[0:0];
  _RAND_326 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsCall = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsRet = _RAND_327[0:0];
  _RAND_328 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbOffset = _RAND_328[1:0];
  _RAND_329 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_phtCounter = _RAND_329[1:0];
  _RAND_330 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_rasTop = _RAND_330[2:0];
  _RAND_331 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_predTaken = _RAND_331[0:0];
  _RAND_332 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_predTarget = _RAND_332[31:0];
  _RAND_333 = {1{`RANDOM}};
  entryUops_4_ldst = _RAND_333[4:0];
  _RAND_334 = {1{`RANDOM}};
  entryUops_4_lrs1 = _RAND_334[4:0];
  _RAND_335 = {1{`RANDOM}};
  entryUops_4_lrs2 = _RAND_335[4:0];
  _RAND_336 = {1{`RANDOM}};
  entryUops_4_pdst = _RAND_336[6:0];
  _RAND_337 = {1{`RANDOM}};
  entryUops_4_prs1 = _RAND_337[6:0];
  _RAND_338 = {1{`RANDOM}};
  entryUops_4_prs2 = _RAND_338[6:0];
  _RAND_339 = {1{`RANDOM}};
  entryUops_4_oldPdst = _RAND_339[6:0];
  _RAND_340 = {1{`RANDOM}};
  entryUops_4_rs1Valid = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  entryUops_4_rs2Valid = _RAND_341[0:0];
  _RAND_342 = {1{`RANDOM}};
  entryUops_4_rdValid = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  entryUops_4_snptId_valid = _RAND_343[0:0];
  _RAND_344 = {1{`RANDOM}};
  entryUops_4_snptId_bits = _RAND_344[2:0];
  _RAND_345 = {1{`RANDOM}};
  entryUops_4_robIdx_value = _RAND_345[5:0];
  _RAND_346 = {1{`RANDOM}};
  entryUops_4_robIdx_flag = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  entryUops_4_robIdxFull_value = _RAND_347[5:0];
  _RAND_348 = {1{`RANDOM}};
  entryUops_4_robIdxFull_flag = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  entryUops_4_lqIdx_value = _RAND_349[3:0];
  _RAND_350 = {1{`RANDOM}};
  entryUops_4_lqIdx_flag = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  entryUops_4_sqIdx_value = _RAND_351[3:0];
  _RAND_352 = {1{`RANDOM}};
  entryUops_4_sqIdx_flag = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  entryUops_4_issueQueue = _RAND_353[2:0];
  _RAND_354 = {1{`RANDOM}};
  entryUops_4_prs1Busy = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  entryUops_4_prs2Busy = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  entryUops_4_isSta = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  entryUops_4_isStd = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  entryUops_5_pc = _RAND_358[31:0];
  _RAND_359 = {1{`RANDOM}};
  entryUops_5_inst = _RAND_359[31:0];
  _RAND_360 = {1{`RANDOM}};
  entryUops_5_ctrl_fuType = _RAND_360[3:0];
  _RAND_361 = {1{`RANDOM}};
  entryUops_5_ctrl_aluOp = _RAND_361[4:0];
  _RAND_362 = {1{`RANDOM}};
  entryUops_5_ctrl_bruOp = _RAND_362[3:0];
  _RAND_363 = {1{`RANDOM}};
  entryUops_5_ctrl_lsuOp = _RAND_363[3:0];
  _RAND_364 = {1{`RANDOM}};
  entryUops_5_ctrl_csrOp = _RAND_364[2:0];
  _RAND_365 = {1{`RANDOM}};
  entryUops_5_ctrl_mulOp = _RAND_365[2:0];
  _RAND_366 = {1{`RANDOM}};
  entryUops_5_ctrl_divOp = _RAND_366[2:0];
  _RAND_367 = {1{`RANDOM}};
  entryUops_5_ctrl_src1Type = _RAND_367[2:0];
  _RAND_368 = {1{`RANDOM}};
  entryUops_5_ctrl_src2Type = _RAND_368[2:0];
  _RAND_369 = {1{`RANDOM}};
  entryUops_5_ctrl_immType = _RAND_369[3:0];
  _RAND_370 = {1{`RANDOM}};
  entryUops_5_ctrl_rfWen = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  entryUops_5_ctrl_memRead = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  entryUops_5_ctrl_memWrite = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  entryUops_5_ctrl_csrWen = _RAND_373[0:0];
  _RAND_374 = {1{`RANDOM}};
  entryUops_5_ctrl_isBranch = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  entryUops_5_ctrl_isJump = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  entryUops_5_ctrl_isPriv = _RAND_376[0:0];
  _RAND_377 = {1{`RANDOM}};
  entryUops_5_excp_excpVec = _RAND_377[16:0];
  _RAND_378 = {1{`RANDOM}};
  entryUops_5_imm = _RAND_378[31:0];
  _RAND_379 = {1{`RANDOM}};
  entryUops_5_csrAddress = _RAND_379[13:0];
  _RAND_380 = {1{`RANDOM}};
  entryUops_5_pdInfo_valid = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  entryUops_5_pdInfo_isBr = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  entryUops_5_pdInfo_isJal = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  entryUops_5_pdInfo_isJalr = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  entryUops_5_pdInfo_isCall = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  entryUops_5_pdInfo_isRet = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  entryUops_5_pdInfo_jumpTarget = _RAND_386[31:0];
  _RAND_387 = {1{`RANDOM}};
  entryUops_5_bpuInfo_pc = _RAND_387[31:0];
  _RAND_388 = {1{`RANDOM}};
  entryUops_5_bpuInfo_fallThrough = _RAND_388[31:0];
  _RAND_389 = {1{`RANDOM}};
  entryUops_5_bpuInfo_taken = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  entryUops_5_bpuInfo_target = _RAND_390[31:0];
  _RAND_391 = {1{`RANDOM}};
  entryUops_5_bpuInfo_takenOffset = _RAND_391[1:0];
  _RAND_392 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_valid = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbHit = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsJalr = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsJal = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsCall = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsRet = _RAND_397[0:0];
  _RAND_398 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbOffset = _RAND_398[1:0];
  _RAND_399 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_phtCounter = _RAND_399[1:0];
  _RAND_400 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_rasTop = _RAND_400[2:0];
  _RAND_401 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_predTaken = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_predTarget = _RAND_402[31:0];
  _RAND_403 = {1{`RANDOM}};
  entryUops_5_ldst = _RAND_403[4:0];
  _RAND_404 = {1{`RANDOM}};
  entryUops_5_lrs1 = _RAND_404[4:0];
  _RAND_405 = {1{`RANDOM}};
  entryUops_5_lrs2 = _RAND_405[4:0];
  _RAND_406 = {1{`RANDOM}};
  entryUops_5_pdst = _RAND_406[6:0];
  _RAND_407 = {1{`RANDOM}};
  entryUops_5_prs1 = _RAND_407[6:0];
  _RAND_408 = {1{`RANDOM}};
  entryUops_5_prs2 = _RAND_408[6:0];
  _RAND_409 = {1{`RANDOM}};
  entryUops_5_oldPdst = _RAND_409[6:0];
  _RAND_410 = {1{`RANDOM}};
  entryUops_5_rs1Valid = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  entryUops_5_rs2Valid = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  entryUops_5_rdValid = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  entryUops_5_snptId_valid = _RAND_413[0:0];
  _RAND_414 = {1{`RANDOM}};
  entryUops_5_snptId_bits = _RAND_414[2:0];
  _RAND_415 = {1{`RANDOM}};
  entryUops_5_robIdx_value = _RAND_415[5:0];
  _RAND_416 = {1{`RANDOM}};
  entryUops_5_robIdx_flag = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  entryUops_5_robIdxFull_value = _RAND_417[5:0];
  _RAND_418 = {1{`RANDOM}};
  entryUops_5_robIdxFull_flag = _RAND_418[0:0];
  _RAND_419 = {1{`RANDOM}};
  entryUops_5_lqIdx_value = _RAND_419[3:0];
  _RAND_420 = {1{`RANDOM}};
  entryUops_5_lqIdx_flag = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  entryUops_5_sqIdx_value = _RAND_421[3:0];
  _RAND_422 = {1{`RANDOM}};
  entryUops_5_sqIdx_flag = _RAND_422[0:0];
  _RAND_423 = {1{`RANDOM}};
  entryUops_5_issueQueue = _RAND_423[2:0];
  _RAND_424 = {1{`RANDOM}};
  entryUops_5_prs1Busy = _RAND_424[0:0];
  _RAND_425 = {1{`RANDOM}};
  entryUops_5_prs2Busy = _RAND_425[0:0];
  _RAND_426 = {1{`RANDOM}};
  entryUops_5_isSta = _RAND_426[0:0];
  _RAND_427 = {1{`RANDOM}};
  entryUops_5_isStd = _RAND_427[0:0];
  _RAND_428 = {1{`RANDOM}};
  entryUops_6_pc = _RAND_428[31:0];
  _RAND_429 = {1{`RANDOM}};
  entryUops_6_inst = _RAND_429[31:0];
  _RAND_430 = {1{`RANDOM}};
  entryUops_6_ctrl_fuType = _RAND_430[3:0];
  _RAND_431 = {1{`RANDOM}};
  entryUops_6_ctrl_aluOp = _RAND_431[4:0];
  _RAND_432 = {1{`RANDOM}};
  entryUops_6_ctrl_bruOp = _RAND_432[3:0];
  _RAND_433 = {1{`RANDOM}};
  entryUops_6_ctrl_lsuOp = _RAND_433[3:0];
  _RAND_434 = {1{`RANDOM}};
  entryUops_6_ctrl_csrOp = _RAND_434[2:0];
  _RAND_435 = {1{`RANDOM}};
  entryUops_6_ctrl_mulOp = _RAND_435[2:0];
  _RAND_436 = {1{`RANDOM}};
  entryUops_6_ctrl_divOp = _RAND_436[2:0];
  _RAND_437 = {1{`RANDOM}};
  entryUops_6_ctrl_src1Type = _RAND_437[2:0];
  _RAND_438 = {1{`RANDOM}};
  entryUops_6_ctrl_src2Type = _RAND_438[2:0];
  _RAND_439 = {1{`RANDOM}};
  entryUops_6_ctrl_immType = _RAND_439[3:0];
  _RAND_440 = {1{`RANDOM}};
  entryUops_6_ctrl_rfWen = _RAND_440[0:0];
  _RAND_441 = {1{`RANDOM}};
  entryUops_6_ctrl_memRead = _RAND_441[0:0];
  _RAND_442 = {1{`RANDOM}};
  entryUops_6_ctrl_memWrite = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  entryUops_6_ctrl_csrWen = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  entryUops_6_ctrl_isBranch = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  entryUops_6_ctrl_isJump = _RAND_445[0:0];
  _RAND_446 = {1{`RANDOM}};
  entryUops_6_ctrl_isPriv = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  entryUops_6_excp_excpVec = _RAND_447[16:0];
  _RAND_448 = {1{`RANDOM}};
  entryUops_6_imm = _RAND_448[31:0];
  _RAND_449 = {1{`RANDOM}};
  entryUops_6_csrAddress = _RAND_449[13:0];
  _RAND_450 = {1{`RANDOM}};
  entryUops_6_pdInfo_valid = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  entryUops_6_pdInfo_isBr = _RAND_451[0:0];
  _RAND_452 = {1{`RANDOM}};
  entryUops_6_pdInfo_isJal = _RAND_452[0:0];
  _RAND_453 = {1{`RANDOM}};
  entryUops_6_pdInfo_isJalr = _RAND_453[0:0];
  _RAND_454 = {1{`RANDOM}};
  entryUops_6_pdInfo_isCall = _RAND_454[0:0];
  _RAND_455 = {1{`RANDOM}};
  entryUops_6_pdInfo_isRet = _RAND_455[0:0];
  _RAND_456 = {1{`RANDOM}};
  entryUops_6_pdInfo_jumpTarget = _RAND_456[31:0];
  _RAND_457 = {1{`RANDOM}};
  entryUops_6_bpuInfo_pc = _RAND_457[31:0];
  _RAND_458 = {1{`RANDOM}};
  entryUops_6_bpuInfo_fallThrough = _RAND_458[31:0];
  _RAND_459 = {1{`RANDOM}};
  entryUops_6_bpuInfo_taken = _RAND_459[0:0];
  _RAND_460 = {1{`RANDOM}};
  entryUops_6_bpuInfo_target = _RAND_460[31:0];
  _RAND_461 = {1{`RANDOM}};
  entryUops_6_bpuInfo_takenOffset = _RAND_461[1:0];
  _RAND_462 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_valid = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbHit = _RAND_463[0:0];
  _RAND_464 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsJalr = _RAND_464[0:0];
  _RAND_465 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsJal = _RAND_465[0:0];
  _RAND_466 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsCall = _RAND_466[0:0];
  _RAND_467 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsRet = _RAND_467[0:0];
  _RAND_468 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbOffset = _RAND_468[1:0];
  _RAND_469 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_phtCounter = _RAND_469[1:0];
  _RAND_470 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_rasTop = _RAND_470[2:0];
  _RAND_471 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_predTaken = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_predTarget = _RAND_472[31:0];
  _RAND_473 = {1{`RANDOM}};
  entryUops_6_ldst = _RAND_473[4:0];
  _RAND_474 = {1{`RANDOM}};
  entryUops_6_lrs1 = _RAND_474[4:0];
  _RAND_475 = {1{`RANDOM}};
  entryUops_6_lrs2 = _RAND_475[4:0];
  _RAND_476 = {1{`RANDOM}};
  entryUops_6_pdst = _RAND_476[6:0];
  _RAND_477 = {1{`RANDOM}};
  entryUops_6_prs1 = _RAND_477[6:0];
  _RAND_478 = {1{`RANDOM}};
  entryUops_6_prs2 = _RAND_478[6:0];
  _RAND_479 = {1{`RANDOM}};
  entryUops_6_oldPdst = _RAND_479[6:0];
  _RAND_480 = {1{`RANDOM}};
  entryUops_6_rs1Valid = _RAND_480[0:0];
  _RAND_481 = {1{`RANDOM}};
  entryUops_6_rs2Valid = _RAND_481[0:0];
  _RAND_482 = {1{`RANDOM}};
  entryUops_6_rdValid = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  entryUops_6_snptId_valid = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  entryUops_6_snptId_bits = _RAND_484[2:0];
  _RAND_485 = {1{`RANDOM}};
  entryUops_6_robIdx_value = _RAND_485[5:0];
  _RAND_486 = {1{`RANDOM}};
  entryUops_6_robIdx_flag = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  entryUops_6_robIdxFull_value = _RAND_487[5:0];
  _RAND_488 = {1{`RANDOM}};
  entryUops_6_robIdxFull_flag = _RAND_488[0:0];
  _RAND_489 = {1{`RANDOM}};
  entryUops_6_lqIdx_value = _RAND_489[3:0];
  _RAND_490 = {1{`RANDOM}};
  entryUops_6_lqIdx_flag = _RAND_490[0:0];
  _RAND_491 = {1{`RANDOM}};
  entryUops_6_sqIdx_value = _RAND_491[3:0];
  _RAND_492 = {1{`RANDOM}};
  entryUops_6_sqIdx_flag = _RAND_492[0:0];
  _RAND_493 = {1{`RANDOM}};
  entryUops_6_issueQueue = _RAND_493[2:0];
  _RAND_494 = {1{`RANDOM}};
  entryUops_6_prs1Busy = _RAND_494[0:0];
  _RAND_495 = {1{`RANDOM}};
  entryUops_6_prs2Busy = _RAND_495[0:0];
  _RAND_496 = {1{`RANDOM}};
  entryUops_6_isSta = _RAND_496[0:0];
  _RAND_497 = {1{`RANDOM}};
  entryUops_6_isStd = _RAND_497[0:0];
  _RAND_498 = {1{`RANDOM}};
  entryUops_7_pc = _RAND_498[31:0];
  _RAND_499 = {1{`RANDOM}};
  entryUops_7_inst = _RAND_499[31:0];
  _RAND_500 = {1{`RANDOM}};
  entryUops_7_ctrl_fuType = _RAND_500[3:0];
  _RAND_501 = {1{`RANDOM}};
  entryUops_7_ctrl_aluOp = _RAND_501[4:0];
  _RAND_502 = {1{`RANDOM}};
  entryUops_7_ctrl_bruOp = _RAND_502[3:0];
  _RAND_503 = {1{`RANDOM}};
  entryUops_7_ctrl_lsuOp = _RAND_503[3:0];
  _RAND_504 = {1{`RANDOM}};
  entryUops_7_ctrl_csrOp = _RAND_504[2:0];
  _RAND_505 = {1{`RANDOM}};
  entryUops_7_ctrl_mulOp = _RAND_505[2:0];
  _RAND_506 = {1{`RANDOM}};
  entryUops_7_ctrl_divOp = _RAND_506[2:0];
  _RAND_507 = {1{`RANDOM}};
  entryUops_7_ctrl_src1Type = _RAND_507[2:0];
  _RAND_508 = {1{`RANDOM}};
  entryUops_7_ctrl_src2Type = _RAND_508[2:0];
  _RAND_509 = {1{`RANDOM}};
  entryUops_7_ctrl_immType = _RAND_509[3:0];
  _RAND_510 = {1{`RANDOM}};
  entryUops_7_ctrl_rfWen = _RAND_510[0:0];
  _RAND_511 = {1{`RANDOM}};
  entryUops_7_ctrl_memRead = _RAND_511[0:0];
  _RAND_512 = {1{`RANDOM}};
  entryUops_7_ctrl_memWrite = _RAND_512[0:0];
  _RAND_513 = {1{`RANDOM}};
  entryUops_7_ctrl_csrWen = _RAND_513[0:0];
  _RAND_514 = {1{`RANDOM}};
  entryUops_7_ctrl_isBranch = _RAND_514[0:0];
  _RAND_515 = {1{`RANDOM}};
  entryUops_7_ctrl_isJump = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  entryUops_7_ctrl_isPriv = _RAND_516[0:0];
  _RAND_517 = {1{`RANDOM}};
  entryUops_7_excp_excpVec = _RAND_517[16:0];
  _RAND_518 = {1{`RANDOM}};
  entryUops_7_imm = _RAND_518[31:0];
  _RAND_519 = {1{`RANDOM}};
  entryUops_7_csrAddress = _RAND_519[13:0];
  _RAND_520 = {1{`RANDOM}};
  entryUops_7_pdInfo_valid = _RAND_520[0:0];
  _RAND_521 = {1{`RANDOM}};
  entryUops_7_pdInfo_isBr = _RAND_521[0:0];
  _RAND_522 = {1{`RANDOM}};
  entryUops_7_pdInfo_isJal = _RAND_522[0:0];
  _RAND_523 = {1{`RANDOM}};
  entryUops_7_pdInfo_isJalr = _RAND_523[0:0];
  _RAND_524 = {1{`RANDOM}};
  entryUops_7_pdInfo_isCall = _RAND_524[0:0];
  _RAND_525 = {1{`RANDOM}};
  entryUops_7_pdInfo_isRet = _RAND_525[0:0];
  _RAND_526 = {1{`RANDOM}};
  entryUops_7_pdInfo_jumpTarget = _RAND_526[31:0];
  _RAND_527 = {1{`RANDOM}};
  entryUops_7_bpuInfo_pc = _RAND_527[31:0];
  _RAND_528 = {1{`RANDOM}};
  entryUops_7_bpuInfo_fallThrough = _RAND_528[31:0];
  _RAND_529 = {1{`RANDOM}};
  entryUops_7_bpuInfo_taken = _RAND_529[0:0];
  _RAND_530 = {1{`RANDOM}};
  entryUops_7_bpuInfo_target = _RAND_530[31:0];
  _RAND_531 = {1{`RANDOM}};
  entryUops_7_bpuInfo_takenOffset = _RAND_531[1:0];
  _RAND_532 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_valid = _RAND_532[0:0];
  _RAND_533 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbHit = _RAND_533[0:0];
  _RAND_534 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsJalr = _RAND_534[0:0];
  _RAND_535 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsJal = _RAND_535[0:0];
  _RAND_536 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsCall = _RAND_536[0:0];
  _RAND_537 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsRet = _RAND_537[0:0];
  _RAND_538 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbOffset = _RAND_538[1:0];
  _RAND_539 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_phtCounter = _RAND_539[1:0];
  _RAND_540 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_rasTop = _RAND_540[2:0];
  _RAND_541 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_predTaken = _RAND_541[0:0];
  _RAND_542 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_predTarget = _RAND_542[31:0];
  _RAND_543 = {1{`RANDOM}};
  entryUops_7_ldst = _RAND_543[4:0];
  _RAND_544 = {1{`RANDOM}};
  entryUops_7_lrs1 = _RAND_544[4:0];
  _RAND_545 = {1{`RANDOM}};
  entryUops_7_lrs2 = _RAND_545[4:0];
  _RAND_546 = {1{`RANDOM}};
  entryUops_7_pdst = _RAND_546[6:0];
  _RAND_547 = {1{`RANDOM}};
  entryUops_7_prs1 = _RAND_547[6:0];
  _RAND_548 = {1{`RANDOM}};
  entryUops_7_prs2 = _RAND_548[6:0];
  _RAND_549 = {1{`RANDOM}};
  entryUops_7_oldPdst = _RAND_549[6:0];
  _RAND_550 = {1{`RANDOM}};
  entryUops_7_rs1Valid = _RAND_550[0:0];
  _RAND_551 = {1{`RANDOM}};
  entryUops_7_rs2Valid = _RAND_551[0:0];
  _RAND_552 = {1{`RANDOM}};
  entryUops_7_rdValid = _RAND_552[0:0];
  _RAND_553 = {1{`RANDOM}};
  entryUops_7_snptId_valid = _RAND_553[0:0];
  _RAND_554 = {1{`RANDOM}};
  entryUops_7_snptId_bits = _RAND_554[2:0];
  _RAND_555 = {1{`RANDOM}};
  entryUops_7_robIdx_value = _RAND_555[5:0];
  _RAND_556 = {1{`RANDOM}};
  entryUops_7_robIdx_flag = _RAND_556[0:0];
  _RAND_557 = {1{`RANDOM}};
  entryUops_7_robIdxFull_value = _RAND_557[5:0];
  _RAND_558 = {1{`RANDOM}};
  entryUops_7_robIdxFull_flag = _RAND_558[0:0];
  _RAND_559 = {1{`RANDOM}};
  entryUops_7_lqIdx_value = _RAND_559[3:0];
  _RAND_560 = {1{`RANDOM}};
  entryUops_7_lqIdx_flag = _RAND_560[0:0];
  _RAND_561 = {1{`RANDOM}};
  entryUops_7_sqIdx_value = _RAND_561[3:0];
  _RAND_562 = {1{`RANDOM}};
  entryUops_7_sqIdx_flag = _RAND_562[0:0];
  _RAND_563 = {1{`RANDOM}};
  entryUops_7_issueQueue = _RAND_563[2:0];
  _RAND_564 = {1{`RANDOM}};
  entryUops_7_prs1Busy = _RAND_564[0:0];
  _RAND_565 = {1{`RANDOM}};
  entryUops_7_prs2Busy = _RAND_565[0:0];
  _RAND_566 = {1{`RANDOM}};
  entryUops_7_isSta = _RAND_566[0:0];
  _RAND_567 = {1{`RANDOM}};
  entryUops_7_isStd = _RAND_567[0:0];
  _RAND_568 = {1{`RANDOM}};
  entryP1Ready_0 = _RAND_568[0:0];
  _RAND_569 = {1{`RANDOM}};
  entryP1Ready_1 = _RAND_569[0:0];
  _RAND_570 = {1{`RANDOM}};
  entryP1Ready_2 = _RAND_570[0:0];
  _RAND_571 = {1{`RANDOM}};
  entryP1Ready_3 = _RAND_571[0:0];
  _RAND_572 = {1{`RANDOM}};
  entryP1Ready_4 = _RAND_572[0:0];
  _RAND_573 = {1{`RANDOM}};
  entryP1Ready_5 = _RAND_573[0:0];
  _RAND_574 = {1{`RANDOM}};
  entryP1Ready_6 = _RAND_574[0:0];
  _RAND_575 = {1{`RANDOM}};
  entryP1Ready_7 = _RAND_575[0:0];
  _RAND_576 = {1{`RANDOM}};
  entryP2Ready_0 = _RAND_576[0:0];
  _RAND_577 = {1{`RANDOM}};
  entryP2Ready_1 = _RAND_577[0:0];
  _RAND_578 = {1{`RANDOM}};
  entryP2Ready_2 = _RAND_578[0:0];
  _RAND_579 = {1{`RANDOM}};
  entryP2Ready_3 = _RAND_579[0:0];
  _RAND_580 = {1{`RANDOM}};
  entryP2Ready_4 = _RAND_580[0:0];
  _RAND_581 = {1{`RANDOM}};
  entryP2Ready_5 = _RAND_581[0:0];
  _RAND_582 = {1{`RANDOM}};
  entryP2Ready_6 = _RAND_582[0:0];
  _RAND_583 = {1{`RANDOM}};
  entryP2Ready_7 = _RAND_583[0:0];
  _RAND_584 = {1{`RANDOM}};
  age_0_1 = _RAND_584[0:0];
  _RAND_585 = {1{`RANDOM}};
  age_0_2 = _RAND_585[0:0];
  _RAND_586 = {1{`RANDOM}};
  age_0_3 = _RAND_586[0:0];
  _RAND_587 = {1{`RANDOM}};
  age_0_4 = _RAND_587[0:0];
  _RAND_588 = {1{`RANDOM}};
  age_0_5 = _RAND_588[0:0];
  _RAND_589 = {1{`RANDOM}};
  age_0_6 = _RAND_589[0:0];
  _RAND_590 = {1{`RANDOM}};
  age_0_7 = _RAND_590[0:0];
  _RAND_591 = {1{`RANDOM}};
  age_1_0 = _RAND_591[0:0];
  _RAND_592 = {1{`RANDOM}};
  age_1_2 = _RAND_592[0:0];
  _RAND_593 = {1{`RANDOM}};
  age_1_3 = _RAND_593[0:0];
  _RAND_594 = {1{`RANDOM}};
  age_1_4 = _RAND_594[0:0];
  _RAND_595 = {1{`RANDOM}};
  age_1_5 = _RAND_595[0:0];
  _RAND_596 = {1{`RANDOM}};
  age_1_6 = _RAND_596[0:0];
  _RAND_597 = {1{`RANDOM}};
  age_1_7 = _RAND_597[0:0];
  _RAND_598 = {1{`RANDOM}};
  age_2_0 = _RAND_598[0:0];
  _RAND_599 = {1{`RANDOM}};
  age_2_1 = _RAND_599[0:0];
  _RAND_600 = {1{`RANDOM}};
  age_2_3 = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  age_2_4 = _RAND_601[0:0];
  _RAND_602 = {1{`RANDOM}};
  age_2_5 = _RAND_602[0:0];
  _RAND_603 = {1{`RANDOM}};
  age_2_6 = _RAND_603[0:0];
  _RAND_604 = {1{`RANDOM}};
  age_2_7 = _RAND_604[0:0];
  _RAND_605 = {1{`RANDOM}};
  age_3_0 = _RAND_605[0:0];
  _RAND_606 = {1{`RANDOM}};
  age_3_1 = _RAND_606[0:0];
  _RAND_607 = {1{`RANDOM}};
  age_3_2 = _RAND_607[0:0];
  _RAND_608 = {1{`RANDOM}};
  age_3_4 = _RAND_608[0:0];
  _RAND_609 = {1{`RANDOM}};
  age_3_5 = _RAND_609[0:0];
  _RAND_610 = {1{`RANDOM}};
  age_3_6 = _RAND_610[0:0];
  _RAND_611 = {1{`RANDOM}};
  age_3_7 = _RAND_611[0:0];
  _RAND_612 = {1{`RANDOM}};
  age_4_0 = _RAND_612[0:0];
  _RAND_613 = {1{`RANDOM}};
  age_4_1 = _RAND_613[0:0];
  _RAND_614 = {1{`RANDOM}};
  age_4_2 = _RAND_614[0:0];
  _RAND_615 = {1{`RANDOM}};
  age_4_3 = _RAND_615[0:0];
  _RAND_616 = {1{`RANDOM}};
  age_4_5 = _RAND_616[0:0];
  _RAND_617 = {1{`RANDOM}};
  age_4_6 = _RAND_617[0:0];
  _RAND_618 = {1{`RANDOM}};
  age_4_7 = _RAND_618[0:0];
  _RAND_619 = {1{`RANDOM}};
  age_5_0 = _RAND_619[0:0];
  _RAND_620 = {1{`RANDOM}};
  age_5_1 = _RAND_620[0:0];
  _RAND_621 = {1{`RANDOM}};
  age_5_2 = _RAND_621[0:0];
  _RAND_622 = {1{`RANDOM}};
  age_5_3 = _RAND_622[0:0];
  _RAND_623 = {1{`RANDOM}};
  age_5_4 = _RAND_623[0:0];
  _RAND_624 = {1{`RANDOM}};
  age_5_6 = _RAND_624[0:0];
  _RAND_625 = {1{`RANDOM}};
  age_5_7 = _RAND_625[0:0];
  _RAND_626 = {1{`RANDOM}};
  age_6_0 = _RAND_626[0:0];
  _RAND_627 = {1{`RANDOM}};
  age_6_1 = _RAND_627[0:0];
  _RAND_628 = {1{`RANDOM}};
  age_6_2 = _RAND_628[0:0];
  _RAND_629 = {1{`RANDOM}};
  age_6_3 = _RAND_629[0:0];
  _RAND_630 = {1{`RANDOM}};
  age_6_4 = _RAND_630[0:0];
  _RAND_631 = {1{`RANDOM}};
  age_6_5 = _RAND_631[0:0];
  _RAND_632 = {1{`RANDOM}};
  age_6_7 = _RAND_632[0:0];
  _RAND_633 = {1{`RANDOM}};
  age_7_0 = _RAND_633[0:0];
  _RAND_634 = {1{`RANDOM}};
  age_7_1 = _RAND_634[0:0];
  _RAND_635 = {1{`RANDOM}};
  age_7_2 = _RAND_635[0:0];
  _RAND_636 = {1{`RANDOM}};
  age_7_3 = _RAND_636[0:0];
  _RAND_637 = {1{`RANDOM}};
  age_7_4 = _RAND_637[0:0];
  _RAND_638 = {1{`RANDOM}};
  age_7_5 = _RAND_638[0:0];
  _RAND_639 = {1{`RANDOM}};
  age_7_6 = _RAND_639[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
