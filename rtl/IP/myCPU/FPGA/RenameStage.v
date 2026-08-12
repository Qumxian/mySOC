module RenameStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_0_bits_rd, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_0_bits_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_0_bits_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [13:0] io_in_0_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_0_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_0_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_0_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_0_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_0_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_0_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_0_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_0_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_0_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [16:0] io_in_0_bits_excp_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_bpuInfo_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_taken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_bpuInfo_target, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_in_1_ready, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_1_bits_rd, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_1_bits_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_1_bits_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [13:0] io_in_1_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_1_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_1_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_1_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_1_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_1_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_1_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_1_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_1_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_1_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [16:0] io_in_1_bits_excp_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_bpuInfo_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_taken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_bpuInfo_target, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_in_2_ready, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_2_bits_rd, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_2_bits_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_2_bits_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [13:0] io_in_2_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_2_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_in_2_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_2_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_2_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_2_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_2_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_2_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_2_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [3:0]  io_in_2_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [16:0] io_in_2_bits_excp_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_bpuInfo_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_taken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_bpuInfo_target, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_in_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_in_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [31:0] io_in_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_ratRead_0_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_ratRead_0_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_ratRead_0_hold1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_ratRead_0_hold2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_ratRead_1_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_ratRead_1_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_ratRead_1_hold1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_ratRead_1_hold2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_ratRead_2_rs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_ratRead_2_rs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_ratRead_2_hold1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_ratRead_2_hold2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_out_0_ready, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_0_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_0_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_0_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_0_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_0_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_0_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_0_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_0_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_0_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [16:0] io_out_0_bits_excp_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [13:0] io_out_0_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_bpuInfo_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_taken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_bpuInfo_target, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_0_bits_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_0_bits_lrs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_0_bits_lrs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_0_bits_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_0_bits_prs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_0_bits_prs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_0_bits_oldPdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_snptId_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_0_bits_snptId_bits, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [5:0]  io_out_0_bits_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_0_bits_robIdx_flag, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_out_1_ready, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_1_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_1_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_1_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_1_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_1_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_1_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_1_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_1_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_1_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [16:0] io_out_1_bits_excp_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [13:0] io_out_1_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_bpuInfo_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_taken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_bpuInfo_target, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_1_bits_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_1_bits_lrs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_1_bits_lrs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_1_bits_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_1_bits_prs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_1_bits_prs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_1_bits_oldPdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_snptId_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_1_bits_snptId_bits, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [5:0]  io_out_1_bits_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_1_bits_robIdx_flag, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_out_2_ready, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_inst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_2_bits_ctrl_fuType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_2_bits_ctrl_aluOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_2_bits_ctrl_bruOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_2_bits_ctrl_csrOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_2_bits_ctrl_mulOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_2_bits_ctrl_divOp, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_2_bits_ctrl_src1Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_2_bits_ctrl_src2Type, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [3:0]  io_out_2_bits_ctrl_immType, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_ctrl_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_ctrl_memRead, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_ctrl_memWrite, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_ctrl_csrWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_ctrl_isBranch, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_ctrl_isJump, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_ctrl_isPriv, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [16:0] io_out_2_bits_excp_excpVec, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_imm, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [13:0] io_out_2_bits_csrAddress, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_bpuInfo_pc, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_taken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_bpuInfo_target, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [1:0]  io_out_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [31:0] io_out_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_2_bits_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_2_bits_lrs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [4:0]  io_out_2_bits_lrs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_2_bits_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_2_bits_prs1, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_2_bits_prs2, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [6:0]  io_out_2_bits_oldPdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_snptId_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [2:0]  io_out_2_bits_snptId_bits, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_rs1Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_rs2Valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_rdValid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output [5:0]  io_out_2_bits_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  output        io_out_2_bits_robIdx_flag, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_0_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_0_isWalk, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_archCommit_0_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [6:0]  io_archCommit_0_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_0_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_1_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_1_isWalk, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_archCommit_1_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [6:0]  io_archCommit_1_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_1_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_2_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_2_isWalk, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [4:0]  io_archCommit_2_ldst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [6:0]  io_archCommit_2_pdst, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_archCommit_2_rfWen, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_redirectInfo_valid, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_redirectInfo_bits_fromBru, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [2:0]  io_redirectInfo_bits_snptId, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_redirectInfo_bits_robIdx_flag, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_redirectInfo_bits_fromRob, // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
  input         io_stall // @[src/main/scala/backend/rename/RenameStage.scala 16:14]
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
`endif // RANDOMIZE_REG_INIT
  wire  rat_clock; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_reset; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_redirect; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_doRecover; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [2:0] rat_io_recoverId; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_0_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_readPorts_0_hold; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_1_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_readPorts_1_hold; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_1_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_2_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_readPorts_2_hold; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_2_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_3_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_readPorts_3_hold; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_3_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_4_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_readPorts_4_hold; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_4_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_5_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_readPorts_5_hold; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_5_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_6_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_6_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_7_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_7_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_readPorts_8_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_readPorts_8_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_specWritePorts_0_wen; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_specWritePorts_0_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_specWritePorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_specWritePorts_1_wen; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_specWritePorts_1_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_specWritePorts_1_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_specWritePorts_2_wen; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_specWritePorts_2_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_specWritePorts_2_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_archWritePorts_0_wen; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_archWritePorts_0_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_archWritePorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_archWritePorts_1_wen; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_archWritePorts_1_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_archWritePorts_1_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_archWritePorts_2_wen; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_archWritePorts_2_addr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_archWritePorts_2_data; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_archReadPorts_0_laddr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_archReadPorts_0_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_archReadPorts_1_laddr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_archReadPorts_1_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [4:0] rat_io_archReadPorts_2_laddr; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [6:0] rat_io_archReadPorts_2_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptSave_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [2:0] rat_io_snptSave_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptSave_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [2:0] rat_io_snptSave_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptSave_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire [2:0] rat_io_snptSave_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_0; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_1; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_2; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_3; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_4; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_5; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_6; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  rat_io_snptInvalidate_7; // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
  wire  freeList_clock; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_reset; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_allocReqs_0; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_allocReqs_1; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_allocReqs_2; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [6:0] freeList_io_allocPdest_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [6:0] freeList_io_allocPdest_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [6:0] freeList_io_allocPdest_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_canAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_doAlloc; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_deallocReqs_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [6:0] freeList_io_deallocReqs_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_deallocReqs_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [6:0] freeList_io_deallocReqs_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_deallocReqs_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [6:0] freeList_io_deallocReqs_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptSave_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [2:0] freeList_io_snptSave_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptSave_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [2:0] freeList_io_snptSave_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptSave_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [2:0] freeList_io_snptSave_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_doRecover; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire [2:0] freeList_io_recoverId; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_0; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_1; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_2; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_3; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_4; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_5; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_6; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  freeList_io_snptInvalidate_7; // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
  wire  snapshotManager_clock; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_reset; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_doAllocReqs_0; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_doAllocReqs_1; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_doAllocReqs_2; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_allocReqs_0; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_allocReqs_1; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_allocReqs_2; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_allocOk; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_allocIds_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire [2:0] snapshotManager_io_allocIds_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_allocIds_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire [2:0] snapshotManager_io_allocIds_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_allocIds_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire [2:0] snapshotManager_io_allocIds_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_resolve_valid; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire [2:0] snapshotManager_io_resolve_bits_snptId; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_resolve_bits_isMispredict; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_resolveAllSs; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_doRecover; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire [2:0] snapshotManager_io_recoverId; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_0; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_1; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_2; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_3; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_4; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_5; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_6; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  snapshotManager_io_invalidateSlots_7; // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
  wire  _snapshotManager_io_resolveAllSs_T = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/rename/RenameStage.scala 57:60]
  reg  stgValid; // @[src/main/scala/backend/rename/RenameStage.scala 66:26]
  reg  laneValid_0; // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
  reg  laneValid_1; // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
  reg  laneValid_2; // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_0_inst; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_0_rd; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_0_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_0_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [13:0] stgData_0_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_0_imm; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_0_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_0_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_0_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_0_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_0_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_0_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_0_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_0_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_0_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [16:0] stgData_0_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_0_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_0_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_0_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_0_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_0_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_0_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_0_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_0_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_0_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_inst; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_1_rd; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_1_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_1_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [13:0] stgData_1_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_imm; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_1_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_1_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_1_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_1_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_1_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_1_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_1_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_1_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_1_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [16:0] stgData_1_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_1_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_inst; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_2_rd; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_2_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_2_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [13:0] stgData_2_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_imm; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_2_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [4:0] stgData_2_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_2_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_2_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_2_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_2_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_2_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_2_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [3:0] stgData_2_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [16:0] stgData_2_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_2_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [1:0] stgData_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [2:0] stgData_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg  stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  reg [31:0] stgData_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
  wire  _outReadyAll_T_1 = ~laneValid_0 | io_out_0_ready; // @[src/main/scala/backend/rename/RenameStage.scala 71:19]
  wire  _outReadyAll_T_3 = ~laneValid_1 | io_out_1_ready; // @[src/main/scala/backend/rename/RenameStage.scala 71:19]
  wire  _outReadyAll_T_5 = ~laneValid_2 | io_out_2_ready; // @[src/main/scala/backend/rename/RenameStage.scala 71:19]
  wire  outReadyAll = _outReadyAll_T_1 & _outReadyAll_T_3 & _outReadyAll_T_5; // @[src/main/scala/backend/rename/RenameStage.scala 72:14]
  wire  _needAllocVec_T = stgValid & laneValid_0; // @[src/main/scala/backend/rename/RenameStage.scala 75:14]
  wire  _needAllocVec_T_2 = stgData_0_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:69]
  wire  needAllocVec_0 = stgValid & laneValid_0 & stgData_0_rdValid & stgData_0_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:52]
  wire  _needAllocVec_T_4 = stgValid & laneValid_1; // @[src/main/scala/backend/rename/RenameStage.scala 75:14]
  wire  _needAllocVec_T_6 = stgData_1_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:69]
  wire  needAllocVec_1 = stgValid & laneValid_1 & stgData_1_rdValid & stgData_1_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:52]
  wire  _needAllocVec_T_8 = stgValid & laneValid_2; // @[src/main/scala/backend/rename/RenameStage.scala 75:14]
  wire  _needAllocVec_T_10 = stgData_2_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:69]
  wire  needAllocVec_2 = stgValid & laneValid_2 & stgData_2_rdValid & stgData_2_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:52]
  wire  canFireThisCycle = freeList_io_canAlloc & snapshotManager_io_allocOk; // @[src/main/scala/backend/rename/RenameStage.scala 83:47]
  wire  outFire = stgValid & outReadyAll & canFireThisCycle & ~io_stall; // @[src/main/scala/backend/rename/RenameStage.scala 85:61]
  wire  stgReady = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 88:28]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 89:45]
  wire  inFire = inValid & stgReady; // @[src/main/scala/backend/rename/RenameStage.scala 90:25]
  wire  _GEN_0 = outFire ? 1'h0 : stgValid; // @[src/main/scala/backend/rename/RenameStage.scala 106:23 107:14 66:26]
  wire  _GEN_4 = inFire | _GEN_0; // @[src/main/scala/backend/rename/RenameStage.scala 100:22 101:14]
  wire  needSs_0 = _needAllocVec_T & (stgData_0_ctrl_isBranch & ~stgData_0_pdInfo_isJal | stgData_0_pdInfo_isJalr); // @[src/main/scala/backend/rename/RenameStage.scala 116:30]
  wire  needSs_1 = _needAllocVec_T_4 & (stgData_1_ctrl_isBranch & ~stgData_1_pdInfo_isJal | stgData_1_pdInfo_isJalr); // @[src/main/scala/backend/rename/RenameStage.scala 116:30]
  wire  needSs_2 = _needAllocVec_T_8 & (stgData_2_ctrl_isBranch & ~stgData_2_pdInfo_isJal | stgData_2_pdInfo_isJalr); // @[src/main/scala/backend/rename/RenameStage.scala 116:30]
  wire  _doNeedSs_T_1 = ~_snapshotManager_io_resolveAllSs_T; // @[src/main/scala/backend/rename/RenameStage.scala 120:30]
  wire  jHasAlloc = laneValid_0 & needAllocVec_0 & _needAllocVec_T_2; // @[src/main/scala/backend/rename/RenameStage.scala 211:55]
  wire [6:0] prs1Raw_1 = rat_io_readPorts_1_data; // @[src/main/scala/backend/rename/RenameStage.scala 197:{27,27}]
  wire [6:0] prs1Final_1 = jHasAlloc & stgData_0_rd == stgData_1_rs1 & stgData_1_rs1Valid ?
    freeList_io_allocPdest_0_bits : prs1Raw_1; // @[src/main/scala/backend/rename/RenameStage.scala 206:21 213:82 214:22]
  wire [6:0] prs2Raw_1 = rat_io_readPorts_4_data; // @[src/main/scala/backend/rename/RenameStage.scala 198:{27,27}]
  wire [6:0] prs2Final_1 = jHasAlloc & stgData_0_rd == stgData_1_rs2 & stgData_1_rs2Valid ?
    freeList_io_allocPdest_0_bits : prs2Raw_1; // @[src/main/scala/backend/rename/RenameStage.scala 207:21 216:82 217:22]
  wire [6:0] oldPdstRaw_1 = rat_io_readPorts_7_data; // @[src/main/scala/backend/rename/RenameStage.scala 199:{27,27}]
  wire [6:0] oldPdstFinal_1 = jHasAlloc & stgData_0_rd == stgData_1_rd ? freeList_io_allocPdest_0_bits : oldPdstRaw_1; // @[src/main/scala/backend/rename/RenameStage.scala 208:21 219:58 220:25]
  wire [6:0] prs1Raw_2 = rat_io_readPorts_2_data; // @[src/main/scala/backend/rename/RenameStage.scala 197:{27,27}]
  wire [6:0] _GEN_333 = jHasAlloc & stgData_0_rd == stgData_2_rs1 & stgData_2_rs1Valid ? freeList_io_allocPdest_0_bits
     : prs1Raw_2; // @[src/main/scala/backend/rename/RenameStage.scala 206:21 213:82 214:22]
  wire [6:0] prs2Raw_2 = rat_io_readPorts_5_data; // @[src/main/scala/backend/rename/RenameStage.scala 198:{27,27}]
  wire [6:0] _GEN_334 = jHasAlloc & stgData_0_rd == stgData_2_rs2 & stgData_2_rs2Valid ? freeList_io_allocPdest_0_bits
     : prs2Raw_2; // @[src/main/scala/backend/rename/RenameStage.scala 207:21 216:82 217:22]
  wire [6:0] oldPdstRaw_2 = rat_io_readPorts_8_data; // @[src/main/scala/backend/rename/RenameStage.scala 199:{27,27}]
  wire [6:0] _GEN_335 = jHasAlloc & stgData_0_rd == stgData_2_rd ? freeList_io_allocPdest_0_bits : oldPdstRaw_2; // @[src/main/scala/backend/rename/RenameStage.scala 208:21 219:58 220:25]
  wire  jHasAlloc_2 = laneValid_1 & needAllocVec_1 & _needAllocVec_T_6; // @[src/main/scala/backend/rename/RenameStage.scala 211:55]
  wire [6:0] prs1Final_2 = jHasAlloc_2 & stgData_1_rd == stgData_2_rs1 & stgData_2_rs1Valid ?
    freeList_io_allocPdest_1_bits : _GEN_333; // @[src/main/scala/backend/rename/RenameStage.scala 213:82 214:22]
  wire [6:0] prs2Final_2 = jHasAlloc_2 & stgData_1_rd == stgData_2_rs2 & stgData_2_rs2Valid ?
    freeList_io_allocPdest_1_bits : _GEN_334; // @[src/main/scala/backend/rename/RenameStage.scala 216:82 217:22]
  wire [6:0] oldPdstFinal_2 = jHasAlloc_2 & stgData_1_rd == stgData_2_rd ? freeList_io_allocPdest_1_bits : _GEN_335; // @[src/main/scala/backend/rename/RenameStage.scala 219:58 220:25]
  reg [5:0] robIdxHead_value; // @[src/main/scala/backend/rename/RenameStage.scala 226:27]
  reg  robIdxHead_flag; // @[src/main/scala/backend/rename/RenameStage.scala 226:27]
  wire [1:0] _validCount_T_3 = _needAllocVec_T_4 + _needAllocVec_T_8; // @[src/main/scala/backend/rename/RenameStage.scala 229:28]
  wire [1:0] _GEN_343 = {{1'd0}, _needAllocVec_T}; // @[src/main/scala/backend/rename/RenameStage.scala 229:28]
  wire [2:0] _validCount_T_5 = _GEN_343 + _validCount_T_3; // @[src/main/scala/backend/rename/RenameStage.scala 229:28]
  wire [1:0] validCount = _validCount_T_5[1:0]; // @[src/main/scala/backend/rename/RenameStage.scala 229:28]
  wire [6:0] robIdxHeadNext_newIncValue = io_redirectInfo_bits_robIdx_value + 6'h1; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  robIdxHeadNext_wrap = robIdxHeadNext_newIncValue >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [5:0] robIdxHeadNext_newPtr_value = robIdxHeadNext_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire [5:0] _GEN_344 = {{4'd0}, validCount}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [6:0] robIdxHeadNext_newIncValue_1 = robIdxHead_value + _GEN_344; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  robIdxHeadNext_wrap_1 = robIdxHeadNext_newIncValue_1 >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [5:0] robIdxHeadNext_newPtr_1_value = robIdxHeadNext_newIncValue_1[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire [6:0] robIndices_0_newIncValue = {{1'd0}, robIdxHead_value}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  robIndices_0_wrap = robIndices_0_newIncValue >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [5:0] _GEN_345 = {{5'd0}, laneValid_0}; // @[src/main/scala/backend/rename/RenameStage.scala 251:27]
  wire [6:0] _T_24 = {{1'd0}, _GEN_345}; // @[src/main/scala/backend/rename/RenameStage.scala 251:27]
  wire [6:0] robIndices_1_newIncValue = robIdxHead_value + _T_24[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  robIndices_1_wrap = robIndices_1_newIncValue >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [5:0] _GEN_346 = {{5'd0}, laneValid_1}; // @[src/main/scala/backend/rename/RenameStage.scala 251:27]
  wire [5:0] _T_27 = _T_24[5:0] + _GEN_346; // @[src/main/scala/backend/rename/RenameStage.scala 251:27]
  wire [6:0] robIndices_2_newIncValue = robIdxHead_value + _T_27; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  robIndices_2_wrap = robIndices_2_newIncValue >= 7'h40; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [6:0] prs1Raw_0 = rat_io_readPorts_0_data; // @[src/main/scala/backend/rename/RenameStage.scala 197:{27,27}]
  wire [6:0] prs2Raw_0 = rat_io_readPorts_3_data; // @[src/main/scala/backend/rename/RenameStage.scala 198:{27,27}]
  wire [6:0] oldPdstRaw_0 = rat_io_readPorts_6_data; // @[src/main/scala/backend/rename/RenameStage.scala 199:{27,27}]
  RenameTable rat ( // @[src/main/scala/backend/rename/RenameStage.scala 53:31]
    .clock(rat_clock),
    .reset(rat_reset),
    .io_redirect(rat_io_redirect),
    .io_doRecover(rat_io_doRecover),
    .io_recoverId(rat_io_recoverId),
    .io_readPorts_0_addr(rat_io_readPorts_0_addr),
    .io_readPorts_0_hold(rat_io_readPorts_0_hold),
    .io_readPorts_0_data(rat_io_readPorts_0_data),
    .io_readPorts_1_addr(rat_io_readPorts_1_addr),
    .io_readPorts_1_hold(rat_io_readPorts_1_hold),
    .io_readPorts_1_data(rat_io_readPorts_1_data),
    .io_readPorts_2_addr(rat_io_readPorts_2_addr),
    .io_readPorts_2_hold(rat_io_readPorts_2_hold),
    .io_readPorts_2_data(rat_io_readPorts_2_data),
    .io_readPorts_3_addr(rat_io_readPorts_3_addr),
    .io_readPorts_3_hold(rat_io_readPorts_3_hold),
    .io_readPorts_3_data(rat_io_readPorts_3_data),
    .io_readPorts_4_addr(rat_io_readPorts_4_addr),
    .io_readPorts_4_hold(rat_io_readPorts_4_hold),
    .io_readPorts_4_data(rat_io_readPorts_4_data),
    .io_readPorts_5_addr(rat_io_readPorts_5_addr),
    .io_readPorts_5_hold(rat_io_readPorts_5_hold),
    .io_readPorts_5_data(rat_io_readPorts_5_data),
    .io_readPorts_6_addr(rat_io_readPorts_6_addr),
    .io_readPorts_6_data(rat_io_readPorts_6_data),
    .io_readPorts_7_addr(rat_io_readPorts_7_addr),
    .io_readPorts_7_data(rat_io_readPorts_7_data),
    .io_readPorts_8_addr(rat_io_readPorts_8_addr),
    .io_readPorts_8_data(rat_io_readPorts_8_data),
    .io_specWritePorts_0_wen(rat_io_specWritePorts_0_wen),
    .io_specWritePorts_0_addr(rat_io_specWritePorts_0_addr),
    .io_specWritePorts_0_data(rat_io_specWritePorts_0_data),
    .io_specWritePorts_1_wen(rat_io_specWritePorts_1_wen),
    .io_specWritePorts_1_addr(rat_io_specWritePorts_1_addr),
    .io_specWritePorts_1_data(rat_io_specWritePorts_1_data),
    .io_specWritePorts_2_wen(rat_io_specWritePorts_2_wen),
    .io_specWritePorts_2_addr(rat_io_specWritePorts_2_addr),
    .io_specWritePorts_2_data(rat_io_specWritePorts_2_data),
    .io_archWritePorts_0_wen(rat_io_archWritePorts_0_wen),
    .io_archWritePorts_0_addr(rat_io_archWritePorts_0_addr),
    .io_archWritePorts_0_data(rat_io_archWritePorts_0_data),
    .io_archWritePorts_1_wen(rat_io_archWritePorts_1_wen),
    .io_archWritePorts_1_addr(rat_io_archWritePorts_1_addr),
    .io_archWritePorts_1_data(rat_io_archWritePorts_1_data),
    .io_archWritePorts_2_wen(rat_io_archWritePorts_2_wen),
    .io_archWritePorts_2_addr(rat_io_archWritePorts_2_addr),
    .io_archWritePorts_2_data(rat_io_archWritePorts_2_data),
    .io_archReadPorts_0_laddr(rat_io_archReadPorts_0_laddr),
    .io_archReadPorts_0_pdata(rat_io_archReadPorts_0_pdata),
    .io_archReadPorts_1_laddr(rat_io_archReadPorts_1_laddr),
    .io_archReadPorts_1_pdata(rat_io_archReadPorts_1_pdata),
    .io_archReadPorts_2_laddr(rat_io_archReadPorts_2_laddr),
    .io_archReadPorts_2_pdata(rat_io_archReadPorts_2_pdata),
    .io_snptSave_0_valid(rat_io_snptSave_0_valid),
    .io_snptSave_0_bits(rat_io_snptSave_0_bits),
    .io_snptSave_1_valid(rat_io_snptSave_1_valid),
    .io_snptSave_1_bits(rat_io_snptSave_1_bits),
    .io_snptSave_2_valid(rat_io_snptSave_2_valid),
    .io_snptSave_2_bits(rat_io_snptSave_2_bits),
    .io_snptInvalidate_0(rat_io_snptInvalidate_0),
    .io_snptInvalidate_1(rat_io_snptInvalidate_1),
    .io_snptInvalidate_2(rat_io_snptInvalidate_2),
    .io_snptInvalidate_3(rat_io_snptInvalidate_3),
    .io_snptInvalidate_4(rat_io_snptInvalidate_4),
    .io_snptInvalidate_5(rat_io_snptInvalidate_5),
    .io_snptInvalidate_6(rat_io_snptInvalidate_6),
    .io_snptInvalidate_7(rat_io_snptInvalidate_7)
  );
  FreeList freeList ( // @[src/main/scala/backend/rename/RenameStage.scala 54:31]
    .clock(freeList_clock),
    .reset(freeList_reset),
    .io_allocReqs_0(freeList_io_allocReqs_0),
    .io_allocReqs_1(freeList_io_allocReqs_1),
    .io_allocReqs_2(freeList_io_allocReqs_2),
    .io_allocPdest_0_bits(freeList_io_allocPdest_0_bits),
    .io_allocPdest_1_bits(freeList_io_allocPdest_1_bits),
    .io_allocPdest_2_bits(freeList_io_allocPdest_2_bits),
    .io_canAlloc(freeList_io_canAlloc),
    .io_doAlloc(freeList_io_doAlloc),
    .io_deallocReqs_0_valid(freeList_io_deallocReqs_0_valid),
    .io_deallocReqs_0_bits(freeList_io_deallocReqs_0_bits),
    .io_deallocReqs_1_valid(freeList_io_deallocReqs_1_valid),
    .io_deallocReqs_1_bits(freeList_io_deallocReqs_1_bits),
    .io_deallocReqs_2_valid(freeList_io_deallocReqs_2_valid),
    .io_deallocReqs_2_bits(freeList_io_deallocReqs_2_bits),
    .io_snptSave_0_valid(freeList_io_snptSave_0_valid),
    .io_snptSave_0_bits(freeList_io_snptSave_0_bits),
    .io_snptSave_1_valid(freeList_io_snptSave_1_valid),
    .io_snptSave_1_bits(freeList_io_snptSave_1_bits),
    .io_snptSave_2_valid(freeList_io_snptSave_2_valid),
    .io_snptSave_2_bits(freeList_io_snptSave_2_bits),
    .io_doRecover(freeList_io_doRecover),
    .io_recoverId(freeList_io_recoverId),
    .io_snptInvalidate_0(freeList_io_snptInvalidate_0),
    .io_snptInvalidate_1(freeList_io_snptInvalidate_1),
    .io_snptInvalidate_2(freeList_io_snptInvalidate_2),
    .io_snptInvalidate_3(freeList_io_snptInvalidate_3),
    .io_snptInvalidate_4(freeList_io_snptInvalidate_4),
    .io_snptInvalidate_5(freeList_io_snptInvalidate_5),
    .io_snptInvalidate_6(freeList_io_snptInvalidate_6),
    .io_snptInvalidate_7(freeList_io_snptInvalidate_7)
  );
  SnapshotManager snapshotManager ( // @[src/main/scala/backend/rename/RenameStage.scala 55:31]
    .clock(snapshotManager_clock),
    .reset(snapshotManager_reset),
    .io_doAllocReqs_0(snapshotManager_io_doAllocReqs_0),
    .io_doAllocReqs_1(snapshotManager_io_doAllocReqs_1),
    .io_doAllocReqs_2(snapshotManager_io_doAllocReqs_2),
    .io_allocReqs_0(snapshotManager_io_allocReqs_0),
    .io_allocReqs_1(snapshotManager_io_allocReqs_1),
    .io_allocReqs_2(snapshotManager_io_allocReqs_2),
    .io_allocOk(snapshotManager_io_allocOk),
    .io_allocIds_0_valid(snapshotManager_io_allocIds_0_valid),
    .io_allocIds_0_bits(snapshotManager_io_allocIds_0_bits),
    .io_allocIds_1_valid(snapshotManager_io_allocIds_1_valid),
    .io_allocIds_1_bits(snapshotManager_io_allocIds_1_bits),
    .io_allocIds_2_valid(snapshotManager_io_allocIds_2_valid),
    .io_allocIds_2_bits(snapshotManager_io_allocIds_2_bits),
    .io_resolve_valid(snapshotManager_io_resolve_valid),
    .io_resolve_bits_snptId(snapshotManager_io_resolve_bits_snptId),
    .io_resolve_bits_isMispredict(snapshotManager_io_resolve_bits_isMispredict),
    .io_resolveAllSs(snapshotManager_io_resolveAllSs),
    .io_doRecover(snapshotManager_io_doRecover),
    .io_recoverId(snapshotManager_io_recoverId),
    .io_invalidateSlots_0(snapshotManager_io_invalidateSlots_0),
    .io_invalidateSlots_1(snapshotManager_io_invalidateSlots_1),
    .io_invalidateSlots_2(snapshotManager_io_invalidateSlots_2),
    .io_invalidateSlots_3(snapshotManager_io_invalidateSlots_3),
    .io_invalidateSlots_4(snapshotManager_io_invalidateSlots_4),
    .io_invalidateSlots_5(snapshotManager_io_invalidateSlots_5),
    .io_invalidateSlots_6(snapshotManager_io_invalidateSlots_6),
    .io_invalidateSlots_7(snapshotManager_io_invalidateSlots_7)
  );
  assign io_in_0_ready = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 88:28]
  assign io_in_1_ready = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 88:28]
  assign io_in_2_ready = ~stgValid | outFire; // @[src/main/scala/backend/rename/RenameStage.scala 88:28]
  assign io_out_0_valid = _needAllocVec_T & canFireThisCycle; // @[src/main/scala/backend/rename/RenameStage.scala 287:49]
  assign io_out_0_bits_pc = stgData_0_pc; // @[src/main/scala/backend/rename/RenameStage.scala 260:18]
  assign io_out_0_bits_inst = stgData_0_inst; // @[src/main/scala/backend/rename/RenameStage.scala 261:18]
  assign io_out_0_bits_ctrl_fuType = stgData_0_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_aluOp = stgData_0_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_bruOp = stgData_0_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_lsuOp = stgData_0_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_csrOp = stgData_0_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_mulOp = stgData_0_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_divOp = stgData_0_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_src1Type = stgData_0_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_src2Type = stgData_0_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_immType = stgData_0_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_rfWen = stgData_0_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_memRead = stgData_0_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_memWrite = stgData_0_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_csrWen = stgData_0_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_isBranch = stgData_0_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_isJump = stgData_0_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_ctrl_isPriv = stgData_0_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_0_bits_excp_excpVec = stgData_0_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 263:18]
  assign io_out_0_bits_imm = stgData_0_imm; // @[src/main/scala/backend/rename/RenameStage.scala 264:18]
  assign io_out_0_bits_csrAddress = stgData_0_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 265:18]
  assign io_out_0_bits_pdInfo_valid = stgData_0_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_0_bits_pdInfo_isBr = stgData_0_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_0_bits_pdInfo_isJal = stgData_0_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_0_bits_pdInfo_isJalr = stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_0_bits_pdInfo_isCall = stgData_0_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_0_bits_pdInfo_isRet = stgData_0_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_0_bits_pdInfo_jumpTarget = stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_0_bits_bpuInfo_pc = stgData_0_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_fallThrough = stgData_0_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_taken = stgData_0_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_target = stgData_0_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_takenOffset = stgData_0_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_valid = stgData_0_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_btbHit = stgData_0_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_btbIsJalr = stgData_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_btbIsJal = stgData_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_btbIsCall = stgData_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_btbIsRet = stgData_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_btbOffset = stgData_0_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_phtCounter = stgData_0_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_rasTop = stgData_0_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_predTaken = stgData_0_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_bpuInfo_meta_predTarget = stgData_0_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_0_bits_ldst = stgData_0_rd; // @[src/main/scala/backend/rename/RenameStage.scala 269:12]
  assign io_out_0_bits_lrs1 = stgData_0_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 270:12]
  assign io_out_0_bits_lrs2 = stgData_0_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 271:12]
  assign io_out_0_bits_pdst = needAllocVec_0 ? freeList_io_allocPdest_0_bits : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 275:18]
  assign io_out_0_bits_prs1 = stgData_0_rs1 == 5'h0 | ~stgData_0_rs1Valid ? 7'h0 : prs1Raw_0; // @[src/main/scala/backend/rename/RenameStage.scala 273:18]
  assign io_out_0_bits_prs2 = stgData_0_rs2 == 5'h0 | ~stgData_0_rs2Valid ? 7'h0 : prs2Raw_0; // @[src/main/scala/backend/rename/RenameStage.scala 274:18]
  assign io_out_0_bits_oldPdst = needAllocVec_0 & _needAllocVec_T_2 ? oldPdstRaw_0 : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 276:21]
  assign io_out_0_bits_snptId_valid = snapshotManager_io_allocIds_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 285:14]
  assign io_out_0_bits_snptId_bits = snapshotManager_io_allocIds_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 285:14]
  assign io_out_0_bits_rs1Valid = stgData_0_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 278:16]
  assign io_out_0_bits_rs2Valid = stgData_0_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 279:16]
  assign io_out_0_bits_rdValid = stgData_0_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 280:16]
  assign io_out_0_bits_robIdx_value = robIndices_0_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_out_0_bits_robIdx_flag = robIndices_0_wrap ? ~robIdxHead_flag : robIdxHead_flag; // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
  assign io_out_1_valid = _needAllocVec_T_4 & canFireThisCycle; // @[src/main/scala/backend/rename/RenameStage.scala 287:49]
  assign io_out_1_bits_pc = stgData_1_pc; // @[src/main/scala/backend/rename/RenameStage.scala 260:18]
  assign io_out_1_bits_inst = stgData_1_inst; // @[src/main/scala/backend/rename/RenameStage.scala 261:18]
  assign io_out_1_bits_ctrl_fuType = stgData_1_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_aluOp = stgData_1_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_bruOp = stgData_1_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_lsuOp = stgData_1_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_csrOp = stgData_1_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_mulOp = stgData_1_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_divOp = stgData_1_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_src1Type = stgData_1_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_src2Type = stgData_1_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_immType = stgData_1_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_rfWen = stgData_1_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_memRead = stgData_1_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_memWrite = stgData_1_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_csrWen = stgData_1_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_isBranch = stgData_1_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_isJump = stgData_1_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_ctrl_isPriv = stgData_1_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_1_bits_excp_excpVec = stgData_1_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 263:18]
  assign io_out_1_bits_imm = stgData_1_imm; // @[src/main/scala/backend/rename/RenameStage.scala 264:18]
  assign io_out_1_bits_csrAddress = stgData_1_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 265:18]
  assign io_out_1_bits_pdInfo_valid = stgData_1_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_1_bits_pdInfo_isBr = stgData_1_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_1_bits_pdInfo_isJal = stgData_1_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_1_bits_pdInfo_isJalr = stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_1_bits_pdInfo_isCall = stgData_1_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_1_bits_pdInfo_isRet = stgData_1_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_1_bits_pdInfo_jumpTarget = stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_1_bits_bpuInfo_pc = stgData_1_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_fallThrough = stgData_1_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_taken = stgData_1_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_target = stgData_1_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_takenOffset = stgData_1_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_valid = stgData_1_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_btbHit = stgData_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_btbIsJalr = stgData_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_btbIsJal = stgData_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_btbIsCall = stgData_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_btbIsRet = stgData_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_btbOffset = stgData_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_phtCounter = stgData_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_rasTop = stgData_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_predTaken = stgData_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_bpuInfo_meta_predTarget = stgData_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_1_bits_ldst = stgData_1_rd; // @[src/main/scala/backend/rename/RenameStage.scala 269:12]
  assign io_out_1_bits_lrs1 = stgData_1_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 270:12]
  assign io_out_1_bits_lrs2 = stgData_1_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 271:12]
  assign io_out_1_bits_pdst = needAllocVec_1 ? freeList_io_allocPdest_1_bits : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 275:18]
  assign io_out_1_bits_prs1 = stgData_1_rs1 == 5'h0 | ~stgData_1_rs1Valid ? 7'h0 : prs1Final_1; // @[src/main/scala/backend/rename/RenameStage.scala 273:18]
  assign io_out_1_bits_prs2 = stgData_1_rs2 == 5'h0 | ~stgData_1_rs2Valid ? 7'h0 : prs2Final_1; // @[src/main/scala/backend/rename/RenameStage.scala 274:18]
  assign io_out_1_bits_oldPdst = needAllocVec_1 & _needAllocVec_T_6 ? oldPdstFinal_1 : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 276:21]
  assign io_out_1_bits_snptId_valid = snapshotManager_io_allocIds_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 285:14]
  assign io_out_1_bits_snptId_bits = snapshotManager_io_allocIds_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 285:14]
  assign io_out_1_bits_rs1Valid = stgData_1_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 278:16]
  assign io_out_1_bits_rs2Valid = stgData_1_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 279:16]
  assign io_out_1_bits_rdValid = stgData_1_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 280:16]
  assign io_out_1_bits_robIdx_value = robIndices_1_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_out_1_bits_robIdx_flag = robIndices_1_wrap ? ~robIdxHead_flag : robIdxHead_flag; // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
  assign io_out_2_valid = _needAllocVec_T_8 & canFireThisCycle; // @[src/main/scala/backend/rename/RenameStage.scala 287:49]
  assign io_out_2_bits_pc = stgData_2_pc; // @[src/main/scala/backend/rename/RenameStage.scala 260:18]
  assign io_out_2_bits_inst = stgData_2_inst; // @[src/main/scala/backend/rename/RenameStage.scala 261:18]
  assign io_out_2_bits_ctrl_fuType = stgData_2_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_aluOp = stgData_2_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_bruOp = stgData_2_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_lsuOp = stgData_2_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_csrOp = stgData_2_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_mulOp = stgData_2_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_divOp = stgData_2_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_src1Type = stgData_2_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_src2Type = stgData_2_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_immType = stgData_2_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_rfWen = stgData_2_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_memRead = stgData_2_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_memWrite = stgData_2_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_csrWen = stgData_2_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_isBranch = stgData_2_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_isJump = stgData_2_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_ctrl_isPriv = stgData_2_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 262:18]
  assign io_out_2_bits_excp_excpVec = stgData_2_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 263:18]
  assign io_out_2_bits_imm = stgData_2_imm; // @[src/main/scala/backend/rename/RenameStage.scala 264:18]
  assign io_out_2_bits_csrAddress = stgData_2_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 265:18]
  assign io_out_2_bits_pdInfo_valid = stgData_2_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_2_bits_pdInfo_isBr = stgData_2_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_2_bits_pdInfo_isJal = stgData_2_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_2_bits_pdInfo_isJalr = stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_2_bits_pdInfo_isCall = stgData_2_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_2_bits_pdInfo_isRet = stgData_2_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_2_bits_pdInfo_jumpTarget = stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 266:18]
  assign io_out_2_bits_bpuInfo_pc = stgData_2_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_fallThrough = stgData_2_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_taken = stgData_2_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_target = stgData_2_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_takenOffset = stgData_2_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_valid = stgData_2_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_btbHit = stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_btbIsJalr = stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_btbIsJal = stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_btbIsCall = stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_btbIsRet = stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_btbOffset = stgData_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_phtCounter = stgData_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_rasTop = stgData_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_predTaken = stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_bpuInfo_meta_predTarget = stgData_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 267:18]
  assign io_out_2_bits_ldst = stgData_2_rd; // @[src/main/scala/backend/rename/RenameStage.scala 269:12]
  assign io_out_2_bits_lrs1 = stgData_2_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 270:12]
  assign io_out_2_bits_lrs2 = stgData_2_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 271:12]
  assign io_out_2_bits_pdst = needAllocVec_2 ? freeList_io_allocPdest_2_bits : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 275:18]
  assign io_out_2_bits_prs1 = stgData_2_rs1 == 5'h0 | ~stgData_2_rs1Valid ? 7'h0 : prs1Final_2; // @[src/main/scala/backend/rename/RenameStage.scala 273:18]
  assign io_out_2_bits_prs2 = stgData_2_rs2 == 5'h0 | ~stgData_2_rs2Valid ? 7'h0 : prs2Final_2; // @[src/main/scala/backend/rename/RenameStage.scala 274:18]
  assign io_out_2_bits_oldPdst = needAllocVec_2 & _needAllocVec_T_10 ? oldPdstFinal_2 : 7'h0; // @[src/main/scala/backend/rename/RenameStage.scala 276:21]
  assign io_out_2_bits_snptId_valid = snapshotManager_io_allocIds_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 285:14]
  assign io_out_2_bits_snptId_bits = snapshotManager_io_allocIds_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 285:14]
  assign io_out_2_bits_rs1Valid = stgData_2_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 278:16]
  assign io_out_2_bits_rs2Valid = stgData_2_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 279:16]
  assign io_out_2_bits_rdValid = stgData_2_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 280:16]
  assign io_out_2_bits_robIdx_value = robIndices_2_newIncValue[5:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_out_2_bits_robIdx_flag = robIndices_2_wrap ? ~robIdxHead_flag : robIdxHead_flag; // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
  assign rat_clock = clock;
  assign rat_reset = reset;
  assign rat_io_redirect = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/rename/RenameStage.scala 96:39]
  assign rat_io_doRecover = snapshotManager_io_doRecover; // @[src/main/scala/backend/rename/RenameStage.scala 173:24]
  assign rat_io_recoverId = snapshotManager_io_recoverId; // @[src/main/scala/backend/rename/RenameStage.scala 174:24]
  assign rat_io_readPorts_0_addr = io_ratRead_0_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 138:44]
  assign rat_io_readPorts_0_hold = io_ratRead_0_hold1; // @[src/main/scala/backend/rename/RenameStage.scala 139:44]
  assign rat_io_readPorts_1_addr = io_ratRead_1_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 138:44]
  assign rat_io_readPorts_1_hold = io_ratRead_1_hold1; // @[src/main/scala/backend/rename/RenameStage.scala 139:44]
  assign rat_io_readPorts_2_addr = io_ratRead_2_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 138:44]
  assign rat_io_readPorts_2_hold = io_ratRead_2_hold1; // @[src/main/scala/backend/rename/RenameStage.scala 139:44]
  assign rat_io_readPorts_3_addr = io_ratRead_0_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 140:49]
  assign rat_io_readPorts_3_hold = io_ratRead_0_hold2; // @[src/main/scala/backend/rename/RenameStage.scala 141:49]
  assign rat_io_readPorts_4_addr = io_ratRead_1_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 140:49]
  assign rat_io_readPorts_4_hold = io_ratRead_1_hold2; // @[src/main/scala/backend/rename/RenameStage.scala 141:49]
  assign rat_io_readPorts_5_addr = io_ratRead_2_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 140:49]
  assign rat_io_readPorts_5_hold = io_ratRead_2_hold2; // @[src/main/scala/backend/rename/RenameStage.scala 141:49]
  assign rat_io_readPorts_6_addr = stgValid ? stgData_0_rd : io_in_0_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 143:10]
  assign rat_io_readPorts_7_addr = stgValid ? stgData_1_rd : io_in_1_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 143:10]
  assign rat_io_readPorts_8_addr = stgValid ? stgData_2_rd : io_in_2_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 143:10]
  assign rat_io_specWritePorts_0_wen = outFire & needAllocVec_0; // @[src/main/scala/backend/rename/RenameStage.scala 156:39]
  assign rat_io_specWritePorts_0_addr = stgData_0_rd; // @[src/main/scala/backend/rename/RenameStage.scala 154:28 157:28]
  assign rat_io_specWritePorts_0_data = freeList_io_allocPdest_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 154:28 158:28]
  assign rat_io_specWritePorts_1_wen = outFire & needAllocVec_1; // @[src/main/scala/backend/rename/RenameStage.scala 156:39]
  assign rat_io_specWritePorts_1_addr = stgData_1_rd; // @[src/main/scala/backend/rename/RenameStage.scala 154:28 157:28]
  assign rat_io_specWritePorts_1_data = freeList_io_allocPdest_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 154:28 158:28]
  assign rat_io_specWritePorts_2_wen = outFire & needAllocVec_2; // @[src/main/scala/backend/rename/RenameStage.scala 156:39]
  assign rat_io_specWritePorts_2_addr = stgData_2_rd; // @[src/main/scala/backend/rename/RenameStage.scala 154:28 157:28]
  assign rat_io_specWritePorts_2_data = freeList_io_allocPdest_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 154:28 158:28]
  assign rat_io_archWritePorts_0_wen = io_archCommit_0_valid & io_archCommit_0_rfWen & ~io_archCommit_0_isWalk; // @[src/main/scala/backend/rename/RenameStage.scala 164:87]
  assign rat_io_archWritePorts_0_addr = io_archCommit_0_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 165:35]
  assign rat_io_archWritePorts_0_data = io_archCommit_0_pdst; // @[src/main/scala/backend/rename/RenameStage.scala 166:35]
  assign rat_io_archWritePorts_1_wen = io_archCommit_1_valid & io_archCommit_1_rfWen & ~io_archCommit_1_isWalk; // @[src/main/scala/backend/rename/RenameStage.scala 164:87]
  assign rat_io_archWritePorts_1_addr = io_archCommit_1_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 165:35]
  assign rat_io_archWritePorts_1_data = io_archCommit_1_pdst; // @[src/main/scala/backend/rename/RenameStage.scala 166:35]
  assign rat_io_archWritePorts_2_wen = io_archCommit_2_valid & io_archCommit_2_rfWen & ~io_archCommit_2_isWalk; // @[src/main/scala/backend/rename/RenameStage.scala 164:87]
  assign rat_io_archWritePorts_2_addr = io_archCommit_2_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 165:35]
  assign rat_io_archWritePorts_2_data = io_archCommit_2_pdst; // @[src/main/scala/backend/rename/RenameStage.scala 166:35]
  assign rat_io_archReadPorts_0_laddr = io_archCommit_0_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 189:38]
  assign rat_io_archReadPorts_1_laddr = io_archCommit_1_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 189:38]
  assign rat_io_archReadPorts_2_laddr = io_archCommit_2_ldst; // @[src/main/scala/backend/rename/RenameStage.scala 189:38]
  assign rat_io_snptSave_0_valid = snapshotManager_io_allocIds_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 175:24]
  assign rat_io_snptSave_0_bits = snapshotManager_io_allocIds_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 175:24]
  assign rat_io_snptSave_1_valid = snapshotManager_io_allocIds_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 175:24]
  assign rat_io_snptSave_1_bits = snapshotManager_io_allocIds_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 175:24]
  assign rat_io_snptSave_2_valid = snapshotManager_io_allocIds_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 175:24]
  assign rat_io_snptSave_2_bits = snapshotManager_io_allocIds_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 175:24]
  assign rat_io_snptInvalidate_0 = snapshotManager_io_invalidateSlots_0; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign rat_io_snptInvalidate_1 = snapshotManager_io_invalidateSlots_1; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign rat_io_snptInvalidate_2 = snapshotManager_io_invalidateSlots_2; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign rat_io_snptInvalidate_3 = snapshotManager_io_invalidateSlots_3; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign rat_io_snptInvalidate_4 = snapshotManager_io_invalidateSlots_4; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign rat_io_snptInvalidate_5 = snapshotManager_io_invalidateSlots_5; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign rat_io_snptInvalidate_6 = snapshotManager_io_invalidateSlots_6; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign rat_io_snptInvalidate_7 = snapshotManager_io_invalidateSlots_7; // @[src/main/scala/backend/rename/RenameStage.scala 176:25]
  assign freeList_clock = clock;
  assign freeList_reset = reset;
  assign freeList_io_allocReqs_0 = stgValid & laneValid_0 & stgData_0_rdValid & stgData_0_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:52]
  assign freeList_io_allocReqs_1 = stgValid & laneValid_1 & stgData_1_rdValid & stgData_1_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:52]
  assign freeList_io_allocReqs_2 = stgValid & laneValid_2 & stgData_2_rdValid & stgData_2_rd != 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 75:52]
  assign freeList_io_doAlloc = outFire & _doNeedSs_T_1; // @[src/main/scala/backend/rename/RenameStage.scala 151:34]
  assign freeList_io_deallocReqs_0_valid = io_archCommit_0_valid & io_archCommit_0_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 190:64]
  assign freeList_io_deallocReqs_0_bits = io_archCommit_0_isWalk ? io_archCommit_0_pdst : rat_io_archReadPorts_0_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 191:44]
  assign freeList_io_deallocReqs_1_valid = io_archCommit_1_valid & io_archCommit_1_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 190:64]
  assign freeList_io_deallocReqs_1_bits = io_archCommit_1_isWalk ? io_archCommit_1_pdst : rat_io_archReadPorts_1_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 191:44]
  assign freeList_io_deallocReqs_2_valid = io_archCommit_2_valid & io_archCommit_2_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 190:64]
  assign freeList_io_deallocReqs_2_bits = io_archCommit_2_isWalk ? io_archCommit_2_pdst : rat_io_archReadPorts_2_pdata; // @[src/main/scala/backend/rename/RenameStage.scala 191:44]
  assign freeList_io_snptSave_0_valid = snapshotManager_io_allocIds_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 181:30]
  assign freeList_io_snptSave_0_bits = snapshotManager_io_allocIds_0_bits; // @[src/main/scala/backend/rename/RenameStage.scala 181:30]
  assign freeList_io_snptSave_1_valid = snapshotManager_io_allocIds_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 181:30]
  assign freeList_io_snptSave_1_bits = snapshotManager_io_allocIds_1_bits; // @[src/main/scala/backend/rename/RenameStage.scala 181:30]
  assign freeList_io_snptSave_2_valid = snapshotManager_io_allocIds_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 181:30]
  assign freeList_io_snptSave_2_bits = snapshotManager_io_allocIds_2_bits; // @[src/main/scala/backend/rename/RenameStage.scala 181:30]
  assign freeList_io_doRecover = snapshotManager_io_doRecover; // @[src/main/scala/backend/rename/RenameStage.scala 182:30]
  assign freeList_io_recoverId = snapshotManager_io_recoverId; // @[src/main/scala/backend/rename/RenameStage.scala 183:30]
  assign freeList_io_snptInvalidate_0 = snapshotManager_io_invalidateSlots_0; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign freeList_io_snptInvalidate_1 = snapshotManager_io_invalidateSlots_1; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign freeList_io_snptInvalidate_2 = snapshotManager_io_invalidateSlots_2; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign freeList_io_snptInvalidate_3 = snapshotManager_io_invalidateSlots_3; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign freeList_io_snptInvalidate_4 = snapshotManager_io_invalidateSlots_4; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign freeList_io_snptInvalidate_5 = snapshotManager_io_invalidateSlots_5; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign freeList_io_snptInvalidate_6 = snapshotManager_io_invalidateSlots_6; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign freeList_io_snptInvalidate_7 = snapshotManager_io_invalidateSlots_7; // @[src/main/scala/backend/rename/RenameStage.scala 184:30]
  assign snapshotManager_clock = clock;
  assign snapshotManager_reset = reset;
  assign snapshotManager_io_doAllocReqs_0 = needSs_0 & outFire & ~_snapshotManager_io_resolveAllSs_T; // @[src/main/scala/backend/rename/RenameStage.scala 120:27]
  assign snapshotManager_io_doAllocReqs_1 = needSs_1 & outFire & ~_snapshotManager_io_resolveAllSs_T; // @[src/main/scala/backend/rename/RenameStage.scala 120:27]
  assign snapshotManager_io_doAllocReqs_2 = needSs_2 & outFire & ~_snapshotManager_io_resolveAllSs_T; // @[src/main/scala/backend/rename/RenameStage.scala 120:27]
  assign snapshotManager_io_allocReqs_0 = _needAllocVec_T & (stgData_0_ctrl_isBranch & ~stgData_0_pdInfo_isJal |
    stgData_0_pdInfo_isJalr); // @[src/main/scala/backend/rename/RenameStage.scala 116:30]
  assign snapshotManager_io_allocReqs_1 = _needAllocVec_T_4 & (stgData_1_ctrl_isBranch & ~stgData_1_pdInfo_isJal |
    stgData_1_pdInfo_isJalr); // @[src/main/scala/backend/rename/RenameStage.scala 116:30]
  assign snapshotManager_io_allocReqs_2 = _needAllocVec_T_8 & (stgData_2_ctrl_isBranch & ~stgData_2_pdInfo_isJal |
    stgData_2_pdInfo_isJalr); // @[src/main/scala/backend/rename/RenameStage.scala 116:30]
  assign snapshotManager_io_resolve_valid = io_redirectInfo_valid & io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/rename/RenameStage.scala 41:42]
  assign snapshotManager_io_resolve_bits_snptId = io_redirectInfo_bits_snptId; // @[src/main/scala/backend/rename/RenameStage.scala 37:21 42:23]
  assign snapshotManager_io_resolve_bits_isMispredict = io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/rename/RenameStage.scala 37:21 43:29]
  assign snapshotManager_io_resolveAllSs = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect &
    io_redirectInfo_bits_fromRob; // @[src/main/scala/backend/rename/RenameStage.scala 57:95]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 66:26]
      stgValid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 66:26]
    end else if (_snapshotManager_io_resolveAllSs_T) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      stgValid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 98:14]
    end else begin
      stgValid <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
    end else if (_snapshotManager_io_resolveAllSs_T) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 99:54]
    end else if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/rename/RenameStage.scala 103:20]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 106:23]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 108:54]
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
    end else if (_snapshotManager_io_resolveAllSs_T) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 99:54]
    end else if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/rename/RenameStage.scala 103:20]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 106:23]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 108:54]
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 67:26]
    end else if (_snapshotManager_io_resolveAllSs_T) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 99:54]
    end else if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/rename/RenameStage.scala 103:20]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 106:23]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 108:54]
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pc <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_inst <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_inst <= io_in_0_bits_inst; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_rd <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_rd <= io_in_0_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_rs1 <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_rs1 <= io_in_0_bits_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_rs2 <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_rs2 <= io_in_0_bits_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_rs1Valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_rs1Valid <= io_in_0_bits_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_rs2Valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_rs2Valid <= io_in_0_bits_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_rdValid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_rdValid <= io_in_0_bits_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_csrAddress <= 14'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_csrAddress <= io_in_0_bits_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_imm <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_imm <= io_in_0_bits_imm; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_fuType <= io_in_0_bits_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_aluOp <= io_in_0_bits_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_bruOp <= io_in_0_bits_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_lsuOp <= io_in_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_csrOp <= io_in_0_bits_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_mulOp <= io_in_0_bits_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_divOp <= io_in_0_bits_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_src1Type <= io_in_0_bits_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_src2Type <= io_in_0_bits_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_immType <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_immType <= io_in_0_bits_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_rfWen <= io_in_0_bits_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_memRead <= io_in_0_bits_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_memWrite <= io_in_0_bits_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_csrWen <= io_in_0_bits_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_isBranch <= io_in_0_bits_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_isJump <= io_in_0_bits_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_ctrl_isPriv <= io_in_0_bits_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_excp_excpVec <= 17'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_excp_excpVec <= io_in_0_bits_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_pc <= io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_fallThrough <= io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_taken <= io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_target <= io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_takenOffset <= io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_valid <= io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_btbHit <= io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_btbIsJalr <= io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_btbIsJal <= io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_btbIsCall <= io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_btbIsRet <= io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_btbOffset <= io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_phtCounter <= io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_rasTop <= io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_predTaken <= io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_0_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_0_bpuInfo_meta_predTarget <= io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pc <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_inst <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_inst <= io_in_1_bits_inst; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_rd <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_rd <= io_in_1_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_rs1 <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_rs1 <= io_in_1_bits_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_rs2 <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_rs2 <= io_in_1_bits_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_rs1Valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_rs1Valid <= io_in_1_bits_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_rs2Valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_rs2Valid <= io_in_1_bits_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_rdValid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_rdValid <= io_in_1_bits_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_csrAddress <= 14'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_csrAddress <= io_in_1_bits_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_imm <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_imm <= io_in_1_bits_imm; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_fuType <= io_in_1_bits_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_aluOp <= io_in_1_bits_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_bruOp <= io_in_1_bits_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_lsuOp <= io_in_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_csrOp <= io_in_1_bits_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_mulOp <= io_in_1_bits_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_divOp <= io_in_1_bits_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_src1Type <= io_in_1_bits_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_src2Type <= io_in_1_bits_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_immType <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_immType <= io_in_1_bits_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_rfWen <= io_in_1_bits_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_memRead <= io_in_1_bits_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_memWrite <= io_in_1_bits_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_csrWen <= io_in_1_bits_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_isBranch <= io_in_1_bits_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_isJump <= io_in_1_bits_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_ctrl_isPriv <= io_in_1_bits_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_excp_excpVec <= 17'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_excp_excpVec <= io_in_1_bits_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_pc <= io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_fallThrough <= io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_taken <= io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_target <= io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_takenOffset <= io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_valid <= io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_btbHit <= io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_btbIsJalr <= io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_btbIsJal <= io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_btbIsCall <= io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_btbIsRet <= io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_btbOffset <= io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_phtCounter <= io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_rasTop <= io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_predTaken <= io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_1_bpuInfo_meta_predTarget <= io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pc <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_inst <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_inst <= io_in_2_bits_inst; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_rd <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_rd <= io_in_2_bits_rd; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_rs1 <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_rs1 <= io_in_2_bits_rs1; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_rs2 <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_rs2 <= io_in_2_bits_rs2; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_rs1Valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_rs1Valid <= io_in_2_bits_rs1Valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_rs2Valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_rs2Valid <= io_in_2_bits_rs2Valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_rdValid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_rdValid <= io_in_2_bits_rdValid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_csrAddress <= 14'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_csrAddress <= io_in_2_bits_csrAddress; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_imm <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_imm <= io_in_2_bits_imm; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_fuType <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_fuType <= io_in_2_bits_ctrl_fuType; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_aluOp <= 5'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_aluOp <= io_in_2_bits_ctrl_aluOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_bruOp <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_bruOp <= io_in_2_bits_ctrl_bruOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_lsuOp <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_lsuOp <= io_in_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_csrOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_csrOp <= io_in_2_bits_ctrl_csrOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_mulOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_mulOp <= io_in_2_bits_ctrl_mulOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_divOp <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_divOp <= io_in_2_bits_ctrl_divOp; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_src1Type <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_src1Type <= io_in_2_bits_ctrl_src1Type; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_src2Type <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_src2Type <= io_in_2_bits_ctrl_src2Type; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_immType <= 4'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_immType <= io_in_2_bits_ctrl_immType; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_rfWen <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_rfWen <= io_in_2_bits_ctrl_rfWen; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_memRead <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_memRead <= io_in_2_bits_ctrl_memRead; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_memWrite <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_memWrite <= io_in_2_bits_ctrl_memWrite; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_csrWen <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_csrWen <= io_in_2_bits_ctrl_csrWen; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_isBranch <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_isBranch <= io_in_2_bits_ctrl_isBranch; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_isJump <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_isJump <= io_in_2_bits_ctrl_isJump; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_ctrl_isPriv <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_ctrl_isPriv <= io_in_2_bits_ctrl_isPriv; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_excp_excpVec <= 17'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_excp_excpVec <= io_in_2_bits_excp_excpVec; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_pc <= io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_fallThrough <= io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_taken <= io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_target <= io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_takenOffset <= io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_valid <= io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_btbHit <= io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_btbIsJalr <= io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_btbIsJal <= io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_btbIsCall <= io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_btbIsRet <= io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_btbOffset <= io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_phtCounter <= io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_rasTop <= io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_predTaken <= io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
      stgData_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/rename/RenameStage.scala 68:24]
    end else if (!(_snapshotManager_io_resolveAllSs_T)) begin // @[src/main/scala/backend/rename/RenameStage.scala 97:17]
      if (inFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 100:22]
        stgData_2_bpuInfo_meta_predTarget <= io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/rename/RenameStage.scala 104:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 226:27]
      robIdxHead_value <= 6'h0; // @[src/main/scala/backend/rename/RenameStage.scala 226:27]
    end else if (_snapshotManager_io_resolveAllSs_T) begin // @[src/main/scala/backend/rename/RenameStage.scala 232:17]
      robIdxHead_value <= robIdxHeadNext_newPtr_value; // @[src/main/scala/backend/rename/RenameStage.scala 234:20]
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 242:23]
      robIdxHead_value <= robIdxHeadNext_newPtr_1_value; // @[src/main/scala/backend/rename/RenameStage.scala 243:20]
    end
    if (reset) begin // @[src/main/scala/backend/rename/RenameStage.scala 226:27]
      robIdxHead_flag <= 1'h0; // @[src/main/scala/backend/rename/RenameStage.scala 226:27]
    end else if (_snapshotManager_io_resolveAllSs_T) begin // @[src/main/scala/backend/rename/RenameStage.scala 232:17]
      if (robIdxHeadNext_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        robIdxHead_flag <= ~io_redirectInfo_bits_robIdx_flag;
      end else begin
        robIdxHead_flag <= io_redirectInfo_bits_robIdx_flag;
      end
    end else if (outFire) begin // @[src/main/scala/backend/rename/RenameStage.scala 242:23]
      if (robIdxHeadNext_wrap_1) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        robIdxHead_flag <= ~robIdxHead_flag;
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
  stgValid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  laneValid_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  laneValid_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  laneValid_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stgData_0_pc = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stgData_0_inst = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stgData_0_rd = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  stgData_0_rs1 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  stgData_0_rs2 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_rs1Valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_rs2Valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_rdValid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_csrAddress = _RAND_12[13:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_imm = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_ctrl_fuType = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_ctrl_aluOp = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_ctrl_bruOp = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_ctrl_lsuOp = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_ctrl_csrOp = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_ctrl_mulOp = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_ctrl_divOp = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_ctrl_src1Type = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_ctrl_src2Type = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_ctrl_immType = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_ctrl_rfWen = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_ctrl_memRead = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_ctrl_memWrite = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_ctrl_csrWen = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_ctrl_isBranch = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_ctrl_isJump = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_ctrl_isPriv = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_excp_excpVec = _RAND_31[16:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_pdInfo_valid = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_0_pdInfo_isBr = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_0_pdInfo_isJal = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_0_pdInfo_isJalr = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_0_pdInfo_isCall = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_0_pdInfo_isRet = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_0_pdInfo_jumpTarget = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_0_bpuInfo_pc = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_0_bpuInfo_fallThrough = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_0_bpuInfo_taken = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_0_bpuInfo_target = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_0_bpuInfo_takenOffset = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_valid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbHit = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsJalr = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsJal = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsCall = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsRet = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbOffset = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_phtCounter = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_rasTop = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_predTaken = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_predTarget = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_1_pc = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_1_inst = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_1_rd = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_1_rs1 = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_1_rs2 = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_1_rs1Valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_1_rs2Valid = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_1_rdValid = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_1_csrAddress = _RAND_63[13:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_1_imm = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_1_ctrl_fuType = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_1_ctrl_aluOp = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_1_ctrl_bruOp = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_1_ctrl_lsuOp = _RAND_68[3:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_1_ctrl_csrOp = _RAND_69[2:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_1_ctrl_mulOp = _RAND_70[2:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_1_ctrl_divOp = _RAND_71[2:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_1_ctrl_src1Type = _RAND_72[2:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_1_ctrl_src2Type = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_1_ctrl_immType = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_1_ctrl_rfWen = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_1_ctrl_memRead = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_1_ctrl_memWrite = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_1_ctrl_csrWen = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_1_ctrl_isBranch = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_1_ctrl_isJump = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_1_ctrl_isPriv = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_1_excp_excpVec = _RAND_82[16:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_1_bpuInfo_pc = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  stgData_1_bpuInfo_fallThrough = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  stgData_1_bpuInfo_taken = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  stgData_1_bpuInfo_target = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  stgData_1_bpuInfo_takenOffset = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_valid = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbHit = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsJalr = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsJal = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsCall = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsRet = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbOffset = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_phtCounter = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_rasTop = _RAND_103[2:0];
  _RAND_104 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_predTaken = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_predTarget = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  stgData_2_pc = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  stgData_2_inst = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  stgData_2_rd = _RAND_108[4:0];
  _RAND_109 = {1{`RANDOM}};
  stgData_2_rs1 = _RAND_109[4:0];
  _RAND_110 = {1{`RANDOM}};
  stgData_2_rs2 = _RAND_110[4:0];
  _RAND_111 = {1{`RANDOM}};
  stgData_2_rs1Valid = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  stgData_2_rs2Valid = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  stgData_2_rdValid = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  stgData_2_csrAddress = _RAND_114[13:0];
  _RAND_115 = {1{`RANDOM}};
  stgData_2_imm = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  stgData_2_ctrl_fuType = _RAND_116[3:0];
  _RAND_117 = {1{`RANDOM}};
  stgData_2_ctrl_aluOp = _RAND_117[4:0];
  _RAND_118 = {1{`RANDOM}};
  stgData_2_ctrl_bruOp = _RAND_118[3:0];
  _RAND_119 = {1{`RANDOM}};
  stgData_2_ctrl_lsuOp = _RAND_119[3:0];
  _RAND_120 = {1{`RANDOM}};
  stgData_2_ctrl_csrOp = _RAND_120[2:0];
  _RAND_121 = {1{`RANDOM}};
  stgData_2_ctrl_mulOp = _RAND_121[2:0];
  _RAND_122 = {1{`RANDOM}};
  stgData_2_ctrl_divOp = _RAND_122[2:0];
  _RAND_123 = {1{`RANDOM}};
  stgData_2_ctrl_src1Type = _RAND_123[2:0];
  _RAND_124 = {1{`RANDOM}};
  stgData_2_ctrl_src2Type = _RAND_124[2:0];
  _RAND_125 = {1{`RANDOM}};
  stgData_2_ctrl_immType = _RAND_125[3:0];
  _RAND_126 = {1{`RANDOM}};
  stgData_2_ctrl_rfWen = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  stgData_2_ctrl_memRead = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  stgData_2_ctrl_memWrite = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  stgData_2_ctrl_csrWen = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  stgData_2_ctrl_isBranch = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  stgData_2_ctrl_isJump = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  stgData_2_ctrl_isPriv = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  stgData_2_excp_excpVec = _RAND_133[16:0];
  _RAND_134 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  stgData_2_bpuInfo_pc = _RAND_141[31:0];
  _RAND_142 = {1{`RANDOM}};
  stgData_2_bpuInfo_fallThrough = _RAND_142[31:0];
  _RAND_143 = {1{`RANDOM}};
  stgData_2_bpuInfo_taken = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  stgData_2_bpuInfo_target = _RAND_144[31:0];
  _RAND_145 = {1{`RANDOM}};
  stgData_2_bpuInfo_takenOffset = _RAND_145[1:0];
  _RAND_146 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_valid = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbHit = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsJalr = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsJal = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsCall = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsRet = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbOffset = _RAND_152[1:0];
  _RAND_153 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_phtCounter = _RAND_153[1:0];
  _RAND_154 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_rasTop = _RAND_154[2:0];
  _RAND_155 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_predTaken = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_predTarget = _RAND_156[31:0];
  _RAND_157 = {1{`RANDOM}};
  robIdxHead_value = _RAND_157[5:0];
  _RAND_158 = {1{`RANDOM}};
  robIdxHead_flag = _RAND_158[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
