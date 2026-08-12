module DecodeStage(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_instr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_bpuInfo_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_taken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_bpuInfo_target, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [2:0]  io_in_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpTlbRefill, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpTlbPif, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpTlbPpi, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_0_bits_exception_excpAdef, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_in_1_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_instr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_bpuInfo_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_taken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_bpuInfo_target, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [2:0]  io_in_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpTlbRefill, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpTlbPif, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpTlbPpi, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_1_bits_exception_excpAdef, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_in_2_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_instr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_bpuInfo_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_taken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_bpuInfo_target, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [2:0]  io_in_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input  [31:0] io_in_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpTlbRefill, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpTlbPif, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpTlbPpi, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_in_2_bits_exception_excpAdef, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_out_0_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_inst, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rd, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rj, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rk, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_rs1Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_rs2Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_rdValid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [13:0] io_out_0_bits_csrAddress, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_imm, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_fuType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_0_bits_ctrl_aluOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_bruOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_lsuOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_csrOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_mulOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_divOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_src1Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_ctrl_src2Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_0_bits_ctrl_immType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_rfWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_memRead, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_memWrite, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_csrWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_isBranch, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_isJump, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_ctrl_isPriv, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [16:0] io_out_0_bits_excp_excpVec, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_bpuInfo_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_taken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_bpuInfo_target, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_out_1_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_inst, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rd, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rj, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rk, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_rs1Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_rs2Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_rdValid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [13:0] io_out_1_bits_csrAddress, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_imm, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_fuType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_1_bits_ctrl_aluOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_bruOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_lsuOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_csrOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_mulOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_divOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_src1Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_ctrl_src2Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_1_bits_ctrl_immType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_rfWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_memRead, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_memWrite, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_csrWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_isBranch, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_isJump, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_ctrl_isPriv, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [16:0] io_out_1_bits_excp_excpVec, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_bpuInfo_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_taken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_bpuInfo_target, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_out_2_ready, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_inst, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rd, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rj, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rk, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_rs1Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_rs2Valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_rdValid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [13:0] io_out_2_bits_csrAddress, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_imm, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_fuType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_out_2_bits_ctrl_aluOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_bruOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_lsuOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_csrOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_mulOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_divOp, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_src1Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_ctrl_src2Type, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [3:0]  io_out_2_bits_ctrl_immType, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_rfWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_memRead, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_memWrite, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_csrWen, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_isBranch, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_isJump, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_ctrl_isPriv, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [16:0] io_out_2_bits_excp_excpVec, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_bpuInfo_pc, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_taken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_bpuInfo_target, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [1:0]  io_out_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [2:0]  io_out_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_out_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [31:0] io_out_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_0_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_0_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_ratRead_0_hold1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_ratRead_0_hold2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_1_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_1_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_ratRead_1_hold1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_ratRead_1_hold2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_2_rs1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output [4:0]  io_ratRead_2_rs2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_ratRead_2_hold1, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  output        io_ratRead_2_hold2, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_extInt, // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
  input         io_flush // @[src/main/scala/backend/decode/DecodeStage.scala 9:14]
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] decoder_io_inData_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_inData_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_inData_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_inData_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_inData_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_inData_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_io_inData_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_io_inData_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_io_inData_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_io_inData_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_inData_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_inData_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [13:0] decoder_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_io_out_ctrl_mulOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_io_out_ctrl_divOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [16:0] decoder_io_out_excp_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_io_out_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_io_out_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_io_out_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_io_out_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_io_out_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_io_out_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_inData_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_inData_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_inData_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_inData_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_inData_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_inData_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_1_io_inData_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_1_io_inData_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_1_io_inData_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_1_io_inData_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_inData_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_inData_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_1_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_1_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_1_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_1_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_1_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [13:0] decoder_1_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_1_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_1_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_1_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_1_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_1_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_1_io_out_ctrl_mulOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_1_io_out_ctrl_divOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_1_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_1_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_1_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [16:0] decoder_1_io_out_excp_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_1_io_out_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_1_io_out_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_1_io_out_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_1_io_out_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_1_io_out_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_1_io_out_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_inData_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_inData_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_inData_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_inData_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_inData_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_inData_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_2_io_inData_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_2_io_inData_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_2_io_inData_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_2_io_inData_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_inData_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_inData_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_2_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_2_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_2_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_2_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_2_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [13:0] decoder_2_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_2_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [4:0] decoder_2_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_2_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_2_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_2_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_2_io_out_ctrl_mulOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_2_io_out_ctrl_divOp; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_2_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_2_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [3:0] decoder_2_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [16:0] decoder_2_io_out_excp_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_2_io_out_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_2_io_out_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [1:0] decoder_2_io_out_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [2:0] decoder_2_io_out_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire  decoder_2_io_out_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  wire [31:0] decoder_2_io_out_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
  reg  stgValid; // @[src/main/scala/backend/decode/DecodeStage.scala 22:26]
  reg  laneValid_0; // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
  reg  laneValid_1; // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
  reg  laneValid_2; // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
  reg [31:0] stgData_0_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_0_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_0_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_0_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_0_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_0_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_0_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_0_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [2:0] stgData_0_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_0_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_0_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_1_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_1_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_1_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_1_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_1_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_1_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [2:0] stgData_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_1_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_2_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_2_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_2_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_2_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_2_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_2_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [1:0] stgData_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [2:0] stgData_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg [31:0] stgData_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  reg  stgData_2_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
  wire  outReadyAll = (~laneValid_0 | io_out_0_ready) & (~laneValid_1 | io_out_1_ready) & (~laneValid_2 | io_out_2_ready
    ); // @[src/main/scala/backend/decode/DecodeStage.scala 29:98]
  wire  outFire = stgValid & outReadyAll; // @[src/main/scala/backend/decode/DecodeStage.scala 30:26]
  wire  stgReady = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 34:28]
  wire  inValid = io_in_0_valid | io_in_1_valid | io_in_2_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 38:45]
  wire  inFire = inValid & stgReady; // @[src/main/scala/backend/decode/DecodeStage.scala 39:25]
  wire  _GEN_0 = outFire ? 1'h0 : stgValid; // @[src/main/scala/backend/decode/DecodeStage.scala 58:24 60:14 22:26]
  wire  _GEN_4 = inFire | _GEN_0; // @[src/main/scala/backend/decode/DecodeStage.scala 52:23 53:14]
  Decoder decoder ( // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
    .io_inData_instr(decoder_io_inData_instr),
    .io_inData_pc(decoder_io_inData_pc),
    .io_inData_pdInfo_valid(decoder_io_inData_pdInfo_valid),
    .io_inData_pdInfo_isBr(decoder_io_inData_pdInfo_isBr),
    .io_inData_pdInfo_isJal(decoder_io_inData_pdInfo_isJal),
    .io_inData_pdInfo_isJalr(decoder_io_inData_pdInfo_isJalr),
    .io_inData_pdInfo_isCall(decoder_io_inData_pdInfo_isCall),
    .io_inData_pdInfo_isRet(decoder_io_inData_pdInfo_isRet),
    .io_inData_pdInfo_jumpTarget(decoder_io_inData_pdInfo_jumpTarget),
    .io_inData_bpuInfo_pc(decoder_io_inData_bpuInfo_pc),
    .io_inData_bpuInfo_fallThrough(decoder_io_inData_bpuInfo_fallThrough),
    .io_inData_bpuInfo_taken(decoder_io_inData_bpuInfo_taken),
    .io_inData_bpuInfo_target(decoder_io_inData_bpuInfo_target),
    .io_inData_bpuInfo_takenOffset(decoder_io_inData_bpuInfo_takenOffset),
    .io_inData_bpuInfo_meta_valid(decoder_io_inData_bpuInfo_meta_valid),
    .io_inData_bpuInfo_meta_btbHit(decoder_io_inData_bpuInfo_meta_btbHit),
    .io_inData_bpuInfo_meta_btbIsJalr(decoder_io_inData_bpuInfo_meta_btbIsJalr),
    .io_inData_bpuInfo_meta_btbIsJal(decoder_io_inData_bpuInfo_meta_btbIsJal),
    .io_inData_bpuInfo_meta_btbIsCall(decoder_io_inData_bpuInfo_meta_btbIsCall),
    .io_inData_bpuInfo_meta_btbIsRet(decoder_io_inData_bpuInfo_meta_btbIsRet),
    .io_inData_bpuInfo_meta_btbOffset(decoder_io_inData_bpuInfo_meta_btbOffset),
    .io_inData_bpuInfo_meta_phtCounter(decoder_io_inData_bpuInfo_meta_phtCounter),
    .io_inData_bpuInfo_meta_rasTop(decoder_io_inData_bpuInfo_meta_rasTop),
    .io_inData_bpuInfo_meta_predTaken(decoder_io_inData_bpuInfo_meta_predTaken),
    .io_inData_bpuInfo_meta_predTarget(decoder_io_inData_bpuInfo_meta_predTarget),
    .io_inData_exception_excpTlbRefill(decoder_io_inData_exception_excpTlbRefill),
    .io_inData_exception_excpTlbPif(decoder_io_inData_exception_excpTlbPif),
    .io_inData_exception_excpTlbPpi(decoder_io_inData_exception_excpTlbPpi),
    .io_inData_exception_excpAdef(decoder_io_inData_exception_excpAdef),
    .io_extInt(decoder_io_extInt),
    .io_out_pc(decoder_io_out_pc),
    .io_out_inst(decoder_io_out_inst),
    .io_out_rd(decoder_io_out_rd),
    .io_out_rj(decoder_io_out_rj),
    .io_out_rk(decoder_io_out_rk),
    .io_out_rs1(decoder_io_out_rs1),
    .io_out_rs2(decoder_io_out_rs2),
    .io_out_rs1Valid(decoder_io_out_rs1Valid),
    .io_out_rs2Valid(decoder_io_out_rs2Valid),
    .io_out_rdValid(decoder_io_out_rdValid),
    .io_out_csrAddress(decoder_io_out_csrAddress),
    .io_out_imm(decoder_io_out_imm),
    .io_out_ctrl_fuType(decoder_io_out_ctrl_fuType),
    .io_out_ctrl_aluOp(decoder_io_out_ctrl_aluOp),
    .io_out_ctrl_bruOp(decoder_io_out_ctrl_bruOp),
    .io_out_ctrl_lsuOp(decoder_io_out_ctrl_lsuOp),
    .io_out_ctrl_csrOp(decoder_io_out_ctrl_csrOp),
    .io_out_ctrl_mulOp(decoder_io_out_ctrl_mulOp),
    .io_out_ctrl_divOp(decoder_io_out_ctrl_divOp),
    .io_out_ctrl_src1Type(decoder_io_out_ctrl_src1Type),
    .io_out_ctrl_src2Type(decoder_io_out_ctrl_src2Type),
    .io_out_ctrl_immType(decoder_io_out_ctrl_immType),
    .io_out_ctrl_rfWen(decoder_io_out_ctrl_rfWen),
    .io_out_ctrl_memRead(decoder_io_out_ctrl_memRead),
    .io_out_ctrl_memWrite(decoder_io_out_ctrl_memWrite),
    .io_out_ctrl_csrWen(decoder_io_out_ctrl_csrWen),
    .io_out_ctrl_isBranch(decoder_io_out_ctrl_isBranch),
    .io_out_ctrl_isJump(decoder_io_out_ctrl_isJump),
    .io_out_ctrl_isPriv(decoder_io_out_ctrl_isPriv),
    .io_out_excp_excpVec(decoder_io_out_excp_excpVec),
    .io_out_pdInfo_valid(decoder_io_out_pdInfo_valid),
    .io_out_pdInfo_isBr(decoder_io_out_pdInfo_isBr),
    .io_out_pdInfo_isJal(decoder_io_out_pdInfo_isJal),
    .io_out_pdInfo_isJalr(decoder_io_out_pdInfo_isJalr),
    .io_out_pdInfo_isCall(decoder_io_out_pdInfo_isCall),
    .io_out_pdInfo_isRet(decoder_io_out_pdInfo_isRet),
    .io_out_pdInfo_jumpTarget(decoder_io_out_pdInfo_jumpTarget),
    .io_out_bpuInfo_pc(decoder_io_out_bpuInfo_pc),
    .io_out_bpuInfo_fallThrough(decoder_io_out_bpuInfo_fallThrough),
    .io_out_bpuInfo_taken(decoder_io_out_bpuInfo_taken),
    .io_out_bpuInfo_target(decoder_io_out_bpuInfo_target),
    .io_out_bpuInfo_takenOffset(decoder_io_out_bpuInfo_takenOffset),
    .io_out_bpuInfo_meta_valid(decoder_io_out_bpuInfo_meta_valid),
    .io_out_bpuInfo_meta_btbHit(decoder_io_out_bpuInfo_meta_btbHit),
    .io_out_bpuInfo_meta_btbIsJalr(decoder_io_out_bpuInfo_meta_btbIsJalr),
    .io_out_bpuInfo_meta_btbIsJal(decoder_io_out_bpuInfo_meta_btbIsJal),
    .io_out_bpuInfo_meta_btbIsCall(decoder_io_out_bpuInfo_meta_btbIsCall),
    .io_out_bpuInfo_meta_btbIsRet(decoder_io_out_bpuInfo_meta_btbIsRet),
    .io_out_bpuInfo_meta_btbOffset(decoder_io_out_bpuInfo_meta_btbOffset),
    .io_out_bpuInfo_meta_phtCounter(decoder_io_out_bpuInfo_meta_phtCounter),
    .io_out_bpuInfo_meta_rasTop(decoder_io_out_bpuInfo_meta_rasTop),
    .io_out_bpuInfo_meta_predTaken(decoder_io_out_bpuInfo_meta_predTaken),
    .io_out_bpuInfo_meta_predTarget(decoder_io_out_bpuInfo_meta_predTarget)
  );
  Decoder decoder_1 ( // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
    .io_inData_instr(decoder_1_io_inData_instr),
    .io_inData_pc(decoder_1_io_inData_pc),
    .io_inData_pdInfo_valid(decoder_1_io_inData_pdInfo_valid),
    .io_inData_pdInfo_isBr(decoder_1_io_inData_pdInfo_isBr),
    .io_inData_pdInfo_isJal(decoder_1_io_inData_pdInfo_isJal),
    .io_inData_pdInfo_isJalr(decoder_1_io_inData_pdInfo_isJalr),
    .io_inData_pdInfo_isCall(decoder_1_io_inData_pdInfo_isCall),
    .io_inData_pdInfo_isRet(decoder_1_io_inData_pdInfo_isRet),
    .io_inData_pdInfo_jumpTarget(decoder_1_io_inData_pdInfo_jumpTarget),
    .io_inData_bpuInfo_pc(decoder_1_io_inData_bpuInfo_pc),
    .io_inData_bpuInfo_fallThrough(decoder_1_io_inData_bpuInfo_fallThrough),
    .io_inData_bpuInfo_taken(decoder_1_io_inData_bpuInfo_taken),
    .io_inData_bpuInfo_target(decoder_1_io_inData_bpuInfo_target),
    .io_inData_bpuInfo_takenOffset(decoder_1_io_inData_bpuInfo_takenOffset),
    .io_inData_bpuInfo_meta_valid(decoder_1_io_inData_bpuInfo_meta_valid),
    .io_inData_bpuInfo_meta_btbHit(decoder_1_io_inData_bpuInfo_meta_btbHit),
    .io_inData_bpuInfo_meta_btbIsJalr(decoder_1_io_inData_bpuInfo_meta_btbIsJalr),
    .io_inData_bpuInfo_meta_btbIsJal(decoder_1_io_inData_bpuInfo_meta_btbIsJal),
    .io_inData_bpuInfo_meta_btbIsCall(decoder_1_io_inData_bpuInfo_meta_btbIsCall),
    .io_inData_bpuInfo_meta_btbIsRet(decoder_1_io_inData_bpuInfo_meta_btbIsRet),
    .io_inData_bpuInfo_meta_btbOffset(decoder_1_io_inData_bpuInfo_meta_btbOffset),
    .io_inData_bpuInfo_meta_phtCounter(decoder_1_io_inData_bpuInfo_meta_phtCounter),
    .io_inData_bpuInfo_meta_rasTop(decoder_1_io_inData_bpuInfo_meta_rasTop),
    .io_inData_bpuInfo_meta_predTaken(decoder_1_io_inData_bpuInfo_meta_predTaken),
    .io_inData_bpuInfo_meta_predTarget(decoder_1_io_inData_bpuInfo_meta_predTarget),
    .io_inData_exception_excpTlbRefill(decoder_1_io_inData_exception_excpTlbRefill),
    .io_inData_exception_excpTlbPif(decoder_1_io_inData_exception_excpTlbPif),
    .io_inData_exception_excpTlbPpi(decoder_1_io_inData_exception_excpTlbPpi),
    .io_inData_exception_excpAdef(decoder_1_io_inData_exception_excpAdef),
    .io_extInt(decoder_1_io_extInt),
    .io_out_pc(decoder_1_io_out_pc),
    .io_out_inst(decoder_1_io_out_inst),
    .io_out_rd(decoder_1_io_out_rd),
    .io_out_rj(decoder_1_io_out_rj),
    .io_out_rk(decoder_1_io_out_rk),
    .io_out_rs1(decoder_1_io_out_rs1),
    .io_out_rs2(decoder_1_io_out_rs2),
    .io_out_rs1Valid(decoder_1_io_out_rs1Valid),
    .io_out_rs2Valid(decoder_1_io_out_rs2Valid),
    .io_out_rdValid(decoder_1_io_out_rdValid),
    .io_out_csrAddress(decoder_1_io_out_csrAddress),
    .io_out_imm(decoder_1_io_out_imm),
    .io_out_ctrl_fuType(decoder_1_io_out_ctrl_fuType),
    .io_out_ctrl_aluOp(decoder_1_io_out_ctrl_aluOp),
    .io_out_ctrl_bruOp(decoder_1_io_out_ctrl_bruOp),
    .io_out_ctrl_lsuOp(decoder_1_io_out_ctrl_lsuOp),
    .io_out_ctrl_csrOp(decoder_1_io_out_ctrl_csrOp),
    .io_out_ctrl_mulOp(decoder_1_io_out_ctrl_mulOp),
    .io_out_ctrl_divOp(decoder_1_io_out_ctrl_divOp),
    .io_out_ctrl_src1Type(decoder_1_io_out_ctrl_src1Type),
    .io_out_ctrl_src2Type(decoder_1_io_out_ctrl_src2Type),
    .io_out_ctrl_immType(decoder_1_io_out_ctrl_immType),
    .io_out_ctrl_rfWen(decoder_1_io_out_ctrl_rfWen),
    .io_out_ctrl_memRead(decoder_1_io_out_ctrl_memRead),
    .io_out_ctrl_memWrite(decoder_1_io_out_ctrl_memWrite),
    .io_out_ctrl_csrWen(decoder_1_io_out_ctrl_csrWen),
    .io_out_ctrl_isBranch(decoder_1_io_out_ctrl_isBranch),
    .io_out_ctrl_isJump(decoder_1_io_out_ctrl_isJump),
    .io_out_ctrl_isPriv(decoder_1_io_out_ctrl_isPriv),
    .io_out_excp_excpVec(decoder_1_io_out_excp_excpVec),
    .io_out_pdInfo_valid(decoder_1_io_out_pdInfo_valid),
    .io_out_pdInfo_isBr(decoder_1_io_out_pdInfo_isBr),
    .io_out_pdInfo_isJal(decoder_1_io_out_pdInfo_isJal),
    .io_out_pdInfo_isJalr(decoder_1_io_out_pdInfo_isJalr),
    .io_out_pdInfo_isCall(decoder_1_io_out_pdInfo_isCall),
    .io_out_pdInfo_isRet(decoder_1_io_out_pdInfo_isRet),
    .io_out_pdInfo_jumpTarget(decoder_1_io_out_pdInfo_jumpTarget),
    .io_out_bpuInfo_pc(decoder_1_io_out_bpuInfo_pc),
    .io_out_bpuInfo_fallThrough(decoder_1_io_out_bpuInfo_fallThrough),
    .io_out_bpuInfo_taken(decoder_1_io_out_bpuInfo_taken),
    .io_out_bpuInfo_target(decoder_1_io_out_bpuInfo_target),
    .io_out_bpuInfo_takenOffset(decoder_1_io_out_bpuInfo_takenOffset),
    .io_out_bpuInfo_meta_valid(decoder_1_io_out_bpuInfo_meta_valid),
    .io_out_bpuInfo_meta_btbHit(decoder_1_io_out_bpuInfo_meta_btbHit),
    .io_out_bpuInfo_meta_btbIsJalr(decoder_1_io_out_bpuInfo_meta_btbIsJalr),
    .io_out_bpuInfo_meta_btbIsJal(decoder_1_io_out_bpuInfo_meta_btbIsJal),
    .io_out_bpuInfo_meta_btbIsCall(decoder_1_io_out_bpuInfo_meta_btbIsCall),
    .io_out_bpuInfo_meta_btbIsRet(decoder_1_io_out_bpuInfo_meta_btbIsRet),
    .io_out_bpuInfo_meta_btbOffset(decoder_1_io_out_bpuInfo_meta_btbOffset),
    .io_out_bpuInfo_meta_phtCounter(decoder_1_io_out_bpuInfo_meta_phtCounter),
    .io_out_bpuInfo_meta_rasTop(decoder_1_io_out_bpuInfo_meta_rasTop),
    .io_out_bpuInfo_meta_predTaken(decoder_1_io_out_bpuInfo_meta_predTaken),
    .io_out_bpuInfo_meta_predTarget(decoder_1_io_out_bpuInfo_meta_predTarget)
  );
  Decoder decoder_2 ( // @[src/main/scala/backend/decode/DecodeStage.scala 71:25]
    .io_inData_instr(decoder_2_io_inData_instr),
    .io_inData_pc(decoder_2_io_inData_pc),
    .io_inData_pdInfo_valid(decoder_2_io_inData_pdInfo_valid),
    .io_inData_pdInfo_isBr(decoder_2_io_inData_pdInfo_isBr),
    .io_inData_pdInfo_isJal(decoder_2_io_inData_pdInfo_isJal),
    .io_inData_pdInfo_isJalr(decoder_2_io_inData_pdInfo_isJalr),
    .io_inData_pdInfo_isCall(decoder_2_io_inData_pdInfo_isCall),
    .io_inData_pdInfo_isRet(decoder_2_io_inData_pdInfo_isRet),
    .io_inData_pdInfo_jumpTarget(decoder_2_io_inData_pdInfo_jumpTarget),
    .io_inData_bpuInfo_pc(decoder_2_io_inData_bpuInfo_pc),
    .io_inData_bpuInfo_fallThrough(decoder_2_io_inData_bpuInfo_fallThrough),
    .io_inData_bpuInfo_taken(decoder_2_io_inData_bpuInfo_taken),
    .io_inData_bpuInfo_target(decoder_2_io_inData_bpuInfo_target),
    .io_inData_bpuInfo_takenOffset(decoder_2_io_inData_bpuInfo_takenOffset),
    .io_inData_bpuInfo_meta_valid(decoder_2_io_inData_bpuInfo_meta_valid),
    .io_inData_bpuInfo_meta_btbHit(decoder_2_io_inData_bpuInfo_meta_btbHit),
    .io_inData_bpuInfo_meta_btbIsJalr(decoder_2_io_inData_bpuInfo_meta_btbIsJalr),
    .io_inData_bpuInfo_meta_btbIsJal(decoder_2_io_inData_bpuInfo_meta_btbIsJal),
    .io_inData_bpuInfo_meta_btbIsCall(decoder_2_io_inData_bpuInfo_meta_btbIsCall),
    .io_inData_bpuInfo_meta_btbIsRet(decoder_2_io_inData_bpuInfo_meta_btbIsRet),
    .io_inData_bpuInfo_meta_btbOffset(decoder_2_io_inData_bpuInfo_meta_btbOffset),
    .io_inData_bpuInfo_meta_phtCounter(decoder_2_io_inData_bpuInfo_meta_phtCounter),
    .io_inData_bpuInfo_meta_rasTop(decoder_2_io_inData_bpuInfo_meta_rasTop),
    .io_inData_bpuInfo_meta_predTaken(decoder_2_io_inData_bpuInfo_meta_predTaken),
    .io_inData_bpuInfo_meta_predTarget(decoder_2_io_inData_bpuInfo_meta_predTarget),
    .io_inData_exception_excpTlbRefill(decoder_2_io_inData_exception_excpTlbRefill),
    .io_inData_exception_excpTlbPif(decoder_2_io_inData_exception_excpTlbPif),
    .io_inData_exception_excpTlbPpi(decoder_2_io_inData_exception_excpTlbPpi),
    .io_inData_exception_excpAdef(decoder_2_io_inData_exception_excpAdef),
    .io_extInt(decoder_2_io_extInt),
    .io_out_pc(decoder_2_io_out_pc),
    .io_out_inst(decoder_2_io_out_inst),
    .io_out_rd(decoder_2_io_out_rd),
    .io_out_rj(decoder_2_io_out_rj),
    .io_out_rk(decoder_2_io_out_rk),
    .io_out_rs1(decoder_2_io_out_rs1),
    .io_out_rs2(decoder_2_io_out_rs2),
    .io_out_rs1Valid(decoder_2_io_out_rs1Valid),
    .io_out_rs2Valid(decoder_2_io_out_rs2Valid),
    .io_out_rdValid(decoder_2_io_out_rdValid),
    .io_out_csrAddress(decoder_2_io_out_csrAddress),
    .io_out_imm(decoder_2_io_out_imm),
    .io_out_ctrl_fuType(decoder_2_io_out_ctrl_fuType),
    .io_out_ctrl_aluOp(decoder_2_io_out_ctrl_aluOp),
    .io_out_ctrl_bruOp(decoder_2_io_out_ctrl_bruOp),
    .io_out_ctrl_lsuOp(decoder_2_io_out_ctrl_lsuOp),
    .io_out_ctrl_csrOp(decoder_2_io_out_ctrl_csrOp),
    .io_out_ctrl_mulOp(decoder_2_io_out_ctrl_mulOp),
    .io_out_ctrl_divOp(decoder_2_io_out_ctrl_divOp),
    .io_out_ctrl_src1Type(decoder_2_io_out_ctrl_src1Type),
    .io_out_ctrl_src2Type(decoder_2_io_out_ctrl_src2Type),
    .io_out_ctrl_immType(decoder_2_io_out_ctrl_immType),
    .io_out_ctrl_rfWen(decoder_2_io_out_ctrl_rfWen),
    .io_out_ctrl_memRead(decoder_2_io_out_ctrl_memRead),
    .io_out_ctrl_memWrite(decoder_2_io_out_ctrl_memWrite),
    .io_out_ctrl_csrWen(decoder_2_io_out_ctrl_csrWen),
    .io_out_ctrl_isBranch(decoder_2_io_out_ctrl_isBranch),
    .io_out_ctrl_isJump(decoder_2_io_out_ctrl_isJump),
    .io_out_ctrl_isPriv(decoder_2_io_out_ctrl_isPriv),
    .io_out_excp_excpVec(decoder_2_io_out_excp_excpVec),
    .io_out_pdInfo_valid(decoder_2_io_out_pdInfo_valid),
    .io_out_pdInfo_isBr(decoder_2_io_out_pdInfo_isBr),
    .io_out_pdInfo_isJal(decoder_2_io_out_pdInfo_isJal),
    .io_out_pdInfo_isJalr(decoder_2_io_out_pdInfo_isJalr),
    .io_out_pdInfo_isCall(decoder_2_io_out_pdInfo_isCall),
    .io_out_pdInfo_isRet(decoder_2_io_out_pdInfo_isRet),
    .io_out_pdInfo_jumpTarget(decoder_2_io_out_pdInfo_jumpTarget),
    .io_out_bpuInfo_pc(decoder_2_io_out_bpuInfo_pc),
    .io_out_bpuInfo_fallThrough(decoder_2_io_out_bpuInfo_fallThrough),
    .io_out_bpuInfo_taken(decoder_2_io_out_bpuInfo_taken),
    .io_out_bpuInfo_target(decoder_2_io_out_bpuInfo_target),
    .io_out_bpuInfo_takenOffset(decoder_2_io_out_bpuInfo_takenOffset),
    .io_out_bpuInfo_meta_valid(decoder_2_io_out_bpuInfo_meta_valid),
    .io_out_bpuInfo_meta_btbHit(decoder_2_io_out_bpuInfo_meta_btbHit),
    .io_out_bpuInfo_meta_btbIsJalr(decoder_2_io_out_bpuInfo_meta_btbIsJalr),
    .io_out_bpuInfo_meta_btbIsJal(decoder_2_io_out_bpuInfo_meta_btbIsJal),
    .io_out_bpuInfo_meta_btbIsCall(decoder_2_io_out_bpuInfo_meta_btbIsCall),
    .io_out_bpuInfo_meta_btbIsRet(decoder_2_io_out_bpuInfo_meta_btbIsRet),
    .io_out_bpuInfo_meta_btbOffset(decoder_2_io_out_bpuInfo_meta_btbOffset),
    .io_out_bpuInfo_meta_phtCounter(decoder_2_io_out_bpuInfo_meta_phtCounter),
    .io_out_bpuInfo_meta_rasTop(decoder_2_io_out_bpuInfo_meta_rasTop),
    .io_out_bpuInfo_meta_predTaken(decoder_2_io_out_bpuInfo_meta_predTaken),
    .io_out_bpuInfo_meta_predTarget(decoder_2_io_out_bpuInfo_meta_predTarget)
  );
  assign io_in_0_ready = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 34:28]
  assign io_in_1_ready = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 34:28]
  assign io_in_2_ready = ~stgValid | outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 34:28]
  assign io_out_0_valid = stgValid & laneValid_0; // @[src/main/scala/backend/decode/DecodeStage.scala 78:33]
  assign io_out_0_bits_pc = decoder_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_inst = decoder_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rd = decoder_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rj = decoder_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rk = decoder_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rs1 = decoder_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rs2 = decoder_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rs1Valid = decoder_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rs2Valid = decoder_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_rdValid = decoder_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_csrAddress = decoder_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_imm = decoder_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_fuType = decoder_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_aluOp = decoder_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_bruOp = decoder_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_lsuOp = decoder_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_csrOp = decoder_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_mulOp = decoder_io_out_ctrl_mulOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_divOp = decoder_io_out_ctrl_divOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_src1Type = decoder_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_src2Type = decoder_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_immType = decoder_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_rfWen = decoder_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_memRead = decoder_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_memWrite = decoder_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_csrWen = decoder_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_isBranch = decoder_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_isJump = decoder_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_ctrl_isPriv = decoder_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_excp_excpVec = decoder_io_out_excp_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_pdInfo_valid = decoder_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_pdInfo_isBr = decoder_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_pdInfo_isJal = decoder_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_pdInfo_isJalr = decoder_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_pdInfo_isCall = decoder_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_pdInfo_isRet = decoder_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_pdInfo_jumpTarget = decoder_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_pc = decoder_io_out_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_fallThrough = decoder_io_out_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_taken = decoder_io_out_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_target = decoder_io_out_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_takenOffset = decoder_io_out_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_valid = decoder_io_out_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_btbHit = decoder_io_out_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_btbIsJalr = decoder_io_out_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_btbIsJal = decoder_io_out_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_btbIsCall = decoder_io_out_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_btbIsRet = decoder_io_out_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_btbOffset = decoder_io_out_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_phtCounter = decoder_io_out_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_rasTop = decoder_io_out_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_predTaken = decoder_io_out_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_0_bits_bpuInfo_meta_predTarget = decoder_io_out_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_valid = stgValid & laneValid_1; // @[src/main/scala/backend/decode/DecodeStage.scala 78:33]
  assign io_out_1_bits_pc = decoder_1_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_inst = decoder_1_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rd = decoder_1_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rj = decoder_1_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rk = decoder_1_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rs1 = decoder_1_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rs2 = decoder_1_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rs1Valid = decoder_1_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rs2Valid = decoder_1_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_rdValid = decoder_1_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_csrAddress = decoder_1_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_imm = decoder_1_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_fuType = decoder_1_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_aluOp = decoder_1_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_bruOp = decoder_1_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_lsuOp = decoder_1_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_csrOp = decoder_1_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_mulOp = decoder_1_io_out_ctrl_mulOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_divOp = decoder_1_io_out_ctrl_divOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_src1Type = decoder_1_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_src2Type = decoder_1_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_immType = decoder_1_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_rfWen = decoder_1_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_memRead = decoder_1_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_memWrite = decoder_1_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_csrWen = decoder_1_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_isBranch = decoder_1_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_isJump = decoder_1_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_ctrl_isPriv = decoder_1_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_excp_excpVec = decoder_1_io_out_excp_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_pdInfo_valid = decoder_1_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_pdInfo_isBr = decoder_1_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_pdInfo_isJal = decoder_1_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_pdInfo_isJalr = decoder_1_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_pdInfo_isCall = decoder_1_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_pdInfo_isRet = decoder_1_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_pdInfo_jumpTarget = decoder_1_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_pc = decoder_1_io_out_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_fallThrough = decoder_1_io_out_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_taken = decoder_1_io_out_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_target = decoder_1_io_out_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_takenOffset = decoder_1_io_out_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_valid = decoder_1_io_out_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_btbHit = decoder_1_io_out_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_btbIsJalr = decoder_1_io_out_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_btbIsJal = decoder_1_io_out_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_btbIsCall = decoder_1_io_out_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_btbIsRet = decoder_1_io_out_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_btbOffset = decoder_1_io_out_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_phtCounter = decoder_1_io_out_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_rasTop = decoder_1_io_out_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_predTaken = decoder_1_io_out_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_1_bits_bpuInfo_meta_predTarget = decoder_1_io_out_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_valid = stgValid & laneValid_2; // @[src/main/scala/backend/decode/DecodeStage.scala 78:33]
  assign io_out_2_bits_pc = decoder_2_io_out_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_inst = decoder_2_io_out_inst; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rd = decoder_2_io_out_rd; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rj = decoder_2_io_out_rj; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rk = decoder_2_io_out_rk; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rs1 = decoder_2_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rs2 = decoder_2_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rs1Valid = decoder_2_io_out_rs1Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rs2Valid = decoder_2_io_out_rs2Valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_rdValid = decoder_2_io_out_rdValid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_csrAddress = decoder_2_io_out_csrAddress; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_imm = decoder_2_io_out_imm; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_fuType = decoder_2_io_out_ctrl_fuType; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_aluOp = decoder_2_io_out_ctrl_aluOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_bruOp = decoder_2_io_out_ctrl_bruOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_lsuOp = decoder_2_io_out_ctrl_lsuOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_csrOp = decoder_2_io_out_ctrl_csrOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_mulOp = decoder_2_io_out_ctrl_mulOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_divOp = decoder_2_io_out_ctrl_divOp; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_src1Type = decoder_2_io_out_ctrl_src1Type; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_src2Type = decoder_2_io_out_ctrl_src2Type; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_immType = decoder_2_io_out_ctrl_immType; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_rfWen = decoder_2_io_out_ctrl_rfWen; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_memRead = decoder_2_io_out_ctrl_memRead; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_memWrite = decoder_2_io_out_ctrl_memWrite; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_csrWen = decoder_2_io_out_ctrl_csrWen; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_isBranch = decoder_2_io_out_ctrl_isBranch; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_isJump = decoder_2_io_out_ctrl_isJump; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_ctrl_isPriv = decoder_2_io_out_ctrl_isPriv; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_excp_excpVec = decoder_2_io_out_excp_excpVec; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_pdInfo_valid = decoder_2_io_out_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_pdInfo_isBr = decoder_2_io_out_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_pdInfo_isJal = decoder_2_io_out_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_pdInfo_isJalr = decoder_2_io_out_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_pdInfo_isCall = decoder_2_io_out_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_pdInfo_isRet = decoder_2_io_out_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_pdInfo_jumpTarget = decoder_2_io_out_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_pc = decoder_2_io_out_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_fallThrough = decoder_2_io_out_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_taken = decoder_2_io_out_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_target = decoder_2_io_out_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_takenOffset = decoder_2_io_out_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_valid = decoder_2_io_out_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_btbHit = decoder_2_io_out_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_btbIsJalr = decoder_2_io_out_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_btbIsJal = decoder_2_io_out_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_btbIsCall = decoder_2_io_out_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_btbIsRet = decoder_2_io_out_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_btbOffset = decoder_2_io_out_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_phtCounter = decoder_2_io_out_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_rasTop = decoder_2_io_out_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_predTaken = decoder_2_io_out_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_out_2_bits_bpuInfo_meta_predTarget = decoder_2_io_out_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 79:21]
  assign io_ratRead_0_rs1 = decoder_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 82:28]
  assign io_ratRead_0_rs2 = decoder_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 83:28]
  assign io_ratRead_0_hold1 = ~outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 84:31]
  assign io_ratRead_0_hold2 = ~outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 85:31]
  assign io_ratRead_1_rs1 = decoder_1_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 82:28]
  assign io_ratRead_1_rs2 = decoder_1_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 83:28]
  assign io_ratRead_1_hold1 = ~outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 84:31]
  assign io_ratRead_1_hold2 = ~outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 85:31]
  assign io_ratRead_2_rs1 = decoder_2_io_out_rs1; // @[src/main/scala/backend/decode/DecodeStage.scala 82:28]
  assign io_ratRead_2_rs2 = decoder_2_io_out_rs2; // @[src/main/scala/backend/decode/DecodeStage.scala 83:28]
  assign io_ratRead_2_hold1 = ~outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 84:31]
  assign io_ratRead_2_hold2 = ~outFire; // @[src/main/scala/backend/decode/DecodeStage.scala 85:31]
  assign decoder_io_inData_instr = stgData_0_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pc = stgData_0_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pdInfo_valid = stgData_0_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pdInfo_isBr = stgData_0_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pdInfo_isJal = stgData_0_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pdInfo_isJalr = stgData_0_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pdInfo_isCall = stgData_0_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pdInfo_isRet = stgData_0_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_pdInfo_jumpTarget = stgData_0_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_pc = stgData_0_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_fallThrough = stgData_0_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_taken = stgData_0_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_target = stgData_0_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_takenOffset = stgData_0_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_valid = stgData_0_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_btbHit = stgData_0_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_btbIsJalr = stgData_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_btbIsJal = stgData_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_btbIsCall = stgData_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_btbIsRet = stgData_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_btbOffset = stgData_0_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_phtCounter = stgData_0_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_rasTop = stgData_0_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_predTaken = stgData_0_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_bpuInfo_meta_predTarget = stgData_0_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_exception_excpTlbRefill = stgData_0_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_exception_excpTlbPif = stgData_0_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_exception_excpTlbPpi = stgData_0_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_inData_exception_excpAdef = stgData_0_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_io_extInt = io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 75:23]
  assign decoder_1_io_inData_instr = stgData_1_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pc = stgData_1_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pdInfo_valid = stgData_1_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pdInfo_isBr = stgData_1_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pdInfo_isJal = stgData_1_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pdInfo_isJalr = stgData_1_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pdInfo_isCall = stgData_1_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pdInfo_isRet = stgData_1_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_pdInfo_jumpTarget = stgData_1_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_pc = stgData_1_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_fallThrough = stgData_1_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_taken = stgData_1_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_target = stgData_1_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_takenOffset = stgData_1_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_valid = stgData_1_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_btbHit = stgData_1_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_btbIsJalr = stgData_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_btbIsJal = stgData_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_btbIsCall = stgData_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_btbIsRet = stgData_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_btbOffset = stgData_1_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_phtCounter = stgData_1_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_rasTop = stgData_1_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_predTaken = stgData_1_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_bpuInfo_meta_predTarget = stgData_1_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_exception_excpTlbRefill = stgData_1_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_exception_excpTlbPif = stgData_1_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_exception_excpTlbPpi = stgData_1_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_inData_exception_excpAdef = stgData_1_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_1_io_extInt = io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 75:23]
  assign decoder_2_io_inData_instr = stgData_2_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pc = stgData_2_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pdInfo_valid = stgData_2_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pdInfo_isBr = stgData_2_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pdInfo_isJal = stgData_2_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pdInfo_isJalr = stgData_2_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pdInfo_isCall = stgData_2_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pdInfo_isRet = stgData_2_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_pdInfo_jumpTarget = stgData_2_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_pc = stgData_2_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_fallThrough = stgData_2_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_taken = stgData_2_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_target = stgData_2_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_takenOffset = stgData_2_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_valid = stgData_2_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_btbHit = stgData_2_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_btbIsJalr = stgData_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_btbIsJal = stgData_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_btbIsCall = stgData_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_btbIsRet = stgData_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_btbOffset = stgData_2_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_phtCounter = stgData_2_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_rasTop = stgData_2_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_predTaken = stgData_2_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_bpuInfo_meta_predTarget = stgData_2_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_exception_excpTlbRefill = stgData_2_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_exception_excpTlbPif = stgData_2_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_exception_excpTlbPpi = stgData_2_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_inData_exception_excpAdef = stgData_2_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 74:23]
  assign decoder_2_io_extInt = io_extInt; // @[src/main/scala/backend/decode/DecodeStage.scala 75:23]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 22:26]
      stgValid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 22:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      stgValid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 48:14]
    end else begin
      stgValid <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 50:20]
    end else if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
      laneValid_0 <= io_in_0_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 55:20]
    end else if (outFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 58:24]
      laneValid_0 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 62:20]
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 50:20]
    end else if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
      laneValid_1 <= io_in_1_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 55:20]
    end else if (outFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 58:24]
      laneValid_1 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 62:20]
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 23:26]
    end else if (io_flush) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 50:20]
    end else if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
      laneValid_2 <= io_in_2_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 55:20]
    end else if (outFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 58:24]
      laneValid_2 <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 62:20]
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_instr <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_instr <= io_in_0_bits_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pc <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pc <= io_in_0_bits_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pdInfo_valid <= io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pdInfo_isBr <= io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pdInfo_isJal <= io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pdInfo_isJalr <= io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pdInfo_isCall <= io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pdInfo_isRet <= io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_pdInfo_jumpTarget <= io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_pc <= io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_fallThrough <= io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_taken <= io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_target <= io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_takenOffset <= io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_valid <= io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_btbHit <= io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_btbIsJalr <= io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_btbIsJal <= io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_btbIsCall <= io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_btbIsRet <= io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_btbOffset <= io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_phtCounter <= io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_rasTop <= io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_predTaken <= io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_bpuInfo_meta_predTarget <= io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_exception_excpTlbRefill <= io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_exception_excpTlbPif <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_exception_excpTlbPif <= io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_exception_excpTlbPpi <= io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_0_exception_excpAdef <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_0_exception_excpAdef <= io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_instr <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_instr <= io_in_1_bits_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pc <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pc <= io_in_1_bits_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pdInfo_valid <= io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pdInfo_isBr <= io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pdInfo_isJal <= io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pdInfo_isJalr <= io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pdInfo_isCall <= io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pdInfo_isRet <= io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_pdInfo_jumpTarget <= io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_pc <= io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_fallThrough <= io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_taken <= io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_target <= io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_takenOffset <= io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_valid <= io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_btbHit <= io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_btbIsJalr <= io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_btbIsJal <= io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_btbIsCall <= io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_btbIsRet <= io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_btbOffset <= io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_phtCounter <= io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_rasTop <= io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_predTaken <= io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_bpuInfo_meta_predTarget <= io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_exception_excpTlbRefill <= io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_exception_excpTlbPif <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_exception_excpTlbPif <= io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_exception_excpTlbPpi <= io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_1_exception_excpAdef <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_1_exception_excpAdef <= io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_instr <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_instr <= io_in_2_bits_instr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pc <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pc <= io_in_2_bits_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pdInfo_valid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pdInfo_valid <= io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pdInfo_isBr <= io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pdInfo_isJal <= io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pdInfo_isJalr <= io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pdInfo_isCall <= io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pdInfo_isRet <= io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_pdInfo_jumpTarget <= io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_pc <= io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_fallThrough <= io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_taken <= io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_target <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_target <= io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_takenOffset <= io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_valid <= io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_btbHit <= io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_btbIsJalr <= io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_btbIsJal <= io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_btbIsCall <= io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_btbIsRet <= io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_btbOffset <= io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_phtCounter <= io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_rasTop <= io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_predTaken <= io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_bpuInfo_meta_predTarget <= io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_exception_excpTlbRefill <= io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_exception_excpTlbPif <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_exception_excpTlbPif <= io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_exception_excpTlbPpi <= io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
      end
    end
    if (reset) begin // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
      stgData_2_exception_excpAdef <= 1'h0; // @[src/main/scala/backend/decode/DecodeStage.scala 24:24]
    end else if (!(io_flush)) begin // @[src/main/scala/backend/decode/DecodeStage.scala 47:18]
      if (inFire) begin // @[src/main/scala/backend/decode/DecodeStage.scala 52:23]
        stgData_2_exception_excpAdef <= io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/decode/DecodeStage.scala 56:20]
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
  stgData_0_instr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stgData_0_pc = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stgData_0_pdInfo_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  stgData_0_pdInfo_isBr = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stgData_0_pdInfo_isJal = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stgData_0_pdInfo_isJalr = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  stgData_0_pdInfo_isCall = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stgData_0_pdInfo_isRet = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stgData_0_pdInfo_jumpTarget = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  stgData_0_bpuInfo_pc = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stgData_0_bpuInfo_fallThrough = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  stgData_0_bpuInfo_taken = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stgData_0_bpuInfo_target = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  stgData_0_bpuInfo_takenOffset = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbHit = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsJalr = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsJal = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsCall = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbIsRet = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_btbOffset = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_phtCounter = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_rasTop = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_predTaken = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  stgData_0_bpuInfo_meta_predTarget = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  stgData_0_exception_excpTlbRefill = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  stgData_0_exception_excpTlbPif = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  stgData_0_exception_excpTlbPpi = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  stgData_0_exception_excpAdef = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  stgData_1_instr = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  stgData_1_pc = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  stgData_1_pdInfo_valid = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  stgData_1_pdInfo_isBr = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  stgData_1_pdInfo_isJal = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  stgData_1_pdInfo_isJalr = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  stgData_1_pdInfo_isCall = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  stgData_1_pdInfo_isRet = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  stgData_1_pdInfo_jumpTarget = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  stgData_1_bpuInfo_pc = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  stgData_1_bpuInfo_fallThrough = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  stgData_1_bpuInfo_taken = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  stgData_1_bpuInfo_target = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  stgData_1_bpuInfo_takenOffset = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_valid = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbHit = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsJalr = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsJal = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsCall = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbIsRet = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_btbOffset = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_phtCounter = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_rasTop = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_predTaken = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  stgData_1_bpuInfo_meta_predTarget = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  stgData_1_exception_excpTlbRefill = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  stgData_1_exception_excpTlbPif = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  stgData_1_exception_excpTlbPpi = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  stgData_1_exception_excpAdef = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  stgData_2_instr = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  stgData_2_pc = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  stgData_2_pdInfo_valid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  stgData_2_pdInfo_isBr = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  stgData_2_pdInfo_isJal = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  stgData_2_pdInfo_isJalr = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  stgData_2_pdInfo_isCall = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  stgData_2_pdInfo_isRet = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  stgData_2_pdInfo_jumpTarget = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  stgData_2_bpuInfo_pc = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  stgData_2_bpuInfo_fallThrough = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  stgData_2_bpuInfo_taken = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  stgData_2_bpuInfo_target = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  stgData_2_bpuInfo_takenOffset = _RAND_75[1:0];
  _RAND_76 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_valid = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbHit = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsJalr = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsJal = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsCall = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbIsRet = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_btbOffset = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_phtCounter = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_rasTop = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_predTaken = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  stgData_2_bpuInfo_meta_predTarget = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  stgData_2_exception_excpTlbRefill = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  stgData_2_exception_excpTlbPif = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  stgData_2_exception_excpTlbPpi = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  stgData_2_exception_excpAdef = _RAND_90[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
