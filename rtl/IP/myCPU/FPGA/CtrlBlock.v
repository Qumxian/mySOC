module CtrlBlock(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_0_bits_instr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_0_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_0_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [2:0]  io_in_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_exception_excpTlbRefill, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_exception_excpTlbPif, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_exception_excpTlbPpi, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_0_bits_exception_excpAdef, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_in_1_ready, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_1_bits_instr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_1_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_1_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [2:0]  io_in_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_exception_excpTlbRefill, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_exception_excpTlbPif, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_exception_excpTlbPpi, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_1_bits_exception_excpAdef, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_in_2_ready, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_2_bits_instr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_2_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_2_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [2:0]  io_in_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_in_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_exception_excpTlbRefill, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_exception_excpTlbPif, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_exception_excpTlbPpi, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_in_2_bits_exception_excpAdef, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q1IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q1IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q1IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [16:0] io_q1IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [13:0] io_q1IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q1IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q1IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q1IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q1IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q1IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q1IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q1IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q1IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q1IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q1IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q1IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q1IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q1IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q2IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q2IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [16:0] io_q2IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [13:0] io_q2IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q2IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q2IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q2IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q2IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q2IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q2IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q2IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q2IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q2IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q2IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q2IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q2IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q3IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q3IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [16:0] io_q3IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [13:0] io_q3IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q3IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q3IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q3IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q3IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q3IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q3IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q3IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q3IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q3IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q3IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q3IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q3IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q4IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q4IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [16:0] io_q4IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [13:0] io_q4IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q4IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q4IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q4IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q4IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q4IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q4IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q4IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q4IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q4IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q4IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q4IQEnq_0_bits_lqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_lqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q4IQEnq_0_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q4IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_isSta, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q4IQEnq_0_bits_isStd, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_inst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q5IQEnq_0_bits_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q5IQEnq_0_bits_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [16:0] io_q5IQEnq_0_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_imm, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [13:0] io_q5IQEnq_0_bits_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q5IQEnq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_q5IQEnq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q5IQEnq_0_bits_ldst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q5IQEnq_0_bits_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_q5IQEnq_0_bits_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q5IQEnq_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q5IQEnq_0_bits_prs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q5IQEnq_0_bits_prs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_q5IQEnq_0_bits_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_snptId_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_snptId_bits, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q5IQEnq_0_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_q5IQEnq_0_bits_robIdxFull_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_robIdxFull_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q5IQEnq_0_bits_lqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_lqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_q5IQEnq_0_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_q5IQEnq_0_bits_issueQueue, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_prs1Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_prs2Busy, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_isSta, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_q5IQEnq_0_bits_isStd, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [4:0]  io_iqFeedback_q1FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [3:0]  io_iqFeedback_q2FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [4:0]  io_iqFeedback_q3FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [4:0]  io_iqFeedback_q4FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [3:0]  io_iqFeedback_q5FreeEntries, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_req_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_lsEnq_req_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_req_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_req_bits_isLoad, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_req_bits_isStore, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_lsEnq_req_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_req_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_lsEnq_req_bits_lqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_req_bits_lqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_inst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_fuType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_lsEnq_toLsqData_ctrl_aluOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_bruOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_lsuOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_csrOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_mulOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_divOp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_src1Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_src2Type, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_immType, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_ctrl_rfWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_ctrl_memRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_ctrl_memWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_ctrl_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_ctrl_isBranch, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_ctrl_isJump, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_ctrl_isPriv, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [16:0] io_lsEnq_toLsqData_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_imm, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [13:0] io_lsEnq_toLsqData_csrAddress, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_pdInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_pdInfo_isBr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_pdInfo_isJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_pdInfo_isJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_pdInfo_isCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_pdInfo_isRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_pdInfo_jumpTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_pc, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_fallThrough, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_taken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_takenOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbHit, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_lsEnq_toLsqData_bpuInfo_meta_rasTop, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_predTaken, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_meta_predTarget, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_lsEnq_toLsqData_ldst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_lsEnq_toLsqData_lrs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [4:0]  io_lsEnq_toLsqData_lrs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_lsEnq_toLsqData_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_lsEnq_toLsqData_prs1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_lsEnq_toLsqData_prs2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [6:0]  io_lsEnq_toLsqData_oldPdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_snptId_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_lsEnq_toLsqData_snptId_bits, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_rs1Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_rs2Valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_rdValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_lsEnq_toLsqData_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_lsEnq_toLsqData_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_lsEnq_lqFull, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_lsEnq_sqFull, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [5:0]  io_writeback_0_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [3:0]  io_writeback_0_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_0_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_0_bits_isMemWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_0_bits_isMemRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_0_bits_memValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_0_bits_memVaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_0_bits_memPaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_0_bits_memStoreData, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_0_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_0_bits_csrWdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [63:0] io_writeback_0_bits_csrTimer, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [16:0] io_writeback_0_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_1_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [5:0]  io_writeback_1_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [3:0]  io_writeback_1_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_1_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_1_bits_isMemWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_1_bits_isMemRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_1_bits_memValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_1_bits_memVaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_1_bits_memPaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_1_bits_memStoreData, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_1_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_1_bits_csrWdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [63:0] io_writeback_1_bits_csrTimer, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [16:0] io_writeback_1_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_2_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [5:0]  io_writeback_2_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [3:0]  io_writeback_2_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_2_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_2_bits_isMemWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_2_bits_isMemRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_2_bits_memValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_2_bits_memVaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_2_bits_memPaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_2_bits_memStoreData, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_2_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_2_bits_csrWdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [63:0] io_writeback_2_bits_csrTimer, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [16:0] io_writeback_2_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_3_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [5:0]  io_writeback_3_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [3:0]  io_writeback_3_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_3_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_3_bits_isMemWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_3_bits_isMemRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_3_bits_memValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_3_bits_memVaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_3_bits_memPaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_3_bits_memStoreData, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_3_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_3_bits_csrWdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [63:0] io_writeback_3_bits_csrTimer, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [16:0] io_writeback_3_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_4_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [5:0]  io_writeback_4_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [3:0]  io_writeback_4_bits_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_4_bits_sqIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_4_bits_isMemWrite, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_4_bits_isMemRead, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_writeback_4_bits_memValid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_4_bits_memVaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_4_bits_memPaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_4_bits_memStoreData, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_4_bits_rfdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_writeback_4_bits_csrWdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [63:0] io_writeback_4_bits_csrTimer, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [16:0] io_writeback_4_bits_excp_excpVec, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_commitToSq_valid_0, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_commitToSq_valid_1, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_commitToSq_valid_2, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_commitToSq_bits_0_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_commitToSq_bits_1_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [3:0]  io_commitToSq_bits_2_sqIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_commitToCsr_csrWen, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [13:0] io_commitToCsr_csrWaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_commitToCsr_csrWdata, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_bruInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_bruInfo_bits_doRedirect, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [2:0]  io_bruInfo_bits_snptId, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [5:0]  io_bruInfo_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_bruInfo_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_bruInfo_bits_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_redirectInfo_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_redirectInfo_bits_flushSelf, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_redirectInfo_bits_fromBru, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [2:0]  io_redirectInfo_bits_snptId, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_redirectInfo_bits_robIdx_flag, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_redirectInfo_bits_fromRob, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_redirectInfo_bits_target, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_excpEvent_excp, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_excpEvent_ertn, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output        io_excpInfo_vaddrError, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_excpInfo_era, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [5:0]  io_excpInfo_ecode, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  output [31:0] io_excpInfo_badVaddr, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_redirectAddrFromCsr_eentry, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [31:0] io_redirectAddrFromCsr_era, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_extInt, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_wakeupPorts_0_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [6:0]  io_wakeupPorts_0_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_wakeupPorts_1_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [6:0]  io_wakeupPorts_1_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_wakeupPorts_2_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [6:0]  io_wakeupPorts_2_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_wakeupPorts_3_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [6:0]  io_wakeupPorts_3_bits_pdst, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input         io_wakeupPorts_4_valid, // @[src/main/scala/backend/CtrlBlock.scala 67:14]
  input  [6:0]  io_wakeupPorts_4_bits_pdst // @[src/main/scala/backend/CtrlBlock.scala 67:14]
);
  wire  decodeStage_clock; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_reset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_0_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_1_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_2_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_0_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_0_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_0_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_0_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_0_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [13:0] decodeStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [16:0] decodeStage_io_out_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_1_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_1_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_1_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_1_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_1_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [13:0] decodeStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [16:0] decodeStage_io_out_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_2_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_2_bits_rj; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_2_bits_rk; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_2_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_2_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [13:0] decodeStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [3:0] decodeStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [16:0] decodeStage_io_out_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [1:0] decodeStage_io_out_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [2:0] decodeStage_io_out_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_out_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [31:0] decodeStage_io_out_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_ratRead_0_rs1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_ratRead_0_rs2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_ratRead_0_hold1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_ratRead_0_hold2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_ratRead_1_rs1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_ratRead_1_rs2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_ratRead_1_hold1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_ratRead_1_hold2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_ratRead_2_rs1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire [4:0] decodeStage_io_ratRead_2_rs2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_ratRead_2_hold1; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_ratRead_2_hold2; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_extInt; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  decodeStage_io_flush; // @[src/main/scala/backend/CtrlBlock.scala 76:27]
  wire  renameStage_clock; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_reset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_0_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_0_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_0_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [13:0] renameStage_io_in_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [16:0] renameStage_io_in_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_1_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_1_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_1_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [13:0] renameStage_io_in_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [16:0] renameStage_io_in_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_2_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_2_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_2_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [13:0] renameStage_io_in_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [16:0] renameStage_io_in_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_ratRead_0_rs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_ratRead_0_rs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_ratRead_0_hold1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_ratRead_0_hold2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_ratRead_1_rs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_ratRead_1_rs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_ratRead_1_hold1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_ratRead_1_hold2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_ratRead_2_rs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_ratRead_2_rs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_ratRead_2_hold1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_ratRead_2_hold2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [16:0] renameStage_io_out_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [13:0] renameStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [5:0] renameStage_io_out_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [16:0] renameStage_io_out_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [13:0] renameStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_1_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_1_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_1_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_1_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_1_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_1_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_1_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [5:0] renameStage_io_out_1_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_1_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [3:0] renameStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [16:0] renameStage_io_out_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [13:0] renameStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [1:0] renameStage_io_out_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [31:0] renameStage_io_out_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_2_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_2_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_out_2_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_2_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_2_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_out_2_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_out_2_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [5:0] renameStage_io_out_2_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_out_2_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_0_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_archCommit_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_archCommit_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_1_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_archCommit_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_archCommit_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_2_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [4:0] renameStage_io_archCommit_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [6:0] renameStage_io_archCommit_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_archCommit_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [2:0] renameStage_io_redirectInfo_bits_snptId; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire [5:0] renameStage_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_redirectInfo_bits_fromRob; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  renameStage_io_stall; // @[src/main/scala/backend/CtrlBlock.scala 77:27]
  wire  redirectController_clock; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_reset; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_bruRedirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_bruRedirect_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [2:0] redirectController_io_bruRedirect_bits_snptId; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [5:0] redirectController_io_bruRedirect_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_bruRedirect_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_bruRedirect_bits_target; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_robRedirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [5:0] redirectController_io_robRedirect_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_robRedirect_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_robRedirect_isException; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [16:0] redirectController_io_robRedirect_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_robRedirect_pc; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_robRedirect_excpVaddr; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_robRollbackDone; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_redirectInfo_bits_flushSelf; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [2:0] redirectController_io_redirectInfo_bits_snptId; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [5:0] redirectController_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_redirectInfo_bits_fromRob; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_redirectInfo_bits_target; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_robRedirectPause; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_robNeedRollback; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_excpEvent_excp; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_excpEvent_ertn; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  redirectController_io_excpInfo_vaddrError; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_excpInfo_era; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [5:0] redirectController_io_excpInfo_ecode; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_excpInfo_badVaddr; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_redirectAddrFromCsr_eentry; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire [31:0] redirectController_io_redirectAddrFromCsr_era; // @[src/main/scala/backend/CtrlBlock.scala 78:34]
  wire  dispatchStage_clock; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_reset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_in_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_in_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_in_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_in_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_in_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_1_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_1_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_1_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_1_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_1_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_1_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_1_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_in_1_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_1_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_in_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_in_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_2_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_2_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_in_2_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_2_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_2_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_in_2_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_in_2_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_in_2_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_in_2_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_q1IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q1IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q1IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q1IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_q2IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q2IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q2IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_q3IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q3IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q3IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_q4IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q4IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q4IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q4IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q4IQEnq_0_bits_isStd; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_q5IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q5IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q5IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_q5IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q5IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_q5IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_isSta; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_iqFeedback_q1FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_iqFeedback_q2FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_iqFeedback_q3FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_iqFeedback_q4FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_iqFeedback_q5FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_req_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_req_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_req_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_req_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_req_bits_lqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_lsEnq_toLsqData_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_lsEnq_toLsqData_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_lsEnq_toLsqData_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_lsEnq_toLsqData_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_lsEnq_toLsqData_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_lsEnq_toLsqData_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_lsEnq_toLsqData_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_lsEnq_toLsqData_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_lsEnq_toLsqData_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_imm; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_lsEnq_toLsqData_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [1:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_lsEnq_toLsqData_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_lsEnq_toLsqData_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_lsEnq_toLsqData_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_lsEnq_toLsqData_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_lsEnq_toLsqData_prs1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_lsEnq_toLsqData_prs2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_lsEnq_toLsqData_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_lsEnq_toLsqData_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_lsEnq_toLsqData_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_toLsqData_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_lqFull; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_lsEnq_sqFull; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_valids_0; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_valids_1; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_valids_2; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_robEnq_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_robEnq_bits_0_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_robEnq_bits_0_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_robEnq_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_robEnq_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_robEnq_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_0_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_0_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_0_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_robEnq_bits_0_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_robEnq_bits_0_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_0_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_robEnq_bits_0_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_robEnq_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_robEnq_bits_1_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_robEnq_bits_1_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_robEnq_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_robEnq_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_robEnq_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_1_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_1_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_1_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_robEnq_bits_1_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_robEnq_bits_1_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_1_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_robEnq_bits_1_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_robEnq_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [31:0] dispatchStage_io_robEnq_bits_2_inst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [3:0] dispatchStage_io_robEnq_bits_2_fuType; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_robEnq_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_robEnq_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [4:0] dispatchStage_io_robEnq_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_2_memRead; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_2_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_2_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [2:0] dispatchStage_io_robEnq_bits_2_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [13:0] dispatchStage_io_robEnq_bits_2_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_bits_2_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [16:0] dispatchStage_io_robEnq_bits_2_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_canEnq; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_robEnq_full; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_flush; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [5:0] dispatchStage_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_stall; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_wakeupPorts_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_wakeupPorts_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_wakeupPorts_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_wakeupPorts_3_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  dispatchStage_io_wakeupPorts_4_valid; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire [6:0] dispatchStage_io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 79:29]
  wire  rob_clock; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_reset; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_valids_0; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_valids_1; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_valids_2; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_enq_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_enq_bits_0_inst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_enq_bits_0_fuType; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_enq_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_enq_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [4:0] rob_io_enq_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_0_memRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_0_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_0_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [2:0] rob_io_enq_bits_0_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [13:0] rob_io_enq_bits_0_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_0_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_enq_bits_0_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_enq_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_enq_bits_1_inst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_enq_bits_1_fuType; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_enq_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_enq_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [4:0] rob_io_enq_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_1_memRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_1_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_1_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [2:0] rob_io_enq_bits_1_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [13:0] rob_io_enq_bits_1_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_1_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_enq_bits_1_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_enq_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_enq_bits_2_inst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_enq_bits_2_fuType; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_enq_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_enq_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [4:0] rob_io_enq_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_2_memRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_2_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_2_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [2:0] rob_io_enq_bits_2_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [13:0] rob_io_enq_bits_2_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_bits_2_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_enq_bits_2_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_canEnq; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_enq_full; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_commitToSq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_commitToSq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_commitToSq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_commitToSq_bits_0_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_commitToSq_bits_1_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_commitToSq_bits_2_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_commitToCsr_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [13:0] rob_io_commitToCsr_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_commitToCsr_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [5:0] rob_io_writeback_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_writeback_0_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_0_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_0_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_0_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_0_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_0_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_0_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_0_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_0_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_0_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [63:0] rob_io_writeback_0_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_writeback_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [5:0] rob_io_writeback_1_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_writeback_1_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_1_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_1_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_1_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_1_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_1_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_1_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_1_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_1_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_1_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [63:0] rob_io_writeback_1_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_writeback_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [5:0] rob_io_writeback_2_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_writeback_2_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_2_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_2_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_2_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_2_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_2_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_2_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_2_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_2_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_2_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [63:0] rob_io_writeback_2_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_writeback_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_3_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [5:0] rob_io_writeback_3_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_writeback_3_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_3_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_3_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_3_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_3_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_3_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_3_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_3_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_3_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_3_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [63:0] rob_io_writeback_3_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_writeback_3_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_4_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [5:0] rob_io_writeback_4_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [3:0] rob_io_writeback_4_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_4_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_4_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_4_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_writeback_4_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_4_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_4_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_4_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_4_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_writeback_4_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [63:0] rob_io_writeback_4_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_writeback_4_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_0_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [4:0] rob_io_archCommit_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_archCommit_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_1_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [4:0] rob_io_archCommit_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_archCommit_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_2_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [4:0] rob_io_archCommit_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [6:0] rob_io_archCommit_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_archCommit_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_robRedirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [5:0] rob_io_robRedirect_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_robRedirect_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_robRedirect_isException; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [16:0] rob_io_robRedirect_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_robRedirect_pc; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [31:0] rob_io_robRedirect_excpVaddr; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_redirectInfo_bits_flushSelf; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire [5:0] rob_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_robPause; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_robNeedRollback; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  wire  rob_io_robRollbackDone; // @[src/main/scala/backend/CtrlBlock.scala 80:19]
  DecodeStage decodeStage ( // @[src/main/scala/backend/CtrlBlock.scala 76:27]
    .clock(decodeStage_clock),
    .reset(decodeStage_reset),
    .io_in_0_ready(decodeStage_io_in_0_ready),
    .io_in_0_valid(decodeStage_io_in_0_valid),
    .io_in_0_bits_instr(decodeStage_io_in_0_bits_instr),
    .io_in_0_bits_pc(decodeStage_io_in_0_bits_pc),
    .io_in_0_bits_pdInfo_valid(decodeStage_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(decodeStage_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(decodeStage_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(decodeStage_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(decodeStage_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(decodeStage_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(decodeStage_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_bpuInfo_pc(decodeStage_io_in_0_bits_bpuInfo_pc),
    .io_in_0_bits_bpuInfo_fallThrough(decodeStage_io_in_0_bits_bpuInfo_fallThrough),
    .io_in_0_bits_bpuInfo_taken(decodeStage_io_in_0_bits_bpuInfo_taken),
    .io_in_0_bits_bpuInfo_target(decodeStage_io_in_0_bits_bpuInfo_target),
    .io_in_0_bits_bpuInfo_takenOffset(decodeStage_io_in_0_bits_bpuInfo_takenOffset),
    .io_in_0_bits_bpuInfo_meta_valid(decodeStage_io_in_0_bits_bpuInfo_meta_valid),
    .io_in_0_bits_bpuInfo_meta_btbHit(decodeStage_io_in_0_bits_bpuInfo_meta_btbHit),
    .io_in_0_bits_bpuInfo_meta_btbIsJalr(decodeStage_io_in_0_bits_bpuInfo_meta_btbIsJalr),
    .io_in_0_bits_bpuInfo_meta_btbIsJal(decodeStage_io_in_0_bits_bpuInfo_meta_btbIsJal),
    .io_in_0_bits_bpuInfo_meta_btbIsCall(decodeStage_io_in_0_bits_bpuInfo_meta_btbIsCall),
    .io_in_0_bits_bpuInfo_meta_btbIsRet(decodeStage_io_in_0_bits_bpuInfo_meta_btbIsRet),
    .io_in_0_bits_bpuInfo_meta_btbOffset(decodeStage_io_in_0_bits_bpuInfo_meta_btbOffset),
    .io_in_0_bits_bpuInfo_meta_phtCounter(decodeStage_io_in_0_bits_bpuInfo_meta_phtCounter),
    .io_in_0_bits_bpuInfo_meta_rasTop(decodeStage_io_in_0_bits_bpuInfo_meta_rasTop),
    .io_in_0_bits_bpuInfo_meta_predTaken(decodeStage_io_in_0_bits_bpuInfo_meta_predTaken),
    .io_in_0_bits_bpuInfo_meta_predTarget(decodeStage_io_in_0_bits_bpuInfo_meta_predTarget),
    .io_in_0_bits_exception_excpTlbRefill(decodeStage_io_in_0_bits_exception_excpTlbRefill),
    .io_in_0_bits_exception_excpTlbPif(decodeStage_io_in_0_bits_exception_excpTlbPif),
    .io_in_0_bits_exception_excpTlbPpi(decodeStage_io_in_0_bits_exception_excpTlbPpi),
    .io_in_0_bits_exception_excpAdef(decodeStage_io_in_0_bits_exception_excpAdef),
    .io_in_1_ready(decodeStage_io_in_1_ready),
    .io_in_1_valid(decodeStage_io_in_1_valid),
    .io_in_1_bits_instr(decodeStage_io_in_1_bits_instr),
    .io_in_1_bits_pc(decodeStage_io_in_1_bits_pc),
    .io_in_1_bits_pdInfo_valid(decodeStage_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(decodeStage_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(decodeStage_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(decodeStage_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(decodeStage_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(decodeStage_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(decodeStage_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_bpuInfo_pc(decodeStage_io_in_1_bits_bpuInfo_pc),
    .io_in_1_bits_bpuInfo_fallThrough(decodeStage_io_in_1_bits_bpuInfo_fallThrough),
    .io_in_1_bits_bpuInfo_taken(decodeStage_io_in_1_bits_bpuInfo_taken),
    .io_in_1_bits_bpuInfo_target(decodeStage_io_in_1_bits_bpuInfo_target),
    .io_in_1_bits_bpuInfo_takenOffset(decodeStage_io_in_1_bits_bpuInfo_takenOffset),
    .io_in_1_bits_bpuInfo_meta_valid(decodeStage_io_in_1_bits_bpuInfo_meta_valid),
    .io_in_1_bits_bpuInfo_meta_btbHit(decodeStage_io_in_1_bits_bpuInfo_meta_btbHit),
    .io_in_1_bits_bpuInfo_meta_btbIsJalr(decodeStage_io_in_1_bits_bpuInfo_meta_btbIsJalr),
    .io_in_1_bits_bpuInfo_meta_btbIsJal(decodeStage_io_in_1_bits_bpuInfo_meta_btbIsJal),
    .io_in_1_bits_bpuInfo_meta_btbIsCall(decodeStage_io_in_1_bits_bpuInfo_meta_btbIsCall),
    .io_in_1_bits_bpuInfo_meta_btbIsRet(decodeStage_io_in_1_bits_bpuInfo_meta_btbIsRet),
    .io_in_1_bits_bpuInfo_meta_btbOffset(decodeStage_io_in_1_bits_bpuInfo_meta_btbOffset),
    .io_in_1_bits_bpuInfo_meta_phtCounter(decodeStage_io_in_1_bits_bpuInfo_meta_phtCounter),
    .io_in_1_bits_bpuInfo_meta_rasTop(decodeStage_io_in_1_bits_bpuInfo_meta_rasTop),
    .io_in_1_bits_bpuInfo_meta_predTaken(decodeStage_io_in_1_bits_bpuInfo_meta_predTaken),
    .io_in_1_bits_bpuInfo_meta_predTarget(decodeStage_io_in_1_bits_bpuInfo_meta_predTarget),
    .io_in_1_bits_exception_excpTlbRefill(decodeStage_io_in_1_bits_exception_excpTlbRefill),
    .io_in_1_bits_exception_excpTlbPif(decodeStage_io_in_1_bits_exception_excpTlbPif),
    .io_in_1_bits_exception_excpTlbPpi(decodeStage_io_in_1_bits_exception_excpTlbPpi),
    .io_in_1_bits_exception_excpAdef(decodeStage_io_in_1_bits_exception_excpAdef),
    .io_in_2_ready(decodeStage_io_in_2_ready),
    .io_in_2_valid(decodeStage_io_in_2_valid),
    .io_in_2_bits_instr(decodeStage_io_in_2_bits_instr),
    .io_in_2_bits_pc(decodeStage_io_in_2_bits_pc),
    .io_in_2_bits_pdInfo_valid(decodeStage_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(decodeStage_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(decodeStage_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(decodeStage_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(decodeStage_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(decodeStage_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(decodeStage_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_bpuInfo_pc(decodeStage_io_in_2_bits_bpuInfo_pc),
    .io_in_2_bits_bpuInfo_fallThrough(decodeStage_io_in_2_bits_bpuInfo_fallThrough),
    .io_in_2_bits_bpuInfo_taken(decodeStage_io_in_2_bits_bpuInfo_taken),
    .io_in_2_bits_bpuInfo_target(decodeStage_io_in_2_bits_bpuInfo_target),
    .io_in_2_bits_bpuInfo_takenOffset(decodeStage_io_in_2_bits_bpuInfo_takenOffset),
    .io_in_2_bits_bpuInfo_meta_valid(decodeStage_io_in_2_bits_bpuInfo_meta_valid),
    .io_in_2_bits_bpuInfo_meta_btbHit(decodeStage_io_in_2_bits_bpuInfo_meta_btbHit),
    .io_in_2_bits_bpuInfo_meta_btbIsJalr(decodeStage_io_in_2_bits_bpuInfo_meta_btbIsJalr),
    .io_in_2_bits_bpuInfo_meta_btbIsJal(decodeStage_io_in_2_bits_bpuInfo_meta_btbIsJal),
    .io_in_2_bits_bpuInfo_meta_btbIsCall(decodeStage_io_in_2_bits_bpuInfo_meta_btbIsCall),
    .io_in_2_bits_bpuInfo_meta_btbIsRet(decodeStage_io_in_2_bits_bpuInfo_meta_btbIsRet),
    .io_in_2_bits_bpuInfo_meta_btbOffset(decodeStage_io_in_2_bits_bpuInfo_meta_btbOffset),
    .io_in_2_bits_bpuInfo_meta_phtCounter(decodeStage_io_in_2_bits_bpuInfo_meta_phtCounter),
    .io_in_2_bits_bpuInfo_meta_rasTop(decodeStage_io_in_2_bits_bpuInfo_meta_rasTop),
    .io_in_2_bits_bpuInfo_meta_predTaken(decodeStage_io_in_2_bits_bpuInfo_meta_predTaken),
    .io_in_2_bits_bpuInfo_meta_predTarget(decodeStage_io_in_2_bits_bpuInfo_meta_predTarget),
    .io_in_2_bits_exception_excpTlbRefill(decodeStage_io_in_2_bits_exception_excpTlbRefill),
    .io_in_2_bits_exception_excpTlbPif(decodeStage_io_in_2_bits_exception_excpTlbPif),
    .io_in_2_bits_exception_excpTlbPpi(decodeStage_io_in_2_bits_exception_excpTlbPpi),
    .io_in_2_bits_exception_excpAdef(decodeStage_io_in_2_bits_exception_excpAdef),
    .io_out_0_ready(decodeStage_io_out_0_ready),
    .io_out_0_valid(decodeStage_io_out_0_valid),
    .io_out_0_bits_pc(decodeStage_io_out_0_bits_pc),
    .io_out_0_bits_inst(decodeStage_io_out_0_bits_inst),
    .io_out_0_bits_rd(decodeStage_io_out_0_bits_rd),
    .io_out_0_bits_rj(decodeStage_io_out_0_bits_rj),
    .io_out_0_bits_rk(decodeStage_io_out_0_bits_rk),
    .io_out_0_bits_rs1(decodeStage_io_out_0_bits_rs1),
    .io_out_0_bits_rs2(decodeStage_io_out_0_bits_rs2),
    .io_out_0_bits_rs1Valid(decodeStage_io_out_0_bits_rs1Valid),
    .io_out_0_bits_rs2Valid(decodeStage_io_out_0_bits_rs2Valid),
    .io_out_0_bits_rdValid(decodeStage_io_out_0_bits_rdValid),
    .io_out_0_bits_csrAddress(decodeStage_io_out_0_bits_csrAddress),
    .io_out_0_bits_imm(decodeStage_io_out_0_bits_imm),
    .io_out_0_bits_ctrl_fuType(decodeStage_io_out_0_bits_ctrl_fuType),
    .io_out_0_bits_ctrl_aluOp(decodeStage_io_out_0_bits_ctrl_aluOp),
    .io_out_0_bits_ctrl_bruOp(decodeStage_io_out_0_bits_ctrl_bruOp),
    .io_out_0_bits_ctrl_lsuOp(decodeStage_io_out_0_bits_ctrl_lsuOp),
    .io_out_0_bits_ctrl_csrOp(decodeStage_io_out_0_bits_ctrl_csrOp),
    .io_out_0_bits_ctrl_mulOp(decodeStage_io_out_0_bits_ctrl_mulOp),
    .io_out_0_bits_ctrl_divOp(decodeStage_io_out_0_bits_ctrl_divOp),
    .io_out_0_bits_ctrl_src1Type(decodeStage_io_out_0_bits_ctrl_src1Type),
    .io_out_0_bits_ctrl_src2Type(decodeStage_io_out_0_bits_ctrl_src2Type),
    .io_out_0_bits_ctrl_immType(decodeStage_io_out_0_bits_ctrl_immType),
    .io_out_0_bits_ctrl_rfWen(decodeStage_io_out_0_bits_ctrl_rfWen),
    .io_out_0_bits_ctrl_memRead(decodeStage_io_out_0_bits_ctrl_memRead),
    .io_out_0_bits_ctrl_memWrite(decodeStage_io_out_0_bits_ctrl_memWrite),
    .io_out_0_bits_ctrl_csrWen(decodeStage_io_out_0_bits_ctrl_csrWen),
    .io_out_0_bits_ctrl_isBranch(decodeStage_io_out_0_bits_ctrl_isBranch),
    .io_out_0_bits_ctrl_isJump(decodeStage_io_out_0_bits_ctrl_isJump),
    .io_out_0_bits_ctrl_isPriv(decodeStage_io_out_0_bits_ctrl_isPriv),
    .io_out_0_bits_excp_excpVec(decodeStage_io_out_0_bits_excp_excpVec),
    .io_out_0_bits_pdInfo_valid(decodeStage_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(decodeStage_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(decodeStage_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(decodeStage_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(decodeStage_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(decodeStage_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(decodeStage_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_0_bits_bpuInfo_pc(decodeStage_io_out_0_bits_bpuInfo_pc),
    .io_out_0_bits_bpuInfo_fallThrough(decodeStage_io_out_0_bits_bpuInfo_fallThrough),
    .io_out_0_bits_bpuInfo_taken(decodeStage_io_out_0_bits_bpuInfo_taken),
    .io_out_0_bits_bpuInfo_target(decodeStage_io_out_0_bits_bpuInfo_target),
    .io_out_0_bits_bpuInfo_takenOffset(decodeStage_io_out_0_bits_bpuInfo_takenOffset),
    .io_out_0_bits_bpuInfo_meta_valid(decodeStage_io_out_0_bits_bpuInfo_meta_valid),
    .io_out_0_bits_bpuInfo_meta_btbHit(decodeStage_io_out_0_bits_bpuInfo_meta_btbHit),
    .io_out_0_bits_bpuInfo_meta_btbIsJalr(decodeStage_io_out_0_bits_bpuInfo_meta_btbIsJalr),
    .io_out_0_bits_bpuInfo_meta_btbIsJal(decodeStage_io_out_0_bits_bpuInfo_meta_btbIsJal),
    .io_out_0_bits_bpuInfo_meta_btbIsCall(decodeStage_io_out_0_bits_bpuInfo_meta_btbIsCall),
    .io_out_0_bits_bpuInfo_meta_btbIsRet(decodeStage_io_out_0_bits_bpuInfo_meta_btbIsRet),
    .io_out_0_bits_bpuInfo_meta_btbOffset(decodeStage_io_out_0_bits_bpuInfo_meta_btbOffset),
    .io_out_0_bits_bpuInfo_meta_phtCounter(decodeStage_io_out_0_bits_bpuInfo_meta_phtCounter),
    .io_out_0_bits_bpuInfo_meta_rasTop(decodeStage_io_out_0_bits_bpuInfo_meta_rasTop),
    .io_out_0_bits_bpuInfo_meta_predTaken(decodeStage_io_out_0_bits_bpuInfo_meta_predTaken),
    .io_out_0_bits_bpuInfo_meta_predTarget(decodeStage_io_out_0_bits_bpuInfo_meta_predTarget),
    .io_out_1_ready(decodeStage_io_out_1_ready),
    .io_out_1_valid(decodeStage_io_out_1_valid),
    .io_out_1_bits_pc(decodeStage_io_out_1_bits_pc),
    .io_out_1_bits_inst(decodeStage_io_out_1_bits_inst),
    .io_out_1_bits_rd(decodeStage_io_out_1_bits_rd),
    .io_out_1_bits_rj(decodeStage_io_out_1_bits_rj),
    .io_out_1_bits_rk(decodeStage_io_out_1_bits_rk),
    .io_out_1_bits_rs1(decodeStage_io_out_1_bits_rs1),
    .io_out_1_bits_rs2(decodeStage_io_out_1_bits_rs2),
    .io_out_1_bits_rs1Valid(decodeStage_io_out_1_bits_rs1Valid),
    .io_out_1_bits_rs2Valid(decodeStage_io_out_1_bits_rs2Valid),
    .io_out_1_bits_rdValid(decodeStage_io_out_1_bits_rdValid),
    .io_out_1_bits_csrAddress(decodeStage_io_out_1_bits_csrAddress),
    .io_out_1_bits_imm(decodeStage_io_out_1_bits_imm),
    .io_out_1_bits_ctrl_fuType(decodeStage_io_out_1_bits_ctrl_fuType),
    .io_out_1_bits_ctrl_aluOp(decodeStage_io_out_1_bits_ctrl_aluOp),
    .io_out_1_bits_ctrl_bruOp(decodeStage_io_out_1_bits_ctrl_bruOp),
    .io_out_1_bits_ctrl_lsuOp(decodeStage_io_out_1_bits_ctrl_lsuOp),
    .io_out_1_bits_ctrl_csrOp(decodeStage_io_out_1_bits_ctrl_csrOp),
    .io_out_1_bits_ctrl_mulOp(decodeStage_io_out_1_bits_ctrl_mulOp),
    .io_out_1_bits_ctrl_divOp(decodeStage_io_out_1_bits_ctrl_divOp),
    .io_out_1_bits_ctrl_src1Type(decodeStage_io_out_1_bits_ctrl_src1Type),
    .io_out_1_bits_ctrl_src2Type(decodeStage_io_out_1_bits_ctrl_src2Type),
    .io_out_1_bits_ctrl_immType(decodeStage_io_out_1_bits_ctrl_immType),
    .io_out_1_bits_ctrl_rfWen(decodeStage_io_out_1_bits_ctrl_rfWen),
    .io_out_1_bits_ctrl_memRead(decodeStage_io_out_1_bits_ctrl_memRead),
    .io_out_1_bits_ctrl_memWrite(decodeStage_io_out_1_bits_ctrl_memWrite),
    .io_out_1_bits_ctrl_csrWen(decodeStage_io_out_1_bits_ctrl_csrWen),
    .io_out_1_bits_ctrl_isBranch(decodeStage_io_out_1_bits_ctrl_isBranch),
    .io_out_1_bits_ctrl_isJump(decodeStage_io_out_1_bits_ctrl_isJump),
    .io_out_1_bits_ctrl_isPriv(decodeStage_io_out_1_bits_ctrl_isPriv),
    .io_out_1_bits_excp_excpVec(decodeStage_io_out_1_bits_excp_excpVec),
    .io_out_1_bits_pdInfo_valid(decodeStage_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(decodeStage_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(decodeStage_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(decodeStage_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(decodeStage_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(decodeStage_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(decodeStage_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_1_bits_bpuInfo_pc(decodeStage_io_out_1_bits_bpuInfo_pc),
    .io_out_1_bits_bpuInfo_fallThrough(decodeStage_io_out_1_bits_bpuInfo_fallThrough),
    .io_out_1_bits_bpuInfo_taken(decodeStage_io_out_1_bits_bpuInfo_taken),
    .io_out_1_bits_bpuInfo_target(decodeStage_io_out_1_bits_bpuInfo_target),
    .io_out_1_bits_bpuInfo_takenOffset(decodeStage_io_out_1_bits_bpuInfo_takenOffset),
    .io_out_1_bits_bpuInfo_meta_valid(decodeStage_io_out_1_bits_bpuInfo_meta_valid),
    .io_out_1_bits_bpuInfo_meta_btbHit(decodeStage_io_out_1_bits_bpuInfo_meta_btbHit),
    .io_out_1_bits_bpuInfo_meta_btbIsJalr(decodeStage_io_out_1_bits_bpuInfo_meta_btbIsJalr),
    .io_out_1_bits_bpuInfo_meta_btbIsJal(decodeStage_io_out_1_bits_bpuInfo_meta_btbIsJal),
    .io_out_1_bits_bpuInfo_meta_btbIsCall(decodeStage_io_out_1_bits_bpuInfo_meta_btbIsCall),
    .io_out_1_bits_bpuInfo_meta_btbIsRet(decodeStage_io_out_1_bits_bpuInfo_meta_btbIsRet),
    .io_out_1_bits_bpuInfo_meta_btbOffset(decodeStage_io_out_1_bits_bpuInfo_meta_btbOffset),
    .io_out_1_bits_bpuInfo_meta_phtCounter(decodeStage_io_out_1_bits_bpuInfo_meta_phtCounter),
    .io_out_1_bits_bpuInfo_meta_rasTop(decodeStage_io_out_1_bits_bpuInfo_meta_rasTop),
    .io_out_1_bits_bpuInfo_meta_predTaken(decodeStage_io_out_1_bits_bpuInfo_meta_predTaken),
    .io_out_1_bits_bpuInfo_meta_predTarget(decodeStage_io_out_1_bits_bpuInfo_meta_predTarget),
    .io_out_2_ready(decodeStage_io_out_2_ready),
    .io_out_2_valid(decodeStage_io_out_2_valid),
    .io_out_2_bits_pc(decodeStage_io_out_2_bits_pc),
    .io_out_2_bits_inst(decodeStage_io_out_2_bits_inst),
    .io_out_2_bits_rd(decodeStage_io_out_2_bits_rd),
    .io_out_2_bits_rj(decodeStage_io_out_2_bits_rj),
    .io_out_2_bits_rk(decodeStage_io_out_2_bits_rk),
    .io_out_2_bits_rs1(decodeStage_io_out_2_bits_rs1),
    .io_out_2_bits_rs2(decodeStage_io_out_2_bits_rs2),
    .io_out_2_bits_rs1Valid(decodeStage_io_out_2_bits_rs1Valid),
    .io_out_2_bits_rs2Valid(decodeStage_io_out_2_bits_rs2Valid),
    .io_out_2_bits_rdValid(decodeStage_io_out_2_bits_rdValid),
    .io_out_2_bits_csrAddress(decodeStage_io_out_2_bits_csrAddress),
    .io_out_2_bits_imm(decodeStage_io_out_2_bits_imm),
    .io_out_2_bits_ctrl_fuType(decodeStage_io_out_2_bits_ctrl_fuType),
    .io_out_2_bits_ctrl_aluOp(decodeStage_io_out_2_bits_ctrl_aluOp),
    .io_out_2_bits_ctrl_bruOp(decodeStage_io_out_2_bits_ctrl_bruOp),
    .io_out_2_bits_ctrl_lsuOp(decodeStage_io_out_2_bits_ctrl_lsuOp),
    .io_out_2_bits_ctrl_csrOp(decodeStage_io_out_2_bits_ctrl_csrOp),
    .io_out_2_bits_ctrl_mulOp(decodeStage_io_out_2_bits_ctrl_mulOp),
    .io_out_2_bits_ctrl_divOp(decodeStage_io_out_2_bits_ctrl_divOp),
    .io_out_2_bits_ctrl_src1Type(decodeStage_io_out_2_bits_ctrl_src1Type),
    .io_out_2_bits_ctrl_src2Type(decodeStage_io_out_2_bits_ctrl_src2Type),
    .io_out_2_bits_ctrl_immType(decodeStage_io_out_2_bits_ctrl_immType),
    .io_out_2_bits_ctrl_rfWen(decodeStage_io_out_2_bits_ctrl_rfWen),
    .io_out_2_bits_ctrl_memRead(decodeStage_io_out_2_bits_ctrl_memRead),
    .io_out_2_bits_ctrl_memWrite(decodeStage_io_out_2_bits_ctrl_memWrite),
    .io_out_2_bits_ctrl_csrWen(decodeStage_io_out_2_bits_ctrl_csrWen),
    .io_out_2_bits_ctrl_isBranch(decodeStage_io_out_2_bits_ctrl_isBranch),
    .io_out_2_bits_ctrl_isJump(decodeStage_io_out_2_bits_ctrl_isJump),
    .io_out_2_bits_ctrl_isPriv(decodeStage_io_out_2_bits_ctrl_isPriv),
    .io_out_2_bits_excp_excpVec(decodeStage_io_out_2_bits_excp_excpVec),
    .io_out_2_bits_pdInfo_valid(decodeStage_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(decodeStage_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(decodeStage_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(decodeStage_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(decodeStage_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(decodeStage_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(decodeStage_io_out_2_bits_pdInfo_jumpTarget),
    .io_out_2_bits_bpuInfo_pc(decodeStage_io_out_2_bits_bpuInfo_pc),
    .io_out_2_bits_bpuInfo_fallThrough(decodeStage_io_out_2_bits_bpuInfo_fallThrough),
    .io_out_2_bits_bpuInfo_taken(decodeStage_io_out_2_bits_bpuInfo_taken),
    .io_out_2_bits_bpuInfo_target(decodeStage_io_out_2_bits_bpuInfo_target),
    .io_out_2_bits_bpuInfo_takenOffset(decodeStage_io_out_2_bits_bpuInfo_takenOffset),
    .io_out_2_bits_bpuInfo_meta_valid(decodeStage_io_out_2_bits_bpuInfo_meta_valid),
    .io_out_2_bits_bpuInfo_meta_btbHit(decodeStage_io_out_2_bits_bpuInfo_meta_btbHit),
    .io_out_2_bits_bpuInfo_meta_btbIsJalr(decodeStage_io_out_2_bits_bpuInfo_meta_btbIsJalr),
    .io_out_2_bits_bpuInfo_meta_btbIsJal(decodeStage_io_out_2_bits_bpuInfo_meta_btbIsJal),
    .io_out_2_bits_bpuInfo_meta_btbIsCall(decodeStage_io_out_2_bits_bpuInfo_meta_btbIsCall),
    .io_out_2_bits_bpuInfo_meta_btbIsRet(decodeStage_io_out_2_bits_bpuInfo_meta_btbIsRet),
    .io_out_2_bits_bpuInfo_meta_btbOffset(decodeStage_io_out_2_bits_bpuInfo_meta_btbOffset),
    .io_out_2_bits_bpuInfo_meta_phtCounter(decodeStage_io_out_2_bits_bpuInfo_meta_phtCounter),
    .io_out_2_bits_bpuInfo_meta_rasTop(decodeStage_io_out_2_bits_bpuInfo_meta_rasTop),
    .io_out_2_bits_bpuInfo_meta_predTaken(decodeStage_io_out_2_bits_bpuInfo_meta_predTaken),
    .io_out_2_bits_bpuInfo_meta_predTarget(decodeStage_io_out_2_bits_bpuInfo_meta_predTarget),
    .io_ratRead_0_rs1(decodeStage_io_ratRead_0_rs1),
    .io_ratRead_0_rs2(decodeStage_io_ratRead_0_rs2),
    .io_ratRead_0_hold1(decodeStage_io_ratRead_0_hold1),
    .io_ratRead_0_hold2(decodeStage_io_ratRead_0_hold2),
    .io_ratRead_1_rs1(decodeStage_io_ratRead_1_rs1),
    .io_ratRead_1_rs2(decodeStage_io_ratRead_1_rs2),
    .io_ratRead_1_hold1(decodeStage_io_ratRead_1_hold1),
    .io_ratRead_1_hold2(decodeStage_io_ratRead_1_hold2),
    .io_ratRead_2_rs1(decodeStage_io_ratRead_2_rs1),
    .io_ratRead_2_rs2(decodeStage_io_ratRead_2_rs2),
    .io_ratRead_2_hold1(decodeStage_io_ratRead_2_hold1),
    .io_ratRead_2_hold2(decodeStage_io_ratRead_2_hold2),
    .io_extInt(decodeStage_io_extInt),
    .io_flush(decodeStage_io_flush)
  );
  RenameStage renameStage ( // @[src/main/scala/backend/CtrlBlock.scala 77:27]
    .clock(renameStage_clock),
    .reset(renameStage_reset),
    .io_in_0_ready(renameStage_io_in_0_ready),
    .io_in_0_valid(renameStage_io_in_0_valid),
    .io_in_0_bits_pc(renameStage_io_in_0_bits_pc),
    .io_in_0_bits_inst(renameStage_io_in_0_bits_inst),
    .io_in_0_bits_rd(renameStage_io_in_0_bits_rd),
    .io_in_0_bits_rs1(renameStage_io_in_0_bits_rs1),
    .io_in_0_bits_rs2(renameStage_io_in_0_bits_rs2),
    .io_in_0_bits_rs1Valid(renameStage_io_in_0_bits_rs1Valid),
    .io_in_0_bits_rs2Valid(renameStage_io_in_0_bits_rs2Valid),
    .io_in_0_bits_rdValid(renameStage_io_in_0_bits_rdValid),
    .io_in_0_bits_csrAddress(renameStage_io_in_0_bits_csrAddress),
    .io_in_0_bits_imm(renameStage_io_in_0_bits_imm),
    .io_in_0_bits_ctrl_fuType(renameStage_io_in_0_bits_ctrl_fuType),
    .io_in_0_bits_ctrl_aluOp(renameStage_io_in_0_bits_ctrl_aluOp),
    .io_in_0_bits_ctrl_bruOp(renameStage_io_in_0_bits_ctrl_bruOp),
    .io_in_0_bits_ctrl_lsuOp(renameStage_io_in_0_bits_ctrl_lsuOp),
    .io_in_0_bits_ctrl_csrOp(renameStage_io_in_0_bits_ctrl_csrOp),
    .io_in_0_bits_ctrl_mulOp(renameStage_io_in_0_bits_ctrl_mulOp),
    .io_in_0_bits_ctrl_divOp(renameStage_io_in_0_bits_ctrl_divOp),
    .io_in_0_bits_ctrl_src1Type(renameStage_io_in_0_bits_ctrl_src1Type),
    .io_in_0_bits_ctrl_src2Type(renameStage_io_in_0_bits_ctrl_src2Type),
    .io_in_0_bits_ctrl_immType(renameStage_io_in_0_bits_ctrl_immType),
    .io_in_0_bits_ctrl_rfWen(renameStage_io_in_0_bits_ctrl_rfWen),
    .io_in_0_bits_ctrl_memRead(renameStage_io_in_0_bits_ctrl_memRead),
    .io_in_0_bits_ctrl_memWrite(renameStage_io_in_0_bits_ctrl_memWrite),
    .io_in_0_bits_ctrl_csrWen(renameStage_io_in_0_bits_ctrl_csrWen),
    .io_in_0_bits_ctrl_isBranch(renameStage_io_in_0_bits_ctrl_isBranch),
    .io_in_0_bits_ctrl_isJump(renameStage_io_in_0_bits_ctrl_isJump),
    .io_in_0_bits_ctrl_isPriv(renameStage_io_in_0_bits_ctrl_isPriv),
    .io_in_0_bits_excp_excpVec(renameStage_io_in_0_bits_excp_excpVec),
    .io_in_0_bits_pdInfo_valid(renameStage_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(renameStage_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(renameStage_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(renameStage_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(renameStage_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(renameStage_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(renameStage_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_bpuInfo_pc(renameStage_io_in_0_bits_bpuInfo_pc),
    .io_in_0_bits_bpuInfo_fallThrough(renameStage_io_in_0_bits_bpuInfo_fallThrough),
    .io_in_0_bits_bpuInfo_taken(renameStage_io_in_0_bits_bpuInfo_taken),
    .io_in_0_bits_bpuInfo_target(renameStage_io_in_0_bits_bpuInfo_target),
    .io_in_0_bits_bpuInfo_takenOffset(renameStage_io_in_0_bits_bpuInfo_takenOffset),
    .io_in_0_bits_bpuInfo_meta_valid(renameStage_io_in_0_bits_bpuInfo_meta_valid),
    .io_in_0_bits_bpuInfo_meta_btbHit(renameStage_io_in_0_bits_bpuInfo_meta_btbHit),
    .io_in_0_bits_bpuInfo_meta_btbIsJalr(renameStage_io_in_0_bits_bpuInfo_meta_btbIsJalr),
    .io_in_0_bits_bpuInfo_meta_btbIsJal(renameStage_io_in_0_bits_bpuInfo_meta_btbIsJal),
    .io_in_0_bits_bpuInfo_meta_btbIsCall(renameStage_io_in_0_bits_bpuInfo_meta_btbIsCall),
    .io_in_0_bits_bpuInfo_meta_btbIsRet(renameStage_io_in_0_bits_bpuInfo_meta_btbIsRet),
    .io_in_0_bits_bpuInfo_meta_btbOffset(renameStage_io_in_0_bits_bpuInfo_meta_btbOffset),
    .io_in_0_bits_bpuInfo_meta_phtCounter(renameStage_io_in_0_bits_bpuInfo_meta_phtCounter),
    .io_in_0_bits_bpuInfo_meta_rasTop(renameStage_io_in_0_bits_bpuInfo_meta_rasTop),
    .io_in_0_bits_bpuInfo_meta_predTaken(renameStage_io_in_0_bits_bpuInfo_meta_predTaken),
    .io_in_0_bits_bpuInfo_meta_predTarget(renameStage_io_in_0_bits_bpuInfo_meta_predTarget),
    .io_in_1_ready(renameStage_io_in_1_ready),
    .io_in_1_valid(renameStage_io_in_1_valid),
    .io_in_1_bits_pc(renameStage_io_in_1_bits_pc),
    .io_in_1_bits_inst(renameStage_io_in_1_bits_inst),
    .io_in_1_bits_rd(renameStage_io_in_1_bits_rd),
    .io_in_1_bits_rs1(renameStage_io_in_1_bits_rs1),
    .io_in_1_bits_rs2(renameStage_io_in_1_bits_rs2),
    .io_in_1_bits_rs1Valid(renameStage_io_in_1_bits_rs1Valid),
    .io_in_1_bits_rs2Valid(renameStage_io_in_1_bits_rs2Valid),
    .io_in_1_bits_rdValid(renameStage_io_in_1_bits_rdValid),
    .io_in_1_bits_csrAddress(renameStage_io_in_1_bits_csrAddress),
    .io_in_1_bits_imm(renameStage_io_in_1_bits_imm),
    .io_in_1_bits_ctrl_fuType(renameStage_io_in_1_bits_ctrl_fuType),
    .io_in_1_bits_ctrl_aluOp(renameStage_io_in_1_bits_ctrl_aluOp),
    .io_in_1_bits_ctrl_bruOp(renameStage_io_in_1_bits_ctrl_bruOp),
    .io_in_1_bits_ctrl_lsuOp(renameStage_io_in_1_bits_ctrl_lsuOp),
    .io_in_1_bits_ctrl_csrOp(renameStage_io_in_1_bits_ctrl_csrOp),
    .io_in_1_bits_ctrl_mulOp(renameStage_io_in_1_bits_ctrl_mulOp),
    .io_in_1_bits_ctrl_divOp(renameStage_io_in_1_bits_ctrl_divOp),
    .io_in_1_bits_ctrl_src1Type(renameStage_io_in_1_bits_ctrl_src1Type),
    .io_in_1_bits_ctrl_src2Type(renameStage_io_in_1_bits_ctrl_src2Type),
    .io_in_1_bits_ctrl_immType(renameStage_io_in_1_bits_ctrl_immType),
    .io_in_1_bits_ctrl_rfWen(renameStage_io_in_1_bits_ctrl_rfWen),
    .io_in_1_bits_ctrl_memRead(renameStage_io_in_1_bits_ctrl_memRead),
    .io_in_1_bits_ctrl_memWrite(renameStage_io_in_1_bits_ctrl_memWrite),
    .io_in_1_bits_ctrl_csrWen(renameStage_io_in_1_bits_ctrl_csrWen),
    .io_in_1_bits_ctrl_isBranch(renameStage_io_in_1_bits_ctrl_isBranch),
    .io_in_1_bits_ctrl_isJump(renameStage_io_in_1_bits_ctrl_isJump),
    .io_in_1_bits_ctrl_isPriv(renameStage_io_in_1_bits_ctrl_isPriv),
    .io_in_1_bits_excp_excpVec(renameStage_io_in_1_bits_excp_excpVec),
    .io_in_1_bits_pdInfo_valid(renameStage_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(renameStage_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(renameStage_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(renameStage_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(renameStage_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(renameStage_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(renameStage_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_bpuInfo_pc(renameStage_io_in_1_bits_bpuInfo_pc),
    .io_in_1_bits_bpuInfo_fallThrough(renameStage_io_in_1_bits_bpuInfo_fallThrough),
    .io_in_1_bits_bpuInfo_taken(renameStage_io_in_1_bits_bpuInfo_taken),
    .io_in_1_bits_bpuInfo_target(renameStage_io_in_1_bits_bpuInfo_target),
    .io_in_1_bits_bpuInfo_takenOffset(renameStage_io_in_1_bits_bpuInfo_takenOffset),
    .io_in_1_bits_bpuInfo_meta_valid(renameStage_io_in_1_bits_bpuInfo_meta_valid),
    .io_in_1_bits_bpuInfo_meta_btbHit(renameStage_io_in_1_bits_bpuInfo_meta_btbHit),
    .io_in_1_bits_bpuInfo_meta_btbIsJalr(renameStage_io_in_1_bits_bpuInfo_meta_btbIsJalr),
    .io_in_1_bits_bpuInfo_meta_btbIsJal(renameStage_io_in_1_bits_bpuInfo_meta_btbIsJal),
    .io_in_1_bits_bpuInfo_meta_btbIsCall(renameStage_io_in_1_bits_bpuInfo_meta_btbIsCall),
    .io_in_1_bits_bpuInfo_meta_btbIsRet(renameStage_io_in_1_bits_bpuInfo_meta_btbIsRet),
    .io_in_1_bits_bpuInfo_meta_btbOffset(renameStage_io_in_1_bits_bpuInfo_meta_btbOffset),
    .io_in_1_bits_bpuInfo_meta_phtCounter(renameStage_io_in_1_bits_bpuInfo_meta_phtCounter),
    .io_in_1_bits_bpuInfo_meta_rasTop(renameStage_io_in_1_bits_bpuInfo_meta_rasTop),
    .io_in_1_bits_bpuInfo_meta_predTaken(renameStage_io_in_1_bits_bpuInfo_meta_predTaken),
    .io_in_1_bits_bpuInfo_meta_predTarget(renameStage_io_in_1_bits_bpuInfo_meta_predTarget),
    .io_in_2_ready(renameStage_io_in_2_ready),
    .io_in_2_valid(renameStage_io_in_2_valid),
    .io_in_2_bits_pc(renameStage_io_in_2_bits_pc),
    .io_in_2_bits_inst(renameStage_io_in_2_bits_inst),
    .io_in_2_bits_rd(renameStage_io_in_2_bits_rd),
    .io_in_2_bits_rs1(renameStage_io_in_2_bits_rs1),
    .io_in_2_bits_rs2(renameStage_io_in_2_bits_rs2),
    .io_in_2_bits_rs1Valid(renameStage_io_in_2_bits_rs1Valid),
    .io_in_2_bits_rs2Valid(renameStage_io_in_2_bits_rs2Valid),
    .io_in_2_bits_rdValid(renameStage_io_in_2_bits_rdValid),
    .io_in_2_bits_csrAddress(renameStage_io_in_2_bits_csrAddress),
    .io_in_2_bits_imm(renameStage_io_in_2_bits_imm),
    .io_in_2_bits_ctrl_fuType(renameStage_io_in_2_bits_ctrl_fuType),
    .io_in_2_bits_ctrl_aluOp(renameStage_io_in_2_bits_ctrl_aluOp),
    .io_in_2_bits_ctrl_bruOp(renameStage_io_in_2_bits_ctrl_bruOp),
    .io_in_2_bits_ctrl_lsuOp(renameStage_io_in_2_bits_ctrl_lsuOp),
    .io_in_2_bits_ctrl_csrOp(renameStage_io_in_2_bits_ctrl_csrOp),
    .io_in_2_bits_ctrl_mulOp(renameStage_io_in_2_bits_ctrl_mulOp),
    .io_in_2_bits_ctrl_divOp(renameStage_io_in_2_bits_ctrl_divOp),
    .io_in_2_bits_ctrl_src1Type(renameStage_io_in_2_bits_ctrl_src1Type),
    .io_in_2_bits_ctrl_src2Type(renameStage_io_in_2_bits_ctrl_src2Type),
    .io_in_2_bits_ctrl_immType(renameStage_io_in_2_bits_ctrl_immType),
    .io_in_2_bits_ctrl_rfWen(renameStage_io_in_2_bits_ctrl_rfWen),
    .io_in_2_bits_ctrl_memRead(renameStage_io_in_2_bits_ctrl_memRead),
    .io_in_2_bits_ctrl_memWrite(renameStage_io_in_2_bits_ctrl_memWrite),
    .io_in_2_bits_ctrl_csrWen(renameStage_io_in_2_bits_ctrl_csrWen),
    .io_in_2_bits_ctrl_isBranch(renameStage_io_in_2_bits_ctrl_isBranch),
    .io_in_2_bits_ctrl_isJump(renameStage_io_in_2_bits_ctrl_isJump),
    .io_in_2_bits_ctrl_isPriv(renameStage_io_in_2_bits_ctrl_isPriv),
    .io_in_2_bits_excp_excpVec(renameStage_io_in_2_bits_excp_excpVec),
    .io_in_2_bits_pdInfo_valid(renameStage_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(renameStage_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(renameStage_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(renameStage_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(renameStage_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(renameStage_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(renameStage_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_bpuInfo_pc(renameStage_io_in_2_bits_bpuInfo_pc),
    .io_in_2_bits_bpuInfo_fallThrough(renameStage_io_in_2_bits_bpuInfo_fallThrough),
    .io_in_2_bits_bpuInfo_taken(renameStage_io_in_2_bits_bpuInfo_taken),
    .io_in_2_bits_bpuInfo_target(renameStage_io_in_2_bits_bpuInfo_target),
    .io_in_2_bits_bpuInfo_takenOffset(renameStage_io_in_2_bits_bpuInfo_takenOffset),
    .io_in_2_bits_bpuInfo_meta_valid(renameStage_io_in_2_bits_bpuInfo_meta_valid),
    .io_in_2_bits_bpuInfo_meta_btbHit(renameStage_io_in_2_bits_bpuInfo_meta_btbHit),
    .io_in_2_bits_bpuInfo_meta_btbIsJalr(renameStage_io_in_2_bits_bpuInfo_meta_btbIsJalr),
    .io_in_2_bits_bpuInfo_meta_btbIsJal(renameStage_io_in_2_bits_bpuInfo_meta_btbIsJal),
    .io_in_2_bits_bpuInfo_meta_btbIsCall(renameStage_io_in_2_bits_bpuInfo_meta_btbIsCall),
    .io_in_2_bits_bpuInfo_meta_btbIsRet(renameStage_io_in_2_bits_bpuInfo_meta_btbIsRet),
    .io_in_2_bits_bpuInfo_meta_btbOffset(renameStage_io_in_2_bits_bpuInfo_meta_btbOffset),
    .io_in_2_bits_bpuInfo_meta_phtCounter(renameStage_io_in_2_bits_bpuInfo_meta_phtCounter),
    .io_in_2_bits_bpuInfo_meta_rasTop(renameStage_io_in_2_bits_bpuInfo_meta_rasTop),
    .io_in_2_bits_bpuInfo_meta_predTaken(renameStage_io_in_2_bits_bpuInfo_meta_predTaken),
    .io_in_2_bits_bpuInfo_meta_predTarget(renameStage_io_in_2_bits_bpuInfo_meta_predTarget),
    .io_ratRead_0_rs1(renameStage_io_ratRead_0_rs1),
    .io_ratRead_0_rs2(renameStage_io_ratRead_0_rs2),
    .io_ratRead_0_hold1(renameStage_io_ratRead_0_hold1),
    .io_ratRead_0_hold2(renameStage_io_ratRead_0_hold2),
    .io_ratRead_1_rs1(renameStage_io_ratRead_1_rs1),
    .io_ratRead_1_rs2(renameStage_io_ratRead_1_rs2),
    .io_ratRead_1_hold1(renameStage_io_ratRead_1_hold1),
    .io_ratRead_1_hold2(renameStage_io_ratRead_1_hold2),
    .io_ratRead_2_rs1(renameStage_io_ratRead_2_rs1),
    .io_ratRead_2_rs2(renameStage_io_ratRead_2_rs2),
    .io_ratRead_2_hold1(renameStage_io_ratRead_2_hold1),
    .io_ratRead_2_hold2(renameStage_io_ratRead_2_hold2),
    .io_out_0_ready(renameStage_io_out_0_ready),
    .io_out_0_valid(renameStage_io_out_0_valid),
    .io_out_0_bits_pc(renameStage_io_out_0_bits_pc),
    .io_out_0_bits_inst(renameStage_io_out_0_bits_inst),
    .io_out_0_bits_ctrl_fuType(renameStage_io_out_0_bits_ctrl_fuType),
    .io_out_0_bits_ctrl_aluOp(renameStage_io_out_0_bits_ctrl_aluOp),
    .io_out_0_bits_ctrl_bruOp(renameStage_io_out_0_bits_ctrl_bruOp),
    .io_out_0_bits_ctrl_lsuOp(renameStage_io_out_0_bits_ctrl_lsuOp),
    .io_out_0_bits_ctrl_csrOp(renameStage_io_out_0_bits_ctrl_csrOp),
    .io_out_0_bits_ctrl_mulOp(renameStage_io_out_0_bits_ctrl_mulOp),
    .io_out_0_bits_ctrl_divOp(renameStage_io_out_0_bits_ctrl_divOp),
    .io_out_0_bits_ctrl_src1Type(renameStage_io_out_0_bits_ctrl_src1Type),
    .io_out_0_bits_ctrl_src2Type(renameStage_io_out_0_bits_ctrl_src2Type),
    .io_out_0_bits_ctrl_immType(renameStage_io_out_0_bits_ctrl_immType),
    .io_out_0_bits_ctrl_rfWen(renameStage_io_out_0_bits_ctrl_rfWen),
    .io_out_0_bits_ctrl_memRead(renameStage_io_out_0_bits_ctrl_memRead),
    .io_out_0_bits_ctrl_memWrite(renameStage_io_out_0_bits_ctrl_memWrite),
    .io_out_0_bits_ctrl_csrWen(renameStage_io_out_0_bits_ctrl_csrWen),
    .io_out_0_bits_ctrl_isBranch(renameStage_io_out_0_bits_ctrl_isBranch),
    .io_out_0_bits_ctrl_isJump(renameStage_io_out_0_bits_ctrl_isJump),
    .io_out_0_bits_ctrl_isPriv(renameStage_io_out_0_bits_ctrl_isPriv),
    .io_out_0_bits_excp_excpVec(renameStage_io_out_0_bits_excp_excpVec),
    .io_out_0_bits_imm(renameStage_io_out_0_bits_imm),
    .io_out_0_bits_csrAddress(renameStage_io_out_0_bits_csrAddress),
    .io_out_0_bits_pdInfo_valid(renameStage_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(renameStage_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(renameStage_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(renameStage_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(renameStage_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(renameStage_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(renameStage_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_0_bits_bpuInfo_pc(renameStage_io_out_0_bits_bpuInfo_pc),
    .io_out_0_bits_bpuInfo_fallThrough(renameStage_io_out_0_bits_bpuInfo_fallThrough),
    .io_out_0_bits_bpuInfo_taken(renameStage_io_out_0_bits_bpuInfo_taken),
    .io_out_0_bits_bpuInfo_target(renameStage_io_out_0_bits_bpuInfo_target),
    .io_out_0_bits_bpuInfo_takenOffset(renameStage_io_out_0_bits_bpuInfo_takenOffset),
    .io_out_0_bits_bpuInfo_meta_valid(renameStage_io_out_0_bits_bpuInfo_meta_valid),
    .io_out_0_bits_bpuInfo_meta_btbHit(renameStage_io_out_0_bits_bpuInfo_meta_btbHit),
    .io_out_0_bits_bpuInfo_meta_btbIsJalr(renameStage_io_out_0_bits_bpuInfo_meta_btbIsJalr),
    .io_out_0_bits_bpuInfo_meta_btbIsJal(renameStage_io_out_0_bits_bpuInfo_meta_btbIsJal),
    .io_out_0_bits_bpuInfo_meta_btbIsCall(renameStage_io_out_0_bits_bpuInfo_meta_btbIsCall),
    .io_out_0_bits_bpuInfo_meta_btbIsRet(renameStage_io_out_0_bits_bpuInfo_meta_btbIsRet),
    .io_out_0_bits_bpuInfo_meta_btbOffset(renameStage_io_out_0_bits_bpuInfo_meta_btbOffset),
    .io_out_0_bits_bpuInfo_meta_phtCounter(renameStage_io_out_0_bits_bpuInfo_meta_phtCounter),
    .io_out_0_bits_bpuInfo_meta_rasTop(renameStage_io_out_0_bits_bpuInfo_meta_rasTop),
    .io_out_0_bits_bpuInfo_meta_predTaken(renameStage_io_out_0_bits_bpuInfo_meta_predTaken),
    .io_out_0_bits_bpuInfo_meta_predTarget(renameStage_io_out_0_bits_bpuInfo_meta_predTarget),
    .io_out_0_bits_ldst(renameStage_io_out_0_bits_ldst),
    .io_out_0_bits_lrs1(renameStage_io_out_0_bits_lrs1),
    .io_out_0_bits_lrs2(renameStage_io_out_0_bits_lrs2),
    .io_out_0_bits_pdst(renameStage_io_out_0_bits_pdst),
    .io_out_0_bits_prs1(renameStage_io_out_0_bits_prs1),
    .io_out_0_bits_prs2(renameStage_io_out_0_bits_prs2),
    .io_out_0_bits_oldPdst(renameStage_io_out_0_bits_oldPdst),
    .io_out_0_bits_snptId_valid(renameStage_io_out_0_bits_snptId_valid),
    .io_out_0_bits_snptId_bits(renameStage_io_out_0_bits_snptId_bits),
    .io_out_0_bits_rs1Valid(renameStage_io_out_0_bits_rs1Valid),
    .io_out_0_bits_rs2Valid(renameStage_io_out_0_bits_rs2Valid),
    .io_out_0_bits_rdValid(renameStage_io_out_0_bits_rdValid),
    .io_out_0_bits_robIdx_value(renameStage_io_out_0_bits_robIdx_value),
    .io_out_0_bits_robIdx_flag(renameStage_io_out_0_bits_robIdx_flag),
    .io_out_1_ready(renameStage_io_out_1_ready),
    .io_out_1_valid(renameStage_io_out_1_valid),
    .io_out_1_bits_pc(renameStage_io_out_1_bits_pc),
    .io_out_1_bits_inst(renameStage_io_out_1_bits_inst),
    .io_out_1_bits_ctrl_fuType(renameStage_io_out_1_bits_ctrl_fuType),
    .io_out_1_bits_ctrl_aluOp(renameStage_io_out_1_bits_ctrl_aluOp),
    .io_out_1_bits_ctrl_bruOp(renameStage_io_out_1_bits_ctrl_bruOp),
    .io_out_1_bits_ctrl_lsuOp(renameStage_io_out_1_bits_ctrl_lsuOp),
    .io_out_1_bits_ctrl_csrOp(renameStage_io_out_1_bits_ctrl_csrOp),
    .io_out_1_bits_ctrl_mulOp(renameStage_io_out_1_bits_ctrl_mulOp),
    .io_out_1_bits_ctrl_divOp(renameStage_io_out_1_bits_ctrl_divOp),
    .io_out_1_bits_ctrl_src1Type(renameStage_io_out_1_bits_ctrl_src1Type),
    .io_out_1_bits_ctrl_src2Type(renameStage_io_out_1_bits_ctrl_src2Type),
    .io_out_1_bits_ctrl_immType(renameStage_io_out_1_bits_ctrl_immType),
    .io_out_1_bits_ctrl_rfWen(renameStage_io_out_1_bits_ctrl_rfWen),
    .io_out_1_bits_ctrl_memRead(renameStage_io_out_1_bits_ctrl_memRead),
    .io_out_1_bits_ctrl_memWrite(renameStage_io_out_1_bits_ctrl_memWrite),
    .io_out_1_bits_ctrl_csrWen(renameStage_io_out_1_bits_ctrl_csrWen),
    .io_out_1_bits_ctrl_isBranch(renameStage_io_out_1_bits_ctrl_isBranch),
    .io_out_1_bits_ctrl_isJump(renameStage_io_out_1_bits_ctrl_isJump),
    .io_out_1_bits_ctrl_isPriv(renameStage_io_out_1_bits_ctrl_isPriv),
    .io_out_1_bits_excp_excpVec(renameStage_io_out_1_bits_excp_excpVec),
    .io_out_1_bits_imm(renameStage_io_out_1_bits_imm),
    .io_out_1_bits_csrAddress(renameStage_io_out_1_bits_csrAddress),
    .io_out_1_bits_pdInfo_valid(renameStage_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(renameStage_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(renameStage_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(renameStage_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(renameStage_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(renameStage_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(renameStage_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_1_bits_bpuInfo_pc(renameStage_io_out_1_bits_bpuInfo_pc),
    .io_out_1_bits_bpuInfo_fallThrough(renameStage_io_out_1_bits_bpuInfo_fallThrough),
    .io_out_1_bits_bpuInfo_taken(renameStage_io_out_1_bits_bpuInfo_taken),
    .io_out_1_bits_bpuInfo_target(renameStage_io_out_1_bits_bpuInfo_target),
    .io_out_1_bits_bpuInfo_takenOffset(renameStage_io_out_1_bits_bpuInfo_takenOffset),
    .io_out_1_bits_bpuInfo_meta_valid(renameStage_io_out_1_bits_bpuInfo_meta_valid),
    .io_out_1_bits_bpuInfo_meta_btbHit(renameStage_io_out_1_bits_bpuInfo_meta_btbHit),
    .io_out_1_bits_bpuInfo_meta_btbIsJalr(renameStage_io_out_1_bits_bpuInfo_meta_btbIsJalr),
    .io_out_1_bits_bpuInfo_meta_btbIsJal(renameStage_io_out_1_bits_bpuInfo_meta_btbIsJal),
    .io_out_1_bits_bpuInfo_meta_btbIsCall(renameStage_io_out_1_bits_bpuInfo_meta_btbIsCall),
    .io_out_1_bits_bpuInfo_meta_btbIsRet(renameStage_io_out_1_bits_bpuInfo_meta_btbIsRet),
    .io_out_1_bits_bpuInfo_meta_btbOffset(renameStage_io_out_1_bits_bpuInfo_meta_btbOffset),
    .io_out_1_bits_bpuInfo_meta_phtCounter(renameStage_io_out_1_bits_bpuInfo_meta_phtCounter),
    .io_out_1_bits_bpuInfo_meta_rasTop(renameStage_io_out_1_bits_bpuInfo_meta_rasTop),
    .io_out_1_bits_bpuInfo_meta_predTaken(renameStage_io_out_1_bits_bpuInfo_meta_predTaken),
    .io_out_1_bits_bpuInfo_meta_predTarget(renameStage_io_out_1_bits_bpuInfo_meta_predTarget),
    .io_out_1_bits_ldst(renameStage_io_out_1_bits_ldst),
    .io_out_1_bits_lrs1(renameStage_io_out_1_bits_lrs1),
    .io_out_1_bits_lrs2(renameStage_io_out_1_bits_lrs2),
    .io_out_1_bits_pdst(renameStage_io_out_1_bits_pdst),
    .io_out_1_bits_prs1(renameStage_io_out_1_bits_prs1),
    .io_out_1_bits_prs2(renameStage_io_out_1_bits_prs2),
    .io_out_1_bits_oldPdst(renameStage_io_out_1_bits_oldPdst),
    .io_out_1_bits_snptId_valid(renameStage_io_out_1_bits_snptId_valid),
    .io_out_1_bits_snptId_bits(renameStage_io_out_1_bits_snptId_bits),
    .io_out_1_bits_rs1Valid(renameStage_io_out_1_bits_rs1Valid),
    .io_out_1_bits_rs2Valid(renameStage_io_out_1_bits_rs2Valid),
    .io_out_1_bits_rdValid(renameStage_io_out_1_bits_rdValid),
    .io_out_1_bits_robIdx_value(renameStage_io_out_1_bits_robIdx_value),
    .io_out_1_bits_robIdx_flag(renameStage_io_out_1_bits_robIdx_flag),
    .io_out_2_ready(renameStage_io_out_2_ready),
    .io_out_2_valid(renameStage_io_out_2_valid),
    .io_out_2_bits_pc(renameStage_io_out_2_bits_pc),
    .io_out_2_bits_inst(renameStage_io_out_2_bits_inst),
    .io_out_2_bits_ctrl_fuType(renameStage_io_out_2_bits_ctrl_fuType),
    .io_out_2_bits_ctrl_aluOp(renameStage_io_out_2_bits_ctrl_aluOp),
    .io_out_2_bits_ctrl_bruOp(renameStage_io_out_2_bits_ctrl_bruOp),
    .io_out_2_bits_ctrl_lsuOp(renameStage_io_out_2_bits_ctrl_lsuOp),
    .io_out_2_bits_ctrl_csrOp(renameStage_io_out_2_bits_ctrl_csrOp),
    .io_out_2_bits_ctrl_mulOp(renameStage_io_out_2_bits_ctrl_mulOp),
    .io_out_2_bits_ctrl_divOp(renameStage_io_out_2_bits_ctrl_divOp),
    .io_out_2_bits_ctrl_src1Type(renameStage_io_out_2_bits_ctrl_src1Type),
    .io_out_2_bits_ctrl_src2Type(renameStage_io_out_2_bits_ctrl_src2Type),
    .io_out_2_bits_ctrl_immType(renameStage_io_out_2_bits_ctrl_immType),
    .io_out_2_bits_ctrl_rfWen(renameStage_io_out_2_bits_ctrl_rfWen),
    .io_out_2_bits_ctrl_memRead(renameStage_io_out_2_bits_ctrl_memRead),
    .io_out_2_bits_ctrl_memWrite(renameStage_io_out_2_bits_ctrl_memWrite),
    .io_out_2_bits_ctrl_csrWen(renameStage_io_out_2_bits_ctrl_csrWen),
    .io_out_2_bits_ctrl_isBranch(renameStage_io_out_2_bits_ctrl_isBranch),
    .io_out_2_bits_ctrl_isJump(renameStage_io_out_2_bits_ctrl_isJump),
    .io_out_2_bits_ctrl_isPriv(renameStage_io_out_2_bits_ctrl_isPriv),
    .io_out_2_bits_excp_excpVec(renameStage_io_out_2_bits_excp_excpVec),
    .io_out_2_bits_imm(renameStage_io_out_2_bits_imm),
    .io_out_2_bits_csrAddress(renameStage_io_out_2_bits_csrAddress),
    .io_out_2_bits_pdInfo_valid(renameStage_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(renameStage_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(renameStage_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(renameStage_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(renameStage_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(renameStage_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(renameStage_io_out_2_bits_pdInfo_jumpTarget),
    .io_out_2_bits_bpuInfo_pc(renameStage_io_out_2_bits_bpuInfo_pc),
    .io_out_2_bits_bpuInfo_fallThrough(renameStage_io_out_2_bits_bpuInfo_fallThrough),
    .io_out_2_bits_bpuInfo_taken(renameStage_io_out_2_bits_bpuInfo_taken),
    .io_out_2_bits_bpuInfo_target(renameStage_io_out_2_bits_bpuInfo_target),
    .io_out_2_bits_bpuInfo_takenOffset(renameStage_io_out_2_bits_bpuInfo_takenOffset),
    .io_out_2_bits_bpuInfo_meta_valid(renameStage_io_out_2_bits_bpuInfo_meta_valid),
    .io_out_2_bits_bpuInfo_meta_btbHit(renameStage_io_out_2_bits_bpuInfo_meta_btbHit),
    .io_out_2_bits_bpuInfo_meta_btbIsJalr(renameStage_io_out_2_bits_bpuInfo_meta_btbIsJalr),
    .io_out_2_bits_bpuInfo_meta_btbIsJal(renameStage_io_out_2_bits_bpuInfo_meta_btbIsJal),
    .io_out_2_bits_bpuInfo_meta_btbIsCall(renameStage_io_out_2_bits_bpuInfo_meta_btbIsCall),
    .io_out_2_bits_bpuInfo_meta_btbIsRet(renameStage_io_out_2_bits_bpuInfo_meta_btbIsRet),
    .io_out_2_bits_bpuInfo_meta_btbOffset(renameStage_io_out_2_bits_bpuInfo_meta_btbOffset),
    .io_out_2_bits_bpuInfo_meta_phtCounter(renameStage_io_out_2_bits_bpuInfo_meta_phtCounter),
    .io_out_2_bits_bpuInfo_meta_rasTop(renameStage_io_out_2_bits_bpuInfo_meta_rasTop),
    .io_out_2_bits_bpuInfo_meta_predTaken(renameStage_io_out_2_bits_bpuInfo_meta_predTaken),
    .io_out_2_bits_bpuInfo_meta_predTarget(renameStage_io_out_2_bits_bpuInfo_meta_predTarget),
    .io_out_2_bits_ldst(renameStage_io_out_2_bits_ldst),
    .io_out_2_bits_lrs1(renameStage_io_out_2_bits_lrs1),
    .io_out_2_bits_lrs2(renameStage_io_out_2_bits_lrs2),
    .io_out_2_bits_pdst(renameStage_io_out_2_bits_pdst),
    .io_out_2_bits_prs1(renameStage_io_out_2_bits_prs1),
    .io_out_2_bits_prs2(renameStage_io_out_2_bits_prs2),
    .io_out_2_bits_oldPdst(renameStage_io_out_2_bits_oldPdst),
    .io_out_2_bits_snptId_valid(renameStage_io_out_2_bits_snptId_valid),
    .io_out_2_bits_snptId_bits(renameStage_io_out_2_bits_snptId_bits),
    .io_out_2_bits_rs1Valid(renameStage_io_out_2_bits_rs1Valid),
    .io_out_2_bits_rs2Valid(renameStage_io_out_2_bits_rs2Valid),
    .io_out_2_bits_rdValid(renameStage_io_out_2_bits_rdValid),
    .io_out_2_bits_robIdx_value(renameStage_io_out_2_bits_robIdx_value),
    .io_out_2_bits_robIdx_flag(renameStage_io_out_2_bits_robIdx_flag),
    .io_archCommit_0_valid(renameStage_io_archCommit_0_valid),
    .io_archCommit_0_isWalk(renameStage_io_archCommit_0_isWalk),
    .io_archCommit_0_ldst(renameStage_io_archCommit_0_ldst),
    .io_archCommit_0_pdst(renameStage_io_archCommit_0_pdst),
    .io_archCommit_0_rfWen(renameStage_io_archCommit_0_rfWen),
    .io_archCommit_1_valid(renameStage_io_archCommit_1_valid),
    .io_archCommit_1_isWalk(renameStage_io_archCommit_1_isWalk),
    .io_archCommit_1_ldst(renameStage_io_archCommit_1_ldst),
    .io_archCommit_1_pdst(renameStage_io_archCommit_1_pdst),
    .io_archCommit_1_rfWen(renameStage_io_archCommit_1_rfWen),
    .io_archCommit_2_valid(renameStage_io_archCommit_2_valid),
    .io_archCommit_2_isWalk(renameStage_io_archCommit_2_isWalk),
    .io_archCommit_2_ldst(renameStage_io_archCommit_2_ldst),
    .io_archCommit_2_pdst(renameStage_io_archCommit_2_pdst),
    .io_archCommit_2_rfWen(renameStage_io_archCommit_2_rfWen),
    .io_redirectInfo_valid(renameStage_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(renameStage_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_fromBru(renameStage_io_redirectInfo_bits_fromBru),
    .io_redirectInfo_bits_snptId(renameStage_io_redirectInfo_bits_snptId),
    .io_redirectInfo_bits_robIdx_value(renameStage_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(renameStage_io_redirectInfo_bits_robIdx_flag),
    .io_redirectInfo_bits_fromRob(renameStage_io_redirectInfo_bits_fromRob),
    .io_stall(renameStage_io_stall)
  );
  RedirectController redirectController ( // @[src/main/scala/backend/CtrlBlock.scala 78:34]
    .clock(redirectController_clock),
    .reset(redirectController_reset),
    .io_bruRedirect_valid(redirectController_io_bruRedirect_valid),
    .io_bruRedirect_bits_doRedirect(redirectController_io_bruRedirect_bits_doRedirect),
    .io_bruRedirect_bits_snptId(redirectController_io_bruRedirect_bits_snptId),
    .io_bruRedirect_bits_robIdx_value(redirectController_io_bruRedirect_bits_robIdx_value),
    .io_bruRedirect_bits_robIdx_flag(redirectController_io_bruRedirect_bits_robIdx_flag),
    .io_bruRedirect_bits_target(redirectController_io_bruRedirect_bits_target),
    .io_robRedirect_valid(redirectController_io_robRedirect_valid),
    .io_robRedirect_robIdx_value(redirectController_io_robRedirect_robIdx_value),
    .io_robRedirect_robIdx_flag(redirectController_io_robRedirect_robIdx_flag),
    .io_robRedirect_isException(redirectController_io_robRedirect_isException),
    .io_robRedirect_excp_excpVec(redirectController_io_robRedirect_excp_excpVec),
    .io_robRedirect_pc(redirectController_io_robRedirect_pc),
    .io_robRedirect_excpVaddr(redirectController_io_robRedirect_excpVaddr),
    .io_robRollbackDone(redirectController_io_robRollbackDone),
    .io_redirectInfo_valid(redirectController_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(redirectController_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_flushSelf(redirectController_io_redirectInfo_bits_flushSelf),
    .io_redirectInfo_bits_fromBru(redirectController_io_redirectInfo_bits_fromBru),
    .io_redirectInfo_bits_snptId(redirectController_io_redirectInfo_bits_snptId),
    .io_redirectInfo_bits_robIdx_value(redirectController_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(redirectController_io_redirectInfo_bits_robIdx_flag),
    .io_redirectInfo_bits_fromRob(redirectController_io_redirectInfo_bits_fromRob),
    .io_redirectInfo_bits_target(redirectController_io_redirectInfo_bits_target),
    .io_robRedirectPause(redirectController_io_robRedirectPause),
    .io_robNeedRollback(redirectController_io_robNeedRollback),
    .io_excpEvent_excp(redirectController_io_excpEvent_excp),
    .io_excpEvent_ertn(redirectController_io_excpEvent_ertn),
    .io_excpInfo_vaddrError(redirectController_io_excpInfo_vaddrError),
    .io_excpInfo_era(redirectController_io_excpInfo_era),
    .io_excpInfo_ecode(redirectController_io_excpInfo_ecode),
    .io_excpInfo_badVaddr(redirectController_io_excpInfo_badVaddr),
    .io_redirectAddrFromCsr_eentry(redirectController_io_redirectAddrFromCsr_eentry),
    .io_redirectAddrFromCsr_era(redirectController_io_redirectAddrFromCsr_era)
  );
  DispatchStage dispatchStage ( // @[src/main/scala/backend/CtrlBlock.scala 79:29]
    .clock(dispatchStage_clock),
    .reset(dispatchStage_reset),
    .io_in_0_ready(dispatchStage_io_in_0_ready),
    .io_in_0_valid(dispatchStage_io_in_0_valid),
    .io_in_0_bits_pc(dispatchStage_io_in_0_bits_pc),
    .io_in_0_bits_inst(dispatchStage_io_in_0_bits_inst),
    .io_in_0_bits_ctrl_fuType(dispatchStage_io_in_0_bits_ctrl_fuType),
    .io_in_0_bits_ctrl_aluOp(dispatchStage_io_in_0_bits_ctrl_aluOp),
    .io_in_0_bits_ctrl_bruOp(dispatchStage_io_in_0_bits_ctrl_bruOp),
    .io_in_0_bits_ctrl_lsuOp(dispatchStage_io_in_0_bits_ctrl_lsuOp),
    .io_in_0_bits_ctrl_csrOp(dispatchStage_io_in_0_bits_ctrl_csrOp),
    .io_in_0_bits_ctrl_mulOp(dispatchStage_io_in_0_bits_ctrl_mulOp),
    .io_in_0_bits_ctrl_divOp(dispatchStage_io_in_0_bits_ctrl_divOp),
    .io_in_0_bits_ctrl_src1Type(dispatchStage_io_in_0_bits_ctrl_src1Type),
    .io_in_0_bits_ctrl_src2Type(dispatchStage_io_in_0_bits_ctrl_src2Type),
    .io_in_0_bits_ctrl_immType(dispatchStage_io_in_0_bits_ctrl_immType),
    .io_in_0_bits_ctrl_rfWen(dispatchStage_io_in_0_bits_ctrl_rfWen),
    .io_in_0_bits_ctrl_memRead(dispatchStage_io_in_0_bits_ctrl_memRead),
    .io_in_0_bits_ctrl_memWrite(dispatchStage_io_in_0_bits_ctrl_memWrite),
    .io_in_0_bits_ctrl_csrWen(dispatchStage_io_in_0_bits_ctrl_csrWen),
    .io_in_0_bits_ctrl_isBranch(dispatchStage_io_in_0_bits_ctrl_isBranch),
    .io_in_0_bits_ctrl_isJump(dispatchStage_io_in_0_bits_ctrl_isJump),
    .io_in_0_bits_ctrl_isPriv(dispatchStage_io_in_0_bits_ctrl_isPriv),
    .io_in_0_bits_excp_excpVec(dispatchStage_io_in_0_bits_excp_excpVec),
    .io_in_0_bits_imm(dispatchStage_io_in_0_bits_imm),
    .io_in_0_bits_csrAddress(dispatchStage_io_in_0_bits_csrAddress),
    .io_in_0_bits_pdInfo_valid(dispatchStage_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(dispatchStage_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(dispatchStage_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(dispatchStage_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(dispatchStage_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(dispatchStage_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(dispatchStage_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_bpuInfo_pc(dispatchStage_io_in_0_bits_bpuInfo_pc),
    .io_in_0_bits_bpuInfo_fallThrough(dispatchStage_io_in_0_bits_bpuInfo_fallThrough),
    .io_in_0_bits_bpuInfo_taken(dispatchStage_io_in_0_bits_bpuInfo_taken),
    .io_in_0_bits_bpuInfo_target(dispatchStage_io_in_0_bits_bpuInfo_target),
    .io_in_0_bits_bpuInfo_takenOffset(dispatchStage_io_in_0_bits_bpuInfo_takenOffset),
    .io_in_0_bits_bpuInfo_meta_valid(dispatchStage_io_in_0_bits_bpuInfo_meta_valid),
    .io_in_0_bits_bpuInfo_meta_btbHit(dispatchStage_io_in_0_bits_bpuInfo_meta_btbHit),
    .io_in_0_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsJalr),
    .io_in_0_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsJal),
    .io_in_0_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsCall),
    .io_in_0_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsRet),
    .io_in_0_bits_bpuInfo_meta_btbOffset(dispatchStage_io_in_0_bits_bpuInfo_meta_btbOffset),
    .io_in_0_bits_bpuInfo_meta_phtCounter(dispatchStage_io_in_0_bits_bpuInfo_meta_phtCounter),
    .io_in_0_bits_bpuInfo_meta_rasTop(dispatchStage_io_in_0_bits_bpuInfo_meta_rasTop),
    .io_in_0_bits_bpuInfo_meta_predTaken(dispatchStage_io_in_0_bits_bpuInfo_meta_predTaken),
    .io_in_0_bits_bpuInfo_meta_predTarget(dispatchStage_io_in_0_bits_bpuInfo_meta_predTarget),
    .io_in_0_bits_ldst(dispatchStage_io_in_0_bits_ldst),
    .io_in_0_bits_lrs1(dispatchStage_io_in_0_bits_lrs1),
    .io_in_0_bits_lrs2(dispatchStage_io_in_0_bits_lrs2),
    .io_in_0_bits_pdst(dispatchStage_io_in_0_bits_pdst),
    .io_in_0_bits_prs1(dispatchStage_io_in_0_bits_prs1),
    .io_in_0_bits_prs2(dispatchStage_io_in_0_bits_prs2),
    .io_in_0_bits_oldPdst(dispatchStage_io_in_0_bits_oldPdst),
    .io_in_0_bits_snptId_valid(dispatchStage_io_in_0_bits_snptId_valid),
    .io_in_0_bits_snptId_bits(dispatchStage_io_in_0_bits_snptId_bits),
    .io_in_0_bits_rs1Valid(dispatchStage_io_in_0_bits_rs1Valid),
    .io_in_0_bits_rs2Valid(dispatchStage_io_in_0_bits_rs2Valid),
    .io_in_0_bits_rdValid(dispatchStage_io_in_0_bits_rdValid),
    .io_in_0_bits_robIdx_value(dispatchStage_io_in_0_bits_robIdx_value),
    .io_in_0_bits_robIdx_flag(dispatchStage_io_in_0_bits_robIdx_flag),
    .io_in_1_ready(dispatchStage_io_in_1_ready),
    .io_in_1_valid(dispatchStage_io_in_1_valid),
    .io_in_1_bits_pc(dispatchStage_io_in_1_bits_pc),
    .io_in_1_bits_inst(dispatchStage_io_in_1_bits_inst),
    .io_in_1_bits_ctrl_fuType(dispatchStage_io_in_1_bits_ctrl_fuType),
    .io_in_1_bits_ctrl_aluOp(dispatchStage_io_in_1_bits_ctrl_aluOp),
    .io_in_1_bits_ctrl_bruOp(dispatchStage_io_in_1_bits_ctrl_bruOp),
    .io_in_1_bits_ctrl_lsuOp(dispatchStage_io_in_1_bits_ctrl_lsuOp),
    .io_in_1_bits_ctrl_csrOp(dispatchStage_io_in_1_bits_ctrl_csrOp),
    .io_in_1_bits_ctrl_mulOp(dispatchStage_io_in_1_bits_ctrl_mulOp),
    .io_in_1_bits_ctrl_divOp(dispatchStage_io_in_1_bits_ctrl_divOp),
    .io_in_1_bits_ctrl_src1Type(dispatchStage_io_in_1_bits_ctrl_src1Type),
    .io_in_1_bits_ctrl_src2Type(dispatchStage_io_in_1_bits_ctrl_src2Type),
    .io_in_1_bits_ctrl_immType(dispatchStage_io_in_1_bits_ctrl_immType),
    .io_in_1_bits_ctrl_rfWen(dispatchStage_io_in_1_bits_ctrl_rfWen),
    .io_in_1_bits_ctrl_memRead(dispatchStage_io_in_1_bits_ctrl_memRead),
    .io_in_1_bits_ctrl_memWrite(dispatchStage_io_in_1_bits_ctrl_memWrite),
    .io_in_1_bits_ctrl_csrWen(dispatchStage_io_in_1_bits_ctrl_csrWen),
    .io_in_1_bits_ctrl_isBranch(dispatchStage_io_in_1_bits_ctrl_isBranch),
    .io_in_1_bits_ctrl_isJump(dispatchStage_io_in_1_bits_ctrl_isJump),
    .io_in_1_bits_ctrl_isPriv(dispatchStage_io_in_1_bits_ctrl_isPriv),
    .io_in_1_bits_excp_excpVec(dispatchStage_io_in_1_bits_excp_excpVec),
    .io_in_1_bits_imm(dispatchStage_io_in_1_bits_imm),
    .io_in_1_bits_csrAddress(dispatchStage_io_in_1_bits_csrAddress),
    .io_in_1_bits_pdInfo_valid(dispatchStage_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(dispatchStage_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(dispatchStage_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(dispatchStage_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(dispatchStage_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(dispatchStage_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(dispatchStage_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_bpuInfo_pc(dispatchStage_io_in_1_bits_bpuInfo_pc),
    .io_in_1_bits_bpuInfo_fallThrough(dispatchStage_io_in_1_bits_bpuInfo_fallThrough),
    .io_in_1_bits_bpuInfo_taken(dispatchStage_io_in_1_bits_bpuInfo_taken),
    .io_in_1_bits_bpuInfo_target(dispatchStage_io_in_1_bits_bpuInfo_target),
    .io_in_1_bits_bpuInfo_takenOffset(dispatchStage_io_in_1_bits_bpuInfo_takenOffset),
    .io_in_1_bits_bpuInfo_meta_valid(dispatchStage_io_in_1_bits_bpuInfo_meta_valid),
    .io_in_1_bits_bpuInfo_meta_btbHit(dispatchStage_io_in_1_bits_bpuInfo_meta_btbHit),
    .io_in_1_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsJalr),
    .io_in_1_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsJal),
    .io_in_1_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsCall),
    .io_in_1_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsRet),
    .io_in_1_bits_bpuInfo_meta_btbOffset(dispatchStage_io_in_1_bits_bpuInfo_meta_btbOffset),
    .io_in_1_bits_bpuInfo_meta_phtCounter(dispatchStage_io_in_1_bits_bpuInfo_meta_phtCounter),
    .io_in_1_bits_bpuInfo_meta_rasTop(dispatchStage_io_in_1_bits_bpuInfo_meta_rasTop),
    .io_in_1_bits_bpuInfo_meta_predTaken(dispatchStage_io_in_1_bits_bpuInfo_meta_predTaken),
    .io_in_1_bits_bpuInfo_meta_predTarget(dispatchStage_io_in_1_bits_bpuInfo_meta_predTarget),
    .io_in_1_bits_ldst(dispatchStage_io_in_1_bits_ldst),
    .io_in_1_bits_lrs1(dispatchStage_io_in_1_bits_lrs1),
    .io_in_1_bits_lrs2(dispatchStage_io_in_1_bits_lrs2),
    .io_in_1_bits_pdst(dispatchStage_io_in_1_bits_pdst),
    .io_in_1_bits_prs1(dispatchStage_io_in_1_bits_prs1),
    .io_in_1_bits_prs2(dispatchStage_io_in_1_bits_prs2),
    .io_in_1_bits_oldPdst(dispatchStage_io_in_1_bits_oldPdst),
    .io_in_1_bits_snptId_valid(dispatchStage_io_in_1_bits_snptId_valid),
    .io_in_1_bits_snptId_bits(dispatchStage_io_in_1_bits_snptId_bits),
    .io_in_1_bits_rs1Valid(dispatchStage_io_in_1_bits_rs1Valid),
    .io_in_1_bits_rs2Valid(dispatchStage_io_in_1_bits_rs2Valid),
    .io_in_1_bits_rdValid(dispatchStage_io_in_1_bits_rdValid),
    .io_in_1_bits_robIdx_value(dispatchStage_io_in_1_bits_robIdx_value),
    .io_in_1_bits_robIdx_flag(dispatchStage_io_in_1_bits_robIdx_flag),
    .io_in_2_ready(dispatchStage_io_in_2_ready),
    .io_in_2_valid(dispatchStage_io_in_2_valid),
    .io_in_2_bits_pc(dispatchStage_io_in_2_bits_pc),
    .io_in_2_bits_inst(dispatchStage_io_in_2_bits_inst),
    .io_in_2_bits_ctrl_fuType(dispatchStage_io_in_2_bits_ctrl_fuType),
    .io_in_2_bits_ctrl_aluOp(dispatchStage_io_in_2_bits_ctrl_aluOp),
    .io_in_2_bits_ctrl_bruOp(dispatchStage_io_in_2_bits_ctrl_bruOp),
    .io_in_2_bits_ctrl_lsuOp(dispatchStage_io_in_2_bits_ctrl_lsuOp),
    .io_in_2_bits_ctrl_csrOp(dispatchStage_io_in_2_bits_ctrl_csrOp),
    .io_in_2_bits_ctrl_mulOp(dispatchStage_io_in_2_bits_ctrl_mulOp),
    .io_in_2_bits_ctrl_divOp(dispatchStage_io_in_2_bits_ctrl_divOp),
    .io_in_2_bits_ctrl_src1Type(dispatchStage_io_in_2_bits_ctrl_src1Type),
    .io_in_2_bits_ctrl_src2Type(dispatchStage_io_in_2_bits_ctrl_src2Type),
    .io_in_2_bits_ctrl_immType(dispatchStage_io_in_2_bits_ctrl_immType),
    .io_in_2_bits_ctrl_rfWen(dispatchStage_io_in_2_bits_ctrl_rfWen),
    .io_in_2_bits_ctrl_memRead(dispatchStage_io_in_2_bits_ctrl_memRead),
    .io_in_2_bits_ctrl_memWrite(dispatchStage_io_in_2_bits_ctrl_memWrite),
    .io_in_2_bits_ctrl_csrWen(dispatchStage_io_in_2_bits_ctrl_csrWen),
    .io_in_2_bits_ctrl_isBranch(dispatchStage_io_in_2_bits_ctrl_isBranch),
    .io_in_2_bits_ctrl_isJump(dispatchStage_io_in_2_bits_ctrl_isJump),
    .io_in_2_bits_ctrl_isPriv(dispatchStage_io_in_2_bits_ctrl_isPriv),
    .io_in_2_bits_excp_excpVec(dispatchStage_io_in_2_bits_excp_excpVec),
    .io_in_2_bits_imm(dispatchStage_io_in_2_bits_imm),
    .io_in_2_bits_csrAddress(dispatchStage_io_in_2_bits_csrAddress),
    .io_in_2_bits_pdInfo_valid(dispatchStage_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(dispatchStage_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(dispatchStage_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(dispatchStage_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(dispatchStage_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(dispatchStage_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(dispatchStage_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_bpuInfo_pc(dispatchStage_io_in_2_bits_bpuInfo_pc),
    .io_in_2_bits_bpuInfo_fallThrough(dispatchStage_io_in_2_bits_bpuInfo_fallThrough),
    .io_in_2_bits_bpuInfo_taken(dispatchStage_io_in_2_bits_bpuInfo_taken),
    .io_in_2_bits_bpuInfo_target(dispatchStage_io_in_2_bits_bpuInfo_target),
    .io_in_2_bits_bpuInfo_takenOffset(dispatchStage_io_in_2_bits_bpuInfo_takenOffset),
    .io_in_2_bits_bpuInfo_meta_valid(dispatchStage_io_in_2_bits_bpuInfo_meta_valid),
    .io_in_2_bits_bpuInfo_meta_btbHit(dispatchStage_io_in_2_bits_bpuInfo_meta_btbHit),
    .io_in_2_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsJalr),
    .io_in_2_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsJal),
    .io_in_2_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsCall),
    .io_in_2_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsRet),
    .io_in_2_bits_bpuInfo_meta_btbOffset(dispatchStage_io_in_2_bits_bpuInfo_meta_btbOffset),
    .io_in_2_bits_bpuInfo_meta_phtCounter(dispatchStage_io_in_2_bits_bpuInfo_meta_phtCounter),
    .io_in_2_bits_bpuInfo_meta_rasTop(dispatchStage_io_in_2_bits_bpuInfo_meta_rasTop),
    .io_in_2_bits_bpuInfo_meta_predTaken(dispatchStage_io_in_2_bits_bpuInfo_meta_predTaken),
    .io_in_2_bits_bpuInfo_meta_predTarget(dispatchStage_io_in_2_bits_bpuInfo_meta_predTarget),
    .io_in_2_bits_ldst(dispatchStage_io_in_2_bits_ldst),
    .io_in_2_bits_lrs1(dispatchStage_io_in_2_bits_lrs1),
    .io_in_2_bits_lrs2(dispatchStage_io_in_2_bits_lrs2),
    .io_in_2_bits_pdst(dispatchStage_io_in_2_bits_pdst),
    .io_in_2_bits_prs1(dispatchStage_io_in_2_bits_prs1),
    .io_in_2_bits_prs2(dispatchStage_io_in_2_bits_prs2),
    .io_in_2_bits_oldPdst(dispatchStage_io_in_2_bits_oldPdst),
    .io_in_2_bits_snptId_valid(dispatchStage_io_in_2_bits_snptId_valid),
    .io_in_2_bits_snptId_bits(dispatchStage_io_in_2_bits_snptId_bits),
    .io_in_2_bits_rs1Valid(dispatchStage_io_in_2_bits_rs1Valid),
    .io_in_2_bits_rs2Valid(dispatchStage_io_in_2_bits_rs2Valid),
    .io_in_2_bits_rdValid(dispatchStage_io_in_2_bits_rdValid),
    .io_in_2_bits_robIdx_value(dispatchStage_io_in_2_bits_robIdx_value),
    .io_in_2_bits_robIdx_flag(dispatchStage_io_in_2_bits_robIdx_flag),
    .io_q1IQEnq_0_valid(dispatchStage_io_q1IQEnq_0_valid),
    .io_q1IQEnq_0_bits_pc(dispatchStage_io_q1IQEnq_0_bits_pc),
    .io_q1IQEnq_0_bits_inst(dispatchStage_io_q1IQEnq_0_bits_inst),
    .io_q1IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q1IQEnq_0_bits_ctrl_fuType),
    .io_q1IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_aluOp),
    .io_q1IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_bruOp),
    .io_q1IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_lsuOp),
    .io_q1IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_csrOp),
    .io_q1IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_mulOp),
    .io_q1IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q1IQEnq_0_bits_ctrl_divOp),
    .io_q1IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q1IQEnq_0_bits_ctrl_src1Type),
    .io_q1IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q1IQEnq_0_bits_ctrl_src2Type),
    .io_q1IQEnq_0_bits_ctrl_immType(dispatchStage_io_q1IQEnq_0_bits_ctrl_immType),
    .io_q1IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q1IQEnq_0_bits_ctrl_rfWen),
    .io_q1IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q1IQEnq_0_bits_ctrl_memRead),
    .io_q1IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q1IQEnq_0_bits_ctrl_memWrite),
    .io_q1IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q1IQEnq_0_bits_ctrl_csrWen),
    .io_q1IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q1IQEnq_0_bits_ctrl_isBranch),
    .io_q1IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q1IQEnq_0_bits_ctrl_isJump),
    .io_q1IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q1IQEnq_0_bits_ctrl_isPriv),
    .io_q1IQEnq_0_bits_excp_excpVec(dispatchStage_io_q1IQEnq_0_bits_excp_excpVec),
    .io_q1IQEnq_0_bits_imm(dispatchStage_io_q1IQEnq_0_bits_imm),
    .io_q1IQEnq_0_bits_csrAddress(dispatchStage_io_q1IQEnq_0_bits_csrAddress),
    .io_q1IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q1IQEnq_0_bits_pdInfo_valid),
    .io_q1IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isBr),
    .io_q1IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJal),
    .io_q1IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJalr),
    .io_q1IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isCall),
    .io_q1IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q1IQEnq_0_bits_pdInfo_isRet),
    .io_q1IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q1IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q1IQEnq_0_bits_bpuInfo_pc(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_pc),
    .io_q1IQEnq_0_bits_bpuInfo_fallThrough(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q1IQEnq_0_bits_bpuInfo_taken(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_taken),
    .io_q1IQEnq_0_bits_bpuInfo_target(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_target),
    .io_q1IQEnq_0_bits_bpuInfo_takenOffset(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q1IQEnq_0_bits_bpuInfo_meta_valid(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbHit(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q1IQEnq_0_bits_bpuInfo_meta_rasTop(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q1IQEnq_0_bits_bpuInfo_meta_predTaken(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q1IQEnq_0_bits_bpuInfo_meta_predTarget(dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q1IQEnq_0_bits_ldst(dispatchStage_io_q1IQEnq_0_bits_ldst),
    .io_q1IQEnq_0_bits_lrs1(dispatchStage_io_q1IQEnq_0_bits_lrs1),
    .io_q1IQEnq_0_bits_lrs2(dispatchStage_io_q1IQEnq_0_bits_lrs2),
    .io_q1IQEnq_0_bits_pdst(dispatchStage_io_q1IQEnq_0_bits_pdst),
    .io_q1IQEnq_0_bits_prs1(dispatchStage_io_q1IQEnq_0_bits_prs1),
    .io_q1IQEnq_0_bits_prs2(dispatchStage_io_q1IQEnq_0_bits_prs2),
    .io_q1IQEnq_0_bits_oldPdst(dispatchStage_io_q1IQEnq_0_bits_oldPdst),
    .io_q1IQEnq_0_bits_rs1Valid(dispatchStage_io_q1IQEnq_0_bits_rs1Valid),
    .io_q1IQEnq_0_bits_rs2Valid(dispatchStage_io_q1IQEnq_0_bits_rs2Valid),
    .io_q1IQEnq_0_bits_rdValid(dispatchStage_io_q1IQEnq_0_bits_rdValid),
    .io_q1IQEnq_0_bits_snptId_valid(dispatchStage_io_q1IQEnq_0_bits_snptId_valid),
    .io_q1IQEnq_0_bits_snptId_bits(dispatchStage_io_q1IQEnq_0_bits_snptId_bits),
    .io_q1IQEnq_0_bits_robIdx_value(dispatchStage_io_q1IQEnq_0_bits_robIdx_value),
    .io_q1IQEnq_0_bits_robIdx_flag(dispatchStage_io_q1IQEnq_0_bits_robIdx_flag),
    .io_q1IQEnq_0_bits_robIdxFull_value(dispatchStage_io_q1IQEnq_0_bits_robIdxFull_value),
    .io_q1IQEnq_0_bits_robIdxFull_flag(dispatchStage_io_q1IQEnq_0_bits_robIdxFull_flag),
    .io_q1IQEnq_0_bits_prs1Busy(dispatchStage_io_q1IQEnq_0_bits_prs1Busy),
    .io_q1IQEnq_0_bits_prs2Busy(dispatchStage_io_q1IQEnq_0_bits_prs2Busy),
    .io_q2IQEnq_0_valid(dispatchStage_io_q2IQEnq_0_valid),
    .io_q2IQEnq_0_bits_pc(dispatchStage_io_q2IQEnq_0_bits_pc),
    .io_q2IQEnq_0_bits_inst(dispatchStage_io_q2IQEnq_0_bits_inst),
    .io_q2IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q2IQEnq_0_bits_ctrl_fuType),
    .io_q2IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_aluOp),
    .io_q2IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_bruOp),
    .io_q2IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_lsuOp),
    .io_q2IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_csrOp),
    .io_q2IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_mulOp),
    .io_q2IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q2IQEnq_0_bits_ctrl_divOp),
    .io_q2IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q2IQEnq_0_bits_ctrl_src1Type),
    .io_q2IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q2IQEnq_0_bits_ctrl_src2Type),
    .io_q2IQEnq_0_bits_ctrl_immType(dispatchStage_io_q2IQEnq_0_bits_ctrl_immType),
    .io_q2IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q2IQEnq_0_bits_ctrl_rfWen),
    .io_q2IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q2IQEnq_0_bits_ctrl_memRead),
    .io_q2IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q2IQEnq_0_bits_ctrl_memWrite),
    .io_q2IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q2IQEnq_0_bits_ctrl_csrWen),
    .io_q2IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q2IQEnq_0_bits_ctrl_isBranch),
    .io_q2IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q2IQEnq_0_bits_ctrl_isJump),
    .io_q2IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q2IQEnq_0_bits_ctrl_isPriv),
    .io_q2IQEnq_0_bits_excp_excpVec(dispatchStage_io_q2IQEnq_0_bits_excp_excpVec),
    .io_q2IQEnq_0_bits_imm(dispatchStage_io_q2IQEnq_0_bits_imm),
    .io_q2IQEnq_0_bits_csrAddress(dispatchStage_io_q2IQEnq_0_bits_csrAddress),
    .io_q2IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q2IQEnq_0_bits_pdInfo_valid),
    .io_q2IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isBr),
    .io_q2IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJal),
    .io_q2IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJalr),
    .io_q2IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isCall),
    .io_q2IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q2IQEnq_0_bits_pdInfo_isRet),
    .io_q2IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q2IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q2IQEnq_0_bits_bpuInfo_pc(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_pc),
    .io_q2IQEnq_0_bits_bpuInfo_fallThrough(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q2IQEnq_0_bits_bpuInfo_taken(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_taken),
    .io_q2IQEnq_0_bits_bpuInfo_target(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_target),
    .io_q2IQEnq_0_bits_bpuInfo_takenOffset(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q2IQEnq_0_bits_bpuInfo_meta_valid(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbHit(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q2IQEnq_0_bits_bpuInfo_meta_rasTop(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q2IQEnq_0_bits_bpuInfo_meta_predTaken(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q2IQEnq_0_bits_bpuInfo_meta_predTarget(dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q2IQEnq_0_bits_ldst(dispatchStage_io_q2IQEnq_0_bits_ldst),
    .io_q2IQEnq_0_bits_lrs1(dispatchStage_io_q2IQEnq_0_bits_lrs1),
    .io_q2IQEnq_0_bits_lrs2(dispatchStage_io_q2IQEnq_0_bits_lrs2),
    .io_q2IQEnq_0_bits_pdst(dispatchStage_io_q2IQEnq_0_bits_pdst),
    .io_q2IQEnq_0_bits_prs1(dispatchStage_io_q2IQEnq_0_bits_prs1),
    .io_q2IQEnq_0_bits_prs2(dispatchStage_io_q2IQEnq_0_bits_prs2),
    .io_q2IQEnq_0_bits_oldPdst(dispatchStage_io_q2IQEnq_0_bits_oldPdst),
    .io_q2IQEnq_0_bits_rs1Valid(dispatchStage_io_q2IQEnq_0_bits_rs1Valid),
    .io_q2IQEnq_0_bits_rs2Valid(dispatchStage_io_q2IQEnq_0_bits_rs2Valid),
    .io_q2IQEnq_0_bits_rdValid(dispatchStage_io_q2IQEnq_0_bits_rdValid),
    .io_q2IQEnq_0_bits_snptId_valid(dispatchStage_io_q2IQEnq_0_bits_snptId_valid),
    .io_q2IQEnq_0_bits_snptId_bits(dispatchStage_io_q2IQEnq_0_bits_snptId_bits),
    .io_q2IQEnq_0_bits_robIdx_value(dispatchStage_io_q2IQEnq_0_bits_robIdx_value),
    .io_q2IQEnq_0_bits_robIdx_flag(dispatchStage_io_q2IQEnq_0_bits_robIdx_flag),
    .io_q2IQEnq_0_bits_robIdxFull_value(dispatchStage_io_q2IQEnq_0_bits_robIdxFull_value),
    .io_q2IQEnq_0_bits_robIdxFull_flag(dispatchStage_io_q2IQEnq_0_bits_robIdxFull_flag),
    .io_q2IQEnq_0_bits_issueQueue(dispatchStage_io_q2IQEnq_0_bits_issueQueue),
    .io_q2IQEnq_0_bits_prs1Busy(dispatchStage_io_q2IQEnq_0_bits_prs1Busy),
    .io_q2IQEnq_0_bits_prs2Busy(dispatchStage_io_q2IQEnq_0_bits_prs2Busy),
    .io_q3IQEnq_0_valid(dispatchStage_io_q3IQEnq_0_valid),
    .io_q3IQEnq_0_bits_pc(dispatchStage_io_q3IQEnq_0_bits_pc),
    .io_q3IQEnq_0_bits_inst(dispatchStage_io_q3IQEnq_0_bits_inst),
    .io_q3IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q3IQEnq_0_bits_ctrl_fuType),
    .io_q3IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_aluOp),
    .io_q3IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_bruOp),
    .io_q3IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_lsuOp),
    .io_q3IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_csrOp),
    .io_q3IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_mulOp),
    .io_q3IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q3IQEnq_0_bits_ctrl_divOp),
    .io_q3IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q3IQEnq_0_bits_ctrl_src1Type),
    .io_q3IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q3IQEnq_0_bits_ctrl_src2Type),
    .io_q3IQEnq_0_bits_ctrl_immType(dispatchStage_io_q3IQEnq_0_bits_ctrl_immType),
    .io_q3IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q3IQEnq_0_bits_ctrl_rfWen),
    .io_q3IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q3IQEnq_0_bits_ctrl_memRead),
    .io_q3IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q3IQEnq_0_bits_ctrl_memWrite),
    .io_q3IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q3IQEnq_0_bits_ctrl_csrWen),
    .io_q3IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q3IQEnq_0_bits_ctrl_isBranch),
    .io_q3IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q3IQEnq_0_bits_ctrl_isJump),
    .io_q3IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q3IQEnq_0_bits_ctrl_isPriv),
    .io_q3IQEnq_0_bits_excp_excpVec(dispatchStage_io_q3IQEnq_0_bits_excp_excpVec),
    .io_q3IQEnq_0_bits_imm(dispatchStage_io_q3IQEnq_0_bits_imm),
    .io_q3IQEnq_0_bits_csrAddress(dispatchStage_io_q3IQEnq_0_bits_csrAddress),
    .io_q3IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q3IQEnq_0_bits_pdInfo_valid),
    .io_q3IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isBr),
    .io_q3IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJal),
    .io_q3IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJalr),
    .io_q3IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isCall),
    .io_q3IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q3IQEnq_0_bits_pdInfo_isRet),
    .io_q3IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q3IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q3IQEnq_0_bits_bpuInfo_pc(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_pc),
    .io_q3IQEnq_0_bits_bpuInfo_fallThrough(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q3IQEnq_0_bits_bpuInfo_taken(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_taken),
    .io_q3IQEnq_0_bits_bpuInfo_target(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_target),
    .io_q3IQEnq_0_bits_bpuInfo_takenOffset(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q3IQEnq_0_bits_bpuInfo_meta_valid(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbHit(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q3IQEnq_0_bits_bpuInfo_meta_rasTop(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q3IQEnq_0_bits_bpuInfo_meta_predTaken(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q3IQEnq_0_bits_bpuInfo_meta_predTarget(dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q3IQEnq_0_bits_ldst(dispatchStage_io_q3IQEnq_0_bits_ldst),
    .io_q3IQEnq_0_bits_lrs1(dispatchStage_io_q3IQEnq_0_bits_lrs1),
    .io_q3IQEnq_0_bits_lrs2(dispatchStage_io_q3IQEnq_0_bits_lrs2),
    .io_q3IQEnq_0_bits_pdst(dispatchStage_io_q3IQEnq_0_bits_pdst),
    .io_q3IQEnq_0_bits_prs1(dispatchStage_io_q3IQEnq_0_bits_prs1),
    .io_q3IQEnq_0_bits_prs2(dispatchStage_io_q3IQEnq_0_bits_prs2),
    .io_q3IQEnq_0_bits_oldPdst(dispatchStage_io_q3IQEnq_0_bits_oldPdst),
    .io_q3IQEnq_0_bits_rs1Valid(dispatchStage_io_q3IQEnq_0_bits_rs1Valid),
    .io_q3IQEnq_0_bits_rs2Valid(dispatchStage_io_q3IQEnq_0_bits_rs2Valid),
    .io_q3IQEnq_0_bits_rdValid(dispatchStage_io_q3IQEnq_0_bits_rdValid),
    .io_q3IQEnq_0_bits_snptId_valid(dispatchStage_io_q3IQEnq_0_bits_snptId_valid),
    .io_q3IQEnq_0_bits_snptId_bits(dispatchStage_io_q3IQEnq_0_bits_snptId_bits),
    .io_q3IQEnq_0_bits_robIdx_value(dispatchStage_io_q3IQEnq_0_bits_robIdx_value),
    .io_q3IQEnq_0_bits_robIdx_flag(dispatchStage_io_q3IQEnq_0_bits_robIdx_flag),
    .io_q3IQEnq_0_bits_robIdxFull_value(dispatchStage_io_q3IQEnq_0_bits_robIdxFull_value),
    .io_q3IQEnq_0_bits_robIdxFull_flag(dispatchStage_io_q3IQEnq_0_bits_robIdxFull_flag),
    .io_q3IQEnq_0_bits_issueQueue(dispatchStage_io_q3IQEnq_0_bits_issueQueue),
    .io_q3IQEnq_0_bits_prs1Busy(dispatchStage_io_q3IQEnq_0_bits_prs1Busy),
    .io_q3IQEnq_0_bits_prs2Busy(dispatchStage_io_q3IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_valid(dispatchStage_io_q4IQEnq_0_valid),
    .io_q4IQEnq_0_bits_pc(dispatchStage_io_q4IQEnq_0_bits_pc),
    .io_q4IQEnq_0_bits_inst(dispatchStage_io_q4IQEnq_0_bits_inst),
    .io_q4IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q4IQEnq_0_bits_ctrl_fuType),
    .io_q4IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_aluOp),
    .io_q4IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_bruOp),
    .io_q4IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_lsuOp),
    .io_q4IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_csrOp),
    .io_q4IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_mulOp),
    .io_q4IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q4IQEnq_0_bits_ctrl_divOp),
    .io_q4IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q4IQEnq_0_bits_ctrl_src1Type),
    .io_q4IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q4IQEnq_0_bits_ctrl_src2Type),
    .io_q4IQEnq_0_bits_ctrl_immType(dispatchStage_io_q4IQEnq_0_bits_ctrl_immType),
    .io_q4IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q4IQEnq_0_bits_ctrl_rfWen),
    .io_q4IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q4IQEnq_0_bits_ctrl_memRead),
    .io_q4IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q4IQEnq_0_bits_ctrl_memWrite),
    .io_q4IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q4IQEnq_0_bits_ctrl_csrWen),
    .io_q4IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q4IQEnq_0_bits_ctrl_isBranch),
    .io_q4IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q4IQEnq_0_bits_ctrl_isJump),
    .io_q4IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q4IQEnq_0_bits_ctrl_isPriv),
    .io_q4IQEnq_0_bits_excp_excpVec(dispatchStage_io_q4IQEnq_0_bits_excp_excpVec),
    .io_q4IQEnq_0_bits_imm(dispatchStage_io_q4IQEnq_0_bits_imm),
    .io_q4IQEnq_0_bits_csrAddress(dispatchStage_io_q4IQEnq_0_bits_csrAddress),
    .io_q4IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q4IQEnq_0_bits_pdInfo_valid),
    .io_q4IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isBr),
    .io_q4IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJal),
    .io_q4IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJalr),
    .io_q4IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isCall),
    .io_q4IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q4IQEnq_0_bits_pdInfo_isRet),
    .io_q4IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q4IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q4IQEnq_0_bits_bpuInfo_pc(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_pc),
    .io_q4IQEnq_0_bits_bpuInfo_fallThrough(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q4IQEnq_0_bits_bpuInfo_taken(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_taken),
    .io_q4IQEnq_0_bits_bpuInfo_target(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_target),
    .io_q4IQEnq_0_bits_bpuInfo_takenOffset(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q4IQEnq_0_bits_bpuInfo_meta_valid(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbHit(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q4IQEnq_0_bits_bpuInfo_meta_rasTop(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q4IQEnq_0_bits_bpuInfo_meta_predTaken(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q4IQEnq_0_bits_bpuInfo_meta_predTarget(dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q4IQEnq_0_bits_ldst(dispatchStage_io_q4IQEnq_0_bits_ldst),
    .io_q4IQEnq_0_bits_lrs1(dispatchStage_io_q4IQEnq_0_bits_lrs1),
    .io_q4IQEnq_0_bits_lrs2(dispatchStage_io_q4IQEnq_0_bits_lrs2),
    .io_q4IQEnq_0_bits_pdst(dispatchStage_io_q4IQEnq_0_bits_pdst),
    .io_q4IQEnq_0_bits_prs1(dispatchStage_io_q4IQEnq_0_bits_prs1),
    .io_q4IQEnq_0_bits_prs2(dispatchStage_io_q4IQEnq_0_bits_prs2),
    .io_q4IQEnq_0_bits_oldPdst(dispatchStage_io_q4IQEnq_0_bits_oldPdst),
    .io_q4IQEnq_0_bits_rs1Valid(dispatchStage_io_q4IQEnq_0_bits_rs1Valid),
    .io_q4IQEnq_0_bits_rs2Valid(dispatchStage_io_q4IQEnq_0_bits_rs2Valid),
    .io_q4IQEnq_0_bits_rdValid(dispatchStage_io_q4IQEnq_0_bits_rdValid),
    .io_q4IQEnq_0_bits_snptId_valid(dispatchStage_io_q4IQEnq_0_bits_snptId_valid),
    .io_q4IQEnq_0_bits_snptId_bits(dispatchStage_io_q4IQEnq_0_bits_snptId_bits),
    .io_q4IQEnq_0_bits_robIdx_value(dispatchStage_io_q4IQEnq_0_bits_robIdx_value),
    .io_q4IQEnq_0_bits_robIdx_flag(dispatchStage_io_q4IQEnq_0_bits_robIdx_flag),
    .io_q4IQEnq_0_bits_robIdxFull_value(dispatchStage_io_q4IQEnq_0_bits_robIdxFull_value),
    .io_q4IQEnq_0_bits_robIdxFull_flag(dispatchStage_io_q4IQEnq_0_bits_robIdxFull_flag),
    .io_q4IQEnq_0_bits_lqIdx_value(dispatchStage_io_q4IQEnq_0_bits_lqIdx_value),
    .io_q4IQEnq_0_bits_lqIdx_flag(dispatchStage_io_q4IQEnq_0_bits_lqIdx_flag),
    .io_q4IQEnq_0_bits_sqIdx_value(dispatchStage_io_q4IQEnq_0_bits_sqIdx_value),
    .io_q4IQEnq_0_bits_sqIdx_flag(dispatchStage_io_q4IQEnq_0_bits_sqIdx_flag),
    .io_q4IQEnq_0_bits_issueQueue(dispatchStage_io_q4IQEnq_0_bits_issueQueue),
    .io_q4IQEnq_0_bits_prs1Busy(dispatchStage_io_q4IQEnq_0_bits_prs1Busy),
    .io_q4IQEnq_0_bits_prs2Busy(dispatchStage_io_q4IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_bits_isSta(dispatchStage_io_q4IQEnq_0_bits_isSta),
    .io_q4IQEnq_0_bits_isStd(dispatchStage_io_q4IQEnq_0_bits_isStd),
    .io_q5IQEnq_0_valid(dispatchStage_io_q5IQEnq_0_valid),
    .io_q5IQEnq_0_bits_pc(dispatchStage_io_q5IQEnq_0_bits_pc),
    .io_q5IQEnq_0_bits_inst(dispatchStage_io_q5IQEnq_0_bits_inst),
    .io_q5IQEnq_0_bits_ctrl_fuType(dispatchStage_io_q5IQEnq_0_bits_ctrl_fuType),
    .io_q5IQEnq_0_bits_ctrl_aluOp(dispatchStage_io_q5IQEnq_0_bits_ctrl_aluOp),
    .io_q5IQEnq_0_bits_ctrl_bruOp(dispatchStage_io_q5IQEnq_0_bits_ctrl_bruOp),
    .io_q5IQEnq_0_bits_ctrl_lsuOp(dispatchStage_io_q5IQEnq_0_bits_ctrl_lsuOp),
    .io_q5IQEnq_0_bits_ctrl_csrOp(dispatchStage_io_q5IQEnq_0_bits_ctrl_csrOp),
    .io_q5IQEnq_0_bits_ctrl_mulOp(dispatchStage_io_q5IQEnq_0_bits_ctrl_mulOp),
    .io_q5IQEnq_0_bits_ctrl_divOp(dispatchStage_io_q5IQEnq_0_bits_ctrl_divOp),
    .io_q5IQEnq_0_bits_ctrl_src1Type(dispatchStage_io_q5IQEnq_0_bits_ctrl_src1Type),
    .io_q5IQEnq_0_bits_ctrl_src2Type(dispatchStage_io_q5IQEnq_0_bits_ctrl_src2Type),
    .io_q5IQEnq_0_bits_ctrl_immType(dispatchStage_io_q5IQEnq_0_bits_ctrl_immType),
    .io_q5IQEnq_0_bits_ctrl_rfWen(dispatchStage_io_q5IQEnq_0_bits_ctrl_rfWen),
    .io_q5IQEnq_0_bits_ctrl_memRead(dispatchStage_io_q5IQEnq_0_bits_ctrl_memRead),
    .io_q5IQEnq_0_bits_ctrl_memWrite(dispatchStage_io_q5IQEnq_0_bits_ctrl_memWrite),
    .io_q5IQEnq_0_bits_ctrl_csrWen(dispatchStage_io_q5IQEnq_0_bits_ctrl_csrWen),
    .io_q5IQEnq_0_bits_ctrl_isBranch(dispatchStage_io_q5IQEnq_0_bits_ctrl_isBranch),
    .io_q5IQEnq_0_bits_ctrl_isJump(dispatchStage_io_q5IQEnq_0_bits_ctrl_isJump),
    .io_q5IQEnq_0_bits_ctrl_isPriv(dispatchStage_io_q5IQEnq_0_bits_ctrl_isPriv),
    .io_q5IQEnq_0_bits_excp_excpVec(dispatchStage_io_q5IQEnq_0_bits_excp_excpVec),
    .io_q5IQEnq_0_bits_imm(dispatchStage_io_q5IQEnq_0_bits_imm),
    .io_q5IQEnq_0_bits_csrAddress(dispatchStage_io_q5IQEnq_0_bits_csrAddress),
    .io_q5IQEnq_0_bits_pdInfo_valid(dispatchStage_io_q5IQEnq_0_bits_pdInfo_valid),
    .io_q5IQEnq_0_bits_pdInfo_isBr(dispatchStage_io_q5IQEnq_0_bits_pdInfo_isBr),
    .io_q5IQEnq_0_bits_pdInfo_isJal(dispatchStage_io_q5IQEnq_0_bits_pdInfo_isJal),
    .io_q5IQEnq_0_bits_pdInfo_isJalr(dispatchStage_io_q5IQEnq_0_bits_pdInfo_isJalr),
    .io_q5IQEnq_0_bits_pdInfo_isCall(dispatchStage_io_q5IQEnq_0_bits_pdInfo_isCall),
    .io_q5IQEnq_0_bits_pdInfo_isRet(dispatchStage_io_q5IQEnq_0_bits_pdInfo_isRet),
    .io_q5IQEnq_0_bits_pdInfo_jumpTarget(dispatchStage_io_q5IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q5IQEnq_0_bits_bpuInfo_pc(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_pc),
    .io_q5IQEnq_0_bits_bpuInfo_fallThrough(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q5IQEnq_0_bits_bpuInfo_taken(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_taken),
    .io_q5IQEnq_0_bits_bpuInfo_target(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_target),
    .io_q5IQEnq_0_bits_bpuInfo_takenOffset(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q5IQEnq_0_bits_bpuInfo_meta_valid(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbHit(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q5IQEnq_0_bits_bpuInfo_meta_rasTop(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q5IQEnq_0_bits_bpuInfo_meta_predTaken(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q5IQEnq_0_bits_bpuInfo_meta_predTarget(dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q5IQEnq_0_bits_ldst(dispatchStage_io_q5IQEnq_0_bits_ldst),
    .io_q5IQEnq_0_bits_lrs1(dispatchStage_io_q5IQEnq_0_bits_lrs1),
    .io_q5IQEnq_0_bits_lrs2(dispatchStage_io_q5IQEnq_0_bits_lrs2),
    .io_q5IQEnq_0_bits_pdst(dispatchStage_io_q5IQEnq_0_bits_pdst),
    .io_q5IQEnq_0_bits_prs1(dispatchStage_io_q5IQEnq_0_bits_prs1),
    .io_q5IQEnq_0_bits_prs2(dispatchStage_io_q5IQEnq_0_bits_prs2),
    .io_q5IQEnq_0_bits_oldPdst(dispatchStage_io_q5IQEnq_0_bits_oldPdst),
    .io_q5IQEnq_0_bits_rs1Valid(dispatchStage_io_q5IQEnq_0_bits_rs1Valid),
    .io_q5IQEnq_0_bits_rs2Valid(dispatchStage_io_q5IQEnq_0_bits_rs2Valid),
    .io_q5IQEnq_0_bits_rdValid(dispatchStage_io_q5IQEnq_0_bits_rdValid),
    .io_q5IQEnq_0_bits_snptId_valid(dispatchStage_io_q5IQEnq_0_bits_snptId_valid),
    .io_q5IQEnq_0_bits_snptId_bits(dispatchStage_io_q5IQEnq_0_bits_snptId_bits),
    .io_q5IQEnq_0_bits_robIdx_value(dispatchStage_io_q5IQEnq_0_bits_robIdx_value),
    .io_q5IQEnq_0_bits_robIdx_flag(dispatchStage_io_q5IQEnq_0_bits_robIdx_flag),
    .io_q5IQEnq_0_bits_robIdxFull_value(dispatchStage_io_q5IQEnq_0_bits_robIdxFull_value),
    .io_q5IQEnq_0_bits_robIdxFull_flag(dispatchStage_io_q5IQEnq_0_bits_robIdxFull_flag),
    .io_q5IQEnq_0_bits_lqIdx_value(dispatchStage_io_q5IQEnq_0_bits_lqIdx_value),
    .io_q5IQEnq_0_bits_lqIdx_flag(dispatchStage_io_q5IQEnq_0_bits_lqIdx_flag),
    .io_q5IQEnq_0_bits_sqIdx_value(dispatchStage_io_q5IQEnq_0_bits_sqIdx_value),
    .io_q5IQEnq_0_bits_sqIdx_flag(dispatchStage_io_q5IQEnq_0_bits_sqIdx_flag),
    .io_q5IQEnq_0_bits_issueQueue(dispatchStage_io_q5IQEnq_0_bits_issueQueue),
    .io_q5IQEnq_0_bits_prs1Busy(dispatchStage_io_q5IQEnq_0_bits_prs1Busy),
    .io_q5IQEnq_0_bits_prs2Busy(dispatchStage_io_q5IQEnq_0_bits_prs2Busy),
    .io_q5IQEnq_0_bits_isSta(dispatchStage_io_q5IQEnq_0_bits_isSta),
    .io_q5IQEnq_0_bits_isStd(dispatchStage_io_q5IQEnq_0_bits_isStd),
    .io_iqFeedback_q1FreeEntries(dispatchStage_io_iqFeedback_q1FreeEntries),
    .io_iqFeedback_q2FreeEntries(dispatchStage_io_iqFeedback_q2FreeEntries),
    .io_iqFeedback_q3FreeEntries(dispatchStage_io_iqFeedback_q3FreeEntries),
    .io_iqFeedback_q4FreeEntries(dispatchStage_io_iqFeedback_q4FreeEntries),
    .io_iqFeedback_q5FreeEntries(dispatchStage_io_iqFeedback_q5FreeEntries),
    .io_lsEnq_req_valid(dispatchStage_io_lsEnq_req_valid),
    .io_lsEnq_req_bits_robIdx_value(dispatchStage_io_lsEnq_req_bits_robIdx_value),
    .io_lsEnq_req_bits_robIdx_flag(dispatchStage_io_lsEnq_req_bits_robIdx_flag),
    .io_lsEnq_req_bits_isLoad(dispatchStage_io_lsEnq_req_bits_isLoad),
    .io_lsEnq_req_bits_isStore(dispatchStage_io_lsEnq_req_bits_isStore),
    .io_lsEnq_req_bits_sqIdx_value(dispatchStage_io_lsEnq_req_bits_sqIdx_value),
    .io_lsEnq_req_bits_sqIdx_flag(dispatchStage_io_lsEnq_req_bits_sqIdx_flag),
    .io_lsEnq_req_bits_lqIdx_value(dispatchStage_io_lsEnq_req_bits_lqIdx_value),
    .io_lsEnq_req_bits_lqIdx_flag(dispatchStage_io_lsEnq_req_bits_lqIdx_flag),
    .io_lsEnq_toLsqData_pc(dispatchStage_io_lsEnq_toLsqData_pc),
    .io_lsEnq_toLsqData_inst(dispatchStage_io_lsEnq_toLsqData_inst),
    .io_lsEnq_toLsqData_ctrl_fuType(dispatchStage_io_lsEnq_toLsqData_ctrl_fuType),
    .io_lsEnq_toLsqData_ctrl_aluOp(dispatchStage_io_lsEnq_toLsqData_ctrl_aluOp),
    .io_lsEnq_toLsqData_ctrl_bruOp(dispatchStage_io_lsEnq_toLsqData_ctrl_bruOp),
    .io_lsEnq_toLsqData_ctrl_lsuOp(dispatchStage_io_lsEnq_toLsqData_ctrl_lsuOp),
    .io_lsEnq_toLsqData_ctrl_csrOp(dispatchStage_io_lsEnq_toLsqData_ctrl_csrOp),
    .io_lsEnq_toLsqData_ctrl_mulOp(dispatchStage_io_lsEnq_toLsqData_ctrl_mulOp),
    .io_lsEnq_toLsqData_ctrl_divOp(dispatchStage_io_lsEnq_toLsqData_ctrl_divOp),
    .io_lsEnq_toLsqData_ctrl_src1Type(dispatchStage_io_lsEnq_toLsqData_ctrl_src1Type),
    .io_lsEnq_toLsqData_ctrl_src2Type(dispatchStage_io_lsEnq_toLsqData_ctrl_src2Type),
    .io_lsEnq_toLsqData_ctrl_immType(dispatchStage_io_lsEnq_toLsqData_ctrl_immType),
    .io_lsEnq_toLsqData_ctrl_rfWen(dispatchStage_io_lsEnq_toLsqData_ctrl_rfWen),
    .io_lsEnq_toLsqData_ctrl_memRead(dispatchStage_io_lsEnq_toLsqData_ctrl_memRead),
    .io_lsEnq_toLsqData_ctrl_memWrite(dispatchStage_io_lsEnq_toLsqData_ctrl_memWrite),
    .io_lsEnq_toLsqData_ctrl_csrWen(dispatchStage_io_lsEnq_toLsqData_ctrl_csrWen),
    .io_lsEnq_toLsqData_ctrl_isBranch(dispatchStage_io_lsEnq_toLsqData_ctrl_isBranch),
    .io_lsEnq_toLsqData_ctrl_isJump(dispatchStage_io_lsEnq_toLsqData_ctrl_isJump),
    .io_lsEnq_toLsqData_ctrl_isPriv(dispatchStage_io_lsEnq_toLsqData_ctrl_isPriv),
    .io_lsEnq_toLsqData_excp_excpVec(dispatchStage_io_lsEnq_toLsqData_excp_excpVec),
    .io_lsEnq_toLsqData_imm(dispatchStage_io_lsEnq_toLsqData_imm),
    .io_lsEnq_toLsqData_csrAddress(dispatchStage_io_lsEnq_toLsqData_csrAddress),
    .io_lsEnq_toLsqData_pdInfo_valid(dispatchStage_io_lsEnq_toLsqData_pdInfo_valid),
    .io_lsEnq_toLsqData_pdInfo_isBr(dispatchStage_io_lsEnq_toLsqData_pdInfo_isBr),
    .io_lsEnq_toLsqData_pdInfo_isJal(dispatchStage_io_lsEnq_toLsqData_pdInfo_isJal),
    .io_lsEnq_toLsqData_pdInfo_isJalr(dispatchStage_io_lsEnq_toLsqData_pdInfo_isJalr),
    .io_lsEnq_toLsqData_pdInfo_isCall(dispatchStage_io_lsEnq_toLsqData_pdInfo_isCall),
    .io_lsEnq_toLsqData_pdInfo_isRet(dispatchStage_io_lsEnq_toLsqData_pdInfo_isRet),
    .io_lsEnq_toLsqData_pdInfo_jumpTarget(dispatchStage_io_lsEnq_toLsqData_pdInfo_jumpTarget),
    .io_lsEnq_toLsqData_bpuInfo_pc(dispatchStage_io_lsEnq_toLsqData_bpuInfo_pc),
    .io_lsEnq_toLsqData_bpuInfo_fallThrough(dispatchStage_io_lsEnq_toLsqData_bpuInfo_fallThrough),
    .io_lsEnq_toLsqData_bpuInfo_taken(dispatchStage_io_lsEnq_toLsqData_bpuInfo_taken),
    .io_lsEnq_toLsqData_bpuInfo_target(dispatchStage_io_lsEnq_toLsqData_bpuInfo_target),
    .io_lsEnq_toLsqData_bpuInfo_takenOffset(dispatchStage_io_lsEnq_toLsqData_bpuInfo_takenOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_valid(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_valid),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbHit(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbHit),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbOffset(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_phtCounter(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter),
    .io_lsEnq_toLsqData_bpuInfo_meta_rasTop(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_rasTop),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTaken(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_predTaken),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTarget(dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_predTarget),
    .io_lsEnq_toLsqData_ldst(dispatchStage_io_lsEnq_toLsqData_ldst),
    .io_lsEnq_toLsqData_lrs1(dispatchStage_io_lsEnq_toLsqData_lrs1),
    .io_lsEnq_toLsqData_lrs2(dispatchStage_io_lsEnq_toLsqData_lrs2),
    .io_lsEnq_toLsqData_pdst(dispatchStage_io_lsEnq_toLsqData_pdst),
    .io_lsEnq_toLsqData_prs1(dispatchStage_io_lsEnq_toLsqData_prs1),
    .io_lsEnq_toLsqData_prs2(dispatchStage_io_lsEnq_toLsqData_prs2),
    .io_lsEnq_toLsqData_oldPdst(dispatchStage_io_lsEnq_toLsqData_oldPdst),
    .io_lsEnq_toLsqData_snptId_valid(dispatchStage_io_lsEnq_toLsqData_snptId_valid),
    .io_lsEnq_toLsqData_snptId_bits(dispatchStage_io_lsEnq_toLsqData_snptId_bits),
    .io_lsEnq_toLsqData_rs1Valid(dispatchStage_io_lsEnq_toLsqData_rs1Valid),
    .io_lsEnq_toLsqData_rs2Valid(dispatchStage_io_lsEnq_toLsqData_rs2Valid),
    .io_lsEnq_toLsqData_rdValid(dispatchStage_io_lsEnq_toLsqData_rdValid),
    .io_lsEnq_toLsqData_robIdx_value(dispatchStage_io_lsEnq_toLsqData_robIdx_value),
    .io_lsEnq_toLsqData_robIdx_flag(dispatchStage_io_lsEnq_toLsqData_robIdx_flag),
    .io_lsEnq_lqFull(dispatchStage_io_lsEnq_lqFull),
    .io_lsEnq_sqFull(dispatchStage_io_lsEnq_sqFull),
    .io_robEnq_valid_0(dispatchStage_io_robEnq_valid_0),
    .io_robEnq_valid_1(dispatchStage_io_robEnq_valid_1),
    .io_robEnq_valid_2(dispatchStage_io_robEnq_valid_2),
    .io_robEnq_valids_0(dispatchStage_io_robEnq_valids_0),
    .io_robEnq_valids_1(dispatchStage_io_robEnq_valids_1),
    .io_robEnq_valids_2(dispatchStage_io_robEnq_valids_2),
    .io_robEnq_bits_0_pc(dispatchStage_io_robEnq_bits_0_pc),
    .io_robEnq_bits_0_inst(dispatchStage_io_robEnq_bits_0_inst),
    .io_robEnq_bits_0_fuType(dispatchStage_io_robEnq_bits_0_fuType),
    .io_robEnq_bits_0_pdst(dispatchStage_io_robEnq_bits_0_pdst),
    .io_robEnq_bits_0_oldPdst(dispatchStage_io_robEnq_bits_0_oldPdst),
    .io_robEnq_bits_0_ldst(dispatchStage_io_robEnq_bits_0_ldst),
    .io_robEnq_bits_0_rfWen(dispatchStage_io_robEnq_bits_0_rfWen),
    .io_robEnq_bits_0_memRead(dispatchStage_io_robEnq_bits_0_memRead),
    .io_robEnq_bits_0_memWrite(dispatchStage_io_robEnq_bits_0_memWrite),
    .io_robEnq_bits_0_csrWen(dispatchStage_io_robEnq_bits_0_csrWen),
    .io_robEnq_bits_0_csrOp(dispatchStage_io_robEnq_bits_0_csrOp),
    .io_robEnq_bits_0_csrWaddr(dispatchStage_io_robEnq_bits_0_csrWaddr),
    .io_robEnq_bits_0_isPriv(dispatchStage_io_robEnq_bits_0_isPriv),
    .io_robEnq_bits_0_excp_excpVec(dispatchStage_io_robEnq_bits_0_excp_excpVec),
    .io_robEnq_bits_1_pc(dispatchStage_io_robEnq_bits_1_pc),
    .io_robEnq_bits_1_inst(dispatchStage_io_robEnq_bits_1_inst),
    .io_robEnq_bits_1_fuType(dispatchStage_io_robEnq_bits_1_fuType),
    .io_robEnq_bits_1_pdst(dispatchStage_io_robEnq_bits_1_pdst),
    .io_robEnq_bits_1_oldPdst(dispatchStage_io_robEnq_bits_1_oldPdst),
    .io_robEnq_bits_1_ldst(dispatchStage_io_robEnq_bits_1_ldst),
    .io_robEnq_bits_1_rfWen(dispatchStage_io_robEnq_bits_1_rfWen),
    .io_robEnq_bits_1_memRead(dispatchStage_io_robEnq_bits_1_memRead),
    .io_robEnq_bits_1_memWrite(dispatchStage_io_robEnq_bits_1_memWrite),
    .io_robEnq_bits_1_csrWen(dispatchStage_io_robEnq_bits_1_csrWen),
    .io_robEnq_bits_1_csrOp(dispatchStage_io_robEnq_bits_1_csrOp),
    .io_robEnq_bits_1_csrWaddr(dispatchStage_io_robEnq_bits_1_csrWaddr),
    .io_robEnq_bits_1_isPriv(dispatchStage_io_robEnq_bits_1_isPriv),
    .io_robEnq_bits_1_excp_excpVec(dispatchStage_io_robEnq_bits_1_excp_excpVec),
    .io_robEnq_bits_2_pc(dispatchStage_io_robEnq_bits_2_pc),
    .io_robEnq_bits_2_inst(dispatchStage_io_robEnq_bits_2_inst),
    .io_robEnq_bits_2_fuType(dispatchStage_io_robEnq_bits_2_fuType),
    .io_robEnq_bits_2_pdst(dispatchStage_io_robEnq_bits_2_pdst),
    .io_robEnq_bits_2_oldPdst(dispatchStage_io_robEnq_bits_2_oldPdst),
    .io_robEnq_bits_2_ldst(dispatchStage_io_robEnq_bits_2_ldst),
    .io_robEnq_bits_2_rfWen(dispatchStage_io_robEnq_bits_2_rfWen),
    .io_robEnq_bits_2_memRead(dispatchStage_io_robEnq_bits_2_memRead),
    .io_robEnq_bits_2_memWrite(dispatchStage_io_robEnq_bits_2_memWrite),
    .io_robEnq_bits_2_csrWen(dispatchStage_io_robEnq_bits_2_csrWen),
    .io_robEnq_bits_2_csrOp(dispatchStage_io_robEnq_bits_2_csrOp),
    .io_robEnq_bits_2_csrWaddr(dispatchStage_io_robEnq_bits_2_csrWaddr),
    .io_robEnq_bits_2_isPriv(dispatchStage_io_robEnq_bits_2_isPriv),
    .io_robEnq_bits_2_excp_excpVec(dispatchStage_io_robEnq_bits_2_excp_excpVec),
    .io_robEnq_canEnq(dispatchStage_io_robEnq_canEnq),
    .io_robEnq_full(dispatchStage_io_robEnq_full),
    .io_flush(dispatchStage_io_flush),
    .io_redirectInfo_valid(dispatchStage_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(dispatchStage_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(dispatchStage_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(dispatchStage_io_redirectInfo_bits_robIdx_flag),
    .io_stall(dispatchStage_io_stall),
    .io_wakeupPorts_0_valid(dispatchStage_io_wakeupPorts_0_valid),
    .io_wakeupPorts_0_bits_pdst(dispatchStage_io_wakeupPorts_0_bits_pdst),
    .io_wakeupPorts_1_valid(dispatchStage_io_wakeupPorts_1_valid),
    .io_wakeupPorts_1_bits_pdst(dispatchStage_io_wakeupPorts_1_bits_pdst),
    .io_wakeupPorts_2_valid(dispatchStage_io_wakeupPorts_2_valid),
    .io_wakeupPorts_2_bits_pdst(dispatchStage_io_wakeupPorts_2_bits_pdst),
    .io_wakeupPorts_3_valid(dispatchStage_io_wakeupPorts_3_valid),
    .io_wakeupPorts_3_bits_pdst(dispatchStage_io_wakeupPorts_3_bits_pdst),
    .io_wakeupPorts_4_valid(dispatchStage_io_wakeupPorts_4_valid),
    .io_wakeupPorts_4_bits_pdst(dispatchStage_io_wakeupPorts_4_bits_pdst)
  );
  ROB rob ( // @[src/main/scala/backend/CtrlBlock.scala 80:19]
    .clock(rob_clock),
    .reset(rob_reset),
    .io_enq_valid_0(rob_io_enq_valid_0),
    .io_enq_valid_1(rob_io_enq_valid_1),
    .io_enq_valid_2(rob_io_enq_valid_2),
    .io_enq_valids_0(rob_io_enq_valids_0),
    .io_enq_valids_1(rob_io_enq_valids_1),
    .io_enq_valids_2(rob_io_enq_valids_2),
    .io_enq_bits_0_pc(rob_io_enq_bits_0_pc),
    .io_enq_bits_0_inst(rob_io_enq_bits_0_inst),
    .io_enq_bits_0_fuType(rob_io_enq_bits_0_fuType),
    .io_enq_bits_0_pdst(rob_io_enq_bits_0_pdst),
    .io_enq_bits_0_oldPdst(rob_io_enq_bits_0_oldPdst),
    .io_enq_bits_0_ldst(rob_io_enq_bits_0_ldst),
    .io_enq_bits_0_rfWen(rob_io_enq_bits_0_rfWen),
    .io_enq_bits_0_memRead(rob_io_enq_bits_0_memRead),
    .io_enq_bits_0_memWrite(rob_io_enq_bits_0_memWrite),
    .io_enq_bits_0_csrWen(rob_io_enq_bits_0_csrWen),
    .io_enq_bits_0_csrOp(rob_io_enq_bits_0_csrOp),
    .io_enq_bits_0_csrWaddr(rob_io_enq_bits_0_csrWaddr),
    .io_enq_bits_0_isPriv(rob_io_enq_bits_0_isPriv),
    .io_enq_bits_0_excp_excpVec(rob_io_enq_bits_0_excp_excpVec),
    .io_enq_bits_1_pc(rob_io_enq_bits_1_pc),
    .io_enq_bits_1_inst(rob_io_enq_bits_1_inst),
    .io_enq_bits_1_fuType(rob_io_enq_bits_1_fuType),
    .io_enq_bits_1_pdst(rob_io_enq_bits_1_pdst),
    .io_enq_bits_1_oldPdst(rob_io_enq_bits_1_oldPdst),
    .io_enq_bits_1_ldst(rob_io_enq_bits_1_ldst),
    .io_enq_bits_1_rfWen(rob_io_enq_bits_1_rfWen),
    .io_enq_bits_1_memRead(rob_io_enq_bits_1_memRead),
    .io_enq_bits_1_memWrite(rob_io_enq_bits_1_memWrite),
    .io_enq_bits_1_csrWen(rob_io_enq_bits_1_csrWen),
    .io_enq_bits_1_csrOp(rob_io_enq_bits_1_csrOp),
    .io_enq_bits_1_csrWaddr(rob_io_enq_bits_1_csrWaddr),
    .io_enq_bits_1_isPriv(rob_io_enq_bits_1_isPriv),
    .io_enq_bits_1_excp_excpVec(rob_io_enq_bits_1_excp_excpVec),
    .io_enq_bits_2_pc(rob_io_enq_bits_2_pc),
    .io_enq_bits_2_inst(rob_io_enq_bits_2_inst),
    .io_enq_bits_2_fuType(rob_io_enq_bits_2_fuType),
    .io_enq_bits_2_pdst(rob_io_enq_bits_2_pdst),
    .io_enq_bits_2_oldPdst(rob_io_enq_bits_2_oldPdst),
    .io_enq_bits_2_ldst(rob_io_enq_bits_2_ldst),
    .io_enq_bits_2_rfWen(rob_io_enq_bits_2_rfWen),
    .io_enq_bits_2_memRead(rob_io_enq_bits_2_memRead),
    .io_enq_bits_2_memWrite(rob_io_enq_bits_2_memWrite),
    .io_enq_bits_2_csrWen(rob_io_enq_bits_2_csrWen),
    .io_enq_bits_2_csrOp(rob_io_enq_bits_2_csrOp),
    .io_enq_bits_2_csrWaddr(rob_io_enq_bits_2_csrWaddr),
    .io_enq_bits_2_isPriv(rob_io_enq_bits_2_isPriv),
    .io_enq_bits_2_excp_excpVec(rob_io_enq_bits_2_excp_excpVec),
    .io_enq_canEnq(rob_io_enq_canEnq),
    .io_enq_full(rob_io_enq_full),
    .io_commitToSq_valid_0(rob_io_commitToSq_valid_0),
    .io_commitToSq_valid_1(rob_io_commitToSq_valid_1),
    .io_commitToSq_valid_2(rob_io_commitToSq_valid_2),
    .io_commitToSq_bits_0_sqIdx_value(rob_io_commitToSq_bits_0_sqIdx_value),
    .io_commitToSq_bits_1_sqIdx_value(rob_io_commitToSq_bits_1_sqIdx_value),
    .io_commitToSq_bits_2_sqIdx_value(rob_io_commitToSq_bits_2_sqIdx_value),
    .io_commitToCsr_csrWen(rob_io_commitToCsr_csrWen),
    .io_commitToCsr_csrWaddr(rob_io_commitToCsr_csrWaddr),
    .io_commitToCsr_csrWdata(rob_io_commitToCsr_csrWdata),
    .io_writeback_0_valid(rob_io_writeback_0_valid),
    .io_writeback_0_bits_robIdx_value(rob_io_writeback_0_bits_robIdx_value),
    .io_writeback_0_bits_sqIdx_value(rob_io_writeback_0_bits_sqIdx_value),
    .io_writeback_0_bits_sqIdx_flag(rob_io_writeback_0_bits_sqIdx_flag),
    .io_writeback_0_bits_isMemWrite(rob_io_writeback_0_bits_isMemWrite),
    .io_writeback_0_bits_isMemRead(rob_io_writeback_0_bits_isMemRead),
    .io_writeback_0_bits_memValid(rob_io_writeback_0_bits_memValid),
    .io_writeback_0_bits_memVaddr(rob_io_writeback_0_bits_memVaddr),
    .io_writeback_0_bits_memPaddr(rob_io_writeback_0_bits_memPaddr),
    .io_writeback_0_bits_memStoreData(rob_io_writeback_0_bits_memStoreData),
    .io_writeback_0_bits_rfdata(rob_io_writeback_0_bits_rfdata),
    .io_writeback_0_bits_csrWdata(rob_io_writeback_0_bits_csrWdata),
    .io_writeback_0_bits_csrTimer(rob_io_writeback_0_bits_csrTimer),
    .io_writeback_0_bits_excp_excpVec(rob_io_writeback_0_bits_excp_excpVec),
    .io_writeback_1_valid(rob_io_writeback_1_valid),
    .io_writeback_1_bits_robIdx_value(rob_io_writeback_1_bits_robIdx_value),
    .io_writeback_1_bits_sqIdx_value(rob_io_writeback_1_bits_sqIdx_value),
    .io_writeback_1_bits_sqIdx_flag(rob_io_writeback_1_bits_sqIdx_flag),
    .io_writeback_1_bits_isMemWrite(rob_io_writeback_1_bits_isMemWrite),
    .io_writeback_1_bits_isMemRead(rob_io_writeback_1_bits_isMemRead),
    .io_writeback_1_bits_memValid(rob_io_writeback_1_bits_memValid),
    .io_writeback_1_bits_memVaddr(rob_io_writeback_1_bits_memVaddr),
    .io_writeback_1_bits_memPaddr(rob_io_writeback_1_bits_memPaddr),
    .io_writeback_1_bits_memStoreData(rob_io_writeback_1_bits_memStoreData),
    .io_writeback_1_bits_rfdata(rob_io_writeback_1_bits_rfdata),
    .io_writeback_1_bits_csrWdata(rob_io_writeback_1_bits_csrWdata),
    .io_writeback_1_bits_csrTimer(rob_io_writeback_1_bits_csrTimer),
    .io_writeback_1_bits_excp_excpVec(rob_io_writeback_1_bits_excp_excpVec),
    .io_writeback_2_valid(rob_io_writeback_2_valid),
    .io_writeback_2_bits_robIdx_value(rob_io_writeback_2_bits_robIdx_value),
    .io_writeback_2_bits_sqIdx_value(rob_io_writeback_2_bits_sqIdx_value),
    .io_writeback_2_bits_sqIdx_flag(rob_io_writeback_2_bits_sqIdx_flag),
    .io_writeback_2_bits_isMemWrite(rob_io_writeback_2_bits_isMemWrite),
    .io_writeback_2_bits_isMemRead(rob_io_writeback_2_bits_isMemRead),
    .io_writeback_2_bits_memValid(rob_io_writeback_2_bits_memValid),
    .io_writeback_2_bits_memVaddr(rob_io_writeback_2_bits_memVaddr),
    .io_writeback_2_bits_memPaddr(rob_io_writeback_2_bits_memPaddr),
    .io_writeback_2_bits_memStoreData(rob_io_writeback_2_bits_memStoreData),
    .io_writeback_2_bits_rfdata(rob_io_writeback_2_bits_rfdata),
    .io_writeback_2_bits_csrWdata(rob_io_writeback_2_bits_csrWdata),
    .io_writeback_2_bits_csrTimer(rob_io_writeback_2_bits_csrTimer),
    .io_writeback_2_bits_excp_excpVec(rob_io_writeback_2_bits_excp_excpVec),
    .io_writeback_3_valid(rob_io_writeback_3_valid),
    .io_writeback_3_bits_robIdx_value(rob_io_writeback_3_bits_robIdx_value),
    .io_writeback_3_bits_sqIdx_value(rob_io_writeback_3_bits_sqIdx_value),
    .io_writeback_3_bits_sqIdx_flag(rob_io_writeback_3_bits_sqIdx_flag),
    .io_writeback_3_bits_isMemWrite(rob_io_writeback_3_bits_isMemWrite),
    .io_writeback_3_bits_isMemRead(rob_io_writeback_3_bits_isMemRead),
    .io_writeback_3_bits_memValid(rob_io_writeback_3_bits_memValid),
    .io_writeback_3_bits_memVaddr(rob_io_writeback_3_bits_memVaddr),
    .io_writeback_3_bits_memPaddr(rob_io_writeback_3_bits_memPaddr),
    .io_writeback_3_bits_memStoreData(rob_io_writeback_3_bits_memStoreData),
    .io_writeback_3_bits_rfdata(rob_io_writeback_3_bits_rfdata),
    .io_writeback_3_bits_csrWdata(rob_io_writeback_3_bits_csrWdata),
    .io_writeback_3_bits_csrTimer(rob_io_writeback_3_bits_csrTimer),
    .io_writeback_3_bits_excp_excpVec(rob_io_writeback_3_bits_excp_excpVec),
    .io_writeback_4_valid(rob_io_writeback_4_valid),
    .io_writeback_4_bits_robIdx_value(rob_io_writeback_4_bits_robIdx_value),
    .io_writeback_4_bits_sqIdx_value(rob_io_writeback_4_bits_sqIdx_value),
    .io_writeback_4_bits_sqIdx_flag(rob_io_writeback_4_bits_sqIdx_flag),
    .io_writeback_4_bits_isMemWrite(rob_io_writeback_4_bits_isMemWrite),
    .io_writeback_4_bits_isMemRead(rob_io_writeback_4_bits_isMemRead),
    .io_writeback_4_bits_memValid(rob_io_writeback_4_bits_memValid),
    .io_writeback_4_bits_memVaddr(rob_io_writeback_4_bits_memVaddr),
    .io_writeback_4_bits_memPaddr(rob_io_writeback_4_bits_memPaddr),
    .io_writeback_4_bits_memStoreData(rob_io_writeback_4_bits_memStoreData),
    .io_writeback_4_bits_rfdata(rob_io_writeback_4_bits_rfdata),
    .io_writeback_4_bits_csrWdata(rob_io_writeback_4_bits_csrWdata),
    .io_writeback_4_bits_csrTimer(rob_io_writeback_4_bits_csrTimer),
    .io_writeback_4_bits_excp_excpVec(rob_io_writeback_4_bits_excp_excpVec),
    .io_archCommit_0_valid(rob_io_archCommit_0_valid),
    .io_archCommit_0_isWalk(rob_io_archCommit_0_isWalk),
    .io_archCommit_0_ldst(rob_io_archCommit_0_ldst),
    .io_archCommit_0_pdst(rob_io_archCommit_0_pdst),
    .io_archCommit_0_rfWen(rob_io_archCommit_0_rfWen),
    .io_archCommit_1_valid(rob_io_archCommit_1_valid),
    .io_archCommit_1_isWalk(rob_io_archCommit_1_isWalk),
    .io_archCommit_1_ldst(rob_io_archCommit_1_ldst),
    .io_archCommit_1_pdst(rob_io_archCommit_1_pdst),
    .io_archCommit_1_rfWen(rob_io_archCommit_1_rfWen),
    .io_archCommit_2_valid(rob_io_archCommit_2_valid),
    .io_archCommit_2_isWalk(rob_io_archCommit_2_isWalk),
    .io_archCommit_2_ldst(rob_io_archCommit_2_ldst),
    .io_archCommit_2_pdst(rob_io_archCommit_2_pdst),
    .io_archCommit_2_rfWen(rob_io_archCommit_2_rfWen),
    .io_robRedirect_valid(rob_io_robRedirect_valid),
    .io_robRedirect_robIdx_value(rob_io_robRedirect_robIdx_value),
    .io_robRedirect_robIdx_flag(rob_io_robRedirect_robIdx_flag),
    .io_robRedirect_isException(rob_io_robRedirect_isException),
    .io_robRedirect_excp_excpVec(rob_io_robRedirect_excp_excpVec),
    .io_robRedirect_pc(rob_io_robRedirect_pc),
    .io_robRedirect_excpVaddr(rob_io_robRedirect_excpVaddr),
    .io_redirectInfo_valid(rob_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(rob_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_flushSelf(rob_io_redirectInfo_bits_flushSelf),
    .io_redirectInfo_bits_fromBru(rob_io_redirectInfo_bits_fromBru),
    .io_redirectInfo_bits_robIdx_value(rob_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(rob_io_redirectInfo_bits_robIdx_flag),
    .io_robPause(rob_io_robPause),
    .io_robNeedRollback(rob_io_robNeedRollback),
    .io_robRollbackDone(rob_io_robRollbackDone)
  );
  assign io_in_0_ready = decodeStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign io_in_1_ready = decodeStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign io_in_2_ready = decodeStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign io_q1IQEnq_0_valid = dispatchStage_io_q1IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pc = dispatchStage_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_inst = dispatchStage_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_immType = dispatchStage_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_excp_excpVec = dispatchStage_io_q1IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_imm = dispatchStage_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_csrAddress = dispatchStage_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_pc = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_fallThrough = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_taken = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_target = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_takenOffset = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_valid = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbHit = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_rasTop = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_predTaken = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_bpuInfo_meta_predTarget = dispatchStage_io_q1IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_ldst = dispatchStage_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_lrs1 = dispatchStage_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_lrs2 = dispatchStage_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_pdst = dispatchStage_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_prs1 = dispatchStage_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_prs2 = dispatchStage_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_oldPdst = dispatchStage_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_rs1Valid = dispatchStage_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_rs2Valid = dispatchStage_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_rdValid = dispatchStage_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_snptId_valid = dispatchStage_io_q1IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_snptId_bits = dispatchStage_io_q1IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_robIdx_value = dispatchStage_io_q1IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_robIdx_flag = dispatchStage_io_q1IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_robIdxFull_value = dispatchStage_io_q1IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_robIdxFull_flag = dispatchStage_io_q1IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_prs1Busy = dispatchStage_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q1IQEnq_0_bits_prs2Busy = dispatchStage_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 122:32]
  assign io_q2IQEnq_0_valid = dispatchStage_io_q2IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pc = dispatchStage_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_inst = dispatchStage_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_immType = dispatchStage_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_excp_excpVec = dispatchStage_io_q2IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_imm = dispatchStage_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_csrAddress = dispatchStage_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_pc = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_fallThrough = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_taken = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_target = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_takenOffset = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_valid = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbHit = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_rasTop = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_predTaken = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_bpuInfo_meta_predTarget = dispatchStage_io_q2IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_ldst = dispatchStage_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_lrs1 = dispatchStage_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_lrs2 = dispatchStage_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_pdst = dispatchStage_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_prs1 = dispatchStage_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_prs2 = dispatchStage_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_oldPdst = dispatchStage_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_rs1Valid = dispatchStage_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_rs2Valid = dispatchStage_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_rdValid = dispatchStage_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_snptId_valid = dispatchStage_io_q2IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_snptId_bits = dispatchStage_io_q2IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_robIdx_value = dispatchStage_io_q2IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_robIdx_flag = dispatchStage_io_q2IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_robIdxFull_value = dispatchStage_io_q2IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_robIdxFull_flag = dispatchStage_io_q2IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_issueQueue = dispatchStage_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_prs1Busy = dispatchStage_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q2IQEnq_0_bits_prs2Busy = dispatchStage_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 123:32]
  assign io_q3IQEnq_0_valid = dispatchStage_io_q3IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pc = dispatchStage_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_inst = dispatchStage_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_immType = dispatchStage_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_excp_excpVec = dispatchStage_io_q3IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_imm = dispatchStage_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_csrAddress = dispatchStage_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_pc = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_fallThrough = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_taken = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_target = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_takenOffset = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_valid = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbHit = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_rasTop = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_predTaken = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_bpuInfo_meta_predTarget = dispatchStage_io_q3IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_ldst = dispatchStage_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_lrs1 = dispatchStage_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_lrs2 = dispatchStage_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_pdst = dispatchStage_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_prs1 = dispatchStage_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_prs2 = dispatchStage_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_oldPdst = dispatchStage_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_rs1Valid = dispatchStage_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_rs2Valid = dispatchStage_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_rdValid = dispatchStage_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_snptId_valid = dispatchStage_io_q3IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_snptId_bits = dispatchStage_io_q3IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_robIdx_value = dispatchStage_io_q3IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_robIdx_flag = dispatchStage_io_q3IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_robIdxFull_value = dispatchStage_io_q3IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_robIdxFull_flag = dispatchStage_io_q3IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_issueQueue = dispatchStage_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_prs1Busy = dispatchStage_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q3IQEnq_0_bits_prs2Busy = dispatchStage_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 124:32]
  assign io_q4IQEnq_0_valid = dispatchStage_io_q4IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pc = dispatchStage_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_inst = dispatchStage_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_immType = dispatchStage_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_excp_excpVec = dispatchStage_io_q4IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_imm = dispatchStage_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_csrAddress = dispatchStage_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_pc = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_fallThrough = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_taken = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_target = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_takenOffset = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_valid = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbHit = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_rasTop = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_predTaken = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_bpuInfo_meta_predTarget = dispatchStage_io_q4IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_ldst = dispatchStage_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_lrs1 = dispatchStage_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_lrs2 = dispatchStage_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_pdst = dispatchStage_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_prs1 = dispatchStage_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_prs2 = dispatchStage_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_oldPdst = dispatchStage_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_rs1Valid = dispatchStage_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_rs2Valid = dispatchStage_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_rdValid = dispatchStage_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_snptId_valid = dispatchStage_io_q4IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_snptId_bits = dispatchStage_io_q4IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_robIdx_value = dispatchStage_io_q4IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_robIdx_flag = dispatchStage_io_q4IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_robIdxFull_value = dispatchStage_io_q4IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_robIdxFull_flag = dispatchStage_io_q4IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_lqIdx_value = dispatchStage_io_q4IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_lqIdx_flag = dispatchStage_io_q4IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_sqIdx_value = dispatchStage_io_q4IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_sqIdx_flag = dispatchStage_io_q4IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_issueQueue = dispatchStage_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_prs1Busy = dispatchStage_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_prs2Busy = dispatchStage_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_isSta = dispatchStage_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q4IQEnq_0_bits_isStd = dispatchStage_io_q4IQEnq_0_bits_isStd; // @[src/main/scala/backend/CtrlBlock.scala 125:32]
  assign io_q5IQEnq_0_valid = dispatchStage_io_q5IQEnq_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pc = dispatchStage_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_inst = dispatchStage_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_fuType = dispatchStage_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_aluOp = dispatchStage_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_bruOp = dispatchStage_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_lsuOp = dispatchStage_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_csrOp = dispatchStage_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_mulOp = dispatchStage_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_divOp = dispatchStage_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_src1Type = dispatchStage_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_src2Type = dispatchStage_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_immType = dispatchStage_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_rfWen = dispatchStage_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_memRead = dispatchStage_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_memWrite = dispatchStage_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_csrWen = dispatchStage_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_isBranch = dispatchStage_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_isJump = dispatchStage_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ctrl_isPriv = dispatchStage_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_excp_excpVec = dispatchStage_io_q5IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_imm = dispatchStage_io_q5IQEnq_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_csrAddress = dispatchStage_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdInfo_valid = dispatchStage_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdInfo_isBr = dispatchStage_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdInfo_isJal = dispatchStage_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdInfo_isJalr = dispatchStage_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdInfo_isCall = dispatchStage_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdInfo_isRet = dispatchStage_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdInfo_jumpTarget = dispatchStage_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_pc = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_fallThrough = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_taken = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_target = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_takenOffset = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_valid = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbHit = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_rasTop = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_predTaken = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_bpuInfo_meta_predTarget = dispatchStage_io_q5IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_ldst = dispatchStage_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_lrs1 = dispatchStage_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_lrs2 = dispatchStage_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_pdst = dispatchStage_io_q5IQEnq_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_prs1 = dispatchStage_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_prs2 = dispatchStage_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_oldPdst = dispatchStage_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_rs1Valid = dispatchStage_io_q5IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_rs2Valid = dispatchStage_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_rdValid = dispatchStage_io_q5IQEnq_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_snptId_valid = dispatchStage_io_q5IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_snptId_bits = dispatchStage_io_q5IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_robIdx_value = dispatchStage_io_q5IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_robIdx_flag = dispatchStage_io_q5IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_robIdxFull_value = dispatchStage_io_q5IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_robIdxFull_flag = dispatchStage_io_q5IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_lqIdx_value = dispatchStage_io_q5IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_lqIdx_flag = dispatchStage_io_q5IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_sqIdx_value = dispatchStage_io_q5IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_sqIdx_flag = dispatchStage_io_q5IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_issueQueue = dispatchStage_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_prs1Busy = dispatchStage_io_q5IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_prs2Busy = dispatchStage_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_isSta = dispatchStage_io_q5IQEnq_0_bits_isSta; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_q5IQEnq_0_bits_isStd = dispatchStage_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/CtrlBlock.scala 126:32]
  assign io_lsEnq_req_valid = dispatchStage_io_lsEnq_req_valid; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_robIdx_value = dispatchStage_io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_robIdx_flag = dispatchStage_io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_isLoad = dispatchStage_io_lsEnq_req_bits_isLoad; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_isStore = dispatchStage_io_lsEnq_req_bits_isStore; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_sqIdx_value = dispatchStage_io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_sqIdx_flag = dispatchStage_io_lsEnq_req_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_lqIdx_value = dispatchStage_io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_req_bits_lqIdx_flag = dispatchStage_io_lsEnq_req_bits_lqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pc = dispatchStage_io_lsEnq_toLsqData_pc; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_inst = dispatchStage_io_lsEnq_toLsqData_inst; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_fuType = dispatchStage_io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_aluOp = dispatchStage_io_lsEnq_toLsqData_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_bruOp = dispatchStage_io_lsEnq_toLsqData_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_lsuOp = dispatchStage_io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_csrOp = dispatchStage_io_lsEnq_toLsqData_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_mulOp = dispatchStage_io_lsEnq_toLsqData_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_divOp = dispatchStage_io_lsEnq_toLsqData_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_src1Type = dispatchStage_io_lsEnq_toLsqData_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_src2Type = dispatchStage_io_lsEnq_toLsqData_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_immType = dispatchStage_io_lsEnq_toLsqData_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_rfWen = dispatchStage_io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_memRead = dispatchStage_io_lsEnq_toLsqData_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_memWrite = dispatchStage_io_lsEnq_toLsqData_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_csrWen = dispatchStage_io_lsEnq_toLsqData_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_isBranch = dispatchStage_io_lsEnq_toLsqData_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_isJump = dispatchStage_io_lsEnq_toLsqData_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ctrl_isPriv = dispatchStage_io_lsEnq_toLsqData_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_excp_excpVec = dispatchStage_io_lsEnq_toLsqData_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_imm = dispatchStage_io_lsEnq_toLsqData_imm; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_csrAddress = dispatchStage_io_lsEnq_toLsqData_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdInfo_valid = dispatchStage_io_lsEnq_toLsqData_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdInfo_isBr = dispatchStage_io_lsEnq_toLsqData_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdInfo_isJal = dispatchStage_io_lsEnq_toLsqData_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdInfo_isJalr = dispatchStage_io_lsEnq_toLsqData_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdInfo_isCall = dispatchStage_io_lsEnq_toLsqData_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdInfo_isRet = dispatchStage_io_lsEnq_toLsqData_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdInfo_jumpTarget = dispatchStage_io_lsEnq_toLsqData_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_pc = dispatchStage_io_lsEnq_toLsqData_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_fallThrough = dispatchStage_io_lsEnq_toLsqData_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_taken = dispatchStage_io_lsEnq_toLsqData_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_target = dispatchStage_io_lsEnq_toLsqData_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_takenOffset = dispatchStage_io_lsEnq_toLsqData_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_valid = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbHit = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbOffset = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_phtCounter = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_rasTop = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_predTaken = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_bpuInfo_meta_predTarget = dispatchStage_io_lsEnq_toLsqData_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_ldst = dispatchStage_io_lsEnq_toLsqData_ldst; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_lrs1 = dispatchStage_io_lsEnq_toLsqData_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_lrs2 = dispatchStage_io_lsEnq_toLsqData_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_pdst = dispatchStage_io_lsEnq_toLsqData_pdst; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_prs1 = dispatchStage_io_lsEnq_toLsqData_prs1; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_prs2 = dispatchStage_io_lsEnq_toLsqData_prs2; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_oldPdst = dispatchStage_io_lsEnq_toLsqData_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_snptId_valid = dispatchStage_io_lsEnq_toLsqData_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_snptId_bits = dispatchStage_io_lsEnq_toLsqData_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_rs1Valid = dispatchStage_io_lsEnq_toLsqData_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_rs2Valid = dispatchStage_io_lsEnq_toLsqData_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_rdValid = dispatchStage_io_lsEnq_toLsqData_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_robIdx_value = dispatchStage_io_lsEnq_toLsqData_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_lsEnq_toLsqData_robIdx_flag = dispatchStage_io_lsEnq_toLsqData_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign io_commitToSq_valid_0 = rob_io_commitToSq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 166:17]
  assign io_commitToSq_valid_1 = rob_io_commitToSq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 166:17]
  assign io_commitToSq_valid_2 = rob_io_commitToSq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 166:17]
  assign io_commitToSq_bits_0_sqIdx_value = rob_io_commitToSq_bits_0_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 166:17]
  assign io_commitToSq_bits_1_sqIdx_value = rob_io_commitToSq_bits_1_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 166:17]
  assign io_commitToSq_bits_2_sqIdx_value = rob_io_commitToSq_bits_2_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 166:17]
  assign io_commitToCsr_csrWen = rob_io_commitToCsr_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 167:18]
  assign io_commitToCsr_csrWaddr = rob_io_commitToCsr_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 167:18]
  assign io_commitToCsr_csrWdata = rob_io_commitToCsr_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 167:18]
  assign io_redirectInfo_valid = redirectController_io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_doRedirect = redirectController_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_flushSelf = redirectController_io_redirectInfo_bits_flushSelf; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_fromBru = redirectController_io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_snptId = redirectController_io_redirectInfo_bits_snptId; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_robIdx_value = redirectController_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_robIdx_flag = redirectController_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_fromRob = redirectController_io_redirectInfo_bits_fromRob; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_redirectInfo_bits_target = redirectController_io_redirectInfo_bits_target; // @[src/main/scala/backend/CtrlBlock.scala 86:19]
  assign io_excpEvent_excp = redirectController_io_excpEvent_excp; // @[src/main/scala/backend/CtrlBlock.scala 82:35]
  assign io_excpEvent_ertn = redirectController_io_excpEvent_ertn; // @[src/main/scala/backend/CtrlBlock.scala 82:35]
  assign io_excpInfo_vaddrError = redirectController_io_excpInfo_vaddrError; // @[src/main/scala/backend/CtrlBlock.scala 83:34]
  assign io_excpInfo_era = redirectController_io_excpInfo_era; // @[src/main/scala/backend/CtrlBlock.scala 83:34]
  assign io_excpInfo_ecode = redirectController_io_excpInfo_ecode; // @[src/main/scala/backend/CtrlBlock.scala 83:34]
  assign io_excpInfo_badVaddr = redirectController_io_excpInfo_badVaddr; // @[src/main/scala/backend/CtrlBlock.scala 83:34]
  assign decodeStage_clock = clock;
  assign decodeStage_reset = reset;
  assign decodeStage_io_in_0_valid = io_in_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_instr = io_in_0_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pc = io_in_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pdInfo_valid = io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pdInfo_isBr = io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pdInfo_isJal = io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pdInfo_isJalr = io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pdInfo_isCall = io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pdInfo_isRet = io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_pdInfo_jumpTarget = io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_pc = io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_fallThrough = io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_taken = io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_target = io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_takenOffset = io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_valid = io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_btbHit = io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_btbIsJalr = io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_btbIsJal = io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_btbIsCall = io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_btbIsRet = io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_btbOffset = io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_phtCounter = io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_rasTop = io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_predTaken = io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_bpuInfo_meta_predTarget = io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_exception_excpTlbRefill = io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_exception_excpTlbPif = io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_exception_excpTlbPpi = io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_0_bits_exception_excpAdef = io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_valid = io_in_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_instr = io_in_1_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pc = io_in_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pdInfo_valid = io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pdInfo_isBr = io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pdInfo_isJal = io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pdInfo_isJalr = io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pdInfo_isCall = io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pdInfo_isRet = io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_pdInfo_jumpTarget = io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_pc = io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_fallThrough = io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_taken = io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_target = io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_takenOffset = io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_valid = io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_btbHit = io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_btbIsJalr = io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_btbIsJal = io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_btbIsCall = io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_btbIsRet = io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_btbOffset = io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_phtCounter = io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_rasTop = io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_predTaken = io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_bpuInfo_meta_predTarget = io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_exception_excpTlbRefill = io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_exception_excpTlbPif = io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_exception_excpTlbPpi = io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_1_bits_exception_excpAdef = io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_valid = io_in_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_instr = io_in_2_bits_instr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pc = io_in_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pdInfo_valid = io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pdInfo_isBr = io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pdInfo_isJal = io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pdInfo_isJalr = io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pdInfo_isCall = io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pdInfo_isRet = io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_pdInfo_jumpTarget = io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_pc = io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_fallThrough = io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_taken = io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_target = io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_takenOffset = io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_valid = io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_btbHit = io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_btbIsJalr = io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_btbIsJal = io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_btbIsCall = io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_btbIsRet = io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_btbOffset = io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_phtCounter = io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_rasTop = io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_predTaken = io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_bpuInfo_meta_predTarget = io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_exception_excpTlbRefill = io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_exception_excpTlbPif = io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_exception_excpTlbPpi = io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_in_2_bits_exception_excpAdef = io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/CtrlBlock.scala 92:24]
  assign decodeStage_io_out_0_ready = renameStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign decodeStage_io_out_1_ready = renameStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign decodeStage_io_out_2_ready = renameStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign decodeStage_io_extInt = io_extInt; // @[src/main/scala/backend/CtrlBlock.scala 93:25]
  assign decodeStage_io_flush = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 72:39]
  assign renameStage_clock = clock;
  assign renameStage_reset = reset;
  assign renameStage_io_in_0_valid = decodeStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pc = decodeStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_inst = decodeStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_rd = decodeStage_io_out_0_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_rs1 = decodeStage_io_out_0_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_rs2 = decodeStage_io_out_0_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_rs1Valid = decodeStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_rs2Valid = decodeStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_rdValid = decodeStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_csrAddress = decodeStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_imm = decodeStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_fuType = decodeStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_aluOp = decodeStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_bruOp = decodeStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_lsuOp = decodeStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_csrOp = decodeStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_mulOp = decodeStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_divOp = decodeStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_src1Type = decodeStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_src2Type = decodeStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_immType = decodeStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_rfWen = decodeStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_memRead = decodeStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_memWrite = decodeStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_csrWen = decodeStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_isBranch = decodeStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_isJump = decodeStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_ctrl_isPriv = decodeStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_excp_excpVec = decodeStage_io_out_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pdInfo_valid = decodeStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pdInfo_isBr = decodeStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pdInfo_isJal = decodeStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pdInfo_isJalr = decodeStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pdInfo_isCall = decodeStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pdInfo_isRet = decodeStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_pdInfo_jumpTarget = decodeStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_pc = decodeStage_io_out_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_fallThrough = decodeStage_io_out_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_taken = decodeStage_io_out_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_target = decodeStage_io_out_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_takenOffset = decodeStage_io_out_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_valid = decodeStage_io_out_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_btbHit = decodeStage_io_out_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_btbIsJalr = decodeStage_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_btbIsJal = decodeStage_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_btbIsCall = decodeStage_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_btbIsRet = decodeStage_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_btbOffset = decodeStage_io_out_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_phtCounter = decodeStage_io_out_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_rasTop = decodeStage_io_out_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_predTaken = decodeStage_io_out_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_0_bits_bpuInfo_meta_predTarget = decodeStage_io_out_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_valid = decodeStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pc = decodeStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_inst = decodeStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_rd = decodeStage_io_out_1_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_rs1 = decodeStage_io_out_1_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_rs2 = decodeStage_io_out_1_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_rs1Valid = decodeStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_rs2Valid = decodeStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_rdValid = decodeStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_csrAddress = decodeStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_imm = decodeStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_fuType = decodeStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_aluOp = decodeStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_bruOp = decodeStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_lsuOp = decodeStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_csrOp = decodeStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_mulOp = decodeStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_divOp = decodeStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_src1Type = decodeStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_src2Type = decodeStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_immType = decodeStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_rfWen = decodeStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_memRead = decodeStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_memWrite = decodeStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_csrWen = decodeStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_isBranch = decodeStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_isJump = decodeStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_ctrl_isPriv = decodeStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_excp_excpVec = decodeStage_io_out_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pdInfo_valid = decodeStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pdInfo_isBr = decodeStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pdInfo_isJal = decodeStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pdInfo_isJalr = decodeStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pdInfo_isCall = decodeStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pdInfo_isRet = decodeStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_pdInfo_jumpTarget = decodeStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_pc = decodeStage_io_out_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_fallThrough = decodeStage_io_out_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_taken = decodeStage_io_out_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_target = decodeStage_io_out_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_takenOffset = decodeStage_io_out_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_valid = decodeStage_io_out_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_btbHit = decodeStage_io_out_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_btbIsJalr = decodeStage_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_btbIsJal = decodeStage_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_btbIsCall = decodeStage_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_btbIsRet = decodeStage_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_btbOffset = decodeStage_io_out_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_phtCounter = decodeStage_io_out_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_rasTop = decodeStage_io_out_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_predTaken = decodeStage_io_out_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_1_bits_bpuInfo_meta_predTarget = decodeStage_io_out_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_valid = decodeStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pc = decodeStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_inst = decodeStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_rd = decodeStage_io_out_2_bits_rd; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_rs1 = decodeStage_io_out_2_bits_rs1; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_rs2 = decodeStage_io_out_2_bits_rs2; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_rs1Valid = decodeStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_rs2Valid = decodeStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_rdValid = decodeStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_csrAddress = decodeStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_imm = decodeStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_fuType = decodeStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_aluOp = decodeStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_bruOp = decodeStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_lsuOp = decodeStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_csrOp = decodeStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_mulOp = decodeStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_divOp = decodeStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_src1Type = decodeStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_src2Type = decodeStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_immType = decodeStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_rfWen = decodeStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_memRead = decodeStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_memWrite = decodeStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_csrWen = decodeStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_isBranch = decodeStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_isJump = decodeStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_ctrl_isPriv = decodeStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_excp_excpVec = decodeStage_io_out_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pdInfo_valid = decodeStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pdInfo_isBr = decodeStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pdInfo_isJal = decodeStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pdInfo_isJalr = decodeStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pdInfo_isCall = decodeStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pdInfo_isRet = decodeStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_pdInfo_jumpTarget = decodeStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_pc = decodeStage_io_out_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_fallThrough = decodeStage_io_out_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_taken = decodeStage_io_out_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_target = decodeStage_io_out_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_takenOffset = decodeStage_io_out_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_valid = decodeStage_io_out_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_btbHit = decodeStage_io_out_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_btbIsJalr = decodeStage_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_btbIsJal = decodeStage_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_btbIsCall = decodeStage_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_btbIsRet = decodeStage_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_btbOffset = decodeStage_io_out_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_phtCounter = decodeStage_io_out_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_rasTop = decodeStage_io_out_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_predTaken = decodeStage_io_out_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_in_2_bits_bpuInfo_meta_predTarget = decodeStage_io_out_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 100:26]
  assign renameStage_io_ratRead_0_rs1 = decodeStage_io_ratRead_0_rs1; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_0_rs2 = decodeStage_io_ratRead_0_rs2; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_0_hold1 = decodeStage_io_ratRead_0_hold1; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_0_hold2 = decodeStage_io_ratRead_0_hold2; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_1_rs1 = decodeStage_io_ratRead_1_rs1; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_1_rs2 = decodeStage_io_ratRead_1_rs2; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_1_hold1 = decodeStage_io_ratRead_1_hold1; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_1_hold2 = decodeStage_io_ratRead_1_hold2; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_2_rs1 = decodeStage_io_ratRead_2_rs1; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_2_rs2 = decodeStage_io_ratRead_2_rs2; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_2_hold1 = decodeStage_io_ratRead_2_hold1; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_ratRead_2_hold2 = decodeStage_io_ratRead_2_hold2; // @[src/main/scala/backend/CtrlBlock.scala 101:26]
  assign renameStage_io_out_0_ready = dispatchStage_io_in_0_ready; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign renameStage_io_out_1_ready = dispatchStage_io_in_1_ready; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign renameStage_io_out_2_ready = dispatchStage_io_in_2_ready; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign renameStage_io_archCommit_0_valid = rob_io_archCommit_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_0_isWalk = rob_io_archCommit_0_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_0_ldst = rob_io_archCommit_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_0_pdst = rob_io_archCommit_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_0_rfWen = rob_io_archCommit_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_1_valid = rob_io_archCommit_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_1_isWalk = rob_io_archCommit_1_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_1_ldst = rob_io_archCommit_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_1_pdst = rob_io_archCommit_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_1_rfWen = rob_io_archCommit_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_2_valid = rob_io_archCommit_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_2_isWalk = rob_io_archCommit_2_isWalk; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_2_ldst = rob_io_archCommit_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_2_pdst = rob_io_archCommit_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_archCommit_2_rfWen = rob_io_archCommit_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 164:29]
  assign renameStage_io_redirectInfo_valid = io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 104:31]
  assign renameStage_io_redirectInfo_bits_doRedirect = io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 104:31]
  assign renameStage_io_redirectInfo_bits_fromBru = io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/CtrlBlock.scala 104:31]
  assign renameStage_io_redirectInfo_bits_snptId = io_redirectInfo_bits_snptId; // @[src/main/scala/backend/CtrlBlock.scala 104:31]
  assign renameStage_io_redirectInfo_bits_robIdx_value = io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 104:31]
  assign renameStage_io_redirectInfo_bits_robIdx_flag = io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 104:31]
  assign renameStage_io_redirectInfo_bits_fromRob = io_redirectInfo_bits_fromRob; // @[src/main/scala/backend/CtrlBlock.scala 104:31]
  assign renameStage_io_stall = redirectController_io_robRedirectPause; // @[src/main/scala/backend/CtrlBlock.scala 106:24]
  assign redirectController_clock = clock;
  assign redirectController_reset = reset;
  assign redirectController_io_bruRedirect_valid = io_bruInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 88:37]
  assign redirectController_io_bruRedirect_bits_doRedirect = io_bruInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 88:37]
  assign redirectController_io_bruRedirect_bits_snptId = io_bruInfo_bits_snptId; // @[src/main/scala/backend/CtrlBlock.scala 88:37]
  assign redirectController_io_bruRedirect_bits_robIdx_value = io_bruInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 88:37]
  assign redirectController_io_bruRedirect_bits_robIdx_flag = io_bruInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 88:37]
  assign redirectController_io_bruRedirect_bits_target = io_bruInfo_bits_target; // @[src/main/scala/backend/CtrlBlock.scala 88:37]
  assign redirectController_io_robRedirect_valid = rob_io_robRedirect_valid; // @[src/main/scala/backend/CtrlBlock.scala 144:37]
  assign redirectController_io_robRedirect_robIdx_value = rob_io_robRedirect_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 144:37]
  assign redirectController_io_robRedirect_robIdx_flag = rob_io_robRedirect_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 144:37]
  assign redirectController_io_robRedirect_isException = rob_io_robRedirect_isException; // @[src/main/scala/backend/CtrlBlock.scala 144:37]
  assign redirectController_io_robRedirect_excp_excpVec = rob_io_robRedirect_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 144:37]
  assign redirectController_io_robRedirect_pc = rob_io_robRedirect_pc; // @[src/main/scala/backend/CtrlBlock.scala 144:37]
  assign redirectController_io_robRedirect_excpVaddr = rob_io_robRedirect_excpVaddr; // @[src/main/scala/backend/CtrlBlock.scala 144:37]
  assign redirectController_io_robRollbackDone = rob_io_robRollbackDone; // @[src/main/scala/backend/CtrlBlock.scala 151:41]
  assign redirectController_io_redirectAddrFromCsr_eentry = io_redirectAddrFromCsr_eentry; // @[src/main/scala/backend/CtrlBlock.scala 84:45]
  assign redirectController_io_redirectAddrFromCsr_era = io_redirectAddrFromCsr_era; // @[src/main/scala/backend/CtrlBlock.scala 84:45]
  assign dispatchStage_clock = clock;
  assign dispatchStage_reset = reset;
  assign dispatchStage_io_in_0_valid = renameStage_io_out_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pc = renameStage_io_out_0_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_inst = renameStage_io_out_0_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_fuType = renameStage_io_out_0_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_aluOp = renameStage_io_out_0_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_bruOp = renameStage_io_out_0_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_lsuOp = renameStage_io_out_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_csrOp = renameStage_io_out_0_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_mulOp = renameStage_io_out_0_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_divOp = renameStage_io_out_0_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_src1Type = renameStage_io_out_0_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_src2Type = renameStage_io_out_0_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_immType = renameStage_io_out_0_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_rfWen = renameStage_io_out_0_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_memRead = renameStage_io_out_0_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_memWrite = renameStage_io_out_0_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_csrWen = renameStage_io_out_0_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_isBranch = renameStage_io_out_0_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_isJump = renameStage_io_out_0_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ctrl_isPriv = renameStage_io_out_0_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_excp_excpVec = renameStage_io_out_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_imm = renameStage_io_out_0_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_csrAddress = renameStage_io_out_0_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdInfo_valid = renameStage_io_out_0_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isBr = renameStage_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isJal = renameStage_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isJalr = renameStage_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isCall = renameStage_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdInfo_isRet = renameStage_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdInfo_jumpTarget = renameStage_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_pc = renameStage_io_out_0_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_fallThrough = renameStage_io_out_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_taken = renameStage_io_out_0_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_target = renameStage_io_out_0_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_takenOffset = renameStage_io_out_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_valid = renameStage_io_out_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_btbHit = renameStage_io_out_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsJalr = renameStage_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsJal = renameStage_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsCall = renameStage_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_btbIsRet = renameStage_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_btbOffset = renameStage_io_out_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_phtCounter = renameStage_io_out_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_rasTop = renameStage_io_out_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_predTaken = renameStage_io_out_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_bpuInfo_meta_predTarget = renameStage_io_out_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_ldst = renameStage_io_out_0_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_lrs1 = renameStage_io_out_0_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_lrs2 = renameStage_io_out_0_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_pdst = renameStage_io_out_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_prs1 = renameStage_io_out_0_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_prs2 = renameStage_io_out_0_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_oldPdst = renameStage_io_out_0_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_snptId_valid = renameStage_io_out_0_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_snptId_bits = renameStage_io_out_0_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_rs1Valid = renameStage_io_out_0_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_rs2Valid = renameStage_io_out_0_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_rdValid = renameStage_io_out_0_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_robIdx_value = renameStage_io_out_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_0_bits_robIdx_flag = renameStage_io_out_0_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_valid = renameStage_io_out_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pc = renameStage_io_out_1_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_inst = renameStage_io_out_1_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_fuType = renameStage_io_out_1_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_aluOp = renameStage_io_out_1_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_bruOp = renameStage_io_out_1_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_lsuOp = renameStage_io_out_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_csrOp = renameStage_io_out_1_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_mulOp = renameStage_io_out_1_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_divOp = renameStage_io_out_1_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_src1Type = renameStage_io_out_1_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_src2Type = renameStage_io_out_1_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_immType = renameStage_io_out_1_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_rfWen = renameStage_io_out_1_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_memRead = renameStage_io_out_1_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_memWrite = renameStage_io_out_1_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_csrWen = renameStage_io_out_1_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_isBranch = renameStage_io_out_1_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_isJump = renameStage_io_out_1_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ctrl_isPriv = renameStage_io_out_1_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_excp_excpVec = renameStage_io_out_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_imm = renameStage_io_out_1_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_csrAddress = renameStage_io_out_1_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdInfo_valid = renameStage_io_out_1_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isBr = renameStage_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isJal = renameStage_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isJalr = renameStage_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isCall = renameStage_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdInfo_isRet = renameStage_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdInfo_jumpTarget = renameStage_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_pc = renameStage_io_out_1_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_fallThrough = renameStage_io_out_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_taken = renameStage_io_out_1_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_target = renameStage_io_out_1_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_takenOffset = renameStage_io_out_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_valid = renameStage_io_out_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_btbHit = renameStage_io_out_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsJalr = renameStage_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsJal = renameStage_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsCall = renameStage_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_btbIsRet = renameStage_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_btbOffset = renameStage_io_out_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_phtCounter = renameStage_io_out_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_rasTop = renameStage_io_out_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_predTaken = renameStage_io_out_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_bpuInfo_meta_predTarget = renameStage_io_out_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_ldst = renameStage_io_out_1_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_lrs1 = renameStage_io_out_1_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_lrs2 = renameStage_io_out_1_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_pdst = renameStage_io_out_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_prs1 = renameStage_io_out_1_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_prs2 = renameStage_io_out_1_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_oldPdst = renameStage_io_out_1_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_snptId_valid = renameStage_io_out_1_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_snptId_bits = renameStage_io_out_1_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_rs1Valid = renameStage_io_out_1_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_rs2Valid = renameStage_io_out_1_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_rdValid = renameStage_io_out_1_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_robIdx_value = renameStage_io_out_1_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_1_bits_robIdx_flag = renameStage_io_out_1_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_valid = renameStage_io_out_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pc = renameStage_io_out_2_bits_pc; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_inst = renameStage_io_out_2_bits_inst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_fuType = renameStage_io_out_2_bits_ctrl_fuType; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_aluOp = renameStage_io_out_2_bits_ctrl_aluOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_bruOp = renameStage_io_out_2_bits_ctrl_bruOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_lsuOp = renameStage_io_out_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_csrOp = renameStage_io_out_2_bits_ctrl_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_mulOp = renameStage_io_out_2_bits_ctrl_mulOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_divOp = renameStage_io_out_2_bits_ctrl_divOp; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_src1Type = renameStage_io_out_2_bits_ctrl_src1Type; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_src2Type = renameStage_io_out_2_bits_ctrl_src2Type; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_immType = renameStage_io_out_2_bits_ctrl_immType; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_rfWen = renameStage_io_out_2_bits_ctrl_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_memRead = renameStage_io_out_2_bits_ctrl_memRead; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_memWrite = renameStage_io_out_2_bits_ctrl_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_csrWen = renameStage_io_out_2_bits_ctrl_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_isBranch = renameStage_io_out_2_bits_ctrl_isBranch; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_isJump = renameStage_io_out_2_bits_ctrl_isJump; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ctrl_isPriv = renameStage_io_out_2_bits_ctrl_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_excp_excpVec = renameStage_io_out_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_imm = renameStage_io_out_2_bits_imm; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_csrAddress = renameStage_io_out_2_bits_csrAddress; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdInfo_valid = renameStage_io_out_2_bits_pdInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isBr = renameStage_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isJal = renameStage_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isJalr = renameStage_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isCall = renameStage_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdInfo_isRet = renameStage_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdInfo_jumpTarget = renameStage_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_pc = renameStage_io_out_2_bits_bpuInfo_pc; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_fallThrough = renameStage_io_out_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_taken = renameStage_io_out_2_bits_bpuInfo_taken; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_target = renameStage_io_out_2_bits_bpuInfo_target; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_takenOffset = renameStage_io_out_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_valid = renameStage_io_out_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_btbHit = renameStage_io_out_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsJalr = renameStage_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsJal = renameStage_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsCall = renameStage_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_btbIsRet = renameStage_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_btbOffset = renameStage_io_out_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_phtCounter = renameStage_io_out_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_rasTop = renameStage_io_out_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_predTaken = renameStage_io_out_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_bpuInfo_meta_predTarget = renameStage_io_out_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_ldst = renameStage_io_out_2_bits_ldst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_lrs1 = renameStage_io_out_2_bits_lrs1; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_lrs2 = renameStage_io_out_2_bits_lrs2; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_pdst = renameStage_io_out_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_prs1 = renameStage_io_out_2_bits_prs1; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_prs2 = renameStage_io_out_2_bits_prs2; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_oldPdst = renameStage_io_out_2_bits_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_snptId_valid = renameStage_io_out_2_bits_snptId_valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_snptId_bits = renameStage_io_out_2_bits_snptId_bits; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_rs1Valid = renameStage_io_out_2_bits_rs1Valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_rs2Valid = renameStage_io_out_2_bits_rs2Valid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_rdValid = renameStage_io_out_2_bits_rdValid; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_robIdx_value = renameStage_io_out_2_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_in_2_bits_robIdx_flag = renameStage_io_out_2_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 117:29]
  assign dispatchStage_io_iqFeedback_q1FreeEntries = io_iqFeedback_q1FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 129:31]
  assign dispatchStage_io_iqFeedback_q2FreeEntries = io_iqFeedback_q2FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 129:31]
  assign dispatchStage_io_iqFeedback_q3FreeEntries = io_iqFeedback_q3FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 129:31]
  assign dispatchStage_io_iqFeedback_q4FreeEntries = io_iqFeedback_q4FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 129:31]
  assign dispatchStage_io_iqFeedback_q5FreeEntries = io_iqFeedback_q5FreeEntries; // @[src/main/scala/backend/CtrlBlock.scala 129:31]
  assign dispatchStage_io_lsEnq_lqFull = io_lsEnq_lqFull; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign dispatchStage_io_lsEnq_sqFull = io_lsEnq_sqFull; // @[src/main/scala/backend/CtrlBlock.scala 132:26]
  assign dispatchStage_io_robEnq_canEnq = rob_io_enq_canEnq; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign dispatchStage_io_robEnq_full = rob_io_enq_full; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign dispatchStage_io_flush = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 72:39]
  assign dispatchStage_io_redirectInfo_valid = io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 119:33]
  assign dispatchStage_io_redirectInfo_bits_doRedirect = io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 119:33]
  assign dispatchStage_io_redirectInfo_bits_robIdx_value = io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 119:33]
  assign dispatchStage_io_redirectInfo_bits_robIdx_flag = io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 119:33]
  assign dispatchStage_io_stall = redirectController_io_robRedirectPause; // @[src/main/scala/backend/CtrlBlock.scala 120:26]
  assign dispatchStage_io_wakeupPorts_0_valid = io_wakeupPorts_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_0_bits_pdst = io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_1_valid = io_wakeupPorts_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_1_bits_pdst = io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_2_valid = io_wakeupPorts_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_2_bits_pdst = io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_3_valid = io_wakeupPorts_3_valid; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_3_bits_pdst = io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_4_valid = io_wakeupPorts_4_valid; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign dispatchStage_io_wakeupPorts_4_bits_pdst = io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/CtrlBlock.scala 207:32]
  assign rob_clock = clock;
  assign rob_reset = reset;
  assign rob_io_enq_valid_0 = dispatchStage_io_robEnq_valid_0; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_valid_1 = dispatchStage_io_robEnq_valid_1; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_valid_2 = dispatchStage_io_robEnq_valid_2; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_valids_0 = dispatchStage_io_robEnq_valids_0; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_valids_1 = dispatchStage_io_robEnq_valids_1; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_valids_2 = dispatchStage_io_robEnq_valids_2; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_pc = dispatchStage_io_robEnq_bits_0_pc; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_inst = dispatchStage_io_robEnq_bits_0_inst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_fuType = dispatchStage_io_robEnq_bits_0_fuType; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_pdst = dispatchStage_io_robEnq_bits_0_pdst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_oldPdst = dispatchStage_io_robEnq_bits_0_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_ldst = dispatchStage_io_robEnq_bits_0_ldst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_rfWen = dispatchStage_io_robEnq_bits_0_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_memRead = dispatchStage_io_robEnq_bits_0_memRead; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_memWrite = dispatchStage_io_robEnq_bits_0_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_csrWen = dispatchStage_io_robEnq_bits_0_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_csrOp = dispatchStage_io_robEnq_bits_0_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_csrWaddr = dispatchStage_io_robEnq_bits_0_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_isPriv = dispatchStage_io_robEnq_bits_0_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_0_excp_excpVec = dispatchStage_io_robEnq_bits_0_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_pc = dispatchStage_io_robEnq_bits_1_pc; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_inst = dispatchStage_io_robEnq_bits_1_inst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_fuType = dispatchStage_io_robEnq_bits_1_fuType; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_pdst = dispatchStage_io_robEnq_bits_1_pdst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_oldPdst = dispatchStage_io_robEnq_bits_1_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_ldst = dispatchStage_io_robEnq_bits_1_ldst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_rfWen = dispatchStage_io_robEnq_bits_1_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_memRead = dispatchStage_io_robEnq_bits_1_memRead; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_memWrite = dispatchStage_io_robEnq_bits_1_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_csrWen = dispatchStage_io_robEnq_bits_1_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_csrOp = dispatchStage_io_robEnq_bits_1_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_csrWaddr = dispatchStage_io_robEnq_bits_1_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_isPriv = dispatchStage_io_robEnq_bits_1_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_1_excp_excpVec = dispatchStage_io_robEnq_bits_1_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_pc = dispatchStage_io_robEnq_bits_2_pc; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_inst = dispatchStage_io_robEnq_bits_2_inst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_fuType = dispatchStage_io_robEnq_bits_2_fuType; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_pdst = dispatchStage_io_robEnq_bits_2_pdst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_oldPdst = dispatchStage_io_robEnq_bits_2_oldPdst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_ldst = dispatchStage_io_robEnq_bits_2_ldst; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_rfWen = dispatchStage_io_robEnq_bits_2_rfWen; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_memRead = dispatchStage_io_robEnq_bits_2_memRead; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_memWrite = dispatchStage_io_robEnq_bits_2_memWrite; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_csrWen = dispatchStage_io_robEnq_bits_2_csrWen; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_csrOp = dispatchStage_io_robEnq_bits_2_csrOp; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_csrWaddr = dispatchStage_io_robEnq_bits_2_csrWaddr; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_isPriv = dispatchStage_io_robEnq_bits_2_isPriv; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_enq_bits_2_excp_excpVec = dispatchStage_io_robEnq_bits_2_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 211:14]
  assign rob_io_writeback_0_valid = io_writeback_0_valid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_robIdx_value = io_writeback_0_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_sqIdx_value = io_writeback_0_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_sqIdx_flag = io_writeback_0_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_isMemWrite = io_writeback_0_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_isMemRead = io_writeback_0_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_memValid = io_writeback_0_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_memVaddr = io_writeback_0_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_memPaddr = io_writeback_0_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_memStoreData = io_writeback_0_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_rfdata = io_writeback_0_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_csrWdata = io_writeback_0_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_csrTimer = io_writeback_0_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_0_bits_excp_excpVec = io_writeback_0_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_valid = io_writeback_1_valid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_robIdx_value = io_writeback_1_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_sqIdx_value = io_writeback_1_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_sqIdx_flag = io_writeback_1_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_isMemWrite = io_writeback_1_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_isMemRead = io_writeback_1_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_memValid = io_writeback_1_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_memVaddr = io_writeback_1_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_memPaddr = io_writeback_1_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_memStoreData = io_writeback_1_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_rfdata = io_writeback_1_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_csrWdata = io_writeback_1_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_csrTimer = io_writeback_1_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_1_bits_excp_excpVec = io_writeback_1_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_valid = io_writeback_2_valid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_robIdx_value = io_writeback_2_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_sqIdx_value = io_writeback_2_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_sqIdx_flag = io_writeback_2_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_isMemWrite = io_writeback_2_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_isMemRead = io_writeback_2_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_memValid = io_writeback_2_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_memVaddr = io_writeback_2_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_memPaddr = io_writeback_2_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_memStoreData = io_writeback_2_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_rfdata = io_writeback_2_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_csrWdata = io_writeback_2_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_csrTimer = io_writeback_2_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_2_bits_excp_excpVec = io_writeback_2_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_valid = io_writeback_3_valid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_robIdx_value = io_writeback_3_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_sqIdx_value = io_writeback_3_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_sqIdx_flag = io_writeback_3_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_isMemWrite = io_writeback_3_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_isMemRead = io_writeback_3_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_memValid = io_writeback_3_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_memVaddr = io_writeback_3_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_memPaddr = io_writeback_3_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_memStoreData = io_writeback_3_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_rfdata = io_writeback_3_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_csrWdata = io_writeback_3_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_csrTimer = io_writeback_3_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_3_bits_excp_excpVec = io_writeback_3_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_valid = io_writeback_4_valid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_robIdx_value = io_writeback_4_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_sqIdx_value = io_writeback_4_bits_sqIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_sqIdx_flag = io_writeback_4_bits_sqIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_isMemWrite = io_writeback_4_bits_isMemWrite; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_isMemRead = io_writeback_4_bits_isMemRead; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_memValid = io_writeback_4_bits_memValid; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_memVaddr = io_writeback_4_bits_memVaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_memPaddr = io_writeback_4_bits_memPaddr; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_memStoreData = io_writeback_4_bits_memStoreData; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_rfdata = io_writeback_4_bits_rfdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_csrWdata = io_writeback_4_bits_csrWdata; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_csrTimer = io_writeback_4_bits_csrTimer; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_writeback_4_bits_excp_excpVec = io_writeback_4_bits_excp_excpVec; // @[src/main/scala/backend/CtrlBlock.scala 206:20]
  assign rob_io_redirectInfo_valid = io_redirectInfo_valid; // @[src/main/scala/backend/CtrlBlock.scala 204:23]
  assign rob_io_redirectInfo_bits_doRedirect = io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/CtrlBlock.scala 204:23]
  assign rob_io_redirectInfo_bits_flushSelf = io_redirectInfo_bits_flushSelf; // @[src/main/scala/backend/CtrlBlock.scala 204:23]
  assign rob_io_redirectInfo_bits_fromBru = io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/CtrlBlock.scala 204:23]
  assign rob_io_redirectInfo_bits_robIdx_value = io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/CtrlBlock.scala 204:23]
  assign rob_io_redirectInfo_bits_robIdx_flag = io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/CtrlBlock.scala 204:23]
  assign rob_io_robPause = redirectController_io_robRedirectPause; // @[src/main/scala/backend/CtrlBlock.scala 141:19]
  assign rob_io_robNeedRollback = redirectController_io_robNeedRollback; // @[src/main/scala/backend/CtrlBlock.scala 147:26]
endmodule
