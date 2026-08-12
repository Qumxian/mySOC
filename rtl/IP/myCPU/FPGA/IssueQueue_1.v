module IssueQueue_1(
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
  input  [2:0]  io_enq_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_prs1Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  input         io_enq_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
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
  output [2:0]  io_issue_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_prs1Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
  output        io_issue_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 25:14]
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
  reg [31:0] _RAND_640;
  reg [31:0] _RAND_641;
  reg [31:0] _RAND_642;
  reg [31:0] _RAND_643;
  reg [31:0] _RAND_644;
  reg [31:0] _RAND_645;
  reg [31:0] _RAND_646;
  reg [31:0] _RAND_647;
  reg [31:0] _RAND_648;
  reg [31:0] _RAND_649;
  reg [31:0] _RAND_650;
  reg [31:0] _RAND_651;
  reg [31:0] _RAND_652;
  reg [31:0] _RAND_653;
  reg [31:0] _RAND_654;
  reg [31:0] _RAND_655;
  reg [31:0] _RAND_656;
  reg [31:0] _RAND_657;
  reg [31:0] _RAND_658;
  reg [31:0] _RAND_659;
  reg [31:0] _RAND_660;
  reg [31:0] _RAND_661;
  reg [31:0] _RAND_662;
  reg [31:0] _RAND_663;
  reg [31:0] _RAND_664;
  reg [31:0] _RAND_665;
  reg [31:0] _RAND_666;
  reg [31:0] _RAND_667;
  reg [31:0] _RAND_668;
  reg [31:0] _RAND_669;
  reg [31:0] _RAND_670;
  reg [31:0] _RAND_671;
  reg [31:0] _RAND_672;
  reg [31:0] _RAND_673;
  reg [31:0] _RAND_674;
  reg [31:0] _RAND_675;
  reg [31:0] _RAND_676;
  reg [31:0] _RAND_677;
  reg [31:0] _RAND_678;
  reg [31:0] _RAND_679;
  reg [31:0] _RAND_680;
  reg [31:0] _RAND_681;
  reg [31:0] _RAND_682;
  reg [31:0] _RAND_683;
  reg [31:0] _RAND_684;
  reg [31:0] _RAND_685;
  reg [31:0] _RAND_686;
  reg [31:0] _RAND_687;
  reg [31:0] _RAND_688;
  reg [31:0] _RAND_689;
  reg [31:0] _RAND_690;
  reg [31:0] _RAND_691;
  reg [31:0] _RAND_692;
  reg [31:0] _RAND_693;
  reg [31:0] _RAND_694;
  reg [31:0] _RAND_695;
  reg [31:0] _RAND_696;
  reg [31:0] _RAND_697;
  reg [31:0] _RAND_698;
  reg [31:0] _RAND_699;
  reg [31:0] _RAND_700;
  reg [31:0] _RAND_701;
  reg [31:0] _RAND_702;
  reg [31:0] _RAND_703;
  reg [31:0] _RAND_704;
  reg [31:0] _RAND_705;
  reg [31:0] _RAND_706;
  reg [31:0] _RAND_707;
  reg [31:0] _RAND_708;
  reg [31:0] _RAND_709;
  reg [31:0] _RAND_710;
  reg [31:0] _RAND_711;
  reg [31:0] _RAND_712;
  reg [31:0] _RAND_713;
  reg [31:0] _RAND_714;
  reg [31:0] _RAND_715;
  reg [31:0] _RAND_716;
  reg [31:0] _RAND_717;
  reg [31:0] _RAND_718;
  reg [31:0] _RAND_719;
  reg [31:0] _RAND_720;
  reg [31:0] _RAND_721;
  reg [31:0] _RAND_722;
  reg [31:0] _RAND_723;
  reg [31:0] _RAND_724;
  reg [31:0] _RAND_725;
  reg [31:0] _RAND_726;
  reg [31:0] _RAND_727;
  reg [31:0] _RAND_728;
  reg [31:0] _RAND_729;
  reg [31:0] _RAND_730;
  reg [31:0] _RAND_731;
  reg [31:0] _RAND_732;
  reg [31:0] _RAND_733;
  reg [31:0] _RAND_734;
  reg [31:0] _RAND_735;
  reg [31:0] _RAND_736;
  reg [31:0] _RAND_737;
  reg [31:0] _RAND_738;
  reg [31:0] _RAND_739;
  reg [31:0] _RAND_740;
  reg [31:0] _RAND_741;
  reg [31:0] _RAND_742;
  reg [31:0] _RAND_743;
  reg [31:0] _RAND_744;
  reg [31:0] _RAND_745;
  reg [31:0] _RAND_746;
  reg [31:0] _RAND_747;
  reg [31:0] _RAND_748;
  reg [31:0] _RAND_749;
  reg [31:0] _RAND_750;
  reg [31:0] _RAND_751;
  reg [31:0] _RAND_752;
  reg [31:0] _RAND_753;
  reg [31:0] _RAND_754;
  reg [31:0] _RAND_755;
  reg [31:0] _RAND_756;
  reg [31:0] _RAND_757;
  reg [31:0] _RAND_758;
  reg [31:0] _RAND_759;
  reg [31:0] _RAND_760;
  reg [31:0] _RAND_761;
  reg [31:0] _RAND_762;
  reg [31:0] _RAND_763;
  reg [31:0] _RAND_764;
  reg [31:0] _RAND_765;
  reg [31:0] _RAND_766;
  reg [31:0] _RAND_767;
  reg [31:0] _RAND_768;
  reg [31:0] _RAND_769;
  reg [31:0] _RAND_770;
  reg [31:0] _RAND_771;
  reg [31:0] _RAND_772;
  reg [31:0] _RAND_773;
  reg [31:0] _RAND_774;
  reg [31:0] _RAND_775;
  reg [31:0] _RAND_776;
  reg [31:0] _RAND_777;
  reg [31:0] _RAND_778;
  reg [31:0] _RAND_779;
  reg [31:0] _RAND_780;
  reg [31:0] _RAND_781;
  reg [31:0] _RAND_782;
  reg [31:0] _RAND_783;
  reg [31:0] _RAND_784;
  reg [31:0] _RAND_785;
  reg [31:0] _RAND_786;
  reg [31:0] _RAND_787;
  reg [31:0] _RAND_788;
  reg [31:0] _RAND_789;
  reg [31:0] _RAND_790;
  reg [31:0] _RAND_791;
  reg [31:0] _RAND_792;
  reg [31:0] _RAND_793;
  reg [31:0] _RAND_794;
  reg [31:0] _RAND_795;
  reg [31:0] _RAND_796;
  reg [31:0] _RAND_797;
  reg [31:0] _RAND_798;
  reg [31:0] _RAND_799;
  reg [31:0] _RAND_800;
  reg [31:0] _RAND_801;
  reg [31:0] _RAND_802;
  reg [31:0] _RAND_803;
  reg [31:0] _RAND_804;
  reg [31:0] _RAND_805;
  reg [31:0] _RAND_806;
  reg [31:0] _RAND_807;
  reg [31:0] _RAND_808;
  reg [31:0] _RAND_809;
  reg [31:0] _RAND_810;
  reg [31:0] _RAND_811;
  reg [31:0] _RAND_812;
  reg [31:0] _RAND_813;
  reg [31:0] _RAND_814;
  reg [31:0] _RAND_815;
  reg [31:0] _RAND_816;
  reg [31:0] _RAND_817;
  reg [31:0] _RAND_818;
  reg [31:0] _RAND_819;
  reg [31:0] _RAND_820;
  reg [31:0] _RAND_821;
  reg [31:0] _RAND_822;
  reg [31:0] _RAND_823;
  reg [31:0] _RAND_824;
  reg [31:0] _RAND_825;
  reg [31:0] _RAND_826;
  reg [31:0] _RAND_827;
  reg [31:0] _RAND_828;
  reg [31:0] _RAND_829;
  reg [31:0] _RAND_830;
  reg [31:0] _RAND_831;
  reg [31:0] _RAND_832;
  reg [31:0] _RAND_833;
  reg [31:0] _RAND_834;
  reg [31:0] _RAND_835;
  reg [31:0] _RAND_836;
  reg [31:0] _RAND_837;
  reg [31:0] _RAND_838;
  reg [31:0] _RAND_839;
  reg [31:0] _RAND_840;
  reg [31:0] _RAND_841;
  reg [31:0] _RAND_842;
  reg [31:0] _RAND_843;
  reg [31:0] _RAND_844;
  reg [31:0] _RAND_845;
  reg [31:0] _RAND_846;
  reg [31:0] _RAND_847;
  reg [31:0] _RAND_848;
  reg [31:0] _RAND_849;
  reg [31:0] _RAND_850;
  reg [31:0] _RAND_851;
  reg [31:0] _RAND_852;
  reg [31:0] _RAND_853;
  reg [31:0] _RAND_854;
  reg [31:0] _RAND_855;
  reg [31:0] _RAND_856;
  reg [31:0] _RAND_857;
  reg [31:0] _RAND_858;
  reg [31:0] _RAND_859;
  reg [31:0] _RAND_860;
  reg [31:0] _RAND_861;
  reg [31:0] _RAND_862;
  reg [31:0] _RAND_863;
  reg [31:0] _RAND_864;
  reg [31:0] _RAND_865;
  reg [31:0] _RAND_866;
  reg [31:0] _RAND_867;
  reg [31:0] _RAND_868;
  reg [31:0] _RAND_869;
  reg [31:0] _RAND_870;
  reg [31:0] _RAND_871;
  reg [31:0] _RAND_872;
  reg [31:0] _RAND_873;
  reg [31:0] _RAND_874;
  reg [31:0] _RAND_875;
  reg [31:0] _RAND_876;
  reg [31:0] _RAND_877;
  reg [31:0] _RAND_878;
  reg [31:0] _RAND_879;
  reg [31:0] _RAND_880;
  reg [31:0] _RAND_881;
  reg [31:0] _RAND_882;
  reg [31:0] _RAND_883;
  reg [31:0] _RAND_884;
  reg [31:0] _RAND_885;
  reg [31:0] _RAND_886;
  reg [31:0] _RAND_887;
  reg [31:0] _RAND_888;
  reg [31:0] _RAND_889;
  reg [31:0] _RAND_890;
  reg [31:0] _RAND_891;
  reg [31:0] _RAND_892;
  reg [31:0] _RAND_893;
  reg [31:0] _RAND_894;
  reg [31:0] _RAND_895;
  reg [31:0] _RAND_896;
  reg [31:0] _RAND_897;
  reg [31:0] _RAND_898;
  reg [31:0] _RAND_899;
  reg [31:0] _RAND_900;
  reg [31:0] _RAND_901;
  reg [31:0] _RAND_902;
  reg [31:0] _RAND_903;
  reg [31:0] _RAND_904;
  reg [31:0] _RAND_905;
  reg [31:0] _RAND_906;
  reg [31:0] _RAND_907;
  reg [31:0] _RAND_908;
  reg [31:0] _RAND_909;
  reg [31:0] _RAND_910;
  reg [31:0] _RAND_911;
  reg [31:0] _RAND_912;
  reg [31:0] _RAND_913;
  reg [31:0] _RAND_914;
  reg [31:0] _RAND_915;
  reg [31:0] _RAND_916;
  reg [31:0] _RAND_917;
  reg [31:0] _RAND_918;
  reg [31:0] _RAND_919;
  reg [31:0] _RAND_920;
  reg [31:0] _RAND_921;
  reg [31:0] _RAND_922;
  reg [31:0] _RAND_923;
  reg [31:0] _RAND_924;
  reg [31:0] _RAND_925;
  reg [31:0] _RAND_926;
  reg [31:0] _RAND_927;
  reg [31:0] _RAND_928;
  reg [31:0] _RAND_929;
  reg [31:0] _RAND_930;
  reg [31:0] _RAND_931;
  reg [31:0] _RAND_932;
  reg [31:0] _RAND_933;
  reg [31:0] _RAND_934;
  reg [31:0] _RAND_935;
`endif // RANDOMIZE_REG_INIT
  reg  entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
  reg  entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
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
  reg [2:0] entryUops_0_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_0_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
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
  reg [2:0] entryUops_1_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_1_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
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
  reg [2:0] entryUops_2_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_2_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
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
  reg [2:0] entryUops_3_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_3_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
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
  reg [2:0] entryUops_4_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_4_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
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
  reg [2:0] entryUops_5_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_5_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
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
  reg [2:0] entryUops_6_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_6_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
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
  reg [2:0] entryUops_7_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_7_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_8_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_8_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_8_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_8_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_8_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_8_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_8_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_8_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_8_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_8_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_8_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_8_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_8_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_8_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_8_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_8_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_8_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_8_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_8_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_8_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_8_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_8_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_9_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_9_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_9_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_9_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_9_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_9_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_9_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_9_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_9_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_9_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_9_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_9_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_9_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_9_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_9_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_9_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_9_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_9_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_9_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_9_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_9_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_9_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_10_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_10_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_10_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_10_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_10_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_10_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_10_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_10_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_10_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_10_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_10_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_10_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_10_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_10_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_10_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_10_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_10_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_10_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_10_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_10_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_10_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_10_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_11_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_11_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_11_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_11_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [3:0] entryUops_11_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [16:0] entryUops_11_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [13:0] entryUops_11_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_11_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_11_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [1:0] entryUops_11_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [31:0] entryUops_11_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_11_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_11_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [4:0] entryUops_11_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_11_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_11_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_11_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [6:0] entryUops_11_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_11_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [5:0] entryUops_11_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg [2:0] entryUops_11_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryUops_11_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
  reg  entryP1Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP1Ready_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
  reg  entryP2Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  entryP2Ready_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
  reg  age_0_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_0_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_1_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_2_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_3_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_4_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_5_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_6_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_7_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_8_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_9_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_10_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
  reg  age_11_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
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
  wire  wValid_40 = io_wakeupPorts_0_valid & entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_41 = io_wakeupPorts_1_valid & entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_42 = io_wakeupPorts_2_valid & entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_43 = io_wakeupPorts_3_valid & entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_44 = io_wakeupPorts_4_valid & entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_8 = wValid_40 & entryUops_8_rs1Valid & entryUops_8_prs1 == io_wakeupPorts_0_bits_pdst | wValid_41 &
    entryUops_8_rs1Valid & entryUops_8_prs1 == io_wakeupPorts_1_bits_pdst | wValid_42 & entryUops_8_rs1Valid &
    entryUops_8_prs1 == io_wakeupPorts_2_bits_pdst | wValid_43 & entryUops_8_rs1Valid & entryUops_8_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_44 & entryUops_8_rs1Valid & entryUops_8_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_8 = wValid_40 & entryUops_8_rs2Valid & entryUops_8_prs2 == io_wakeupPorts_0_bits_pdst | wValid_41 &
    entryUops_8_rs2Valid & entryUops_8_prs2 == io_wakeupPorts_1_bits_pdst | wValid_42 & entryUops_8_rs2Valid &
    entryUops_8_prs2 == io_wakeupPorts_2_bits_pdst | wValid_43 & entryUops_8_rs2Valid & entryUops_8_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_44 & entryUops_8_rs2Valid & entryUops_8_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_45 = io_wakeupPorts_0_valid & entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_46 = io_wakeupPorts_1_valid & entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_47 = io_wakeupPorts_2_valid & entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_48 = io_wakeupPorts_3_valid & entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_49 = io_wakeupPorts_4_valid & entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_9 = wValid_45 & entryUops_9_rs1Valid & entryUops_9_prs1 == io_wakeupPorts_0_bits_pdst | wValid_46 &
    entryUops_9_rs1Valid & entryUops_9_prs1 == io_wakeupPorts_1_bits_pdst | wValid_47 & entryUops_9_rs1Valid &
    entryUops_9_prs1 == io_wakeupPorts_2_bits_pdst | wValid_48 & entryUops_9_rs1Valid & entryUops_9_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_49 & entryUops_9_rs1Valid & entryUops_9_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_9 = wValid_45 & entryUops_9_rs2Valid & entryUops_9_prs2 == io_wakeupPorts_0_bits_pdst | wValid_46 &
    entryUops_9_rs2Valid & entryUops_9_prs2 == io_wakeupPorts_1_bits_pdst | wValid_47 & entryUops_9_rs2Valid &
    entryUops_9_prs2 == io_wakeupPorts_2_bits_pdst | wValid_48 & entryUops_9_rs2Valid & entryUops_9_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_49 & entryUops_9_rs2Valid & entryUops_9_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_50 = io_wakeupPorts_0_valid & entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_51 = io_wakeupPorts_1_valid & entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_52 = io_wakeupPorts_2_valid & entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_53 = io_wakeupPorts_3_valid & entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_54 = io_wakeupPorts_4_valid & entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_10 = wValid_50 & entryUops_10_rs1Valid & entryUops_10_prs1 == io_wakeupPorts_0_bits_pdst | wValid_51 &
    entryUops_10_rs1Valid & entryUops_10_prs1 == io_wakeupPorts_1_bits_pdst | wValid_52 & entryUops_10_rs1Valid &
    entryUops_10_prs1 == io_wakeupPorts_2_bits_pdst | wValid_53 & entryUops_10_rs1Valid & entryUops_10_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_54 & entryUops_10_rs1Valid & entryUops_10_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_10 = wValid_50 & entryUops_10_rs2Valid & entryUops_10_prs2 == io_wakeupPorts_0_bits_pdst | wValid_51 &
    entryUops_10_rs2Valid & entryUops_10_prs2 == io_wakeupPorts_1_bits_pdst | wValid_52 & entryUops_10_rs2Valid &
    entryUops_10_prs2 == io_wakeupPorts_2_bits_pdst | wValid_53 & entryUops_10_rs2Valid & entryUops_10_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_54 & entryUops_10_rs2Valid & entryUops_10_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
  wire  wValid_55 = io_wakeupPorts_0_valid & entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_56 = io_wakeupPorts_1_valid & entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_57 = io_wakeupPorts_2_valid & entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_58 = io_wakeupPorts_3_valid & entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  wValid_59 = io_wakeupPorts_4_valid & entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:44]
  wire  p1Wakeup_11 = wValid_55 & entryUops_11_rs1Valid & entryUops_11_prs1 == io_wakeupPorts_0_bits_pdst | wValid_56 &
    entryUops_11_rs1Valid & entryUops_11_prs1 == io_wakeupPorts_1_bits_pdst | wValid_57 & entryUops_11_rs1Valid &
    entryUops_11_prs1 == io_wakeupPorts_2_bits_pdst | wValid_58 & entryUops_11_rs1Valid & entryUops_11_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_59 & entryUops_11_rs1Valid & entryUops_11_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 68:25]
  wire  p2Wakeup_11 = wValid_55 & entryUops_11_rs2Valid & entryUops_11_prs2 == io_wakeupPorts_0_bits_pdst | wValid_56 &
    entryUops_11_rs2Valid & entryUops_11_prs2 == io_wakeupPorts_1_bits_pdst | wValid_57 & entryUops_11_rs2Valid &
    entryUops_11_prs2 == io_wakeupPorts_2_bits_pdst | wValid_58 & entryUops_11_rs2Valid & entryUops_11_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_59 & entryUops_11_rs2Valid & entryUops_11_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 69:25]
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
  wire  p1Eff_8 = entryP1Ready_8 | p1Wakeup_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_8 = entryP2Ready_8 | p2Wakeup_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_9 = entryP1Ready_9 | p1Wakeup_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_9 = entryP2Ready_9 | p2Wakeup_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_10 = entryP1Ready_10 | p1Wakeup_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_10 = entryP2Ready_10 | p2Wakeup_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
  wire  p1Eff_11 = entryP1Ready_11 | p1Wakeup_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 79:33]
  wire  p2Eff_11 = entryP2Ready_11 | p2Wakeup_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 80:33]
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
  wire  sameFlag_8 = entryUops_8_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_25 = entryUops_8_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_26 = entryUops_8_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_8 = sameFlag_8 ? _isNewer_T_25 : _isNewer_T_26; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_8 = entryValid_8 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_9 = entryUops_9_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_28 = entryUops_9_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_29 = entryUops_9_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_9 = sameFlag_9 ? _isNewer_T_28 : _isNewer_T_29; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_9 = entryValid_9 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_10 = entryUops_10_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_31 = entryUops_10_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_32 = entryUops_10_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_10 = sameFlag_10 ? _isNewer_T_31 : _isNewer_T_32; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_10 = entryValid_10 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
  wire  sameFlag_11 = entryUops_11_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 100:51]
  wire  _isNewer_T_34 = entryUops_11_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_35 = entryUops_11_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_11 = sameFlag_11 ? _isNewer_T_34 : _isNewer_T_35; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  killed_11 = entryValid_11 & io_redirectInfo_valid & io_redirectInfo_bits_doRedirect & isNewer_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 114:94]
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
  wire  _request_8_T_2 = ~killed_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_8 = entryValid_8 & p1Eff_8 & p2Eff_8 & ~killed_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_9_T_2 = ~killed_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_9 = entryValid_9 & p1Eff_9 & p2Eff_9 & ~killed_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_10_T_2 = ~killed_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_10 = entryValid_10 & p1Eff_10 & p2Eff_10 & ~killed_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _request_11_T_2 = ~killed_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:60]
  wire  request_11 = entryValid_11 & p1Eff_11 & p2Eff_11 & ~killed_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:57]
  wire  _T_511 = request_11 & ~age_0_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_512 = request_1 & ~age_0_1 | request_2 & ~age_0_2 | request_3 & ~age_0_3 | request_4 & ~age_0_4 | request_5
     & ~age_0_5 | request_6 & ~age_0_6 | request_7 & ~age_0_7 | request_8 & ~age_0_8 | request_9 & ~age_0_9 | request_10
     & ~age_0_10 | _T_511; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_0 = request_0 & ~_T_512; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_544 = request_11 & ~age_1_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_545 = request_0 & ~age_1_0 | request_2 & ~age_1_2 | request_3 & ~age_1_3 | request_4 & ~age_1_4 | request_5
     & ~age_1_5 | request_6 & ~age_1_6 | request_7 & ~age_1_7 | request_8 & ~age_1_8 | request_9 & ~age_1_9 | request_10
     & ~age_1_10 | _T_544; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_1 = request_1 & ~_T_545; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_577 = request_11 & ~age_2_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_578 = request_0 & ~age_2_0 | request_1 & ~age_2_1 | request_3 & ~age_2_3 | request_4 & ~age_2_4 | request_5
     & ~age_2_5 | request_6 & ~age_2_6 | request_7 & ~age_2_7 | request_8 & ~age_2_8 | request_9 & ~age_2_9 | request_10
     & ~age_2_10 | _T_577; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_2 = request_2 & ~_T_578; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_610 = request_11 & ~age_3_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_611 = request_0 & ~age_3_0 | request_1 & ~age_3_1 | request_2 & ~age_3_2 | request_4 & ~age_3_4 | request_5
     & ~age_3_5 | request_6 & ~age_3_6 | request_7 & ~age_3_7 | request_8 & ~age_3_8 | request_9 & ~age_3_9 | request_10
     & ~age_3_10 | _T_610; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_3 = request_3 & ~_T_611; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_643 = request_11 & ~age_4_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_644 = request_0 & ~age_4_0 | request_1 & ~age_4_1 | request_2 & ~age_4_2 | request_3 & ~age_4_3 | request_5
     & ~age_4_5 | request_6 & ~age_4_6 | request_7 & ~age_4_7 | request_8 & ~age_4_8 | request_9 & ~age_4_9 | request_10
     & ~age_4_10 | _T_643; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_4 = request_4 & ~_T_644; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_676 = request_11 & ~age_5_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_677 = request_0 & ~age_5_0 | request_1 & ~age_5_1 | request_2 & ~age_5_2 | request_3 & ~age_5_3 | request_4
     & ~age_5_4 | request_6 & ~age_5_6 | request_7 & ~age_5_7 | request_8 & ~age_5_8 | request_9 & ~age_5_9 | request_10
     & ~age_5_10 | _T_676; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_5 = request_5 & ~_T_677; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_709 = request_11 & ~age_6_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_710 = request_0 & ~age_6_0 | request_1 & ~age_6_1 | request_2 & ~age_6_2 | request_3 & ~age_6_3 | request_4
     & ~age_6_4 | request_5 & ~age_6_5 | request_7 & ~age_6_7 | request_8 & ~age_6_8 | request_9 & ~age_6_9 | request_10
     & ~age_6_10 | _T_709; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_6 = request_6 & ~_T_710; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_742 = request_11 & ~age_7_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_743 = request_0 & ~age_7_0 | request_1 & ~age_7_1 | request_2 & ~age_7_2 | request_3 & ~age_7_3 | request_4
     & ~age_7_4 | request_5 & ~age_7_5 | request_6 & ~age_7_6 | request_8 & ~age_7_8 | request_9 & ~age_7_9 | request_10
     & ~age_7_10 | _T_742; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_7 = request_7 & ~_T_743; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_775 = request_11 & ~age_8_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_776 = request_0 & ~age_8_0 | request_1 & ~age_8_1 | request_2 & ~age_8_2 | request_3 & ~age_8_3 | request_4
     & ~age_8_4 | request_5 & ~age_8_5 | request_6 & ~age_8_6 | request_7 & ~age_8_7 | request_9 & ~age_8_9 | request_10
     & ~age_8_10 | _T_775; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_8 = request_8 & ~_T_776; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_808 = request_11 & ~age_9_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_809 = request_0 & ~age_9_0 | request_1 & ~age_9_1 | request_2 & ~age_9_2 | request_3 & ~age_9_3 | request_4
     & ~age_9_4 | request_5 & ~age_9_5 | request_6 & ~age_9_6 | request_7 & ~age_9_7 | request_8 & ~age_9_8 | request_10
     & ~age_9_10 | _T_808; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_9 = request_9 & ~_T_809; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_841 = request_11 & ~age_10_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_842 = request_0 & ~age_10_0 | request_1 & ~age_10_1 | request_2 & ~age_10_2 | request_3 & ~age_10_3 |
    request_4 & ~age_10_4 | request_5 & ~age_10_5 | request_6 & ~age_10_6 | request_7 & ~age_10_7 | request_8 & ~
    age_10_8 | request_9 & ~age_10_9 | _T_841; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_10 = request_10 & ~_T_842; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire  _T_874 = request_10 & ~age_11_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:42]
  wire  _T_875 = request_0 & ~age_11_0 | request_1 & ~age_11_1 | request_2 & ~age_11_2 | request_3 & ~age_11_3 |
    request_4 & ~age_11_4 | request_5 & ~age_11_5 | request_6 & ~age_11_6 | request_7 & ~age_11_7 | request_8 & ~
    age_11_8 | request_9 & ~age_11_9 | _T_874; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:27]
  wire  oldest_11 = request_11 & ~_T_875; // @[src/main/scala/backend/scheduler/IssueQueue.scala 149:29]
  wire [2:0] _io_issue_bits_T_92 = oldest_0 ? entryUops_0_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_93 = oldest_1 ? entryUops_1_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_94 = oldest_2 ? entryUops_2_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_95 = oldest_3 ? entryUops_3_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_96 = oldest_4 ? entryUops_4_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_97 = oldest_5 ? entryUops_5_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_98 = oldest_6 ? entryUops_6_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_99 = oldest_7 ? entryUops_7_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_100 = oldest_8 ? entryUops_8_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_101 = oldest_9 ? entryUops_9_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_102 = oldest_10 ? entryUops_10_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_103 = oldest_11 ? entryUops_11_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_104 = _io_issue_bits_T_92 | _io_issue_bits_T_93; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_105 = _io_issue_bits_T_104 | _io_issue_bits_T_94; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_106 = _io_issue_bits_T_105 | _io_issue_bits_T_95; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_107 = _io_issue_bits_T_106 | _io_issue_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_108 = _io_issue_bits_T_107 | _io_issue_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_109 = _io_issue_bits_T_108 | _io_issue_bits_T_98; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_110 = _io_issue_bits_T_109 | _io_issue_bits_T_99; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_111 = _io_issue_bits_T_110 | _io_issue_bits_T_100; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_112 = _io_issue_bits_T_111 | _io_issue_bits_T_101; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_113 = _io_issue_bits_T_112 | _io_issue_bits_T_102; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_230 = oldest_0 ? entryUops_0_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_231 = oldest_1 ? entryUops_1_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_232 = oldest_2 ? entryUops_2_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_233 = oldest_3 ? entryUops_3_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_234 = oldest_4 ? entryUops_4_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_235 = oldest_5 ? entryUops_5_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_236 = oldest_6 ? entryUops_6_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_237 = oldest_7 ? entryUops_7_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_238 = oldest_8 ? entryUops_8_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_239 = oldest_9 ? entryUops_9_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_240 = oldest_10 ? entryUops_10_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_241 = oldest_11 ? entryUops_11_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_242 = _io_issue_bits_T_230 | _io_issue_bits_T_231; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_243 = _io_issue_bits_T_242 | _io_issue_bits_T_232; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_244 = _io_issue_bits_T_243 | _io_issue_bits_T_233; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_245 = _io_issue_bits_T_244 | _io_issue_bits_T_234; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_246 = _io_issue_bits_T_245 | _io_issue_bits_T_235; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_247 = _io_issue_bits_T_246 | _io_issue_bits_T_236; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_248 = _io_issue_bits_T_247 | _io_issue_bits_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_249 = _io_issue_bits_T_248 | _io_issue_bits_T_238; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_250 = _io_issue_bits_T_249 | _io_issue_bits_T_239; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_251 = _io_issue_bits_T_250 | _io_issue_bits_T_240; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_276 = oldest_0 ? entryUops_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_277 = oldest_1 ? entryUops_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_278 = oldest_2 ? entryUops_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_279 = oldest_3 ? entryUops_3_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_280 = oldest_4 ? entryUops_4_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_281 = oldest_5 ? entryUops_5_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_282 = oldest_6 ? entryUops_6_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_283 = oldest_7 ? entryUops_7_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_284 = oldest_8 ? entryUops_8_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_285 = oldest_9 ? entryUops_9_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_286 = oldest_10 ? entryUops_10_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_287 = oldest_11 ? entryUops_11_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_288 = _io_issue_bits_T_276 | _io_issue_bits_T_277; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_289 = _io_issue_bits_T_288 | _io_issue_bits_T_278; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_290 = _io_issue_bits_T_289 | _io_issue_bits_T_279; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_291 = _io_issue_bits_T_290 | _io_issue_bits_T_280; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_292 = _io_issue_bits_T_291 | _io_issue_bits_T_281; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_293 = _io_issue_bits_T_292 | _io_issue_bits_T_282; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_294 = _io_issue_bits_T_293 | _io_issue_bits_T_283; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_295 = _io_issue_bits_T_294 | _io_issue_bits_T_284; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_296 = _io_issue_bits_T_295 | _io_issue_bits_T_285; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_297 = _io_issue_bits_T_296 | _io_issue_bits_T_286; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_299 = oldest_0 ? entryUops_0_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_300 = oldest_1 ? entryUops_1_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_301 = oldest_2 ? entryUops_2_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_302 = oldest_3 ? entryUops_3_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_303 = oldest_4 ? entryUops_4_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_304 = oldest_5 ? entryUops_5_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_305 = oldest_6 ? entryUops_6_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_306 = oldest_7 ? entryUops_7_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_307 = oldest_8 ? entryUops_8_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_308 = oldest_9 ? entryUops_9_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_309 = oldest_10 ? entryUops_10_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_310 = oldest_11 ? entryUops_11_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_311 = _io_issue_bits_T_299 | _io_issue_bits_T_300; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_312 = _io_issue_bits_T_311 | _io_issue_bits_T_301; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_313 = _io_issue_bits_T_312 | _io_issue_bits_T_302; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_314 = _io_issue_bits_T_313 | _io_issue_bits_T_303; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_315 = _io_issue_bits_T_314 | _io_issue_bits_T_304; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_316 = _io_issue_bits_T_315 | _io_issue_bits_T_305; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_317 = _io_issue_bits_T_316 | _io_issue_bits_T_306; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_318 = _io_issue_bits_T_317 | _io_issue_bits_T_307; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_319 = _io_issue_bits_T_318 | _io_issue_bits_T_308; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_320 = _io_issue_bits_T_319 | _io_issue_bits_T_309; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_414 = oldest_0 ? entryUops_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_415 = oldest_1 ? entryUops_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_416 = oldest_2 ? entryUops_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_417 = oldest_3 ? entryUops_3_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_418 = oldest_4 ? entryUops_4_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_419 = oldest_5 ? entryUops_5_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_420 = oldest_6 ? entryUops_6_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_421 = oldest_7 ? entryUops_7_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_422 = oldest_8 ? entryUops_8_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_423 = oldest_9 ? entryUops_9_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_424 = oldest_10 ? entryUops_10_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_425 = oldest_11 ? entryUops_11_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_426 = _io_issue_bits_T_414 | _io_issue_bits_T_415; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_427 = _io_issue_bits_T_426 | _io_issue_bits_T_416; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_428 = _io_issue_bits_T_427 | _io_issue_bits_T_417; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_429 = _io_issue_bits_T_428 | _io_issue_bits_T_418; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_430 = _io_issue_bits_T_429 | _io_issue_bits_T_419; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_431 = _io_issue_bits_T_430 | _io_issue_bits_T_420; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_432 = _io_issue_bits_T_431 | _io_issue_bits_T_421; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_433 = _io_issue_bits_T_432 | _io_issue_bits_T_422; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_434 = _io_issue_bits_T_433 | _io_issue_bits_T_423; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_435 = _io_issue_bits_T_434 | _io_issue_bits_T_424; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_437 = oldest_0 ? entryUops_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_438 = oldest_1 ? entryUops_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_439 = oldest_2 ? entryUops_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_440 = oldest_3 ? entryUops_3_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_441 = oldest_4 ? entryUops_4_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_442 = oldest_5 ? entryUops_5_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_443 = oldest_6 ? entryUops_6_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_444 = oldest_7 ? entryUops_7_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_445 = oldest_8 ? entryUops_8_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_446 = oldest_9 ? entryUops_9_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_447 = oldest_10 ? entryUops_10_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_448 = oldest_11 ? entryUops_11_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_449 = _io_issue_bits_T_437 | _io_issue_bits_T_438; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_450 = _io_issue_bits_T_449 | _io_issue_bits_T_439; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_451 = _io_issue_bits_T_450 | _io_issue_bits_T_440; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_452 = _io_issue_bits_T_451 | _io_issue_bits_T_441; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_453 = _io_issue_bits_T_452 | _io_issue_bits_T_442; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_454 = _io_issue_bits_T_453 | _io_issue_bits_T_443; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_455 = _io_issue_bits_T_454 | _io_issue_bits_T_444; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_456 = _io_issue_bits_T_455 | _io_issue_bits_T_445; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_457 = _io_issue_bits_T_456 | _io_issue_bits_T_446; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_458 = _io_issue_bits_T_457 | _io_issue_bits_T_447; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_460 = oldest_0 ? entryUops_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_461 = oldest_1 ? entryUops_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_462 = oldest_2 ? entryUops_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_463 = oldest_3 ? entryUops_3_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_464 = oldest_4 ? entryUops_4_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_465 = oldest_5 ? entryUops_5_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_466 = oldest_6 ? entryUops_6_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_467 = oldest_7 ? entryUops_7_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_468 = oldest_8 ? entryUops_8_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_469 = oldest_9 ? entryUops_9_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_470 = oldest_10 ? entryUops_10_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_471 = oldest_11 ? entryUops_11_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_472 = _io_issue_bits_T_460 | _io_issue_bits_T_461; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_473 = _io_issue_bits_T_472 | _io_issue_bits_T_462; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_474 = _io_issue_bits_T_473 | _io_issue_bits_T_463; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_475 = _io_issue_bits_T_474 | _io_issue_bits_T_464; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_476 = _io_issue_bits_T_475 | _io_issue_bits_T_465; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_477 = _io_issue_bits_T_476 | _io_issue_bits_T_466; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_478 = _io_issue_bits_T_477 | _io_issue_bits_T_467; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_479 = _io_issue_bits_T_478 | _io_issue_bits_T_468; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_480 = _io_issue_bits_T_479 | _io_issue_bits_T_469; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_481 = _io_issue_bits_T_480 | _io_issue_bits_T_470; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_483 = oldest_0 ? entryUops_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_484 = oldest_1 ? entryUops_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_485 = oldest_2 ? entryUops_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_486 = oldest_3 ? entryUops_3_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_487 = oldest_4 ? entryUops_4_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_488 = oldest_5 ? entryUops_5_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_489 = oldest_6 ? entryUops_6_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_490 = oldest_7 ? entryUops_7_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_491 = oldest_8 ? entryUops_8_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_492 = oldest_9 ? entryUops_9_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_493 = oldest_10 ? entryUops_10_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_494 = oldest_11 ? entryUops_11_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_495 = _io_issue_bits_T_483 | _io_issue_bits_T_484; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_496 = _io_issue_bits_T_495 | _io_issue_bits_T_485; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_497 = _io_issue_bits_T_496 | _io_issue_bits_T_486; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_498 = _io_issue_bits_T_497 | _io_issue_bits_T_487; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_499 = _io_issue_bits_T_498 | _io_issue_bits_T_488; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_500 = _io_issue_bits_T_499 | _io_issue_bits_T_489; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_501 = _io_issue_bits_T_500 | _io_issue_bits_T_490; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_502 = _io_issue_bits_T_501 | _io_issue_bits_T_491; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_503 = _io_issue_bits_T_502 | _io_issue_bits_T_492; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_504 = _io_issue_bits_T_503 | _io_issue_bits_T_493; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_506 = oldest_0 ? entryUops_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_507 = oldest_1 ? entryUops_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_508 = oldest_2 ? entryUops_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_509 = oldest_3 ? entryUops_3_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_510 = oldest_4 ? entryUops_4_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_511 = oldest_5 ? entryUops_5_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_512 = oldest_6 ? entryUops_6_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_513 = oldest_7 ? entryUops_7_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_514 = oldest_8 ? entryUops_8_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_515 = oldest_9 ? entryUops_9_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_516 = oldest_10 ? entryUops_10_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_517 = oldest_11 ? entryUops_11_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_518 = _io_issue_bits_T_506 | _io_issue_bits_T_507; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_519 = _io_issue_bits_T_518 | _io_issue_bits_T_508; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_520 = _io_issue_bits_T_519 | _io_issue_bits_T_509; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_521 = _io_issue_bits_T_520 | _io_issue_bits_T_510; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_522 = _io_issue_bits_T_521 | _io_issue_bits_T_511; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_523 = _io_issue_bits_T_522 | _io_issue_bits_T_512; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_524 = _io_issue_bits_T_523 | _io_issue_bits_T_513; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_525 = _io_issue_bits_T_524 | _io_issue_bits_T_514; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_526 = _io_issue_bits_T_525 | _io_issue_bits_T_515; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_527 = _io_issue_bits_T_526 | _io_issue_bits_T_516; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_529 = oldest_0 ? entryUops_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_530 = oldest_1 ? entryUops_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_531 = oldest_2 ? entryUops_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_532 = oldest_3 ? entryUops_3_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_533 = oldest_4 ? entryUops_4_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_534 = oldest_5 ? entryUops_5_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_535 = oldest_6 ? entryUops_6_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_536 = oldest_7 ? entryUops_7_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_537 = oldest_8 ? entryUops_8_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_538 = oldest_9 ? entryUops_9_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_539 = oldest_10 ? entryUops_10_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_540 = oldest_11 ? entryUops_11_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_541 = _io_issue_bits_T_529 | _io_issue_bits_T_530; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_542 = _io_issue_bits_T_541 | _io_issue_bits_T_531; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_543 = _io_issue_bits_T_542 | _io_issue_bits_T_532; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_544 = _io_issue_bits_T_543 | _io_issue_bits_T_533; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_545 = _io_issue_bits_T_544 | _io_issue_bits_T_534; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_546 = _io_issue_bits_T_545 | _io_issue_bits_T_535; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_547 = _io_issue_bits_T_546 | _io_issue_bits_T_536; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_548 = _io_issue_bits_T_547 | _io_issue_bits_T_537; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_549 = _io_issue_bits_T_548 | _io_issue_bits_T_538; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_550 = _io_issue_bits_T_549 | _io_issue_bits_T_539; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_552 = oldest_0 ? entryUops_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_553 = oldest_1 ? entryUops_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_554 = oldest_2 ? entryUops_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_555 = oldest_3 ? entryUops_3_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_556 = oldest_4 ? entryUops_4_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_557 = oldest_5 ? entryUops_5_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_558 = oldest_6 ? entryUops_6_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_559 = oldest_7 ? entryUops_7_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_560 = oldest_8 ? entryUops_8_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_561 = oldest_9 ? entryUops_9_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_562 = oldest_10 ? entryUops_10_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_563 = oldest_11 ? entryUops_11_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_564 = _io_issue_bits_T_552 | _io_issue_bits_T_553; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_565 = _io_issue_bits_T_564 | _io_issue_bits_T_554; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_566 = _io_issue_bits_T_565 | _io_issue_bits_T_555; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_567 = _io_issue_bits_T_566 | _io_issue_bits_T_556; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_568 = _io_issue_bits_T_567 | _io_issue_bits_T_557; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_569 = _io_issue_bits_T_568 | _io_issue_bits_T_558; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_570 = _io_issue_bits_T_569 | _io_issue_bits_T_559; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_571 = _io_issue_bits_T_570 | _io_issue_bits_T_560; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_572 = _io_issue_bits_T_571 | _io_issue_bits_T_561; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_573 = _io_issue_bits_T_572 | _io_issue_bits_T_562; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_575 = oldest_0 ? entryUops_0_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_576 = oldest_1 ? entryUops_1_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_577 = oldest_2 ? entryUops_2_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_578 = oldest_3 ? entryUops_3_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_579 = oldest_4 ? entryUops_4_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_580 = oldest_5 ? entryUops_5_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_581 = oldest_6 ? entryUops_6_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_582 = oldest_7 ? entryUops_7_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_583 = oldest_8 ? entryUops_8_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_584 = oldest_9 ? entryUops_9_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_585 = oldest_10 ? entryUops_10_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_586 = oldest_11 ? entryUops_11_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_587 = _io_issue_bits_T_575 | _io_issue_bits_T_576; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_588 = _io_issue_bits_T_587 | _io_issue_bits_T_577; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_589 = _io_issue_bits_T_588 | _io_issue_bits_T_578; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_590 = _io_issue_bits_T_589 | _io_issue_bits_T_579; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_591 = _io_issue_bits_T_590 | _io_issue_bits_T_580; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_592 = _io_issue_bits_T_591 | _io_issue_bits_T_581; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_593 = _io_issue_bits_T_592 | _io_issue_bits_T_582; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_594 = _io_issue_bits_T_593 | _io_issue_bits_T_583; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_595 = _io_issue_bits_T_594 | _io_issue_bits_T_584; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_596 = _io_issue_bits_T_595 | _io_issue_bits_T_585; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_621 = oldest_0 ? entryUops_0_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_622 = oldest_1 ? entryUops_1_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_623 = oldest_2 ? entryUops_2_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_624 = oldest_3 ? entryUops_3_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_625 = oldest_4 ? entryUops_4_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_626 = oldest_5 ? entryUops_5_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_627 = oldest_6 ? entryUops_6_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_628 = oldest_7 ? entryUops_7_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_629 = oldest_8 ? entryUops_8_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_630 = oldest_9 ? entryUops_9_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_631 = oldest_10 ? entryUops_10_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_632 = oldest_11 ? entryUops_11_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_633 = _io_issue_bits_T_621 | _io_issue_bits_T_622; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_634 = _io_issue_bits_T_633 | _io_issue_bits_T_623; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_635 = _io_issue_bits_T_634 | _io_issue_bits_T_624; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_636 = _io_issue_bits_T_635 | _io_issue_bits_T_625; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_637 = _io_issue_bits_T_636 | _io_issue_bits_T_626; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_638 = _io_issue_bits_T_637 | _io_issue_bits_T_627; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_639 = _io_issue_bits_T_638 | _io_issue_bits_T_628; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_640 = _io_issue_bits_T_639 | _io_issue_bits_T_629; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_641 = _io_issue_bits_T_640 | _io_issue_bits_T_630; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_642 = _io_issue_bits_T_641 | _io_issue_bits_T_631; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_644 = oldest_0 ? entryUops_0_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_645 = oldest_1 ? entryUops_1_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_646 = oldest_2 ? entryUops_2_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_647 = oldest_3 ? entryUops_3_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_648 = oldest_4 ? entryUops_4_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_649 = oldest_5 ? entryUops_5_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_650 = oldest_6 ? entryUops_6_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_651 = oldest_7 ? entryUops_7_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_652 = oldest_8 ? entryUops_8_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_653 = oldest_9 ? entryUops_9_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_654 = oldest_10 ? entryUops_10_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_655 = oldest_11 ? entryUops_11_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_656 = _io_issue_bits_T_644 | _io_issue_bits_T_645; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_657 = _io_issue_bits_T_656 | _io_issue_bits_T_646; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_658 = _io_issue_bits_T_657 | _io_issue_bits_T_647; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_659 = _io_issue_bits_T_658 | _io_issue_bits_T_648; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_660 = _io_issue_bits_T_659 | _io_issue_bits_T_649; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_661 = _io_issue_bits_T_660 | _io_issue_bits_T_650; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_662 = _io_issue_bits_T_661 | _io_issue_bits_T_651; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_663 = _io_issue_bits_T_662 | _io_issue_bits_T_652; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_664 = _io_issue_bits_T_663 | _io_issue_bits_T_653; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_665 = _io_issue_bits_T_664 | _io_issue_bits_T_654; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_667 = oldest_0 ? entryUops_0_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_668 = oldest_1 ? entryUops_1_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_669 = oldest_2 ? entryUops_2_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_670 = oldest_3 ? entryUops_3_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_671 = oldest_4 ? entryUops_4_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_672 = oldest_5 ? entryUops_5_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_673 = oldest_6 ? entryUops_6_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_674 = oldest_7 ? entryUops_7_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_675 = oldest_8 ? entryUops_8_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_676 = oldest_9 ? entryUops_9_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_677 = oldest_10 ? entryUops_10_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_678 = oldest_11 ? entryUops_11_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_679 = _io_issue_bits_T_667 | _io_issue_bits_T_668; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_680 = _io_issue_bits_T_679 | _io_issue_bits_T_669; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_681 = _io_issue_bits_T_680 | _io_issue_bits_T_670; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_682 = _io_issue_bits_T_681 | _io_issue_bits_T_671; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_683 = _io_issue_bits_T_682 | _io_issue_bits_T_672; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_684 = _io_issue_bits_T_683 | _io_issue_bits_T_673; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_685 = _io_issue_bits_T_684 | _io_issue_bits_T_674; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_686 = _io_issue_bits_T_685 | _io_issue_bits_T_675; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_687 = _io_issue_bits_T_686 | _io_issue_bits_T_676; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_688 = _io_issue_bits_T_687 | _io_issue_bits_T_677; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_828 = oldest_0 ? entryUops_0_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_829 = oldest_1 ? entryUops_1_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_830 = oldest_2 ? entryUops_2_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_831 = oldest_3 ? entryUops_3_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_832 = oldest_4 ? entryUops_4_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_833 = oldest_5 ? entryUops_5_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_834 = oldest_6 ? entryUops_6_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_835 = oldest_7 ? entryUops_7_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_836 = oldest_8 ? entryUops_8_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_837 = oldest_9 ? entryUops_9_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_838 = oldest_10 ? entryUops_10_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_839 = oldest_11 ? entryUops_11_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_840 = _io_issue_bits_T_828 | _io_issue_bits_T_829; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_841 = _io_issue_bits_T_840 | _io_issue_bits_T_830; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_842 = _io_issue_bits_T_841 | _io_issue_bits_T_831; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_843 = _io_issue_bits_T_842 | _io_issue_bits_T_832; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_844 = _io_issue_bits_T_843 | _io_issue_bits_T_833; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_845 = _io_issue_bits_T_844 | _io_issue_bits_T_834; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_846 = _io_issue_bits_T_845 | _io_issue_bits_T_835; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_847 = _io_issue_bits_T_846 | _io_issue_bits_T_836; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_848 = _io_issue_bits_T_847 | _io_issue_bits_T_837; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_issue_bits_T_849 = _io_issue_bits_T_848 | _io_issue_bits_T_838; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_851 = oldest_0 ? entryUops_0_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_852 = oldest_1 ? entryUops_1_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_853 = oldest_2 ? entryUops_2_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_854 = oldest_3 ? entryUops_3_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_855 = oldest_4 ? entryUops_4_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_856 = oldest_5 ? entryUops_5_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_857 = oldest_6 ? entryUops_6_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_858 = oldest_7 ? entryUops_7_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_859 = oldest_8 ? entryUops_8_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_860 = oldest_9 ? entryUops_9_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_861 = oldest_10 ? entryUops_10_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_862 = oldest_11 ? entryUops_11_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_863 = _io_issue_bits_T_851 | _io_issue_bits_T_852; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_864 = _io_issue_bits_T_863 | _io_issue_bits_T_853; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_865 = _io_issue_bits_T_864 | _io_issue_bits_T_854; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_866 = _io_issue_bits_T_865 | _io_issue_bits_T_855; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_867 = _io_issue_bits_T_866 | _io_issue_bits_T_856; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_868 = _io_issue_bits_T_867 | _io_issue_bits_T_857; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_869 = _io_issue_bits_T_868 | _io_issue_bits_T_858; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_870 = _io_issue_bits_T_869 | _io_issue_bits_T_859; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_871 = _io_issue_bits_T_870 | _io_issue_bits_T_860; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_872 = _io_issue_bits_T_871 | _io_issue_bits_T_861; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_897 = oldest_0 ? entryUops_0_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_898 = oldest_1 ? entryUops_1_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_899 = oldest_2 ? entryUops_2_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_900 = oldest_3 ? entryUops_3_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_901 = oldest_4 ? entryUops_4_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_902 = oldest_5 ? entryUops_5_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_903 = oldest_6 ? entryUops_6_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_904 = oldest_7 ? entryUops_7_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_905 = oldest_8 ? entryUops_8_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_906 = oldest_9 ? entryUops_9_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_907 = oldest_10 ? entryUops_10_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_908 = oldest_11 ? entryUops_11_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_909 = _io_issue_bits_T_897 | _io_issue_bits_T_898; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_910 = _io_issue_bits_T_909 | _io_issue_bits_T_899; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_911 = _io_issue_bits_T_910 | _io_issue_bits_T_900; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_912 = _io_issue_bits_T_911 | _io_issue_bits_T_901; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_913 = _io_issue_bits_T_912 | _io_issue_bits_T_902; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_914 = _io_issue_bits_T_913 | _io_issue_bits_T_903; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_915 = _io_issue_bits_T_914 | _io_issue_bits_T_904; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_916 = _io_issue_bits_T_915 | _io_issue_bits_T_905; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_917 = _io_issue_bits_T_916 | _io_issue_bits_T_906; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_918 = _io_issue_bits_T_917 | _io_issue_bits_T_907; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_920 = oldest_0 ? entryUops_0_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_921 = oldest_1 ? entryUops_1_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_922 = oldest_2 ? entryUops_2_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_923 = oldest_3 ? entryUops_3_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_924 = oldest_4 ? entryUops_4_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_925 = oldest_5 ? entryUops_5_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_926 = oldest_6 ? entryUops_6_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_927 = oldest_7 ? entryUops_7_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_928 = oldest_8 ? entryUops_8_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_929 = oldest_9 ? entryUops_9_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_930 = oldest_10 ? entryUops_10_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_931 = oldest_11 ? entryUops_11_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_932 = _io_issue_bits_T_920 | _io_issue_bits_T_921; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_933 = _io_issue_bits_T_932 | _io_issue_bits_T_922; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_934 = _io_issue_bits_T_933 | _io_issue_bits_T_923; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_935 = _io_issue_bits_T_934 | _io_issue_bits_T_924; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_936 = _io_issue_bits_T_935 | _io_issue_bits_T_925; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_937 = _io_issue_bits_T_936 | _io_issue_bits_T_926; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_938 = _io_issue_bits_T_937 | _io_issue_bits_T_927; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_939 = _io_issue_bits_T_938 | _io_issue_bits_T_928; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_940 = _io_issue_bits_T_939 | _io_issue_bits_T_929; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_941 = _io_issue_bits_T_940 | _io_issue_bits_T_930; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_943 = oldest_0 ? entryUops_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_944 = oldest_1 ? entryUops_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_945 = oldest_2 ? entryUops_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_946 = oldest_3 ? entryUops_3_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_947 = oldest_4 ? entryUops_4_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_948 = oldest_5 ? entryUops_5_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_949 = oldest_6 ? entryUops_6_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_950 = oldest_7 ? entryUops_7_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_951 = oldest_8 ? entryUops_8_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_952 = oldest_9 ? entryUops_9_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_953 = oldest_10 ? entryUops_10_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_954 = oldest_11 ? entryUops_11_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_955 = _io_issue_bits_T_943 | _io_issue_bits_T_944; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_956 = _io_issue_bits_T_955 | _io_issue_bits_T_945; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_957 = _io_issue_bits_T_956 | _io_issue_bits_T_946; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_958 = _io_issue_bits_T_957 | _io_issue_bits_T_947; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_959 = _io_issue_bits_T_958 | _io_issue_bits_T_948; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_960 = _io_issue_bits_T_959 | _io_issue_bits_T_949; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_961 = _io_issue_bits_T_960 | _io_issue_bits_T_950; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_962 = _io_issue_bits_T_961 | _io_issue_bits_T_951; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_963 = _io_issue_bits_T_962 | _io_issue_bits_T_952; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_964 = _io_issue_bits_T_963 | _io_issue_bits_T_953; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1104 = oldest_0 ? entryUops_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1105 = oldest_1 ? entryUops_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1106 = oldest_2 ? entryUops_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1107 = oldest_3 ? entryUops_3_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1108 = oldest_4 ? entryUops_4_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1109 = oldest_5 ? entryUops_5_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1110 = oldest_6 ? entryUops_6_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1111 = oldest_7 ? entryUops_7_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1112 = oldest_8 ? entryUops_8_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1113 = oldest_9 ? entryUops_9_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1114 = oldest_10 ? entryUops_10_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1115 = oldest_11 ? entryUops_11_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1116 = _io_issue_bits_T_1104 | _io_issue_bits_T_1105; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1117 = _io_issue_bits_T_1116 | _io_issue_bits_T_1106; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1118 = _io_issue_bits_T_1117 | _io_issue_bits_T_1107; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1119 = _io_issue_bits_T_1118 | _io_issue_bits_T_1108; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1120 = _io_issue_bits_T_1119 | _io_issue_bits_T_1109; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1121 = _io_issue_bits_T_1120 | _io_issue_bits_T_1110; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1122 = _io_issue_bits_T_1121 | _io_issue_bits_T_1111; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1123 = _io_issue_bits_T_1122 | _io_issue_bits_T_1112; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1124 = _io_issue_bits_T_1123 | _io_issue_bits_T_1113; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_1125 = _io_issue_bits_T_1124 | _io_issue_bits_T_1114; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1127 = oldest_0 ? entryUops_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1128 = oldest_1 ? entryUops_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1129 = oldest_2 ? entryUops_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1130 = oldest_3 ? entryUops_3_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1131 = oldest_4 ? entryUops_4_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1132 = oldest_5 ? entryUops_5_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1133 = oldest_6 ? entryUops_6_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1134 = oldest_7 ? entryUops_7_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1135 = oldest_8 ? entryUops_8_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1136 = oldest_9 ? entryUops_9_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1137 = oldest_10 ? entryUops_10_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1138 = oldest_11 ? entryUops_11_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1139 = _io_issue_bits_T_1127 | _io_issue_bits_T_1128; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1140 = _io_issue_bits_T_1139 | _io_issue_bits_T_1129; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1141 = _io_issue_bits_T_1140 | _io_issue_bits_T_1130; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1142 = _io_issue_bits_T_1141 | _io_issue_bits_T_1131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1143 = _io_issue_bits_T_1142 | _io_issue_bits_T_1132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1144 = _io_issue_bits_T_1143 | _io_issue_bits_T_1133; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1145 = _io_issue_bits_T_1144 | _io_issue_bits_T_1134; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1146 = _io_issue_bits_T_1145 | _io_issue_bits_T_1135; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1147 = _io_issue_bits_T_1146 | _io_issue_bits_T_1136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1148 = _io_issue_bits_T_1147 | _io_issue_bits_T_1137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1150 = oldest_0 ? entryUops_0_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1151 = oldest_1 ? entryUops_1_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1152 = oldest_2 ? entryUops_2_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1153 = oldest_3 ? entryUops_3_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1154 = oldest_4 ? entryUops_4_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1155 = oldest_5 ? entryUops_5_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1156 = oldest_6 ? entryUops_6_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1157 = oldest_7 ? entryUops_7_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1158 = oldest_8 ? entryUops_8_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1159 = oldest_9 ? entryUops_9_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1160 = oldest_10 ? entryUops_10_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1161 = oldest_11 ? entryUops_11_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1162 = _io_issue_bits_T_1150 | _io_issue_bits_T_1151; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1163 = _io_issue_bits_T_1162 | _io_issue_bits_T_1152; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1164 = _io_issue_bits_T_1163 | _io_issue_bits_T_1153; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1165 = _io_issue_bits_T_1164 | _io_issue_bits_T_1154; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1166 = _io_issue_bits_T_1165 | _io_issue_bits_T_1155; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1167 = _io_issue_bits_T_1166 | _io_issue_bits_T_1156; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1168 = _io_issue_bits_T_1167 | _io_issue_bits_T_1157; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1169 = _io_issue_bits_T_1168 | _io_issue_bits_T_1158; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1170 = _io_issue_bits_T_1169 | _io_issue_bits_T_1159; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_issue_bits_T_1171 = _io_issue_bits_T_1170 | _io_issue_bits_T_1160; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1334 = oldest_0 ? entryUops_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1335 = oldest_1 ? entryUops_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1336 = oldest_2 ? entryUops_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1337 = oldest_3 ? entryUops_3_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1338 = oldest_4 ? entryUops_4_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1339 = oldest_5 ? entryUops_5_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1340 = oldest_6 ? entryUops_6_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1341 = oldest_7 ? entryUops_7_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1342 = oldest_8 ? entryUops_8_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1343 = oldest_9 ? entryUops_9_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1344 = oldest_10 ? entryUops_10_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1345 = oldest_11 ? entryUops_11_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1346 = _io_issue_bits_T_1334 | _io_issue_bits_T_1335; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1347 = _io_issue_bits_T_1346 | _io_issue_bits_T_1336; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1348 = _io_issue_bits_T_1347 | _io_issue_bits_T_1337; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1349 = _io_issue_bits_T_1348 | _io_issue_bits_T_1338; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1350 = _io_issue_bits_T_1349 | _io_issue_bits_T_1339; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1351 = _io_issue_bits_T_1350 | _io_issue_bits_T_1340; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1352 = _io_issue_bits_T_1351 | _io_issue_bits_T_1341; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1353 = _io_issue_bits_T_1352 | _io_issue_bits_T_1342; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1354 = _io_issue_bits_T_1353 | _io_issue_bits_T_1343; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1355 = _io_issue_bits_T_1354 | _io_issue_bits_T_1344; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1357 = oldest_0 ? entryUops_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1358 = oldest_1 ? entryUops_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1359 = oldest_2 ? entryUops_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1360 = oldest_3 ? entryUops_3_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1361 = oldest_4 ? entryUops_4_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1362 = oldest_5 ? entryUops_5_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1363 = oldest_6 ? entryUops_6_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1364 = oldest_7 ? entryUops_7_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1365 = oldest_8 ? entryUops_8_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1366 = oldest_9 ? entryUops_9_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1367 = oldest_10 ? entryUops_10_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1368 = oldest_11 ? entryUops_11_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1369 = _io_issue_bits_T_1357 | _io_issue_bits_T_1358; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1370 = _io_issue_bits_T_1369 | _io_issue_bits_T_1359; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1371 = _io_issue_bits_T_1370 | _io_issue_bits_T_1360; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1372 = _io_issue_bits_T_1371 | _io_issue_bits_T_1361; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1373 = _io_issue_bits_T_1372 | _io_issue_bits_T_1362; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1374 = _io_issue_bits_T_1373 | _io_issue_bits_T_1363; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1375 = _io_issue_bits_T_1374 | _io_issue_bits_T_1364; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1376 = _io_issue_bits_T_1375 | _io_issue_bits_T_1365; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1377 = _io_issue_bits_T_1376 | _io_issue_bits_T_1366; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1378 = _io_issue_bits_T_1377 | _io_issue_bits_T_1367; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1380 = oldest_0 ? entryUops_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1381 = oldest_1 ? entryUops_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1382 = oldest_2 ? entryUops_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1383 = oldest_3 ? entryUops_3_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1384 = oldest_4 ? entryUops_4_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1385 = oldest_5 ? entryUops_5_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1386 = oldest_6 ? entryUops_6_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1387 = oldest_7 ? entryUops_7_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1388 = oldest_8 ? entryUops_8_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1389 = oldest_9 ? entryUops_9_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1390 = oldest_10 ? entryUops_10_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1391 = oldest_11 ? entryUops_11_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1392 = _io_issue_bits_T_1380 | _io_issue_bits_T_1381; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1393 = _io_issue_bits_T_1392 | _io_issue_bits_T_1382; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1394 = _io_issue_bits_T_1393 | _io_issue_bits_T_1383; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1395 = _io_issue_bits_T_1394 | _io_issue_bits_T_1384; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1396 = _io_issue_bits_T_1395 | _io_issue_bits_T_1385; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1397 = _io_issue_bits_T_1396 | _io_issue_bits_T_1386; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1398 = _io_issue_bits_T_1397 | _io_issue_bits_T_1387; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1399 = _io_issue_bits_T_1398 | _io_issue_bits_T_1388; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1400 = _io_issue_bits_T_1399 | _io_issue_bits_T_1389; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1401 = _io_issue_bits_T_1400 | _io_issue_bits_T_1390; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1403 = oldest_0 ? entryUops_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1404 = oldest_1 ? entryUops_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1405 = oldest_2 ? entryUops_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1406 = oldest_3 ? entryUops_3_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1407 = oldest_4 ? entryUops_4_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1408 = oldest_5 ? entryUops_5_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1409 = oldest_6 ? entryUops_6_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1410 = oldest_7 ? entryUops_7_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1411 = oldest_8 ? entryUops_8_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1412 = oldest_9 ? entryUops_9_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1413 = oldest_10 ? entryUops_10_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1414 = oldest_11 ? entryUops_11_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1415 = _io_issue_bits_T_1403 | _io_issue_bits_T_1404; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1416 = _io_issue_bits_T_1415 | _io_issue_bits_T_1405; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1417 = _io_issue_bits_T_1416 | _io_issue_bits_T_1406; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1418 = _io_issue_bits_T_1417 | _io_issue_bits_T_1407; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1419 = _io_issue_bits_T_1418 | _io_issue_bits_T_1408; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1420 = _io_issue_bits_T_1419 | _io_issue_bits_T_1409; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1421 = _io_issue_bits_T_1420 | _io_issue_bits_T_1410; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1422 = _io_issue_bits_T_1421 | _io_issue_bits_T_1411; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1423 = _io_issue_bits_T_1422 | _io_issue_bits_T_1412; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1424 = _io_issue_bits_T_1423 | _io_issue_bits_T_1413; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1426 = oldest_0 ? entryUops_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1427 = oldest_1 ? entryUops_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1428 = oldest_2 ? entryUops_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1429 = oldest_3 ? entryUops_3_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1430 = oldest_4 ? entryUops_4_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1431 = oldest_5 ? entryUops_5_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1432 = oldest_6 ? entryUops_6_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1433 = oldest_7 ? entryUops_7_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1434 = oldest_8 ? entryUops_8_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1435 = oldest_9 ? entryUops_9_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1436 = oldest_10 ? entryUops_10_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1437 = oldest_11 ? entryUops_11_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1438 = _io_issue_bits_T_1426 | _io_issue_bits_T_1427; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1439 = _io_issue_bits_T_1438 | _io_issue_bits_T_1428; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1440 = _io_issue_bits_T_1439 | _io_issue_bits_T_1429; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1441 = _io_issue_bits_T_1440 | _io_issue_bits_T_1430; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1442 = _io_issue_bits_T_1441 | _io_issue_bits_T_1431; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1443 = _io_issue_bits_T_1442 | _io_issue_bits_T_1432; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1444 = _io_issue_bits_T_1443 | _io_issue_bits_T_1433; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1445 = _io_issue_bits_T_1444 | _io_issue_bits_T_1434; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1446 = _io_issue_bits_T_1445 | _io_issue_bits_T_1435; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1447 = _io_issue_bits_T_1446 | _io_issue_bits_T_1436; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1449 = oldest_0 ? entryUops_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1450 = oldest_1 ? entryUops_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1451 = oldest_2 ? entryUops_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1452 = oldest_3 ? entryUops_3_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1453 = oldest_4 ? entryUops_4_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1454 = oldest_5 ? entryUops_5_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1455 = oldest_6 ? entryUops_6_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1456 = oldest_7 ? entryUops_7_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1457 = oldest_8 ? entryUops_8_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1458 = oldest_9 ? entryUops_9_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1459 = oldest_10 ? entryUops_10_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1460 = oldest_11 ? entryUops_11_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1461 = _io_issue_bits_T_1449 | _io_issue_bits_T_1450; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1462 = _io_issue_bits_T_1461 | _io_issue_bits_T_1451; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1463 = _io_issue_bits_T_1462 | _io_issue_bits_T_1452; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1464 = _io_issue_bits_T_1463 | _io_issue_bits_T_1453; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1465 = _io_issue_bits_T_1464 | _io_issue_bits_T_1454; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1466 = _io_issue_bits_T_1465 | _io_issue_bits_T_1455; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1467 = _io_issue_bits_T_1466 | _io_issue_bits_T_1456; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1468 = _io_issue_bits_T_1467 | _io_issue_bits_T_1457; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1469 = _io_issue_bits_T_1468 | _io_issue_bits_T_1458; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_1470 = _io_issue_bits_T_1469 | _io_issue_bits_T_1459; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1472 = oldest_0 ? entryUops_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1473 = oldest_1 ? entryUops_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1474 = oldest_2 ? entryUops_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1475 = oldest_3 ? entryUops_3_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1476 = oldest_4 ? entryUops_4_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1477 = oldest_5 ? entryUops_5_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1478 = oldest_6 ? entryUops_6_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1479 = oldest_7 ? entryUops_7_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1480 = oldest_8 ? entryUops_8_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1481 = oldest_9 ? entryUops_9_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1482 = oldest_10 ? entryUops_10_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1483 = oldest_11 ? entryUops_11_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1484 = _io_issue_bits_T_1472 | _io_issue_bits_T_1473; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1485 = _io_issue_bits_T_1484 | _io_issue_bits_T_1474; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1486 = _io_issue_bits_T_1485 | _io_issue_bits_T_1475; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1487 = _io_issue_bits_T_1486 | _io_issue_bits_T_1476; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1488 = _io_issue_bits_T_1487 | _io_issue_bits_T_1477; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1489 = _io_issue_bits_T_1488 | _io_issue_bits_T_1478; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1490 = _io_issue_bits_T_1489 | _io_issue_bits_T_1479; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1491 = _io_issue_bits_T_1490 | _io_issue_bits_T_1480; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1492 = _io_issue_bits_T_1491 | _io_issue_bits_T_1481; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1493 = _io_issue_bits_T_1492 | _io_issue_bits_T_1482; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1495 = oldest_0 ? entryUops_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1496 = oldest_1 ? entryUops_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1497 = oldest_2 ? entryUops_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1498 = oldest_3 ? entryUops_3_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1499 = oldest_4 ? entryUops_4_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1500 = oldest_5 ? entryUops_5_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1501 = oldest_6 ? entryUops_6_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1502 = oldest_7 ? entryUops_7_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1503 = oldest_8 ? entryUops_8_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1504 = oldest_9 ? entryUops_9_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1505 = oldest_10 ? entryUops_10_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1506 = oldest_11 ? entryUops_11_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1507 = _io_issue_bits_T_1495 | _io_issue_bits_T_1496; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1508 = _io_issue_bits_T_1507 | _io_issue_bits_T_1497; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1509 = _io_issue_bits_T_1508 | _io_issue_bits_T_1498; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1510 = _io_issue_bits_T_1509 | _io_issue_bits_T_1499; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1511 = _io_issue_bits_T_1510 | _io_issue_bits_T_1500; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1512 = _io_issue_bits_T_1511 | _io_issue_bits_T_1501; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1513 = _io_issue_bits_T_1512 | _io_issue_bits_T_1502; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1514 = _io_issue_bits_T_1513 | _io_issue_bits_T_1503; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1515 = _io_issue_bits_T_1514 | _io_issue_bits_T_1504; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1516 = _io_issue_bits_T_1515 | _io_issue_bits_T_1505; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1518 = oldest_0 ? entryUops_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1519 = oldest_1 ? entryUops_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1520 = oldest_2 ? entryUops_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1521 = oldest_3 ? entryUops_3_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1522 = oldest_4 ? entryUops_4_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1523 = oldest_5 ? entryUops_5_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1524 = oldest_6 ? entryUops_6_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1525 = oldest_7 ? entryUops_7_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1526 = oldest_8 ? entryUops_8_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1527 = oldest_9 ? entryUops_9_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1528 = oldest_10 ? entryUops_10_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1529 = oldest_11 ? entryUops_11_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1530 = _io_issue_bits_T_1518 | _io_issue_bits_T_1519; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1531 = _io_issue_bits_T_1530 | _io_issue_bits_T_1520; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1532 = _io_issue_bits_T_1531 | _io_issue_bits_T_1521; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1533 = _io_issue_bits_T_1532 | _io_issue_bits_T_1522; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1534 = _io_issue_bits_T_1533 | _io_issue_bits_T_1523; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1535 = _io_issue_bits_T_1534 | _io_issue_bits_T_1524; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1536 = _io_issue_bits_T_1535 | _io_issue_bits_T_1525; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1537 = _io_issue_bits_T_1536 | _io_issue_bits_T_1526; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1538 = _io_issue_bits_T_1537 | _io_issue_bits_T_1527; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_1539 = _io_issue_bits_T_1538 | _io_issue_bits_T_1528; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1541 = oldest_0 ? entryUops_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1542 = oldest_1 ? entryUops_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1543 = oldest_2 ? entryUops_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1544 = oldest_3 ? entryUops_3_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1545 = oldest_4 ? entryUops_4_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1546 = oldest_5 ? entryUops_5_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1547 = oldest_6 ? entryUops_6_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1548 = oldest_7 ? entryUops_7_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1549 = oldest_8 ? entryUops_8_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1550 = oldest_9 ? entryUops_9_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1551 = oldest_10 ? entryUops_10_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1552 = oldest_11 ? entryUops_11_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1553 = _io_issue_bits_T_1541 | _io_issue_bits_T_1542; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1554 = _io_issue_bits_T_1553 | _io_issue_bits_T_1543; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1555 = _io_issue_bits_T_1554 | _io_issue_bits_T_1544; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1556 = _io_issue_bits_T_1555 | _io_issue_bits_T_1545; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1557 = _io_issue_bits_T_1556 | _io_issue_bits_T_1546; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1558 = _io_issue_bits_T_1557 | _io_issue_bits_T_1547; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1559 = _io_issue_bits_T_1558 | _io_issue_bits_T_1548; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1560 = _io_issue_bits_T_1559 | _io_issue_bits_T_1549; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1561 = _io_issue_bits_T_1560 | _io_issue_bits_T_1550; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_1562 = _io_issue_bits_T_1561 | _io_issue_bits_T_1551; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1564 = oldest_0 ? entryUops_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1565 = oldest_1 ? entryUops_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1566 = oldest_2 ? entryUops_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1567 = oldest_3 ? entryUops_3_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1568 = oldest_4 ? entryUops_4_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1569 = oldest_5 ? entryUops_5_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1570 = oldest_6 ? entryUops_6_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1571 = oldest_7 ? entryUops_7_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1572 = oldest_8 ? entryUops_8_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1573 = oldest_9 ? entryUops_9_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1574 = oldest_10 ? entryUops_10_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1575 = oldest_11 ? entryUops_11_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1576 = _io_issue_bits_T_1564 | _io_issue_bits_T_1565; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1577 = _io_issue_bits_T_1576 | _io_issue_bits_T_1566; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1578 = _io_issue_bits_T_1577 | _io_issue_bits_T_1567; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1579 = _io_issue_bits_T_1578 | _io_issue_bits_T_1568; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1580 = _io_issue_bits_T_1579 | _io_issue_bits_T_1569; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1581 = _io_issue_bits_T_1580 | _io_issue_bits_T_1570; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1582 = _io_issue_bits_T_1581 | _io_issue_bits_T_1571; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1583 = _io_issue_bits_T_1582 | _io_issue_bits_T_1572; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1584 = _io_issue_bits_T_1583 | _io_issue_bits_T_1573; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1585 = _io_issue_bits_T_1584 | _io_issue_bits_T_1574; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1587 = oldest_0 ? entryUops_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1588 = oldest_1 ? entryUops_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1589 = oldest_2 ? entryUops_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1590 = oldest_3 ? entryUops_3_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1591 = oldest_4 ? entryUops_4_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1592 = oldest_5 ? entryUops_5_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1593 = oldest_6 ? entryUops_6_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1594 = oldest_7 ? entryUops_7_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1595 = oldest_8 ? entryUops_8_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1596 = oldest_9 ? entryUops_9_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1597 = oldest_10 ? entryUops_10_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1598 = oldest_11 ? entryUops_11_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1599 = _io_issue_bits_T_1587 | _io_issue_bits_T_1588; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1600 = _io_issue_bits_T_1599 | _io_issue_bits_T_1589; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1601 = _io_issue_bits_T_1600 | _io_issue_bits_T_1590; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1602 = _io_issue_bits_T_1601 | _io_issue_bits_T_1591; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1603 = _io_issue_bits_T_1602 | _io_issue_bits_T_1592; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1604 = _io_issue_bits_T_1603 | _io_issue_bits_T_1593; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1605 = _io_issue_bits_T_1604 | _io_issue_bits_T_1594; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1606 = _io_issue_bits_T_1605 | _io_issue_bits_T_1595; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1607 = _io_issue_bits_T_1606 | _io_issue_bits_T_1596; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_1608 = _io_issue_bits_T_1607 | _io_issue_bits_T_1597; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  issueFire = io_issue_valid & io_issue_ready; // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:34]
  wire  freeMask_0 = ~entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_1 = ~entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_2 = ~entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_3 = ~entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_4 = ~entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_5 = ~entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_6 = ~entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_7 = ~entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_8 = ~entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_9 = ~entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_10 = ~entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire  freeMask_11 = ~entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 166:47]
  wire [3:0] _enqIdx_T = freeMask_10 ? 4'ha : 4'hb; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_1 = freeMask_9 ? 4'h9 : _enqIdx_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_2 = freeMask_8 ? 4'h8 : _enqIdx_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_3 = freeMask_7 ? 4'h7 : _enqIdx_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_4 = freeMask_6 ? 4'h6 : _enqIdx_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_5 = freeMask_5 ? 4'h5 : _enqIdx_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_6 = freeMask_4 ? 4'h4 : _enqIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_7 = freeMask_3 ? 4'h3 : _enqIdx_T_6; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_8 = freeMask_2 ? 4'h2 : _enqIdx_T_7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _enqIdx_T_9 = freeMask_1 ? 4'h1 : _enqIdx_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] enqIdx = freeMask_0 ? 4'h0 : _enqIdx_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [5:0] hasFree_lo = {freeMask_5,freeMask_4,freeMask_3,freeMask_2,freeMask_1,freeMask_0}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:27]
  wire [11:0] _hasFree_T = {freeMask_11,freeMask_10,freeMask_9,freeMask_8,freeMask_7,freeMask_6,hasFree_lo}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:27]
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
  wire  _validAfterKillGrant_8_T_2 = oldest_8 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_8 = entryValid_8 & _request_8_T_2 & ~(oldest_8 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_9_T_2 = oldest_9 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_9 = entryValid_9 & _request_9_T_2 & ~(oldest_9 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_10_T_2 = oldest_10 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_10 = entryValid_10 & _request_10_T_2 & ~(oldest_10 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _validAfterKillGrant_11_T_2 = oldest_11 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:73]
  wire  validAfterKillGrant_11 = entryValid_11 & _request_11_T_2 & ~(oldest_11 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:59]
  wire  _T_878 = enqFire & enqIdx == 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:24]
  wire  _GEN_0 = enqFire & enqIdx == 4'h0 | entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _T_892 = enqFire & enqIdx == 4'h1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_901 = enqFire & enqIdx == 4'h2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_910 = enqFire & enqIdx == 4'h3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_919 = enqFire & enqIdx == 4'h4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_928 = enqFire & enqIdx == 4'h5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_937 = enqFire & enqIdx == 4'h6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_946 = enqFire & enqIdx == 4'h7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_955 = enqFire & enqIdx == 4'h8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_964 = enqFire & enqIdx == 4'h9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_973 = enqFire & enqIdx == 4'ha; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _T_982 = enqFire & enqIdx == 4'hb; // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:26]
  wire  _GEN_122 = _T_892 | entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_244 = _T_901 | entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_366 = _T_910 | entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_488 = _T_919 | entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_610 = _T_928 | entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_732 = _T_937 | entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_854 = _T_946 | entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_976 = _T_955 | entryValid_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_1098 = _T_964 | entryValid_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_1220 = _T_973 | entryValid_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire  _GEN_1342 = _T_982 | entryValid_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:43 191:21 45:29]
  wire [1:0] _io_freeEntries_T = freeMask_1 + freeMask_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _GEN_1464 = {{1'd0}, freeMask_0}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_2 = _GEN_1464 + _io_freeEntries_T; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _io_freeEntries_T_4 = freeMask_4 + freeMask_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _GEN_1465 = {{1'd0}, freeMask_3}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_6 = _GEN_1465 + _io_freeEntries_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_8 = _io_freeEntries_T_2[1:0] + _io_freeEntries_T_6[1:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _io_freeEntries_T_10 = freeMask_7 + freeMask_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _GEN_1466 = {{1'd0}, freeMask_6}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_12 = _GEN_1466 + _io_freeEntries_T_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _io_freeEntries_T_14 = freeMask_10 + freeMask_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [1:0] _GEN_1467 = {{1'd0}, freeMask_9}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_16 = _GEN_1467 + _io_freeEntries_T_14; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  wire [2:0] _io_freeEntries_T_18 = _io_freeEntries_T_12[1:0] + _io_freeEntries_T_16[1:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
  assign io_issue_valid = oldest_0 | oldest_1 | oldest_2 | oldest_3 | oldest_4 | oldest_5 | oldest_6 | oldest_7 |
    oldest_8 | oldest_9 | oldest_10 | oldest_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 158:36]
  assign io_issue_bits_pc = _io_issue_bits_T_1608 | _io_issue_bits_T_1598; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_inst = _io_issue_bits_T_1585 | _io_issue_bits_T_1575; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_fuType = _io_issue_bits_T_1562 | _io_issue_bits_T_1552; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_aluOp = _io_issue_bits_T_1539 | _io_issue_bits_T_1529; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_bruOp = _io_issue_bits_T_1516 | _io_issue_bits_T_1506; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_lsuOp = _io_issue_bits_T_1493 | _io_issue_bits_T_1483; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrOp = _io_issue_bits_T_1470 | _io_issue_bits_T_1460; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_mulOp = _io_issue_bits_T_1447 | _io_issue_bits_T_1437; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_divOp = _io_issue_bits_T_1424 | _io_issue_bits_T_1414; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src1Type = _io_issue_bits_T_1401 | _io_issue_bits_T_1391; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src2Type = _io_issue_bits_T_1378 | _io_issue_bits_T_1368; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_immType = _io_issue_bits_T_1355 | _io_issue_bits_T_1345; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_rfWen = oldest_0 & entryUops_0_ctrl_rfWen | oldest_1 & entryUops_1_ctrl_rfWen | oldest_2 &
    entryUops_2_ctrl_rfWen | oldest_3 & entryUops_3_ctrl_rfWen | oldest_4 & entryUops_4_ctrl_rfWen | oldest_5 &
    entryUops_5_ctrl_rfWen | oldest_6 & entryUops_6_ctrl_rfWen | oldest_7 & entryUops_7_ctrl_rfWen | oldest_8 &
    entryUops_8_ctrl_rfWen | oldest_9 & entryUops_9_ctrl_rfWen | oldest_10 & entryUops_10_ctrl_rfWen | oldest_11 &
    entryUops_11_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memRead = oldest_0 & entryUops_0_ctrl_memRead | oldest_1 & entryUops_1_ctrl_memRead |
    oldest_2 & entryUops_2_ctrl_memRead | oldest_3 & entryUops_3_ctrl_memRead | oldest_4 & entryUops_4_ctrl_memRead |
    oldest_5 & entryUops_5_ctrl_memRead | oldest_6 & entryUops_6_ctrl_memRead | oldest_7 & entryUops_7_ctrl_memRead |
    oldest_8 & entryUops_8_ctrl_memRead | oldest_9 & entryUops_9_ctrl_memRead | oldest_10 & entryUops_10_ctrl_memRead |
    oldest_11 & entryUops_11_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memWrite = oldest_0 & entryUops_0_ctrl_memWrite | oldest_1 & entryUops_1_ctrl_memWrite |
    oldest_2 & entryUops_2_ctrl_memWrite | oldest_3 & entryUops_3_ctrl_memWrite | oldest_4 & entryUops_4_ctrl_memWrite
     | oldest_5 & entryUops_5_ctrl_memWrite | oldest_6 & entryUops_6_ctrl_memWrite | oldest_7 &
    entryUops_7_ctrl_memWrite | oldest_8 & entryUops_8_ctrl_memWrite | oldest_9 & entryUops_9_ctrl_memWrite | oldest_10
     & entryUops_10_ctrl_memWrite | oldest_11 & entryUops_11_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrWen = oldest_0 & entryUops_0_ctrl_csrWen | oldest_1 & entryUops_1_ctrl_csrWen | oldest_2
     & entryUops_2_ctrl_csrWen | oldest_3 & entryUops_3_ctrl_csrWen | oldest_4 & entryUops_4_ctrl_csrWen | oldest_5 &
    entryUops_5_ctrl_csrWen | oldest_6 & entryUops_6_ctrl_csrWen | oldest_7 & entryUops_7_ctrl_csrWen | oldest_8 &
    entryUops_8_ctrl_csrWen | oldest_9 & entryUops_9_ctrl_csrWen | oldest_10 & entryUops_10_ctrl_csrWen | oldest_11 &
    entryUops_11_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isBranch = oldest_0 & entryUops_0_ctrl_isBranch | oldest_1 & entryUops_1_ctrl_isBranch |
    oldest_2 & entryUops_2_ctrl_isBranch | oldest_3 & entryUops_3_ctrl_isBranch | oldest_4 & entryUops_4_ctrl_isBranch
     | oldest_5 & entryUops_5_ctrl_isBranch | oldest_6 & entryUops_6_ctrl_isBranch | oldest_7 &
    entryUops_7_ctrl_isBranch | oldest_8 & entryUops_8_ctrl_isBranch | oldest_9 & entryUops_9_ctrl_isBranch | oldest_10
     & entryUops_10_ctrl_isBranch | oldest_11 & entryUops_11_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isJump = oldest_0 & entryUops_0_ctrl_isJump | oldest_1 & entryUops_1_ctrl_isJump | oldest_2
     & entryUops_2_ctrl_isJump | oldest_3 & entryUops_3_ctrl_isJump | oldest_4 & entryUops_4_ctrl_isJump | oldest_5 &
    entryUops_5_ctrl_isJump | oldest_6 & entryUops_6_ctrl_isJump | oldest_7 & entryUops_7_ctrl_isJump | oldest_8 &
    entryUops_8_ctrl_isJump | oldest_9 & entryUops_9_ctrl_isJump | oldest_10 & entryUops_10_ctrl_isJump | oldest_11 &
    entryUops_11_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isPriv = oldest_0 & entryUops_0_ctrl_isPriv | oldest_1 & entryUops_1_ctrl_isPriv | oldest_2
     & entryUops_2_ctrl_isPriv | oldest_3 & entryUops_3_ctrl_isPriv | oldest_4 & entryUops_4_ctrl_isPriv | oldest_5 &
    entryUops_5_ctrl_isPriv | oldest_6 & entryUops_6_ctrl_isPriv | oldest_7 & entryUops_7_ctrl_isPriv | oldest_8 &
    entryUops_8_ctrl_isPriv | oldest_9 & entryUops_9_ctrl_isPriv | oldest_10 & entryUops_10_ctrl_isPriv | oldest_11 &
    entryUops_11_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_excp_excpVec = _io_issue_bits_T_1171 | _io_issue_bits_T_1161; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_imm = _io_issue_bits_T_1148 | _io_issue_bits_T_1138; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_csrAddress = _io_issue_bits_T_1125 | _io_issue_bits_T_1115; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_valid = oldest_0 & entryUops_0_pdInfo_valid | oldest_1 & entryUops_1_pdInfo_valid |
    oldest_2 & entryUops_2_pdInfo_valid | oldest_3 & entryUops_3_pdInfo_valid | oldest_4 & entryUops_4_pdInfo_valid |
    oldest_5 & entryUops_5_pdInfo_valid | oldest_6 & entryUops_6_pdInfo_valid | oldest_7 & entryUops_7_pdInfo_valid |
    oldest_8 & entryUops_8_pdInfo_valid | oldest_9 & entryUops_9_pdInfo_valid | oldest_10 & entryUops_10_pdInfo_valid |
    oldest_11 & entryUops_11_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isBr = oldest_0 & entryUops_0_pdInfo_isBr | oldest_1 & entryUops_1_pdInfo_isBr | oldest_2
     & entryUops_2_pdInfo_isBr | oldest_3 & entryUops_3_pdInfo_isBr | oldest_4 & entryUops_4_pdInfo_isBr | oldest_5 &
    entryUops_5_pdInfo_isBr | oldest_6 & entryUops_6_pdInfo_isBr | oldest_7 & entryUops_7_pdInfo_isBr | oldest_8 &
    entryUops_8_pdInfo_isBr | oldest_9 & entryUops_9_pdInfo_isBr | oldest_10 & entryUops_10_pdInfo_isBr | oldest_11 &
    entryUops_11_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJal = oldest_0 & entryUops_0_pdInfo_isJal | oldest_1 & entryUops_1_pdInfo_isJal |
    oldest_2 & entryUops_2_pdInfo_isJal | oldest_3 & entryUops_3_pdInfo_isJal | oldest_4 & entryUops_4_pdInfo_isJal |
    oldest_5 & entryUops_5_pdInfo_isJal | oldest_6 & entryUops_6_pdInfo_isJal | oldest_7 & entryUops_7_pdInfo_isJal |
    oldest_8 & entryUops_8_pdInfo_isJal | oldest_9 & entryUops_9_pdInfo_isJal | oldest_10 & entryUops_10_pdInfo_isJal |
    oldest_11 & entryUops_11_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJalr = oldest_0 & entryUops_0_pdInfo_isJalr | oldest_1 & entryUops_1_pdInfo_isJalr |
    oldest_2 & entryUops_2_pdInfo_isJalr | oldest_3 & entryUops_3_pdInfo_isJalr | oldest_4 & entryUops_4_pdInfo_isJalr
     | oldest_5 & entryUops_5_pdInfo_isJalr | oldest_6 & entryUops_6_pdInfo_isJalr | oldest_7 &
    entryUops_7_pdInfo_isJalr | oldest_8 & entryUops_8_pdInfo_isJalr | oldest_9 & entryUops_9_pdInfo_isJalr | oldest_10
     & entryUops_10_pdInfo_isJalr | oldest_11 & entryUops_11_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isCall = oldest_0 & entryUops_0_pdInfo_isCall | oldest_1 & entryUops_1_pdInfo_isCall |
    oldest_2 & entryUops_2_pdInfo_isCall | oldest_3 & entryUops_3_pdInfo_isCall | oldest_4 & entryUops_4_pdInfo_isCall
     | oldest_5 & entryUops_5_pdInfo_isCall | oldest_6 & entryUops_6_pdInfo_isCall | oldest_7 &
    entryUops_7_pdInfo_isCall | oldest_8 & entryUops_8_pdInfo_isCall | oldest_9 & entryUops_9_pdInfo_isCall | oldest_10
     & entryUops_10_pdInfo_isCall | oldest_11 & entryUops_11_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isRet = oldest_0 & entryUops_0_pdInfo_isRet | oldest_1 & entryUops_1_pdInfo_isRet |
    oldest_2 & entryUops_2_pdInfo_isRet | oldest_3 & entryUops_3_pdInfo_isRet | oldest_4 & entryUops_4_pdInfo_isRet |
    oldest_5 & entryUops_5_pdInfo_isRet | oldest_6 & entryUops_6_pdInfo_isRet | oldest_7 & entryUops_7_pdInfo_isRet |
    oldest_8 & entryUops_8_pdInfo_isRet | oldest_9 & entryUops_9_pdInfo_isRet | oldest_10 & entryUops_10_pdInfo_isRet |
    oldest_11 & entryUops_11_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_jumpTarget = _io_issue_bits_T_964 | _io_issue_bits_T_954; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_pc = _io_issue_bits_T_941 | _io_issue_bits_T_931; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_fallThrough = _io_issue_bits_T_918 | _io_issue_bits_T_908; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_taken = oldest_0 & entryUops_0_bpuInfo_taken | oldest_1 & entryUops_1_bpuInfo_taken |
    oldest_2 & entryUops_2_bpuInfo_taken | oldest_3 & entryUops_3_bpuInfo_taken | oldest_4 & entryUops_4_bpuInfo_taken
     | oldest_5 & entryUops_5_bpuInfo_taken | oldest_6 & entryUops_6_bpuInfo_taken | oldest_7 &
    entryUops_7_bpuInfo_taken | oldest_8 & entryUops_8_bpuInfo_taken | oldest_9 & entryUops_9_bpuInfo_taken | oldest_10
     & entryUops_10_bpuInfo_taken | oldest_11 & entryUops_11_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_target = _io_issue_bits_T_872 | _io_issue_bits_T_862; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_takenOffset = _io_issue_bits_T_849 | _io_issue_bits_T_839; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_valid = oldest_0 & entryUops_0_bpuInfo_meta_valid | oldest_1 &
    entryUops_1_bpuInfo_meta_valid | oldest_2 & entryUops_2_bpuInfo_meta_valid | oldest_3 &
    entryUops_3_bpuInfo_meta_valid | oldest_4 & entryUops_4_bpuInfo_meta_valid | oldest_5 &
    entryUops_5_bpuInfo_meta_valid | oldest_6 & entryUops_6_bpuInfo_meta_valid | oldest_7 &
    entryUops_7_bpuInfo_meta_valid | oldest_8 & entryUops_8_bpuInfo_meta_valid | oldest_9 &
    entryUops_9_bpuInfo_meta_valid | oldest_10 & entryUops_10_bpuInfo_meta_valid | oldest_11 &
    entryUops_11_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbHit = oldest_0 & entryUops_0_bpuInfo_meta_btbHit | oldest_1 &
    entryUops_1_bpuInfo_meta_btbHit | oldest_2 & entryUops_2_bpuInfo_meta_btbHit | oldest_3 &
    entryUops_3_bpuInfo_meta_btbHit | oldest_4 & entryUops_4_bpuInfo_meta_btbHit | oldest_5 &
    entryUops_5_bpuInfo_meta_btbHit | oldest_6 & entryUops_6_bpuInfo_meta_btbHit | oldest_7 &
    entryUops_7_bpuInfo_meta_btbHit | oldest_8 & entryUops_8_bpuInfo_meta_btbHit | oldest_9 &
    entryUops_9_bpuInfo_meta_btbHit | oldest_10 & entryUops_10_bpuInfo_meta_btbHit | oldest_11 &
    entryUops_11_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsJalr = oldest_0 & entryUops_0_bpuInfo_meta_btbIsJalr | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsJalr | oldest_2 & entryUops_2_bpuInfo_meta_btbIsJalr | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsJalr | oldest_4 & entryUops_4_bpuInfo_meta_btbIsJalr | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsJalr | oldest_6 & entryUops_6_bpuInfo_meta_btbIsJalr | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsJalr | oldest_8 & entryUops_8_bpuInfo_meta_btbIsJalr | oldest_9 &
    entryUops_9_bpuInfo_meta_btbIsJalr | oldest_10 & entryUops_10_bpuInfo_meta_btbIsJalr | oldest_11 &
    entryUops_11_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsJal = oldest_0 & entryUops_0_bpuInfo_meta_btbIsJal | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsJal | oldest_2 & entryUops_2_bpuInfo_meta_btbIsJal | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsJal | oldest_4 & entryUops_4_bpuInfo_meta_btbIsJal | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsJal | oldest_6 & entryUops_6_bpuInfo_meta_btbIsJal | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsJal | oldest_8 & entryUops_8_bpuInfo_meta_btbIsJal | oldest_9 &
    entryUops_9_bpuInfo_meta_btbIsJal | oldest_10 & entryUops_10_bpuInfo_meta_btbIsJal | oldest_11 &
    entryUops_11_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsCall = oldest_0 & entryUops_0_bpuInfo_meta_btbIsCall | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsCall | oldest_2 & entryUops_2_bpuInfo_meta_btbIsCall | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsCall | oldest_4 & entryUops_4_bpuInfo_meta_btbIsCall | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsCall | oldest_6 & entryUops_6_bpuInfo_meta_btbIsCall | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsCall | oldest_8 & entryUops_8_bpuInfo_meta_btbIsCall | oldest_9 &
    entryUops_9_bpuInfo_meta_btbIsCall | oldest_10 & entryUops_10_bpuInfo_meta_btbIsCall | oldest_11 &
    entryUops_11_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbIsRet = oldest_0 & entryUops_0_bpuInfo_meta_btbIsRet | oldest_1 &
    entryUops_1_bpuInfo_meta_btbIsRet | oldest_2 & entryUops_2_bpuInfo_meta_btbIsRet | oldest_3 &
    entryUops_3_bpuInfo_meta_btbIsRet | oldest_4 & entryUops_4_bpuInfo_meta_btbIsRet | oldest_5 &
    entryUops_5_bpuInfo_meta_btbIsRet | oldest_6 & entryUops_6_bpuInfo_meta_btbIsRet | oldest_7 &
    entryUops_7_bpuInfo_meta_btbIsRet | oldest_8 & entryUops_8_bpuInfo_meta_btbIsRet | oldest_9 &
    entryUops_9_bpuInfo_meta_btbIsRet | oldest_10 & entryUops_10_bpuInfo_meta_btbIsRet | oldest_11 &
    entryUops_11_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_btbOffset = _io_issue_bits_T_688 | _io_issue_bits_T_678; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_phtCounter = _io_issue_bits_T_665 | _io_issue_bits_T_655; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_rasTop = _io_issue_bits_T_642 | _io_issue_bits_T_632; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_predTaken = oldest_0 & entryUops_0_bpuInfo_meta_predTaken | oldest_1 &
    entryUops_1_bpuInfo_meta_predTaken | oldest_2 & entryUops_2_bpuInfo_meta_predTaken | oldest_3 &
    entryUops_3_bpuInfo_meta_predTaken | oldest_4 & entryUops_4_bpuInfo_meta_predTaken | oldest_5 &
    entryUops_5_bpuInfo_meta_predTaken | oldest_6 & entryUops_6_bpuInfo_meta_predTaken | oldest_7 &
    entryUops_7_bpuInfo_meta_predTaken | oldest_8 & entryUops_8_bpuInfo_meta_predTaken | oldest_9 &
    entryUops_9_bpuInfo_meta_predTaken | oldest_10 & entryUops_10_bpuInfo_meta_predTaken | oldest_11 &
    entryUops_11_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_bpuInfo_meta_predTarget = _io_issue_bits_T_596 | _io_issue_bits_T_586; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ldst = _io_issue_bits_T_573 | _io_issue_bits_T_563; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs1 = _io_issue_bits_T_550 | _io_issue_bits_T_540; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs2 = _io_issue_bits_T_527 | _io_issue_bits_T_517; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdst = _io_issue_bits_T_504 | _io_issue_bits_T_494; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs1 = _io_issue_bits_T_481 | _io_issue_bits_T_471; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2 = _io_issue_bits_T_458 | _io_issue_bits_T_448; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_oldPdst = _io_issue_bits_T_435 | _io_issue_bits_T_425; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rs1Valid = oldest_0 & entryUops_0_rs1Valid | oldest_1 & entryUops_1_rs1Valid | oldest_2 &
    entryUops_2_rs1Valid | oldest_3 & entryUops_3_rs1Valid | oldest_4 & entryUops_4_rs1Valid | oldest_5 &
    entryUops_5_rs1Valid | oldest_6 & entryUops_6_rs1Valid | oldest_7 & entryUops_7_rs1Valid | oldest_8 &
    entryUops_8_rs1Valid | oldest_9 & entryUops_9_rs1Valid | oldest_10 & entryUops_10_rs1Valid | oldest_11 &
    entryUops_11_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rs2Valid = oldest_0 & entryUops_0_rs2Valid | oldest_1 & entryUops_1_rs2Valid | oldest_2 &
    entryUops_2_rs2Valid | oldest_3 & entryUops_3_rs2Valid | oldest_4 & entryUops_4_rs2Valid | oldest_5 &
    entryUops_5_rs2Valid | oldest_6 & entryUops_6_rs2Valid | oldest_7 & entryUops_7_rs2Valid | oldest_8 &
    entryUops_8_rs2Valid | oldest_9 & entryUops_9_rs2Valid | oldest_10 & entryUops_10_rs2Valid | oldest_11 &
    entryUops_11_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rdValid = oldest_0 & entryUops_0_rdValid | oldest_1 & entryUops_1_rdValid | oldest_2 &
    entryUops_2_rdValid | oldest_3 & entryUops_3_rdValid | oldest_4 & entryUops_4_rdValid | oldest_5 &
    entryUops_5_rdValid | oldest_6 & entryUops_6_rdValid | oldest_7 & entryUops_7_rdValid | oldest_8 &
    entryUops_8_rdValid | oldest_9 & entryUops_9_rdValid | oldest_10 & entryUops_10_rdValid | oldest_11 &
    entryUops_11_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_snptId_valid = oldest_0 & entryUops_0_snptId_valid | oldest_1 & entryUops_1_snptId_valid |
    oldest_2 & entryUops_2_snptId_valid | oldest_3 & entryUops_3_snptId_valid | oldest_4 & entryUops_4_snptId_valid |
    oldest_5 & entryUops_5_snptId_valid | oldest_6 & entryUops_6_snptId_valid | oldest_7 & entryUops_7_snptId_valid |
    oldest_8 & entryUops_8_snptId_valid | oldest_9 & entryUops_9_snptId_valid | oldest_10 & entryUops_10_snptId_valid |
    oldest_11 & entryUops_11_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_snptId_bits = _io_issue_bits_T_320 | _io_issue_bits_T_310; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdx_value = _io_issue_bits_T_297 | _io_issue_bits_T_287; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdx_flag = oldest_0 & entryUops_0_robIdx_flag | oldest_1 & entryUops_1_robIdx_flag | oldest_2
     & entryUops_2_robIdx_flag | oldest_3 & entryUops_3_robIdx_flag | oldest_4 & entryUops_4_robIdx_flag | oldest_5 &
    entryUops_5_robIdx_flag | oldest_6 & entryUops_6_robIdx_flag | oldest_7 & entryUops_7_robIdx_flag | oldest_8 &
    entryUops_8_robIdx_flag | oldest_9 & entryUops_9_robIdx_flag | oldest_10 & entryUops_10_robIdx_flag | oldest_11 &
    entryUops_11_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdxFull_value = _io_issue_bits_T_251 | _io_issue_bits_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdxFull_flag = oldest_0 & entryUops_0_robIdxFull_flag | oldest_1 & entryUops_1_robIdxFull_flag
     | oldest_2 & entryUops_2_robIdxFull_flag | oldest_3 & entryUops_3_robIdxFull_flag | oldest_4 &
    entryUops_4_robIdxFull_flag | oldest_5 & entryUops_5_robIdxFull_flag | oldest_6 & entryUops_6_robIdxFull_flag |
    oldest_7 & entryUops_7_robIdxFull_flag | oldest_8 & entryUops_8_robIdxFull_flag | oldest_9 &
    entryUops_9_robIdxFull_flag | oldest_10 & entryUops_10_robIdxFull_flag | oldest_11 & entryUops_11_robIdxFull_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_issueQueue = _io_issue_bits_T_113 | _io_issue_bits_T_103; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs1Busy = oldest_0 & entryUops_0_prs1Busy | oldest_1 & entryUops_1_prs1Busy | oldest_2 &
    entryUops_2_prs1Busy | oldest_3 & entryUops_3_prs1Busy | oldest_4 & entryUops_4_prs1Busy | oldest_5 &
    entryUops_5_prs1Busy | oldest_6 & entryUops_6_prs1Busy | oldest_7 & entryUops_7_prs1Busy | oldest_8 &
    entryUops_8_prs1Busy | oldest_9 & entryUops_9_prs1Busy | oldest_10 & entryUops_10_prs1Busy | oldest_11 &
    entryUops_11_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2Busy = oldest_0 & entryUops_0_prs2Busy | oldest_1 & entryUops_1_prs2Busy | oldest_2 &
    entryUops_2_prs2Busy | oldest_3 & entryUops_3_prs2Busy | oldest_4 & entryUops_4_prs2Busy | oldest_5 &
    entryUops_5_prs2Busy | oldest_6 & entryUops_6_prs2Busy | oldest_7 & entryUops_7_prs2Busy | oldest_8 &
    entryUops_8_prs2Busy | oldest_9 & entryUops_9_prs2Busy | oldest_10 & entryUops_10_prs2Busy | oldest_11 &
    entryUops_11_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_freeEntries = _io_freeEntries_T_8 + _io_freeEntries_T_18; // @[src/main/scala/backend/scheduler/IssueQueue.scala 232:29]
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
      entryValid_1 <= _GEN_122;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_2 <= _GEN_244;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_3 <= _GEN_366;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_4 <= _GEN_488;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_5 <= _GEN_610;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_6 <= _GEN_732;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_7 <= _GEN_854;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_8 <= _GEN_976;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_9 <= _GEN_1098;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_10) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_10 <= _GEN_1220;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
      entryValid_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:29]
    end else if (killed_11) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 186:27]
      entryValid_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 187:21]
    end else if (_validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 188:39]
      entryValid_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:21]
    end else begin
      entryValid_11 <= _GEN_1342;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_0_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_0_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_1_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_1_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_2_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_2_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_3_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_3_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_4_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_4_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_5_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_5_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_6_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_6_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_7_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_7_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_8_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_8_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_9_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_9_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_10_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_10_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_inst <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_immType <= 4'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_excp_excpVec <= 17'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_excp_excpVec <= io_enq_bits_excp_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_imm <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_csrAddress <= 14'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_pc <= io_enq_bits_bpuInfo_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_fallThrough <= io_enq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_taken <= io_enq_bits_bpuInfo_taken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_target <= io_enq_bits_bpuInfo_target; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_takenOffset <= io_enq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_valid <= io_enq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_btbHit <= io_enq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_btbIsJalr <= io_enq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_btbIsJal <= io_enq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_btbIsCall <= io_enq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_btbIsRet <= io_enq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_btbOffset <= io_enq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_phtCounter <= io_enq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_rasTop <= io_enq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_predTaken <= io_enq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_bpuInfo_meta_predTarget <= io_enq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_ldst <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_lrs1 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_lrs2 <= 5'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_pdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_prs1 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_prs2 <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_oldPdst <= 7'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_rs1Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_rs2Valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_rdValid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_snptId_valid <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_snptId_valid <= io_enq_bits_snptId_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_snptId_bits <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_snptId_bits <= io_enq_bits_snptId_bits; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_robIdx_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_robIdx_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_issueQueue <= 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_prs1Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
      entryUops_11_prs2Busy <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:26]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 207:37]
      entryUops_11_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 208:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_0 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_0 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_0 <= p1Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_1 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_1 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_1 <= p1Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_2 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_2 <= p1Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_3 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_3 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_3 <= p1Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_4 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_4 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_4 <= p1Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_5 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_5 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_5 <= p1Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_6 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_6 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_6 <= p1Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_7 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_7 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_7 <= p1Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_8 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_8 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_8 <= p1Eff_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_9 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_9 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_9 <= p1Eff_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_10 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_10 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_10 <= p1Eff_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
      entryP1Ready_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 48:29]
    end else if (killed_11 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP1Ready_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:23]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP1Ready_11 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 199:23]
    end else begin
      entryP1Ready_11 <= p1Eff_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 202:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_0 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_0 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_0 <= p2Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_1 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_1 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_1 <= p2Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_2 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_2 <= p2Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_3 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_3 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_3 <= p2Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_4 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_4 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_4 <= p2Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_5 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_5 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_5 <= p2Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_6 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_6 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_6 <= p2Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_7 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_7 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_7 <= p2Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_8 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_8 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_8 <= p2Eff_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_9 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_9 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_9 <= p2Eff_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_10 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_10 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_10 <= p2Eff_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
      entryP2Ready_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 49:29]
    end else if (killed_11 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:68]
      entryP2Ready_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:23]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 198:43]
      entryP2Ready_11 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 200:23]
    end else begin
      entryP2Ready_11 <= p2Eff_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 203:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_1 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_1 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_2 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_2 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_3 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_3 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_4 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_4 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_5 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_5 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_6 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_6 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_7 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_7 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_8 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_8 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_9 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_9 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_10 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_10 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_0_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_0 | killed_11 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_0_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_0_11 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_0_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_0 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_0 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_2 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_2 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_3 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_3 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_4 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_4 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_5 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_5 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_6 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_6 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_7 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_7 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_8 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_8 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_9 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_9 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_10 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_10 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_1_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_1 | killed_11 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_1_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_1_11 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_892) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_1_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_0 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_0 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_1 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_1 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_3 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_3 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_4 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_4 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_5 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_5 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_6 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_6 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_7 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_7 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_8 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_8 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_9 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_9 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_10 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_10 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_2_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_2 | killed_11 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_2_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_2_11 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_901) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_2_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_0 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_0 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_1 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_1 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_2 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_2 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_4 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_4 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_5 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_5 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_6 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_6 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_7 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_7 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_8 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_8 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_9 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_9 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_10 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_10 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_3_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_3 | killed_11 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_3_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_3_11 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_910) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_3_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_0 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_0 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_1 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_1 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_2 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_2 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_3 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_3 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_5 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_5 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_6 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_6 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_7 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_7 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_8 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_8 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_9 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_9 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_10 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_10 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_4_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_4 | killed_11 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_4_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_4_11 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_919) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_4_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_0 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_0 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_1 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_1 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_2 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_2 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_3 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_3 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_4 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_4 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_6 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_6 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_7 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_7 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_8 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_8 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_9 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_9 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_10 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_10 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_5_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_5 | killed_11 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_5_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_5_11 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_928) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_5_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_0 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_0 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_1 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_1 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_2 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_2 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_3 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_3 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_4 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_4 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_5 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_5 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_7 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_7 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_8 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_8 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_9 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_9 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_10 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_10 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_6_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_6 | killed_11 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_6_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_6_11 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_937) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_6_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_0 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_0 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_1 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_1 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_2 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_2 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_3 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_3 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_4 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_4 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_5 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_5 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_6 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_6 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_8 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_8 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_9 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_9 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_10 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_10 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_7_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_7 | killed_11 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_7_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_7_11 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_946) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_7_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_0 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_0 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_1 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_1 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_2 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_2 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_3 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_3 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_4 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_4 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_5 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_5 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_6 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_6 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_7 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_7 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_9 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_9 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_10 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_10 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_8_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_8 | killed_11 | _validAfterKillGrant_8_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_8_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_8_11 <= validAfterKillGrant_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_955) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_8_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_0 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_0 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_1 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_1 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_2 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_2 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_3 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_3 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_4 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_4 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_5 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_5 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_6 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_6 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_7 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_7 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_8 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_8 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_10 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_10 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_9_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_9 | killed_11 | _validAfterKillGrant_9_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_9_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_9_11 <= validAfterKillGrant_9; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_964) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_9_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_0 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_0 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_1 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_1 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_2 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_2 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_3 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_3 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_4 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_4 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_5 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_5 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_6 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_6 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_7 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_7 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_8 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_8 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_9 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_9 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_10_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_10 | killed_11 | _validAfterKillGrant_10_T_2 | _validAfterKillGrant_11_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_10_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'hb) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_10_11 <= validAfterKillGrant_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_973) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_10_11 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_0 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (_T_878) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_0 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_1 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_1 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_2 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_2 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_3 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_3 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_4 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_4 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_5 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_5 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_6 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_6 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_7 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_7 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_8 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_8_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h8) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_8 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_8 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_9 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_9_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'h9) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_9 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_9 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
      age_11_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 54:20]
    end else if (killed_11 | killed_10 | _validAfterKillGrant_11_T_2 | _validAfterKillGrant_10_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 216:96]
      age_11_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 217:19]
    end else if (enqFire & enqIdx == 4'ha) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 218:45]
      age_11_10 <= validAfterKillGrant_11; // @[src/main/scala/backend/scheduler/IssueQueue.scala 220:19]
    end else if (_T_982) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 221:45]
      age_11_10 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 223:19]
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
  entryValid_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  entryValid_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  entryValid_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  entryValid_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  entryUops_0_pc = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  entryUops_0_inst = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  entryUops_0_ctrl_fuType = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  entryUops_0_ctrl_aluOp = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  entryUops_0_ctrl_bruOp = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  entryUops_0_ctrl_lsuOp = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  entryUops_0_ctrl_csrOp = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  entryUops_0_ctrl_mulOp = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  entryUops_0_ctrl_divOp = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  entryUops_0_ctrl_src1Type = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  entryUops_0_ctrl_src2Type = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  entryUops_0_ctrl_immType = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  entryUops_0_ctrl_rfWen = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entryUops_0_ctrl_memRead = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entryUops_0_ctrl_memWrite = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  entryUops_0_ctrl_csrWen = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  entryUops_0_ctrl_isBranch = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  entryUops_0_ctrl_isJump = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  entryUops_0_ctrl_isPriv = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entryUops_0_excp_excpVec = _RAND_31[16:0];
  _RAND_32 = {1{`RANDOM}};
  entryUops_0_imm = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  entryUops_0_csrAddress = _RAND_33[13:0];
  _RAND_34 = {1{`RANDOM}};
  entryUops_0_pdInfo_valid = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  entryUops_0_pdInfo_isBr = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  entryUops_0_pdInfo_isJal = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  entryUops_0_pdInfo_isJalr = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  entryUops_0_pdInfo_isCall = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  entryUops_0_pdInfo_isRet = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  entryUops_0_pdInfo_jumpTarget = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  entryUops_0_bpuInfo_pc = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  entryUops_0_bpuInfo_fallThrough = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  entryUops_0_bpuInfo_taken = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  entryUops_0_bpuInfo_target = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  entryUops_0_bpuInfo_takenOffset = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_valid = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbHit = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsJalr = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsJal = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsCall = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbIsRet = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_btbOffset = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_phtCounter = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_rasTop = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_predTaken = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  entryUops_0_bpuInfo_meta_predTarget = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  entryUops_0_ldst = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  entryUops_0_lrs1 = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  entryUops_0_lrs2 = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  entryUops_0_pdst = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  entryUops_0_prs1 = _RAND_61[6:0];
  _RAND_62 = {1{`RANDOM}};
  entryUops_0_prs2 = _RAND_62[6:0];
  _RAND_63 = {1{`RANDOM}};
  entryUops_0_oldPdst = _RAND_63[6:0];
  _RAND_64 = {1{`RANDOM}};
  entryUops_0_rs1Valid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  entryUops_0_rs2Valid = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  entryUops_0_rdValid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  entryUops_0_snptId_valid = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  entryUops_0_snptId_bits = _RAND_68[2:0];
  _RAND_69 = {1{`RANDOM}};
  entryUops_0_robIdx_value = _RAND_69[5:0];
  _RAND_70 = {1{`RANDOM}};
  entryUops_0_robIdx_flag = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  entryUops_0_robIdxFull_value = _RAND_71[5:0];
  _RAND_72 = {1{`RANDOM}};
  entryUops_0_robIdxFull_flag = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  entryUops_0_issueQueue = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  entryUops_0_prs1Busy = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  entryUops_0_prs2Busy = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  entryUops_1_pc = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  entryUops_1_inst = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  entryUops_1_ctrl_fuType = _RAND_78[3:0];
  _RAND_79 = {1{`RANDOM}};
  entryUops_1_ctrl_aluOp = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  entryUops_1_ctrl_bruOp = _RAND_80[3:0];
  _RAND_81 = {1{`RANDOM}};
  entryUops_1_ctrl_lsuOp = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  entryUops_1_ctrl_csrOp = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  entryUops_1_ctrl_mulOp = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  entryUops_1_ctrl_divOp = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  entryUops_1_ctrl_src1Type = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  entryUops_1_ctrl_src2Type = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  entryUops_1_ctrl_immType = _RAND_87[3:0];
  _RAND_88 = {1{`RANDOM}};
  entryUops_1_ctrl_rfWen = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  entryUops_1_ctrl_memRead = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  entryUops_1_ctrl_memWrite = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  entryUops_1_ctrl_csrWen = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  entryUops_1_ctrl_isBranch = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  entryUops_1_ctrl_isJump = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  entryUops_1_ctrl_isPriv = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  entryUops_1_excp_excpVec = _RAND_95[16:0];
  _RAND_96 = {1{`RANDOM}};
  entryUops_1_imm = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  entryUops_1_csrAddress = _RAND_97[13:0];
  _RAND_98 = {1{`RANDOM}};
  entryUops_1_pdInfo_valid = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  entryUops_1_pdInfo_isBr = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  entryUops_1_pdInfo_isJal = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  entryUops_1_pdInfo_isJalr = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  entryUops_1_pdInfo_isCall = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  entryUops_1_pdInfo_isRet = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  entryUops_1_pdInfo_jumpTarget = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  entryUops_1_bpuInfo_pc = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  entryUops_1_bpuInfo_fallThrough = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  entryUops_1_bpuInfo_taken = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  entryUops_1_bpuInfo_target = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  entryUops_1_bpuInfo_takenOffset = _RAND_109[1:0];
  _RAND_110 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_valid = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbHit = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsJalr = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsJal = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsCall = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbIsRet = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_btbOffset = _RAND_116[1:0];
  _RAND_117 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_phtCounter = _RAND_117[1:0];
  _RAND_118 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_rasTop = _RAND_118[2:0];
  _RAND_119 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_predTaken = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  entryUops_1_bpuInfo_meta_predTarget = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  entryUops_1_ldst = _RAND_121[4:0];
  _RAND_122 = {1{`RANDOM}};
  entryUops_1_lrs1 = _RAND_122[4:0];
  _RAND_123 = {1{`RANDOM}};
  entryUops_1_lrs2 = _RAND_123[4:0];
  _RAND_124 = {1{`RANDOM}};
  entryUops_1_pdst = _RAND_124[6:0];
  _RAND_125 = {1{`RANDOM}};
  entryUops_1_prs1 = _RAND_125[6:0];
  _RAND_126 = {1{`RANDOM}};
  entryUops_1_prs2 = _RAND_126[6:0];
  _RAND_127 = {1{`RANDOM}};
  entryUops_1_oldPdst = _RAND_127[6:0];
  _RAND_128 = {1{`RANDOM}};
  entryUops_1_rs1Valid = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  entryUops_1_rs2Valid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  entryUops_1_rdValid = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entryUops_1_snptId_valid = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  entryUops_1_snptId_bits = _RAND_132[2:0];
  _RAND_133 = {1{`RANDOM}};
  entryUops_1_robIdx_value = _RAND_133[5:0];
  _RAND_134 = {1{`RANDOM}};
  entryUops_1_robIdx_flag = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  entryUops_1_robIdxFull_value = _RAND_135[5:0];
  _RAND_136 = {1{`RANDOM}};
  entryUops_1_robIdxFull_flag = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  entryUops_1_issueQueue = _RAND_137[2:0];
  _RAND_138 = {1{`RANDOM}};
  entryUops_1_prs1Busy = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  entryUops_1_prs2Busy = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  entryUops_2_pc = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  entryUops_2_inst = _RAND_141[31:0];
  _RAND_142 = {1{`RANDOM}};
  entryUops_2_ctrl_fuType = _RAND_142[3:0];
  _RAND_143 = {1{`RANDOM}};
  entryUops_2_ctrl_aluOp = _RAND_143[4:0];
  _RAND_144 = {1{`RANDOM}};
  entryUops_2_ctrl_bruOp = _RAND_144[3:0];
  _RAND_145 = {1{`RANDOM}};
  entryUops_2_ctrl_lsuOp = _RAND_145[3:0];
  _RAND_146 = {1{`RANDOM}};
  entryUops_2_ctrl_csrOp = _RAND_146[2:0];
  _RAND_147 = {1{`RANDOM}};
  entryUops_2_ctrl_mulOp = _RAND_147[2:0];
  _RAND_148 = {1{`RANDOM}};
  entryUops_2_ctrl_divOp = _RAND_148[2:0];
  _RAND_149 = {1{`RANDOM}};
  entryUops_2_ctrl_src1Type = _RAND_149[2:0];
  _RAND_150 = {1{`RANDOM}};
  entryUops_2_ctrl_src2Type = _RAND_150[2:0];
  _RAND_151 = {1{`RANDOM}};
  entryUops_2_ctrl_immType = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  entryUops_2_ctrl_rfWen = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  entryUops_2_ctrl_memRead = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  entryUops_2_ctrl_memWrite = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  entryUops_2_ctrl_csrWen = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  entryUops_2_ctrl_isBranch = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  entryUops_2_ctrl_isJump = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  entryUops_2_ctrl_isPriv = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  entryUops_2_excp_excpVec = _RAND_159[16:0];
  _RAND_160 = {1{`RANDOM}};
  entryUops_2_imm = _RAND_160[31:0];
  _RAND_161 = {1{`RANDOM}};
  entryUops_2_csrAddress = _RAND_161[13:0];
  _RAND_162 = {1{`RANDOM}};
  entryUops_2_pdInfo_valid = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  entryUops_2_pdInfo_isBr = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  entryUops_2_pdInfo_isJal = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  entryUops_2_pdInfo_isJalr = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  entryUops_2_pdInfo_isCall = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  entryUops_2_pdInfo_isRet = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  entryUops_2_pdInfo_jumpTarget = _RAND_168[31:0];
  _RAND_169 = {1{`RANDOM}};
  entryUops_2_bpuInfo_pc = _RAND_169[31:0];
  _RAND_170 = {1{`RANDOM}};
  entryUops_2_bpuInfo_fallThrough = _RAND_170[31:0];
  _RAND_171 = {1{`RANDOM}};
  entryUops_2_bpuInfo_taken = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  entryUops_2_bpuInfo_target = _RAND_172[31:0];
  _RAND_173 = {1{`RANDOM}};
  entryUops_2_bpuInfo_takenOffset = _RAND_173[1:0];
  _RAND_174 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_valid = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbHit = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsJalr = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsJal = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsCall = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbIsRet = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_btbOffset = _RAND_180[1:0];
  _RAND_181 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_phtCounter = _RAND_181[1:0];
  _RAND_182 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_rasTop = _RAND_182[2:0];
  _RAND_183 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_predTaken = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  entryUops_2_bpuInfo_meta_predTarget = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  entryUops_2_ldst = _RAND_185[4:0];
  _RAND_186 = {1{`RANDOM}};
  entryUops_2_lrs1 = _RAND_186[4:0];
  _RAND_187 = {1{`RANDOM}};
  entryUops_2_lrs2 = _RAND_187[4:0];
  _RAND_188 = {1{`RANDOM}};
  entryUops_2_pdst = _RAND_188[6:0];
  _RAND_189 = {1{`RANDOM}};
  entryUops_2_prs1 = _RAND_189[6:0];
  _RAND_190 = {1{`RANDOM}};
  entryUops_2_prs2 = _RAND_190[6:0];
  _RAND_191 = {1{`RANDOM}};
  entryUops_2_oldPdst = _RAND_191[6:0];
  _RAND_192 = {1{`RANDOM}};
  entryUops_2_rs1Valid = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  entryUops_2_rs2Valid = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  entryUops_2_rdValid = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  entryUops_2_snptId_valid = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  entryUops_2_snptId_bits = _RAND_196[2:0];
  _RAND_197 = {1{`RANDOM}};
  entryUops_2_robIdx_value = _RAND_197[5:0];
  _RAND_198 = {1{`RANDOM}};
  entryUops_2_robIdx_flag = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  entryUops_2_robIdxFull_value = _RAND_199[5:0];
  _RAND_200 = {1{`RANDOM}};
  entryUops_2_robIdxFull_flag = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  entryUops_2_issueQueue = _RAND_201[2:0];
  _RAND_202 = {1{`RANDOM}};
  entryUops_2_prs1Busy = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  entryUops_2_prs2Busy = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  entryUops_3_pc = _RAND_204[31:0];
  _RAND_205 = {1{`RANDOM}};
  entryUops_3_inst = _RAND_205[31:0];
  _RAND_206 = {1{`RANDOM}};
  entryUops_3_ctrl_fuType = _RAND_206[3:0];
  _RAND_207 = {1{`RANDOM}};
  entryUops_3_ctrl_aluOp = _RAND_207[4:0];
  _RAND_208 = {1{`RANDOM}};
  entryUops_3_ctrl_bruOp = _RAND_208[3:0];
  _RAND_209 = {1{`RANDOM}};
  entryUops_3_ctrl_lsuOp = _RAND_209[3:0];
  _RAND_210 = {1{`RANDOM}};
  entryUops_3_ctrl_csrOp = _RAND_210[2:0];
  _RAND_211 = {1{`RANDOM}};
  entryUops_3_ctrl_mulOp = _RAND_211[2:0];
  _RAND_212 = {1{`RANDOM}};
  entryUops_3_ctrl_divOp = _RAND_212[2:0];
  _RAND_213 = {1{`RANDOM}};
  entryUops_3_ctrl_src1Type = _RAND_213[2:0];
  _RAND_214 = {1{`RANDOM}};
  entryUops_3_ctrl_src2Type = _RAND_214[2:0];
  _RAND_215 = {1{`RANDOM}};
  entryUops_3_ctrl_immType = _RAND_215[3:0];
  _RAND_216 = {1{`RANDOM}};
  entryUops_3_ctrl_rfWen = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  entryUops_3_ctrl_memRead = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  entryUops_3_ctrl_memWrite = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  entryUops_3_ctrl_csrWen = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  entryUops_3_ctrl_isBranch = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  entryUops_3_ctrl_isJump = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  entryUops_3_ctrl_isPriv = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  entryUops_3_excp_excpVec = _RAND_223[16:0];
  _RAND_224 = {1{`RANDOM}};
  entryUops_3_imm = _RAND_224[31:0];
  _RAND_225 = {1{`RANDOM}};
  entryUops_3_csrAddress = _RAND_225[13:0];
  _RAND_226 = {1{`RANDOM}};
  entryUops_3_pdInfo_valid = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  entryUops_3_pdInfo_isBr = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  entryUops_3_pdInfo_isJal = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  entryUops_3_pdInfo_isJalr = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  entryUops_3_pdInfo_isCall = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  entryUops_3_pdInfo_isRet = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  entryUops_3_pdInfo_jumpTarget = _RAND_232[31:0];
  _RAND_233 = {1{`RANDOM}};
  entryUops_3_bpuInfo_pc = _RAND_233[31:0];
  _RAND_234 = {1{`RANDOM}};
  entryUops_3_bpuInfo_fallThrough = _RAND_234[31:0];
  _RAND_235 = {1{`RANDOM}};
  entryUops_3_bpuInfo_taken = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  entryUops_3_bpuInfo_target = _RAND_236[31:0];
  _RAND_237 = {1{`RANDOM}};
  entryUops_3_bpuInfo_takenOffset = _RAND_237[1:0];
  _RAND_238 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_valid = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbHit = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsJalr = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsJal = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsCall = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbIsRet = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_btbOffset = _RAND_244[1:0];
  _RAND_245 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_phtCounter = _RAND_245[1:0];
  _RAND_246 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_rasTop = _RAND_246[2:0];
  _RAND_247 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_predTaken = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  entryUops_3_bpuInfo_meta_predTarget = _RAND_248[31:0];
  _RAND_249 = {1{`RANDOM}};
  entryUops_3_ldst = _RAND_249[4:0];
  _RAND_250 = {1{`RANDOM}};
  entryUops_3_lrs1 = _RAND_250[4:0];
  _RAND_251 = {1{`RANDOM}};
  entryUops_3_lrs2 = _RAND_251[4:0];
  _RAND_252 = {1{`RANDOM}};
  entryUops_3_pdst = _RAND_252[6:0];
  _RAND_253 = {1{`RANDOM}};
  entryUops_3_prs1 = _RAND_253[6:0];
  _RAND_254 = {1{`RANDOM}};
  entryUops_3_prs2 = _RAND_254[6:0];
  _RAND_255 = {1{`RANDOM}};
  entryUops_3_oldPdst = _RAND_255[6:0];
  _RAND_256 = {1{`RANDOM}};
  entryUops_3_rs1Valid = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  entryUops_3_rs2Valid = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  entryUops_3_rdValid = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  entryUops_3_snptId_valid = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  entryUops_3_snptId_bits = _RAND_260[2:0];
  _RAND_261 = {1{`RANDOM}};
  entryUops_3_robIdx_value = _RAND_261[5:0];
  _RAND_262 = {1{`RANDOM}};
  entryUops_3_robIdx_flag = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  entryUops_3_robIdxFull_value = _RAND_263[5:0];
  _RAND_264 = {1{`RANDOM}};
  entryUops_3_robIdxFull_flag = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  entryUops_3_issueQueue = _RAND_265[2:0];
  _RAND_266 = {1{`RANDOM}};
  entryUops_3_prs1Busy = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  entryUops_3_prs2Busy = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  entryUops_4_pc = _RAND_268[31:0];
  _RAND_269 = {1{`RANDOM}};
  entryUops_4_inst = _RAND_269[31:0];
  _RAND_270 = {1{`RANDOM}};
  entryUops_4_ctrl_fuType = _RAND_270[3:0];
  _RAND_271 = {1{`RANDOM}};
  entryUops_4_ctrl_aluOp = _RAND_271[4:0];
  _RAND_272 = {1{`RANDOM}};
  entryUops_4_ctrl_bruOp = _RAND_272[3:0];
  _RAND_273 = {1{`RANDOM}};
  entryUops_4_ctrl_lsuOp = _RAND_273[3:0];
  _RAND_274 = {1{`RANDOM}};
  entryUops_4_ctrl_csrOp = _RAND_274[2:0];
  _RAND_275 = {1{`RANDOM}};
  entryUops_4_ctrl_mulOp = _RAND_275[2:0];
  _RAND_276 = {1{`RANDOM}};
  entryUops_4_ctrl_divOp = _RAND_276[2:0];
  _RAND_277 = {1{`RANDOM}};
  entryUops_4_ctrl_src1Type = _RAND_277[2:0];
  _RAND_278 = {1{`RANDOM}};
  entryUops_4_ctrl_src2Type = _RAND_278[2:0];
  _RAND_279 = {1{`RANDOM}};
  entryUops_4_ctrl_immType = _RAND_279[3:0];
  _RAND_280 = {1{`RANDOM}};
  entryUops_4_ctrl_rfWen = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  entryUops_4_ctrl_memRead = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  entryUops_4_ctrl_memWrite = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  entryUops_4_ctrl_csrWen = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  entryUops_4_ctrl_isBranch = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  entryUops_4_ctrl_isJump = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  entryUops_4_ctrl_isPriv = _RAND_286[0:0];
  _RAND_287 = {1{`RANDOM}};
  entryUops_4_excp_excpVec = _RAND_287[16:0];
  _RAND_288 = {1{`RANDOM}};
  entryUops_4_imm = _RAND_288[31:0];
  _RAND_289 = {1{`RANDOM}};
  entryUops_4_csrAddress = _RAND_289[13:0];
  _RAND_290 = {1{`RANDOM}};
  entryUops_4_pdInfo_valid = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  entryUops_4_pdInfo_isBr = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  entryUops_4_pdInfo_isJal = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  entryUops_4_pdInfo_isJalr = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  entryUops_4_pdInfo_isCall = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  entryUops_4_pdInfo_isRet = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  entryUops_4_pdInfo_jumpTarget = _RAND_296[31:0];
  _RAND_297 = {1{`RANDOM}};
  entryUops_4_bpuInfo_pc = _RAND_297[31:0];
  _RAND_298 = {1{`RANDOM}};
  entryUops_4_bpuInfo_fallThrough = _RAND_298[31:0];
  _RAND_299 = {1{`RANDOM}};
  entryUops_4_bpuInfo_taken = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  entryUops_4_bpuInfo_target = _RAND_300[31:0];
  _RAND_301 = {1{`RANDOM}};
  entryUops_4_bpuInfo_takenOffset = _RAND_301[1:0];
  _RAND_302 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_valid = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbHit = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsJalr = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsJal = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsCall = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbIsRet = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_btbOffset = _RAND_308[1:0];
  _RAND_309 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_phtCounter = _RAND_309[1:0];
  _RAND_310 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_rasTop = _RAND_310[2:0];
  _RAND_311 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_predTaken = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  entryUops_4_bpuInfo_meta_predTarget = _RAND_312[31:0];
  _RAND_313 = {1{`RANDOM}};
  entryUops_4_ldst = _RAND_313[4:0];
  _RAND_314 = {1{`RANDOM}};
  entryUops_4_lrs1 = _RAND_314[4:0];
  _RAND_315 = {1{`RANDOM}};
  entryUops_4_lrs2 = _RAND_315[4:0];
  _RAND_316 = {1{`RANDOM}};
  entryUops_4_pdst = _RAND_316[6:0];
  _RAND_317 = {1{`RANDOM}};
  entryUops_4_prs1 = _RAND_317[6:0];
  _RAND_318 = {1{`RANDOM}};
  entryUops_4_prs2 = _RAND_318[6:0];
  _RAND_319 = {1{`RANDOM}};
  entryUops_4_oldPdst = _RAND_319[6:0];
  _RAND_320 = {1{`RANDOM}};
  entryUops_4_rs1Valid = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  entryUops_4_rs2Valid = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  entryUops_4_rdValid = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  entryUops_4_snptId_valid = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  entryUops_4_snptId_bits = _RAND_324[2:0];
  _RAND_325 = {1{`RANDOM}};
  entryUops_4_robIdx_value = _RAND_325[5:0];
  _RAND_326 = {1{`RANDOM}};
  entryUops_4_robIdx_flag = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  entryUops_4_robIdxFull_value = _RAND_327[5:0];
  _RAND_328 = {1{`RANDOM}};
  entryUops_4_robIdxFull_flag = _RAND_328[0:0];
  _RAND_329 = {1{`RANDOM}};
  entryUops_4_issueQueue = _RAND_329[2:0];
  _RAND_330 = {1{`RANDOM}};
  entryUops_4_prs1Busy = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  entryUops_4_prs2Busy = _RAND_331[0:0];
  _RAND_332 = {1{`RANDOM}};
  entryUops_5_pc = _RAND_332[31:0];
  _RAND_333 = {1{`RANDOM}};
  entryUops_5_inst = _RAND_333[31:0];
  _RAND_334 = {1{`RANDOM}};
  entryUops_5_ctrl_fuType = _RAND_334[3:0];
  _RAND_335 = {1{`RANDOM}};
  entryUops_5_ctrl_aluOp = _RAND_335[4:0];
  _RAND_336 = {1{`RANDOM}};
  entryUops_5_ctrl_bruOp = _RAND_336[3:0];
  _RAND_337 = {1{`RANDOM}};
  entryUops_5_ctrl_lsuOp = _RAND_337[3:0];
  _RAND_338 = {1{`RANDOM}};
  entryUops_5_ctrl_csrOp = _RAND_338[2:0];
  _RAND_339 = {1{`RANDOM}};
  entryUops_5_ctrl_mulOp = _RAND_339[2:0];
  _RAND_340 = {1{`RANDOM}};
  entryUops_5_ctrl_divOp = _RAND_340[2:0];
  _RAND_341 = {1{`RANDOM}};
  entryUops_5_ctrl_src1Type = _RAND_341[2:0];
  _RAND_342 = {1{`RANDOM}};
  entryUops_5_ctrl_src2Type = _RAND_342[2:0];
  _RAND_343 = {1{`RANDOM}};
  entryUops_5_ctrl_immType = _RAND_343[3:0];
  _RAND_344 = {1{`RANDOM}};
  entryUops_5_ctrl_rfWen = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  entryUops_5_ctrl_memRead = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  entryUops_5_ctrl_memWrite = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  entryUops_5_ctrl_csrWen = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  entryUops_5_ctrl_isBranch = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  entryUops_5_ctrl_isJump = _RAND_349[0:0];
  _RAND_350 = {1{`RANDOM}};
  entryUops_5_ctrl_isPriv = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  entryUops_5_excp_excpVec = _RAND_351[16:0];
  _RAND_352 = {1{`RANDOM}};
  entryUops_5_imm = _RAND_352[31:0];
  _RAND_353 = {1{`RANDOM}};
  entryUops_5_csrAddress = _RAND_353[13:0];
  _RAND_354 = {1{`RANDOM}};
  entryUops_5_pdInfo_valid = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  entryUops_5_pdInfo_isBr = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  entryUops_5_pdInfo_isJal = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  entryUops_5_pdInfo_isJalr = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  entryUops_5_pdInfo_isCall = _RAND_358[0:0];
  _RAND_359 = {1{`RANDOM}};
  entryUops_5_pdInfo_isRet = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  entryUops_5_pdInfo_jumpTarget = _RAND_360[31:0];
  _RAND_361 = {1{`RANDOM}};
  entryUops_5_bpuInfo_pc = _RAND_361[31:0];
  _RAND_362 = {1{`RANDOM}};
  entryUops_5_bpuInfo_fallThrough = _RAND_362[31:0];
  _RAND_363 = {1{`RANDOM}};
  entryUops_5_bpuInfo_taken = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  entryUops_5_bpuInfo_target = _RAND_364[31:0];
  _RAND_365 = {1{`RANDOM}};
  entryUops_5_bpuInfo_takenOffset = _RAND_365[1:0];
  _RAND_366 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_valid = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbHit = _RAND_367[0:0];
  _RAND_368 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsJalr = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsJal = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsCall = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbIsRet = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_btbOffset = _RAND_372[1:0];
  _RAND_373 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_phtCounter = _RAND_373[1:0];
  _RAND_374 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_rasTop = _RAND_374[2:0];
  _RAND_375 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_predTaken = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  entryUops_5_bpuInfo_meta_predTarget = _RAND_376[31:0];
  _RAND_377 = {1{`RANDOM}};
  entryUops_5_ldst = _RAND_377[4:0];
  _RAND_378 = {1{`RANDOM}};
  entryUops_5_lrs1 = _RAND_378[4:0];
  _RAND_379 = {1{`RANDOM}};
  entryUops_5_lrs2 = _RAND_379[4:0];
  _RAND_380 = {1{`RANDOM}};
  entryUops_5_pdst = _RAND_380[6:0];
  _RAND_381 = {1{`RANDOM}};
  entryUops_5_prs1 = _RAND_381[6:0];
  _RAND_382 = {1{`RANDOM}};
  entryUops_5_prs2 = _RAND_382[6:0];
  _RAND_383 = {1{`RANDOM}};
  entryUops_5_oldPdst = _RAND_383[6:0];
  _RAND_384 = {1{`RANDOM}};
  entryUops_5_rs1Valid = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  entryUops_5_rs2Valid = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  entryUops_5_rdValid = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  entryUops_5_snptId_valid = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  entryUops_5_snptId_bits = _RAND_388[2:0];
  _RAND_389 = {1{`RANDOM}};
  entryUops_5_robIdx_value = _RAND_389[5:0];
  _RAND_390 = {1{`RANDOM}};
  entryUops_5_robIdx_flag = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  entryUops_5_robIdxFull_value = _RAND_391[5:0];
  _RAND_392 = {1{`RANDOM}};
  entryUops_5_robIdxFull_flag = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  entryUops_5_issueQueue = _RAND_393[2:0];
  _RAND_394 = {1{`RANDOM}};
  entryUops_5_prs1Busy = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  entryUops_5_prs2Busy = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  entryUops_6_pc = _RAND_396[31:0];
  _RAND_397 = {1{`RANDOM}};
  entryUops_6_inst = _RAND_397[31:0];
  _RAND_398 = {1{`RANDOM}};
  entryUops_6_ctrl_fuType = _RAND_398[3:0];
  _RAND_399 = {1{`RANDOM}};
  entryUops_6_ctrl_aluOp = _RAND_399[4:0];
  _RAND_400 = {1{`RANDOM}};
  entryUops_6_ctrl_bruOp = _RAND_400[3:0];
  _RAND_401 = {1{`RANDOM}};
  entryUops_6_ctrl_lsuOp = _RAND_401[3:0];
  _RAND_402 = {1{`RANDOM}};
  entryUops_6_ctrl_csrOp = _RAND_402[2:0];
  _RAND_403 = {1{`RANDOM}};
  entryUops_6_ctrl_mulOp = _RAND_403[2:0];
  _RAND_404 = {1{`RANDOM}};
  entryUops_6_ctrl_divOp = _RAND_404[2:0];
  _RAND_405 = {1{`RANDOM}};
  entryUops_6_ctrl_src1Type = _RAND_405[2:0];
  _RAND_406 = {1{`RANDOM}};
  entryUops_6_ctrl_src2Type = _RAND_406[2:0];
  _RAND_407 = {1{`RANDOM}};
  entryUops_6_ctrl_immType = _RAND_407[3:0];
  _RAND_408 = {1{`RANDOM}};
  entryUops_6_ctrl_rfWen = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  entryUops_6_ctrl_memRead = _RAND_409[0:0];
  _RAND_410 = {1{`RANDOM}};
  entryUops_6_ctrl_memWrite = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  entryUops_6_ctrl_csrWen = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  entryUops_6_ctrl_isBranch = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  entryUops_6_ctrl_isJump = _RAND_413[0:0];
  _RAND_414 = {1{`RANDOM}};
  entryUops_6_ctrl_isPriv = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  entryUops_6_excp_excpVec = _RAND_415[16:0];
  _RAND_416 = {1{`RANDOM}};
  entryUops_6_imm = _RAND_416[31:0];
  _RAND_417 = {1{`RANDOM}};
  entryUops_6_csrAddress = _RAND_417[13:0];
  _RAND_418 = {1{`RANDOM}};
  entryUops_6_pdInfo_valid = _RAND_418[0:0];
  _RAND_419 = {1{`RANDOM}};
  entryUops_6_pdInfo_isBr = _RAND_419[0:0];
  _RAND_420 = {1{`RANDOM}};
  entryUops_6_pdInfo_isJal = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  entryUops_6_pdInfo_isJalr = _RAND_421[0:0];
  _RAND_422 = {1{`RANDOM}};
  entryUops_6_pdInfo_isCall = _RAND_422[0:0];
  _RAND_423 = {1{`RANDOM}};
  entryUops_6_pdInfo_isRet = _RAND_423[0:0];
  _RAND_424 = {1{`RANDOM}};
  entryUops_6_pdInfo_jumpTarget = _RAND_424[31:0];
  _RAND_425 = {1{`RANDOM}};
  entryUops_6_bpuInfo_pc = _RAND_425[31:0];
  _RAND_426 = {1{`RANDOM}};
  entryUops_6_bpuInfo_fallThrough = _RAND_426[31:0];
  _RAND_427 = {1{`RANDOM}};
  entryUops_6_bpuInfo_taken = _RAND_427[0:0];
  _RAND_428 = {1{`RANDOM}};
  entryUops_6_bpuInfo_target = _RAND_428[31:0];
  _RAND_429 = {1{`RANDOM}};
  entryUops_6_bpuInfo_takenOffset = _RAND_429[1:0];
  _RAND_430 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_valid = _RAND_430[0:0];
  _RAND_431 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbHit = _RAND_431[0:0];
  _RAND_432 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsJalr = _RAND_432[0:0];
  _RAND_433 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsJal = _RAND_433[0:0];
  _RAND_434 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsCall = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbIsRet = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_btbOffset = _RAND_436[1:0];
  _RAND_437 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_phtCounter = _RAND_437[1:0];
  _RAND_438 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_rasTop = _RAND_438[2:0];
  _RAND_439 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_predTaken = _RAND_439[0:0];
  _RAND_440 = {1{`RANDOM}};
  entryUops_6_bpuInfo_meta_predTarget = _RAND_440[31:0];
  _RAND_441 = {1{`RANDOM}};
  entryUops_6_ldst = _RAND_441[4:0];
  _RAND_442 = {1{`RANDOM}};
  entryUops_6_lrs1 = _RAND_442[4:0];
  _RAND_443 = {1{`RANDOM}};
  entryUops_6_lrs2 = _RAND_443[4:0];
  _RAND_444 = {1{`RANDOM}};
  entryUops_6_pdst = _RAND_444[6:0];
  _RAND_445 = {1{`RANDOM}};
  entryUops_6_prs1 = _RAND_445[6:0];
  _RAND_446 = {1{`RANDOM}};
  entryUops_6_prs2 = _RAND_446[6:0];
  _RAND_447 = {1{`RANDOM}};
  entryUops_6_oldPdst = _RAND_447[6:0];
  _RAND_448 = {1{`RANDOM}};
  entryUops_6_rs1Valid = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  entryUops_6_rs2Valid = _RAND_449[0:0];
  _RAND_450 = {1{`RANDOM}};
  entryUops_6_rdValid = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  entryUops_6_snptId_valid = _RAND_451[0:0];
  _RAND_452 = {1{`RANDOM}};
  entryUops_6_snptId_bits = _RAND_452[2:0];
  _RAND_453 = {1{`RANDOM}};
  entryUops_6_robIdx_value = _RAND_453[5:0];
  _RAND_454 = {1{`RANDOM}};
  entryUops_6_robIdx_flag = _RAND_454[0:0];
  _RAND_455 = {1{`RANDOM}};
  entryUops_6_robIdxFull_value = _RAND_455[5:0];
  _RAND_456 = {1{`RANDOM}};
  entryUops_6_robIdxFull_flag = _RAND_456[0:0];
  _RAND_457 = {1{`RANDOM}};
  entryUops_6_issueQueue = _RAND_457[2:0];
  _RAND_458 = {1{`RANDOM}};
  entryUops_6_prs1Busy = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  entryUops_6_prs2Busy = _RAND_459[0:0];
  _RAND_460 = {1{`RANDOM}};
  entryUops_7_pc = _RAND_460[31:0];
  _RAND_461 = {1{`RANDOM}};
  entryUops_7_inst = _RAND_461[31:0];
  _RAND_462 = {1{`RANDOM}};
  entryUops_7_ctrl_fuType = _RAND_462[3:0];
  _RAND_463 = {1{`RANDOM}};
  entryUops_7_ctrl_aluOp = _RAND_463[4:0];
  _RAND_464 = {1{`RANDOM}};
  entryUops_7_ctrl_bruOp = _RAND_464[3:0];
  _RAND_465 = {1{`RANDOM}};
  entryUops_7_ctrl_lsuOp = _RAND_465[3:0];
  _RAND_466 = {1{`RANDOM}};
  entryUops_7_ctrl_csrOp = _RAND_466[2:0];
  _RAND_467 = {1{`RANDOM}};
  entryUops_7_ctrl_mulOp = _RAND_467[2:0];
  _RAND_468 = {1{`RANDOM}};
  entryUops_7_ctrl_divOp = _RAND_468[2:0];
  _RAND_469 = {1{`RANDOM}};
  entryUops_7_ctrl_src1Type = _RAND_469[2:0];
  _RAND_470 = {1{`RANDOM}};
  entryUops_7_ctrl_src2Type = _RAND_470[2:0];
  _RAND_471 = {1{`RANDOM}};
  entryUops_7_ctrl_immType = _RAND_471[3:0];
  _RAND_472 = {1{`RANDOM}};
  entryUops_7_ctrl_rfWen = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  entryUops_7_ctrl_memRead = _RAND_473[0:0];
  _RAND_474 = {1{`RANDOM}};
  entryUops_7_ctrl_memWrite = _RAND_474[0:0];
  _RAND_475 = {1{`RANDOM}};
  entryUops_7_ctrl_csrWen = _RAND_475[0:0];
  _RAND_476 = {1{`RANDOM}};
  entryUops_7_ctrl_isBranch = _RAND_476[0:0];
  _RAND_477 = {1{`RANDOM}};
  entryUops_7_ctrl_isJump = _RAND_477[0:0];
  _RAND_478 = {1{`RANDOM}};
  entryUops_7_ctrl_isPriv = _RAND_478[0:0];
  _RAND_479 = {1{`RANDOM}};
  entryUops_7_excp_excpVec = _RAND_479[16:0];
  _RAND_480 = {1{`RANDOM}};
  entryUops_7_imm = _RAND_480[31:0];
  _RAND_481 = {1{`RANDOM}};
  entryUops_7_csrAddress = _RAND_481[13:0];
  _RAND_482 = {1{`RANDOM}};
  entryUops_7_pdInfo_valid = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  entryUops_7_pdInfo_isBr = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  entryUops_7_pdInfo_isJal = _RAND_484[0:0];
  _RAND_485 = {1{`RANDOM}};
  entryUops_7_pdInfo_isJalr = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  entryUops_7_pdInfo_isCall = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  entryUops_7_pdInfo_isRet = _RAND_487[0:0];
  _RAND_488 = {1{`RANDOM}};
  entryUops_7_pdInfo_jumpTarget = _RAND_488[31:0];
  _RAND_489 = {1{`RANDOM}};
  entryUops_7_bpuInfo_pc = _RAND_489[31:0];
  _RAND_490 = {1{`RANDOM}};
  entryUops_7_bpuInfo_fallThrough = _RAND_490[31:0];
  _RAND_491 = {1{`RANDOM}};
  entryUops_7_bpuInfo_taken = _RAND_491[0:0];
  _RAND_492 = {1{`RANDOM}};
  entryUops_7_bpuInfo_target = _RAND_492[31:0];
  _RAND_493 = {1{`RANDOM}};
  entryUops_7_bpuInfo_takenOffset = _RAND_493[1:0];
  _RAND_494 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_valid = _RAND_494[0:0];
  _RAND_495 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbHit = _RAND_495[0:0];
  _RAND_496 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsJalr = _RAND_496[0:0];
  _RAND_497 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsJal = _RAND_497[0:0];
  _RAND_498 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsCall = _RAND_498[0:0];
  _RAND_499 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbIsRet = _RAND_499[0:0];
  _RAND_500 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_btbOffset = _RAND_500[1:0];
  _RAND_501 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_phtCounter = _RAND_501[1:0];
  _RAND_502 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_rasTop = _RAND_502[2:0];
  _RAND_503 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_predTaken = _RAND_503[0:0];
  _RAND_504 = {1{`RANDOM}};
  entryUops_7_bpuInfo_meta_predTarget = _RAND_504[31:0];
  _RAND_505 = {1{`RANDOM}};
  entryUops_7_ldst = _RAND_505[4:0];
  _RAND_506 = {1{`RANDOM}};
  entryUops_7_lrs1 = _RAND_506[4:0];
  _RAND_507 = {1{`RANDOM}};
  entryUops_7_lrs2 = _RAND_507[4:0];
  _RAND_508 = {1{`RANDOM}};
  entryUops_7_pdst = _RAND_508[6:0];
  _RAND_509 = {1{`RANDOM}};
  entryUops_7_prs1 = _RAND_509[6:0];
  _RAND_510 = {1{`RANDOM}};
  entryUops_7_prs2 = _RAND_510[6:0];
  _RAND_511 = {1{`RANDOM}};
  entryUops_7_oldPdst = _RAND_511[6:0];
  _RAND_512 = {1{`RANDOM}};
  entryUops_7_rs1Valid = _RAND_512[0:0];
  _RAND_513 = {1{`RANDOM}};
  entryUops_7_rs2Valid = _RAND_513[0:0];
  _RAND_514 = {1{`RANDOM}};
  entryUops_7_rdValid = _RAND_514[0:0];
  _RAND_515 = {1{`RANDOM}};
  entryUops_7_snptId_valid = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  entryUops_7_snptId_bits = _RAND_516[2:0];
  _RAND_517 = {1{`RANDOM}};
  entryUops_7_robIdx_value = _RAND_517[5:0];
  _RAND_518 = {1{`RANDOM}};
  entryUops_7_robIdx_flag = _RAND_518[0:0];
  _RAND_519 = {1{`RANDOM}};
  entryUops_7_robIdxFull_value = _RAND_519[5:0];
  _RAND_520 = {1{`RANDOM}};
  entryUops_7_robIdxFull_flag = _RAND_520[0:0];
  _RAND_521 = {1{`RANDOM}};
  entryUops_7_issueQueue = _RAND_521[2:0];
  _RAND_522 = {1{`RANDOM}};
  entryUops_7_prs1Busy = _RAND_522[0:0];
  _RAND_523 = {1{`RANDOM}};
  entryUops_7_prs2Busy = _RAND_523[0:0];
  _RAND_524 = {1{`RANDOM}};
  entryUops_8_pc = _RAND_524[31:0];
  _RAND_525 = {1{`RANDOM}};
  entryUops_8_inst = _RAND_525[31:0];
  _RAND_526 = {1{`RANDOM}};
  entryUops_8_ctrl_fuType = _RAND_526[3:0];
  _RAND_527 = {1{`RANDOM}};
  entryUops_8_ctrl_aluOp = _RAND_527[4:0];
  _RAND_528 = {1{`RANDOM}};
  entryUops_8_ctrl_bruOp = _RAND_528[3:0];
  _RAND_529 = {1{`RANDOM}};
  entryUops_8_ctrl_lsuOp = _RAND_529[3:0];
  _RAND_530 = {1{`RANDOM}};
  entryUops_8_ctrl_csrOp = _RAND_530[2:0];
  _RAND_531 = {1{`RANDOM}};
  entryUops_8_ctrl_mulOp = _RAND_531[2:0];
  _RAND_532 = {1{`RANDOM}};
  entryUops_8_ctrl_divOp = _RAND_532[2:0];
  _RAND_533 = {1{`RANDOM}};
  entryUops_8_ctrl_src1Type = _RAND_533[2:0];
  _RAND_534 = {1{`RANDOM}};
  entryUops_8_ctrl_src2Type = _RAND_534[2:0];
  _RAND_535 = {1{`RANDOM}};
  entryUops_8_ctrl_immType = _RAND_535[3:0];
  _RAND_536 = {1{`RANDOM}};
  entryUops_8_ctrl_rfWen = _RAND_536[0:0];
  _RAND_537 = {1{`RANDOM}};
  entryUops_8_ctrl_memRead = _RAND_537[0:0];
  _RAND_538 = {1{`RANDOM}};
  entryUops_8_ctrl_memWrite = _RAND_538[0:0];
  _RAND_539 = {1{`RANDOM}};
  entryUops_8_ctrl_csrWen = _RAND_539[0:0];
  _RAND_540 = {1{`RANDOM}};
  entryUops_8_ctrl_isBranch = _RAND_540[0:0];
  _RAND_541 = {1{`RANDOM}};
  entryUops_8_ctrl_isJump = _RAND_541[0:0];
  _RAND_542 = {1{`RANDOM}};
  entryUops_8_ctrl_isPriv = _RAND_542[0:0];
  _RAND_543 = {1{`RANDOM}};
  entryUops_8_excp_excpVec = _RAND_543[16:0];
  _RAND_544 = {1{`RANDOM}};
  entryUops_8_imm = _RAND_544[31:0];
  _RAND_545 = {1{`RANDOM}};
  entryUops_8_csrAddress = _RAND_545[13:0];
  _RAND_546 = {1{`RANDOM}};
  entryUops_8_pdInfo_valid = _RAND_546[0:0];
  _RAND_547 = {1{`RANDOM}};
  entryUops_8_pdInfo_isBr = _RAND_547[0:0];
  _RAND_548 = {1{`RANDOM}};
  entryUops_8_pdInfo_isJal = _RAND_548[0:0];
  _RAND_549 = {1{`RANDOM}};
  entryUops_8_pdInfo_isJalr = _RAND_549[0:0];
  _RAND_550 = {1{`RANDOM}};
  entryUops_8_pdInfo_isCall = _RAND_550[0:0];
  _RAND_551 = {1{`RANDOM}};
  entryUops_8_pdInfo_isRet = _RAND_551[0:0];
  _RAND_552 = {1{`RANDOM}};
  entryUops_8_pdInfo_jumpTarget = _RAND_552[31:0];
  _RAND_553 = {1{`RANDOM}};
  entryUops_8_bpuInfo_pc = _RAND_553[31:0];
  _RAND_554 = {1{`RANDOM}};
  entryUops_8_bpuInfo_fallThrough = _RAND_554[31:0];
  _RAND_555 = {1{`RANDOM}};
  entryUops_8_bpuInfo_taken = _RAND_555[0:0];
  _RAND_556 = {1{`RANDOM}};
  entryUops_8_bpuInfo_target = _RAND_556[31:0];
  _RAND_557 = {1{`RANDOM}};
  entryUops_8_bpuInfo_takenOffset = _RAND_557[1:0];
  _RAND_558 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_valid = _RAND_558[0:0];
  _RAND_559 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_btbHit = _RAND_559[0:0];
  _RAND_560 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_btbIsJalr = _RAND_560[0:0];
  _RAND_561 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_btbIsJal = _RAND_561[0:0];
  _RAND_562 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_btbIsCall = _RAND_562[0:0];
  _RAND_563 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_btbIsRet = _RAND_563[0:0];
  _RAND_564 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_btbOffset = _RAND_564[1:0];
  _RAND_565 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_phtCounter = _RAND_565[1:0];
  _RAND_566 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_rasTop = _RAND_566[2:0];
  _RAND_567 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_predTaken = _RAND_567[0:0];
  _RAND_568 = {1{`RANDOM}};
  entryUops_8_bpuInfo_meta_predTarget = _RAND_568[31:0];
  _RAND_569 = {1{`RANDOM}};
  entryUops_8_ldst = _RAND_569[4:0];
  _RAND_570 = {1{`RANDOM}};
  entryUops_8_lrs1 = _RAND_570[4:0];
  _RAND_571 = {1{`RANDOM}};
  entryUops_8_lrs2 = _RAND_571[4:0];
  _RAND_572 = {1{`RANDOM}};
  entryUops_8_pdst = _RAND_572[6:0];
  _RAND_573 = {1{`RANDOM}};
  entryUops_8_prs1 = _RAND_573[6:0];
  _RAND_574 = {1{`RANDOM}};
  entryUops_8_prs2 = _RAND_574[6:0];
  _RAND_575 = {1{`RANDOM}};
  entryUops_8_oldPdst = _RAND_575[6:0];
  _RAND_576 = {1{`RANDOM}};
  entryUops_8_rs1Valid = _RAND_576[0:0];
  _RAND_577 = {1{`RANDOM}};
  entryUops_8_rs2Valid = _RAND_577[0:0];
  _RAND_578 = {1{`RANDOM}};
  entryUops_8_rdValid = _RAND_578[0:0];
  _RAND_579 = {1{`RANDOM}};
  entryUops_8_snptId_valid = _RAND_579[0:0];
  _RAND_580 = {1{`RANDOM}};
  entryUops_8_snptId_bits = _RAND_580[2:0];
  _RAND_581 = {1{`RANDOM}};
  entryUops_8_robIdx_value = _RAND_581[5:0];
  _RAND_582 = {1{`RANDOM}};
  entryUops_8_robIdx_flag = _RAND_582[0:0];
  _RAND_583 = {1{`RANDOM}};
  entryUops_8_robIdxFull_value = _RAND_583[5:0];
  _RAND_584 = {1{`RANDOM}};
  entryUops_8_robIdxFull_flag = _RAND_584[0:0];
  _RAND_585 = {1{`RANDOM}};
  entryUops_8_issueQueue = _RAND_585[2:0];
  _RAND_586 = {1{`RANDOM}};
  entryUops_8_prs1Busy = _RAND_586[0:0];
  _RAND_587 = {1{`RANDOM}};
  entryUops_8_prs2Busy = _RAND_587[0:0];
  _RAND_588 = {1{`RANDOM}};
  entryUops_9_pc = _RAND_588[31:0];
  _RAND_589 = {1{`RANDOM}};
  entryUops_9_inst = _RAND_589[31:0];
  _RAND_590 = {1{`RANDOM}};
  entryUops_9_ctrl_fuType = _RAND_590[3:0];
  _RAND_591 = {1{`RANDOM}};
  entryUops_9_ctrl_aluOp = _RAND_591[4:0];
  _RAND_592 = {1{`RANDOM}};
  entryUops_9_ctrl_bruOp = _RAND_592[3:0];
  _RAND_593 = {1{`RANDOM}};
  entryUops_9_ctrl_lsuOp = _RAND_593[3:0];
  _RAND_594 = {1{`RANDOM}};
  entryUops_9_ctrl_csrOp = _RAND_594[2:0];
  _RAND_595 = {1{`RANDOM}};
  entryUops_9_ctrl_mulOp = _RAND_595[2:0];
  _RAND_596 = {1{`RANDOM}};
  entryUops_9_ctrl_divOp = _RAND_596[2:0];
  _RAND_597 = {1{`RANDOM}};
  entryUops_9_ctrl_src1Type = _RAND_597[2:0];
  _RAND_598 = {1{`RANDOM}};
  entryUops_9_ctrl_src2Type = _RAND_598[2:0];
  _RAND_599 = {1{`RANDOM}};
  entryUops_9_ctrl_immType = _RAND_599[3:0];
  _RAND_600 = {1{`RANDOM}};
  entryUops_9_ctrl_rfWen = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  entryUops_9_ctrl_memRead = _RAND_601[0:0];
  _RAND_602 = {1{`RANDOM}};
  entryUops_9_ctrl_memWrite = _RAND_602[0:0];
  _RAND_603 = {1{`RANDOM}};
  entryUops_9_ctrl_csrWen = _RAND_603[0:0];
  _RAND_604 = {1{`RANDOM}};
  entryUops_9_ctrl_isBranch = _RAND_604[0:0];
  _RAND_605 = {1{`RANDOM}};
  entryUops_9_ctrl_isJump = _RAND_605[0:0];
  _RAND_606 = {1{`RANDOM}};
  entryUops_9_ctrl_isPriv = _RAND_606[0:0];
  _RAND_607 = {1{`RANDOM}};
  entryUops_9_excp_excpVec = _RAND_607[16:0];
  _RAND_608 = {1{`RANDOM}};
  entryUops_9_imm = _RAND_608[31:0];
  _RAND_609 = {1{`RANDOM}};
  entryUops_9_csrAddress = _RAND_609[13:0];
  _RAND_610 = {1{`RANDOM}};
  entryUops_9_pdInfo_valid = _RAND_610[0:0];
  _RAND_611 = {1{`RANDOM}};
  entryUops_9_pdInfo_isBr = _RAND_611[0:0];
  _RAND_612 = {1{`RANDOM}};
  entryUops_9_pdInfo_isJal = _RAND_612[0:0];
  _RAND_613 = {1{`RANDOM}};
  entryUops_9_pdInfo_isJalr = _RAND_613[0:0];
  _RAND_614 = {1{`RANDOM}};
  entryUops_9_pdInfo_isCall = _RAND_614[0:0];
  _RAND_615 = {1{`RANDOM}};
  entryUops_9_pdInfo_isRet = _RAND_615[0:0];
  _RAND_616 = {1{`RANDOM}};
  entryUops_9_pdInfo_jumpTarget = _RAND_616[31:0];
  _RAND_617 = {1{`RANDOM}};
  entryUops_9_bpuInfo_pc = _RAND_617[31:0];
  _RAND_618 = {1{`RANDOM}};
  entryUops_9_bpuInfo_fallThrough = _RAND_618[31:0];
  _RAND_619 = {1{`RANDOM}};
  entryUops_9_bpuInfo_taken = _RAND_619[0:0];
  _RAND_620 = {1{`RANDOM}};
  entryUops_9_bpuInfo_target = _RAND_620[31:0];
  _RAND_621 = {1{`RANDOM}};
  entryUops_9_bpuInfo_takenOffset = _RAND_621[1:0];
  _RAND_622 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_valid = _RAND_622[0:0];
  _RAND_623 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_btbHit = _RAND_623[0:0];
  _RAND_624 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_btbIsJalr = _RAND_624[0:0];
  _RAND_625 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_btbIsJal = _RAND_625[0:0];
  _RAND_626 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_btbIsCall = _RAND_626[0:0];
  _RAND_627 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_btbIsRet = _RAND_627[0:0];
  _RAND_628 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_btbOffset = _RAND_628[1:0];
  _RAND_629 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_phtCounter = _RAND_629[1:0];
  _RAND_630 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_rasTop = _RAND_630[2:0];
  _RAND_631 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_predTaken = _RAND_631[0:0];
  _RAND_632 = {1{`RANDOM}};
  entryUops_9_bpuInfo_meta_predTarget = _RAND_632[31:0];
  _RAND_633 = {1{`RANDOM}};
  entryUops_9_ldst = _RAND_633[4:0];
  _RAND_634 = {1{`RANDOM}};
  entryUops_9_lrs1 = _RAND_634[4:0];
  _RAND_635 = {1{`RANDOM}};
  entryUops_9_lrs2 = _RAND_635[4:0];
  _RAND_636 = {1{`RANDOM}};
  entryUops_9_pdst = _RAND_636[6:0];
  _RAND_637 = {1{`RANDOM}};
  entryUops_9_prs1 = _RAND_637[6:0];
  _RAND_638 = {1{`RANDOM}};
  entryUops_9_prs2 = _RAND_638[6:0];
  _RAND_639 = {1{`RANDOM}};
  entryUops_9_oldPdst = _RAND_639[6:0];
  _RAND_640 = {1{`RANDOM}};
  entryUops_9_rs1Valid = _RAND_640[0:0];
  _RAND_641 = {1{`RANDOM}};
  entryUops_9_rs2Valid = _RAND_641[0:0];
  _RAND_642 = {1{`RANDOM}};
  entryUops_9_rdValid = _RAND_642[0:0];
  _RAND_643 = {1{`RANDOM}};
  entryUops_9_snptId_valid = _RAND_643[0:0];
  _RAND_644 = {1{`RANDOM}};
  entryUops_9_snptId_bits = _RAND_644[2:0];
  _RAND_645 = {1{`RANDOM}};
  entryUops_9_robIdx_value = _RAND_645[5:0];
  _RAND_646 = {1{`RANDOM}};
  entryUops_9_robIdx_flag = _RAND_646[0:0];
  _RAND_647 = {1{`RANDOM}};
  entryUops_9_robIdxFull_value = _RAND_647[5:0];
  _RAND_648 = {1{`RANDOM}};
  entryUops_9_robIdxFull_flag = _RAND_648[0:0];
  _RAND_649 = {1{`RANDOM}};
  entryUops_9_issueQueue = _RAND_649[2:0];
  _RAND_650 = {1{`RANDOM}};
  entryUops_9_prs1Busy = _RAND_650[0:0];
  _RAND_651 = {1{`RANDOM}};
  entryUops_9_prs2Busy = _RAND_651[0:0];
  _RAND_652 = {1{`RANDOM}};
  entryUops_10_pc = _RAND_652[31:0];
  _RAND_653 = {1{`RANDOM}};
  entryUops_10_inst = _RAND_653[31:0];
  _RAND_654 = {1{`RANDOM}};
  entryUops_10_ctrl_fuType = _RAND_654[3:0];
  _RAND_655 = {1{`RANDOM}};
  entryUops_10_ctrl_aluOp = _RAND_655[4:0];
  _RAND_656 = {1{`RANDOM}};
  entryUops_10_ctrl_bruOp = _RAND_656[3:0];
  _RAND_657 = {1{`RANDOM}};
  entryUops_10_ctrl_lsuOp = _RAND_657[3:0];
  _RAND_658 = {1{`RANDOM}};
  entryUops_10_ctrl_csrOp = _RAND_658[2:0];
  _RAND_659 = {1{`RANDOM}};
  entryUops_10_ctrl_mulOp = _RAND_659[2:0];
  _RAND_660 = {1{`RANDOM}};
  entryUops_10_ctrl_divOp = _RAND_660[2:0];
  _RAND_661 = {1{`RANDOM}};
  entryUops_10_ctrl_src1Type = _RAND_661[2:0];
  _RAND_662 = {1{`RANDOM}};
  entryUops_10_ctrl_src2Type = _RAND_662[2:0];
  _RAND_663 = {1{`RANDOM}};
  entryUops_10_ctrl_immType = _RAND_663[3:0];
  _RAND_664 = {1{`RANDOM}};
  entryUops_10_ctrl_rfWen = _RAND_664[0:0];
  _RAND_665 = {1{`RANDOM}};
  entryUops_10_ctrl_memRead = _RAND_665[0:0];
  _RAND_666 = {1{`RANDOM}};
  entryUops_10_ctrl_memWrite = _RAND_666[0:0];
  _RAND_667 = {1{`RANDOM}};
  entryUops_10_ctrl_csrWen = _RAND_667[0:0];
  _RAND_668 = {1{`RANDOM}};
  entryUops_10_ctrl_isBranch = _RAND_668[0:0];
  _RAND_669 = {1{`RANDOM}};
  entryUops_10_ctrl_isJump = _RAND_669[0:0];
  _RAND_670 = {1{`RANDOM}};
  entryUops_10_ctrl_isPriv = _RAND_670[0:0];
  _RAND_671 = {1{`RANDOM}};
  entryUops_10_excp_excpVec = _RAND_671[16:0];
  _RAND_672 = {1{`RANDOM}};
  entryUops_10_imm = _RAND_672[31:0];
  _RAND_673 = {1{`RANDOM}};
  entryUops_10_csrAddress = _RAND_673[13:0];
  _RAND_674 = {1{`RANDOM}};
  entryUops_10_pdInfo_valid = _RAND_674[0:0];
  _RAND_675 = {1{`RANDOM}};
  entryUops_10_pdInfo_isBr = _RAND_675[0:0];
  _RAND_676 = {1{`RANDOM}};
  entryUops_10_pdInfo_isJal = _RAND_676[0:0];
  _RAND_677 = {1{`RANDOM}};
  entryUops_10_pdInfo_isJalr = _RAND_677[0:0];
  _RAND_678 = {1{`RANDOM}};
  entryUops_10_pdInfo_isCall = _RAND_678[0:0];
  _RAND_679 = {1{`RANDOM}};
  entryUops_10_pdInfo_isRet = _RAND_679[0:0];
  _RAND_680 = {1{`RANDOM}};
  entryUops_10_pdInfo_jumpTarget = _RAND_680[31:0];
  _RAND_681 = {1{`RANDOM}};
  entryUops_10_bpuInfo_pc = _RAND_681[31:0];
  _RAND_682 = {1{`RANDOM}};
  entryUops_10_bpuInfo_fallThrough = _RAND_682[31:0];
  _RAND_683 = {1{`RANDOM}};
  entryUops_10_bpuInfo_taken = _RAND_683[0:0];
  _RAND_684 = {1{`RANDOM}};
  entryUops_10_bpuInfo_target = _RAND_684[31:0];
  _RAND_685 = {1{`RANDOM}};
  entryUops_10_bpuInfo_takenOffset = _RAND_685[1:0];
  _RAND_686 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_valid = _RAND_686[0:0];
  _RAND_687 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_btbHit = _RAND_687[0:0];
  _RAND_688 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_btbIsJalr = _RAND_688[0:0];
  _RAND_689 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_btbIsJal = _RAND_689[0:0];
  _RAND_690 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_btbIsCall = _RAND_690[0:0];
  _RAND_691 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_btbIsRet = _RAND_691[0:0];
  _RAND_692 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_btbOffset = _RAND_692[1:0];
  _RAND_693 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_phtCounter = _RAND_693[1:0];
  _RAND_694 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_rasTop = _RAND_694[2:0];
  _RAND_695 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_predTaken = _RAND_695[0:0];
  _RAND_696 = {1{`RANDOM}};
  entryUops_10_bpuInfo_meta_predTarget = _RAND_696[31:0];
  _RAND_697 = {1{`RANDOM}};
  entryUops_10_ldst = _RAND_697[4:0];
  _RAND_698 = {1{`RANDOM}};
  entryUops_10_lrs1 = _RAND_698[4:0];
  _RAND_699 = {1{`RANDOM}};
  entryUops_10_lrs2 = _RAND_699[4:0];
  _RAND_700 = {1{`RANDOM}};
  entryUops_10_pdst = _RAND_700[6:0];
  _RAND_701 = {1{`RANDOM}};
  entryUops_10_prs1 = _RAND_701[6:0];
  _RAND_702 = {1{`RANDOM}};
  entryUops_10_prs2 = _RAND_702[6:0];
  _RAND_703 = {1{`RANDOM}};
  entryUops_10_oldPdst = _RAND_703[6:0];
  _RAND_704 = {1{`RANDOM}};
  entryUops_10_rs1Valid = _RAND_704[0:0];
  _RAND_705 = {1{`RANDOM}};
  entryUops_10_rs2Valid = _RAND_705[0:0];
  _RAND_706 = {1{`RANDOM}};
  entryUops_10_rdValid = _RAND_706[0:0];
  _RAND_707 = {1{`RANDOM}};
  entryUops_10_snptId_valid = _RAND_707[0:0];
  _RAND_708 = {1{`RANDOM}};
  entryUops_10_snptId_bits = _RAND_708[2:0];
  _RAND_709 = {1{`RANDOM}};
  entryUops_10_robIdx_value = _RAND_709[5:0];
  _RAND_710 = {1{`RANDOM}};
  entryUops_10_robIdx_flag = _RAND_710[0:0];
  _RAND_711 = {1{`RANDOM}};
  entryUops_10_robIdxFull_value = _RAND_711[5:0];
  _RAND_712 = {1{`RANDOM}};
  entryUops_10_robIdxFull_flag = _RAND_712[0:0];
  _RAND_713 = {1{`RANDOM}};
  entryUops_10_issueQueue = _RAND_713[2:0];
  _RAND_714 = {1{`RANDOM}};
  entryUops_10_prs1Busy = _RAND_714[0:0];
  _RAND_715 = {1{`RANDOM}};
  entryUops_10_prs2Busy = _RAND_715[0:0];
  _RAND_716 = {1{`RANDOM}};
  entryUops_11_pc = _RAND_716[31:0];
  _RAND_717 = {1{`RANDOM}};
  entryUops_11_inst = _RAND_717[31:0];
  _RAND_718 = {1{`RANDOM}};
  entryUops_11_ctrl_fuType = _RAND_718[3:0];
  _RAND_719 = {1{`RANDOM}};
  entryUops_11_ctrl_aluOp = _RAND_719[4:0];
  _RAND_720 = {1{`RANDOM}};
  entryUops_11_ctrl_bruOp = _RAND_720[3:0];
  _RAND_721 = {1{`RANDOM}};
  entryUops_11_ctrl_lsuOp = _RAND_721[3:0];
  _RAND_722 = {1{`RANDOM}};
  entryUops_11_ctrl_csrOp = _RAND_722[2:0];
  _RAND_723 = {1{`RANDOM}};
  entryUops_11_ctrl_mulOp = _RAND_723[2:0];
  _RAND_724 = {1{`RANDOM}};
  entryUops_11_ctrl_divOp = _RAND_724[2:0];
  _RAND_725 = {1{`RANDOM}};
  entryUops_11_ctrl_src1Type = _RAND_725[2:0];
  _RAND_726 = {1{`RANDOM}};
  entryUops_11_ctrl_src2Type = _RAND_726[2:0];
  _RAND_727 = {1{`RANDOM}};
  entryUops_11_ctrl_immType = _RAND_727[3:0];
  _RAND_728 = {1{`RANDOM}};
  entryUops_11_ctrl_rfWen = _RAND_728[0:0];
  _RAND_729 = {1{`RANDOM}};
  entryUops_11_ctrl_memRead = _RAND_729[0:0];
  _RAND_730 = {1{`RANDOM}};
  entryUops_11_ctrl_memWrite = _RAND_730[0:0];
  _RAND_731 = {1{`RANDOM}};
  entryUops_11_ctrl_csrWen = _RAND_731[0:0];
  _RAND_732 = {1{`RANDOM}};
  entryUops_11_ctrl_isBranch = _RAND_732[0:0];
  _RAND_733 = {1{`RANDOM}};
  entryUops_11_ctrl_isJump = _RAND_733[0:0];
  _RAND_734 = {1{`RANDOM}};
  entryUops_11_ctrl_isPriv = _RAND_734[0:0];
  _RAND_735 = {1{`RANDOM}};
  entryUops_11_excp_excpVec = _RAND_735[16:0];
  _RAND_736 = {1{`RANDOM}};
  entryUops_11_imm = _RAND_736[31:0];
  _RAND_737 = {1{`RANDOM}};
  entryUops_11_csrAddress = _RAND_737[13:0];
  _RAND_738 = {1{`RANDOM}};
  entryUops_11_pdInfo_valid = _RAND_738[0:0];
  _RAND_739 = {1{`RANDOM}};
  entryUops_11_pdInfo_isBr = _RAND_739[0:0];
  _RAND_740 = {1{`RANDOM}};
  entryUops_11_pdInfo_isJal = _RAND_740[0:0];
  _RAND_741 = {1{`RANDOM}};
  entryUops_11_pdInfo_isJalr = _RAND_741[0:0];
  _RAND_742 = {1{`RANDOM}};
  entryUops_11_pdInfo_isCall = _RAND_742[0:0];
  _RAND_743 = {1{`RANDOM}};
  entryUops_11_pdInfo_isRet = _RAND_743[0:0];
  _RAND_744 = {1{`RANDOM}};
  entryUops_11_pdInfo_jumpTarget = _RAND_744[31:0];
  _RAND_745 = {1{`RANDOM}};
  entryUops_11_bpuInfo_pc = _RAND_745[31:0];
  _RAND_746 = {1{`RANDOM}};
  entryUops_11_bpuInfo_fallThrough = _RAND_746[31:0];
  _RAND_747 = {1{`RANDOM}};
  entryUops_11_bpuInfo_taken = _RAND_747[0:0];
  _RAND_748 = {1{`RANDOM}};
  entryUops_11_bpuInfo_target = _RAND_748[31:0];
  _RAND_749 = {1{`RANDOM}};
  entryUops_11_bpuInfo_takenOffset = _RAND_749[1:0];
  _RAND_750 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_valid = _RAND_750[0:0];
  _RAND_751 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_btbHit = _RAND_751[0:0];
  _RAND_752 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_btbIsJalr = _RAND_752[0:0];
  _RAND_753 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_btbIsJal = _RAND_753[0:0];
  _RAND_754 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_btbIsCall = _RAND_754[0:0];
  _RAND_755 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_btbIsRet = _RAND_755[0:0];
  _RAND_756 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_btbOffset = _RAND_756[1:0];
  _RAND_757 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_phtCounter = _RAND_757[1:0];
  _RAND_758 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_rasTop = _RAND_758[2:0];
  _RAND_759 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_predTaken = _RAND_759[0:0];
  _RAND_760 = {1{`RANDOM}};
  entryUops_11_bpuInfo_meta_predTarget = _RAND_760[31:0];
  _RAND_761 = {1{`RANDOM}};
  entryUops_11_ldst = _RAND_761[4:0];
  _RAND_762 = {1{`RANDOM}};
  entryUops_11_lrs1 = _RAND_762[4:0];
  _RAND_763 = {1{`RANDOM}};
  entryUops_11_lrs2 = _RAND_763[4:0];
  _RAND_764 = {1{`RANDOM}};
  entryUops_11_pdst = _RAND_764[6:0];
  _RAND_765 = {1{`RANDOM}};
  entryUops_11_prs1 = _RAND_765[6:0];
  _RAND_766 = {1{`RANDOM}};
  entryUops_11_prs2 = _RAND_766[6:0];
  _RAND_767 = {1{`RANDOM}};
  entryUops_11_oldPdst = _RAND_767[6:0];
  _RAND_768 = {1{`RANDOM}};
  entryUops_11_rs1Valid = _RAND_768[0:0];
  _RAND_769 = {1{`RANDOM}};
  entryUops_11_rs2Valid = _RAND_769[0:0];
  _RAND_770 = {1{`RANDOM}};
  entryUops_11_rdValid = _RAND_770[0:0];
  _RAND_771 = {1{`RANDOM}};
  entryUops_11_snptId_valid = _RAND_771[0:0];
  _RAND_772 = {1{`RANDOM}};
  entryUops_11_snptId_bits = _RAND_772[2:0];
  _RAND_773 = {1{`RANDOM}};
  entryUops_11_robIdx_value = _RAND_773[5:0];
  _RAND_774 = {1{`RANDOM}};
  entryUops_11_robIdx_flag = _RAND_774[0:0];
  _RAND_775 = {1{`RANDOM}};
  entryUops_11_robIdxFull_value = _RAND_775[5:0];
  _RAND_776 = {1{`RANDOM}};
  entryUops_11_robIdxFull_flag = _RAND_776[0:0];
  _RAND_777 = {1{`RANDOM}};
  entryUops_11_issueQueue = _RAND_777[2:0];
  _RAND_778 = {1{`RANDOM}};
  entryUops_11_prs1Busy = _RAND_778[0:0];
  _RAND_779 = {1{`RANDOM}};
  entryUops_11_prs2Busy = _RAND_779[0:0];
  _RAND_780 = {1{`RANDOM}};
  entryP1Ready_0 = _RAND_780[0:0];
  _RAND_781 = {1{`RANDOM}};
  entryP1Ready_1 = _RAND_781[0:0];
  _RAND_782 = {1{`RANDOM}};
  entryP1Ready_2 = _RAND_782[0:0];
  _RAND_783 = {1{`RANDOM}};
  entryP1Ready_3 = _RAND_783[0:0];
  _RAND_784 = {1{`RANDOM}};
  entryP1Ready_4 = _RAND_784[0:0];
  _RAND_785 = {1{`RANDOM}};
  entryP1Ready_5 = _RAND_785[0:0];
  _RAND_786 = {1{`RANDOM}};
  entryP1Ready_6 = _RAND_786[0:0];
  _RAND_787 = {1{`RANDOM}};
  entryP1Ready_7 = _RAND_787[0:0];
  _RAND_788 = {1{`RANDOM}};
  entryP1Ready_8 = _RAND_788[0:0];
  _RAND_789 = {1{`RANDOM}};
  entryP1Ready_9 = _RAND_789[0:0];
  _RAND_790 = {1{`RANDOM}};
  entryP1Ready_10 = _RAND_790[0:0];
  _RAND_791 = {1{`RANDOM}};
  entryP1Ready_11 = _RAND_791[0:0];
  _RAND_792 = {1{`RANDOM}};
  entryP2Ready_0 = _RAND_792[0:0];
  _RAND_793 = {1{`RANDOM}};
  entryP2Ready_1 = _RAND_793[0:0];
  _RAND_794 = {1{`RANDOM}};
  entryP2Ready_2 = _RAND_794[0:0];
  _RAND_795 = {1{`RANDOM}};
  entryP2Ready_3 = _RAND_795[0:0];
  _RAND_796 = {1{`RANDOM}};
  entryP2Ready_4 = _RAND_796[0:0];
  _RAND_797 = {1{`RANDOM}};
  entryP2Ready_5 = _RAND_797[0:0];
  _RAND_798 = {1{`RANDOM}};
  entryP2Ready_6 = _RAND_798[0:0];
  _RAND_799 = {1{`RANDOM}};
  entryP2Ready_7 = _RAND_799[0:0];
  _RAND_800 = {1{`RANDOM}};
  entryP2Ready_8 = _RAND_800[0:0];
  _RAND_801 = {1{`RANDOM}};
  entryP2Ready_9 = _RAND_801[0:0];
  _RAND_802 = {1{`RANDOM}};
  entryP2Ready_10 = _RAND_802[0:0];
  _RAND_803 = {1{`RANDOM}};
  entryP2Ready_11 = _RAND_803[0:0];
  _RAND_804 = {1{`RANDOM}};
  age_0_1 = _RAND_804[0:0];
  _RAND_805 = {1{`RANDOM}};
  age_0_2 = _RAND_805[0:0];
  _RAND_806 = {1{`RANDOM}};
  age_0_3 = _RAND_806[0:0];
  _RAND_807 = {1{`RANDOM}};
  age_0_4 = _RAND_807[0:0];
  _RAND_808 = {1{`RANDOM}};
  age_0_5 = _RAND_808[0:0];
  _RAND_809 = {1{`RANDOM}};
  age_0_6 = _RAND_809[0:0];
  _RAND_810 = {1{`RANDOM}};
  age_0_7 = _RAND_810[0:0];
  _RAND_811 = {1{`RANDOM}};
  age_0_8 = _RAND_811[0:0];
  _RAND_812 = {1{`RANDOM}};
  age_0_9 = _RAND_812[0:0];
  _RAND_813 = {1{`RANDOM}};
  age_0_10 = _RAND_813[0:0];
  _RAND_814 = {1{`RANDOM}};
  age_0_11 = _RAND_814[0:0];
  _RAND_815 = {1{`RANDOM}};
  age_1_0 = _RAND_815[0:0];
  _RAND_816 = {1{`RANDOM}};
  age_1_2 = _RAND_816[0:0];
  _RAND_817 = {1{`RANDOM}};
  age_1_3 = _RAND_817[0:0];
  _RAND_818 = {1{`RANDOM}};
  age_1_4 = _RAND_818[0:0];
  _RAND_819 = {1{`RANDOM}};
  age_1_5 = _RAND_819[0:0];
  _RAND_820 = {1{`RANDOM}};
  age_1_6 = _RAND_820[0:0];
  _RAND_821 = {1{`RANDOM}};
  age_1_7 = _RAND_821[0:0];
  _RAND_822 = {1{`RANDOM}};
  age_1_8 = _RAND_822[0:0];
  _RAND_823 = {1{`RANDOM}};
  age_1_9 = _RAND_823[0:0];
  _RAND_824 = {1{`RANDOM}};
  age_1_10 = _RAND_824[0:0];
  _RAND_825 = {1{`RANDOM}};
  age_1_11 = _RAND_825[0:0];
  _RAND_826 = {1{`RANDOM}};
  age_2_0 = _RAND_826[0:0];
  _RAND_827 = {1{`RANDOM}};
  age_2_1 = _RAND_827[0:0];
  _RAND_828 = {1{`RANDOM}};
  age_2_3 = _RAND_828[0:0];
  _RAND_829 = {1{`RANDOM}};
  age_2_4 = _RAND_829[0:0];
  _RAND_830 = {1{`RANDOM}};
  age_2_5 = _RAND_830[0:0];
  _RAND_831 = {1{`RANDOM}};
  age_2_6 = _RAND_831[0:0];
  _RAND_832 = {1{`RANDOM}};
  age_2_7 = _RAND_832[0:0];
  _RAND_833 = {1{`RANDOM}};
  age_2_8 = _RAND_833[0:0];
  _RAND_834 = {1{`RANDOM}};
  age_2_9 = _RAND_834[0:0];
  _RAND_835 = {1{`RANDOM}};
  age_2_10 = _RAND_835[0:0];
  _RAND_836 = {1{`RANDOM}};
  age_2_11 = _RAND_836[0:0];
  _RAND_837 = {1{`RANDOM}};
  age_3_0 = _RAND_837[0:0];
  _RAND_838 = {1{`RANDOM}};
  age_3_1 = _RAND_838[0:0];
  _RAND_839 = {1{`RANDOM}};
  age_3_2 = _RAND_839[0:0];
  _RAND_840 = {1{`RANDOM}};
  age_3_4 = _RAND_840[0:0];
  _RAND_841 = {1{`RANDOM}};
  age_3_5 = _RAND_841[0:0];
  _RAND_842 = {1{`RANDOM}};
  age_3_6 = _RAND_842[0:0];
  _RAND_843 = {1{`RANDOM}};
  age_3_7 = _RAND_843[0:0];
  _RAND_844 = {1{`RANDOM}};
  age_3_8 = _RAND_844[0:0];
  _RAND_845 = {1{`RANDOM}};
  age_3_9 = _RAND_845[0:0];
  _RAND_846 = {1{`RANDOM}};
  age_3_10 = _RAND_846[0:0];
  _RAND_847 = {1{`RANDOM}};
  age_3_11 = _RAND_847[0:0];
  _RAND_848 = {1{`RANDOM}};
  age_4_0 = _RAND_848[0:0];
  _RAND_849 = {1{`RANDOM}};
  age_4_1 = _RAND_849[0:0];
  _RAND_850 = {1{`RANDOM}};
  age_4_2 = _RAND_850[0:0];
  _RAND_851 = {1{`RANDOM}};
  age_4_3 = _RAND_851[0:0];
  _RAND_852 = {1{`RANDOM}};
  age_4_5 = _RAND_852[0:0];
  _RAND_853 = {1{`RANDOM}};
  age_4_6 = _RAND_853[0:0];
  _RAND_854 = {1{`RANDOM}};
  age_4_7 = _RAND_854[0:0];
  _RAND_855 = {1{`RANDOM}};
  age_4_8 = _RAND_855[0:0];
  _RAND_856 = {1{`RANDOM}};
  age_4_9 = _RAND_856[0:0];
  _RAND_857 = {1{`RANDOM}};
  age_4_10 = _RAND_857[0:0];
  _RAND_858 = {1{`RANDOM}};
  age_4_11 = _RAND_858[0:0];
  _RAND_859 = {1{`RANDOM}};
  age_5_0 = _RAND_859[0:0];
  _RAND_860 = {1{`RANDOM}};
  age_5_1 = _RAND_860[0:0];
  _RAND_861 = {1{`RANDOM}};
  age_5_2 = _RAND_861[0:0];
  _RAND_862 = {1{`RANDOM}};
  age_5_3 = _RAND_862[0:0];
  _RAND_863 = {1{`RANDOM}};
  age_5_4 = _RAND_863[0:0];
  _RAND_864 = {1{`RANDOM}};
  age_5_6 = _RAND_864[0:0];
  _RAND_865 = {1{`RANDOM}};
  age_5_7 = _RAND_865[0:0];
  _RAND_866 = {1{`RANDOM}};
  age_5_8 = _RAND_866[0:0];
  _RAND_867 = {1{`RANDOM}};
  age_5_9 = _RAND_867[0:0];
  _RAND_868 = {1{`RANDOM}};
  age_5_10 = _RAND_868[0:0];
  _RAND_869 = {1{`RANDOM}};
  age_5_11 = _RAND_869[0:0];
  _RAND_870 = {1{`RANDOM}};
  age_6_0 = _RAND_870[0:0];
  _RAND_871 = {1{`RANDOM}};
  age_6_1 = _RAND_871[0:0];
  _RAND_872 = {1{`RANDOM}};
  age_6_2 = _RAND_872[0:0];
  _RAND_873 = {1{`RANDOM}};
  age_6_3 = _RAND_873[0:0];
  _RAND_874 = {1{`RANDOM}};
  age_6_4 = _RAND_874[0:0];
  _RAND_875 = {1{`RANDOM}};
  age_6_5 = _RAND_875[0:0];
  _RAND_876 = {1{`RANDOM}};
  age_6_7 = _RAND_876[0:0];
  _RAND_877 = {1{`RANDOM}};
  age_6_8 = _RAND_877[0:0];
  _RAND_878 = {1{`RANDOM}};
  age_6_9 = _RAND_878[0:0];
  _RAND_879 = {1{`RANDOM}};
  age_6_10 = _RAND_879[0:0];
  _RAND_880 = {1{`RANDOM}};
  age_6_11 = _RAND_880[0:0];
  _RAND_881 = {1{`RANDOM}};
  age_7_0 = _RAND_881[0:0];
  _RAND_882 = {1{`RANDOM}};
  age_7_1 = _RAND_882[0:0];
  _RAND_883 = {1{`RANDOM}};
  age_7_2 = _RAND_883[0:0];
  _RAND_884 = {1{`RANDOM}};
  age_7_3 = _RAND_884[0:0];
  _RAND_885 = {1{`RANDOM}};
  age_7_4 = _RAND_885[0:0];
  _RAND_886 = {1{`RANDOM}};
  age_7_5 = _RAND_886[0:0];
  _RAND_887 = {1{`RANDOM}};
  age_7_6 = _RAND_887[0:0];
  _RAND_888 = {1{`RANDOM}};
  age_7_8 = _RAND_888[0:0];
  _RAND_889 = {1{`RANDOM}};
  age_7_9 = _RAND_889[0:0];
  _RAND_890 = {1{`RANDOM}};
  age_7_10 = _RAND_890[0:0];
  _RAND_891 = {1{`RANDOM}};
  age_7_11 = _RAND_891[0:0];
  _RAND_892 = {1{`RANDOM}};
  age_8_0 = _RAND_892[0:0];
  _RAND_893 = {1{`RANDOM}};
  age_8_1 = _RAND_893[0:0];
  _RAND_894 = {1{`RANDOM}};
  age_8_2 = _RAND_894[0:0];
  _RAND_895 = {1{`RANDOM}};
  age_8_3 = _RAND_895[0:0];
  _RAND_896 = {1{`RANDOM}};
  age_8_4 = _RAND_896[0:0];
  _RAND_897 = {1{`RANDOM}};
  age_8_5 = _RAND_897[0:0];
  _RAND_898 = {1{`RANDOM}};
  age_8_6 = _RAND_898[0:0];
  _RAND_899 = {1{`RANDOM}};
  age_8_7 = _RAND_899[0:0];
  _RAND_900 = {1{`RANDOM}};
  age_8_9 = _RAND_900[0:0];
  _RAND_901 = {1{`RANDOM}};
  age_8_10 = _RAND_901[0:0];
  _RAND_902 = {1{`RANDOM}};
  age_8_11 = _RAND_902[0:0];
  _RAND_903 = {1{`RANDOM}};
  age_9_0 = _RAND_903[0:0];
  _RAND_904 = {1{`RANDOM}};
  age_9_1 = _RAND_904[0:0];
  _RAND_905 = {1{`RANDOM}};
  age_9_2 = _RAND_905[0:0];
  _RAND_906 = {1{`RANDOM}};
  age_9_3 = _RAND_906[0:0];
  _RAND_907 = {1{`RANDOM}};
  age_9_4 = _RAND_907[0:0];
  _RAND_908 = {1{`RANDOM}};
  age_9_5 = _RAND_908[0:0];
  _RAND_909 = {1{`RANDOM}};
  age_9_6 = _RAND_909[0:0];
  _RAND_910 = {1{`RANDOM}};
  age_9_7 = _RAND_910[0:0];
  _RAND_911 = {1{`RANDOM}};
  age_9_8 = _RAND_911[0:0];
  _RAND_912 = {1{`RANDOM}};
  age_9_10 = _RAND_912[0:0];
  _RAND_913 = {1{`RANDOM}};
  age_9_11 = _RAND_913[0:0];
  _RAND_914 = {1{`RANDOM}};
  age_10_0 = _RAND_914[0:0];
  _RAND_915 = {1{`RANDOM}};
  age_10_1 = _RAND_915[0:0];
  _RAND_916 = {1{`RANDOM}};
  age_10_2 = _RAND_916[0:0];
  _RAND_917 = {1{`RANDOM}};
  age_10_3 = _RAND_917[0:0];
  _RAND_918 = {1{`RANDOM}};
  age_10_4 = _RAND_918[0:0];
  _RAND_919 = {1{`RANDOM}};
  age_10_5 = _RAND_919[0:0];
  _RAND_920 = {1{`RANDOM}};
  age_10_6 = _RAND_920[0:0];
  _RAND_921 = {1{`RANDOM}};
  age_10_7 = _RAND_921[0:0];
  _RAND_922 = {1{`RANDOM}};
  age_10_8 = _RAND_922[0:0];
  _RAND_923 = {1{`RANDOM}};
  age_10_9 = _RAND_923[0:0];
  _RAND_924 = {1{`RANDOM}};
  age_10_11 = _RAND_924[0:0];
  _RAND_925 = {1{`RANDOM}};
  age_11_0 = _RAND_925[0:0];
  _RAND_926 = {1{`RANDOM}};
  age_11_1 = _RAND_926[0:0];
  _RAND_927 = {1{`RANDOM}};
  age_11_2 = _RAND_927[0:0];
  _RAND_928 = {1{`RANDOM}};
  age_11_3 = _RAND_928[0:0];
  _RAND_929 = {1{`RANDOM}};
  age_11_4 = _RAND_929[0:0];
  _RAND_930 = {1{`RANDOM}};
  age_11_5 = _RAND_930[0:0];
  _RAND_931 = {1{`RANDOM}};
  age_11_6 = _RAND_931[0:0];
  _RAND_932 = {1{`RANDOM}};
  age_11_7 = _RAND_932[0:0];
  _RAND_933 = {1{`RANDOM}};
  age_11_8 = _RAND_933[0:0];
  _RAND_934 = {1{`RANDOM}};
  age_11_9 = _RAND_934[0:0];
  _RAND_935 = {1{`RANDOM}};
  age_11_10 = _RAND_935[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
