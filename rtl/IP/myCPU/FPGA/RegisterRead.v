module RegisterRead(
  input         clock,
  input         reset,
  output        io_iqIssues_0_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_0_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_0_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [16:0] io_iqIssues_0_bits_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [13:0] io_iqIssues_0_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_0_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_0_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_0_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_0_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_0_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_0_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_0_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_0_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_0_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_0_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_0_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_0_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_0_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_iqIssues_1_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_1_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_1_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [16:0] io_iqIssues_1_bits_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [13:0] io_iqIssues_1_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_1_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_1_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_1_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_1_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_1_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_1_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_1_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_1_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_1_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_1_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_1_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_iqIssues_2_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_2_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_2_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [16:0] io_iqIssues_2_bits_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [13:0] io_iqIssues_2_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_2_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_2_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_2_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_2_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_2_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_2_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_2_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_2_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_2_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_2_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_2_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_2_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_2_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_iqIssues_3_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_3_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_3_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [16:0] io_iqIssues_3_bits_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [13:0] io_iqIssues_3_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_3_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_3_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_3_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_3_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_3_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_3_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_3_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_3_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_3_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_3_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_3_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_3_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_3_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_3_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_3_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_3_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_3_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_iqIssues_4_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_4_bits_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_4_bits_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [16:0] io_iqIssues_4_bits_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [13:0] io_iqIssues_4_bits_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_4_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_4_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [1:0]  io_iqIssues_4_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_iqIssues_4_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_4_bits_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_4_bits_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [4:0]  io_iqIssues_4_bits_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_4_bits_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_4_bits_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_4_bits_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [6:0]  io_iqIssues_4_bits_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_4_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_iqIssues_4_bits_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_4_bits_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [3:0]  io_iqIssues_4_bits_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [2:0]  io_iqIssues_4_bits_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_iqIssues_4_bits_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_0, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_3, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_4, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_5, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_6, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_rfReadAddrs_7, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_0, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_3, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_4, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_5, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_6, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [31:0] io_rfReadData_7, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_exeReqs_0_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_0_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_0_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [16:0] io_exeReqs_0_bits_uop_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [13:0] io_exeReqs_0_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_0_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_0_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_0_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_0_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_0_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_0_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_0_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_0_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_0_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_0_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_0_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_0_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_0_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_0_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_0_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_0_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_0_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_exeReqs_1_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_1_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_1_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [16:0] io_exeReqs_1_bits_uop_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [13:0] io_exeReqs_1_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_1_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_1_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_1_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_1_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_1_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_1_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_1_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_1_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_1_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_1_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_1_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_1_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_1_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_1_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_1_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_exeReqs_2_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_2_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_2_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [16:0] io_exeReqs_2_bits_uop_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [13:0] io_exeReqs_2_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_2_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_2_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_2_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_2_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_2_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_2_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_2_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_2_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_2_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_2_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_2_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_2_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_2_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_2_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_2_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_2_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_2_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_exeReqs_3_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_3_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_3_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [16:0] io_exeReqs_3_bits_uop_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [13:0] io_exeReqs_3_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_3_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_3_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_3_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_3_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_3_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_3_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_3_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_3_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_3_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_3_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_3_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_3_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_3_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_3_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_3_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_3_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_rs1Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_3_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_exeReqs_4_ready, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_inst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_fuType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_4_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_divOp, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_4_bits_uop_ctrl_immType, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_ctrl_memRead, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_ctrl_isJump, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [16:0] io_exeReqs_4_bits_uop_excp_excpVec, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_imm, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [13:0] io_exeReqs_4_bits_uop_csrAddress, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_pdInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_bpuInfo_target, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_4_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_4_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [1:0]  io_exeReqs_4_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_4_bits_uop_ldst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_4_bits_uop_lrs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [4:0]  io_exeReqs_4_bits_uop_lrs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_4_bits_uop_pdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_4_bits_uop_prs1, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_4_bits_uop_prs2, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [6:0]  io_exeReqs_4_bits_uop_oldPdst, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_rs1Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_rs2Valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_rdValid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_snptId_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_snptId_bits, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_4_bits_uop_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_robIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [5:0]  io_exeReqs_4_bits_uop_robIdxFull_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_4_bits_uop_lqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_lqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [3:0]  io_exeReqs_4_bits_uop_sqIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_sqIdx_flag, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [2:0]  io_exeReqs_4_bits_uop_issueQueue, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_prs1Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_prs2Busy, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_isSta, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output        io_exeReqs_4_bits_uop_isStd, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  output [31:0] io_exeReqs_4_bits_rs2Data, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_redirectInfo_valid, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
  input         io_redirectInfo_bits_robIdx_flag // @[src/main/scala/backend/regfile/RegisterRead.scala 47:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  rrd_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
  reg [31:0] rrd_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [16:0] rrd_uop_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [13:0] rrd_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  out_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
  reg [31:0] out_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [16:0] out_uop_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [13:0] out_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_rs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
  reg [31:0] out_rs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
  wire  doRedirect = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/regfile/RegisterRead.scala 101:44]
  wire  _rrd_killed_T_2 = rrd_uop_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _rrd_killed_T_3 = rrd_uop_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _rrd_killed_T_4 = rrd_uop_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _rrd_killed_T_2 :
    _rrd_killed_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  rrd_killed = rrd_valid & doRedirect & _rrd_killed_T_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 104:46]
  wire  _out_killed_T_2 = out_uop_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _out_killed_T_3 = out_uop_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _out_killed_T_4 = out_uop_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _out_killed_T_2 :
    _out_killed_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  out_killed = out_valid & doRedirect & _out_killed_T_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 106:46]
  wire  _out_fire_T = ~out_killed; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:35]
  wire  out_fire = out_valid & ~out_killed & io_exeReqs_0_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:47]
  wire  rrd_to_out = rrd_valid & ~rrd_killed & (~out_valid | out_fire); // @[src/main/scala/backend/regfile/RegisterRead.scala 115:47]
  wire  rrd_ready = ~rrd_valid | rrd_to_out; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  wire  iq_fire = io_iqIssues_0_valid & rrd_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 117:44]
  wire [6:0] _io_rfReadAddrs_0_T = rrd_valid ? rrd_uop_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 129:42]
  wire [6:0] _io_rfReadAddrs_1_T = rrd_valid ? rrd_uop_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 131:42]
  wire [31:0] _rs1Data_T_2 = rrd_uop_prs1 == 7'h0 ? 32'h0 : io_rfReadData_0; // @[src/main/scala/backend/regfile/RegisterRead.scala 148:22]
  wire [31:0] _rs2Data_T_2 = rrd_uop_prs2 == 7'h0 ? 32'h0 : io_rfReadData_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 151:10]
  wire  _GEN_0 = rrd_to_out ? 1'h0 : rrd_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 172:30 173:19 90:28]
  wire  _GEN_1 = iq_fire | _GEN_0; // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27 170:19]
  wire  _GEN_143 = out_fire ? 1'h0 : out_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 184:28 185:19 93:28]
  wire  _GEN_144 = rrd_to_out | _GEN_143; // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30 180:19]
  reg  rrd_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
  reg [31:0] rrd_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [16:0] rrd_uop_1_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [13:0] rrd_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_1_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_1_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_1_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_1_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  out_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
  reg [31:0] out_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [16:0] out_uop_1_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [13:0] out_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_1_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_1_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_1_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_1_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_rs1_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
  reg [31:0] out_rs2_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
  wire  _rrd_killed_T_7 = rrd_uop_1_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _rrd_killed_T_8 = rrd_uop_1_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _rrd_killed_T_9 = rrd_uop_1_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _rrd_killed_T_7 :
    _rrd_killed_T_8; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  rrd_killed_1 = rrd_valid_1 & doRedirect & _rrd_killed_T_9; // @[src/main/scala/backend/regfile/RegisterRead.scala 104:46]
  wire  _out_killed_T_7 = out_uop_1_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _out_killed_T_8 = out_uop_1_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _out_killed_T_9 = out_uop_1_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _out_killed_T_7 :
    _out_killed_T_8; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  out_killed_1 = out_valid_1 & doRedirect & _out_killed_T_9; // @[src/main/scala/backend/regfile/RegisterRead.scala 106:46]
  wire  _out_fire_T_2 = ~out_killed_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:35]
  wire  out_fire_1 = out_valid_1 & ~out_killed_1 & io_exeReqs_1_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:47]
  wire  rrd_to_out_1 = rrd_valid_1 & ~rrd_killed_1 & (~out_valid_1 | out_fire_1); // @[src/main/scala/backend/regfile/RegisterRead.scala 115:47]
  wire  rrd_ready_1 = ~rrd_valid_1 | rrd_to_out_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  wire  iq_fire_1 = io_iqIssues_1_valid & rrd_ready_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 117:44]
  wire [6:0] _io_rfReadAddrs_2_T = rrd_valid_1 ? rrd_uop_1_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 129:42]
  wire [6:0] _io_rfReadAddrs_3_T = rrd_valid_1 ? rrd_uop_1_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 131:42]
  wire [31:0] _rs1Data_T_5 = rrd_uop_1_prs1 == 7'h0 ? 32'h0 : io_rfReadData_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 148:22]
  wire [31:0] _rs2Data_T_5 = rrd_uop_1_prs2 == 7'h0 ? 32'h0 : io_rfReadData_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 151:10]
  wire  _GEN_434 = rrd_to_out_1 ? 1'h0 : rrd_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 172:30 173:19 90:28]
  wire  _GEN_435 = iq_fire_1 | _GEN_434; // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27 170:19]
  wire  _GEN_577 = out_fire_1 ? 1'h0 : out_valid_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 184:28 185:19 93:28]
  wire  _GEN_578 = rrd_to_out_1 | _GEN_577; // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30 180:19]
  reg  rrd_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
  reg [31:0] rrd_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [16:0] rrd_uop_2_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [13:0] rrd_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_2_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_2_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_2_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_2_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  out_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
  reg [31:0] out_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [16:0] out_uop_2_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [13:0] out_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_2_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_2_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_2_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_2_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_rs1_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
  reg [31:0] out_rs2_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
  wire  _rrd_killed_T_12 = rrd_uop_2_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _rrd_killed_T_13 = rrd_uop_2_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _rrd_killed_T_14 = rrd_uop_2_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _rrd_killed_T_12 :
    _rrd_killed_T_13; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  rrd_killed_2 = rrd_valid_2 & doRedirect & _rrd_killed_T_14; // @[src/main/scala/backend/regfile/RegisterRead.scala 104:46]
  wire  _out_killed_T_12 = out_uop_2_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _out_killed_T_13 = out_uop_2_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _out_killed_T_14 = out_uop_2_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _out_killed_T_12 :
    _out_killed_T_13; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  out_killed_2 = out_valid_2 & doRedirect & _out_killed_T_14; // @[src/main/scala/backend/regfile/RegisterRead.scala 106:46]
  wire  _out_fire_T_4 = ~out_killed_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:35]
  wire  out_fire_2 = out_valid_2 & ~out_killed_2 & io_exeReqs_2_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:47]
  wire  rrd_to_out_2 = rrd_valid_2 & ~rrd_killed_2 & (~out_valid_2 | out_fire_2); // @[src/main/scala/backend/regfile/RegisterRead.scala 115:47]
  wire  rrd_ready_2 = ~rrd_valid_2 | rrd_to_out_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  wire  iq_fire_2 = io_iqIssues_2_valid & rrd_ready_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 117:44]
  wire [6:0] _io_rfReadAddrs_4_T = rrd_valid_2 ? rrd_uop_2_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 129:42]
  wire [6:0] _io_rfReadAddrs_5_T = rrd_valid_2 ? rrd_uop_2_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 131:42]
  wire [31:0] _rs1Data_T_8 = rrd_uop_2_prs1 == 7'h0 ? 32'h0 : io_rfReadData_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 148:22]
  wire [31:0] _rs2Data_T_8 = rrd_uop_2_prs2 == 7'h0 ? 32'h0 : io_rfReadData_5; // @[src/main/scala/backend/regfile/RegisterRead.scala 151:10]
  wire  _GEN_868 = rrd_to_out_2 ? 1'h0 : rrd_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 172:30 173:19 90:28]
  wire  _GEN_869 = iq_fire_2 | _GEN_868; // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27 170:19]
  wire  _GEN_1011 = out_fire_2 ? 1'h0 : out_valid_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 184:28 185:19 93:28]
  wire  _GEN_1012 = rrd_to_out_2 | _GEN_1011; // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30 180:19]
  reg  rrd_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
  reg [31:0] rrd_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [16:0] rrd_uop_3_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [13:0] rrd_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_3_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_3_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_3_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_3_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_3_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_3_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_3_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
  reg [31:0] out_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [16:0] out_uop_3_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [13:0] out_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_3_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_3_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_3_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_3_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_3_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_3_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_3_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_rs1_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
  reg [31:0] out_rs2_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
  wire  _rrd_killed_T_17 = rrd_uop_3_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _rrd_killed_T_18 = rrd_uop_3_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _rrd_killed_T_19 = rrd_uop_3_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _rrd_killed_T_17 :
    _rrd_killed_T_18; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  rrd_killed_3 = rrd_valid_3 & doRedirect & _rrd_killed_T_19; // @[src/main/scala/backend/regfile/RegisterRead.scala 104:46]
  wire  _out_killed_T_17 = out_uop_3_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _out_killed_T_18 = out_uop_3_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _out_killed_T_19 = out_uop_3_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _out_killed_T_17 :
    _out_killed_T_18; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  out_killed_3 = out_valid_3 & doRedirect & _out_killed_T_19; // @[src/main/scala/backend/regfile/RegisterRead.scala 106:46]
  wire  _out_fire_T_6 = ~out_killed_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:35]
  wire  out_fire_3 = out_valid_3 & ~out_killed_3 & io_exeReqs_3_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:47]
  wire  rrd_to_out_3 = rrd_valid_3 & ~rrd_killed_3 & (~out_valid_3 | out_fire_3); // @[src/main/scala/backend/regfile/RegisterRead.scala 115:47]
  wire  rrd_ready_3 = ~rrd_valid_3 | rrd_to_out_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  wire  iq_fire_3 = io_iqIssues_3_valid & rrd_ready_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 117:44]
  wire [6:0] _readSrc_T_2 = rrd_valid_3 ? rrd_uop_3_prs1 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 136:52]
  wire [31:0] _rs1Data_T_11 = rrd_uop_3_prs1 == 7'h0 ? 32'h0 : io_rfReadData_6; // @[src/main/scala/backend/regfile/RegisterRead.scala 148:22]
  wire [31:0] _rs2Data_T_11 = rrd_uop_3_prs2 == 7'h0 ? 32'h0 : io_rfReadData_6; // @[src/main/scala/backend/regfile/RegisterRead.scala 155:10]
  wire  _GEN_1302 = rrd_to_out_3 ? 1'h0 : rrd_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 172:30 173:19 90:28]
  wire  _GEN_1303 = iq_fire_3 | _GEN_1302; // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27 170:19]
  wire  _GEN_1445 = out_fire_3 ? 1'h0 : out_valid_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 184:28 185:19 93:28]
  wire  _GEN_1446 = rrd_to_out_3 | _GEN_1445; // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30 180:19]
  reg  rrd_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
  reg [31:0] rrd_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [16:0] rrd_uop_4_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [13:0] rrd_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_4_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_4_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_4_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_4_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_4_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [1:0] rrd_uop_4_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [31:0] rrd_uop_4_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [4:0] rrd_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [6:0] rrd_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [5:0] rrd_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [3:0] rrd_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg [2:0] rrd_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  rrd_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
  reg  out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
  reg [31:0] out_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [16:0] out_uop_4_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [13:0] out_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_4_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_4_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_4_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_4_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_4_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [1:0] out_uop_4_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_uop_4_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [4:0] out_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [6:0] out_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [5:0] out_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [3:0] out_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [2:0] out_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg  out_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
  reg [31:0] out_rs2_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
  wire  _rrd_killed_T_22 = rrd_uop_4_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _rrd_killed_T_23 = rrd_uop_4_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _rrd_killed_T_24 = rrd_uop_4_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _rrd_killed_T_22 :
    _rrd_killed_T_23; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  rrd_killed_4 = rrd_valid_4 & doRedirect & _rrd_killed_T_24; // @[src/main/scala/backend/regfile/RegisterRead.scala 104:46]
  wire  _out_killed_T_22 = out_uop_4_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _out_killed_T_23 = out_uop_4_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _out_killed_T_24 = out_uop_4_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _out_killed_T_22 :
    _out_killed_T_23; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  out_killed_4 = out_valid_4 & doRedirect & _out_killed_T_24; // @[src/main/scala/backend/regfile/RegisterRead.scala 106:46]
  wire  _out_fire_T_8 = ~out_killed_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:35]
  wire  out_fire_4 = out_valid_4 & ~out_killed_4 & io_exeReqs_4_ready; // @[src/main/scala/backend/regfile/RegisterRead.scala 114:47]
  wire  rrd_to_out_4 = rrd_valid_4 & ~rrd_killed_4 & (~out_valid_4 | out_fire_4); // @[src/main/scala/backend/regfile/RegisterRead.scala 115:47]
  wire  rrd_ready_4 = ~rrd_valid_4 | rrd_to_out_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  wire  iq_fire_4 = io_iqIssues_4_valid & rrd_ready_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 117:44]
  wire [6:0] _readSrc_T_4 = rrd_valid_4 ? rrd_uop_4_prs2 : 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 135:52]
  wire [31:0] _rs2Data_T_14 = rrd_uop_4_prs2 == 7'h0 ? 32'h0 : io_rfReadData_7; // @[src/main/scala/backend/regfile/RegisterRead.scala 155:10]
  wire  _GEN_1736 = rrd_to_out_4 ? 1'h0 : rrd_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 172:30 173:19 90:28]
  wire  _GEN_1737 = iq_fire_4 | _GEN_1736; // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27 170:19]
  wire  _GEN_1879 = out_fire_4 ? 1'h0 : out_valid_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 184:28 185:19 93:28]
  wire  _GEN_1880 = rrd_to_out_4 | _GEN_1879; // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30 180:19]
  assign io_iqIssues_0_ready = ~rrd_valid | rrd_to_out; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  assign io_iqIssues_1_ready = ~rrd_valid_1 | rrd_to_out_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  assign io_iqIssues_2_ready = ~rrd_valid_2 | rrd_to_out_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  assign io_iqIssues_3_ready = ~rrd_valid_3 | rrd_to_out_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  assign io_iqIssues_4_ready = ~rrd_valid_4 | rrd_to_out_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 116:33]
  assign io_rfReadAddrs_0 = iq_fire ? io_iqIssues_0_bits_prs1 : _io_rfReadAddrs_0_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 128:42]
  assign io_rfReadAddrs_1 = iq_fire ? io_iqIssues_0_bits_prs2 : _io_rfReadAddrs_1_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 130:42]
  assign io_rfReadAddrs_2 = iq_fire_1 ? io_iqIssues_1_bits_prs1 : _io_rfReadAddrs_2_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 128:42]
  assign io_rfReadAddrs_3 = iq_fire_1 ? io_iqIssues_1_bits_prs2 : _io_rfReadAddrs_3_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 130:42]
  assign io_rfReadAddrs_4 = iq_fire_2 ? io_iqIssues_2_bits_prs1 : _io_rfReadAddrs_4_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 128:42]
  assign io_rfReadAddrs_5 = iq_fire_2 ? io_iqIssues_2_bits_prs2 : _io_rfReadAddrs_5_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 130:42]
  assign io_rfReadAddrs_6 = iq_fire_3 ? io_iqIssues_3_bits_prs1 : _readSrc_T_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 136:12]
  assign io_rfReadAddrs_7 = iq_fire_4 ? io_iqIssues_4_bits_prs2 : _readSrc_T_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 135:12]
  assign io_exeReqs_0_valid = out_valid & _out_fire_T; // @[src/main/scala/backend/regfile/RegisterRead.scala 192:47]
  assign io_exeReqs_0_bits_uop_pc = out_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_inst = out_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_fuType = out_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_aluOp = out_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_bruOp = out_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_lsuOp = out_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_csrOp = out_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_mulOp = out_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_divOp = out_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_src1Type = out_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_src2Type = out_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_immType = out_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_rfWen = out_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_memRead = out_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_memWrite = out_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_csrWen = out_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_isBranch = out_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_isJump = out_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ctrl_isPriv = out_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_excp_excpVec = out_uop_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_imm = out_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_csrAddress = out_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdInfo_valid = out_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isBr = out_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isJal = out_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isJalr = out_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isCall = out_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdInfo_isRet = out_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdInfo_jumpTarget = out_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_pc = out_uop_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_fallThrough = out_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_taken = out_uop_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_target = out_uop_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_takenOffset = out_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_valid = out_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_btbHit = out_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJalr = out_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJal = out_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsCall = out_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsRet = out_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_btbOffset = out_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_phtCounter = out_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_rasTop = out_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_predTaken = out_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_bpuInfo_meta_predTarget = out_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_ldst = out_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_lrs1 = out_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_lrs2 = out_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_pdst = out_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_prs1 = out_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_prs2 = out_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_oldPdst = out_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_rs1Valid = out_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_rs2Valid = out_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_rdValid = out_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_snptId_valid = out_uop_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_snptId_bits = out_uop_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_robIdx_value = out_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_robIdx_flag = out_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_robIdxFull_value = out_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_robIdxFull_flag = out_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_lqIdx_value = out_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_lqIdx_flag = out_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_sqIdx_value = out_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_sqIdx_flag = out_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_issueQueue = out_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_prs1Busy = out_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_prs2Busy = out_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_isSta = out_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_uop_isStd = out_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_0_bits_rs1Data = out_rs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 194:34]
  assign io_exeReqs_0_bits_rs2Data = out_rs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 195:34]
  assign io_exeReqs_1_valid = out_valid_1 & _out_fire_T_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 192:47]
  assign io_exeReqs_1_bits_uop_pc = out_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_inst = out_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_fuType = out_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_aluOp = out_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_bruOp = out_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_lsuOp = out_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_csrOp = out_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_mulOp = out_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_divOp = out_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_src1Type = out_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_src2Type = out_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_immType = out_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_rfWen = out_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_memRead = out_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_memWrite = out_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_csrWen = out_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_isBranch = out_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_isJump = out_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ctrl_isPriv = out_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_excp_excpVec = out_uop_1_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_imm = out_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_csrAddress = out_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdInfo_valid = out_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isBr = out_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isJal = out_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isJalr = out_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isCall = out_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdInfo_isRet = out_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdInfo_jumpTarget = out_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_pc = out_uop_1_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_fallThrough = out_uop_1_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_taken = out_uop_1_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_target = out_uop_1_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_takenOffset = out_uop_1_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_valid = out_uop_1_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_btbHit = out_uop_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJalr = out_uop_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJal = out_uop_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsCall = out_uop_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsRet = out_uop_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_btbOffset = out_uop_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_phtCounter = out_uop_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_rasTop = out_uop_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_predTaken = out_uop_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_bpuInfo_meta_predTarget = out_uop_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_ldst = out_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_lrs1 = out_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_lrs2 = out_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_pdst = out_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_prs1 = out_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_prs2 = out_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_oldPdst = out_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_rs1Valid = out_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_rs2Valid = out_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_rdValid = out_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_snptId_valid = out_uop_1_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_snptId_bits = out_uop_1_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_robIdx_value = out_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_robIdx_flag = out_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_robIdxFull_value = out_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_robIdxFull_flag = out_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_issueQueue = out_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_prs1Busy = out_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_uop_prs2Busy = out_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_1_bits_rs1Data = out_rs1_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 194:34]
  assign io_exeReqs_1_bits_rs2Data = out_rs2_1; // @[src/main/scala/backend/regfile/RegisterRead.scala 195:34]
  assign io_exeReqs_2_valid = out_valid_2 & _out_fire_T_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 192:47]
  assign io_exeReqs_2_bits_uop_pc = out_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_inst = out_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_fuType = out_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_aluOp = out_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_bruOp = out_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_lsuOp = out_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_csrOp = out_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_mulOp = out_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_divOp = out_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_src1Type = out_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_src2Type = out_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_immType = out_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_rfWen = out_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_memRead = out_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_memWrite = out_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_csrWen = out_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_isBranch = out_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_isJump = out_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ctrl_isPriv = out_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_excp_excpVec = out_uop_2_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_imm = out_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_csrAddress = out_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdInfo_valid = out_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isBr = out_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isJal = out_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isJalr = out_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isCall = out_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdInfo_isRet = out_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdInfo_jumpTarget = out_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_pc = out_uop_2_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_fallThrough = out_uop_2_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_taken = out_uop_2_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_target = out_uop_2_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_takenOffset = out_uop_2_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_valid = out_uop_2_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_btbHit = out_uop_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJalr = out_uop_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJal = out_uop_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsCall = out_uop_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsRet = out_uop_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_btbOffset = out_uop_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_phtCounter = out_uop_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_rasTop = out_uop_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_predTaken = out_uop_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_bpuInfo_meta_predTarget = out_uop_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_ldst = out_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_lrs1 = out_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_lrs2 = out_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_pdst = out_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_prs1 = out_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_prs2 = out_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_oldPdst = out_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_rs1Valid = out_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_rs2Valid = out_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_rdValid = out_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_snptId_valid = out_uop_2_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_snptId_bits = out_uop_2_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_robIdx_value = out_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_robIdx_flag = out_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_robIdxFull_value = out_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_robIdxFull_flag = out_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_lqIdx_value = out_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_lqIdx_flag = out_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_sqIdx_value = out_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_sqIdx_flag = out_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_issueQueue = out_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_prs1Busy = out_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_prs2Busy = out_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_isSta = out_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_uop_isStd = out_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_2_bits_rs1Data = out_rs1_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 194:34]
  assign io_exeReqs_2_bits_rs2Data = out_rs2_2; // @[src/main/scala/backend/regfile/RegisterRead.scala 195:34]
  assign io_exeReqs_3_valid = out_valid_3 & _out_fire_T_6; // @[src/main/scala/backend/regfile/RegisterRead.scala 192:47]
  assign io_exeReqs_3_bits_uop_pc = out_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_inst = out_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_fuType = out_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_aluOp = out_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_bruOp = out_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_lsuOp = out_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_csrOp = out_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_mulOp = out_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_divOp = out_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_src1Type = out_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_src2Type = out_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_immType = out_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_rfWen = out_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_memRead = out_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_memWrite = out_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_csrWen = out_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_isBranch = out_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_isJump = out_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ctrl_isPriv = out_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_excp_excpVec = out_uop_3_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_imm = out_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_csrAddress = out_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdInfo_valid = out_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isBr = out_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isJal = out_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isJalr = out_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isCall = out_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdInfo_isRet = out_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdInfo_jumpTarget = out_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_pc = out_uop_3_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_fallThrough = out_uop_3_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_taken = out_uop_3_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_target = out_uop_3_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_takenOffset = out_uop_3_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_valid = out_uop_3_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_btbHit = out_uop_3_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJalr = out_uop_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJal = out_uop_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsCall = out_uop_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsRet = out_uop_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_btbOffset = out_uop_3_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_phtCounter = out_uop_3_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_rasTop = out_uop_3_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_predTaken = out_uop_3_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_bpuInfo_meta_predTarget = out_uop_3_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_ldst = out_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_lrs1 = out_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_lrs2 = out_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_pdst = out_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_prs1 = out_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_prs2 = out_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_oldPdst = out_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_rs1Valid = out_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_rs2Valid = out_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_rdValid = out_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_snptId_valid = out_uop_3_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_snptId_bits = out_uop_3_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_robIdx_value = out_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_robIdx_flag = out_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_robIdxFull_value = out_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_robIdxFull_flag = out_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_lqIdx_value = out_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_lqIdx_flag = out_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_sqIdx_value = out_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_sqIdx_flag = out_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_issueQueue = out_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_prs1Busy = out_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_prs2Busy = out_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_isSta = out_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_uop_isStd = out_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_3_bits_rs1Data = out_rs1_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 194:34]
  assign io_exeReqs_3_bits_rs2Data = out_rs2_3; // @[src/main/scala/backend/regfile/RegisterRead.scala 195:34]
  assign io_exeReqs_4_valid = out_valid_4 & _out_fire_T_8; // @[src/main/scala/backend/regfile/RegisterRead.scala 192:47]
  assign io_exeReqs_4_bits_uop_pc = out_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_inst = out_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_fuType = out_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_aluOp = out_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_bruOp = out_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_lsuOp = out_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_csrOp = out_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_mulOp = out_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_divOp = out_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_src1Type = out_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_src2Type = out_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_immType = out_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_rfWen = out_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_memRead = out_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_memWrite = out_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_csrWen = out_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_isBranch = out_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_isJump = out_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ctrl_isPriv = out_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_excp_excpVec = out_uop_4_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_imm = out_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_csrAddress = out_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdInfo_valid = out_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isBr = out_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isJal = out_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isJalr = out_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isCall = out_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdInfo_isRet = out_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdInfo_jumpTarget = out_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_pc = out_uop_4_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_fallThrough = out_uop_4_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_taken = out_uop_4_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_target = out_uop_4_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_takenOffset = out_uop_4_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_valid = out_uop_4_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_btbHit = out_uop_4_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJalr = out_uop_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJal = out_uop_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsCall = out_uop_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsRet = out_uop_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_btbOffset = out_uop_4_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_phtCounter = out_uop_4_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_rasTop = out_uop_4_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_predTaken = out_uop_4_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_bpuInfo_meta_predTarget = out_uop_4_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_ldst = out_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_lrs1 = out_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_lrs2 = out_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_pdst = out_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_prs1 = out_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_prs2 = out_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_oldPdst = out_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_rs1Valid = out_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_rs2Valid = out_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_rdValid = out_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_snptId_valid = out_uop_4_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_snptId_bits = out_uop_4_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_robIdx_value = out_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_robIdx_flag = out_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_robIdxFull_value = out_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_robIdxFull_flag = out_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_lqIdx_value = out_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_lqIdx_flag = out_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_sqIdx_value = out_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_sqIdx_flag = out_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_issueQueue = out_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_prs1Busy = out_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_prs2Busy = out_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_isSta = out_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_uop_isStd = out_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 193:34]
  assign io_exeReqs_4_bits_rs2Data = out_rs2_4; // @[src/main/scala/backend/regfile/RegisterRead.scala 195:34]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
      rrd_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
    end else if (rrd_killed) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      rrd_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 168:19]
    end else begin
      rrd_valid <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pc <= io_iqIssues_0_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_inst <= io_iqIssues_0_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_fuType <= io_iqIssues_0_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_aluOp <= io_iqIssues_0_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_bruOp <= io_iqIssues_0_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_lsuOp <= io_iqIssues_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_csrOp <= io_iqIssues_0_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_mulOp <= io_iqIssues_0_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_divOp <= io_iqIssues_0_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_src1Type <= io_iqIssues_0_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_src2Type <= io_iqIssues_0_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_immType <= io_iqIssues_0_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_rfWen <= io_iqIssues_0_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_memRead <= io_iqIssues_0_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_memWrite <= io_iqIssues_0_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_csrWen <= io_iqIssues_0_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_isBranch <= io_iqIssues_0_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_isJump <= io_iqIssues_0_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ctrl_isPriv <= io_iqIssues_0_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_excp_excpVec <= io_iqIssues_0_bits_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_imm <= io_iqIssues_0_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_csrAddress <= io_iqIssues_0_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdInfo_valid <= io_iqIssues_0_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdInfo_isBr <= io_iqIssues_0_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdInfo_isJal <= io_iqIssues_0_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdInfo_isJalr <= io_iqIssues_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdInfo_isCall <= io_iqIssues_0_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdInfo_isRet <= io_iqIssues_0_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdInfo_jumpTarget <= io_iqIssues_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_pc <= io_iqIssues_0_bits_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_fallThrough <= io_iqIssues_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_taken <= io_iqIssues_0_bits_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_target <= io_iqIssues_0_bits_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_takenOffset <= io_iqIssues_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_valid <= io_iqIssues_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_btbHit <= io_iqIssues_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_btbIsJalr <= io_iqIssues_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_btbIsJal <= io_iqIssues_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_btbIsCall <= io_iqIssues_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_btbIsRet <= io_iqIssues_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_btbOffset <= io_iqIssues_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_phtCounter <= io_iqIssues_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_rasTop <= io_iqIssues_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_predTaken <= io_iqIssues_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_bpuInfo_meta_predTarget <= io_iqIssues_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_ldst <= io_iqIssues_0_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_lrs1 <= io_iqIssues_0_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_lrs2 <= io_iqIssues_0_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_pdst <= io_iqIssues_0_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_prs1 <= io_iqIssues_0_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_prs2 <= io_iqIssues_0_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_oldPdst <= io_iqIssues_0_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_rs1Valid <= io_iqIssues_0_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_rs2Valid <= io_iqIssues_0_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_rdValid <= io_iqIssues_0_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_snptId_valid <= io_iqIssues_0_bits_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_snptId_bits <= io_iqIssues_0_bits_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_robIdx_value <= io_iqIssues_0_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_robIdx_flag <= io_iqIssues_0_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_robIdxFull_value <= io_iqIssues_0_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_robIdxFull_flag <= io_iqIssues_0_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_lqIdx_value <= io_iqIssues_0_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_lqIdx_flag <= io_iqIssues_0_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_sqIdx_value <= io_iqIssues_0_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_sqIdx_flag <= io_iqIssues_0_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_issueQueue <= io_iqIssues_0_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_prs1Busy <= io_iqIssues_0_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_prs2Busy <= io_iqIssues_0_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_isSta <= io_iqIssues_0_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_isStd <= io_iqIssues_0_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
      out_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
    end else if (out_killed) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      out_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:19]
    end else begin
      out_valid <= _GEN_144;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pc <= rrd_uop_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_inst <= rrd_uop_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_fuType <= rrd_uop_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_aluOp <= rrd_uop_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_bruOp <= rrd_uop_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_lsuOp <= rrd_uop_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_csrOp <= rrd_uop_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_mulOp <= rrd_uop_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_divOp <= rrd_uop_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_src1Type <= rrd_uop_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_src2Type <= rrd_uop_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_immType <= rrd_uop_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_rfWen <= rrd_uop_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_memRead <= rrd_uop_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_memWrite <= rrd_uop_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_csrWen <= rrd_uop_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_isBranch <= rrd_uop_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_isJump <= rrd_uop_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ctrl_isPriv <= rrd_uop_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_excp_excpVec <= rrd_uop_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_imm <= rrd_uop_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_csrAddress <= rrd_uop_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdInfo_valid <= rrd_uop_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdInfo_isBr <= rrd_uop_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdInfo_isJal <= rrd_uop_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdInfo_isJalr <= rrd_uop_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdInfo_isCall <= rrd_uop_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdInfo_isRet <= rrd_uop_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdInfo_jumpTarget <= rrd_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_pc <= rrd_uop_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_fallThrough <= rrd_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_taken <= rrd_uop_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_target <= rrd_uop_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_takenOffset <= rrd_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_valid <= rrd_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_btbHit <= rrd_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_btbIsJalr <= rrd_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_btbIsJal <= rrd_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_btbIsCall <= rrd_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_btbIsRet <= rrd_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_btbOffset <= rrd_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_phtCounter <= rrd_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_rasTop <= rrd_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_predTaken <= rrd_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_bpuInfo_meta_predTarget <= rrd_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_ldst <= rrd_uop_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_lrs1 <= rrd_uop_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_lrs2 <= rrd_uop_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_pdst <= rrd_uop_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_prs1 <= rrd_uop_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_prs2 <= rrd_uop_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_oldPdst <= rrd_uop_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_rs1Valid <= rrd_uop_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_rs2Valid <= rrd_uop_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_rdValid <= rrd_uop_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_snptId_valid <= rrd_uop_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_snptId_bits <= rrd_uop_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_robIdx_value <= rrd_uop_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_robIdx_flag <= rrd_uop_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_robIdxFull_value <= rrd_uop_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_robIdxFull_flag <= rrd_uop_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_lqIdx_value <= rrd_uop_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_lqIdx_flag <= rrd_uop_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_sqIdx_value <= rrd_uop_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_sqIdx_flag <= rrd_uop_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_issueQueue <= rrd_uop_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_prs1Busy <= rrd_uop_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_prs2Busy <= rrd_uop_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_isSta <= rrd_uop_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_isStd <= rrd_uop_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
      out_rs1 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 147:22]
          out_rs1 <= 32'h0;
        end else begin
          out_rs1 <= _rs1Data_T_2;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
      out_rs2 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
    end else if (!(out_killed)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 150:10]
          out_rs2 <= 32'h0;
        end else begin
          out_rs2 <= _rs2Data_T_2;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
      rrd_valid_1 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
    end else if (rrd_killed_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      rrd_valid_1 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 168:19]
    end else begin
      rrd_valid_1 <= _GEN_435;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pc <= io_iqIssues_1_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_inst <= io_iqIssues_1_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_fuType <= io_iqIssues_1_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_aluOp <= io_iqIssues_1_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_bruOp <= io_iqIssues_1_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_lsuOp <= io_iqIssues_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_csrOp <= io_iqIssues_1_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_mulOp <= io_iqIssues_1_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_divOp <= io_iqIssues_1_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_src1Type <= io_iqIssues_1_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_src2Type <= io_iqIssues_1_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_immType <= io_iqIssues_1_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_rfWen <= io_iqIssues_1_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_memRead <= io_iqIssues_1_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_memWrite <= io_iqIssues_1_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_csrWen <= io_iqIssues_1_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_isBranch <= io_iqIssues_1_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_isJump <= io_iqIssues_1_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ctrl_isPriv <= io_iqIssues_1_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_excp_excpVec <= io_iqIssues_1_bits_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_imm <= io_iqIssues_1_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_csrAddress <= io_iqIssues_1_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdInfo_valid <= io_iqIssues_1_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdInfo_isBr <= io_iqIssues_1_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdInfo_isJal <= io_iqIssues_1_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdInfo_isJalr <= io_iqIssues_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdInfo_isCall <= io_iqIssues_1_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdInfo_isRet <= io_iqIssues_1_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdInfo_jumpTarget <= io_iqIssues_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_pc <= io_iqIssues_1_bits_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_fallThrough <= io_iqIssues_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_taken <= io_iqIssues_1_bits_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_target <= io_iqIssues_1_bits_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_takenOffset <= io_iqIssues_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_valid <= io_iqIssues_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_btbHit <= io_iqIssues_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_btbIsJalr <= io_iqIssues_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_btbIsJal <= io_iqIssues_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_btbIsCall <= io_iqIssues_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_btbIsRet <= io_iqIssues_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_btbOffset <= io_iqIssues_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_phtCounter <= io_iqIssues_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_rasTop <= io_iqIssues_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_predTaken <= io_iqIssues_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_bpuInfo_meta_predTarget <= io_iqIssues_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_ldst <= io_iqIssues_1_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_lrs1 <= io_iqIssues_1_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_lrs2 <= io_iqIssues_1_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_pdst <= io_iqIssues_1_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_prs1 <= io_iqIssues_1_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_prs2 <= io_iqIssues_1_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_oldPdst <= io_iqIssues_1_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_rs1Valid <= io_iqIssues_1_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_rs2Valid <= io_iqIssues_1_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_rdValid <= io_iqIssues_1_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_snptId_valid <= io_iqIssues_1_bits_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_snptId_bits <= io_iqIssues_1_bits_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_robIdx_value <= io_iqIssues_1_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_robIdx_flag <= io_iqIssues_1_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_robIdxFull_value <= io_iqIssues_1_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_robIdxFull_flag <= io_iqIssues_1_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_issueQueue <= io_iqIssues_1_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_prs1Busy <= io_iqIssues_1_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_1_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_1_prs2Busy <= io_iqIssues_1_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
      out_valid_1 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
    end else if (out_killed_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      out_valid_1 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:19]
    end else begin
      out_valid_1 <= _GEN_578;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pc <= rrd_uop_1_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_inst <= rrd_uop_1_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_fuType <= rrd_uop_1_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_aluOp <= rrd_uop_1_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_bruOp <= rrd_uop_1_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_lsuOp <= rrd_uop_1_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_csrOp <= rrd_uop_1_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_mulOp <= rrd_uop_1_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_divOp <= rrd_uop_1_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_src1Type <= rrd_uop_1_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_src2Type <= rrd_uop_1_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_immType <= rrd_uop_1_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_rfWen <= rrd_uop_1_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_memRead <= rrd_uop_1_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_memWrite <= rrd_uop_1_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_csrWen <= rrd_uop_1_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_isBranch <= rrd_uop_1_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_isJump <= rrd_uop_1_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ctrl_isPriv <= rrd_uop_1_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_excp_excpVec <= rrd_uop_1_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_imm <= rrd_uop_1_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_csrAddress <= rrd_uop_1_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdInfo_valid <= rrd_uop_1_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdInfo_isBr <= rrd_uop_1_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdInfo_isJal <= rrd_uop_1_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdInfo_isJalr <= rrd_uop_1_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdInfo_isCall <= rrd_uop_1_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdInfo_isRet <= rrd_uop_1_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdInfo_jumpTarget <= rrd_uop_1_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_pc <= rrd_uop_1_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_fallThrough <= rrd_uop_1_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_taken <= rrd_uop_1_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_target <= rrd_uop_1_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_takenOffset <= rrd_uop_1_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_valid <= rrd_uop_1_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_btbHit <= rrd_uop_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_btbIsJalr <= rrd_uop_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_btbIsJal <= rrd_uop_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_btbIsCall <= rrd_uop_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_btbIsRet <= rrd_uop_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_btbOffset <= rrd_uop_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_phtCounter <= rrd_uop_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_rasTop <= rrd_uop_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_predTaken <= rrd_uop_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_bpuInfo_meta_predTarget <= rrd_uop_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_ldst <= rrd_uop_1_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_lrs1 <= rrd_uop_1_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_lrs2 <= rrd_uop_1_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_pdst <= rrd_uop_1_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_prs1 <= rrd_uop_1_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_prs2 <= rrd_uop_1_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_oldPdst <= rrd_uop_1_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_rs1Valid <= rrd_uop_1_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_rs2Valid <= rrd_uop_1_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_rdValid <= rrd_uop_1_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_snptId_valid <= rrd_uop_1_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_snptId_bits <= rrd_uop_1_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_robIdx_value <= rrd_uop_1_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_robIdx_flag <= rrd_uop_1_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_robIdxFull_value <= rrd_uop_1_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_robIdxFull_flag <= rrd_uop_1_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_issueQueue <= rrd_uop_1_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_prs1Busy <= rrd_uop_1_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_1_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_1_prs2Busy <= rrd_uop_1_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
      out_rs1_1 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_1_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 147:22]
          out_rs1_1 <= 32'h0;
        end else begin
          out_rs1_1 <= _rs1Data_T_5;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
      out_rs2_1 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
    end else if (!(out_killed_1)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_1) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_1_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 150:10]
          out_rs2_1 <= 32'h0;
        end else begin
          out_rs2_1 <= _rs2Data_T_5;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
      rrd_valid_2 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
    end else if (rrd_killed_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      rrd_valid_2 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 168:19]
    end else begin
      rrd_valid_2 <= _GEN_869;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pc <= io_iqIssues_2_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_inst <= io_iqIssues_2_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_fuType <= io_iqIssues_2_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_aluOp <= io_iqIssues_2_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_bruOp <= io_iqIssues_2_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_lsuOp <= io_iqIssues_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_csrOp <= io_iqIssues_2_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_mulOp <= io_iqIssues_2_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_divOp <= io_iqIssues_2_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_src1Type <= io_iqIssues_2_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_src2Type <= io_iqIssues_2_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_immType <= io_iqIssues_2_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_rfWen <= io_iqIssues_2_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_memRead <= io_iqIssues_2_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_memWrite <= io_iqIssues_2_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_csrWen <= io_iqIssues_2_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_isBranch <= io_iqIssues_2_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_isJump <= io_iqIssues_2_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ctrl_isPriv <= io_iqIssues_2_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_excp_excpVec <= io_iqIssues_2_bits_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_imm <= io_iqIssues_2_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_csrAddress <= io_iqIssues_2_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdInfo_valid <= io_iqIssues_2_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdInfo_isBr <= io_iqIssues_2_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdInfo_isJal <= io_iqIssues_2_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdInfo_isJalr <= io_iqIssues_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdInfo_isCall <= io_iqIssues_2_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdInfo_isRet <= io_iqIssues_2_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdInfo_jumpTarget <= io_iqIssues_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_pc <= io_iqIssues_2_bits_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_fallThrough <= io_iqIssues_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_taken <= io_iqIssues_2_bits_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_target <= io_iqIssues_2_bits_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_takenOffset <= io_iqIssues_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_valid <= io_iqIssues_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_btbHit <= io_iqIssues_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_btbIsJalr <= io_iqIssues_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_btbIsJal <= io_iqIssues_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_btbIsCall <= io_iqIssues_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_btbIsRet <= io_iqIssues_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_btbOffset <= io_iqIssues_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_phtCounter <= io_iqIssues_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_rasTop <= io_iqIssues_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_predTaken <= io_iqIssues_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_bpuInfo_meta_predTarget <= io_iqIssues_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_ldst <= io_iqIssues_2_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_lrs1 <= io_iqIssues_2_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_lrs2 <= io_iqIssues_2_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_pdst <= io_iqIssues_2_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_prs1 <= io_iqIssues_2_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_prs2 <= io_iqIssues_2_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_oldPdst <= io_iqIssues_2_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_rs1Valid <= io_iqIssues_2_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_rs2Valid <= io_iqIssues_2_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_rdValid <= io_iqIssues_2_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_snptId_valid <= io_iqIssues_2_bits_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_snptId_bits <= io_iqIssues_2_bits_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_robIdx_value <= io_iqIssues_2_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_robIdx_flag <= io_iqIssues_2_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_robIdxFull_value <= io_iqIssues_2_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_robIdxFull_flag <= io_iqIssues_2_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_lqIdx_value <= io_iqIssues_2_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_lqIdx_flag <= io_iqIssues_2_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_sqIdx_value <= io_iqIssues_2_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_sqIdx_flag <= io_iqIssues_2_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_issueQueue <= io_iqIssues_2_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_prs1Busy <= io_iqIssues_2_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_prs2Busy <= io_iqIssues_2_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_isSta <= io_iqIssues_2_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_2_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_2_isStd <= io_iqIssues_2_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
      out_valid_2 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
    end else if (out_killed_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      out_valid_2 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:19]
    end else begin
      out_valid_2 <= _GEN_1012;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pc <= rrd_uop_2_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_inst <= rrd_uop_2_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_fuType <= rrd_uop_2_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_aluOp <= rrd_uop_2_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_bruOp <= rrd_uop_2_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_lsuOp <= rrd_uop_2_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_csrOp <= rrd_uop_2_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_mulOp <= rrd_uop_2_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_divOp <= rrd_uop_2_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_src1Type <= rrd_uop_2_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_src2Type <= rrd_uop_2_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_immType <= rrd_uop_2_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_rfWen <= rrd_uop_2_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_memRead <= rrd_uop_2_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_memWrite <= rrd_uop_2_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_csrWen <= rrd_uop_2_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_isBranch <= rrd_uop_2_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_isJump <= rrd_uop_2_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ctrl_isPriv <= rrd_uop_2_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_excp_excpVec <= rrd_uop_2_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_imm <= rrd_uop_2_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_csrAddress <= rrd_uop_2_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdInfo_valid <= rrd_uop_2_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdInfo_isBr <= rrd_uop_2_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdInfo_isJal <= rrd_uop_2_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdInfo_isJalr <= rrd_uop_2_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdInfo_isCall <= rrd_uop_2_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdInfo_isRet <= rrd_uop_2_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdInfo_jumpTarget <= rrd_uop_2_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_pc <= rrd_uop_2_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_fallThrough <= rrd_uop_2_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_taken <= rrd_uop_2_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_target <= rrd_uop_2_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_takenOffset <= rrd_uop_2_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_valid <= rrd_uop_2_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_btbHit <= rrd_uop_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_btbIsJalr <= rrd_uop_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_btbIsJal <= rrd_uop_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_btbIsCall <= rrd_uop_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_btbIsRet <= rrd_uop_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_btbOffset <= rrd_uop_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_phtCounter <= rrd_uop_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_rasTop <= rrd_uop_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_predTaken <= rrd_uop_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_bpuInfo_meta_predTarget <= rrd_uop_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_ldst <= rrd_uop_2_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_lrs1 <= rrd_uop_2_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_lrs2 <= rrd_uop_2_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_pdst <= rrd_uop_2_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_prs1 <= rrd_uop_2_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_prs2 <= rrd_uop_2_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_oldPdst <= rrd_uop_2_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_rs1Valid <= rrd_uop_2_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_rs2Valid <= rrd_uop_2_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_rdValid <= rrd_uop_2_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_snptId_valid <= rrd_uop_2_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_snptId_bits <= rrd_uop_2_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_robIdx_value <= rrd_uop_2_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_robIdx_flag <= rrd_uop_2_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_robIdxFull_value <= rrd_uop_2_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_robIdxFull_flag <= rrd_uop_2_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_lqIdx_value <= rrd_uop_2_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_lqIdx_flag <= rrd_uop_2_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_sqIdx_value <= rrd_uop_2_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_sqIdx_flag <= rrd_uop_2_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_issueQueue <= rrd_uop_2_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_prs1Busy <= rrd_uop_2_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_prs2Busy <= rrd_uop_2_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_isSta <= rrd_uop_2_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_2_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_2_isStd <= rrd_uop_2_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
      out_rs1_2 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_2_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 147:22]
          out_rs1_2 <= 32'h0;
        end else begin
          out_rs1_2 <= _rs1Data_T_8;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
      out_rs2_2 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
    end else if (!(out_killed_2)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_2) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_2_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 150:10]
          out_rs2_2 <= 32'h0;
        end else begin
          out_rs2_2 <= _rs2Data_T_8;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
      rrd_valid_3 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
    end else if (rrd_killed_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      rrd_valid_3 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 168:19]
    end else begin
      rrd_valid_3 <= _GEN_1303;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pc <= io_iqIssues_3_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_inst <= io_iqIssues_3_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_fuType <= io_iqIssues_3_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_aluOp <= io_iqIssues_3_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_bruOp <= io_iqIssues_3_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_lsuOp <= io_iqIssues_3_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_csrOp <= io_iqIssues_3_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_mulOp <= io_iqIssues_3_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_divOp <= io_iqIssues_3_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_src1Type <= io_iqIssues_3_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_src2Type <= io_iqIssues_3_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_immType <= io_iqIssues_3_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_rfWen <= io_iqIssues_3_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_memRead <= io_iqIssues_3_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_memWrite <= io_iqIssues_3_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_csrWen <= io_iqIssues_3_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_isBranch <= io_iqIssues_3_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_isJump <= io_iqIssues_3_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ctrl_isPriv <= io_iqIssues_3_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_excp_excpVec <= io_iqIssues_3_bits_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_imm <= io_iqIssues_3_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_csrAddress <= io_iqIssues_3_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdInfo_valid <= io_iqIssues_3_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdInfo_isBr <= io_iqIssues_3_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdInfo_isJal <= io_iqIssues_3_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdInfo_isJalr <= io_iqIssues_3_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdInfo_isCall <= io_iqIssues_3_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdInfo_isRet <= io_iqIssues_3_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdInfo_jumpTarget <= io_iqIssues_3_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_pc <= io_iqIssues_3_bits_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_fallThrough <= io_iqIssues_3_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_taken <= io_iqIssues_3_bits_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_target <= io_iqIssues_3_bits_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_takenOffset <= io_iqIssues_3_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_valid <= io_iqIssues_3_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_btbHit <= io_iqIssues_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_btbIsJalr <= io_iqIssues_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_btbIsJal <= io_iqIssues_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_btbIsCall <= io_iqIssues_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_btbIsRet <= io_iqIssues_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_btbOffset <= io_iqIssues_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_phtCounter <= io_iqIssues_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_rasTop <= io_iqIssues_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_predTaken <= io_iqIssues_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_bpuInfo_meta_predTarget <= io_iqIssues_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_ldst <= io_iqIssues_3_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_lrs1 <= io_iqIssues_3_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_lrs2 <= io_iqIssues_3_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_pdst <= io_iqIssues_3_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_prs1 <= io_iqIssues_3_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_prs2 <= io_iqIssues_3_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_oldPdst <= io_iqIssues_3_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_rs1Valid <= io_iqIssues_3_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_rs2Valid <= io_iqIssues_3_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_rdValid <= io_iqIssues_3_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_snptId_valid <= io_iqIssues_3_bits_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_snptId_bits <= io_iqIssues_3_bits_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_robIdx_value <= io_iqIssues_3_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_robIdx_flag <= io_iqIssues_3_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_robIdxFull_value <= io_iqIssues_3_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_robIdxFull_flag <= io_iqIssues_3_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_lqIdx_value <= io_iqIssues_3_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_lqIdx_flag <= io_iqIssues_3_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_sqIdx_value <= io_iqIssues_3_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_sqIdx_flag <= io_iqIssues_3_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_issueQueue <= io_iqIssues_3_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_prs1Busy <= io_iqIssues_3_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_prs2Busy <= io_iqIssues_3_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_isSta <= io_iqIssues_3_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_3_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_3_isStd <= io_iqIssues_3_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
      out_valid_3 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
    end else if (out_killed_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      out_valid_3 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:19]
    end else begin
      out_valid_3 <= _GEN_1446;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pc <= rrd_uop_3_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_inst <= rrd_uop_3_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_fuType <= rrd_uop_3_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_aluOp <= rrd_uop_3_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_bruOp <= rrd_uop_3_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_lsuOp <= rrd_uop_3_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_csrOp <= rrd_uop_3_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_mulOp <= rrd_uop_3_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_divOp <= rrd_uop_3_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_src1Type <= rrd_uop_3_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_src2Type <= rrd_uop_3_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_immType <= rrd_uop_3_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_rfWen <= rrd_uop_3_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_memRead <= rrd_uop_3_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_memWrite <= rrd_uop_3_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_csrWen <= rrd_uop_3_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_isBranch <= rrd_uop_3_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_isJump <= rrd_uop_3_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ctrl_isPriv <= rrd_uop_3_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_excp_excpVec <= rrd_uop_3_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_imm <= rrd_uop_3_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_csrAddress <= rrd_uop_3_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdInfo_valid <= rrd_uop_3_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdInfo_isBr <= rrd_uop_3_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdInfo_isJal <= rrd_uop_3_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdInfo_isJalr <= rrd_uop_3_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdInfo_isCall <= rrd_uop_3_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdInfo_isRet <= rrd_uop_3_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdInfo_jumpTarget <= rrd_uop_3_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_pc <= rrd_uop_3_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_fallThrough <= rrd_uop_3_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_taken <= rrd_uop_3_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_target <= rrd_uop_3_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_takenOffset <= rrd_uop_3_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_valid <= rrd_uop_3_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_btbHit <= rrd_uop_3_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_btbIsJalr <= rrd_uop_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_btbIsJal <= rrd_uop_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_btbIsCall <= rrd_uop_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_btbIsRet <= rrd_uop_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_btbOffset <= rrd_uop_3_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_phtCounter <= rrd_uop_3_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_rasTop <= rrd_uop_3_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_predTaken <= rrd_uop_3_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_bpuInfo_meta_predTarget <= rrd_uop_3_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_ldst <= rrd_uop_3_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_lrs1 <= rrd_uop_3_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_lrs2 <= rrd_uop_3_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_pdst <= rrd_uop_3_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_prs1 <= rrd_uop_3_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_prs2 <= rrd_uop_3_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_oldPdst <= rrd_uop_3_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_rs1Valid <= rrd_uop_3_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_rs2Valid <= rrd_uop_3_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_rdValid <= rrd_uop_3_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_snptId_valid <= rrd_uop_3_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_snptId_bits <= rrd_uop_3_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_robIdx_value <= rrd_uop_3_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_robIdx_flag <= rrd_uop_3_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_robIdxFull_value <= rrd_uop_3_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_robIdxFull_flag <= rrd_uop_3_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_lqIdx_value <= rrd_uop_3_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_lqIdx_flag <= rrd_uop_3_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_sqIdx_value <= rrd_uop_3_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_sqIdx_flag <= rrd_uop_3_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_issueQueue <= rrd_uop_3_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_prs1Busy <= rrd_uop_3_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_prs2Busy <= rrd_uop_3_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_isSta <= rrd_uop_3_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_3_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_3_isStd <= rrd_uop_3_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
      out_rs1_3 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 95:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_3_rs1Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 147:22]
          out_rs1_3 <= 32'h0;
        end else begin
          out_rs1_3 <= _rs1Data_T_11;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
      out_rs2_3 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
    end else if (!(out_killed_3)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_3) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_3_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 154:10]
          out_rs2_3 <= 32'h0;
        end else begin
          out_rs2_3 <= _rs2Data_T_11;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
      rrd_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 90:28]
    end else if (rrd_killed_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      rrd_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 168:19]
    end else begin
      rrd_valid_4 <= _GEN_1737;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pc <= io_iqIssues_4_bits_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_inst <= io_iqIssues_4_bits_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_fuType <= io_iqIssues_4_bits_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_aluOp <= io_iqIssues_4_bits_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_bruOp <= io_iqIssues_4_bits_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_lsuOp <= io_iqIssues_4_bits_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_csrOp <= io_iqIssues_4_bits_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_mulOp <= io_iqIssues_4_bits_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_divOp <= io_iqIssues_4_bits_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_src1Type <= io_iqIssues_4_bits_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_src2Type <= io_iqIssues_4_bits_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_immType <= io_iqIssues_4_bits_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_rfWen <= io_iqIssues_4_bits_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_memRead <= io_iqIssues_4_bits_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_memWrite <= io_iqIssues_4_bits_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_csrWen <= io_iqIssues_4_bits_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_isBranch <= io_iqIssues_4_bits_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_isJump <= io_iqIssues_4_bits_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ctrl_isPriv <= io_iqIssues_4_bits_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_excp_excpVec <= io_iqIssues_4_bits_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_imm <= io_iqIssues_4_bits_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_csrAddress <= io_iqIssues_4_bits_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdInfo_valid <= io_iqIssues_4_bits_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdInfo_isBr <= io_iqIssues_4_bits_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdInfo_isJal <= io_iqIssues_4_bits_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdInfo_isJalr <= io_iqIssues_4_bits_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdInfo_isCall <= io_iqIssues_4_bits_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdInfo_isRet <= io_iqIssues_4_bits_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdInfo_jumpTarget <= io_iqIssues_4_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_pc <= io_iqIssues_4_bits_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_fallThrough <= io_iqIssues_4_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_taken <= io_iqIssues_4_bits_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_target <= io_iqIssues_4_bits_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_takenOffset <= io_iqIssues_4_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_valid <= io_iqIssues_4_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_btbHit <= io_iqIssues_4_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_btbIsJalr <= io_iqIssues_4_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_btbIsJal <= io_iqIssues_4_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_btbIsCall <= io_iqIssues_4_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_btbIsRet <= io_iqIssues_4_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_btbOffset <= io_iqIssues_4_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_phtCounter <= io_iqIssues_4_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_rasTop <= io_iqIssues_4_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_predTaken <= io_iqIssues_4_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_bpuInfo_meta_predTarget <= io_iqIssues_4_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_ldst <= io_iqIssues_4_bits_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_lrs1 <= io_iqIssues_4_bits_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_lrs2 <= io_iqIssues_4_bits_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_pdst <= io_iqIssues_4_bits_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_prs1 <= io_iqIssues_4_bits_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_prs2 <= io_iqIssues_4_bits_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_oldPdst <= io_iqIssues_4_bits_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_rs1Valid <= io_iqIssues_4_bits_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_rs2Valid <= io_iqIssues_4_bits_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_rdValid <= io_iqIssues_4_bits_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_snptId_valid <= io_iqIssues_4_bits_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_snptId_bits <= io_iqIssues_4_bits_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_robIdx_value <= io_iqIssues_4_bits_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_robIdx_flag <= io_iqIssues_4_bits_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_robIdxFull_value <= io_iqIssues_4_bits_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_robIdxFull_flag <= io_iqIssues_4_bits_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_lqIdx_value <= io_iqIssues_4_bits_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_lqIdx_flag <= io_iqIssues_4_bits_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_sqIdx_value <= io_iqIssues_4_bits_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_sqIdx_flag <= io_iqIssues_4_bits_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_issueQueue <= io_iqIssues_4_bits_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_prs1Busy <= io_iqIssues_4_bits_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_prs2Busy <= io_iqIssues_4_bits_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_isSta <= io_iqIssues_4_bits_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
      rrd_uop_4_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 91:28]
    end else if (!(rrd_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 167:24]
      if (iq_fire_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 169:27]
        rrd_uop_4_isStd <= io_iqIssues_4_bits_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 171:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
      out_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 93:28]
    end else if (out_killed_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      out_valid_4 <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 178:19]
    end else begin
      out_valid_4 <= _GEN_1880;
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pc <= rrd_uop_4_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_inst <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_inst <= rrd_uop_4_inst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_fuType <= rrd_uop_4_ctrl_fuType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_aluOp <= rrd_uop_4_ctrl_aluOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_bruOp <= rrd_uop_4_ctrl_bruOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_lsuOp <= rrd_uop_4_ctrl_lsuOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_csrOp <= rrd_uop_4_ctrl_csrOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_mulOp <= rrd_uop_4_ctrl_mulOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_divOp <= rrd_uop_4_ctrl_divOp; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_src1Type <= rrd_uop_4_ctrl_src1Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_src2Type <= rrd_uop_4_ctrl_src2Type; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_immType <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_immType <= rrd_uop_4_ctrl_immType; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_rfWen <= rrd_uop_4_ctrl_rfWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_memRead <= rrd_uop_4_ctrl_memRead; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_memWrite <= rrd_uop_4_ctrl_memWrite; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_csrWen <= rrd_uop_4_ctrl_csrWen; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_isBranch <= rrd_uop_4_ctrl_isBranch; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_isJump <= rrd_uop_4_ctrl_isJump; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ctrl_isPriv <= rrd_uop_4_ctrl_isPriv; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_excp_excpVec <= 17'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_excp_excpVec <= rrd_uop_4_excp_excpVec; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_imm <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_imm <= rrd_uop_4_imm; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_csrAddress <= 14'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_csrAddress <= rrd_uop_4_csrAddress; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdInfo_valid <= rrd_uop_4_pdInfo_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdInfo_isBr <= rrd_uop_4_pdInfo_isBr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdInfo_isJal <= rrd_uop_4_pdInfo_isJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdInfo_isJalr <= rrd_uop_4_pdInfo_isJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdInfo_isCall <= rrd_uop_4_pdInfo_isCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdInfo_isRet <= rrd_uop_4_pdInfo_isRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdInfo_jumpTarget <= rrd_uop_4_pdInfo_jumpTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_pc <= rrd_uop_4_bpuInfo_pc; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_fallThrough <= rrd_uop_4_bpuInfo_fallThrough; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_taken <= rrd_uop_4_bpuInfo_taken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_target <= rrd_uop_4_bpuInfo_target; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_takenOffset <= rrd_uop_4_bpuInfo_takenOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_valid <= rrd_uop_4_bpuInfo_meta_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_btbHit <= rrd_uop_4_bpuInfo_meta_btbHit; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_btbIsJalr <= rrd_uop_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_btbIsJal <= rrd_uop_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_btbIsCall <= rrd_uop_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_btbIsRet <= rrd_uop_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_btbOffset <= rrd_uop_4_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_phtCounter <= rrd_uop_4_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_rasTop <= rrd_uop_4_bpuInfo_meta_rasTop; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_predTaken <= rrd_uop_4_bpuInfo_meta_predTaken; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_bpuInfo_meta_predTarget <= rrd_uop_4_bpuInfo_meta_predTarget; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_ldst <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_ldst <= rrd_uop_4_ldst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_lrs1 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_lrs1 <= rrd_uop_4_lrs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_lrs2 <= 5'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_lrs2 <= rrd_uop_4_lrs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_pdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_pdst <= rrd_uop_4_pdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_prs1 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_prs1 <= rrd_uop_4_prs1; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_prs2 <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_prs2 <= rrd_uop_4_prs2; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_oldPdst <= 7'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_oldPdst <= rrd_uop_4_oldPdst; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_rs1Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_rs1Valid <= rrd_uop_4_rs1Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_rs2Valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_rs2Valid <= rrd_uop_4_rs2Valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_rdValid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_rdValid <= rrd_uop_4_rdValid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_snptId_valid <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_snptId_valid <= rrd_uop_4_snptId_valid; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_snptId_bits <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_snptId_bits <= rrd_uop_4_snptId_bits; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_robIdx_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_robIdx_value <= rrd_uop_4_robIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_robIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_robIdx_flag <= rrd_uop_4_robIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_robIdxFull_value <= 6'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_robIdxFull_value <= rrd_uop_4_robIdxFull_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_robIdxFull_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_robIdxFull_flag <= rrd_uop_4_robIdxFull_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_lqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_lqIdx_value <= rrd_uop_4_lqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_lqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_lqIdx_flag <= rrd_uop_4_lqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_sqIdx_value <= 4'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_sqIdx_value <= rrd_uop_4_sqIdx_value; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_sqIdx_flag <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_sqIdx_flag <= rrd_uop_4_sqIdx_flag; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_issueQueue <= 3'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_issueQueue <= rrd_uop_4_issueQueue; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_prs1Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_prs1Busy <= rrd_uop_4_prs1Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_prs2Busy <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_prs2Busy <= rrd_uop_4_prs2Busy; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_isSta <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_isSta <= rrd_uop_4_isSta; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
      out_uop_4_isStd <= 1'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 94:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        out_uop_4_isStd <= rrd_uop_4_isStd; // @[src/main/scala/backend/regfile/RegisterRead.scala 181:19]
      end
    end
    if (reset) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
      out_rs2_4 <= 32'h0; // @[src/main/scala/backend/regfile/RegisterRead.scala 96:28]
    end else if (!(out_killed_4)) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 177:24]
      if (rrd_to_out_4) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 179:30]
        if (~rrd_uop_4_rs2Valid) begin // @[src/main/scala/backend/regfile/RegisterRead.scala 154:10]
          out_rs2_4 <= 32'h0;
        end else begin
          out_rs2_4 <= _rs2Data_T_14;
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
  rrd_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rrd_uop_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  rrd_uop_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rrd_uop_ctrl_fuType = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  rrd_uop_ctrl_aluOp = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  rrd_uop_ctrl_bruOp = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  rrd_uop_ctrl_lsuOp = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  rrd_uop_ctrl_csrOp = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  rrd_uop_ctrl_mulOp = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  rrd_uop_ctrl_divOp = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  rrd_uop_ctrl_src1Type = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  rrd_uop_ctrl_src2Type = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  rrd_uop_ctrl_immType = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  rrd_uop_ctrl_rfWen = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  rrd_uop_ctrl_memRead = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  rrd_uop_ctrl_memWrite = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  rrd_uop_ctrl_csrWen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  rrd_uop_ctrl_isBranch = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  rrd_uop_ctrl_isJump = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  rrd_uop_ctrl_isPriv = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  rrd_uop_excp_excpVec = _RAND_20[16:0];
  _RAND_21 = {1{`RANDOM}};
  rrd_uop_imm = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  rrd_uop_csrAddress = _RAND_22[13:0];
  _RAND_23 = {1{`RANDOM}};
  rrd_uop_pdInfo_valid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  rrd_uop_pdInfo_isBr = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  rrd_uop_pdInfo_isJal = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  rrd_uop_pdInfo_isJalr = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  rrd_uop_pdInfo_isCall = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  rrd_uop_pdInfo_isRet = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  rrd_uop_pdInfo_jumpTarget = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  rrd_uop_bpuInfo_pc = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  rrd_uop_bpuInfo_fallThrough = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  rrd_uop_bpuInfo_taken = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  rrd_uop_bpuInfo_target = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  rrd_uop_bpuInfo_takenOffset = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_valid = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_btbHit = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_btbIsJalr = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_btbIsJal = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_btbIsCall = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_btbIsRet = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_btbOffset = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_phtCounter = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_rasTop = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_predTaken = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  rrd_uop_bpuInfo_meta_predTarget = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  rrd_uop_ldst = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  rrd_uop_lrs1 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  rrd_uop_lrs2 = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  rrd_uop_pdst = _RAND_49[6:0];
  _RAND_50 = {1{`RANDOM}};
  rrd_uop_prs1 = _RAND_50[6:0];
  _RAND_51 = {1{`RANDOM}};
  rrd_uop_prs2 = _RAND_51[6:0];
  _RAND_52 = {1{`RANDOM}};
  rrd_uop_oldPdst = _RAND_52[6:0];
  _RAND_53 = {1{`RANDOM}};
  rrd_uop_rs1Valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  rrd_uop_rs2Valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  rrd_uop_rdValid = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  rrd_uop_snptId_valid = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  rrd_uop_snptId_bits = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  rrd_uop_robIdx_value = _RAND_58[5:0];
  _RAND_59 = {1{`RANDOM}};
  rrd_uop_robIdx_flag = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  rrd_uop_robIdxFull_value = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  rrd_uop_robIdxFull_flag = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  rrd_uop_lqIdx_value = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  rrd_uop_lqIdx_flag = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  rrd_uop_sqIdx_value = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  rrd_uop_sqIdx_flag = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  rrd_uop_issueQueue = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  rrd_uop_prs1Busy = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  rrd_uop_prs2Busy = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  rrd_uop_isSta = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  rrd_uop_isStd = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  out_valid = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  out_uop_pc = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  out_uop_inst = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  out_uop_ctrl_fuType = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  out_uop_ctrl_aluOp = _RAND_75[4:0];
  _RAND_76 = {1{`RANDOM}};
  out_uop_ctrl_bruOp = _RAND_76[3:0];
  _RAND_77 = {1{`RANDOM}};
  out_uop_ctrl_lsuOp = _RAND_77[3:0];
  _RAND_78 = {1{`RANDOM}};
  out_uop_ctrl_csrOp = _RAND_78[2:0];
  _RAND_79 = {1{`RANDOM}};
  out_uop_ctrl_mulOp = _RAND_79[2:0];
  _RAND_80 = {1{`RANDOM}};
  out_uop_ctrl_divOp = _RAND_80[2:0];
  _RAND_81 = {1{`RANDOM}};
  out_uop_ctrl_src1Type = _RAND_81[2:0];
  _RAND_82 = {1{`RANDOM}};
  out_uop_ctrl_src2Type = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  out_uop_ctrl_immType = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  out_uop_ctrl_rfWen = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  out_uop_ctrl_memRead = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  out_uop_ctrl_memWrite = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  out_uop_ctrl_csrWen = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  out_uop_ctrl_isBranch = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  out_uop_ctrl_isJump = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  out_uop_ctrl_isPriv = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  out_uop_excp_excpVec = _RAND_91[16:0];
  _RAND_92 = {1{`RANDOM}};
  out_uop_imm = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  out_uop_csrAddress = _RAND_93[13:0];
  _RAND_94 = {1{`RANDOM}};
  out_uop_pdInfo_valid = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  out_uop_pdInfo_isBr = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  out_uop_pdInfo_isJal = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  out_uop_pdInfo_isJalr = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  out_uop_pdInfo_isCall = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  out_uop_pdInfo_isRet = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  out_uop_pdInfo_jumpTarget = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  out_uop_bpuInfo_pc = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  out_uop_bpuInfo_fallThrough = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  out_uop_bpuInfo_taken = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  out_uop_bpuInfo_target = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  out_uop_bpuInfo_takenOffset = _RAND_105[1:0];
  _RAND_106 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_valid = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_btbHit = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_btbIsJalr = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_btbIsJal = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_btbIsCall = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_btbIsRet = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_btbOffset = _RAND_112[1:0];
  _RAND_113 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_phtCounter = _RAND_113[1:0];
  _RAND_114 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_rasTop = _RAND_114[2:0];
  _RAND_115 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_predTaken = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  out_uop_bpuInfo_meta_predTarget = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  out_uop_ldst = _RAND_117[4:0];
  _RAND_118 = {1{`RANDOM}};
  out_uop_lrs1 = _RAND_118[4:0];
  _RAND_119 = {1{`RANDOM}};
  out_uop_lrs2 = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  out_uop_pdst = _RAND_120[6:0];
  _RAND_121 = {1{`RANDOM}};
  out_uop_prs1 = _RAND_121[6:0];
  _RAND_122 = {1{`RANDOM}};
  out_uop_prs2 = _RAND_122[6:0];
  _RAND_123 = {1{`RANDOM}};
  out_uop_oldPdst = _RAND_123[6:0];
  _RAND_124 = {1{`RANDOM}};
  out_uop_rs1Valid = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  out_uop_rs2Valid = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  out_uop_rdValid = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  out_uop_snptId_valid = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  out_uop_snptId_bits = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  out_uop_robIdx_value = _RAND_129[5:0];
  _RAND_130 = {1{`RANDOM}};
  out_uop_robIdx_flag = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  out_uop_robIdxFull_value = _RAND_131[5:0];
  _RAND_132 = {1{`RANDOM}};
  out_uop_robIdxFull_flag = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  out_uop_lqIdx_value = _RAND_133[3:0];
  _RAND_134 = {1{`RANDOM}};
  out_uop_lqIdx_flag = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  out_uop_sqIdx_value = _RAND_135[3:0];
  _RAND_136 = {1{`RANDOM}};
  out_uop_sqIdx_flag = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  out_uop_issueQueue = _RAND_137[2:0];
  _RAND_138 = {1{`RANDOM}};
  out_uop_prs1Busy = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  out_uop_prs2Busy = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  out_uop_isSta = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  out_uop_isStd = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  out_rs1 = _RAND_142[31:0];
  _RAND_143 = {1{`RANDOM}};
  out_rs2 = _RAND_143[31:0];
  _RAND_144 = {1{`RANDOM}};
  rrd_valid_1 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  rrd_uop_1_pc = _RAND_145[31:0];
  _RAND_146 = {1{`RANDOM}};
  rrd_uop_1_inst = _RAND_146[31:0];
  _RAND_147 = {1{`RANDOM}};
  rrd_uop_1_ctrl_fuType = _RAND_147[3:0];
  _RAND_148 = {1{`RANDOM}};
  rrd_uop_1_ctrl_aluOp = _RAND_148[4:0];
  _RAND_149 = {1{`RANDOM}};
  rrd_uop_1_ctrl_bruOp = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  rrd_uop_1_ctrl_lsuOp = _RAND_150[3:0];
  _RAND_151 = {1{`RANDOM}};
  rrd_uop_1_ctrl_csrOp = _RAND_151[2:0];
  _RAND_152 = {1{`RANDOM}};
  rrd_uop_1_ctrl_mulOp = _RAND_152[2:0];
  _RAND_153 = {1{`RANDOM}};
  rrd_uop_1_ctrl_divOp = _RAND_153[2:0];
  _RAND_154 = {1{`RANDOM}};
  rrd_uop_1_ctrl_src1Type = _RAND_154[2:0];
  _RAND_155 = {1{`RANDOM}};
  rrd_uop_1_ctrl_src2Type = _RAND_155[2:0];
  _RAND_156 = {1{`RANDOM}};
  rrd_uop_1_ctrl_immType = _RAND_156[3:0];
  _RAND_157 = {1{`RANDOM}};
  rrd_uop_1_ctrl_rfWen = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  rrd_uop_1_ctrl_memRead = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  rrd_uop_1_ctrl_memWrite = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  rrd_uop_1_ctrl_csrWen = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isBranch = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isJump = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  rrd_uop_1_ctrl_isPriv = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  rrd_uop_1_excp_excpVec = _RAND_164[16:0];
  _RAND_165 = {1{`RANDOM}};
  rrd_uop_1_imm = _RAND_165[31:0];
  _RAND_166 = {1{`RANDOM}};
  rrd_uop_1_csrAddress = _RAND_166[13:0];
  _RAND_167 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_valid = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isBr = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isJal = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isJalr = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isCall = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_isRet = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  rrd_uop_1_pdInfo_jumpTarget = _RAND_173[31:0];
  _RAND_174 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_pc = _RAND_174[31:0];
  _RAND_175 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_fallThrough = _RAND_175[31:0];
  _RAND_176 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_taken = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_target = _RAND_177[31:0];
  _RAND_178 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_takenOffset = _RAND_178[1:0];
  _RAND_179 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_valid = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_btbHit = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_btbIsJalr = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_btbIsJal = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_btbIsCall = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_btbIsRet = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_btbOffset = _RAND_185[1:0];
  _RAND_186 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_phtCounter = _RAND_186[1:0];
  _RAND_187 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_rasTop = _RAND_187[2:0];
  _RAND_188 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_predTaken = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  rrd_uop_1_bpuInfo_meta_predTarget = _RAND_189[31:0];
  _RAND_190 = {1{`RANDOM}};
  rrd_uop_1_ldst = _RAND_190[4:0];
  _RAND_191 = {1{`RANDOM}};
  rrd_uop_1_lrs1 = _RAND_191[4:0];
  _RAND_192 = {1{`RANDOM}};
  rrd_uop_1_lrs2 = _RAND_192[4:0];
  _RAND_193 = {1{`RANDOM}};
  rrd_uop_1_pdst = _RAND_193[6:0];
  _RAND_194 = {1{`RANDOM}};
  rrd_uop_1_prs1 = _RAND_194[6:0];
  _RAND_195 = {1{`RANDOM}};
  rrd_uop_1_prs2 = _RAND_195[6:0];
  _RAND_196 = {1{`RANDOM}};
  rrd_uop_1_oldPdst = _RAND_196[6:0];
  _RAND_197 = {1{`RANDOM}};
  rrd_uop_1_rs1Valid = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  rrd_uop_1_rs2Valid = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  rrd_uop_1_rdValid = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  rrd_uop_1_snptId_valid = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  rrd_uop_1_snptId_bits = _RAND_201[2:0];
  _RAND_202 = {1{`RANDOM}};
  rrd_uop_1_robIdx_value = _RAND_202[5:0];
  _RAND_203 = {1{`RANDOM}};
  rrd_uop_1_robIdx_flag = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  rrd_uop_1_robIdxFull_value = _RAND_204[5:0];
  _RAND_205 = {1{`RANDOM}};
  rrd_uop_1_robIdxFull_flag = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  rrd_uop_1_issueQueue = _RAND_206[2:0];
  _RAND_207 = {1{`RANDOM}};
  rrd_uop_1_prs1Busy = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  rrd_uop_1_prs2Busy = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  out_valid_1 = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  out_uop_1_pc = _RAND_210[31:0];
  _RAND_211 = {1{`RANDOM}};
  out_uop_1_inst = _RAND_211[31:0];
  _RAND_212 = {1{`RANDOM}};
  out_uop_1_ctrl_fuType = _RAND_212[3:0];
  _RAND_213 = {1{`RANDOM}};
  out_uop_1_ctrl_aluOp = _RAND_213[4:0];
  _RAND_214 = {1{`RANDOM}};
  out_uop_1_ctrl_bruOp = _RAND_214[3:0];
  _RAND_215 = {1{`RANDOM}};
  out_uop_1_ctrl_lsuOp = _RAND_215[3:0];
  _RAND_216 = {1{`RANDOM}};
  out_uop_1_ctrl_csrOp = _RAND_216[2:0];
  _RAND_217 = {1{`RANDOM}};
  out_uop_1_ctrl_mulOp = _RAND_217[2:0];
  _RAND_218 = {1{`RANDOM}};
  out_uop_1_ctrl_divOp = _RAND_218[2:0];
  _RAND_219 = {1{`RANDOM}};
  out_uop_1_ctrl_src1Type = _RAND_219[2:0];
  _RAND_220 = {1{`RANDOM}};
  out_uop_1_ctrl_src2Type = _RAND_220[2:0];
  _RAND_221 = {1{`RANDOM}};
  out_uop_1_ctrl_immType = _RAND_221[3:0];
  _RAND_222 = {1{`RANDOM}};
  out_uop_1_ctrl_rfWen = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  out_uop_1_ctrl_memRead = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  out_uop_1_ctrl_memWrite = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  out_uop_1_ctrl_csrWen = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  out_uop_1_ctrl_isBranch = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  out_uop_1_ctrl_isJump = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  out_uop_1_ctrl_isPriv = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  out_uop_1_excp_excpVec = _RAND_229[16:0];
  _RAND_230 = {1{`RANDOM}};
  out_uop_1_imm = _RAND_230[31:0];
  _RAND_231 = {1{`RANDOM}};
  out_uop_1_csrAddress = _RAND_231[13:0];
  _RAND_232 = {1{`RANDOM}};
  out_uop_1_pdInfo_valid = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  out_uop_1_pdInfo_isBr = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  out_uop_1_pdInfo_isJal = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  out_uop_1_pdInfo_isJalr = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  out_uop_1_pdInfo_isCall = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  out_uop_1_pdInfo_isRet = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  out_uop_1_pdInfo_jumpTarget = _RAND_238[31:0];
  _RAND_239 = {1{`RANDOM}};
  out_uop_1_bpuInfo_pc = _RAND_239[31:0];
  _RAND_240 = {1{`RANDOM}};
  out_uop_1_bpuInfo_fallThrough = _RAND_240[31:0];
  _RAND_241 = {1{`RANDOM}};
  out_uop_1_bpuInfo_taken = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  out_uop_1_bpuInfo_target = _RAND_242[31:0];
  _RAND_243 = {1{`RANDOM}};
  out_uop_1_bpuInfo_takenOffset = _RAND_243[1:0];
  _RAND_244 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_valid = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_btbHit = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_btbIsJalr = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_btbIsJal = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_btbIsCall = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_btbIsRet = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_btbOffset = _RAND_250[1:0];
  _RAND_251 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_phtCounter = _RAND_251[1:0];
  _RAND_252 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_rasTop = _RAND_252[2:0];
  _RAND_253 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_predTaken = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  out_uop_1_bpuInfo_meta_predTarget = _RAND_254[31:0];
  _RAND_255 = {1{`RANDOM}};
  out_uop_1_ldst = _RAND_255[4:0];
  _RAND_256 = {1{`RANDOM}};
  out_uop_1_lrs1 = _RAND_256[4:0];
  _RAND_257 = {1{`RANDOM}};
  out_uop_1_lrs2 = _RAND_257[4:0];
  _RAND_258 = {1{`RANDOM}};
  out_uop_1_pdst = _RAND_258[6:0];
  _RAND_259 = {1{`RANDOM}};
  out_uop_1_prs1 = _RAND_259[6:0];
  _RAND_260 = {1{`RANDOM}};
  out_uop_1_prs2 = _RAND_260[6:0];
  _RAND_261 = {1{`RANDOM}};
  out_uop_1_oldPdst = _RAND_261[6:0];
  _RAND_262 = {1{`RANDOM}};
  out_uop_1_rs1Valid = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  out_uop_1_rs2Valid = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  out_uop_1_rdValid = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  out_uop_1_snptId_valid = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  out_uop_1_snptId_bits = _RAND_266[2:0];
  _RAND_267 = {1{`RANDOM}};
  out_uop_1_robIdx_value = _RAND_267[5:0];
  _RAND_268 = {1{`RANDOM}};
  out_uop_1_robIdx_flag = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  out_uop_1_robIdxFull_value = _RAND_269[5:0];
  _RAND_270 = {1{`RANDOM}};
  out_uop_1_robIdxFull_flag = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  out_uop_1_issueQueue = _RAND_271[2:0];
  _RAND_272 = {1{`RANDOM}};
  out_uop_1_prs1Busy = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  out_uop_1_prs2Busy = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  out_rs1_1 = _RAND_274[31:0];
  _RAND_275 = {1{`RANDOM}};
  out_rs2_1 = _RAND_275[31:0];
  _RAND_276 = {1{`RANDOM}};
  rrd_valid_2 = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  rrd_uop_2_pc = _RAND_277[31:0];
  _RAND_278 = {1{`RANDOM}};
  rrd_uop_2_inst = _RAND_278[31:0];
  _RAND_279 = {1{`RANDOM}};
  rrd_uop_2_ctrl_fuType = _RAND_279[3:0];
  _RAND_280 = {1{`RANDOM}};
  rrd_uop_2_ctrl_aluOp = _RAND_280[4:0];
  _RAND_281 = {1{`RANDOM}};
  rrd_uop_2_ctrl_bruOp = _RAND_281[3:0];
  _RAND_282 = {1{`RANDOM}};
  rrd_uop_2_ctrl_lsuOp = _RAND_282[3:0];
  _RAND_283 = {1{`RANDOM}};
  rrd_uop_2_ctrl_csrOp = _RAND_283[2:0];
  _RAND_284 = {1{`RANDOM}};
  rrd_uop_2_ctrl_mulOp = _RAND_284[2:0];
  _RAND_285 = {1{`RANDOM}};
  rrd_uop_2_ctrl_divOp = _RAND_285[2:0];
  _RAND_286 = {1{`RANDOM}};
  rrd_uop_2_ctrl_src1Type = _RAND_286[2:0];
  _RAND_287 = {1{`RANDOM}};
  rrd_uop_2_ctrl_src2Type = _RAND_287[2:0];
  _RAND_288 = {1{`RANDOM}};
  rrd_uop_2_ctrl_immType = _RAND_288[3:0];
  _RAND_289 = {1{`RANDOM}};
  rrd_uop_2_ctrl_rfWen = _RAND_289[0:0];
  _RAND_290 = {1{`RANDOM}};
  rrd_uop_2_ctrl_memRead = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  rrd_uop_2_ctrl_memWrite = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  rrd_uop_2_ctrl_csrWen = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isBranch = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isJump = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  rrd_uop_2_ctrl_isPriv = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  rrd_uop_2_excp_excpVec = _RAND_296[16:0];
  _RAND_297 = {1{`RANDOM}};
  rrd_uop_2_imm = _RAND_297[31:0];
  _RAND_298 = {1{`RANDOM}};
  rrd_uop_2_csrAddress = _RAND_298[13:0];
  _RAND_299 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_valid = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isBr = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isJal = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isJalr = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isCall = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_isRet = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  rrd_uop_2_pdInfo_jumpTarget = _RAND_305[31:0];
  _RAND_306 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_pc = _RAND_306[31:0];
  _RAND_307 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_fallThrough = _RAND_307[31:0];
  _RAND_308 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_taken = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_target = _RAND_309[31:0];
  _RAND_310 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_takenOffset = _RAND_310[1:0];
  _RAND_311 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_valid = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_btbHit = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_btbIsJalr = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_btbIsJal = _RAND_314[0:0];
  _RAND_315 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_btbIsCall = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_btbIsRet = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_btbOffset = _RAND_317[1:0];
  _RAND_318 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_phtCounter = _RAND_318[1:0];
  _RAND_319 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_rasTop = _RAND_319[2:0];
  _RAND_320 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_predTaken = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  rrd_uop_2_bpuInfo_meta_predTarget = _RAND_321[31:0];
  _RAND_322 = {1{`RANDOM}};
  rrd_uop_2_ldst = _RAND_322[4:0];
  _RAND_323 = {1{`RANDOM}};
  rrd_uop_2_lrs1 = _RAND_323[4:0];
  _RAND_324 = {1{`RANDOM}};
  rrd_uop_2_lrs2 = _RAND_324[4:0];
  _RAND_325 = {1{`RANDOM}};
  rrd_uop_2_pdst = _RAND_325[6:0];
  _RAND_326 = {1{`RANDOM}};
  rrd_uop_2_prs1 = _RAND_326[6:0];
  _RAND_327 = {1{`RANDOM}};
  rrd_uop_2_prs2 = _RAND_327[6:0];
  _RAND_328 = {1{`RANDOM}};
  rrd_uop_2_oldPdst = _RAND_328[6:0];
  _RAND_329 = {1{`RANDOM}};
  rrd_uop_2_rs1Valid = _RAND_329[0:0];
  _RAND_330 = {1{`RANDOM}};
  rrd_uop_2_rs2Valid = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  rrd_uop_2_rdValid = _RAND_331[0:0];
  _RAND_332 = {1{`RANDOM}};
  rrd_uop_2_snptId_valid = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  rrd_uop_2_snptId_bits = _RAND_333[2:0];
  _RAND_334 = {1{`RANDOM}};
  rrd_uop_2_robIdx_value = _RAND_334[5:0];
  _RAND_335 = {1{`RANDOM}};
  rrd_uop_2_robIdx_flag = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  rrd_uop_2_robIdxFull_value = _RAND_336[5:0];
  _RAND_337 = {1{`RANDOM}};
  rrd_uop_2_robIdxFull_flag = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  rrd_uop_2_lqIdx_value = _RAND_338[3:0];
  _RAND_339 = {1{`RANDOM}};
  rrd_uop_2_lqIdx_flag = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  rrd_uop_2_sqIdx_value = _RAND_340[3:0];
  _RAND_341 = {1{`RANDOM}};
  rrd_uop_2_sqIdx_flag = _RAND_341[0:0];
  _RAND_342 = {1{`RANDOM}};
  rrd_uop_2_issueQueue = _RAND_342[2:0];
  _RAND_343 = {1{`RANDOM}};
  rrd_uop_2_prs1Busy = _RAND_343[0:0];
  _RAND_344 = {1{`RANDOM}};
  rrd_uop_2_prs2Busy = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  rrd_uop_2_isSta = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  rrd_uop_2_isStd = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  out_valid_2 = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  out_uop_2_pc = _RAND_348[31:0];
  _RAND_349 = {1{`RANDOM}};
  out_uop_2_inst = _RAND_349[31:0];
  _RAND_350 = {1{`RANDOM}};
  out_uop_2_ctrl_fuType = _RAND_350[3:0];
  _RAND_351 = {1{`RANDOM}};
  out_uop_2_ctrl_aluOp = _RAND_351[4:0];
  _RAND_352 = {1{`RANDOM}};
  out_uop_2_ctrl_bruOp = _RAND_352[3:0];
  _RAND_353 = {1{`RANDOM}};
  out_uop_2_ctrl_lsuOp = _RAND_353[3:0];
  _RAND_354 = {1{`RANDOM}};
  out_uop_2_ctrl_csrOp = _RAND_354[2:0];
  _RAND_355 = {1{`RANDOM}};
  out_uop_2_ctrl_mulOp = _RAND_355[2:0];
  _RAND_356 = {1{`RANDOM}};
  out_uop_2_ctrl_divOp = _RAND_356[2:0];
  _RAND_357 = {1{`RANDOM}};
  out_uop_2_ctrl_src1Type = _RAND_357[2:0];
  _RAND_358 = {1{`RANDOM}};
  out_uop_2_ctrl_src2Type = _RAND_358[2:0];
  _RAND_359 = {1{`RANDOM}};
  out_uop_2_ctrl_immType = _RAND_359[3:0];
  _RAND_360 = {1{`RANDOM}};
  out_uop_2_ctrl_rfWen = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  out_uop_2_ctrl_memRead = _RAND_361[0:0];
  _RAND_362 = {1{`RANDOM}};
  out_uop_2_ctrl_memWrite = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  out_uop_2_ctrl_csrWen = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  out_uop_2_ctrl_isBranch = _RAND_364[0:0];
  _RAND_365 = {1{`RANDOM}};
  out_uop_2_ctrl_isJump = _RAND_365[0:0];
  _RAND_366 = {1{`RANDOM}};
  out_uop_2_ctrl_isPriv = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  out_uop_2_excp_excpVec = _RAND_367[16:0];
  _RAND_368 = {1{`RANDOM}};
  out_uop_2_imm = _RAND_368[31:0];
  _RAND_369 = {1{`RANDOM}};
  out_uop_2_csrAddress = _RAND_369[13:0];
  _RAND_370 = {1{`RANDOM}};
  out_uop_2_pdInfo_valid = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  out_uop_2_pdInfo_isBr = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  out_uop_2_pdInfo_isJal = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  out_uop_2_pdInfo_isJalr = _RAND_373[0:0];
  _RAND_374 = {1{`RANDOM}};
  out_uop_2_pdInfo_isCall = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  out_uop_2_pdInfo_isRet = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  out_uop_2_pdInfo_jumpTarget = _RAND_376[31:0];
  _RAND_377 = {1{`RANDOM}};
  out_uop_2_bpuInfo_pc = _RAND_377[31:0];
  _RAND_378 = {1{`RANDOM}};
  out_uop_2_bpuInfo_fallThrough = _RAND_378[31:0];
  _RAND_379 = {1{`RANDOM}};
  out_uop_2_bpuInfo_taken = _RAND_379[0:0];
  _RAND_380 = {1{`RANDOM}};
  out_uop_2_bpuInfo_target = _RAND_380[31:0];
  _RAND_381 = {1{`RANDOM}};
  out_uop_2_bpuInfo_takenOffset = _RAND_381[1:0];
  _RAND_382 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_valid = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_btbHit = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_btbIsJalr = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_btbIsJal = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_btbIsCall = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_btbIsRet = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_btbOffset = _RAND_388[1:0];
  _RAND_389 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_phtCounter = _RAND_389[1:0];
  _RAND_390 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_rasTop = _RAND_390[2:0];
  _RAND_391 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_predTaken = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  out_uop_2_bpuInfo_meta_predTarget = _RAND_392[31:0];
  _RAND_393 = {1{`RANDOM}};
  out_uop_2_ldst = _RAND_393[4:0];
  _RAND_394 = {1{`RANDOM}};
  out_uop_2_lrs1 = _RAND_394[4:0];
  _RAND_395 = {1{`RANDOM}};
  out_uop_2_lrs2 = _RAND_395[4:0];
  _RAND_396 = {1{`RANDOM}};
  out_uop_2_pdst = _RAND_396[6:0];
  _RAND_397 = {1{`RANDOM}};
  out_uop_2_prs1 = _RAND_397[6:0];
  _RAND_398 = {1{`RANDOM}};
  out_uop_2_prs2 = _RAND_398[6:0];
  _RAND_399 = {1{`RANDOM}};
  out_uop_2_oldPdst = _RAND_399[6:0];
  _RAND_400 = {1{`RANDOM}};
  out_uop_2_rs1Valid = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  out_uop_2_rs2Valid = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  out_uop_2_rdValid = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  out_uop_2_snptId_valid = _RAND_403[0:0];
  _RAND_404 = {1{`RANDOM}};
  out_uop_2_snptId_bits = _RAND_404[2:0];
  _RAND_405 = {1{`RANDOM}};
  out_uop_2_robIdx_value = _RAND_405[5:0];
  _RAND_406 = {1{`RANDOM}};
  out_uop_2_robIdx_flag = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  out_uop_2_robIdxFull_value = _RAND_407[5:0];
  _RAND_408 = {1{`RANDOM}};
  out_uop_2_robIdxFull_flag = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  out_uop_2_lqIdx_value = _RAND_409[3:0];
  _RAND_410 = {1{`RANDOM}};
  out_uop_2_lqIdx_flag = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  out_uop_2_sqIdx_value = _RAND_411[3:0];
  _RAND_412 = {1{`RANDOM}};
  out_uop_2_sqIdx_flag = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  out_uop_2_issueQueue = _RAND_413[2:0];
  _RAND_414 = {1{`RANDOM}};
  out_uop_2_prs1Busy = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  out_uop_2_prs2Busy = _RAND_415[0:0];
  _RAND_416 = {1{`RANDOM}};
  out_uop_2_isSta = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  out_uop_2_isStd = _RAND_417[0:0];
  _RAND_418 = {1{`RANDOM}};
  out_rs1_2 = _RAND_418[31:0];
  _RAND_419 = {1{`RANDOM}};
  out_rs2_2 = _RAND_419[31:0];
  _RAND_420 = {1{`RANDOM}};
  rrd_valid_3 = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  rrd_uop_3_pc = _RAND_421[31:0];
  _RAND_422 = {1{`RANDOM}};
  rrd_uop_3_inst = _RAND_422[31:0];
  _RAND_423 = {1{`RANDOM}};
  rrd_uop_3_ctrl_fuType = _RAND_423[3:0];
  _RAND_424 = {1{`RANDOM}};
  rrd_uop_3_ctrl_aluOp = _RAND_424[4:0];
  _RAND_425 = {1{`RANDOM}};
  rrd_uop_3_ctrl_bruOp = _RAND_425[3:0];
  _RAND_426 = {1{`RANDOM}};
  rrd_uop_3_ctrl_lsuOp = _RAND_426[3:0];
  _RAND_427 = {1{`RANDOM}};
  rrd_uop_3_ctrl_csrOp = _RAND_427[2:0];
  _RAND_428 = {1{`RANDOM}};
  rrd_uop_3_ctrl_mulOp = _RAND_428[2:0];
  _RAND_429 = {1{`RANDOM}};
  rrd_uop_3_ctrl_divOp = _RAND_429[2:0];
  _RAND_430 = {1{`RANDOM}};
  rrd_uop_3_ctrl_src1Type = _RAND_430[2:0];
  _RAND_431 = {1{`RANDOM}};
  rrd_uop_3_ctrl_src2Type = _RAND_431[2:0];
  _RAND_432 = {1{`RANDOM}};
  rrd_uop_3_ctrl_immType = _RAND_432[3:0];
  _RAND_433 = {1{`RANDOM}};
  rrd_uop_3_ctrl_rfWen = _RAND_433[0:0];
  _RAND_434 = {1{`RANDOM}};
  rrd_uop_3_ctrl_memRead = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  rrd_uop_3_ctrl_memWrite = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  rrd_uop_3_ctrl_csrWen = _RAND_436[0:0];
  _RAND_437 = {1{`RANDOM}};
  rrd_uop_3_ctrl_isBranch = _RAND_437[0:0];
  _RAND_438 = {1{`RANDOM}};
  rrd_uop_3_ctrl_isJump = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  rrd_uop_3_ctrl_isPriv = _RAND_439[0:0];
  _RAND_440 = {1{`RANDOM}};
  rrd_uop_3_excp_excpVec = _RAND_440[16:0];
  _RAND_441 = {1{`RANDOM}};
  rrd_uop_3_imm = _RAND_441[31:0];
  _RAND_442 = {1{`RANDOM}};
  rrd_uop_3_csrAddress = _RAND_442[13:0];
  _RAND_443 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_valid = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isBr = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isJal = _RAND_445[0:0];
  _RAND_446 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isJalr = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isCall = _RAND_447[0:0];
  _RAND_448 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_isRet = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  rrd_uop_3_pdInfo_jumpTarget = _RAND_449[31:0];
  _RAND_450 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_pc = _RAND_450[31:0];
  _RAND_451 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_fallThrough = _RAND_451[31:0];
  _RAND_452 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_taken = _RAND_452[0:0];
  _RAND_453 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_target = _RAND_453[31:0];
  _RAND_454 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_takenOffset = _RAND_454[1:0];
  _RAND_455 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_valid = _RAND_455[0:0];
  _RAND_456 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_btbHit = _RAND_456[0:0];
  _RAND_457 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_btbIsJalr = _RAND_457[0:0];
  _RAND_458 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_btbIsJal = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_btbIsCall = _RAND_459[0:0];
  _RAND_460 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_btbIsRet = _RAND_460[0:0];
  _RAND_461 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_btbOffset = _RAND_461[1:0];
  _RAND_462 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_phtCounter = _RAND_462[1:0];
  _RAND_463 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_rasTop = _RAND_463[2:0];
  _RAND_464 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_predTaken = _RAND_464[0:0];
  _RAND_465 = {1{`RANDOM}};
  rrd_uop_3_bpuInfo_meta_predTarget = _RAND_465[31:0];
  _RAND_466 = {1{`RANDOM}};
  rrd_uop_3_ldst = _RAND_466[4:0];
  _RAND_467 = {1{`RANDOM}};
  rrd_uop_3_lrs1 = _RAND_467[4:0];
  _RAND_468 = {1{`RANDOM}};
  rrd_uop_3_lrs2 = _RAND_468[4:0];
  _RAND_469 = {1{`RANDOM}};
  rrd_uop_3_pdst = _RAND_469[6:0];
  _RAND_470 = {1{`RANDOM}};
  rrd_uop_3_prs1 = _RAND_470[6:0];
  _RAND_471 = {1{`RANDOM}};
  rrd_uop_3_prs2 = _RAND_471[6:0];
  _RAND_472 = {1{`RANDOM}};
  rrd_uop_3_oldPdst = _RAND_472[6:0];
  _RAND_473 = {1{`RANDOM}};
  rrd_uop_3_rs1Valid = _RAND_473[0:0];
  _RAND_474 = {1{`RANDOM}};
  rrd_uop_3_rs2Valid = _RAND_474[0:0];
  _RAND_475 = {1{`RANDOM}};
  rrd_uop_3_rdValid = _RAND_475[0:0];
  _RAND_476 = {1{`RANDOM}};
  rrd_uop_3_snptId_valid = _RAND_476[0:0];
  _RAND_477 = {1{`RANDOM}};
  rrd_uop_3_snptId_bits = _RAND_477[2:0];
  _RAND_478 = {1{`RANDOM}};
  rrd_uop_3_robIdx_value = _RAND_478[5:0];
  _RAND_479 = {1{`RANDOM}};
  rrd_uop_3_robIdx_flag = _RAND_479[0:0];
  _RAND_480 = {1{`RANDOM}};
  rrd_uop_3_robIdxFull_value = _RAND_480[5:0];
  _RAND_481 = {1{`RANDOM}};
  rrd_uop_3_robIdxFull_flag = _RAND_481[0:0];
  _RAND_482 = {1{`RANDOM}};
  rrd_uop_3_lqIdx_value = _RAND_482[3:0];
  _RAND_483 = {1{`RANDOM}};
  rrd_uop_3_lqIdx_flag = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  rrd_uop_3_sqIdx_value = _RAND_484[3:0];
  _RAND_485 = {1{`RANDOM}};
  rrd_uop_3_sqIdx_flag = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  rrd_uop_3_issueQueue = _RAND_486[2:0];
  _RAND_487 = {1{`RANDOM}};
  rrd_uop_3_prs1Busy = _RAND_487[0:0];
  _RAND_488 = {1{`RANDOM}};
  rrd_uop_3_prs2Busy = _RAND_488[0:0];
  _RAND_489 = {1{`RANDOM}};
  rrd_uop_3_isSta = _RAND_489[0:0];
  _RAND_490 = {1{`RANDOM}};
  rrd_uop_3_isStd = _RAND_490[0:0];
  _RAND_491 = {1{`RANDOM}};
  out_valid_3 = _RAND_491[0:0];
  _RAND_492 = {1{`RANDOM}};
  out_uop_3_pc = _RAND_492[31:0];
  _RAND_493 = {1{`RANDOM}};
  out_uop_3_inst = _RAND_493[31:0];
  _RAND_494 = {1{`RANDOM}};
  out_uop_3_ctrl_fuType = _RAND_494[3:0];
  _RAND_495 = {1{`RANDOM}};
  out_uop_3_ctrl_aluOp = _RAND_495[4:0];
  _RAND_496 = {1{`RANDOM}};
  out_uop_3_ctrl_bruOp = _RAND_496[3:0];
  _RAND_497 = {1{`RANDOM}};
  out_uop_3_ctrl_lsuOp = _RAND_497[3:0];
  _RAND_498 = {1{`RANDOM}};
  out_uop_3_ctrl_csrOp = _RAND_498[2:0];
  _RAND_499 = {1{`RANDOM}};
  out_uop_3_ctrl_mulOp = _RAND_499[2:0];
  _RAND_500 = {1{`RANDOM}};
  out_uop_3_ctrl_divOp = _RAND_500[2:0];
  _RAND_501 = {1{`RANDOM}};
  out_uop_3_ctrl_src1Type = _RAND_501[2:0];
  _RAND_502 = {1{`RANDOM}};
  out_uop_3_ctrl_src2Type = _RAND_502[2:0];
  _RAND_503 = {1{`RANDOM}};
  out_uop_3_ctrl_immType = _RAND_503[3:0];
  _RAND_504 = {1{`RANDOM}};
  out_uop_3_ctrl_rfWen = _RAND_504[0:0];
  _RAND_505 = {1{`RANDOM}};
  out_uop_3_ctrl_memRead = _RAND_505[0:0];
  _RAND_506 = {1{`RANDOM}};
  out_uop_3_ctrl_memWrite = _RAND_506[0:0];
  _RAND_507 = {1{`RANDOM}};
  out_uop_3_ctrl_csrWen = _RAND_507[0:0];
  _RAND_508 = {1{`RANDOM}};
  out_uop_3_ctrl_isBranch = _RAND_508[0:0];
  _RAND_509 = {1{`RANDOM}};
  out_uop_3_ctrl_isJump = _RAND_509[0:0];
  _RAND_510 = {1{`RANDOM}};
  out_uop_3_ctrl_isPriv = _RAND_510[0:0];
  _RAND_511 = {1{`RANDOM}};
  out_uop_3_excp_excpVec = _RAND_511[16:0];
  _RAND_512 = {1{`RANDOM}};
  out_uop_3_imm = _RAND_512[31:0];
  _RAND_513 = {1{`RANDOM}};
  out_uop_3_csrAddress = _RAND_513[13:0];
  _RAND_514 = {1{`RANDOM}};
  out_uop_3_pdInfo_valid = _RAND_514[0:0];
  _RAND_515 = {1{`RANDOM}};
  out_uop_3_pdInfo_isBr = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  out_uop_3_pdInfo_isJal = _RAND_516[0:0];
  _RAND_517 = {1{`RANDOM}};
  out_uop_3_pdInfo_isJalr = _RAND_517[0:0];
  _RAND_518 = {1{`RANDOM}};
  out_uop_3_pdInfo_isCall = _RAND_518[0:0];
  _RAND_519 = {1{`RANDOM}};
  out_uop_3_pdInfo_isRet = _RAND_519[0:0];
  _RAND_520 = {1{`RANDOM}};
  out_uop_3_pdInfo_jumpTarget = _RAND_520[31:0];
  _RAND_521 = {1{`RANDOM}};
  out_uop_3_bpuInfo_pc = _RAND_521[31:0];
  _RAND_522 = {1{`RANDOM}};
  out_uop_3_bpuInfo_fallThrough = _RAND_522[31:0];
  _RAND_523 = {1{`RANDOM}};
  out_uop_3_bpuInfo_taken = _RAND_523[0:0];
  _RAND_524 = {1{`RANDOM}};
  out_uop_3_bpuInfo_target = _RAND_524[31:0];
  _RAND_525 = {1{`RANDOM}};
  out_uop_3_bpuInfo_takenOffset = _RAND_525[1:0];
  _RAND_526 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_valid = _RAND_526[0:0];
  _RAND_527 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_btbHit = _RAND_527[0:0];
  _RAND_528 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_btbIsJalr = _RAND_528[0:0];
  _RAND_529 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_btbIsJal = _RAND_529[0:0];
  _RAND_530 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_btbIsCall = _RAND_530[0:0];
  _RAND_531 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_btbIsRet = _RAND_531[0:0];
  _RAND_532 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_btbOffset = _RAND_532[1:0];
  _RAND_533 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_phtCounter = _RAND_533[1:0];
  _RAND_534 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_rasTop = _RAND_534[2:0];
  _RAND_535 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_predTaken = _RAND_535[0:0];
  _RAND_536 = {1{`RANDOM}};
  out_uop_3_bpuInfo_meta_predTarget = _RAND_536[31:0];
  _RAND_537 = {1{`RANDOM}};
  out_uop_3_ldst = _RAND_537[4:0];
  _RAND_538 = {1{`RANDOM}};
  out_uop_3_lrs1 = _RAND_538[4:0];
  _RAND_539 = {1{`RANDOM}};
  out_uop_3_lrs2 = _RAND_539[4:0];
  _RAND_540 = {1{`RANDOM}};
  out_uop_3_pdst = _RAND_540[6:0];
  _RAND_541 = {1{`RANDOM}};
  out_uop_3_prs1 = _RAND_541[6:0];
  _RAND_542 = {1{`RANDOM}};
  out_uop_3_prs2 = _RAND_542[6:0];
  _RAND_543 = {1{`RANDOM}};
  out_uop_3_oldPdst = _RAND_543[6:0];
  _RAND_544 = {1{`RANDOM}};
  out_uop_3_rs1Valid = _RAND_544[0:0];
  _RAND_545 = {1{`RANDOM}};
  out_uop_3_rs2Valid = _RAND_545[0:0];
  _RAND_546 = {1{`RANDOM}};
  out_uop_3_rdValid = _RAND_546[0:0];
  _RAND_547 = {1{`RANDOM}};
  out_uop_3_snptId_valid = _RAND_547[0:0];
  _RAND_548 = {1{`RANDOM}};
  out_uop_3_snptId_bits = _RAND_548[2:0];
  _RAND_549 = {1{`RANDOM}};
  out_uop_3_robIdx_value = _RAND_549[5:0];
  _RAND_550 = {1{`RANDOM}};
  out_uop_3_robIdx_flag = _RAND_550[0:0];
  _RAND_551 = {1{`RANDOM}};
  out_uop_3_robIdxFull_value = _RAND_551[5:0];
  _RAND_552 = {1{`RANDOM}};
  out_uop_3_robIdxFull_flag = _RAND_552[0:0];
  _RAND_553 = {1{`RANDOM}};
  out_uop_3_lqIdx_value = _RAND_553[3:0];
  _RAND_554 = {1{`RANDOM}};
  out_uop_3_lqIdx_flag = _RAND_554[0:0];
  _RAND_555 = {1{`RANDOM}};
  out_uop_3_sqIdx_value = _RAND_555[3:0];
  _RAND_556 = {1{`RANDOM}};
  out_uop_3_sqIdx_flag = _RAND_556[0:0];
  _RAND_557 = {1{`RANDOM}};
  out_uop_3_issueQueue = _RAND_557[2:0];
  _RAND_558 = {1{`RANDOM}};
  out_uop_3_prs1Busy = _RAND_558[0:0];
  _RAND_559 = {1{`RANDOM}};
  out_uop_3_prs2Busy = _RAND_559[0:0];
  _RAND_560 = {1{`RANDOM}};
  out_uop_3_isSta = _RAND_560[0:0];
  _RAND_561 = {1{`RANDOM}};
  out_uop_3_isStd = _RAND_561[0:0];
  _RAND_562 = {1{`RANDOM}};
  out_rs1_3 = _RAND_562[31:0];
  _RAND_563 = {1{`RANDOM}};
  out_rs2_3 = _RAND_563[31:0];
  _RAND_564 = {1{`RANDOM}};
  rrd_valid_4 = _RAND_564[0:0];
  _RAND_565 = {1{`RANDOM}};
  rrd_uop_4_pc = _RAND_565[31:0];
  _RAND_566 = {1{`RANDOM}};
  rrd_uop_4_inst = _RAND_566[31:0];
  _RAND_567 = {1{`RANDOM}};
  rrd_uop_4_ctrl_fuType = _RAND_567[3:0];
  _RAND_568 = {1{`RANDOM}};
  rrd_uop_4_ctrl_aluOp = _RAND_568[4:0];
  _RAND_569 = {1{`RANDOM}};
  rrd_uop_4_ctrl_bruOp = _RAND_569[3:0];
  _RAND_570 = {1{`RANDOM}};
  rrd_uop_4_ctrl_lsuOp = _RAND_570[3:0];
  _RAND_571 = {1{`RANDOM}};
  rrd_uop_4_ctrl_csrOp = _RAND_571[2:0];
  _RAND_572 = {1{`RANDOM}};
  rrd_uop_4_ctrl_mulOp = _RAND_572[2:0];
  _RAND_573 = {1{`RANDOM}};
  rrd_uop_4_ctrl_divOp = _RAND_573[2:0];
  _RAND_574 = {1{`RANDOM}};
  rrd_uop_4_ctrl_src1Type = _RAND_574[2:0];
  _RAND_575 = {1{`RANDOM}};
  rrd_uop_4_ctrl_src2Type = _RAND_575[2:0];
  _RAND_576 = {1{`RANDOM}};
  rrd_uop_4_ctrl_immType = _RAND_576[3:0];
  _RAND_577 = {1{`RANDOM}};
  rrd_uop_4_ctrl_rfWen = _RAND_577[0:0];
  _RAND_578 = {1{`RANDOM}};
  rrd_uop_4_ctrl_memRead = _RAND_578[0:0];
  _RAND_579 = {1{`RANDOM}};
  rrd_uop_4_ctrl_memWrite = _RAND_579[0:0];
  _RAND_580 = {1{`RANDOM}};
  rrd_uop_4_ctrl_csrWen = _RAND_580[0:0];
  _RAND_581 = {1{`RANDOM}};
  rrd_uop_4_ctrl_isBranch = _RAND_581[0:0];
  _RAND_582 = {1{`RANDOM}};
  rrd_uop_4_ctrl_isJump = _RAND_582[0:0];
  _RAND_583 = {1{`RANDOM}};
  rrd_uop_4_ctrl_isPriv = _RAND_583[0:0];
  _RAND_584 = {1{`RANDOM}};
  rrd_uop_4_excp_excpVec = _RAND_584[16:0];
  _RAND_585 = {1{`RANDOM}};
  rrd_uop_4_imm = _RAND_585[31:0];
  _RAND_586 = {1{`RANDOM}};
  rrd_uop_4_csrAddress = _RAND_586[13:0];
  _RAND_587 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_valid = _RAND_587[0:0];
  _RAND_588 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isBr = _RAND_588[0:0];
  _RAND_589 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isJal = _RAND_589[0:0];
  _RAND_590 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isJalr = _RAND_590[0:0];
  _RAND_591 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isCall = _RAND_591[0:0];
  _RAND_592 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_isRet = _RAND_592[0:0];
  _RAND_593 = {1{`RANDOM}};
  rrd_uop_4_pdInfo_jumpTarget = _RAND_593[31:0];
  _RAND_594 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_pc = _RAND_594[31:0];
  _RAND_595 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_fallThrough = _RAND_595[31:0];
  _RAND_596 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_taken = _RAND_596[0:0];
  _RAND_597 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_target = _RAND_597[31:0];
  _RAND_598 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_takenOffset = _RAND_598[1:0];
  _RAND_599 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_valid = _RAND_599[0:0];
  _RAND_600 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_btbHit = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_btbIsJalr = _RAND_601[0:0];
  _RAND_602 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_btbIsJal = _RAND_602[0:0];
  _RAND_603 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_btbIsCall = _RAND_603[0:0];
  _RAND_604 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_btbIsRet = _RAND_604[0:0];
  _RAND_605 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_btbOffset = _RAND_605[1:0];
  _RAND_606 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_phtCounter = _RAND_606[1:0];
  _RAND_607 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_rasTop = _RAND_607[2:0];
  _RAND_608 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_predTaken = _RAND_608[0:0];
  _RAND_609 = {1{`RANDOM}};
  rrd_uop_4_bpuInfo_meta_predTarget = _RAND_609[31:0];
  _RAND_610 = {1{`RANDOM}};
  rrd_uop_4_ldst = _RAND_610[4:0];
  _RAND_611 = {1{`RANDOM}};
  rrd_uop_4_lrs1 = _RAND_611[4:0];
  _RAND_612 = {1{`RANDOM}};
  rrd_uop_4_lrs2 = _RAND_612[4:0];
  _RAND_613 = {1{`RANDOM}};
  rrd_uop_4_pdst = _RAND_613[6:0];
  _RAND_614 = {1{`RANDOM}};
  rrd_uop_4_prs1 = _RAND_614[6:0];
  _RAND_615 = {1{`RANDOM}};
  rrd_uop_4_prs2 = _RAND_615[6:0];
  _RAND_616 = {1{`RANDOM}};
  rrd_uop_4_oldPdst = _RAND_616[6:0];
  _RAND_617 = {1{`RANDOM}};
  rrd_uop_4_rs1Valid = _RAND_617[0:0];
  _RAND_618 = {1{`RANDOM}};
  rrd_uop_4_rs2Valid = _RAND_618[0:0];
  _RAND_619 = {1{`RANDOM}};
  rrd_uop_4_rdValid = _RAND_619[0:0];
  _RAND_620 = {1{`RANDOM}};
  rrd_uop_4_snptId_valid = _RAND_620[0:0];
  _RAND_621 = {1{`RANDOM}};
  rrd_uop_4_snptId_bits = _RAND_621[2:0];
  _RAND_622 = {1{`RANDOM}};
  rrd_uop_4_robIdx_value = _RAND_622[5:0];
  _RAND_623 = {1{`RANDOM}};
  rrd_uop_4_robIdx_flag = _RAND_623[0:0];
  _RAND_624 = {1{`RANDOM}};
  rrd_uop_4_robIdxFull_value = _RAND_624[5:0];
  _RAND_625 = {1{`RANDOM}};
  rrd_uop_4_robIdxFull_flag = _RAND_625[0:0];
  _RAND_626 = {1{`RANDOM}};
  rrd_uop_4_lqIdx_value = _RAND_626[3:0];
  _RAND_627 = {1{`RANDOM}};
  rrd_uop_4_lqIdx_flag = _RAND_627[0:0];
  _RAND_628 = {1{`RANDOM}};
  rrd_uop_4_sqIdx_value = _RAND_628[3:0];
  _RAND_629 = {1{`RANDOM}};
  rrd_uop_4_sqIdx_flag = _RAND_629[0:0];
  _RAND_630 = {1{`RANDOM}};
  rrd_uop_4_issueQueue = _RAND_630[2:0];
  _RAND_631 = {1{`RANDOM}};
  rrd_uop_4_prs1Busy = _RAND_631[0:0];
  _RAND_632 = {1{`RANDOM}};
  rrd_uop_4_prs2Busy = _RAND_632[0:0];
  _RAND_633 = {1{`RANDOM}};
  rrd_uop_4_isSta = _RAND_633[0:0];
  _RAND_634 = {1{`RANDOM}};
  rrd_uop_4_isStd = _RAND_634[0:0];
  _RAND_635 = {1{`RANDOM}};
  out_valid_4 = _RAND_635[0:0];
  _RAND_636 = {1{`RANDOM}};
  out_uop_4_pc = _RAND_636[31:0];
  _RAND_637 = {1{`RANDOM}};
  out_uop_4_inst = _RAND_637[31:0];
  _RAND_638 = {1{`RANDOM}};
  out_uop_4_ctrl_fuType = _RAND_638[3:0];
  _RAND_639 = {1{`RANDOM}};
  out_uop_4_ctrl_aluOp = _RAND_639[4:0];
  _RAND_640 = {1{`RANDOM}};
  out_uop_4_ctrl_bruOp = _RAND_640[3:0];
  _RAND_641 = {1{`RANDOM}};
  out_uop_4_ctrl_lsuOp = _RAND_641[3:0];
  _RAND_642 = {1{`RANDOM}};
  out_uop_4_ctrl_csrOp = _RAND_642[2:0];
  _RAND_643 = {1{`RANDOM}};
  out_uop_4_ctrl_mulOp = _RAND_643[2:0];
  _RAND_644 = {1{`RANDOM}};
  out_uop_4_ctrl_divOp = _RAND_644[2:0];
  _RAND_645 = {1{`RANDOM}};
  out_uop_4_ctrl_src1Type = _RAND_645[2:0];
  _RAND_646 = {1{`RANDOM}};
  out_uop_4_ctrl_src2Type = _RAND_646[2:0];
  _RAND_647 = {1{`RANDOM}};
  out_uop_4_ctrl_immType = _RAND_647[3:0];
  _RAND_648 = {1{`RANDOM}};
  out_uop_4_ctrl_rfWen = _RAND_648[0:0];
  _RAND_649 = {1{`RANDOM}};
  out_uop_4_ctrl_memRead = _RAND_649[0:0];
  _RAND_650 = {1{`RANDOM}};
  out_uop_4_ctrl_memWrite = _RAND_650[0:0];
  _RAND_651 = {1{`RANDOM}};
  out_uop_4_ctrl_csrWen = _RAND_651[0:0];
  _RAND_652 = {1{`RANDOM}};
  out_uop_4_ctrl_isBranch = _RAND_652[0:0];
  _RAND_653 = {1{`RANDOM}};
  out_uop_4_ctrl_isJump = _RAND_653[0:0];
  _RAND_654 = {1{`RANDOM}};
  out_uop_4_ctrl_isPriv = _RAND_654[0:0];
  _RAND_655 = {1{`RANDOM}};
  out_uop_4_excp_excpVec = _RAND_655[16:0];
  _RAND_656 = {1{`RANDOM}};
  out_uop_4_imm = _RAND_656[31:0];
  _RAND_657 = {1{`RANDOM}};
  out_uop_4_csrAddress = _RAND_657[13:0];
  _RAND_658 = {1{`RANDOM}};
  out_uop_4_pdInfo_valid = _RAND_658[0:0];
  _RAND_659 = {1{`RANDOM}};
  out_uop_4_pdInfo_isBr = _RAND_659[0:0];
  _RAND_660 = {1{`RANDOM}};
  out_uop_4_pdInfo_isJal = _RAND_660[0:0];
  _RAND_661 = {1{`RANDOM}};
  out_uop_4_pdInfo_isJalr = _RAND_661[0:0];
  _RAND_662 = {1{`RANDOM}};
  out_uop_4_pdInfo_isCall = _RAND_662[0:0];
  _RAND_663 = {1{`RANDOM}};
  out_uop_4_pdInfo_isRet = _RAND_663[0:0];
  _RAND_664 = {1{`RANDOM}};
  out_uop_4_pdInfo_jumpTarget = _RAND_664[31:0];
  _RAND_665 = {1{`RANDOM}};
  out_uop_4_bpuInfo_pc = _RAND_665[31:0];
  _RAND_666 = {1{`RANDOM}};
  out_uop_4_bpuInfo_fallThrough = _RAND_666[31:0];
  _RAND_667 = {1{`RANDOM}};
  out_uop_4_bpuInfo_taken = _RAND_667[0:0];
  _RAND_668 = {1{`RANDOM}};
  out_uop_4_bpuInfo_target = _RAND_668[31:0];
  _RAND_669 = {1{`RANDOM}};
  out_uop_4_bpuInfo_takenOffset = _RAND_669[1:0];
  _RAND_670 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_valid = _RAND_670[0:0];
  _RAND_671 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_btbHit = _RAND_671[0:0];
  _RAND_672 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_btbIsJalr = _RAND_672[0:0];
  _RAND_673 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_btbIsJal = _RAND_673[0:0];
  _RAND_674 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_btbIsCall = _RAND_674[0:0];
  _RAND_675 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_btbIsRet = _RAND_675[0:0];
  _RAND_676 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_btbOffset = _RAND_676[1:0];
  _RAND_677 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_phtCounter = _RAND_677[1:0];
  _RAND_678 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_rasTop = _RAND_678[2:0];
  _RAND_679 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_predTaken = _RAND_679[0:0];
  _RAND_680 = {1{`RANDOM}};
  out_uop_4_bpuInfo_meta_predTarget = _RAND_680[31:0];
  _RAND_681 = {1{`RANDOM}};
  out_uop_4_ldst = _RAND_681[4:0];
  _RAND_682 = {1{`RANDOM}};
  out_uop_4_lrs1 = _RAND_682[4:0];
  _RAND_683 = {1{`RANDOM}};
  out_uop_4_lrs2 = _RAND_683[4:0];
  _RAND_684 = {1{`RANDOM}};
  out_uop_4_pdst = _RAND_684[6:0];
  _RAND_685 = {1{`RANDOM}};
  out_uop_4_prs1 = _RAND_685[6:0];
  _RAND_686 = {1{`RANDOM}};
  out_uop_4_prs2 = _RAND_686[6:0];
  _RAND_687 = {1{`RANDOM}};
  out_uop_4_oldPdst = _RAND_687[6:0];
  _RAND_688 = {1{`RANDOM}};
  out_uop_4_rs1Valid = _RAND_688[0:0];
  _RAND_689 = {1{`RANDOM}};
  out_uop_4_rs2Valid = _RAND_689[0:0];
  _RAND_690 = {1{`RANDOM}};
  out_uop_4_rdValid = _RAND_690[0:0];
  _RAND_691 = {1{`RANDOM}};
  out_uop_4_snptId_valid = _RAND_691[0:0];
  _RAND_692 = {1{`RANDOM}};
  out_uop_4_snptId_bits = _RAND_692[2:0];
  _RAND_693 = {1{`RANDOM}};
  out_uop_4_robIdx_value = _RAND_693[5:0];
  _RAND_694 = {1{`RANDOM}};
  out_uop_4_robIdx_flag = _RAND_694[0:0];
  _RAND_695 = {1{`RANDOM}};
  out_uop_4_robIdxFull_value = _RAND_695[5:0];
  _RAND_696 = {1{`RANDOM}};
  out_uop_4_robIdxFull_flag = _RAND_696[0:0];
  _RAND_697 = {1{`RANDOM}};
  out_uop_4_lqIdx_value = _RAND_697[3:0];
  _RAND_698 = {1{`RANDOM}};
  out_uop_4_lqIdx_flag = _RAND_698[0:0];
  _RAND_699 = {1{`RANDOM}};
  out_uop_4_sqIdx_value = _RAND_699[3:0];
  _RAND_700 = {1{`RANDOM}};
  out_uop_4_sqIdx_flag = _RAND_700[0:0];
  _RAND_701 = {1{`RANDOM}};
  out_uop_4_issueQueue = _RAND_701[2:0];
  _RAND_702 = {1{`RANDOM}};
  out_uop_4_prs1Busy = _RAND_702[0:0];
  _RAND_703 = {1{`RANDOM}};
  out_uop_4_prs2Busy = _RAND_703[0:0];
  _RAND_704 = {1{`RANDOM}};
  out_uop_4_isSta = _RAND_704[0:0];
  _RAND_705 = {1{`RANDOM}};
  out_uop_4_isStd = _RAND_705[0:0];
  _RAND_706 = {1{`RANDOM}};
  out_rs2_4 = _RAND_706[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
