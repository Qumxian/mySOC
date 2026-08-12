module DispatchStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [16:0] io_in_0_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [13:0] io_in_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_0_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [5:0]  io_in_0_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_0_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_in_1_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_1_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_1_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_1_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_1_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_1_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_1_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_1_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_1_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_1_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [16:0] io_in_1_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [13:0] io_in_1_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_1_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_1_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_1_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_1_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_1_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_1_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_1_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [5:0]  io_in_1_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_1_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_in_2_ready, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_2_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_2_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_2_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_2_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_2_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_2_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_2_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_2_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_in_2_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [16:0] io_in_2_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [13:0] io_in_2_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [31:0] io_in_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_2_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_2_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_in_2_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_2_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_2_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_2_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_in_2_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [2:0]  io_in_2_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [5:0]  io_in_2_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_in_2_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q1IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_q1IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_q1IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q1IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q1IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q1IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q1IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q1IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q1IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q1IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q1IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q1IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q1IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q1IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q2IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_q2IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_q2IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q2IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q2IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q2IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q2IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q2IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q2IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q2IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q2IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q2IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q2IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q3IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_q3IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_q3IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q3IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q3IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q3IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q3IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q3IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q3IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q3IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q3IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q3IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q3IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q4IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_q4IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_q4IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q4IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q4IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q4IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q4IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q4IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q4IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q4IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q4IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q4IQEnq_0_bits_lqIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_lqIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q4IQEnq_0_bits_sqIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_sqIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q4IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_isSta, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q4IQEnq_0_bits_isStd, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q5IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_q5IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_q5IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q5IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q5IQEnq_0_bits_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q5IQEnq_0_bits_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_q5IQEnq_0_bits_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q5IQEnq_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q5IQEnq_0_bits_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q5IQEnq_0_bits_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_q5IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q5IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_q5IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q5IQEnq_0_bits_lqIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_lqIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_q5IQEnq_0_bits_sqIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_sqIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_q5IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_isSta, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_q5IQEnq_0_bits_isStd, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_iqFeedback_q1FreeEntries, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_iqFeedback_q2FreeEntries, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_iqFeedback_q3FreeEntries, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [4:0]  io_iqFeedback_q4FreeEntries, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [3:0]  io_iqFeedback_q5FreeEntries, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_req_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_lsEnq_req_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_req_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_req_bits_isLoad, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_req_bits_isStore, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_lsEnq_req_bits_sqIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_req_bits_sqIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_lsEnq_req_bits_lqIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_req_bits_lqIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_lsEnq_toLsqData_ctrl_aluOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_bruOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_lsuOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_mulOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_divOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_src1Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_src2Type, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_immType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_ctrl_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_ctrl_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_ctrl_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_ctrl_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_ctrl_isBranch, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_ctrl_isJump, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_ctrl_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_lsEnq_toLsqData_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_imm, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_lsEnq_toLsqData_csrAddress, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_pdInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_pdInfo_isBr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_pdInfo_isJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_pdInfo_isJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_pdInfo_isCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_pdInfo_isRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_pdInfo_jumpTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_fallThrough, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_taken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_target, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_takenOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbHit, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_lsEnq_toLsqData_bpuInfo_meta_rasTop, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_predTaken, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_meta_predTarget, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_lsEnq_toLsqData_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_lsEnq_toLsqData_lrs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_lsEnq_toLsqData_lrs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_lsEnq_toLsqData_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_lsEnq_toLsqData_prs1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_lsEnq_toLsqData_prs2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_lsEnq_toLsqData_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_snptId_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_lsEnq_toLsqData_snptId_bits, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_rs1Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_rs2Valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_rdValid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [5:0]  io_lsEnq_toLsqData_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_lsEnq_toLsqData_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_lsEnq_lqFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_lsEnq_sqFull, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_valid_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_valid_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_valid_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_valids_0, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_valids_1, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_valids_2, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_robEnq_bits_0_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_robEnq_bits_0_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_robEnq_bits_0_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_robEnq_bits_0_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_robEnq_bits_0_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_robEnq_bits_0_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_0_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_0_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_0_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_0_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_robEnq_bits_0_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_robEnq_bits_0_csrWaddr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_0_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_robEnq_bits_0_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_robEnq_bits_1_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_robEnq_bits_1_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_robEnq_bits_1_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_robEnq_bits_1_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_robEnq_bits_1_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_robEnq_bits_1_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_1_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_1_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_1_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_1_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_robEnq_bits_1_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_robEnq_bits_1_csrWaddr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_1_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_robEnq_bits_1_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_robEnq_bits_2_pc, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [31:0] io_robEnq_bits_2_inst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [3:0]  io_robEnq_bits_2_fuType, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_robEnq_bits_2_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [6:0]  io_robEnq_bits_2_oldPdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [4:0]  io_robEnq_bits_2_ldst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_2_rfWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_2_memRead, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_2_memWrite, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_2_csrWen, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [2:0]  io_robEnq_bits_2_csrOp, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [13:0] io_robEnq_bits_2_csrWaddr, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output        io_robEnq_bits_2_isPriv, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  output [16:0] io_robEnq_bits_2_excp_excpVec, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_robEnq_canEnq, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_robEnq_full, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_flush, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_redirectInfo_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_redirectInfo_bits_robIdx_flag, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_stall, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_wakeupPorts_0_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_wakeupPorts_0_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_wakeupPorts_1_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_wakeupPorts_1_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_wakeupPorts_2_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_wakeupPorts_2_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_wakeupPorts_3_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_wakeupPorts_3_bits_pdst, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input         io_wakeupPorts_4_valid, // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
  input  [6:0]  io_wakeupPorts_4_bits_pdst // @[src/main/scala/backend/dispatch/DispatchStage.scala 26:14]
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
`endif // RANDOMIZE_REG_INIT
  wire  busyTable_clock; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_reset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_readReq_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_readReq_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_readReq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_readReq_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_readReq_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_readReq_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_allocReq_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_allocReq_0_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_allocReq_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_allocReq_1_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_allocReq_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_allocReq_2_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_wbReq_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_wbReq_0_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_wbReq_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_wbReq_1_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_wbReq_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_wbReq_2_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_wbReq_3_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_wbReq_3_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire  busyTable_io_wbReq_4_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  wire [6:0] busyTable_io_wbReq_4_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
  reg  laneValid_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
  reg  laneValid_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
  reg  laneValid_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
  reg  robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
  reg  robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
  reg  robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
  reg  iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
  reg  iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
  reg  iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_0_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_0_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_0_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_0_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_0_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_0_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_0_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [16:0] stgData_0_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_0_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [13:0] stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_0_bpuInfo_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_0_bpuInfo_fallThrough; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_taken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_0_bpuInfo_target; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_0_bpuInfo_takenOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_meta_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_meta_btbHit; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_0_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_0_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_0_bpuInfo_meta_rasTop; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_bpuInfo_meta_predTaken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_0_bpuInfo_meta_predTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_0_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_0_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_snptId_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_0_snptId_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [5:0] stgData_0_robIdx_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_0_robIdx_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_1_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_1_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_1_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_1_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_1_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_1_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_1_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_1_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [16:0] stgData_1_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [13:0] stgData_1_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_bpuInfo_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_bpuInfo_fallThrough; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_taken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_bpuInfo_target; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_1_bpuInfo_takenOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_meta_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_1_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_1_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_snptId_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_1_snptId_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [5:0] stgData_1_robIdx_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_1_robIdx_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_2_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_2_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_2_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_2_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_2_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_2_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_2_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [3:0] stgData_2_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [16:0] stgData_2_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [13:0] stgData_2_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_bpuInfo_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_bpuInfo_fallThrough; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_taken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_bpuInfo_target; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_2_bpuInfo_takenOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_meta_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [1:0] stgData_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [31:0] stgData_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_2_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [4:0] stgData_2_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [6:0] stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_snptId_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [2:0] stgData_2_snptId_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg [5:0] stgData_2_robIdx_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  reg  stgData_2_robIdx_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
  wire  needRob_0 = laneValid_0 & ~robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:72]
  wire  needRob_1 = laneValid_1 & ~robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:72]
  wire  needRob_2 = laneValid_2 & ~robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:72]
  wire  needIq_0 = laneValid_0 & ~iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 67:72]
  wire  needIq_1 = laneValid_1 & ~iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 67:72]
  wire  needIq_2 = laneValid_2 & ~iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 67:72]
  wire [2:0] _stgValid_T = {needIq_2,needIq_1,needIq_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 69:25]
  wire  stgValid = |_stgValid_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 69:32]
  wire  isAluLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 74:73]
  wire  isAluLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 74:73]
  wire  isAluLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 74:73]
  wire  isCsrLane_0 = needIq_0 & (stgData_0_ctrl_fuType == 4'h4 | stgData_0_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 75:73]
  wire  isCsrLane_1 = needIq_1 & (stgData_1_ctrl_fuType == 4'h4 | stgData_1_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 75:73]
  wire  isCsrLane_2 = needIq_2 & (stgData_2_ctrl_fuType == 4'h4 | stgData_2_ctrl_isPriv); // @[src/main/scala/backend/dispatch/DispatchStage.scala 75:73]
  wire  isDivLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 76:73]
  wire  isDivLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 76:73]
  wire  isDivLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 76:73]
  wire  isMulLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 77:73]
  wire  isMulLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 77:73]
  wire  isMulLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 77:73]
  wire  isJmpLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 78:73]
  wire  isJmpLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 78:73]
  wire  isJmpLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 78:73]
  wire  _isLoadLane_T_1 = needIq_0 & stgData_0_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:73]
  wire  isLoadLane_0 = needIq_0 & stgData_0_ctrl_fuType == 4'h3 & stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:114]
  wire  _isLoadLane_T_4 = needIq_1 & stgData_1_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:73]
  wire  isLoadLane_1 = needIq_1 & stgData_1_ctrl_fuType == 4'h3 & stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:114]
  wire  _isLoadLane_T_7 = needIq_2 & stgData_2_ctrl_fuType == 4'h3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:73]
  wire  isLoadLane_2 = needIq_2 & stgData_2_ctrl_fuType == 4'h3 & stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 79:114]
  wire  isStoreLane_0 = _isLoadLane_T_1 & stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 80:114]
  wire  isStoreLane_1 = _isLoadLane_T_4 & stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 80:114]
  wire  isStoreLane_2 = _isLoadLane_T_7 & stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 80:114]
  wire  q1Avail = io_iqFeedback_q1FreeEntries > 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 85:45]
  wire  q2Avail = io_iqFeedback_q2FreeEntries > 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 86:45]
  wire  q3Avail = io_iqFeedback_q3FreeEntries > 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 87:45]
  wire  q4Avail = io_iqFeedback_q4FreeEntries > 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 88:45]
  wire  q5Avail = io_iqFeedback_q5FreeEntries > 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 89:45]
  wire  csrToQ1_0 = isCsrLane_0 & q1Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 104:85]
  wire  _csrToQ1_T_1 = isCsrLane_1 & q1Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 104:85]
  wire  _csrToQ1_T_2 = isCsrLane_2 & q1Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 104:85]
  wire [1:0] _csrToQ1_T_4 = {{1'd0}, csrToQ1_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  csrToQ1_1 = _csrToQ1_T_1 & _csrToQ1_T_4[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _csrToQ1_T_6 = _csrToQ1_T_1 & csrToQ1_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire  _csrToQ1_T_8 = _csrToQ1_T_4[0] + _csrToQ1_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  csrToQ1_2 = _csrToQ1_T_2 & _csrToQ1_T_8 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  divToQ2_0 = isDivLane_0 & q2Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 105:86]
  wire  _divToQ2_T_1 = isDivLane_1 & q2Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 105:86]
  wire  _divToQ2_T_2 = isDivLane_2 & q2Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 105:86]
  wire [1:0] _divToQ2_T_4 = {{1'd0}, divToQ2_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  divToQ2_1 = _divToQ2_T_1 & _divToQ2_T_4[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _divToQ2_T_6 = _divToQ2_T_1 & divToQ2_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire  _divToQ2_T_8 = _divToQ2_T_4[0] + _divToQ2_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  divToQ2_2 = _divToQ2_T_2 & _divToQ2_T_8 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  isMulOrJmpLane_0 = (isMulLane_0 | isJmpLane_0) & q3Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 106:97]
  wire  isMulOrJmpLane_1 = (isMulLane_1 | isJmpLane_1) & q3Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 106:97]
  wire  isMulOrJmpLane_2 = (isMulLane_2 | isJmpLane_2) & q3Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 106:97]
  wire [1:0] _mulJmpToQ3_T_1 = {{1'd0}, isMulOrJmpLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  mulJmpToQ3_1 = isMulOrJmpLane_1 & _mulJmpToQ3_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _mulJmpToQ3_T_3 = isMulOrJmpLane_1 & mulJmpToQ3_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire  _mulJmpToQ3_T_5 = _mulJmpToQ3_T_1[0] + _mulJmpToQ3_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  mulJmpToQ3_2 = isMulOrJmpLane_2 & _mulJmpToQ3_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire [2:0] _consumedMask_T = {csrToQ1_2,csrToQ1_1,csrToQ1_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:30]
  wire [2:0] _consumedMask_T_1 = {divToQ2_2,divToQ2_1,divToQ2_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:47]
  wire [2:0] _consumedMask_T_2 = _consumedMask_T | _consumedMask_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:37]
  wire [2:0] _consumedMask_T_3 = {mulJmpToQ3_2,mulJmpToQ3_1,isMulOrJmpLane_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:67]
  wire [2:0] consumedMask = _consumedMask_T_2 | _consumedMask_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 109:54]
  wire  q1FreeAfterExclusive = ~(|_consumedMask_T) & q1Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 111:50]
  wire  q2FreeAfterExclusive = ~(|_consumedMask_T_1) & q2Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 112:50]
  wire  q3FreeAfterExclusive = ~(|_consumedMask_T_3) & q3Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 113:53]
  wire [4:0] q1AluPriority = q1FreeAfterExclusive ? io_iqFeedback_q1FreeEntries : 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 122:26]
  wire [3:0] q2AluPriority = q2FreeAfterExclusive ? io_iqFeedback_q2FreeEntries : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 123:26]
  wire [4:0] q3AluPriority = q3FreeAfterExclusive ? io_iqFeedback_q3FreeEntries : 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 124:26]
  wire [4:0] _GEN_756 = {{1'd0}, q2AluPriority}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 127:32]
  wire  rank0OH_0 = q1AluPriority >= _GEN_756 & q1AluPriority >= q3AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 127:50]
  wire  _rank0OH_1_T = ~rank0OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 128:17]
  wire  rank0OH_1 = ~rank0OH_0 & _GEN_756 >= q3AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 128:29]
  wire  _rank0OH_2_T_1 = ~rank0OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:32]
  wire  rank0OH_2 = _rank0OH_1_T & ~rank0OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 129:29]
  wire [4:0] exclRank0_0 = rank0OH_0 ? 5'h0 : q1AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:24]
  wire [3:0] _exclRank0_T_1 = rank0OH_1 ? 4'h0 : q2AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:24]
  wire [4:0] exclRank0_2 = rank0OH_2 ? 5'h0 : q3AluPriority; // @[src/main/scala/backend/dispatch/DispatchStage.scala 132:24]
  wire [4:0] exclRank0_1 = {{1'd0}, _exclRank0_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 131:{26,26}]
  wire  rank1OH_0 = _rank0OH_1_T & exclRank0_0 >= exclRank0_1 & exclRank0_0 >= exclRank0_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 135:63]
  wire  _rank1OH_1_T_1 = ~rank1OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 136:32]
  wire  rank1OH_1 = _rank0OH_2_T_1 & ~rank1OH_0 & exclRank0_1 >= exclRank0_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 136:44]
  wire  _rank1OH_2_T = ~rank0OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 137:17]
  wire  _rank1OH_2_T_3 = ~rank1OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 137:47]
  wire  rank1OH_2 = ~rank0OH_2 & _rank1OH_1_T_1 & ~rank1OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 137:44]
  wire  rank2OH_0 = _rank0OH_1_T & _rank1OH_1_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 140:29]
  wire  rank2OH_1 = _rank0OH_2_T_1 & _rank1OH_2_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 141:29]
  wire  rank2OH_2 = _rank1OH_2_T & ~rank1OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 142:29]
  wire  _rank0HasCap_T = rank0OH_1 ? q2FreeAfterExclusive : q3FreeAfterExclusive; // @[src/main/scala/backend/dispatch/DispatchStage.scala 144:56]
  wire  rank0HasCap = rank0OH_0 ? q1FreeAfterExclusive : _rank0HasCap_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 144:24]
  wire  _rank1HasCap_T = rank1OH_1 ? q2FreeAfterExclusive : q3FreeAfterExclusive; // @[src/main/scala/backend/dispatch/DispatchStage.scala 145:56]
  wire  rank1HasCap = rank1OH_0 ? q1FreeAfterExclusive : _rank1HasCap_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 145:24]
  wire  _rank2HasCap_T = rank2OH_1 ? q2FreeAfterExclusive : q3FreeAfterExclusive; // @[src/main/scala/backend/dispatch/DispatchStage.scala 146:56]
  wire  rank2HasCap = rank2OH_0 ? q1FreeAfterExclusive : _rank2HasCap_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 146:24]
  wire  aluCandR1_0 = isAluLane_0 & ~consumedMask[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 148:74]
  wire  aluCandR1_1 = isAluLane_1 & ~consumedMask[1]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 148:74]
  wire  aluCandR1_2 = isAluLane_2 & ~consumedMask[2]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 148:74]
  wire [1:0] _aluRound1_T_1 = {{1'd0}, aluCandR1_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  aluRound1_1 = aluCandR1_1 & _aluRound1_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _aluRound1_T_3 = aluCandR1_1 & aluRound1_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire  _aluRound1_T_5 = _aluRound1_T_1[0] + _aluRound1_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  aluRound1_2 = aluCandR1_2 & _aluRound1_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire [2:0] _aluRound1Valid_T = {aluRound1_2,aluRound1_1,aluCandR1_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 150:34]
  wire  aluRound1Valid = |_aluRound1Valid_T & rank0HasCap; // @[src/main/scala/backend/dispatch/DispatchStage.scala 150:45]
  wire  aluRound1ToQ1 = aluRound1Valid & rank0OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 151:38]
  wire  aluRound1ToQ2 = aluRound1Valid & rank0OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 152:38]
  wire  aluRound1ToQ3 = aluRound1Valid & rank0OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 153:38]
  wire [2:0] _T_1 = aluRound1Valid ? _aluRound1Valid_T : 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 154:36]
  wire [2:0] _T_2 = consumedMask | _T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 154:31]
  wire  aluCandR2_0 = isAluLane_0 & ~_T_2[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 156:74]
  wire  aluCandR2_1 = isAluLane_1 & ~_T_2[1]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 156:74]
  wire  aluCandR2_2 = isAluLane_2 & ~_T_2[2]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 156:74]
  wire [1:0] _aluRound2_T_1 = {{1'd0}, aluCandR2_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  aluRound2_1 = aluCandR2_1 & _aluRound2_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _aluRound2_T_3 = aluCandR2_1 & aluRound2_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire  _aluRound2_T_5 = _aluRound2_T_1[0] + _aluRound2_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  aluRound2_2 = aluCandR2_2 & _aluRound2_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire [2:0] _aluRound2Valid_T = {aluRound2_2,aluRound2_1,aluCandR2_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 158:34]
  wire  aluRound2Valid = |_aluRound2Valid_T & rank1HasCap; // @[src/main/scala/backend/dispatch/DispatchStage.scala 158:45]
  wire  aluRound2ToQ1 = aluRound2Valid & rank1OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 159:38]
  wire  aluRound2ToQ2 = aluRound2Valid & rank1OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 160:38]
  wire  aluRound2ToQ3 = aluRound2Valid & rank1OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 161:38]
  wire [2:0] _T_4 = aluRound2Valid ? _aluRound2Valid_T : 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 162:36]
  wire [2:0] _T_5 = _T_2 | _T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 162:31]
  wire  aluCandR3_0 = isAluLane_0 & ~_T_5[0]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 164:74]
  wire  aluCandR3_1 = isAluLane_1 & ~_T_5[1]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 164:74]
  wire  aluCandR3_2 = isAluLane_2 & ~_T_5[2]; // @[src/main/scala/backend/dispatch/DispatchStage.scala 164:74]
  wire [1:0] _aluRound3_T_1 = {{1'd0}, aluCandR3_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  aluRound3_1 = aluCandR3_1 & _aluRound3_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _aluRound3_T_3 = aluCandR3_1 & aluRound3_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire  _aluRound3_T_5 = _aluRound3_T_1[0] + _aluRound3_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  aluRound3_2 = aluCandR3_2 & _aluRound3_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire [2:0] _aluRound3Valid_T = {aluRound3_2,aluRound3_1,aluCandR3_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:34]
  wire  aluRound3Valid = |_aluRound3Valid_T & rank2HasCap; // @[src/main/scala/backend/dispatch/DispatchStage.scala 166:45]
  wire  aluRound3ToQ1 = aluRound3Valid & rank2OH_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 167:38]
  wire  aluRound3ToQ2 = aluRound3Valid & rank2OH_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 168:38]
  wire  aluRound3ToQ3 = aluRound3Valid & rank2OH_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 169:38]
  wire  aluToQ1_0 = aluCandR1_0 & aluRound1ToQ1 | aluCandR2_0 & aluRound2ToQ1 | aluCandR3_0 & aluRound3ToQ1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 172:126]
  wire  aluToQ1_1 = aluRound1_1 & aluRound1ToQ1 | aluRound2_1 & aluRound2ToQ1 | aluRound3_1 & aluRound3ToQ1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 172:126]
  wire  aluToQ1_2 = aluRound1_2 & aluRound1ToQ1 | aluRound2_2 & aluRound2ToQ1 | aluRound3_2 & aluRound3ToQ1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 172:126]
  wire  aluToQ2_0 = aluCandR1_0 & aluRound1ToQ2 | aluCandR2_0 & aluRound2ToQ2 | aluCandR3_0 & aluRound3ToQ2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 173:126]
  wire  aluToQ2_1 = aluRound1_1 & aluRound1ToQ2 | aluRound2_1 & aluRound2ToQ2 | aluRound3_1 & aluRound3ToQ2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 173:126]
  wire  aluToQ2_2 = aluRound1_2 & aluRound1ToQ2 | aluRound2_2 & aluRound2ToQ2 | aluRound3_2 & aluRound3ToQ2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 173:126]
  wire  aluToQ3_0 = aluCandR1_0 & aluRound1ToQ3 | aluCandR2_0 & aluRound2ToQ3 | aluCandR3_0 & aluRound3ToQ3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 174:126]
  wire  aluToQ3_1 = aluRound1_1 & aluRound1ToQ3 | aluRound2_1 & aluRound2ToQ3 | aluRound3_1 & aluRound3ToQ3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 174:126]
  wire  aluToQ3_2 = aluRound1_2 & aluRound1ToQ3 | aluRound2_2 & aluRound2ToQ3 | aluRound3_2 & aluRound3ToQ3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 174:126]
  wire  q1Final_0 = csrToQ1_0 | aluToQ1_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 176:70]
  wire  q1Final_1 = csrToQ1_1 | aluToQ1_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 176:70]
  wire  q1Final_2 = csrToQ1_2 | aluToQ1_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 176:70]
  wire  q2Final_0 = divToQ2_0 | aluToQ2_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 177:70]
  wire  q2Final_1 = divToQ2_1 | aluToQ2_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 177:70]
  wire  q2Final_2 = divToQ2_2 | aluToQ2_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 177:70]
  wire  q3Final_0 = isMulOrJmpLane_0 | aluToQ3_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 178:73]
  wire  q3Final_1 = mulJmpToQ3_1 | aluToQ3_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 178:73]
  wire  q3Final_2 = mulJmpToQ3_2 | aluToQ3_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 178:73]
  wire  q4Cand_canLoad = isLoadLane_0 & ~io_lsEnq_lqFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 184:35]
  wire  q4Cand_canStore = isStoreLane_0 & ~io_lsEnq_sqFull & q5Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 185:55]
  wire  q4Cand_0 = (q4Cand_canLoad | q4Cand_canStore) & q4Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 186:27]
  wire  q4Cand_canLoad_1 = isLoadLane_1 & ~io_lsEnq_lqFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 184:35]
  wire  q4Cand_canStore_1 = isStoreLane_1 & ~io_lsEnq_sqFull & q5Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 185:55]
  wire  q4Cand_1 = (q4Cand_canLoad_1 | q4Cand_canStore_1) & q4Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 186:27]
  wire  q4Cand_canLoad_2 = isLoadLane_2 & ~io_lsEnq_lqFull; // @[src/main/scala/backend/dispatch/DispatchStage.scala 184:35]
  wire  q4Cand_canStore_2 = isStoreLane_2 & ~io_lsEnq_sqFull & q5Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 185:55]
  wire  q4Cand_2 = (q4Cand_canLoad_2 | q4Cand_canStore_2) & q4Avail; // @[src/main/scala/backend/dispatch/DispatchStage.scala 186:27]
  wire  _q4Cand_T_1 = q4Cand_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 186:27]
  wire  q4Selected_0 = q4Cand_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 186:27]
  wire  _q4Selected_T = q4Cand_0 & _q4Cand_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire [1:0] _q4Selected_T_1 = {{1'd0}, _q4Selected_T}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  q4Selected_1 = q4Cand_1 & _q4Selected_T_1[0] < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _q4Selected_T_3 = q4Cand_1 & q4Selected_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:35]
  wire  _q4Selected_T_5 = _q4Selected_T_1[0] + _q4Selected_T_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 96:21]
  wire  q4Selected_2 = q4Cand_2 & _q4Selected_T_5 < 1'h1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 95:31]
  wire  _q5Selected_T = _q4Cand_T_1 & isStoreLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 191:76]
  wire  _q5Selected_T_1 = q4Selected_1 & isStoreLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 191:76]
  wire  _q5Selected_T_2 = q4Selected_2 & isStoreLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 191:76]
  wire  q5Selected_0 = _q4Cand_T_1 & isStoreLane_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 191:76]
  wire  iqDispatchMask_0 = q1Final_0 | q2Final_0 | q3Final_0 | _q4Cand_T_1 | q5Selected_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 195:61]
  wire  q5Selected_1 = q4Selected_1 & isStoreLane_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 191:76]
  wire  iqDispatchMask_1 = q1Final_1 | q2Final_1 | q3Final_1 | q4Selected_1 | q5Selected_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 195:61]
  wire  q5Selected_2 = q4Selected_2 & isStoreLane_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 191:76]
  wire  iqDispatchMask_2 = q1Final_2 | q2Final_2 | q3Final_2 | q4Selected_2 | q5Selected_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 195:61]
  wire [2:0] _laneTargetQ_0_T = q5Selected_0 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _laneTargetQ_1_T = q5Selected_1 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _laneTargetQ_2_T = q5Selected_2 ? 3'h4 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _anyNeedRob_T = {needRob_2,needRob_1,needRob_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 212:28]
  wire  anyNeedRob = |_anyNeedRob_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 212:35]
  wire  _robBatchReady_T = ~anyNeedRob; // @[src/main/scala/backend/dispatch/DispatchStage.scala 213:23]
  wire  robBatchReady = ~anyNeedRob | io_robEnq_canEnq; // @[src/main/scala/backend/dispatch/DispatchStage.scala 213:35]
  wire  _hasIqDispatch_T = iqDispatchMask_0 & needIq_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 215:73]
  wire  _hasIqDispatch_T_1 = iqDispatchMask_1 & needIq_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 215:73]
  wire  _hasIqDispatch_T_2 = iqDispatchMask_2 & needIq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 215:73]
  wire  hasIqDispatch = iqDispatchMask_0 & needIq_0 | iqDispatchMask_1 & needIq_1 | iqDispatchMask_2 & needIq_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 215:89]
  wire  _dispatchFire_T_4 = ~io_flush; // @[src/main/scala/backend/dispatch/DispatchStage.scala 218:85]
  wire  dispatchFire = stgValid & hasIqDispatch & (robBatchReady | _robBatchReady_T) & ~io_flush & ~io_stall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 218:95]
  wire  AllWillFire = (needIq_0 & iqDispatchMask_0 | ~needIq_0) & (needIq_1 & iqDispatchMask_1 | ~needIq_1) & (needIq_2
     & iqDispatchMask_2 | ~needIq_2); // @[src/main/scala/backend/dispatch/DispatchStage.scala 221:123]
  wire  canAcceptNew = (~stgValid | dispatchFire & AllWillFire) & ~io_robEnq_full; // @[src/main/scala/backend/dispatch/DispatchStage.scala 222:70]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 224:45]
  wire  inFire = inValid & canAcceptNew & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 225:41]
  wire  doRedirect = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/dispatch/DispatchStage.scala 233:42]
  wire  _doFlush_0_T_2 = stgData_0_robIdx_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _doFlush_0_T_3 = stgData_0_robIdx_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _doFlush_0_T_4 = stgData_0_robIdx_flag == io_redirectInfo_bits_robIdx_flag ? _doFlush_0_T_2 : _doFlush_0_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  doFlush_0 = doRedirect & laneValid_0 & _doFlush_0_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 239:46]
  wire  _doFlush_1_T_2 = stgData_1_robIdx_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _doFlush_1_T_3 = stgData_1_robIdx_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _doFlush_1_T_4 = stgData_1_robIdx_flag == io_redirectInfo_bits_robIdx_flag ? _doFlush_1_T_2 : _doFlush_1_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  doFlush_1 = doRedirect & laneValid_1 & _doFlush_1_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 239:46]
  wire  _doFlush_2_T_2 = stgData_2_robIdx_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _doFlush_2_T_3 = stgData_2_robIdx_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  _doFlush_2_T_4 = stgData_2_robIdx_flag == io_redirectInfo_bits_robIdx_flag ? _doFlush_2_T_2 : _doFlush_2_T_3; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  doFlush_2 = doRedirect & laneValid_2 & _doFlush_2_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 239:46]
  wire [2:0] _T_9 = {doFlush_2,doFlush_1,doFlush_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:16]
  wire  _GEN_9 = needRob_0 | robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 259:{24,40} 61:28]
  wire  _GEN_10 = _hasIqDispatch_T | iqSent_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 260:{44,56} 62:28]
  wire  _GEN_11 = needRob_1 | robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 259:{24,40} 61:28]
  wire  _GEN_12 = _hasIqDispatch_T_1 | iqSent_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 260:{44,56} 62:28]
  wire  _GEN_13 = needRob_2 | robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 259:{24,40} 61:28]
  wire  _GEN_14 = _hasIqDispatch_T_2 | iqSent_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 260:{44,56} 62:28]
  reg [3:0] lqHeadPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 267:26]
  reg  lqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 267:26]
  reg [3:0] sqHeadPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 268:26]
  reg  sqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 268:26]
  wire [2:0] _memDispatchedThisCycle_T = {q4Selected_2,q4Selected_1,_q4Cand_T_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 271:59]
  wire  _memDispatchedThisCycle_T_1 = |_memDispatchedThisCycle_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 271:66]
  wire  memDispatchedThisCycle = dispatchFire & |_memDispatchedThisCycle_T & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 271:70]
  wire  selectedIsLoad = _q4Cand_T_1 & stgData_0_ctrl_memRead | q4Selected_1 & stgData_1_ctrl_memRead | q4Selected_2 &
    stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  selectedIsStore = _q4Cand_T_1 & stgData_0_ctrl_memWrite | q4Selected_1 & stgData_1_ctrl_memWrite | q4Selected_2
     & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _selectedMemInst_T_5 = _q4Cand_T_1 ? stgData_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _selectedMemInst_T_6 = q4Selected_1 ? stgData_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _selectedMemInst_T_7 = q4Selected_2 ? stgData_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _selectedMemInst_T_8 = _selectedMemInst_T_5 | _selectedMemInst_T_6; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_25 = _q4Cand_T_1 ? stgData_0_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_26 = q4Selected_1 ? stgData_1_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_27 = q4Selected_2 ? stgData_2_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_28 = _selectedMemInst_T_25 | _selectedMemInst_T_26; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_35 = _q4Cand_T_1 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_36 = q4Selected_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_37 = q4Selected_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_38 = _selectedMemInst_T_35 | _selectedMemInst_T_36; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_40 = _q4Cand_T_1 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_41 = q4Selected_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_42 = q4Selected_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_43 = _selectedMemInst_T_40 | _selectedMemInst_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_45 = _q4Cand_T_1 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_46 = q4Selected_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_47 = q4Selected_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_48 = _selectedMemInst_T_45 | _selectedMemInst_T_46; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_50 = _q4Cand_T_1 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_51 = q4Selected_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_52 = q4Selected_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _selectedMemInst_T_53 = _selectedMemInst_T_50 | _selectedMemInst_T_51; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_55 = _q4Cand_T_1 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_56 = q4Selected_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_57 = q4Selected_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_58 = _selectedMemInst_T_55 | _selectedMemInst_T_56; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_60 = _q4Cand_T_1 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_61 = q4Selected_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_62 = q4Selected_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_63 = _selectedMemInst_T_60 | _selectedMemInst_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_65 = _q4Cand_T_1 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_66 = q4Selected_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_67 = q4Selected_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_68 = _selectedMemInst_T_65 | _selectedMemInst_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_70 = _q4Cand_T_1 ? stgData_0_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_71 = q4Selected_1 ? stgData_1_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_72 = q4Selected_2 ? stgData_2_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_73 = _selectedMemInst_T_70 | _selectedMemInst_T_71; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_80 = _q4Cand_T_1 ? stgData_0_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_81 = q4Selected_1 ? stgData_1_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_82 = q4Selected_2 ? stgData_2_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_83 = _selectedMemInst_T_80 | _selectedMemInst_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_85 = _q4Cand_T_1 ? stgData_0_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_86 = q4Selected_1 ? stgData_1_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_87 = q4Selected_2 ? stgData_2_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_88 = _selectedMemInst_T_85 | _selectedMemInst_T_86; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_90 = _q4Cand_T_1 ? stgData_0_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_91 = q4Selected_1 ? stgData_1_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_92 = q4Selected_2 ? stgData_2_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_93 = _selectedMemInst_T_90 | _selectedMemInst_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_125 = _q4Cand_T_1 ? stgData_0_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_126 = q4Selected_1 ? stgData_1_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_127 = q4Selected_2 ? stgData_2_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _selectedMemInst_T_128 = _selectedMemInst_T_125 | _selectedMemInst_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_130 = _q4Cand_T_1 ? stgData_0_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_131 = q4Selected_1 ? stgData_1_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_132 = q4Selected_2 ? stgData_2_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_133 = _selectedMemInst_T_130 | _selectedMemInst_T_131; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_140 = _q4Cand_T_1 ? stgData_0_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_141 = q4Selected_1 ? stgData_1_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_142 = q4Selected_2 ? stgData_2_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_143 = _selectedMemInst_T_140 | _selectedMemInst_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_145 = _q4Cand_T_1 ? stgData_0_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_146 = q4Selected_1 ? stgData_1_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_147 = q4Selected_2 ? stgData_2_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_148 = _selectedMemInst_T_145 | _selectedMemInst_T_146; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_150 = _q4Cand_T_1 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_151 = q4Selected_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_152 = q4Selected_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_153 = _selectedMemInst_T_150 | _selectedMemInst_T_151; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _selectedMemInst_T_185 = _q4Cand_T_1 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _selectedMemInst_T_186 = q4Selected_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _selectedMemInst_T_187 = q4Selected_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _selectedMemInst_T_188 = _selectedMemInst_T_185 | _selectedMemInst_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_190 = _q4Cand_T_1 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_191 = q4Selected_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_192 = q4Selected_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_193 = _selectedMemInst_T_190 | _selectedMemInst_T_191; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _selectedMemInst_T_195 = _q4Cand_T_1 ? stgData_0_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _selectedMemInst_T_196 = q4Selected_1 ? stgData_1_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _selectedMemInst_T_197 = q4Selected_2 ? stgData_2_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _selectedMemInst_T_198 = _selectedMemInst_T_195 | _selectedMemInst_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_235 = _q4Cand_T_1 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_236 = q4Selected_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_237 = q4Selected_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_238 = _selectedMemInst_T_235 | _selectedMemInst_T_236; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_240 = _q4Cand_T_1 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_241 = q4Selected_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_242 = q4Selected_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_243 = _selectedMemInst_T_240 | _selectedMemInst_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_245 = _q4Cand_T_1 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_246 = q4Selected_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_247 = q4Selected_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_248 = _selectedMemInst_T_245 | _selectedMemInst_T_246; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_250 = _q4Cand_T_1 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_251 = q4Selected_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_252 = q4Selected_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_253 = _selectedMemInst_T_250 | _selectedMemInst_T_251; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_255 = _q4Cand_T_1 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_256 = q4Selected_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_257 = q4Selected_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_258 = _selectedMemInst_T_255 | _selectedMemInst_T_256; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_260 = _q4Cand_T_1 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_261 = q4Selected_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_262 = q4Selected_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _selectedMemInst_T_263 = _selectedMemInst_T_260 | _selectedMemInst_T_261; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_265 = _q4Cand_T_1 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_266 = q4Selected_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_267 = q4Selected_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_268 = _selectedMemInst_T_265 | _selectedMemInst_T_266; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_270 = _q4Cand_T_1 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_271 = q4Selected_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_272 = q4Selected_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_273 = _selectedMemInst_T_270 | _selectedMemInst_T_271; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_275 = _q4Cand_T_1 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_276 = q4Selected_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_277 = q4Selected_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _selectedMemInst_T_278 = _selectedMemInst_T_275 | _selectedMemInst_T_276; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_280 = _q4Cand_T_1 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_281 = q4Selected_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_282 = q4Selected_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _selectedMemInst_T_283 = _selectedMemInst_T_280 | _selectedMemInst_T_281; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_285 = _q4Cand_T_1 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_286 = q4Selected_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_287 = q4Selected_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_288 = _selectedMemInst_T_285 | _selectedMemInst_T_286; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_290 = _q4Cand_T_1 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_291 = q4Selected_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_292 = q4Selected_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _selectedMemInst_T_293 = _selectedMemInst_T_290 | _selectedMemInst_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] lqHeadPtr_newIncValue = lqHeadPtr_value + 4'h1; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  lqHeadPtr_wrap = lqHeadPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] lqHeadPtr_newPtr_value = lqHeadPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire [4:0] sqHeadPtr_newIncValue = sqHeadPtr_value + 4'h1; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  sqHeadPtr_wrap = sqHeadPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] sqHeadPtr_newPtr_value = sqHeadPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  _allocValids_0_T = dispatchFire & needRob_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:36]
  wire  allocValids_0 = dispatchFire & needRob_0 & stgData_0_rdValid & stgData_0_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:72]
  wire  _allocValids_1_T = dispatchFire & needRob_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:36]
  wire  allocValids_1 = dispatchFire & needRob_1 & stgData_1_rdValid & stgData_1_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:72]
  wire  _allocValids_2_T = dispatchFire & needRob_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:36]
  wire  prs1WakeupHits_0 = io_wakeupPorts_0_valid & io_wakeupPorts_0_bits_pdst == stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_1 = io_wakeupPorts_1_valid & io_wakeupPorts_1_bits_pdst == stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_2 = io_wakeupPorts_2_valid & io_wakeupPorts_2_bits_pdst == stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_3 = io_wakeupPorts_3_valid & io_wakeupPorts_3_bits_pdst == stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_4 = io_wakeupPorts_4_valid & io_wakeupPorts_4_bits_pdst == stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire [4:0] _prs1WokenUp_T = {prs1WakeupHits_4,prs1WakeupHits_3,prs1WakeupHits_2,prs1WakeupHits_1,prs1WakeupHits_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 329:50]
  wire  prs1WokenUp = |_prs1WokenUp_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 329:57]
  wire  prs2WakeupHits_0 = io_wakeupPorts_0_valid & io_wakeupPorts_0_bits_pdst == stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_1 = io_wakeupPorts_1_valid & io_wakeupPorts_1_bits_pdst == stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_2 = io_wakeupPorts_2_valid & io_wakeupPorts_2_bits_pdst == stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_3 = io_wakeupPorts_3_valid & io_wakeupPorts_3_bits_pdst == stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_4 = io_wakeupPorts_4_valid & io_wakeupPorts_4_bits_pdst == stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire [4:0] _prs2WokenUp_T = {prs2WakeupHits_4,prs2WakeupHits_3,prs2WakeupHits_2,prs2WakeupHits_1,prs2WakeupHits_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:50]
  wire  prs2WokenUp = |_prs2WokenUp_T; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:57]
  wire  prs1BusyRaw_0 = busyTable_io_readResp_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 321:{28,28}]
  wire  prs1Busy_0 = prs1BusyRaw_0 & ~prs1WokenUp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 341:56]
  wire  prs2BusyRaw_0 = busyTable_io_readResp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 322:{28,28}]
  wire  prs2Busy_0 = prs2BusyRaw_0 & ~prs2WokenUp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:56]
  wire  prs1WakeupHits_0_1 = io_wakeupPorts_0_valid & io_wakeupPorts_0_bits_pdst == stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_1_1 = io_wakeupPorts_1_valid & io_wakeupPorts_1_bits_pdst == stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_2_1 = io_wakeupPorts_2_valid & io_wakeupPorts_2_bits_pdst == stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_3_1 = io_wakeupPorts_3_valid & io_wakeupPorts_3_bits_pdst == stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_4_1 = io_wakeupPorts_4_valid & io_wakeupPorts_4_bits_pdst == stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire [4:0] _prs1WokenUp_T_1 = {prs1WakeupHits_4_1,prs1WakeupHits_3_1,prs1WakeupHits_2_1,prs1WakeupHits_1_1,
    prs1WakeupHits_0_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 329:50]
  wire  prs1WokenUp_1 = |_prs1WokenUp_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 329:57]
  wire  prs2WakeupHits_0_1 = io_wakeupPorts_0_valid & io_wakeupPorts_0_bits_pdst == stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_1_1 = io_wakeupPorts_1_valid & io_wakeupPorts_1_bits_pdst == stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_2_1 = io_wakeupPorts_2_valid & io_wakeupPorts_2_bits_pdst == stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_3_1 = io_wakeupPorts_3_valid & io_wakeupPorts_3_bits_pdst == stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_4_1 = io_wakeupPorts_4_valid & io_wakeupPorts_4_bits_pdst == stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire [4:0] _prs2WokenUp_T_1 = {prs2WakeupHits_4_1,prs2WakeupHits_3_1,prs2WakeupHits_2_1,prs2WakeupHits_1_1,
    prs2WakeupHits_0_1}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:50]
  wire  prs2WokenUp_1 = |_prs2WokenUp_T_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:57]
  wire  prs1AllocByOlder = |(allocValids_0 & stgData_0_pdst == stgData_1_prs1); // @[src/main/scala/backend/dispatch/DispatchStage.scala 335:101]
  wire  prs2AllocByOlder = |(allocValids_0 & stgData_0_pdst == stgData_1_prs2); // @[src/main/scala/backend/dispatch/DispatchStage.scala 338:101]
  wire  prs1BusyRaw_1 = busyTable_io_readResp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 321:{28,28}]
  wire  prs1Busy_1 = prs1AllocByOlder | prs1BusyRaw_1 & ~prs1WokenUp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 341:37]
  wire  prs2BusyRaw_1 = busyTable_io_readResp_3; // @[src/main/scala/backend/dispatch/DispatchStage.scala 322:{28,28}]
  wire  prs2Busy_1 = prs2AllocByOlder | prs2BusyRaw_1 & ~prs2WokenUp_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:37]
  wire  prs1WakeupHits_0_2 = io_wakeupPorts_0_valid & io_wakeupPorts_0_bits_pdst == stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_1_2 = io_wakeupPorts_1_valid & io_wakeupPorts_1_bits_pdst == stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_2_2 = io_wakeupPorts_2_valid & io_wakeupPorts_2_bits_pdst == stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_3_2 = io_wakeupPorts_3_valid & io_wakeupPorts_3_bits_pdst == stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire  prs1WakeupHits_4_2 = io_wakeupPorts_4_valid & io_wakeupPorts_4_bits_pdst == stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 328:55]
  wire [4:0] _prs1WokenUp_T_2 = {prs1WakeupHits_4_2,prs1WakeupHits_3_2,prs1WakeupHits_2_2,prs1WakeupHits_1_2,
    prs1WakeupHits_0_2}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 329:50]
  wire  prs1WokenUp_2 = |_prs1WokenUp_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 329:57]
  wire  prs2WakeupHits_0_2 = io_wakeupPorts_0_valid & io_wakeupPorts_0_bits_pdst == stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_1_2 = io_wakeupPorts_1_valid & io_wakeupPorts_1_bits_pdst == stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_2_2 = io_wakeupPorts_2_valid & io_wakeupPorts_2_bits_pdst == stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_3_2 = io_wakeupPorts_3_valid & io_wakeupPorts_3_bits_pdst == stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire  prs2WakeupHits_4_2 = io_wakeupPorts_4_valid & io_wakeupPorts_4_bits_pdst == stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 331:55]
  wire [4:0] _prs2WokenUp_T_2 = {prs2WakeupHits_4_2,prs2WakeupHits_3_2,prs2WakeupHits_2_2,prs2WakeupHits_1_2,
    prs2WakeupHits_0_2}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:50]
  wire  prs2WokenUp_2 = |_prs2WokenUp_T_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 332:57]
  wire  _prs1AllocByOlder_T_3 = allocValids_0 & stgData_0_pdst == stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 335:51]
  wire  _prs1AllocByOlder_T_5 = allocValids_1 & stgData_1_pdst == stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 335:51]
  wire [1:0] _prs1AllocByOlder_T_6 = {_prs1AllocByOlder_T_5,_prs1AllocByOlder_T_3}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 335:94]
  wire  prs1AllocByOlder_1 = |_prs1AllocByOlder_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 335:101]
  wire  _prs2AllocByOlder_T_3 = allocValids_0 & stgData_0_pdst == stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 338:51]
  wire  _prs2AllocByOlder_T_5 = allocValids_1 & stgData_1_pdst == stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 338:51]
  wire [1:0] _prs2AllocByOlder_T_6 = {_prs2AllocByOlder_T_5,_prs2AllocByOlder_T_3}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 338:94]
  wire  prs2AllocByOlder_1 = |_prs2AllocByOlder_T_6; // @[src/main/scala/backend/dispatch/DispatchStage.scala 338:101]
  wire  prs1BusyRaw_2 = busyTable_io_readResp_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 321:{28,28}]
  wire  prs1Busy_2 = prs1AllocByOlder_1 | prs1BusyRaw_2 & ~prs1WokenUp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 341:37]
  wire  prs2BusyRaw_2 = busyTable_io_readResp_5; // @[src/main/scala/backend/dispatch/DispatchStage.scala 322:{28,28}]
  wire  prs2Busy_2 = prs2AllocByOlder_1 | prs2BusyRaw_2 & ~prs2WokenUp_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 342:37]
  wire  q1Uops_u_u_prs1Busy = stgData_0_rs1Valid & stgData_0_lrs1 != 5'h0 & prs1Busy_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 378:24]
  wire  q1Uops_u_u_prs2Busy = stgData_0_rs2Valid & stgData_0_lrs2 != 5'h0 & prs2Busy_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 379:24]
  wire  q1Uops_u_u_1_prs1Busy = stgData_1_rs1Valid & stgData_1_lrs1 != 5'h0 & prs1Busy_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 378:24]
  wire  q1Uops_u_u_1_prs2Busy = stgData_1_rs2Valid & stgData_1_lrs2 != 5'h0 & prs2Busy_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 379:24]
  wire  q1Uops_u_u_2_prs1Busy = stgData_2_rs1Valid & stgData_2_lrs1 != 5'h0 & prs1Busy_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 378:24]
  wire  q1Uops_u_u_2_prs2Busy = stgData_2_rs2Valid & stgData_2_lrs2 != 5'h0 & prs2Busy_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 379:24]
  wire [2:0] _T_14 = {q1Final_2,q1Final_1,q1Final_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 432:16]
  wire [5:0] _io_q1IQEnq_0_bits_T_50 = q1Final_0 ? stgData_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q1IQEnq_0_bits_T_51 = q1Final_1 ? stgData_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q1IQEnq_0_bits_T_52 = q1Final_2 ? stgData_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q1IQEnq_0_bits_T_53 = _io_q1IQEnq_0_bits_T_50 | _io_q1IQEnq_0_bits_T_51; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_65 = q1Final_0 ? stgData_0_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_66 = q1Final_1 ? stgData_1_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_67 = q1Final_2 ? stgData_2_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_68 = _io_q1IQEnq_0_bits_T_65 | _io_q1IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_90 = q1Final_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_91 = q1Final_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_92 = q1Final_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_93 = _io_q1IQEnq_0_bits_T_90 | _io_q1IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_95 = q1Final_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_96 = q1Final_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_97 = q1Final_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_98 = _io_q1IQEnq_0_bits_T_95 | _io_q1IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_100 = q1Final_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_101 = q1Final_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_102 = q1Final_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_103 = _io_q1IQEnq_0_bits_T_100 | _io_q1IQEnq_0_bits_T_101; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_105 = q1Final_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_106 = q1Final_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_107 = q1Final_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q1IQEnq_0_bits_T_108 = _io_q1IQEnq_0_bits_T_105 | _io_q1IQEnq_0_bits_T_106; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_110 = q1Final_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_111 = q1Final_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_112 = q1Final_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_113 = _io_q1IQEnq_0_bits_T_110 | _io_q1IQEnq_0_bits_T_111; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_115 = q1Final_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_116 = q1Final_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_117 = q1Final_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_118 = _io_q1IQEnq_0_bits_T_115 | _io_q1IQEnq_0_bits_T_116; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_120 = q1Final_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_121 = q1Final_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_122 = q1Final_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_123 = _io_q1IQEnq_0_bits_T_120 | _io_q1IQEnq_0_bits_T_121; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_125 = q1Final_0 ? stgData_0_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_126 = q1Final_1 ? stgData_1_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_127 = q1Final_2 ? stgData_2_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_128 = _io_q1IQEnq_0_bits_T_125 | _io_q1IQEnq_0_bits_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_135 = q1Final_0 ? stgData_0_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_136 = q1Final_1 ? stgData_1_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_137 = q1Final_2 ? stgData_2_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_138 = _io_q1IQEnq_0_bits_T_135 | _io_q1IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_140 = q1Final_0 ? stgData_0_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_141 = q1Final_1 ? stgData_1_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_142 = q1Final_2 ? stgData_2_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_143 = _io_q1IQEnq_0_bits_T_140 | _io_q1IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_145 = q1Final_0 ? stgData_0_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_146 = q1Final_1 ? stgData_1_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_147 = q1Final_2 ? stgData_2_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_148 = _io_q1IQEnq_0_bits_T_145 | _io_q1IQEnq_0_bits_T_146; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_180 = q1Final_0 ? stgData_0_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_181 = q1Final_1 ? stgData_1_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_182 = q1Final_2 ? stgData_2_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q1IQEnq_0_bits_T_183 = _io_q1IQEnq_0_bits_T_180 | _io_q1IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_185 = q1Final_0 ? stgData_0_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_186 = q1Final_1 ? stgData_1_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_187 = q1Final_2 ? stgData_2_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_188 = _io_q1IQEnq_0_bits_T_185 | _io_q1IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_195 = q1Final_0 ? stgData_0_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_196 = q1Final_1 ? stgData_1_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_197 = q1Final_2 ? stgData_2_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_198 = _io_q1IQEnq_0_bits_T_195 | _io_q1IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_200 = q1Final_0 ? stgData_0_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_201 = q1Final_1 ? stgData_1_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_202 = q1Final_2 ? stgData_2_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_203 = _io_q1IQEnq_0_bits_T_200 | _io_q1IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_205 = q1Final_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_206 = q1Final_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_207 = q1Final_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_208 = _io_q1IQEnq_0_bits_T_205 | _io_q1IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_240 = q1Final_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_241 = q1Final_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_242 = q1Final_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q1IQEnq_0_bits_T_243 = _io_q1IQEnq_0_bits_T_240 | _io_q1IQEnq_0_bits_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_245 = q1Final_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_246 = q1Final_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_247 = q1Final_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_248 = _io_q1IQEnq_0_bits_T_245 | _io_q1IQEnq_0_bits_T_246; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q1IQEnq_0_bits_T_250 = q1Final_0 ? stgData_0_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q1IQEnq_0_bits_T_251 = q1Final_1 ? stgData_1_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q1IQEnq_0_bits_T_252 = q1Final_2 ? stgData_2_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q1IQEnq_0_bits_T_253 = _io_q1IQEnq_0_bits_T_250 | _io_q1IQEnq_0_bits_T_251; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_290 = q1Final_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_291 = q1Final_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_292 = q1Final_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_293 = _io_q1IQEnq_0_bits_T_290 | _io_q1IQEnq_0_bits_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_295 = q1Final_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_296 = q1Final_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_297 = q1Final_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_298 = _io_q1IQEnq_0_bits_T_295 | _io_q1IQEnq_0_bits_T_296; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_300 = q1Final_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_301 = q1Final_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_302 = q1Final_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_303 = _io_q1IQEnq_0_bits_T_300 | _io_q1IQEnq_0_bits_T_301; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_305 = q1Final_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_306 = q1Final_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_307 = q1Final_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_308 = _io_q1IQEnq_0_bits_T_305 | _io_q1IQEnq_0_bits_T_306; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_310 = q1Final_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_311 = q1Final_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_312 = q1Final_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_313 = _io_q1IQEnq_0_bits_T_310 | _io_q1IQEnq_0_bits_T_311; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_315 = q1Final_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_316 = q1Final_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_317 = q1Final_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q1IQEnq_0_bits_T_318 = _io_q1IQEnq_0_bits_T_315 | _io_q1IQEnq_0_bits_T_316; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_320 = q1Final_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_321 = q1Final_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_322 = q1Final_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_323 = _io_q1IQEnq_0_bits_T_320 | _io_q1IQEnq_0_bits_T_321; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_325 = q1Final_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_326 = q1Final_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_327 = q1Final_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_328 = _io_q1IQEnq_0_bits_T_325 | _io_q1IQEnq_0_bits_T_326; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_330 = q1Final_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_331 = q1Final_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_332 = q1Final_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q1IQEnq_0_bits_T_333 = _io_q1IQEnq_0_bits_T_330 | _io_q1IQEnq_0_bits_T_331; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_335 = q1Final_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_336 = q1Final_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_337 = q1Final_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q1IQEnq_0_bits_T_338 = _io_q1IQEnq_0_bits_T_335 | _io_q1IQEnq_0_bits_T_336; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_340 = q1Final_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_341 = q1Final_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_342 = q1Final_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_343 = _io_q1IQEnq_0_bits_T_340 | _io_q1IQEnq_0_bits_T_341; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_345 = q1Final_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_346 = q1Final_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_347 = q1Final_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q1IQEnq_0_bits_T_348 = _io_q1IQEnq_0_bits_T_345 | _io_q1IQEnq_0_bits_T_346; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _T_17 = {q2Final_2,q2Final_1,q2Final_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 443:16]
  wire [2:0] _io_q2IQEnq_0_bits_T_20 = q2Final_0 ? 3'h1 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_21 = q2Final_1 ? 3'h1 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_22 = q2Final_2 ? 3'h1 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_23 = _io_q2IQEnq_0_bits_T_20 | _io_q2IQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_50 = q2Final_0 ? stgData_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_51 = q2Final_1 ? stgData_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_52 = q2Final_2 ? stgData_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q2IQEnq_0_bits_T_53 = _io_q2IQEnq_0_bits_T_50 | _io_q2IQEnq_0_bits_T_51; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_65 = q2Final_0 ? stgData_0_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_66 = q2Final_1 ? stgData_1_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_67 = q2Final_2 ? stgData_2_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_68 = _io_q2IQEnq_0_bits_T_65 | _io_q2IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_90 = q2Final_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_91 = q2Final_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_92 = q2Final_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_93 = _io_q2IQEnq_0_bits_T_90 | _io_q2IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_95 = q2Final_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_96 = q2Final_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_97 = q2Final_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_98 = _io_q2IQEnq_0_bits_T_95 | _io_q2IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_100 = q2Final_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_101 = q2Final_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_102 = q2Final_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_103 = _io_q2IQEnq_0_bits_T_100 | _io_q2IQEnq_0_bits_T_101; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_105 = q2Final_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_106 = q2Final_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_107 = q2Final_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q2IQEnq_0_bits_T_108 = _io_q2IQEnq_0_bits_T_105 | _io_q2IQEnq_0_bits_T_106; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_110 = q2Final_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_111 = q2Final_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_112 = q2Final_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_113 = _io_q2IQEnq_0_bits_T_110 | _io_q2IQEnq_0_bits_T_111; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_115 = q2Final_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_116 = q2Final_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_117 = q2Final_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_118 = _io_q2IQEnq_0_bits_T_115 | _io_q2IQEnq_0_bits_T_116; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_120 = q2Final_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_121 = q2Final_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_122 = q2Final_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_123 = _io_q2IQEnq_0_bits_T_120 | _io_q2IQEnq_0_bits_T_121; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_125 = q2Final_0 ? stgData_0_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_126 = q2Final_1 ? stgData_1_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_127 = q2Final_2 ? stgData_2_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_128 = _io_q2IQEnq_0_bits_T_125 | _io_q2IQEnq_0_bits_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_135 = q2Final_0 ? stgData_0_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_136 = q2Final_1 ? stgData_1_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_137 = q2Final_2 ? stgData_2_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_138 = _io_q2IQEnq_0_bits_T_135 | _io_q2IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_140 = q2Final_0 ? stgData_0_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_141 = q2Final_1 ? stgData_1_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_142 = q2Final_2 ? stgData_2_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_143 = _io_q2IQEnq_0_bits_T_140 | _io_q2IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_145 = q2Final_0 ? stgData_0_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_146 = q2Final_1 ? stgData_1_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_147 = q2Final_2 ? stgData_2_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_148 = _io_q2IQEnq_0_bits_T_145 | _io_q2IQEnq_0_bits_T_146; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_180 = q2Final_0 ? stgData_0_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_181 = q2Final_1 ? stgData_1_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_182 = q2Final_2 ? stgData_2_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q2IQEnq_0_bits_T_183 = _io_q2IQEnq_0_bits_T_180 | _io_q2IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_185 = q2Final_0 ? stgData_0_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_186 = q2Final_1 ? stgData_1_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_187 = q2Final_2 ? stgData_2_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_188 = _io_q2IQEnq_0_bits_T_185 | _io_q2IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_195 = q2Final_0 ? stgData_0_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_196 = q2Final_1 ? stgData_1_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_197 = q2Final_2 ? stgData_2_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_198 = _io_q2IQEnq_0_bits_T_195 | _io_q2IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_200 = q2Final_0 ? stgData_0_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_201 = q2Final_1 ? stgData_1_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_202 = q2Final_2 ? stgData_2_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_203 = _io_q2IQEnq_0_bits_T_200 | _io_q2IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_205 = q2Final_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_206 = q2Final_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_207 = q2Final_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_208 = _io_q2IQEnq_0_bits_T_205 | _io_q2IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_240 = q2Final_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_241 = q2Final_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_242 = q2Final_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q2IQEnq_0_bits_T_243 = _io_q2IQEnq_0_bits_T_240 | _io_q2IQEnq_0_bits_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_245 = q2Final_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_246 = q2Final_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_247 = q2Final_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_248 = _io_q2IQEnq_0_bits_T_245 | _io_q2IQEnq_0_bits_T_246; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q2IQEnq_0_bits_T_250 = q2Final_0 ? stgData_0_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q2IQEnq_0_bits_T_251 = q2Final_1 ? stgData_1_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q2IQEnq_0_bits_T_252 = q2Final_2 ? stgData_2_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q2IQEnq_0_bits_T_253 = _io_q2IQEnq_0_bits_T_250 | _io_q2IQEnq_0_bits_T_251; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_290 = q2Final_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_291 = q2Final_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_292 = q2Final_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_293 = _io_q2IQEnq_0_bits_T_290 | _io_q2IQEnq_0_bits_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_295 = q2Final_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_296 = q2Final_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_297 = q2Final_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_298 = _io_q2IQEnq_0_bits_T_295 | _io_q2IQEnq_0_bits_T_296; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_300 = q2Final_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_301 = q2Final_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_302 = q2Final_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_303 = _io_q2IQEnq_0_bits_T_300 | _io_q2IQEnq_0_bits_T_301; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_305 = q2Final_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_306 = q2Final_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_307 = q2Final_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_308 = _io_q2IQEnq_0_bits_T_305 | _io_q2IQEnq_0_bits_T_306; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_310 = q2Final_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_311 = q2Final_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_312 = q2Final_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_313 = _io_q2IQEnq_0_bits_T_310 | _io_q2IQEnq_0_bits_T_311; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_315 = q2Final_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_316 = q2Final_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_317 = q2Final_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q2IQEnq_0_bits_T_318 = _io_q2IQEnq_0_bits_T_315 | _io_q2IQEnq_0_bits_T_316; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_320 = q2Final_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_321 = q2Final_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_322 = q2Final_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_323 = _io_q2IQEnq_0_bits_T_320 | _io_q2IQEnq_0_bits_T_321; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_325 = q2Final_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_326 = q2Final_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_327 = q2Final_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_328 = _io_q2IQEnq_0_bits_T_325 | _io_q2IQEnq_0_bits_T_326; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_330 = q2Final_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_331 = q2Final_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_332 = q2Final_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q2IQEnq_0_bits_T_333 = _io_q2IQEnq_0_bits_T_330 | _io_q2IQEnq_0_bits_T_331; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_335 = q2Final_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_336 = q2Final_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_337 = q2Final_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q2IQEnq_0_bits_T_338 = _io_q2IQEnq_0_bits_T_335 | _io_q2IQEnq_0_bits_T_336; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_340 = q2Final_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_341 = q2Final_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_342 = q2Final_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_343 = _io_q2IQEnq_0_bits_T_340 | _io_q2IQEnq_0_bits_T_341; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_345 = q2Final_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_346 = q2Final_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_347 = q2Final_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q2IQEnq_0_bits_T_348 = _io_q2IQEnq_0_bits_T_345 | _io_q2IQEnq_0_bits_T_346; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _T_20 = {q3Final_2,q3Final_1,q3Final_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 454:16]
  wire [2:0] _io_q3IQEnq_0_bits_T_20 = q3Final_0 ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_21 = q3Final_1 ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_22 = q3Final_2 ? 3'h2 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_23 = _io_q3IQEnq_0_bits_T_20 | _io_q3IQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_50 = q3Final_0 ? stgData_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_51 = q3Final_1 ? stgData_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_52 = q3Final_2 ? stgData_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q3IQEnq_0_bits_T_53 = _io_q3IQEnq_0_bits_T_50 | _io_q3IQEnq_0_bits_T_51; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_65 = q3Final_0 ? stgData_0_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_66 = q3Final_1 ? stgData_1_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_67 = q3Final_2 ? stgData_2_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_68 = _io_q3IQEnq_0_bits_T_65 | _io_q3IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_90 = q3Final_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_91 = q3Final_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_92 = q3Final_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_93 = _io_q3IQEnq_0_bits_T_90 | _io_q3IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_95 = q3Final_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_96 = q3Final_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_97 = q3Final_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_98 = _io_q3IQEnq_0_bits_T_95 | _io_q3IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_100 = q3Final_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_101 = q3Final_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_102 = q3Final_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_103 = _io_q3IQEnq_0_bits_T_100 | _io_q3IQEnq_0_bits_T_101; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_105 = q3Final_0 ? stgData_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_106 = q3Final_1 ? stgData_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_107 = q3Final_2 ? stgData_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q3IQEnq_0_bits_T_108 = _io_q3IQEnq_0_bits_T_105 | _io_q3IQEnq_0_bits_T_106; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_110 = q3Final_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_111 = q3Final_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_112 = q3Final_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_113 = _io_q3IQEnq_0_bits_T_110 | _io_q3IQEnq_0_bits_T_111; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_115 = q3Final_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_116 = q3Final_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_117 = q3Final_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_118 = _io_q3IQEnq_0_bits_T_115 | _io_q3IQEnq_0_bits_T_116; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_120 = q3Final_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_121 = q3Final_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_122 = q3Final_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_123 = _io_q3IQEnq_0_bits_T_120 | _io_q3IQEnq_0_bits_T_121; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_125 = q3Final_0 ? stgData_0_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_126 = q3Final_1 ? stgData_1_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_127 = q3Final_2 ? stgData_2_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_128 = _io_q3IQEnq_0_bits_T_125 | _io_q3IQEnq_0_bits_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_135 = q3Final_0 ? stgData_0_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_136 = q3Final_1 ? stgData_1_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_137 = q3Final_2 ? stgData_2_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_138 = _io_q3IQEnq_0_bits_T_135 | _io_q3IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_140 = q3Final_0 ? stgData_0_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_141 = q3Final_1 ? stgData_1_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_142 = q3Final_2 ? stgData_2_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_143 = _io_q3IQEnq_0_bits_T_140 | _io_q3IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_145 = q3Final_0 ? stgData_0_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_146 = q3Final_1 ? stgData_1_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_147 = q3Final_2 ? stgData_2_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_148 = _io_q3IQEnq_0_bits_T_145 | _io_q3IQEnq_0_bits_T_146; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_180 = q3Final_0 ? stgData_0_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_181 = q3Final_1 ? stgData_1_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_182 = q3Final_2 ? stgData_2_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q3IQEnq_0_bits_T_183 = _io_q3IQEnq_0_bits_T_180 | _io_q3IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_185 = q3Final_0 ? stgData_0_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_186 = q3Final_1 ? stgData_1_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_187 = q3Final_2 ? stgData_2_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_188 = _io_q3IQEnq_0_bits_T_185 | _io_q3IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_195 = q3Final_0 ? stgData_0_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_196 = q3Final_1 ? stgData_1_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_197 = q3Final_2 ? stgData_2_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_198 = _io_q3IQEnq_0_bits_T_195 | _io_q3IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_200 = q3Final_0 ? stgData_0_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_201 = q3Final_1 ? stgData_1_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_202 = q3Final_2 ? stgData_2_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_203 = _io_q3IQEnq_0_bits_T_200 | _io_q3IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_205 = q3Final_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_206 = q3Final_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_207 = q3Final_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_208 = _io_q3IQEnq_0_bits_T_205 | _io_q3IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_240 = q3Final_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_241 = q3Final_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_242 = q3Final_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q3IQEnq_0_bits_T_243 = _io_q3IQEnq_0_bits_T_240 | _io_q3IQEnq_0_bits_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_245 = q3Final_0 ? stgData_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_246 = q3Final_1 ? stgData_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_247 = q3Final_2 ? stgData_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_248 = _io_q3IQEnq_0_bits_T_245 | _io_q3IQEnq_0_bits_T_246; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q3IQEnq_0_bits_T_250 = q3Final_0 ? stgData_0_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q3IQEnq_0_bits_T_251 = q3Final_1 ? stgData_1_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q3IQEnq_0_bits_T_252 = q3Final_2 ? stgData_2_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q3IQEnq_0_bits_T_253 = _io_q3IQEnq_0_bits_T_250 | _io_q3IQEnq_0_bits_T_251; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_290 = q3Final_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_291 = q3Final_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_292 = q3Final_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_293 = _io_q3IQEnq_0_bits_T_290 | _io_q3IQEnq_0_bits_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_295 = q3Final_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_296 = q3Final_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_297 = q3Final_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_298 = _io_q3IQEnq_0_bits_T_295 | _io_q3IQEnq_0_bits_T_296; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_300 = q3Final_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_301 = q3Final_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_302 = q3Final_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_303 = _io_q3IQEnq_0_bits_T_300 | _io_q3IQEnq_0_bits_T_301; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_305 = q3Final_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_306 = q3Final_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_307 = q3Final_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_308 = _io_q3IQEnq_0_bits_T_305 | _io_q3IQEnq_0_bits_T_306; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_310 = q3Final_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_311 = q3Final_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_312 = q3Final_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_313 = _io_q3IQEnq_0_bits_T_310 | _io_q3IQEnq_0_bits_T_311; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_315 = q3Final_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_316 = q3Final_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_317 = q3Final_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q3IQEnq_0_bits_T_318 = _io_q3IQEnq_0_bits_T_315 | _io_q3IQEnq_0_bits_T_316; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_320 = q3Final_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_321 = q3Final_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_322 = q3Final_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_323 = _io_q3IQEnq_0_bits_T_320 | _io_q3IQEnq_0_bits_T_321; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_325 = q3Final_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_326 = q3Final_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_327 = q3Final_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_328 = _io_q3IQEnq_0_bits_T_325 | _io_q3IQEnq_0_bits_T_326; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_330 = q3Final_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_331 = q3Final_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_332 = q3Final_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q3IQEnq_0_bits_T_333 = _io_q3IQEnq_0_bits_T_330 | _io_q3IQEnq_0_bits_T_331; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_335 = q3Final_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_336 = q3Final_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_337 = q3Final_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q3IQEnq_0_bits_T_338 = _io_q3IQEnq_0_bits_T_335 | _io_q3IQEnq_0_bits_T_336; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_340 = q3Final_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_341 = q3Final_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_342 = q3Final_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_343 = _io_q3IQEnq_0_bits_T_340 | _io_q3IQEnq_0_bits_T_341; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_345 = q3Final_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_346 = q3Final_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_347 = q3Final_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q3IQEnq_0_bits_T_348 = _io_q3IQEnq_0_bits_T_345 | _io_q3IQEnq_0_bits_T_346; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] q4Uops_0_pdst = isStoreLane_0 ? 7'h0 : stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_0_rs2Valid = isStoreLane_0 ? 1'h0 : stgData_0_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_0_rdValid = isStoreLane_0 ? 1'h0 : stgData_0_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [3:0] q4Uops_0_lqIdx_value = isStoreLane_0 ? 4'h0 : lqHeadPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_0_lqIdx_flag = isStoreLane_0 ? 1'h0 : lqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [3:0] q4Uops_0_sqIdx_value = isStoreLane_0 ? sqHeadPtr_value : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_0_sqIdx_flag = isStoreLane_0 & sqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_0_prs1Busy = isStoreLane_0 ? q1Uops_u_u_prs1Busy : q1Uops_u_u_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_0_prs2Busy = isStoreLane_0 ? 1'h0 : q1Uops_u_u_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [6:0] q4Uops_1_pdst = isStoreLane_1 ? 7'h0 : stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_1_rs2Valid = isStoreLane_1 ? 1'h0 : stgData_1_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_1_rdValid = isStoreLane_1 ? 1'h0 : stgData_1_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [3:0] q4Uops_1_lqIdx_value = isStoreLane_1 ? 4'h0 : lqHeadPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_1_lqIdx_flag = isStoreLane_1 ? 1'h0 : lqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [3:0] q4Uops_1_sqIdx_value = isStoreLane_1 ? sqHeadPtr_value : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_1_sqIdx_flag = isStoreLane_1 & sqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_1_prs1Busy = isStoreLane_1 ? q1Uops_u_u_1_prs1Busy : q1Uops_u_u_1_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_1_prs2Busy = isStoreLane_1 ? 1'h0 : q1Uops_u_u_1_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [6:0] q4Uops_2_pdst = isStoreLane_2 ? 7'h0 : stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_2_rs2Valid = isStoreLane_2 ? 1'h0 : stgData_2_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_2_rdValid = isStoreLane_2 ? 1'h0 : stgData_2_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [3:0] q4Uops_2_lqIdx_value = isStoreLane_2 ? 4'h0 : lqHeadPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_2_lqIdx_flag = isStoreLane_2 ? 1'h0 : lqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [3:0] q4Uops_2_sqIdx_value = isStoreLane_2 ? sqHeadPtr_value : 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_2_sqIdx_flag = isStoreLane_2 & sqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_2_prs1Busy = isStoreLane_2 ? q1Uops_u_u_2_prs1Busy : q1Uops_u_u_2_prs1Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire  q4Uops_2_prs2Busy = isStoreLane_2 ? 1'h0 : q1Uops_u_u_2_prs2Busy; // @[src/main/scala/backend/dispatch/DispatchStage.scala 459:53]
  wire [2:0] _io_q4IQEnq_0_bits_T_20 = _q4Cand_T_1 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_21 = q4Selected_1 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_22 = q4Selected_2 ? 3'h3 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q4IQEnq_0_bits_T_23 = _io_q4IQEnq_0_bits_T_20 | _io_q4IQEnq_0_bits_T_21; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_30 = _q4Cand_T_1 ? q4Uops_0_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_31 = q4Selected_1 ? q4Uops_1_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_32 = q4Selected_2 ? q4Uops_2_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_33 = _io_q4IQEnq_0_bits_T_30 | _io_q4IQEnq_0_bits_T_31; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_40 = _q4Cand_T_1 ? q4Uops_0_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_41 = q4Selected_1 ? q4Uops_1_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_42 = q4Selected_2 ? q4Uops_2_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q4IQEnq_0_bits_T_43 = _io_q4IQEnq_0_bits_T_40 | _io_q4IQEnq_0_bits_T_41; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_105 = _q4Cand_T_1 ? q4Uops_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_106 = q4Selected_1 ? q4Uops_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_107 = q4Selected_2 ? q4Uops_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q4IQEnq_0_bits_T_108 = _io_q4IQEnq_0_bits_T_105 | _io_q4IQEnq_0_bits_T_106; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _T_26 = {q5Selected_2,q5Selected_1,q5Selected_0}; // @[src/main/scala/backend/dispatch/DispatchStage.scala 466:19]
  wire [2:0] _io_q5IQEnq_0_bits_T_23 = _laneTargetQ_0_T | _laneTargetQ_1_T; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_30 = q5Selected_0 ? sqHeadPtr_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_31 = q5Selected_1 ? sqHeadPtr_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_32 = q5Selected_2 ? sqHeadPtr_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_33 = _io_q5IQEnq_0_bits_T_30 | _io_q5IQEnq_0_bits_T_31; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_50 = q5Selected_0 ? stgData_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_51 = q5Selected_1 ? stgData_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_52 = q5Selected_2 ? stgData_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_q5IQEnq_0_bits_T_53 = _io_q5IQEnq_0_bits_T_50 | _io_q5IQEnq_0_bits_T_51; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_65 = q5Selected_0 ? stgData_0_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_66 = q5Selected_1 ? stgData_1_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_67 = q5Selected_2 ? stgData_2_snptId_bits : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_68 = _io_q5IQEnq_0_bits_T_65 | _io_q5IQEnq_0_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_90 = q5Selected_0 ? stgData_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_91 = q5Selected_1 ? stgData_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_92 = q5Selected_2 ? stgData_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_93 = _io_q5IQEnq_0_bits_T_90 | _io_q5IQEnq_0_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_95 = q5Selected_0 ? stgData_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_96 = q5Selected_1 ? stgData_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_97 = q5Selected_2 ? stgData_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_98 = _io_q5IQEnq_0_bits_T_95 | _io_q5IQEnq_0_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_100 = q5Selected_0 ? stgData_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_101 = q5Selected_1 ? stgData_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_102 = q5Selected_2 ? stgData_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_q5IQEnq_0_bits_T_103 = _io_q5IQEnq_0_bits_T_100 | _io_q5IQEnq_0_bits_T_101; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_110 = q5Selected_0 ? stgData_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_111 = q5Selected_1 ? stgData_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_112 = q5Selected_2 ? stgData_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_113 = _io_q5IQEnq_0_bits_T_110 | _io_q5IQEnq_0_bits_T_111; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_115 = q5Selected_0 ? stgData_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_116 = q5Selected_1 ? stgData_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_117 = q5Selected_2 ? stgData_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_118 = _io_q5IQEnq_0_bits_T_115 | _io_q5IQEnq_0_bits_T_116; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_120 = q5Selected_0 ? stgData_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_121 = q5Selected_1 ? stgData_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_122 = q5Selected_2 ? stgData_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_123 = _io_q5IQEnq_0_bits_T_120 | _io_q5IQEnq_0_bits_T_121; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_125 = q5Selected_0 ? stgData_0_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_126 = q5Selected_1 ? stgData_1_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_127 = q5Selected_2 ? stgData_2_bpuInfo_meta_predTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_128 = _io_q5IQEnq_0_bits_T_125 | _io_q5IQEnq_0_bits_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_135 = q5Selected_0 ? stgData_0_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_136 = q5Selected_1 ? stgData_1_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_137 = q5Selected_2 ? stgData_2_bpuInfo_meta_rasTop : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_138 = _io_q5IQEnq_0_bits_T_135 | _io_q5IQEnq_0_bits_T_136; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_140 = q5Selected_0 ? stgData_0_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_141 = q5Selected_1 ? stgData_1_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_142 = q5Selected_2 ? stgData_2_bpuInfo_meta_phtCounter : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_143 = _io_q5IQEnq_0_bits_T_140 | _io_q5IQEnq_0_bits_T_141; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_145 = q5Selected_0 ? stgData_0_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_146 = q5Selected_1 ? stgData_1_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_147 = q5Selected_2 ? stgData_2_bpuInfo_meta_btbOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_148 = _io_q5IQEnq_0_bits_T_145 | _io_q5IQEnq_0_bits_T_146; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_180 = q5Selected_0 ? stgData_0_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_181 = q5Selected_1 ? stgData_1_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_182 = q5Selected_2 ? stgData_2_bpuInfo_takenOffset : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [1:0] _io_q5IQEnq_0_bits_T_183 = _io_q5IQEnq_0_bits_T_180 | _io_q5IQEnq_0_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_185 = q5Selected_0 ? stgData_0_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_186 = q5Selected_1 ? stgData_1_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_187 = q5Selected_2 ? stgData_2_bpuInfo_target : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_188 = _io_q5IQEnq_0_bits_T_185 | _io_q5IQEnq_0_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_195 = q5Selected_0 ? stgData_0_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_196 = q5Selected_1 ? stgData_1_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_197 = q5Selected_2 ? stgData_2_bpuInfo_fallThrough : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_198 = _io_q5IQEnq_0_bits_T_195 | _io_q5IQEnq_0_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_200 = q5Selected_0 ? stgData_0_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_201 = q5Selected_1 ? stgData_1_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_202 = q5Selected_2 ? stgData_2_bpuInfo_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_203 = _io_q5IQEnq_0_bits_T_200 | _io_q5IQEnq_0_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_205 = q5Selected_0 ? stgData_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_206 = q5Selected_1 ? stgData_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_207 = q5Selected_2 ? stgData_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_208 = _io_q5IQEnq_0_bits_T_205 | _io_q5IQEnq_0_bits_T_206; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_240 = q5Selected_0 ? stgData_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_241 = q5Selected_1 ? stgData_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_242 = q5Selected_2 ? stgData_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_q5IQEnq_0_bits_T_243 = _io_q5IQEnq_0_bits_T_240 | _io_q5IQEnq_0_bits_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q5IQEnq_0_bits_T_250 = q5Selected_0 ? stgData_0_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q5IQEnq_0_bits_T_251 = q5Selected_1 ? stgData_1_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q5IQEnq_0_bits_T_252 = q5Selected_2 ? stgData_2_excp_excpVec : 17'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [16:0] _io_q5IQEnq_0_bits_T_253 = _io_q5IQEnq_0_bits_T_250 | _io_q5IQEnq_0_bits_T_251; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_290 = q5Selected_0 ? stgData_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_291 = q5Selected_1 ? stgData_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_292 = q5Selected_2 ? stgData_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_293 = _io_q5IQEnq_0_bits_T_290 | _io_q5IQEnq_0_bits_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_295 = q5Selected_0 ? stgData_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_296 = q5Selected_1 ? stgData_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_297 = q5Selected_2 ? stgData_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_298 = _io_q5IQEnq_0_bits_T_295 | _io_q5IQEnq_0_bits_T_296; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_300 = q5Selected_0 ? stgData_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_301 = q5Selected_1 ? stgData_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_302 = q5Selected_2 ? stgData_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_303 = _io_q5IQEnq_0_bits_T_300 | _io_q5IQEnq_0_bits_T_301; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_305 = q5Selected_0 ? stgData_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_306 = q5Selected_1 ? stgData_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_307 = q5Selected_2 ? stgData_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_308 = _io_q5IQEnq_0_bits_T_305 | _io_q5IQEnq_0_bits_T_306; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_310 = q5Selected_0 ? stgData_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_311 = q5Selected_1 ? stgData_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_312 = q5Selected_2 ? stgData_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_313 = _io_q5IQEnq_0_bits_T_310 | _io_q5IQEnq_0_bits_T_311; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_315 = q5Selected_0 ? stgData_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_316 = q5Selected_1 ? stgData_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_317 = q5Selected_2 ? stgData_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_q5IQEnq_0_bits_T_318 = _io_q5IQEnq_0_bits_T_315 | _io_q5IQEnq_0_bits_T_316; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_320 = q5Selected_0 ? stgData_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_321 = q5Selected_1 ? stgData_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_322 = q5Selected_2 ? stgData_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_323 = _io_q5IQEnq_0_bits_T_320 | _io_q5IQEnq_0_bits_T_321; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_325 = q5Selected_0 ? stgData_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_326 = q5Selected_1 ? stgData_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_327 = q5Selected_2 ? stgData_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_328 = _io_q5IQEnq_0_bits_T_325 | _io_q5IQEnq_0_bits_T_326; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_330 = q5Selected_0 ? stgData_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_331 = q5Selected_1 ? stgData_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_332 = q5Selected_2 ? stgData_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_q5IQEnq_0_bits_T_333 = _io_q5IQEnq_0_bits_T_330 | _io_q5IQEnq_0_bits_T_331; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_335 = q5Selected_0 ? stgData_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_336 = q5Selected_1 ? stgData_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_337 = q5Selected_2 ? stgData_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_q5IQEnq_0_bits_T_338 = _io_q5IQEnq_0_bits_T_335 | _io_q5IQEnq_0_bits_T_336; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_340 = q5Selected_0 ? stgData_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_341 = q5Selected_1 ? stgData_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_342 = q5Selected_2 ? stgData_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_343 = _io_q5IQEnq_0_bits_T_340 | _io_q5IQEnq_0_bits_T_341; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_345 = q5Selected_0 ? stgData_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_346 = q5Selected_1 ? stgData_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_347 = q5Selected_2 ? stgData_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_q5IQEnq_0_bits_T_348 = _io_q5IQEnq_0_bits_T_345 | _io_q5IQEnq_0_bits_T_346; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  BusyTable busyTable ( // @[src/main/scala/backend/dispatch/DispatchStage.scala 49:25]
    .clock(busyTable_clock),
    .reset(busyTable_reset),
    .io_readReq_0(busyTable_io_readReq_0),
    .io_readReq_1(busyTable_io_readReq_1),
    .io_readReq_2(busyTable_io_readReq_2),
    .io_readReq_3(busyTable_io_readReq_3),
    .io_readReq_4(busyTable_io_readReq_4),
    .io_readReq_5(busyTable_io_readReq_5),
    .io_readResp_0(busyTable_io_readResp_0),
    .io_readResp_1(busyTable_io_readResp_1),
    .io_readResp_2(busyTable_io_readResp_2),
    .io_readResp_3(busyTable_io_readResp_3),
    .io_readResp_4(busyTable_io_readResp_4),
    .io_readResp_5(busyTable_io_readResp_5),
    .io_allocReq_0_valid(busyTable_io_allocReq_0_valid),
    .io_allocReq_0_bits(busyTable_io_allocReq_0_bits),
    .io_allocReq_1_valid(busyTable_io_allocReq_1_valid),
    .io_allocReq_1_bits(busyTable_io_allocReq_1_bits),
    .io_allocReq_2_valid(busyTable_io_allocReq_2_valid),
    .io_allocReq_2_bits(busyTable_io_allocReq_2_bits),
    .io_wbReq_0_valid(busyTable_io_wbReq_0_valid),
    .io_wbReq_0_bits(busyTable_io_wbReq_0_bits),
    .io_wbReq_1_valid(busyTable_io_wbReq_1_valid),
    .io_wbReq_1_bits(busyTable_io_wbReq_1_bits),
    .io_wbReq_2_valid(busyTable_io_wbReq_2_valid),
    .io_wbReq_2_bits(busyTable_io_wbReq_2_bits),
    .io_wbReq_3_valid(busyTable_io_wbReq_3_valid),
    .io_wbReq_3_bits(busyTable_io_wbReq_3_bits),
    .io_wbReq_4_valid(busyTable_io_wbReq_4_valid),
    .io_wbReq_4_bits(busyTable_io_wbReq_4_bits)
  );
  assign io_in_0_ready = (~stgValid | dispatchFire & AllWillFire) & ~io_robEnq_full; // @[src/main/scala/backend/dispatch/DispatchStage.scala 222:70]
  assign io_in_1_ready = (~stgValid | dispatchFire & AllWillFire) & ~io_robEnq_full; // @[src/main/scala/backend/dispatch/DispatchStage.scala 222:70]
  assign io_in_2_ready = (~stgValid | dispatchFire & AllWillFire) & ~io_robEnq_full; // @[src/main/scala/backend/dispatch/DispatchStage.scala 222:70]
  assign io_q1IQEnq_0_valid = |_T_14 & dispatchFire & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 420:23 432:44 433:25]
  assign io_q1IQEnq_0_bits_pc = _io_q1IQEnq_0_bits_T_348 | _io_q1IQEnq_0_bits_T_347; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_inst = _io_q1IQEnq_0_bits_T_343 | _io_q1IQEnq_0_bits_T_342; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_fuType = _io_q1IQEnq_0_bits_T_338 | _io_q1IQEnq_0_bits_T_337; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_aluOp = _io_q1IQEnq_0_bits_T_333 | _io_q1IQEnq_0_bits_T_332; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_bruOp = _io_q1IQEnq_0_bits_T_328 | _io_q1IQEnq_0_bits_T_327; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_lsuOp = _io_q1IQEnq_0_bits_T_323 | _io_q1IQEnq_0_bits_T_322; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_csrOp = _io_q1IQEnq_0_bits_T_318 | _io_q1IQEnq_0_bits_T_317; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_mulOp = _io_q1IQEnq_0_bits_T_313 | _io_q1IQEnq_0_bits_T_312; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_divOp = _io_q1IQEnq_0_bits_T_308 | _io_q1IQEnq_0_bits_T_307; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_src1Type = _io_q1IQEnq_0_bits_T_303 | _io_q1IQEnq_0_bits_T_302; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_src2Type = _io_q1IQEnq_0_bits_T_298 | _io_q1IQEnq_0_bits_T_297; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_immType = _io_q1IQEnq_0_bits_T_293 | _io_q1IQEnq_0_bits_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_rfWen = q1Final_0 & stgData_0_ctrl_rfWen | q1Final_1 & stgData_1_ctrl_rfWen | q1Final_2
     & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_memRead = q1Final_0 & stgData_0_ctrl_memRead | q1Final_1 & stgData_1_ctrl_memRead |
    q1Final_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_memWrite = q1Final_0 & stgData_0_ctrl_memWrite | q1Final_1 & stgData_1_ctrl_memWrite |
    q1Final_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_csrWen = q1Final_0 & stgData_0_ctrl_csrWen | q1Final_1 & stgData_1_ctrl_csrWen |
    q1Final_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_isBranch = q1Final_0 & stgData_0_ctrl_isBranch | q1Final_1 & stgData_1_ctrl_isBranch |
    q1Final_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_isJump = q1Final_0 & stgData_0_ctrl_isJump | q1Final_1 & stgData_1_ctrl_isJump |
    q1Final_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ctrl_isPriv = q1Final_0 & stgData_0_ctrl_isPriv | q1Final_1 & stgData_1_ctrl_isPriv |
    q1Final_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_excp_excpVec = _io_q1IQEnq_0_bits_T_253 | _io_q1IQEnq_0_bits_T_252; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_imm = _io_q1IQEnq_0_bits_T_248 | _io_q1IQEnq_0_bits_T_247; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_csrAddress = _io_q1IQEnq_0_bits_T_243 | _io_q1IQEnq_0_bits_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_valid = q1Final_0 & stgData_0_pdInfo_valid | q1Final_1 & stgData_1_pdInfo_valid |
    q1Final_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isBr = q1Final_0 & stgData_0_pdInfo_isBr | q1Final_1 & stgData_1_pdInfo_isBr |
    q1Final_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isJal = q1Final_0 & stgData_0_pdInfo_isJal | q1Final_1 & stgData_1_pdInfo_isJal |
    q1Final_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isJalr = q1Final_0 & stgData_0_pdInfo_isJalr | q1Final_1 & stgData_1_pdInfo_isJalr |
    q1Final_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isCall = q1Final_0 & stgData_0_pdInfo_isCall | q1Final_1 & stgData_1_pdInfo_isCall |
    q1Final_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_isRet = q1Final_0 & stgData_0_pdInfo_isRet | q1Final_1 & stgData_1_pdInfo_isRet |
    q1Final_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdInfo_jumpTarget = _io_q1IQEnq_0_bits_T_208 | _io_q1IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_pc = _io_q1IQEnq_0_bits_T_203 | _io_q1IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_fallThrough = _io_q1IQEnq_0_bits_T_198 | _io_q1IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_taken = q1Final_0 & stgData_0_bpuInfo_taken | q1Final_1 & stgData_1_bpuInfo_taken |
    q1Final_2 & stgData_2_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_target = _io_q1IQEnq_0_bits_T_188 | _io_q1IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_takenOffset = _io_q1IQEnq_0_bits_T_183 | _io_q1IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_valid = q1Final_0 & stgData_0_bpuInfo_meta_valid | q1Final_1 &
    stgData_1_bpuInfo_meta_valid | q1Final_2 & stgData_2_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbHit = q1Final_0 & stgData_0_bpuInfo_meta_btbHit | q1Final_1 &
    stgData_1_bpuInfo_meta_btbHit | q1Final_2 & stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr = q1Final_0 & stgData_0_bpuInfo_meta_btbIsJalr | q1Final_1 &
    stgData_1_bpuInfo_meta_btbIsJalr | q1Final_2 & stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal = q1Final_0 & stgData_0_bpuInfo_meta_btbIsJal | q1Final_1 &
    stgData_1_bpuInfo_meta_btbIsJal | q1Final_2 & stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall = q1Final_0 & stgData_0_bpuInfo_meta_btbIsCall | q1Final_1 &
    stgData_1_bpuInfo_meta_btbIsCall | q1Final_2 & stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet = q1Final_0 & stgData_0_bpuInfo_meta_btbIsRet | q1Final_1 &
    stgData_1_bpuInfo_meta_btbIsRet | q1Final_2 & stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset = _io_q1IQEnq_0_bits_T_148 | _io_q1IQEnq_0_bits_T_147; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter = _io_q1IQEnq_0_bits_T_143 | _io_q1IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_rasTop = _io_q1IQEnq_0_bits_T_138 | _io_q1IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_predTaken = q1Final_0 & stgData_0_bpuInfo_meta_predTaken | q1Final_1 &
    stgData_1_bpuInfo_meta_predTaken | q1Final_2 & stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_predTarget = _io_q1IQEnq_0_bits_T_128 | _io_q1IQEnq_0_bits_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_ldst = _io_q1IQEnq_0_bits_T_123 | _io_q1IQEnq_0_bits_T_122; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_lrs1 = _io_q1IQEnq_0_bits_T_118 | _io_q1IQEnq_0_bits_T_117; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_lrs2 = _io_q1IQEnq_0_bits_T_113 | _io_q1IQEnq_0_bits_T_112; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_pdst = _io_q1IQEnq_0_bits_T_108 | _io_q1IQEnq_0_bits_T_107; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs1 = _io_q1IQEnq_0_bits_T_103 | _io_q1IQEnq_0_bits_T_102; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs2 = _io_q1IQEnq_0_bits_T_98 | _io_q1IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_oldPdst = _io_q1IQEnq_0_bits_T_93 | _io_q1IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_rs1Valid = q1Final_0 & stgData_0_rs1Valid | q1Final_1 & stgData_1_rs1Valid | q1Final_2 &
    stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_rs2Valid = q1Final_0 & stgData_0_rs2Valid | q1Final_1 & stgData_1_rs2Valid | q1Final_2 &
    stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_rdValid = q1Final_0 & stgData_0_rdValid | q1Final_1 & stgData_1_rdValid | q1Final_2 &
    stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_snptId_valid = q1Final_0 & stgData_0_snptId_valid | q1Final_1 & stgData_1_snptId_valid |
    q1Final_2 & stgData_2_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_snptId_bits = _io_q1IQEnq_0_bits_T_68 | _io_q1IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_robIdx_value = _io_q1IQEnq_0_bits_T_53 | _io_q1IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_robIdx_flag = q1Final_0 & stgData_0_robIdx_flag | q1Final_1 & stgData_1_robIdx_flag |
    q1Final_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_robIdxFull_value = _io_q1IQEnq_0_bits_T_53 | _io_q1IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_robIdxFull_flag = q1Final_0 & stgData_0_robIdx_flag | q1Final_1 & stgData_1_robIdx_flag |
    q1Final_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs1Busy = q1Final_0 & q1Uops_u_u_prs1Busy | q1Final_1 & q1Uops_u_u_1_prs1Busy | q1Final_2 &
    q1Uops_u_u_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q1IQEnq_0_bits_prs2Busy = q1Final_0 & q1Uops_u_u_prs2Busy | q1Final_1 & q1Uops_u_u_1_prs2Busy | q1Final_2 &
    q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_valid = |_T_17 & dispatchFire & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 421:23 443:44 444:25]
  assign io_q2IQEnq_0_bits_pc = _io_q2IQEnq_0_bits_T_348 | _io_q2IQEnq_0_bits_T_347; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_inst = _io_q2IQEnq_0_bits_T_343 | _io_q2IQEnq_0_bits_T_342; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_fuType = _io_q2IQEnq_0_bits_T_338 | _io_q2IQEnq_0_bits_T_337; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_aluOp = _io_q2IQEnq_0_bits_T_333 | _io_q2IQEnq_0_bits_T_332; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_bruOp = _io_q2IQEnq_0_bits_T_328 | _io_q2IQEnq_0_bits_T_327; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_lsuOp = _io_q2IQEnq_0_bits_T_323 | _io_q2IQEnq_0_bits_T_322; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_csrOp = _io_q2IQEnq_0_bits_T_318 | _io_q2IQEnq_0_bits_T_317; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_mulOp = _io_q2IQEnq_0_bits_T_313 | _io_q2IQEnq_0_bits_T_312; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_divOp = _io_q2IQEnq_0_bits_T_308 | _io_q2IQEnq_0_bits_T_307; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_src1Type = _io_q2IQEnq_0_bits_T_303 | _io_q2IQEnq_0_bits_T_302; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_src2Type = _io_q2IQEnq_0_bits_T_298 | _io_q2IQEnq_0_bits_T_297; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_immType = _io_q2IQEnq_0_bits_T_293 | _io_q2IQEnq_0_bits_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_rfWen = q2Final_0 & stgData_0_ctrl_rfWen | q2Final_1 & stgData_1_ctrl_rfWen | q2Final_2
     & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_memRead = q2Final_0 & stgData_0_ctrl_memRead | q2Final_1 & stgData_1_ctrl_memRead |
    q2Final_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_memWrite = q2Final_0 & stgData_0_ctrl_memWrite | q2Final_1 & stgData_1_ctrl_memWrite |
    q2Final_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_csrWen = q2Final_0 & stgData_0_ctrl_csrWen | q2Final_1 & stgData_1_ctrl_csrWen |
    q2Final_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_isBranch = q2Final_0 & stgData_0_ctrl_isBranch | q2Final_1 & stgData_1_ctrl_isBranch |
    q2Final_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_isJump = q2Final_0 & stgData_0_ctrl_isJump | q2Final_1 & stgData_1_ctrl_isJump |
    q2Final_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ctrl_isPriv = q2Final_0 & stgData_0_ctrl_isPriv | q2Final_1 & stgData_1_ctrl_isPriv |
    q2Final_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_excp_excpVec = _io_q2IQEnq_0_bits_T_253 | _io_q2IQEnq_0_bits_T_252; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_imm = _io_q2IQEnq_0_bits_T_248 | _io_q2IQEnq_0_bits_T_247; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_csrAddress = _io_q2IQEnq_0_bits_T_243 | _io_q2IQEnq_0_bits_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_valid = q2Final_0 & stgData_0_pdInfo_valid | q2Final_1 & stgData_1_pdInfo_valid |
    q2Final_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isBr = q2Final_0 & stgData_0_pdInfo_isBr | q2Final_1 & stgData_1_pdInfo_isBr |
    q2Final_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isJal = q2Final_0 & stgData_0_pdInfo_isJal | q2Final_1 & stgData_1_pdInfo_isJal |
    q2Final_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isJalr = q2Final_0 & stgData_0_pdInfo_isJalr | q2Final_1 & stgData_1_pdInfo_isJalr |
    q2Final_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isCall = q2Final_0 & stgData_0_pdInfo_isCall | q2Final_1 & stgData_1_pdInfo_isCall |
    q2Final_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_isRet = q2Final_0 & stgData_0_pdInfo_isRet | q2Final_1 & stgData_1_pdInfo_isRet |
    q2Final_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdInfo_jumpTarget = _io_q2IQEnq_0_bits_T_208 | _io_q2IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_pc = _io_q2IQEnq_0_bits_T_203 | _io_q2IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_fallThrough = _io_q2IQEnq_0_bits_T_198 | _io_q2IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_taken = q2Final_0 & stgData_0_bpuInfo_taken | q2Final_1 & stgData_1_bpuInfo_taken |
    q2Final_2 & stgData_2_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_target = _io_q2IQEnq_0_bits_T_188 | _io_q2IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_takenOffset = _io_q2IQEnq_0_bits_T_183 | _io_q2IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_valid = q2Final_0 & stgData_0_bpuInfo_meta_valid | q2Final_1 &
    stgData_1_bpuInfo_meta_valid | q2Final_2 & stgData_2_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbHit = q2Final_0 & stgData_0_bpuInfo_meta_btbHit | q2Final_1 &
    stgData_1_bpuInfo_meta_btbHit | q2Final_2 & stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr = q2Final_0 & stgData_0_bpuInfo_meta_btbIsJalr | q2Final_1 &
    stgData_1_bpuInfo_meta_btbIsJalr | q2Final_2 & stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal = q2Final_0 & stgData_0_bpuInfo_meta_btbIsJal | q2Final_1 &
    stgData_1_bpuInfo_meta_btbIsJal | q2Final_2 & stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall = q2Final_0 & stgData_0_bpuInfo_meta_btbIsCall | q2Final_1 &
    stgData_1_bpuInfo_meta_btbIsCall | q2Final_2 & stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet = q2Final_0 & stgData_0_bpuInfo_meta_btbIsRet | q2Final_1 &
    stgData_1_bpuInfo_meta_btbIsRet | q2Final_2 & stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset = _io_q2IQEnq_0_bits_T_148 | _io_q2IQEnq_0_bits_T_147; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter = _io_q2IQEnq_0_bits_T_143 | _io_q2IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_rasTop = _io_q2IQEnq_0_bits_T_138 | _io_q2IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_predTaken = q2Final_0 & stgData_0_bpuInfo_meta_predTaken | q2Final_1 &
    stgData_1_bpuInfo_meta_predTaken | q2Final_2 & stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_predTarget = _io_q2IQEnq_0_bits_T_128 | _io_q2IQEnq_0_bits_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_ldst = _io_q2IQEnq_0_bits_T_123 | _io_q2IQEnq_0_bits_T_122; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_lrs1 = _io_q2IQEnq_0_bits_T_118 | _io_q2IQEnq_0_bits_T_117; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_lrs2 = _io_q2IQEnq_0_bits_T_113 | _io_q2IQEnq_0_bits_T_112; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_pdst = _io_q2IQEnq_0_bits_T_108 | _io_q2IQEnq_0_bits_T_107; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs1 = _io_q2IQEnq_0_bits_T_103 | _io_q2IQEnq_0_bits_T_102; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs2 = _io_q2IQEnq_0_bits_T_98 | _io_q2IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_oldPdst = _io_q2IQEnq_0_bits_T_93 | _io_q2IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_rs1Valid = q2Final_0 & stgData_0_rs1Valid | q2Final_1 & stgData_1_rs1Valid | q2Final_2 &
    stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_rs2Valid = q2Final_0 & stgData_0_rs2Valid | q2Final_1 & stgData_1_rs2Valid | q2Final_2 &
    stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_rdValid = q2Final_0 & stgData_0_rdValid | q2Final_1 & stgData_1_rdValid | q2Final_2 &
    stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_snptId_valid = q2Final_0 & stgData_0_snptId_valid | q2Final_1 & stgData_1_snptId_valid |
    q2Final_2 & stgData_2_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_snptId_bits = _io_q2IQEnq_0_bits_T_68 | _io_q2IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_robIdx_value = _io_q2IQEnq_0_bits_T_53 | _io_q2IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_robIdx_flag = q2Final_0 & stgData_0_robIdx_flag | q2Final_1 & stgData_1_robIdx_flag |
    q2Final_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_robIdxFull_value = _io_q2IQEnq_0_bits_T_53 | _io_q2IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_robIdxFull_flag = q2Final_0 & stgData_0_robIdx_flag | q2Final_1 & stgData_1_robIdx_flag |
    q2Final_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_issueQueue = _io_q2IQEnq_0_bits_T_23 | _io_q2IQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs1Busy = q2Final_0 & q1Uops_u_u_prs1Busy | q2Final_1 & q1Uops_u_u_1_prs1Busy | q2Final_2 &
    q1Uops_u_u_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q2IQEnq_0_bits_prs2Busy = q2Final_0 & q1Uops_u_u_prs2Busy | q2Final_1 & q1Uops_u_u_1_prs2Busy | q2Final_2 &
    q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_valid = |_T_20 & dispatchFire & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 422:23 454:44 455:25]
  assign io_q3IQEnq_0_bits_pc = _io_q3IQEnq_0_bits_T_348 | _io_q3IQEnq_0_bits_T_347; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_inst = _io_q3IQEnq_0_bits_T_343 | _io_q3IQEnq_0_bits_T_342; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_fuType = _io_q3IQEnq_0_bits_T_338 | _io_q3IQEnq_0_bits_T_337; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_aluOp = _io_q3IQEnq_0_bits_T_333 | _io_q3IQEnq_0_bits_T_332; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_bruOp = _io_q3IQEnq_0_bits_T_328 | _io_q3IQEnq_0_bits_T_327; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_lsuOp = _io_q3IQEnq_0_bits_T_323 | _io_q3IQEnq_0_bits_T_322; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_csrOp = _io_q3IQEnq_0_bits_T_318 | _io_q3IQEnq_0_bits_T_317; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_mulOp = _io_q3IQEnq_0_bits_T_313 | _io_q3IQEnq_0_bits_T_312; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_divOp = _io_q3IQEnq_0_bits_T_308 | _io_q3IQEnq_0_bits_T_307; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_src1Type = _io_q3IQEnq_0_bits_T_303 | _io_q3IQEnq_0_bits_T_302; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_src2Type = _io_q3IQEnq_0_bits_T_298 | _io_q3IQEnq_0_bits_T_297; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_immType = _io_q3IQEnq_0_bits_T_293 | _io_q3IQEnq_0_bits_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_rfWen = q3Final_0 & stgData_0_ctrl_rfWen | q3Final_1 & stgData_1_ctrl_rfWen | q3Final_2
     & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_memRead = q3Final_0 & stgData_0_ctrl_memRead | q3Final_1 & stgData_1_ctrl_memRead |
    q3Final_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_memWrite = q3Final_0 & stgData_0_ctrl_memWrite | q3Final_1 & stgData_1_ctrl_memWrite |
    q3Final_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_csrWen = q3Final_0 & stgData_0_ctrl_csrWen | q3Final_1 & stgData_1_ctrl_csrWen |
    q3Final_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_isBranch = q3Final_0 & stgData_0_ctrl_isBranch | q3Final_1 & stgData_1_ctrl_isBranch |
    q3Final_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_isJump = q3Final_0 & stgData_0_ctrl_isJump | q3Final_1 & stgData_1_ctrl_isJump |
    q3Final_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ctrl_isPriv = q3Final_0 & stgData_0_ctrl_isPriv | q3Final_1 & stgData_1_ctrl_isPriv |
    q3Final_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_excp_excpVec = _io_q3IQEnq_0_bits_T_253 | _io_q3IQEnq_0_bits_T_252; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_imm = _io_q3IQEnq_0_bits_T_248 | _io_q3IQEnq_0_bits_T_247; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_csrAddress = _io_q3IQEnq_0_bits_T_243 | _io_q3IQEnq_0_bits_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_valid = q3Final_0 & stgData_0_pdInfo_valid | q3Final_1 & stgData_1_pdInfo_valid |
    q3Final_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isBr = q3Final_0 & stgData_0_pdInfo_isBr | q3Final_1 & stgData_1_pdInfo_isBr |
    q3Final_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isJal = q3Final_0 & stgData_0_pdInfo_isJal | q3Final_1 & stgData_1_pdInfo_isJal |
    q3Final_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isJalr = q3Final_0 & stgData_0_pdInfo_isJalr | q3Final_1 & stgData_1_pdInfo_isJalr |
    q3Final_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isCall = q3Final_0 & stgData_0_pdInfo_isCall | q3Final_1 & stgData_1_pdInfo_isCall |
    q3Final_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_isRet = q3Final_0 & stgData_0_pdInfo_isRet | q3Final_1 & stgData_1_pdInfo_isRet |
    q3Final_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdInfo_jumpTarget = _io_q3IQEnq_0_bits_T_208 | _io_q3IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_pc = _io_q3IQEnq_0_bits_T_203 | _io_q3IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_fallThrough = _io_q3IQEnq_0_bits_T_198 | _io_q3IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_taken = q3Final_0 & stgData_0_bpuInfo_taken | q3Final_1 & stgData_1_bpuInfo_taken |
    q3Final_2 & stgData_2_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_target = _io_q3IQEnq_0_bits_T_188 | _io_q3IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_takenOffset = _io_q3IQEnq_0_bits_T_183 | _io_q3IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_valid = q3Final_0 & stgData_0_bpuInfo_meta_valid | q3Final_1 &
    stgData_1_bpuInfo_meta_valid | q3Final_2 & stgData_2_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbHit = q3Final_0 & stgData_0_bpuInfo_meta_btbHit | q3Final_1 &
    stgData_1_bpuInfo_meta_btbHit | q3Final_2 & stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr = q3Final_0 & stgData_0_bpuInfo_meta_btbIsJalr | q3Final_1 &
    stgData_1_bpuInfo_meta_btbIsJalr | q3Final_2 & stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal = q3Final_0 & stgData_0_bpuInfo_meta_btbIsJal | q3Final_1 &
    stgData_1_bpuInfo_meta_btbIsJal | q3Final_2 & stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall = q3Final_0 & stgData_0_bpuInfo_meta_btbIsCall | q3Final_1 &
    stgData_1_bpuInfo_meta_btbIsCall | q3Final_2 & stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet = q3Final_0 & stgData_0_bpuInfo_meta_btbIsRet | q3Final_1 &
    stgData_1_bpuInfo_meta_btbIsRet | q3Final_2 & stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset = _io_q3IQEnq_0_bits_T_148 | _io_q3IQEnq_0_bits_T_147; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter = _io_q3IQEnq_0_bits_T_143 | _io_q3IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_rasTop = _io_q3IQEnq_0_bits_T_138 | _io_q3IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_predTaken = q3Final_0 & stgData_0_bpuInfo_meta_predTaken | q3Final_1 &
    stgData_1_bpuInfo_meta_predTaken | q3Final_2 & stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_predTarget = _io_q3IQEnq_0_bits_T_128 | _io_q3IQEnq_0_bits_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_ldst = _io_q3IQEnq_0_bits_T_123 | _io_q3IQEnq_0_bits_T_122; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_lrs1 = _io_q3IQEnq_0_bits_T_118 | _io_q3IQEnq_0_bits_T_117; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_lrs2 = _io_q3IQEnq_0_bits_T_113 | _io_q3IQEnq_0_bits_T_112; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_pdst = _io_q3IQEnq_0_bits_T_108 | _io_q3IQEnq_0_bits_T_107; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs1 = _io_q3IQEnq_0_bits_T_103 | _io_q3IQEnq_0_bits_T_102; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs2 = _io_q3IQEnq_0_bits_T_98 | _io_q3IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_oldPdst = _io_q3IQEnq_0_bits_T_93 | _io_q3IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_rs1Valid = q3Final_0 & stgData_0_rs1Valid | q3Final_1 & stgData_1_rs1Valid | q3Final_2 &
    stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_rs2Valid = q3Final_0 & stgData_0_rs2Valid | q3Final_1 & stgData_1_rs2Valid | q3Final_2 &
    stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_rdValid = q3Final_0 & stgData_0_rdValid | q3Final_1 & stgData_1_rdValid | q3Final_2 &
    stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_snptId_valid = q3Final_0 & stgData_0_snptId_valid | q3Final_1 & stgData_1_snptId_valid |
    q3Final_2 & stgData_2_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_snptId_bits = _io_q3IQEnq_0_bits_T_68 | _io_q3IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_robIdx_value = _io_q3IQEnq_0_bits_T_53 | _io_q3IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_robIdx_flag = q3Final_0 & stgData_0_robIdx_flag | q3Final_1 & stgData_1_robIdx_flag |
    q3Final_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_robIdxFull_value = _io_q3IQEnq_0_bits_T_53 | _io_q3IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_robIdxFull_flag = q3Final_0 & stgData_0_robIdx_flag | q3Final_1 & stgData_1_robIdx_flag |
    q3Final_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_issueQueue = _io_q3IQEnq_0_bits_T_23 | _io_q3IQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs1Busy = q3Final_0 & q1Uops_u_u_prs1Busy | q3Final_1 & q1Uops_u_u_1_prs1Busy | q3Final_2 &
    q1Uops_u_u_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q3IQEnq_0_bits_prs2Busy = q3Final_0 & q1Uops_u_u_prs2Busy | q3Final_1 & q1Uops_u_u_1_prs2Busy | q3Final_2 &
    q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_valid = _memDispatchedThisCycle_T_1 & dispatchFire & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 423:23 460:47 461:25]
  assign io_q4IQEnq_0_bits_pc = _selectedMemInst_T_293 | _selectedMemInst_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_inst = _selectedMemInst_T_288 | _selectedMemInst_T_287; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_fuType = _selectedMemInst_T_283 | _selectedMemInst_T_282; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_aluOp = _selectedMemInst_T_278 | _selectedMemInst_T_277; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_bruOp = _selectedMemInst_T_273 | _selectedMemInst_T_272; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_lsuOp = _selectedMemInst_T_268 | _selectedMemInst_T_267; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_csrOp = _selectedMemInst_T_263 | _selectedMemInst_T_262; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_mulOp = _selectedMemInst_T_258 | _selectedMemInst_T_257; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_divOp = _selectedMemInst_T_253 | _selectedMemInst_T_252; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_src1Type = _selectedMemInst_T_248 | _selectedMemInst_T_247; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_src2Type = _selectedMemInst_T_243 | _selectedMemInst_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_immType = _selectedMemInst_T_238 | _selectedMemInst_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_rfWen = _q4Cand_T_1 & stgData_0_ctrl_rfWen | q4Selected_1 & stgData_1_ctrl_rfWen |
    q4Selected_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_memRead = _q4Cand_T_1 & stgData_0_ctrl_memRead | q4Selected_1 & stgData_1_ctrl_memRead
     | q4Selected_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_memWrite = _q4Cand_T_1 & stgData_0_ctrl_memWrite | q4Selected_1 &
    stgData_1_ctrl_memWrite | q4Selected_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_csrWen = _q4Cand_T_1 & stgData_0_ctrl_csrWen | q4Selected_1 & stgData_1_ctrl_csrWen |
    q4Selected_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_isBranch = _q4Cand_T_1 & stgData_0_ctrl_isBranch | q4Selected_1 &
    stgData_1_ctrl_isBranch | q4Selected_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_isJump = _q4Cand_T_1 & stgData_0_ctrl_isJump | q4Selected_1 & stgData_1_ctrl_isJump |
    q4Selected_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ctrl_isPriv = _q4Cand_T_1 & stgData_0_ctrl_isPriv | q4Selected_1 & stgData_1_ctrl_isPriv |
    q4Selected_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_excp_excpVec = _selectedMemInst_T_198 | _selectedMemInst_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_imm = _selectedMemInst_T_193 | _selectedMemInst_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_csrAddress = _selectedMemInst_T_188 | _selectedMemInst_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_valid = _q4Cand_T_1 & stgData_0_pdInfo_valid | q4Selected_1 & stgData_1_pdInfo_valid
     | q4Selected_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isBr = _q4Cand_T_1 & stgData_0_pdInfo_isBr | q4Selected_1 & stgData_1_pdInfo_isBr |
    q4Selected_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isJal = _q4Cand_T_1 & stgData_0_pdInfo_isJal | q4Selected_1 & stgData_1_pdInfo_isJal
     | q4Selected_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isJalr = _q4Cand_T_1 & stgData_0_pdInfo_isJalr | q4Selected_1 &
    stgData_1_pdInfo_isJalr | q4Selected_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isCall = _q4Cand_T_1 & stgData_0_pdInfo_isCall | q4Selected_1 &
    stgData_1_pdInfo_isCall | q4Selected_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_isRet = _q4Cand_T_1 & stgData_0_pdInfo_isRet | q4Selected_1 & stgData_1_pdInfo_isRet
     | q4Selected_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdInfo_jumpTarget = _selectedMemInst_T_153 | _selectedMemInst_T_152; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_pc = _selectedMemInst_T_148 | _selectedMemInst_T_147; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_fallThrough = _selectedMemInst_T_143 | _selectedMemInst_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_taken = _q4Cand_T_1 & stgData_0_bpuInfo_taken | q4Selected_1 &
    stgData_1_bpuInfo_taken | q4Selected_2 & stgData_2_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_target = _selectedMemInst_T_133 | _selectedMemInst_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_takenOffset = _selectedMemInst_T_128 | _selectedMemInst_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_valid = _q4Cand_T_1 & stgData_0_bpuInfo_meta_valid | q4Selected_1 &
    stgData_1_bpuInfo_meta_valid | q4Selected_2 & stgData_2_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbHit = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbHit | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbHit | q4Selected_2 & stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsJalr | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsJalr | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsJal | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsJal | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsCall | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsCall | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsRet | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsRet | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset = _selectedMemInst_T_93 | _selectedMemInst_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter = _selectedMemInst_T_88 | _selectedMemInst_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_rasTop = _selectedMemInst_T_83 | _selectedMemInst_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_predTaken = _q4Cand_T_1 & stgData_0_bpuInfo_meta_predTaken | q4Selected_1 &
    stgData_1_bpuInfo_meta_predTaken | q4Selected_2 & stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_predTarget = _selectedMemInst_T_73 | _selectedMemInst_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_ldst = _selectedMemInst_T_68 | _selectedMemInst_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_lrs1 = _selectedMemInst_T_63 | _selectedMemInst_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_lrs2 = _selectedMemInst_T_58 | _selectedMemInst_T_57; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_pdst = _io_q4IQEnq_0_bits_T_108 | _io_q4IQEnq_0_bits_T_107; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs1 = _selectedMemInst_T_48 | _selectedMemInst_T_47; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs2 = _selectedMemInst_T_43 | _selectedMemInst_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_oldPdst = _selectedMemInst_T_38 | _selectedMemInst_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_rs1Valid = _q4Cand_T_1 & stgData_0_rs1Valid | q4Selected_1 & stgData_1_rs1Valid |
    q4Selected_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_rs2Valid = _q4Cand_T_1 & q4Uops_0_rs2Valid | q4Selected_1 & q4Uops_1_rs2Valid | q4Selected_2
     & q4Uops_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_rdValid = _q4Cand_T_1 & q4Uops_0_rdValid | q4Selected_1 & q4Uops_1_rdValid | q4Selected_2 &
    q4Uops_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_snptId_valid = _q4Cand_T_1 & stgData_0_snptId_valid | q4Selected_1 & stgData_1_snptId_valid
     | q4Selected_2 & stgData_2_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_snptId_bits = _selectedMemInst_T_28 | _selectedMemInst_T_27; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_robIdx_value = _selectedMemInst_T_8 | _selectedMemInst_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_robIdx_flag = _q4Cand_T_1 & stgData_0_robIdx_flag | q4Selected_1 & stgData_1_robIdx_flag |
    q4Selected_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_robIdxFull_value = _selectedMemInst_T_8 | _selectedMemInst_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_robIdxFull_flag = _q4Cand_T_1 & stgData_0_robIdx_flag | q4Selected_1 & stgData_1_robIdx_flag
     | q4Selected_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_lqIdx_value = _io_q4IQEnq_0_bits_T_43 | _io_q4IQEnq_0_bits_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_lqIdx_flag = _q4Cand_T_1 & q4Uops_0_lqIdx_flag | q4Selected_1 & q4Uops_1_lqIdx_flag |
    q4Selected_2 & q4Uops_2_lqIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_sqIdx_value = _io_q4IQEnq_0_bits_T_33 | _io_q4IQEnq_0_bits_T_32; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_sqIdx_flag = _q4Cand_T_1 & q4Uops_0_sqIdx_flag | q4Selected_1 & q4Uops_1_sqIdx_flag |
    q4Selected_2 & q4Uops_2_sqIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_issueQueue = _io_q4IQEnq_0_bits_T_23 | _io_q4IQEnq_0_bits_T_22; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs1Busy = _q4Cand_T_1 & q4Uops_0_prs1Busy | q4Selected_1 & q4Uops_1_prs1Busy | q4Selected_2
     & q4Uops_2_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_prs2Busy = _q4Cand_T_1 & q4Uops_0_prs2Busy | q4Selected_1 & q4Uops_1_prs2Busy | q4Selected_2
     & q4Uops_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_isSta = _q5Selected_T | _q5Selected_T_1 | _q5Selected_T_2; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q4IQEnq_0_bits_isStd = 1'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_valid = |_T_26 & dispatchFire & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 424:23 466:47 467:25]
  assign io_q5IQEnq_0_bits_pc = _io_q5IQEnq_0_bits_T_348 | _io_q5IQEnq_0_bits_T_347; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_inst = _io_q5IQEnq_0_bits_T_343 | _io_q5IQEnq_0_bits_T_342; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_fuType = _io_q5IQEnq_0_bits_T_338 | _io_q5IQEnq_0_bits_T_337; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_aluOp = _io_q5IQEnq_0_bits_T_333 | _io_q5IQEnq_0_bits_T_332; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_bruOp = _io_q5IQEnq_0_bits_T_328 | _io_q5IQEnq_0_bits_T_327; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_lsuOp = _io_q5IQEnq_0_bits_T_323 | _io_q5IQEnq_0_bits_T_322; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_csrOp = _io_q5IQEnq_0_bits_T_318 | _io_q5IQEnq_0_bits_T_317; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_mulOp = _io_q5IQEnq_0_bits_T_313 | _io_q5IQEnq_0_bits_T_312; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_divOp = _io_q5IQEnq_0_bits_T_308 | _io_q5IQEnq_0_bits_T_307; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_src1Type = _io_q5IQEnq_0_bits_T_303 | _io_q5IQEnq_0_bits_T_302; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_src2Type = _io_q5IQEnq_0_bits_T_298 | _io_q5IQEnq_0_bits_T_297; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_immType = _io_q5IQEnq_0_bits_T_293 | _io_q5IQEnq_0_bits_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_rfWen = q5Selected_0 & stgData_0_ctrl_rfWen | q5Selected_1 & stgData_1_ctrl_rfWen |
    q5Selected_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_memRead = q5Selected_0 & stgData_0_ctrl_memRead | q5Selected_1 & stgData_1_ctrl_memRead
     | q5Selected_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_memWrite = q5Selected_0 & stgData_0_ctrl_memWrite | q5Selected_1 &
    stgData_1_ctrl_memWrite | q5Selected_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_csrWen = q5Selected_0 & stgData_0_ctrl_csrWen | q5Selected_1 & stgData_1_ctrl_csrWen |
    q5Selected_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_isBranch = q5Selected_0 & stgData_0_ctrl_isBranch | q5Selected_1 &
    stgData_1_ctrl_isBranch | q5Selected_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_isJump = q5Selected_0 & stgData_0_ctrl_isJump | q5Selected_1 & stgData_1_ctrl_isJump |
    q5Selected_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ctrl_isPriv = q5Selected_0 & stgData_0_ctrl_isPriv | q5Selected_1 & stgData_1_ctrl_isPriv |
    q5Selected_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_excp_excpVec = _io_q5IQEnq_0_bits_T_253 | _io_q5IQEnq_0_bits_T_252; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_imm = 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_csrAddress = _io_q5IQEnq_0_bits_T_243 | _io_q5IQEnq_0_bits_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_valid = q5Selected_0 & stgData_0_pdInfo_valid | q5Selected_1 & stgData_1_pdInfo_valid
     | q5Selected_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isBr = q5Selected_0 & stgData_0_pdInfo_isBr | q5Selected_1 & stgData_1_pdInfo_isBr |
    q5Selected_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isJal = q5Selected_0 & stgData_0_pdInfo_isJal | q5Selected_1 & stgData_1_pdInfo_isJal
     | q5Selected_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isJalr = q5Selected_0 & stgData_0_pdInfo_isJalr | q5Selected_1 &
    stgData_1_pdInfo_isJalr | q5Selected_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isCall = q5Selected_0 & stgData_0_pdInfo_isCall | q5Selected_1 &
    stgData_1_pdInfo_isCall | q5Selected_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_isRet = q5Selected_0 & stgData_0_pdInfo_isRet | q5Selected_1 & stgData_1_pdInfo_isRet
     | q5Selected_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdInfo_jumpTarget = _io_q5IQEnq_0_bits_T_208 | _io_q5IQEnq_0_bits_T_207; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_pc = _io_q5IQEnq_0_bits_T_203 | _io_q5IQEnq_0_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_fallThrough = _io_q5IQEnq_0_bits_T_198 | _io_q5IQEnq_0_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_taken = q5Selected_0 & stgData_0_bpuInfo_taken | q5Selected_1 &
    stgData_1_bpuInfo_taken | q5Selected_2 & stgData_2_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_target = _io_q5IQEnq_0_bits_T_188 | _io_q5IQEnq_0_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_takenOffset = _io_q5IQEnq_0_bits_T_183 | _io_q5IQEnq_0_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_valid = q5Selected_0 & stgData_0_bpuInfo_meta_valid | q5Selected_1 &
    stgData_1_bpuInfo_meta_valid | q5Selected_2 & stgData_2_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbHit = q5Selected_0 & stgData_0_bpuInfo_meta_btbHit | q5Selected_1 &
    stgData_1_bpuInfo_meta_btbHit | q5Selected_2 & stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr = q5Selected_0 & stgData_0_bpuInfo_meta_btbIsJalr | q5Selected_1 &
    stgData_1_bpuInfo_meta_btbIsJalr | q5Selected_2 & stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal = q5Selected_0 & stgData_0_bpuInfo_meta_btbIsJal | q5Selected_1 &
    stgData_1_bpuInfo_meta_btbIsJal | q5Selected_2 & stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall = q5Selected_0 & stgData_0_bpuInfo_meta_btbIsCall | q5Selected_1 &
    stgData_1_bpuInfo_meta_btbIsCall | q5Selected_2 & stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet = q5Selected_0 & stgData_0_bpuInfo_meta_btbIsRet | q5Selected_1 &
    stgData_1_bpuInfo_meta_btbIsRet | q5Selected_2 & stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset = _io_q5IQEnq_0_bits_T_148 | _io_q5IQEnq_0_bits_T_147; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter = _io_q5IQEnq_0_bits_T_143 | _io_q5IQEnq_0_bits_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_rasTop = _io_q5IQEnq_0_bits_T_138 | _io_q5IQEnq_0_bits_T_137; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_predTaken = q5Selected_0 & stgData_0_bpuInfo_meta_predTaken | q5Selected_1 &
    stgData_1_bpuInfo_meta_predTaken | q5Selected_2 & stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_predTarget = _io_q5IQEnq_0_bits_T_128 | _io_q5IQEnq_0_bits_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_ldst = _io_q5IQEnq_0_bits_T_123 | _io_q5IQEnq_0_bits_T_122; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_lrs1 = _io_q5IQEnq_0_bits_T_118 | _io_q5IQEnq_0_bits_T_117; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_lrs2 = _io_q5IQEnq_0_bits_T_113 | _io_q5IQEnq_0_bits_T_112; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_pdst = 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_prs1 = _io_q5IQEnq_0_bits_T_103 | _io_q5IQEnq_0_bits_T_102; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_prs2 = _io_q5IQEnq_0_bits_T_98 | _io_q5IQEnq_0_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_oldPdst = _io_q5IQEnq_0_bits_T_93 | _io_q5IQEnq_0_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_rs1Valid = 1'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_rs2Valid = q5Selected_0 & stgData_0_rs2Valid | q5Selected_1 & stgData_1_rs2Valid |
    q5Selected_2 & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_rdValid = 1'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_snptId_valid = q5Selected_0 & stgData_0_snptId_valid | q5Selected_1 & stgData_1_snptId_valid
     | q5Selected_2 & stgData_2_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_snptId_bits = _io_q5IQEnq_0_bits_T_68 | _io_q5IQEnq_0_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_robIdx_value = _io_q5IQEnq_0_bits_T_53 | _io_q5IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_robIdx_flag = q5Selected_0 & stgData_0_robIdx_flag | q5Selected_1 & stgData_1_robIdx_flag |
    q5Selected_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_robIdxFull_value = _io_q5IQEnq_0_bits_T_53 | _io_q5IQEnq_0_bits_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_robIdxFull_flag = q5Selected_0 & stgData_0_robIdx_flag | q5Selected_1 & stgData_1_robIdx_flag
     | q5Selected_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_lqIdx_value = 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_lqIdx_flag = 1'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_sqIdx_value = _io_q5IQEnq_0_bits_T_33 | _io_q5IQEnq_0_bits_T_32; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_sqIdx_flag = q5Selected_0 & sqHeadPtr_flag | q5Selected_1 & sqHeadPtr_flag | q5Selected_2 &
    sqHeadPtr_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_issueQueue = _io_q5IQEnq_0_bits_T_23 | _laneTargetQ_2_T; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_prs1Busy = 1'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_prs2Busy = q5Selected_0 & q1Uops_u_u_prs2Busy | q5Selected_1 & q1Uops_u_u_1_prs2Busy |
    q5Selected_2 & q1Uops_u_u_2_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_isSta = 1'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_q5IQEnq_0_bits_isStd = q5Selected_0 | q5Selected_1 | q5Selected_2; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_req_valid = dispatchFire & |_memDispatchedThisCycle_T & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 271:70]
  assign io_lsEnq_req_bits_robIdx_value = _selectedMemInst_T_8 | _selectedMemInst_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_req_bits_robIdx_flag = _q4Cand_T_1 & stgData_0_robIdx_flag | q4Selected_1 & stgData_1_robIdx_flag |
    q4Selected_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_req_bits_isLoad = _q4Cand_T_1 & stgData_0_ctrl_memRead | q4Selected_1 & stgData_1_ctrl_memRead |
    q4Selected_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_req_bits_isStore = _q4Cand_T_1 & stgData_0_ctrl_memWrite | q4Selected_1 & stgData_1_ctrl_memWrite |
    q4Selected_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_req_bits_sqIdx_value = sqHeadPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 282:29]
  assign io_lsEnq_req_bits_sqIdx_flag = sqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 282:29]
  assign io_lsEnq_req_bits_lqIdx_value = lqHeadPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 281:29]
  assign io_lsEnq_req_bits_lqIdx_flag = lqHeadPtr_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 281:29]
  assign io_lsEnq_toLsqData_pc = _selectedMemInst_T_293 | _selectedMemInst_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_inst = _selectedMemInst_T_288 | _selectedMemInst_T_287; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_fuType = _selectedMemInst_T_283 | _selectedMemInst_T_282; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_aluOp = _selectedMemInst_T_278 | _selectedMemInst_T_277; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_bruOp = _selectedMemInst_T_273 | _selectedMemInst_T_272; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_lsuOp = _selectedMemInst_T_268 | _selectedMemInst_T_267; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_csrOp = _selectedMemInst_T_263 | _selectedMemInst_T_262; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_mulOp = _selectedMemInst_T_258 | _selectedMemInst_T_257; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_divOp = _selectedMemInst_T_253 | _selectedMemInst_T_252; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_src1Type = _selectedMemInst_T_248 | _selectedMemInst_T_247; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_src2Type = _selectedMemInst_T_243 | _selectedMemInst_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_immType = _selectedMemInst_T_238 | _selectedMemInst_T_237; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_rfWen = _q4Cand_T_1 & stgData_0_ctrl_rfWen | q4Selected_1 & stgData_1_ctrl_rfWen |
    q4Selected_2 & stgData_2_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_memRead = _q4Cand_T_1 & stgData_0_ctrl_memRead | q4Selected_1 & stgData_1_ctrl_memRead
     | q4Selected_2 & stgData_2_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_memWrite = _q4Cand_T_1 & stgData_0_ctrl_memWrite | q4Selected_1 &
    stgData_1_ctrl_memWrite | q4Selected_2 & stgData_2_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_csrWen = _q4Cand_T_1 & stgData_0_ctrl_csrWen | q4Selected_1 & stgData_1_ctrl_csrWen |
    q4Selected_2 & stgData_2_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_isBranch = _q4Cand_T_1 & stgData_0_ctrl_isBranch | q4Selected_1 &
    stgData_1_ctrl_isBranch | q4Selected_2 & stgData_2_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_isJump = _q4Cand_T_1 & stgData_0_ctrl_isJump | q4Selected_1 & stgData_1_ctrl_isJump |
    q4Selected_2 & stgData_2_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ctrl_isPriv = _q4Cand_T_1 & stgData_0_ctrl_isPriv | q4Selected_1 & stgData_1_ctrl_isPriv |
    q4Selected_2 & stgData_2_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_excp_excpVec = _selectedMemInst_T_198 | _selectedMemInst_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_imm = _selectedMemInst_T_193 | _selectedMemInst_T_192; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_csrAddress = _selectedMemInst_T_188 | _selectedMemInst_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdInfo_valid = _q4Cand_T_1 & stgData_0_pdInfo_valid | q4Selected_1 & stgData_1_pdInfo_valid
     | q4Selected_2 & stgData_2_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdInfo_isBr = _q4Cand_T_1 & stgData_0_pdInfo_isBr | q4Selected_1 & stgData_1_pdInfo_isBr |
    q4Selected_2 & stgData_2_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdInfo_isJal = _q4Cand_T_1 & stgData_0_pdInfo_isJal | q4Selected_1 & stgData_1_pdInfo_isJal
     | q4Selected_2 & stgData_2_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdInfo_isJalr = _q4Cand_T_1 & stgData_0_pdInfo_isJalr | q4Selected_1 &
    stgData_1_pdInfo_isJalr | q4Selected_2 & stgData_2_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdInfo_isCall = _q4Cand_T_1 & stgData_0_pdInfo_isCall | q4Selected_1 &
    stgData_1_pdInfo_isCall | q4Selected_2 & stgData_2_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdInfo_isRet = _q4Cand_T_1 & stgData_0_pdInfo_isRet | q4Selected_1 & stgData_1_pdInfo_isRet
     | q4Selected_2 & stgData_2_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdInfo_jumpTarget = _selectedMemInst_T_153 | _selectedMemInst_T_152; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_pc = _selectedMemInst_T_148 | _selectedMemInst_T_147; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_fallThrough = _selectedMemInst_T_143 | _selectedMemInst_T_142; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_taken = _q4Cand_T_1 & stgData_0_bpuInfo_taken | q4Selected_1 &
    stgData_1_bpuInfo_taken | q4Selected_2 & stgData_2_bpuInfo_taken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_target = _selectedMemInst_T_133 | _selectedMemInst_T_132; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_takenOffset = _selectedMemInst_T_128 | _selectedMemInst_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_valid = _q4Cand_T_1 & stgData_0_bpuInfo_meta_valid | q4Selected_1 &
    stgData_1_bpuInfo_meta_valid | q4Selected_2 & stgData_2_bpuInfo_meta_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbHit = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbHit | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbHit | q4Selected_2 & stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsJalr | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsJalr | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsJal | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsJal | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsCall | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsCall | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet = _q4Cand_T_1 & stgData_0_bpuInfo_meta_btbIsRet | q4Selected_1 &
    stgData_1_bpuInfo_meta_btbIsRet | q4Selected_2 & stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbOffset = _selectedMemInst_T_93 | _selectedMemInst_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_phtCounter = _selectedMemInst_T_88 | _selectedMemInst_T_87; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_rasTop = _selectedMemInst_T_83 | _selectedMemInst_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_predTaken = _q4Cand_T_1 & stgData_0_bpuInfo_meta_predTaken | q4Selected_1 &
    stgData_1_bpuInfo_meta_predTaken | q4Selected_2 & stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_bpuInfo_meta_predTarget = _selectedMemInst_T_73 | _selectedMemInst_T_72; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_ldst = _selectedMemInst_T_68 | _selectedMemInst_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_lrs1 = _selectedMemInst_T_63 | _selectedMemInst_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_lrs2 = _selectedMemInst_T_58 | _selectedMemInst_T_57; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_pdst = _selectedMemInst_T_53 | _selectedMemInst_T_52; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_prs1 = _selectedMemInst_T_48 | _selectedMemInst_T_47; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_prs2 = _selectedMemInst_T_43 | _selectedMemInst_T_42; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_oldPdst = _selectedMemInst_T_38 | _selectedMemInst_T_37; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_snptId_valid = _q4Cand_T_1 & stgData_0_snptId_valid | q4Selected_1 & stgData_1_snptId_valid
     | q4Selected_2 & stgData_2_snptId_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_snptId_bits = _selectedMemInst_T_28 | _selectedMemInst_T_27; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_rs1Valid = _q4Cand_T_1 & stgData_0_rs1Valid | q4Selected_1 & stgData_1_rs1Valid |
    q4Selected_2 & stgData_2_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_rs2Valid = _q4Cand_T_1 & stgData_0_rs2Valid | q4Selected_1 & stgData_1_rs2Valid |
    q4Selected_2 & stgData_2_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_rdValid = _q4Cand_T_1 & stgData_0_rdValid | q4Selected_1 & stgData_1_rdValid | q4Selected_2
     & stgData_2_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_robIdx_value = _selectedMemInst_T_8 | _selectedMemInst_T_7; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_lsEnq_toLsqData_robIdx_flag = _q4Cand_T_1 & stgData_0_robIdx_flag | q4Selected_1 & stgData_1_robIdx_flag |
    q4Selected_2 & stgData_2_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_robEnq_valid_0 = _allocValids_0_T & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 477:55]
  assign io_robEnq_valid_1 = _allocValids_1_T & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 477:55]
  assign io_robEnq_valid_2 = _allocValids_2_T & _dispatchFire_T_4; // @[src/main/scala/backend/dispatch/DispatchStage.scala 477:55]
  assign io_robEnq_valids_0 = laneValid_0 & ~robWritten_0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:72]
  assign io_robEnq_valids_1 = laneValid_1 & ~robWritten_1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:72]
  assign io_robEnq_valids_2 = laneValid_2 & ~robWritten_2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 66:72]
  assign io_robEnq_bits_0_pc = stgData_0_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 479:32]
  assign io_robEnq_bits_0_inst = stgData_0_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 480:32]
  assign io_robEnq_bits_0_fuType = stgData_0_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 481:32]
  assign io_robEnq_bits_0_pdst = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 482:32]
  assign io_robEnq_bits_0_oldPdst = stgData_0_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 483:32]
  assign io_robEnq_bits_0_ldst = stgData_0_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 484:32]
  assign io_robEnq_bits_0_rfWen = stgData_0_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 485:32]
  assign io_robEnq_bits_0_memRead = stgData_0_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 487:32]
  assign io_robEnq_bits_0_memWrite = stgData_0_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 488:32]
  assign io_robEnq_bits_0_csrWen = stgData_0_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 493:32]
  assign io_robEnq_bits_0_csrOp = stgData_0_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 494:32]
  assign io_robEnq_bits_0_csrWaddr = stgData_0_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 495:32]
  assign io_robEnq_bits_0_isPriv = stgData_0_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 498:32]
  assign io_robEnq_bits_0_excp_excpVec = stgData_0_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 499:29]
  assign io_robEnq_bits_1_pc = stgData_1_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 479:32]
  assign io_robEnq_bits_1_inst = stgData_1_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 480:32]
  assign io_robEnq_bits_1_fuType = stgData_1_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 481:32]
  assign io_robEnq_bits_1_pdst = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 482:32]
  assign io_robEnq_bits_1_oldPdst = stgData_1_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 483:32]
  assign io_robEnq_bits_1_ldst = stgData_1_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 484:32]
  assign io_robEnq_bits_1_rfWen = stgData_1_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 485:32]
  assign io_robEnq_bits_1_memRead = stgData_1_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 487:32]
  assign io_robEnq_bits_1_memWrite = stgData_1_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 488:32]
  assign io_robEnq_bits_1_csrWen = stgData_1_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 493:32]
  assign io_robEnq_bits_1_csrOp = stgData_1_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 494:32]
  assign io_robEnq_bits_1_csrWaddr = stgData_1_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 495:32]
  assign io_robEnq_bits_1_isPriv = stgData_1_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 498:32]
  assign io_robEnq_bits_1_excp_excpVec = stgData_1_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 499:29]
  assign io_robEnq_bits_2_pc = stgData_2_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 479:32]
  assign io_robEnq_bits_2_inst = stgData_2_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 480:32]
  assign io_robEnq_bits_2_fuType = stgData_2_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 481:32]
  assign io_robEnq_bits_2_pdst = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 482:32]
  assign io_robEnq_bits_2_oldPdst = stgData_2_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 483:32]
  assign io_robEnq_bits_2_ldst = stgData_2_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 484:32]
  assign io_robEnq_bits_2_rfWen = stgData_2_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 485:32]
  assign io_robEnq_bits_2_memRead = stgData_2_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 487:32]
  assign io_robEnq_bits_2_memWrite = stgData_2_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 488:32]
  assign io_robEnq_bits_2_csrWen = stgData_2_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 493:32]
  assign io_robEnq_bits_2_csrOp = stgData_2_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 494:32]
  assign io_robEnq_bits_2_csrWaddr = stgData_2_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 495:32]
  assign io_robEnq_bits_2_isPriv = stgData_2_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 498:32]
  assign io_robEnq_bits_2_excp_excpVec = stgData_2_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 499:29]
  assign busyTable_clock = clock;
  assign busyTable_reset = reset;
  assign busyTable_io_readReq_0 = stgData_0_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:37]
  assign busyTable_io_readReq_1 = stgData_0_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 305:37]
  assign busyTable_io_readReq_2 = stgData_1_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:37]
  assign busyTable_io_readReq_3 = stgData_1_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 305:37]
  assign busyTable_io_readReq_4 = stgData_2_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 304:37]
  assign busyTable_io_readReq_5 = stgData_2_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 305:37]
  assign busyTable_io_allocReq_0_valid = dispatchFire & needRob_0 & stgData_0_rdValid & stgData_0_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:72]
  assign busyTable_io_allocReq_0_bits = stgData_0_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 312:36]
  assign busyTable_io_allocReq_1_valid = dispatchFire & needRob_1 & stgData_1_rdValid & stgData_1_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:72]
  assign busyTable_io_allocReq_1_bits = stgData_1_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 312:36]
  assign busyTable_io_allocReq_2_valid = dispatchFire & needRob_2 & stgData_2_rdValid & stgData_2_ldst != 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 310:72]
  assign busyTable_io_allocReq_2_bits = stgData_2_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 312:36]
  assign busyTable_io_wbReq_0_valid = io_wakeupPorts_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 317:33]
  assign busyTable_io_wbReq_0_bits = io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 318:33]
  assign busyTable_io_wbReq_1_valid = io_wakeupPorts_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 317:33]
  assign busyTable_io_wbReq_1_bits = io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 318:33]
  assign busyTable_io_wbReq_2_valid = io_wakeupPorts_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 317:33]
  assign busyTable_io_wbReq_2_bits = io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 318:33]
  assign busyTable_io_wbReq_3_valid = io_wakeupPorts_3_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 317:33]
  assign busyTable_io_wbReq_3_bits = io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 318:33]
  assign busyTable_io_wbReq_4_valid = io_wakeupPorts_4_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 317:33]
  assign busyTable_io_wbReq_4_bits = io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 318:33]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_0) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        laneValid_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 245:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 252:21]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_1) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        laneValid_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 245:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 252:21]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 60:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_2) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        laneValid_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 245:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 252:21]
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
      robWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_0) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        robWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 246:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      robWritten_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 253:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 257:28]
      robWritten_0 <= _GEN_9;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
      robWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_1) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        robWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 246:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      robWritten_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 253:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 257:28]
      robWritten_1 <= _GEN_11;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
      robWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 61:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_2) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        robWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 246:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      robWritten_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 253:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 257:28]
      robWritten_2 <= _GEN_13;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_0) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 247:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      iqSent_0 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 254:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 257:28]
      iqSent_0 <= _GEN_10;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_1) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 247:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      iqSent_1 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 254:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 257:28]
      iqSent_1 <= _GEN_12;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 62:28]
    end else if (|_T_9) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (doFlush_2) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 244:23]
        iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 247:23]
      end
    end else if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
      iqSent_2 <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 254:21]
    end else if (dispatchFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 257:28]
      iqSent_2 <= _GEN_14;
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pc <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_inst <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_inst <= io_in_0_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_fuType <= io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_aluOp <= io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_bruOp <= io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_lsuOp <= io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_csrOp <= io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_mulOp <= io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_divOp <= io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_src1Type <= io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_src2Type <= io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_immType <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_immType <= io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_rfWen <= io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_memRead <= io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_memWrite <= io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_csrWen <= io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_isBranch <= io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_isJump <= io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ctrl_isPriv <= io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_excp_excpVec <= 17'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_excp_excpVec <= io_in_0_bits_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_imm <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_imm <= io_in_0_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_csrAddress <= 14'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_csrAddress <= io_in_0_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_pc <= io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_fallThrough <= io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_taken <= io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_target <= io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_takenOffset <= io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_valid <= io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_btbHit <= io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_btbIsJalr <= io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_btbIsJal <= io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_btbIsCall <= io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_btbIsRet <= io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_btbOffset <= io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_phtCounter <= io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_rasTop <= io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_predTaken <= io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_bpuInfo_meta_predTarget <= io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_ldst <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_ldst <= io_in_0_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_lrs1 <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_lrs1 <= io_in_0_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_lrs2 <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_lrs2 <= io_in_0_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_pdst <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_pdst <= io_in_0_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_prs1 <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_prs1 <= io_in_0_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_prs2 <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_prs2 <= io_in_0_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_oldPdst <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_oldPdst <= io_in_0_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_snptId_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_snptId_valid <= io_in_0_bits_snptId_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_snptId_bits <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_snptId_bits <= io_in_0_bits_snptId_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_rs1Valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_rs1Valid <= io_in_0_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_rs2Valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_rs2Valid <= io_in_0_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_rdValid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_rdValid <= io_in_0_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_robIdx_value <= 6'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_robIdx_value <= io_in_0_bits_robIdx_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_0_robIdx_flag <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_0_robIdx_flag <= io_in_0_bits_robIdx_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pc <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_inst <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_inst <= io_in_1_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_fuType <= io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_aluOp <= io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_bruOp <= io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_lsuOp <= io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_csrOp <= io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_mulOp <= io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_divOp <= io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_src1Type <= io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_src2Type <= io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_immType <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_immType <= io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_rfWen <= io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_memRead <= io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_memWrite <= io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_csrWen <= io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_isBranch <= io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_isJump <= io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ctrl_isPriv <= io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_excp_excpVec <= 17'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_excp_excpVec <= io_in_1_bits_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_imm <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_imm <= io_in_1_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_csrAddress <= 14'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_csrAddress <= io_in_1_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_pc <= io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_fallThrough <= io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_taken <= io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_target <= io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_takenOffset <= io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_valid <= io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_btbHit <= io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_btbIsJalr <= io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_btbIsJal <= io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_btbIsCall <= io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_btbIsRet <= io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_btbOffset <= io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_phtCounter <= io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_rasTop <= io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_predTaken <= io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_bpuInfo_meta_predTarget <= io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_ldst <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_ldst <= io_in_1_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_lrs1 <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_lrs1 <= io_in_1_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_lrs2 <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_lrs2 <= io_in_1_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_pdst <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_pdst <= io_in_1_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_prs1 <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_prs1 <= io_in_1_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_prs2 <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_prs2 <= io_in_1_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_oldPdst <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_oldPdst <= io_in_1_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_snptId_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_snptId_valid <= io_in_1_bits_snptId_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_snptId_bits <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_snptId_bits <= io_in_1_bits_snptId_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_rs1Valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_rs1Valid <= io_in_1_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_rs2Valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_rs2Valid <= io_in_1_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_rdValid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_rdValid <= io_in_1_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_robIdx_value <= 6'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_robIdx_value <= io_in_1_bits_robIdx_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_1_robIdx_flag <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_1_robIdx_flag <= io_in_1_bits_robIdx_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pc <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_inst <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_inst <= io_in_2_bits_inst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_fuType <= io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_aluOp <= io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_bruOp <= io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_lsuOp <= io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_csrOp <= io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_mulOp <= io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_divOp <= io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_src1Type <= io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_src2Type <= io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_immType <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_immType <= io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_rfWen <= io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_memRead <= io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_memWrite <= io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_csrWen <= io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_isBranch <= io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_isJump <= io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ctrl_isPriv <= io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_excp_excpVec <= 17'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_excp_excpVec <= io_in_2_bits_excp_excpVec; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_imm <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_imm <= io_in_2_bits_imm; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_csrAddress <= 14'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_csrAddress <= io_in_2_bits_csrAddress; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_pc <= io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_fallThrough <= io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_taken <= io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_target <= io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_takenOffset <= io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_valid <= io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_btbHit <= io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_btbIsJalr <= io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_btbIsJal <= io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_btbIsCall <= io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_btbIsRet <= io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_btbOffset <= io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_phtCounter <= io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_rasTop <= io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_predTaken <= io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_bpuInfo_meta_predTarget <= io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_ldst <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_ldst <= io_in_2_bits_ldst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_lrs1 <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_lrs1 <= io_in_2_bits_lrs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_lrs2 <= 5'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_lrs2 <= io_in_2_bits_lrs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_pdst <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_pdst <= io_in_2_bits_pdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_prs1 <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_prs1 <= io_in_2_bits_prs1; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_prs2 <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_prs2 <= io_in_2_bits_prs2; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_oldPdst <= 7'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_oldPdst <= io_in_2_bits_oldPdst; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_snptId_valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_snptId_valid <= io_in_2_bits_snptId_valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_snptId_bits <= 3'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_snptId_bits <= io_in_2_bits_snptId_bits; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_rs1Valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_rs1Valid <= io_in_2_bits_rs1Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_rs2Valid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_rs2Valid <= io_in_2_bits_rs2Valid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_rdValid <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_rdValid <= io_in_2_bits_rdValid; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_robIdx_value <= 6'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_robIdx_value <= io_in_2_bits_robIdx_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
      stgData_2_robIdx_flag <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 63:24]
    end else if (!(|_T_9)) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 242:28]
      if (inFire) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 250:22]
        stgData_2_robIdx_flag <= io_in_2_bits_robIdx_flag; // @[src/main/scala/backend/dispatch/DispatchStage.scala 255:21]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 267:26]
      lqHeadPtr_value <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 267:26]
    end else if (memDispatchedThisCycle) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 286:32]
      if (selectedIsLoad) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 287:26]
        lqHeadPtr_value <= lqHeadPtr_newPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 288:17]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 267:26]
      lqHeadPtr_flag <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 267:26]
    end else if (memDispatchedThisCycle) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 286:32]
      if (selectedIsLoad) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 287:26]
        if (lqHeadPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
          lqHeadPtr_flag <= ~lqHeadPtr_flag;
        end
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 268:26]
      sqHeadPtr_value <= 4'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 268:26]
    end else if (memDispatchedThisCycle) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 286:32]
      if (selectedIsStore) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 290:27]
        sqHeadPtr_value <= sqHeadPtr_newPtr_value; // @[src/main/scala/backend/dispatch/DispatchStage.scala 291:17]
      end
    end
    if (reset) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 268:26]
      sqHeadPtr_flag <= 1'h0; // @[src/main/scala/backend/dispatch/DispatchStage.scala 268:26]
    end else if (memDispatchedThisCycle) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 286:32]
      if (selectedIsStore) begin // @[src/main/scala/backend/dispatch/DispatchStage.scala 290:27]
        if (sqHeadPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
          sqHeadPtr_flag <= ~sqHeadPtr_flag;
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
  laneValid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  laneValid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  laneValid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  robWritten_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  robWritten_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  robWritten_2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  iqSent_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  iqSent_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  iqSent_2 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_inst = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_ctrl_fuType = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_ctrl_aluOp = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_ctrl_bruOp = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_ctrl_lsuOp = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_ctrl_csrOp = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_ctrl_mulOp = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_ctrl_divOp = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_ctrl_src1Type = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_ctrl_src2Type = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_ctrl_immType = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_ctrl_rfWen = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_ctrl_memRead = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_ctrl_memWrite = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_ctrl_csrWen = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_ctrl_isBranch = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_ctrl_isJump = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_ctrl_isPriv = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_excp_excpVec = _RAND_28[16:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_imm = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_csrAddress = _RAND_30[13:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_pdInfo_valid = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_pdInfo_isBr = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_0_pdInfo_isJal = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_0_pdInfo_isJalr = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_0_pdInfo_isCall = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_0_pdInfo_isRet = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_0_pdInfo_jumpTarget = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_0_bpuInfo_pc = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_0_bpuInfo_fallThrough = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_0_bpuInfo_taken = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_0_bpuInfo_target = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_0_bpuInfo_takenOffset = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_valid = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbHit = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsJalr = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsJal = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsCall = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsRet = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbOffset = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_phtCounter = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_rasTop = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_predTaken = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_predTarget = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_0_ldst = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_0_lrs1 = _RAND_55[4:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_0_lrs2 = _RAND_56[4:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_0_pdst = _RAND_57[6:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_0_prs1 = _RAND_58[6:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_0_prs2 = _RAND_59[6:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_0_oldPdst = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_0_snptId_valid = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_0_snptId_bits = _RAND_62[2:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_0_rs1Valid = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_0_rs2Valid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_0_rdValid = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_0_robIdx_value = _RAND_66[5:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_0_robIdx_flag = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_1_pc = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_1_inst = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_1_ctrl_fuType = _RAND_70[3:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_1_ctrl_aluOp = _RAND_71[4:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_1_ctrl_bruOp = _RAND_72[3:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_1_ctrl_lsuOp = _RAND_73[3:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_1_ctrl_csrOp = _RAND_74[2:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_1_ctrl_mulOp = _RAND_75[2:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_1_ctrl_divOp = _RAND_76[2:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_1_ctrl_src1Type = _RAND_77[2:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_1_ctrl_src2Type = _RAND_78[2:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_1_ctrl_immType = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_1_ctrl_rfWen = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_1_ctrl_memRead = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_1_ctrl_memWrite = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_1_ctrl_csrWen = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_1_ctrl_isBranch = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_1_ctrl_isJump = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_1_ctrl_isPriv = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_1_excp_excpVec = _RAND_87[16:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_1_imm = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_1_csrAddress = _RAND_89[13:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  stgData_1_bpuInfo_pc = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  stgData_1_bpuInfo_fallThrough = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  stgData_1_bpuInfo_taken = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  stgData_1_bpuInfo_target = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  stgData_1_bpuInfo_takenOffset = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_valid = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbHit = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsJalr = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsJal = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsCall = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsRet = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbOffset = _RAND_108[1:0];
  _RAND_109 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_phtCounter = _RAND_109[1:0];
  _RAND_110 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_rasTop = _RAND_110[2:0];
  _RAND_111 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_predTaken = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_predTarget = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  stgData_1_ldst = _RAND_113[4:0];
  _RAND_114 = {1{`RANDOM}};
  stgData_1_lrs1 = _RAND_114[4:0];
  _RAND_115 = {1{`RANDOM}};
  stgData_1_lrs2 = _RAND_115[4:0];
  _RAND_116 = {1{`RANDOM}};
  stgData_1_pdst = _RAND_116[6:0];
  _RAND_117 = {1{`RANDOM}};
  stgData_1_prs1 = _RAND_117[6:0];
  _RAND_118 = {1{`RANDOM}};
  stgData_1_prs2 = _RAND_118[6:0];
  _RAND_119 = {1{`RANDOM}};
  stgData_1_oldPdst = _RAND_119[6:0];
  _RAND_120 = {1{`RANDOM}};
  stgData_1_snptId_valid = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  stgData_1_snptId_bits = _RAND_121[2:0];
  _RAND_122 = {1{`RANDOM}};
  stgData_1_rs1Valid = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  stgData_1_rs2Valid = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  stgData_1_rdValid = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  stgData_1_robIdx_value = _RAND_125[5:0];
  _RAND_126 = {1{`RANDOM}};
  stgData_1_robIdx_flag = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  stgData_2_pc = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  stgData_2_inst = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  stgData_2_ctrl_fuType = _RAND_129[3:0];
  _RAND_130 = {1{`RANDOM}};
  stgData_2_ctrl_aluOp = _RAND_130[4:0];
  _RAND_131 = {1{`RANDOM}};
  stgData_2_ctrl_bruOp = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  stgData_2_ctrl_lsuOp = _RAND_132[3:0];
  _RAND_133 = {1{`RANDOM}};
  stgData_2_ctrl_csrOp = _RAND_133[2:0];
  _RAND_134 = {1{`RANDOM}};
  stgData_2_ctrl_mulOp = _RAND_134[2:0];
  _RAND_135 = {1{`RANDOM}};
  stgData_2_ctrl_divOp = _RAND_135[2:0];
  _RAND_136 = {1{`RANDOM}};
  stgData_2_ctrl_src1Type = _RAND_136[2:0];
  _RAND_137 = {1{`RANDOM}};
  stgData_2_ctrl_src2Type = _RAND_137[2:0];
  _RAND_138 = {1{`RANDOM}};
  stgData_2_ctrl_immType = _RAND_138[3:0];
  _RAND_139 = {1{`RANDOM}};
  stgData_2_ctrl_rfWen = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  stgData_2_ctrl_memRead = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  stgData_2_ctrl_memWrite = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  stgData_2_ctrl_csrWen = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  stgData_2_ctrl_isBranch = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  stgData_2_ctrl_isJump = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  stgData_2_ctrl_isPriv = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  stgData_2_excp_excpVec = _RAND_146[16:0];
  _RAND_147 = {1{`RANDOM}};
  stgData_2_imm = _RAND_147[31:0];
  _RAND_148 = {1{`RANDOM}};
  stgData_2_csrAddress = _RAND_148[13:0];
  _RAND_149 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  stgData_2_bpuInfo_pc = _RAND_156[31:0];
  _RAND_157 = {1{`RANDOM}};
  stgData_2_bpuInfo_fallThrough = _RAND_157[31:0];
  _RAND_158 = {1{`RANDOM}};
  stgData_2_bpuInfo_taken = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  stgData_2_bpuInfo_target = _RAND_159[31:0];
  _RAND_160 = {1{`RANDOM}};
  stgData_2_bpuInfo_takenOffset = _RAND_160[1:0];
  _RAND_161 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_valid = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbHit = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsJalr = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsJal = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsCall = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsRet = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbOffset = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_phtCounter = _RAND_168[1:0];
  _RAND_169 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_rasTop = _RAND_169[2:0];
  _RAND_170 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_predTaken = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_predTarget = _RAND_171[31:0];
  _RAND_172 = {1{`RANDOM}};
  stgData_2_ldst = _RAND_172[4:0];
  _RAND_173 = {1{`RANDOM}};
  stgData_2_lrs1 = _RAND_173[4:0];
  _RAND_174 = {1{`RANDOM}};
  stgData_2_lrs2 = _RAND_174[4:0];
  _RAND_175 = {1{`RANDOM}};
  stgData_2_pdst = _RAND_175[6:0];
  _RAND_176 = {1{`RANDOM}};
  stgData_2_prs1 = _RAND_176[6:0];
  _RAND_177 = {1{`RANDOM}};
  stgData_2_prs2 = _RAND_177[6:0];
  _RAND_178 = {1{`RANDOM}};
  stgData_2_oldPdst = _RAND_178[6:0];
  _RAND_179 = {1{`RANDOM}};
  stgData_2_snptId_valid = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  stgData_2_snptId_bits = _RAND_180[2:0];
  _RAND_181 = {1{`RANDOM}};
  stgData_2_rs1Valid = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  stgData_2_rs2Valid = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  stgData_2_rdValid = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  stgData_2_robIdx_value = _RAND_184[5:0];
  _RAND_185 = {1{`RANDOM}};
  stgData_2_robIdx_flag = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  lqHeadPtr_value = _RAND_186[3:0];
  _RAND_187 = {1{`RANDOM}};
  lqHeadPtr_flag = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  sqHeadPtr_value = _RAND_188[3:0];
  _RAND_189 = {1{`RANDOM}};
  sqHeadPtr_flag = _RAND_189[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
