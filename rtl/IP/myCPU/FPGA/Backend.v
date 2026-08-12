module Backend(
  input         clock,
  input         reset,
  output        io_in_0_ready, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_0_bits_instr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_0_bits_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_0_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_0_bits_bpuInfo_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_0_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_taken, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_0_bits_bpuInfo_target, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_0_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [2:0]  io_in_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_0_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_in_1_ready, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_1_bits_instr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_1_bits_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_1_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_1_bits_bpuInfo_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_1_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_taken, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_1_bits_bpuInfo_target, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_1_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [2:0]  io_in_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_1_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_in_2_ready, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_2_bits_instr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_2_bits_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_2_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_2_bits_bpuInfo_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_2_bits_bpuInfo_fallThrough, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_taken, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_2_bits_bpuInfo_target, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_2_bits_bpuInfo_takenOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_meta_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [1:0]  io_in_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [2:0]  io_in_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_in_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_exception_excpTlbRefill, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_exception_excpTlbPif, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_exception_excpTlbPpi, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_in_2_bits_exception_excpAdef, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_redirectInfo_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_redirectInfo_bits_doRedirect, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_redirectInfo_bits_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_redirectInfo_bits_target, // @[src/main/scala/backend/Backend.scala 46:14]
  output [13:0] io_csrReq_addr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_csrResp_data, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_extInt, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_req_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_lsEnq_req_bits_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_req_bits_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_req_bits_isLoad, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_req_bits_isStore, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_lsEnq_req_bits_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_req_bits_sqIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_lsEnq_req_bits_lqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_req_bits_lqIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_inst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_lsEnq_toLsqData_ctrl_aluOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_bruOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_csrOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_mulOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_divOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_src1Type, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_lsEnq_toLsqData_ctrl_src2Type, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_lsEnq_toLsqData_ctrl_immType, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_ctrl_memRead, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_ctrl_memWrite, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_ctrl_csrWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_ctrl_isBranch, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_ctrl_isJump, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_ctrl_isPriv, // @[src/main/scala/backend/Backend.scala 46:14]
  output [16:0] io_lsEnq_toLsqData_excp_excpVec, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_imm, // @[src/main/scala/backend/Backend.scala 46:14]
  output [13:0] io_lsEnq_toLsqData_csrAddress, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_fallThrough, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_taken, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_target, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_takenOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbHit, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_lsEnq_toLsqData_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_lsEnq_toLsqData_bpuInfo_meta_rasTop, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_bpuInfo_meta_predTaken, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_lsEnq_toLsqData_bpuInfo_meta_predTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_lsEnq_toLsqData_ldst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_lsEnq_toLsqData_lrs1, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_lsEnq_toLsqData_lrs2, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_lsEnq_toLsqData_pdst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_lsEnq_toLsqData_prs1, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_lsEnq_toLsqData_prs2, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_lsEnq_toLsqData_oldPdst, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_snptId_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_lsEnq_toLsqData_snptId_bits, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_rs1Valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_rs2Valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_rdValid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_lsEnq_toLsqData_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_lsEnq_toLsqData_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_lsEnq_lqFull, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_lsEnq_sqFull, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_toMemResult_0_ready, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_inst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_0_bits_uop_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_0_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_0_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_ctrl_divOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_0_bits_uop_ctrl_immType, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_ctrl_memRead, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_ctrl_isJump, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/Backend.scala 46:14]
  output [16:0] io_toMemResult_0_bits_uop_excp_excpVec, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_imm, // @[src/main/scala/backend/Backend.scala 46:14]
  output [13:0] io_toMemResult_0_bits_uop_csrAddress, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_bpuInfo_target, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_toMemResult_0_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_0_bits_uop_ldst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_0_bits_uop_lrs1, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_0_bits_uop_lrs2, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_0_bits_uop_pdst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_0_bits_uop_prs1, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_0_bits_uop_prs2, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_0_bits_uop_oldPdst, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_rs1Valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_rs2Valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_rdValid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_snptId_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_snptId_bits, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_toMemResult_0_bits_uop_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_toMemResult_0_bits_uop_robIdxFull_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_0_bits_uop_lqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_lqIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_0_bits_uop_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_sqIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_0_bits_uop_issueQueue, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_prs1Busy, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_prs2Busy, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_isSta, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_uop_isStd, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_data, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_redirect_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_redirect_bits_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_toMemResult_0_bits_redirect_bits_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_redirect_bits_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_memValid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_memRead, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_memWrite, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_memVaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_memPaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_memStoreData, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_0_bits_csrWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output [13:0] io_toMemResult_0_bits_csrWaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_0_bits_csrWdata, // @[src/main/scala/backend/Backend.scala 46:14]
  output [63:0] io_toMemResult_0_bits_csrTimer, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_toMemResult_1_ready, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_inst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_1_bits_uop_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_1_bits_uop_ctrl_aluOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_1_bits_uop_ctrl_bruOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_1_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_ctrl_csrOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_ctrl_mulOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_ctrl_divOp, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_ctrl_src1Type, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_ctrl_src2Type, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_1_bits_uop_ctrl_immType, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_ctrl_memRead, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_ctrl_memWrite, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_ctrl_csrWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_ctrl_isBranch, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_ctrl_isJump, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_ctrl_isPriv, // @[src/main/scala/backend/Backend.scala 46:14]
  output [16:0] io_toMemResult_1_bits_uop_excp_excpVec, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_imm, // @[src/main/scala/backend/Backend.scala 46:14]
  output [13:0] io_toMemResult_1_bits_uop_csrAddress, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_pdInfo_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_pdInfo_isBr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_pdInfo_isJal, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_pdInfo_isJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_pdInfo_isCall, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_pdInfo_isRet, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_pdInfo_jumpTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_bpuInfo_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_bpuInfo_fallThrough, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_taken, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_bpuInfo_target, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_toMemResult_1_bits_uop_bpuInfo_takenOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_meta_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_1_bits_uop_ldst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_1_bits_uop_lrs1, // @[src/main/scala/backend/Backend.scala 46:14]
  output [4:0]  io_toMemResult_1_bits_uop_lrs2, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_1_bits_uop_pdst, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_1_bits_uop_prs1, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_1_bits_uop_prs2, // @[src/main/scala/backend/Backend.scala 46:14]
  output [6:0]  io_toMemResult_1_bits_uop_oldPdst, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_rs1Valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_rs2Valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_rdValid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_snptId_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_snptId_bits, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_toMemResult_1_bits_uop_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_toMemResult_1_bits_uop_robIdxFull_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_1_bits_uop_lqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_lqIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_toMemResult_1_bits_uop_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_sqIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output [2:0]  io_toMemResult_1_bits_uop_issueQueue, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_prs1Busy, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_prs2Busy, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_isSta, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_uop_isStd, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_data, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_redirect_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_redirect_bits_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_toMemResult_1_bits_redirect_bits_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_redirect_bits_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_memValid, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_memRead, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_memWrite, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_memVaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_memPaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_memStoreData, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_toMemResult_1_bits_csrWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output [13:0] io_toMemResult_1_bits_csrWaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_toMemResult_1_bits_csrWdata, // @[src/main/scala/backend/Backend.scala 46:14]
  output [63:0] io_toMemResult_1_bits_csrTimer, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_fromMemResult_0_ready, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_0_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_0_bits_uop_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_0_bits_uop_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_0_bits_uop_ctrl_rfWen, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [16:0] io_fromMemResult_0_bits_uop_excp_excpVec, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [6:0]  io_fromMemResult_0_bits_uop_pdst, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_0_bits_uop_rdValid, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [5:0]  io_fromMemResult_0_bits_uop_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_0_bits_uop_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [5:0]  io_fromMemResult_0_bits_uop_robIdxFull_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_0_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_0_bits_uop_lqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_0_bits_uop_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_0_bits_data, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_0_bits_memVaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_0_bits_memPaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_fromMemResult_1_ready, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_1_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_1_bits_uop_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_1_bits_uop_ctrl_fuType, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_1_bits_uop_ctrl_lsuOp, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [16:0] io_fromMemResult_1_bits_uop_excp_excpVec, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [6:0]  io_fromMemResult_1_bits_uop_pdst, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [5:0]  io_fromMemResult_1_bits_uop_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_1_bits_uop_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [5:0]  io_fromMemResult_1_bits_uop_robIdxFull_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_1_bits_uop_robIdxFull_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_1_bits_uop_lqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [3:0]  io_fromMemResult_1_bits_uop_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [5:0]  io_fromMemResult_1_bits_redirect_bits_robIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  input         io_fromMemResult_1_bits_redirect_bits_robIdx_flag, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_1_bits_memVaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_1_bits_memPaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_fromMemResult_1_bits_memStoreData, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_commitToSq_valid_0, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_commitToSq_valid_1, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_commitToSq_valid_2, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_commitToSq_bits_0_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_commitToSq_bits_1_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output [3:0]  io_commitToSq_bits_2_sqIdx_value, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_commitToCsr_csrWen, // @[src/main/scala/backend/Backend.scala 46:14]
  output [13:0] io_commitToCsr_csrWaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_commitToCsr_csrWdata, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_excpEvent_excp, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_excpEvent_ertn, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_excpInfo_vaddrError, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_excpInfo_era, // @[src/main/scala/backend/Backend.scala 46:14]
  output [5:0]  io_excpInfo_ecode, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_excpInfo_badVaddr, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_redirectAddrFromCsr_eentry, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_redirectAddrFromCsr_era, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [31:0] io_timerInfo_tid, // @[src/main/scala/backend/Backend.scala 46:14]
  input  [63:0] io_timerInfo_timer, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_bpuUpdate_valid, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_bpuUpdate_pc, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_bpuUpdate_taken, // @[src/main/scala/backend/Backend.scala 46:14]
  output [31:0] io_bpuUpdate_target, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_bpuUpdate_oldPhtCounter, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_bpuUpdate_isJalr, // @[src/main/scala/backend/Backend.scala 46:14]
  output        io_bpuUpdate_isJal, // @[src/main/scala/backend/Backend.scala 46:14]
  output [1:0]  io_bpuUpdate_offset // @[src/main/scala/backend/Backend.scala 46:14]
);
  wire  ctrlBlock_clock; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_reset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_ready; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_0_bits_instr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_0_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_ready; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_1_bits_instr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_1_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_ready; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_2_bits_instr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_2_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_q1IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [13:0] ctrlBlock_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q1IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q1IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q1IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_q2IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [13:0] ctrlBlock_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q2IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q2IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_q3IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [13:0] ctrlBlock_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q3IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q3IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_q4IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [13:0] ctrlBlock_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q4IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q4IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q4IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q4IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_q5IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [13:0] ctrlBlock_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q5IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_q5IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_q5IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_iqFeedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_iqFeedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_iqFeedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_iqFeedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_iqFeedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_req_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_req_bits_isLoad; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_req_bits_isStore; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_req_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_req_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_inst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_lsEnq_toLsqData_ctrl_immType; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_lsEnq_toLsqData_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_imm; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [13:0] ctrlBlock_io_lsEnq_toLsqData_csrAddress; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [1:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_lsEnq_toLsqData_ldst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_lsEnq_toLsqData_lrs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [4:0] ctrlBlock_io_lsEnq_toLsqData_lrs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_lsEnq_toLsqData_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_lsEnq_toLsqData_prs1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_lsEnq_toLsqData_prs2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_lsEnq_toLsqData_oldPdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_snptId_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_lsEnq_toLsqData_snptId_bits; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_rs1Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_rs2Valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_rdValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_lsEnq_toLsqData_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_toLsqData_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_lqFull; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_lsEnq_sqFull; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_writeback_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_writeback_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_0_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_0_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_0_bits_memValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_0_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_0_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_0_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_0_bits_rfdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_0_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [63:0] ctrlBlock_io_writeback_0_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_writeback_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_1_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_writeback_1_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_writeback_1_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_1_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_1_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_1_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_1_bits_memValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_1_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_1_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_1_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_1_bits_rfdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_1_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [63:0] ctrlBlock_io_writeback_1_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_writeback_1_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_2_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_writeback_2_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_writeback_2_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_2_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_2_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_2_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_2_bits_memValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_2_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_2_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_2_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_2_bits_rfdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_2_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [63:0] ctrlBlock_io_writeback_2_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_writeback_2_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_3_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_writeback_3_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_writeback_3_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_3_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_3_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_3_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_3_bits_memValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_3_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_3_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_3_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_3_bits_rfdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_3_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [63:0] ctrlBlock_io_writeback_3_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_writeback_3_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_4_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_writeback_4_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_writeback_4_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_4_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_4_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_4_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_writeback_4_bits_memValid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_4_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_4_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_4_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_4_bits_rfdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_writeback_4_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [63:0] ctrlBlock_io_writeback_4_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [16:0] ctrlBlock_io_writeback_4_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_commitToSq_valid_0; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_commitToSq_valid_1; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_commitToSq_valid_2; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_commitToSq_bits_0_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_commitToSq_bits_1_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [3:0] ctrlBlock_io_commitToSq_bits_2_sqIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_commitToCsr_csrWen; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [13:0] ctrlBlock_io_commitToCsr_csrWaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_commitToCsr_csrWdata; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_bruInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_bruInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_bruInfo_bits_snptId; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_bruInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_bruInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_bruInfo_bits_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_redirectInfo_bits_flushSelf; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_redirectInfo_bits_fromBru; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [2:0] ctrlBlock_io_redirectInfo_bits_snptId; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_redirectInfo_bits_fromRob; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_redirectInfo_bits_target; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_excpEvent_excp; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_excpEvent_ertn; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_excpInfo_vaddrError; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_excpInfo_era; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [5:0] ctrlBlock_io_excpInfo_ecode; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_excpInfo_badVaddr; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_redirectAddrFromCsr_eentry; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [31:0] ctrlBlock_io_redirectAddrFromCsr_era; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_extInt; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_wakeupPorts_0_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_wakeupPorts_1_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_wakeupPorts_2_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_wakeupPorts_3_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  ctrlBlock_io_wakeupPorts_4_valid; // @[src/main/scala/backend/Backend.scala 52:27]
  wire [6:0] ctrlBlock_io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/Backend.scala 52:27]
  wire  scheduler_clock; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_reset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q1IQEnq_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q1IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q1IQEnq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q1IQEnq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1IQEnq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1IQEnq_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q1IQEnq_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q1IQEnq_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q2IQEnq_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q2IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q2IQEnq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q2IQEnq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2IQEnq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q2IQEnq_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q2IQEnq_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q3IQEnq_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q3IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q3IQEnq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q3IQEnq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3IQEnq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q3IQEnq_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q3IQEnq_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q4IQEnq_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q4IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q4IQEnq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q4IQEnq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4IQEnq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q4IQEnq_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q4IQEnq_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4IQEnq_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_isSta; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4IQEnq_bits_isStd; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q5IQEnq_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q5IQEnq_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q5IQEnq_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q5IQEnq_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5IQEnq_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5IQEnq_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5IQEnq_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q5IQEnq_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q5IQEnq_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5IQEnq_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5IQEnq_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_isSta; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5IQEnq_bits_isStd; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_ready; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q1Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q1Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q1Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q1Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q1Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q1Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q1Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q1Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q1Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q1Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q1Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q1Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q1Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_ready; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q2Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q2Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q2Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q2Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q2Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q2Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q2Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q2Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q2Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q2Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q2Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q2Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q2Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_ready; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q3Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q3Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q3Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q3Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q3Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q3Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q3Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q3Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q3Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q3Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q3Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q3Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q3Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_ready; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q4Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q4Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q4Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q4Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q4Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q4Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q4Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q4Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q4Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q4Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q4Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q4Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q4Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_ready; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [16:0] scheduler_io_q5Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [13:0] scheduler_io_q5Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q5Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q5Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [1:0] scheduler_io_q5Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [31:0] scheduler_io_q5Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_q5Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_q5Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q5Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_q5Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_q5Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [2:0] scheduler_io_q5Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_q5Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_wakeupPorts_0_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_wakeupPorts_1_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_wakeupPorts_2_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_wakeupPorts_3_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_wakeupPorts_4_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [6:0] scheduler_io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [5:0] scheduler_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  scheduler_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_feedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_feedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_feedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [4:0] scheduler_io_feedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 62:27]
  wire [3:0] scheduler_io_feedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 62:27]
  wire  regRead_clock; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_reset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_iqIssues_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_iqIssues_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_0_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_1_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_1_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_iqIssues_1_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_iqIssues_1_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_1_bits_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_1_bits_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_1_bits_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_1_bits_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_1_bits_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_1_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_1_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_1_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_1_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_1_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_2_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_2_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_iqIssues_2_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_iqIssues_2_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_2_bits_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_2_bits_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_2_bits_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_2_bits_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_2_bits_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_2_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_2_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_2_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_2_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_2_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_2_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_2_bits_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_3_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_3_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_iqIssues_3_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_iqIssues_3_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_3_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_3_bits_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_3_bits_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_3_bits_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_3_bits_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_3_bits_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_3_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_3_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_3_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_3_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_3_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_3_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_3_bits_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_4_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_4_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_iqIssues_4_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_iqIssues_4_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_4_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_4_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_iqIssues_4_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_iqIssues_4_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_4_bits_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_4_bits_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_iqIssues_4_bits_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_4_bits_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_4_bits_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_4_bits_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_iqIssues_4_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_4_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_iqIssues_4_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_4_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_iqIssues_4_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_iqIssues_4_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_iqIssues_4_bits_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_0; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_3; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_4; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_5; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_6; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_rfReadAddrs_7; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_0; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_3; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_4; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_5; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_6; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_rfReadData_7; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_exeReqs_0_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_exeReqs_0_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_0_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_0_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_0_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_0_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_0_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_0_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_0_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_0_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_1_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_exeReqs_1_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_exeReqs_1_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_1_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_1_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_1_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_1_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_1_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_1_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_1_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_exeReqs_2_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_exeReqs_2_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_2_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_2_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_2_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_2_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_2_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_2_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_2_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_2_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_exeReqs_3_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_exeReqs_3_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_3_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_3_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_3_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_3_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_3_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_3_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_3_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_3_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_ready; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [16:0] regRead_io_exeReqs_4_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [13:0] regRead_io_exeReqs_4_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [1:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [4:0] regRead_io_exeReqs_4_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [6:0] regRead_io_exeReqs_4_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_4_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_exeReqs_4_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [3:0] regRead_io_exeReqs_4_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [2:0] regRead_io_exeReqs_4_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_exeReqs_4_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [31:0] regRead_io_exeReqs_4_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 63:27]
  wire [5:0] regRead_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regRead_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 63:27]
  wire  regFile_clock; // @[src/main/scala/backend/Backend.scala 64:27]
  wire  regFile_reset; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_0_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_0_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_1_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_1_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_2_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_2_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_3_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_3_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_4_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_4_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_5_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_5_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_6_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_6_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_readPorts_7_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_readPorts_7_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire  regFile_io_writePorts_0_valid; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_writePorts_0_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_writePorts_0_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire  regFile_io_writePorts_1_valid; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_writePorts_1_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_writePorts_1_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire  regFile_io_writePorts_2_valid; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_writePorts_2_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_writePorts_2_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire  regFile_io_writePorts_3_valid; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_writePorts_3_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_writePorts_3_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire  regFile_io_writePorts_4_valid; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [6:0] regFile_io_writePorts_4_addr; // @[src/main/scala/backend/Backend.scala 64:27]
  wire [31:0] regFile_io_writePorts_4_data; // @[src/main/scala/backend/Backend.scala 64:27]
  wire  exeUnits_0_clock; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_reset; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_inReq_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_inReq_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_inReq_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_inReq_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_inReq_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [16:0] exeUnits_0_io_inReq_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [13:0] exeUnits_0_io_inReq_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [1:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [1:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [1:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_inReq_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_inReq_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_inReq_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_inReq_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_inReq_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_inReq_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_inReq_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [5:0] exeUnits_0_io_inReq_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [5:0] exeUnits_0_io_inReq_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_inReq_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_inReq_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_inReq_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_inReq_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_inReq_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_ready; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [16:0] exeUnits_0_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [13:0] exeUnits_0_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [1:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [1:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [1:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [4:0] exeUnits_0_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [6:0] exeUnits_0_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [5:0] exeUnits_0_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [5:0] exeUnits_0_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [3:0] exeUnits_0_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [2:0] exeUnits_0_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_0_io_outResult_bits_csrWen; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [13:0] exeUnits_0_io_outResult_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_outResult_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [63:0] exeUnits_0_io_outResult_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [13:0] exeUnits_0_io_csrRaddr; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_csrRdata; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [31:0] exeUnits_0_io_timerInfo_tid; // @[src/main/scala/backend/Backend.scala 83:11]
  wire [63:0] exeUnits_0_io_timerInfo_timer; // @[src/main/scala/backend/Backend.scala 83:11]
  wire  exeUnits_1_clock; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_reset; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_inReq_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_inReq_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_inReq_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_inReq_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_inReq_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [16:0] exeUnits_1_io_inReq_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [13:0] exeUnits_1_io_inReq_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [1:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [1:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [1:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_inReq_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_inReq_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_inReq_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_inReq_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_inReq_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_inReq_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_inReq_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [5:0] exeUnits_1_io_inReq_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [5:0] exeUnits_1_io_inReq_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_inReq_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_inReq_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_inReq_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_ready; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [3:0] exeUnits_1_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [16:0] exeUnits_1_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [13:0] exeUnits_1_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [1:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [1:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [1:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [4:0] exeUnits_1_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [6:0] exeUnits_1_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [5:0] exeUnits_1_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [5:0] exeUnits_1_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [2:0] exeUnits_1_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [31:0] exeUnits_1_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 84:11]
  wire [5:0] exeUnits_1_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_1_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 84:11]
  wire  exeUnits_2_clock; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_reset; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_inReq_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_inReq_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_inReq_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_inReq_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_inReq_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [16:0] exeUnits_2_io_inReq_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [13:0] exeUnits_2_io_inReq_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_inReq_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_inReq_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_inReq_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_inReq_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_inReq_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_inReq_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_inReq_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [5:0] exeUnits_2_io_inReq_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [5:0] exeUnits_2_io_inReq_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_inReq_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_inReq_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_inReq_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_inReq_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_inReq_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_ready; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [16:0] exeUnits_2_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [13:0] exeUnits_2_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [4:0] exeUnits_2_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [6:0] exeUnits_2_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [5:0] exeUnits_2_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [5:0] exeUnits_2_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [3:0] exeUnits_2_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_bruInfo_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_bruInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [2:0] exeUnits_2_io_bruInfo_bits_snptId; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [5:0] exeUnits_2_io_bruInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_bruInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_bruInfo_bits_target; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_bpuUpdate_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_bpuUpdate_pc; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_bpuUpdate_taken; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [31:0] exeUnits_2_io_bpuUpdate_target; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_bpuUpdate_oldPhtCounter; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_bpuUpdate_isJalr; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_bpuUpdate_isJal; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [1:0] exeUnits_2_io_bpuUpdate_offset; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 85:11]
  wire [5:0] exeUnits_2_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_2_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 85:11]
  wire  exeUnits_3_clock; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_reset; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_inReq_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_inReq_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_inReq_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_inReq_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_inReq_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [16:0] exeUnits_3_io_inReq_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [13:0] exeUnits_3_io_inReq_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [1:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [1:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [1:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_inReq_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_inReq_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_inReq_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_inReq_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_inReq_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_inReq_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_inReq_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [5:0] exeUnits_3_io_inReq_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [5:0] exeUnits_3_io_inReq_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_inReq_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_inReq_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_inReq_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_inReq_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_inReq_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_ready; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [16:0] exeUnits_3_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [13:0] exeUnits_3_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [1:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [1:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [1:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [4:0] exeUnits_3_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [6:0] exeUnits_3_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [5:0] exeUnits_3_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [5:0] exeUnits_3_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [3:0] exeUnits_3_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [2:0] exeUnits_3_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_redirect_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [5:0] exeUnits_3_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_memValid; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_memRead; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_memWrite; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_3_io_outResult_bits_csrWen; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [13:0] exeUnits_3_io_outResult_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [31:0] exeUnits_3_io_outResult_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 87:11]
  wire [63:0] exeUnits_3_io_outResult_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 87:11]
  wire  exeUnits_4_clock; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_reset; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_inReq_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_inReq_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_inReq_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_inReq_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_inReq_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [16:0] exeUnits_4_io_inReq_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [13:0] exeUnits_4_io_inReq_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [1:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [1:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [1:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_inReq_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_inReq_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_inReq_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_inReq_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_inReq_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_inReq_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_inReq_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [5:0] exeUnits_4_io_inReq_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [5:0] exeUnits_4_io_inReq_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_inReq_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_inReq_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_inReq_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_inReq_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_inReq_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_ready; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [16:0] exeUnits_4_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [13:0] exeUnits_4_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [1:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [1:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [1:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [4:0] exeUnits_4_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [6:0] exeUnits_4_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [5:0] exeUnits_4_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [5:0] exeUnits_4_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [3:0] exeUnits_4_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [2:0] exeUnits_4_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_redirect_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [5:0] exeUnits_4_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_memValid; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_memRead; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_memWrite; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  exeUnits_4_io_outResult_bits_csrWen; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [13:0] exeUnits_4_io_outResult_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [31:0] exeUnits_4_io_outResult_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 88:11]
  wire [63:0] exeUnits_4_io_outResult_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 88:11]
  wire  writeback_clock; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_reset; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_ready; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_0_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_0_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_0_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_0_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_InExeResults_0_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_InExeResults_0_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_0_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_0_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_0_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_0_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_0_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_0_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_0_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_0_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_0_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_0_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_0_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_0_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_0_bits_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_InExeResults_0_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_0_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [63:0] writeback_io_InExeResults_0_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_ready; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_1_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_1_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_1_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_1_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_InExeResults_1_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_InExeResults_1_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_1_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_1_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_1_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_1_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_1_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_1_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_1_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_1_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_1_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_1_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_1_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_1_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_ready; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_2_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_2_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_2_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_2_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_2_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_InExeResults_2_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_InExeResults_2_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [1:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_2_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_2_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [4:0] writeback_io_InExeResults_2_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_2_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_2_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_2_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_2_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_2_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_2_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_2_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_2_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [2:0] writeback_io_InExeResults_2_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_2_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_2_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_3_ready; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_3_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_3_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_3_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_3_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_3_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_InExeResults_3_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_3_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_3_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_3_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_3_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_3_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_3_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_3_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_3_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_3_bits_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_3_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_3_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_4_ready; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_4_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_4_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_4_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_4_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_InExeResults_4_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_InExeResults_4_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_4_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_4_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_4_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_4_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_4_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_InExeResults_4_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_InExeResults_4_bits_redirect_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_InExeResults_4_bits_redirect_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_4_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_4_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_InExeResults_4_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_rfWritePorts_0_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_rfWritePorts_0_addr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_rfWritePorts_0_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_rfWritePorts_1_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_rfWritePorts_1_addr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_rfWritePorts_1_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_rfWritePorts_2_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_rfWritePorts_2_addr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_rfWritePorts_2_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_rfWritePorts_3_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_rfWritePorts_3_addr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_rfWritePorts_3_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_rfWritePorts_4_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_rfWritePorts_4_addr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_rfWritePorts_4_data; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_wakeupPorts_0_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_wakeupPorts_1_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_wakeupPorts_2_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_wakeupPorts_3_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_wakeupPorts_4_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [6:0] writeback_io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_toRObResults_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_toRObResults_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_bits_memValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_0_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_0_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_0_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_0_bits_rfdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_bits_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_toRObResults_0_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_0_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [63:0] writeback_io_toRObResults_0_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_toRObResults_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_0_bits_isBypass; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_toRObResults_1_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_toRObResults_1_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_bits_memValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_1_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_1_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_1_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_1_bits_rfdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_bits_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_toRObResults_1_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_1_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [63:0] writeback_io_toRObResults_1_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_toRObResults_1_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_1_bits_isBypass; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_toRObResults_2_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_toRObResults_2_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_bits_memValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_2_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_2_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_2_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_2_bits_rfdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_bits_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_toRObResults_2_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_2_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [63:0] writeback_io_toRObResults_2_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_toRObResults_2_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_2_bits_isBypass; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_toRObResults_3_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_toRObResults_3_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_bits_memValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_3_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_3_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_3_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_3_bits_rfdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_bits_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_toRObResults_3_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_3_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [63:0] writeback_io_toRObResults_3_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_toRObResults_3_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_3_bits_isBypass; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_valid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [5:0] writeback_io_toRObResults_4_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [3:0] writeback_io_toRObResults_4_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_bits_memValid; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_4_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_4_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_4_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_4_bits_rfdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_bits_csrWen; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [13:0] writeback_io_toRObResults_4_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [31:0] writeback_io_toRObResults_4_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [63:0] writeback_io_toRObResults_4_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 115:25]
  wire [16:0] writeback_io_toRObResults_4_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 115:25]
  wire  writeback_io_toRObResults_4_bits_isBypass; // @[src/main/scala/backend/Backend.scala 115:25]
  CtrlBlock ctrlBlock ( // @[src/main/scala/backend/Backend.scala 52:27]
    .clock(ctrlBlock_clock),
    .reset(ctrlBlock_reset),
    .io_in_0_ready(ctrlBlock_io_in_0_ready),
    .io_in_0_valid(ctrlBlock_io_in_0_valid),
    .io_in_0_bits_instr(ctrlBlock_io_in_0_bits_instr),
    .io_in_0_bits_pc(ctrlBlock_io_in_0_bits_pc),
    .io_in_0_bits_pdInfo_valid(ctrlBlock_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(ctrlBlock_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(ctrlBlock_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(ctrlBlock_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(ctrlBlock_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(ctrlBlock_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(ctrlBlock_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_bpuInfo_pc(ctrlBlock_io_in_0_bits_bpuInfo_pc),
    .io_in_0_bits_bpuInfo_fallThrough(ctrlBlock_io_in_0_bits_bpuInfo_fallThrough),
    .io_in_0_bits_bpuInfo_taken(ctrlBlock_io_in_0_bits_bpuInfo_taken),
    .io_in_0_bits_bpuInfo_target(ctrlBlock_io_in_0_bits_bpuInfo_target),
    .io_in_0_bits_bpuInfo_takenOffset(ctrlBlock_io_in_0_bits_bpuInfo_takenOffset),
    .io_in_0_bits_bpuInfo_meta_valid(ctrlBlock_io_in_0_bits_bpuInfo_meta_valid),
    .io_in_0_bits_bpuInfo_meta_btbHit(ctrlBlock_io_in_0_bits_bpuInfo_meta_btbHit),
    .io_in_0_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsJalr),
    .io_in_0_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsJal),
    .io_in_0_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsCall),
    .io_in_0_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsRet),
    .io_in_0_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_in_0_bits_bpuInfo_meta_btbOffset),
    .io_in_0_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_in_0_bits_bpuInfo_meta_phtCounter),
    .io_in_0_bits_bpuInfo_meta_rasTop(ctrlBlock_io_in_0_bits_bpuInfo_meta_rasTop),
    .io_in_0_bits_bpuInfo_meta_predTaken(ctrlBlock_io_in_0_bits_bpuInfo_meta_predTaken),
    .io_in_0_bits_bpuInfo_meta_predTarget(ctrlBlock_io_in_0_bits_bpuInfo_meta_predTarget),
    .io_in_0_bits_exception_excpTlbRefill(ctrlBlock_io_in_0_bits_exception_excpTlbRefill),
    .io_in_0_bits_exception_excpTlbPif(ctrlBlock_io_in_0_bits_exception_excpTlbPif),
    .io_in_0_bits_exception_excpTlbPpi(ctrlBlock_io_in_0_bits_exception_excpTlbPpi),
    .io_in_0_bits_exception_excpAdef(ctrlBlock_io_in_0_bits_exception_excpAdef),
    .io_in_1_ready(ctrlBlock_io_in_1_ready),
    .io_in_1_valid(ctrlBlock_io_in_1_valid),
    .io_in_1_bits_instr(ctrlBlock_io_in_1_bits_instr),
    .io_in_1_bits_pc(ctrlBlock_io_in_1_bits_pc),
    .io_in_1_bits_pdInfo_valid(ctrlBlock_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(ctrlBlock_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(ctrlBlock_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(ctrlBlock_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(ctrlBlock_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(ctrlBlock_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(ctrlBlock_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_bpuInfo_pc(ctrlBlock_io_in_1_bits_bpuInfo_pc),
    .io_in_1_bits_bpuInfo_fallThrough(ctrlBlock_io_in_1_bits_bpuInfo_fallThrough),
    .io_in_1_bits_bpuInfo_taken(ctrlBlock_io_in_1_bits_bpuInfo_taken),
    .io_in_1_bits_bpuInfo_target(ctrlBlock_io_in_1_bits_bpuInfo_target),
    .io_in_1_bits_bpuInfo_takenOffset(ctrlBlock_io_in_1_bits_bpuInfo_takenOffset),
    .io_in_1_bits_bpuInfo_meta_valid(ctrlBlock_io_in_1_bits_bpuInfo_meta_valid),
    .io_in_1_bits_bpuInfo_meta_btbHit(ctrlBlock_io_in_1_bits_bpuInfo_meta_btbHit),
    .io_in_1_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsJalr),
    .io_in_1_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsJal),
    .io_in_1_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsCall),
    .io_in_1_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsRet),
    .io_in_1_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_in_1_bits_bpuInfo_meta_btbOffset),
    .io_in_1_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_in_1_bits_bpuInfo_meta_phtCounter),
    .io_in_1_bits_bpuInfo_meta_rasTop(ctrlBlock_io_in_1_bits_bpuInfo_meta_rasTop),
    .io_in_1_bits_bpuInfo_meta_predTaken(ctrlBlock_io_in_1_bits_bpuInfo_meta_predTaken),
    .io_in_1_bits_bpuInfo_meta_predTarget(ctrlBlock_io_in_1_bits_bpuInfo_meta_predTarget),
    .io_in_1_bits_exception_excpTlbRefill(ctrlBlock_io_in_1_bits_exception_excpTlbRefill),
    .io_in_1_bits_exception_excpTlbPif(ctrlBlock_io_in_1_bits_exception_excpTlbPif),
    .io_in_1_bits_exception_excpTlbPpi(ctrlBlock_io_in_1_bits_exception_excpTlbPpi),
    .io_in_1_bits_exception_excpAdef(ctrlBlock_io_in_1_bits_exception_excpAdef),
    .io_in_2_ready(ctrlBlock_io_in_2_ready),
    .io_in_2_valid(ctrlBlock_io_in_2_valid),
    .io_in_2_bits_instr(ctrlBlock_io_in_2_bits_instr),
    .io_in_2_bits_pc(ctrlBlock_io_in_2_bits_pc),
    .io_in_2_bits_pdInfo_valid(ctrlBlock_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(ctrlBlock_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(ctrlBlock_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(ctrlBlock_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(ctrlBlock_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(ctrlBlock_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(ctrlBlock_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_bpuInfo_pc(ctrlBlock_io_in_2_bits_bpuInfo_pc),
    .io_in_2_bits_bpuInfo_fallThrough(ctrlBlock_io_in_2_bits_bpuInfo_fallThrough),
    .io_in_2_bits_bpuInfo_taken(ctrlBlock_io_in_2_bits_bpuInfo_taken),
    .io_in_2_bits_bpuInfo_target(ctrlBlock_io_in_2_bits_bpuInfo_target),
    .io_in_2_bits_bpuInfo_takenOffset(ctrlBlock_io_in_2_bits_bpuInfo_takenOffset),
    .io_in_2_bits_bpuInfo_meta_valid(ctrlBlock_io_in_2_bits_bpuInfo_meta_valid),
    .io_in_2_bits_bpuInfo_meta_btbHit(ctrlBlock_io_in_2_bits_bpuInfo_meta_btbHit),
    .io_in_2_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsJalr),
    .io_in_2_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsJal),
    .io_in_2_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsCall),
    .io_in_2_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsRet),
    .io_in_2_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_in_2_bits_bpuInfo_meta_btbOffset),
    .io_in_2_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_in_2_bits_bpuInfo_meta_phtCounter),
    .io_in_2_bits_bpuInfo_meta_rasTop(ctrlBlock_io_in_2_bits_bpuInfo_meta_rasTop),
    .io_in_2_bits_bpuInfo_meta_predTaken(ctrlBlock_io_in_2_bits_bpuInfo_meta_predTaken),
    .io_in_2_bits_bpuInfo_meta_predTarget(ctrlBlock_io_in_2_bits_bpuInfo_meta_predTarget),
    .io_in_2_bits_exception_excpTlbRefill(ctrlBlock_io_in_2_bits_exception_excpTlbRefill),
    .io_in_2_bits_exception_excpTlbPif(ctrlBlock_io_in_2_bits_exception_excpTlbPif),
    .io_in_2_bits_exception_excpTlbPpi(ctrlBlock_io_in_2_bits_exception_excpTlbPpi),
    .io_in_2_bits_exception_excpAdef(ctrlBlock_io_in_2_bits_exception_excpAdef),
    .io_q1IQEnq_0_valid(ctrlBlock_io_q1IQEnq_0_valid),
    .io_q1IQEnq_0_bits_pc(ctrlBlock_io_q1IQEnq_0_bits_pc),
    .io_q1IQEnq_0_bits_inst(ctrlBlock_io_q1IQEnq_0_bits_inst),
    .io_q1IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType),
    .io_q1IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp),
    .io_q1IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp),
    .io_q1IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp),
    .io_q1IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp),
    .io_q1IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp),
    .io_q1IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp),
    .io_q1IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type),
    .io_q1IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type),
    .io_q1IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType),
    .io_q1IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen),
    .io_q1IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead),
    .io_q1IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite),
    .io_q1IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen),
    .io_q1IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch),
    .io_q1IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump),
    .io_q1IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv),
    .io_q1IQEnq_0_bits_excp_excpVec(ctrlBlock_io_q1IQEnq_0_bits_excp_excpVec),
    .io_q1IQEnq_0_bits_imm(ctrlBlock_io_q1IQEnq_0_bits_imm),
    .io_q1IQEnq_0_bits_csrAddress(ctrlBlock_io_q1IQEnq_0_bits_csrAddress),
    .io_q1IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid),
    .io_q1IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr),
    .io_q1IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal),
    .io_q1IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr),
    .io_q1IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall),
    .io_q1IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet),
    .io_q1IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q1IQEnq_0_bits_bpuInfo_pc(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_pc),
    .io_q1IQEnq_0_bits_bpuInfo_fallThrough(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q1IQEnq_0_bits_bpuInfo_taken(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_taken),
    .io_q1IQEnq_0_bits_bpuInfo_target(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_target),
    .io_q1IQEnq_0_bits_bpuInfo_takenOffset(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q1IQEnq_0_bits_bpuInfo_meta_valid(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbHit(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q1IQEnq_0_bits_bpuInfo_meta_rasTop(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q1IQEnq_0_bits_bpuInfo_meta_predTaken(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q1IQEnq_0_bits_bpuInfo_meta_predTarget(ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q1IQEnq_0_bits_ldst(ctrlBlock_io_q1IQEnq_0_bits_ldst),
    .io_q1IQEnq_0_bits_lrs1(ctrlBlock_io_q1IQEnq_0_bits_lrs1),
    .io_q1IQEnq_0_bits_lrs2(ctrlBlock_io_q1IQEnq_0_bits_lrs2),
    .io_q1IQEnq_0_bits_pdst(ctrlBlock_io_q1IQEnq_0_bits_pdst),
    .io_q1IQEnq_0_bits_prs1(ctrlBlock_io_q1IQEnq_0_bits_prs1),
    .io_q1IQEnq_0_bits_prs2(ctrlBlock_io_q1IQEnq_0_bits_prs2),
    .io_q1IQEnq_0_bits_oldPdst(ctrlBlock_io_q1IQEnq_0_bits_oldPdst),
    .io_q1IQEnq_0_bits_rs1Valid(ctrlBlock_io_q1IQEnq_0_bits_rs1Valid),
    .io_q1IQEnq_0_bits_rs2Valid(ctrlBlock_io_q1IQEnq_0_bits_rs2Valid),
    .io_q1IQEnq_0_bits_rdValid(ctrlBlock_io_q1IQEnq_0_bits_rdValid),
    .io_q1IQEnq_0_bits_snptId_valid(ctrlBlock_io_q1IQEnq_0_bits_snptId_valid),
    .io_q1IQEnq_0_bits_snptId_bits(ctrlBlock_io_q1IQEnq_0_bits_snptId_bits),
    .io_q1IQEnq_0_bits_robIdx_value(ctrlBlock_io_q1IQEnq_0_bits_robIdx_value),
    .io_q1IQEnq_0_bits_robIdx_flag(ctrlBlock_io_q1IQEnq_0_bits_robIdx_flag),
    .io_q1IQEnq_0_bits_robIdxFull_value(ctrlBlock_io_q1IQEnq_0_bits_robIdxFull_value),
    .io_q1IQEnq_0_bits_robIdxFull_flag(ctrlBlock_io_q1IQEnq_0_bits_robIdxFull_flag),
    .io_q1IQEnq_0_bits_prs1Busy(ctrlBlock_io_q1IQEnq_0_bits_prs1Busy),
    .io_q1IQEnq_0_bits_prs2Busy(ctrlBlock_io_q1IQEnq_0_bits_prs2Busy),
    .io_q2IQEnq_0_valid(ctrlBlock_io_q2IQEnq_0_valid),
    .io_q2IQEnq_0_bits_pc(ctrlBlock_io_q2IQEnq_0_bits_pc),
    .io_q2IQEnq_0_bits_inst(ctrlBlock_io_q2IQEnq_0_bits_inst),
    .io_q2IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType),
    .io_q2IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp),
    .io_q2IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp),
    .io_q2IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp),
    .io_q2IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp),
    .io_q2IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp),
    .io_q2IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp),
    .io_q2IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type),
    .io_q2IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type),
    .io_q2IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType),
    .io_q2IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen),
    .io_q2IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead),
    .io_q2IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite),
    .io_q2IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen),
    .io_q2IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch),
    .io_q2IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump),
    .io_q2IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv),
    .io_q2IQEnq_0_bits_excp_excpVec(ctrlBlock_io_q2IQEnq_0_bits_excp_excpVec),
    .io_q2IQEnq_0_bits_imm(ctrlBlock_io_q2IQEnq_0_bits_imm),
    .io_q2IQEnq_0_bits_csrAddress(ctrlBlock_io_q2IQEnq_0_bits_csrAddress),
    .io_q2IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid),
    .io_q2IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr),
    .io_q2IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal),
    .io_q2IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr),
    .io_q2IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall),
    .io_q2IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet),
    .io_q2IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q2IQEnq_0_bits_bpuInfo_pc(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_pc),
    .io_q2IQEnq_0_bits_bpuInfo_fallThrough(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q2IQEnq_0_bits_bpuInfo_taken(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_taken),
    .io_q2IQEnq_0_bits_bpuInfo_target(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_target),
    .io_q2IQEnq_0_bits_bpuInfo_takenOffset(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q2IQEnq_0_bits_bpuInfo_meta_valid(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbHit(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q2IQEnq_0_bits_bpuInfo_meta_rasTop(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q2IQEnq_0_bits_bpuInfo_meta_predTaken(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q2IQEnq_0_bits_bpuInfo_meta_predTarget(ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q2IQEnq_0_bits_ldst(ctrlBlock_io_q2IQEnq_0_bits_ldst),
    .io_q2IQEnq_0_bits_lrs1(ctrlBlock_io_q2IQEnq_0_bits_lrs1),
    .io_q2IQEnq_0_bits_lrs2(ctrlBlock_io_q2IQEnq_0_bits_lrs2),
    .io_q2IQEnq_0_bits_pdst(ctrlBlock_io_q2IQEnq_0_bits_pdst),
    .io_q2IQEnq_0_bits_prs1(ctrlBlock_io_q2IQEnq_0_bits_prs1),
    .io_q2IQEnq_0_bits_prs2(ctrlBlock_io_q2IQEnq_0_bits_prs2),
    .io_q2IQEnq_0_bits_oldPdst(ctrlBlock_io_q2IQEnq_0_bits_oldPdst),
    .io_q2IQEnq_0_bits_rs1Valid(ctrlBlock_io_q2IQEnq_0_bits_rs1Valid),
    .io_q2IQEnq_0_bits_rs2Valid(ctrlBlock_io_q2IQEnq_0_bits_rs2Valid),
    .io_q2IQEnq_0_bits_rdValid(ctrlBlock_io_q2IQEnq_0_bits_rdValid),
    .io_q2IQEnq_0_bits_snptId_valid(ctrlBlock_io_q2IQEnq_0_bits_snptId_valid),
    .io_q2IQEnq_0_bits_snptId_bits(ctrlBlock_io_q2IQEnq_0_bits_snptId_bits),
    .io_q2IQEnq_0_bits_robIdx_value(ctrlBlock_io_q2IQEnq_0_bits_robIdx_value),
    .io_q2IQEnq_0_bits_robIdx_flag(ctrlBlock_io_q2IQEnq_0_bits_robIdx_flag),
    .io_q2IQEnq_0_bits_robIdxFull_value(ctrlBlock_io_q2IQEnq_0_bits_robIdxFull_value),
    .io_q2IQEnq_0_bits_robIdxFull_flag(ctrlBlock_io_q2IQEnq_0_bits_robIdxFull_flag),
    .io_q2IQEnq_0_bits_issueQueue(ctrlBlock_io_q2IQEnq_0_bits_issueQueue),
    .io_q2IQEnq_0_bits_prs1Busy(ctrlBlock_io_q2IQEnq_0_bits_prs1Busy),
    .io_q2IQEnq_0_bits_prs2Busy(ctrlBlock_io_q2IQEnq_0_bits_prs2Busy),
    .io_q3IQEnq_0_valid(ctrlBlock_io_q3IQEnq_0_valid),
    .io_q3IQEnq_0_bits_pc(ctrlBlock_io_q3IQEnq_0_bits_pc),
    .io_q3IQEnq_0_bits_inst(ctrlBlock_io_q3IQEnq_0_bits_inst),
    .io_q3IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType),
    .io_q3IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp),
    .io_q3IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp),
    .io_q3IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp),
    .io_q3IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp),
    .io_q3IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp),
    .io_q3IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp),
    .io_q3IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type),
    .io_q3IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type),
    .io_q3IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType),
    .io_q3IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen),
    .io_q3IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead),
    .io_q3IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite),
    .io_q3IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen),
    .io_q3IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch),
    .io_q3IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump),
    .io_q3IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv),
    .io_q3IQEnq_0_bits_excp_excpVec(ctrlBlock_io_q3IQEnq_0_bits_excp_excpVec),
    .io_q3IQEnq_0_bits_imm(ctrlBlock_io_q3IQEnq_0_bits_imm),
    .io_q3IQEnq_0_bits_csrAddress(ctrlBlock_io_q3IQEnq_0_bits_csrAddress),
    .io_q3IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid),
    .io_q3IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr),
    .io_q3IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal),
    .io_q3IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr),
    .io_q3IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall),
    .io_q3IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet),
    .io_q3IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q3IQEnq_0_bits_bpuInfo_pc(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_pc),
    .io_q3IQEnq_0_bits_bpuInfo_fallThrough(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q3IQEnq_0_bits_bpuInfo_taken(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_taken),
    .io_q3IQEnq_0_bits_bpuInfo_target(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_target),
    .io_q3IQEnq_0_bits_bpuInfo_takenOffset(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q3IQEnq_0_bits_bpuInfo_meta_valid(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbHit(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q3IQEnq_0_bits_bpuInfo_meta_rasTop(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q3IQEnq_0_bits_bpuInfo_meta_predTaken(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q3IQEnq_0_bits_bpuInfo_meta_predTarget(ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q3IQEnq_0_bits_ldst(ctrlBlock_io_q3IQEnq_0_bits_ldst),
    .io_q3IQEnq_0_bits_lrs1(ctrlBlock_io_q3IQEnq_0_bits_lrs1),
    .io_q3IQEnq_0_bits_lrs2(ctrlBlock_io_q3IQEnq_0_bits_lrs2),
    .io_q3IQEnq_0_bits_pdst(ctrlBlock_io_q3IQEnq_0_bits_pdst),
    .io_q3IQEnq_0_bits_prs1(ctrlBlock_io_q3IQEnq_0_bits_prs1),
    .io_q3IQEnq_0_bits_prs2(ctrlBlock_io_q3IQEnq_0_bits_prs2),
    .io_q3IQEnq_0_bits_oldPdst(ctrlBlock_io_q3IQEnq_0_bits_oldPdst),
    .io_q3IQEnq_0_bits_rs1Valid(ctrlBlock_io_q3IQEnq_0_bits_rs1Valid),
    .io_q3IQEnq_0_bits_rs2Valid(ctrlBlock_io_q3IQEnq_0_bits_rs2Valid),
    .io_q3IQEnq_0_bits_rdValid(ctrlBlock_io_q3IQEnq_0_bits_rdValid),
    .io_q3IQEnq_0_bits_snptId_valid(ctrlBlock_io_q3IQEnq_0_bits_snptId_valid),
    .io_q3IQEnq_0_bits_snptId_bits(ctrlBlock_io_q3IQEnq_0_bits_snptId_bits),
    .io_q3IQEnq_0_bits_robIdx_value(ctrlBlock_io_q3IQEnq_0_bits_robIdx_value),
    .io_q3IQEnq_0_bits_robIdx_flag(ctrlBlock_io_q3IQEnq_0_bits_robIdx_flag),
    .io_q3IQEnq_0_bits_robIdxFull_value(ctrlBlock_io_q3IQEnq_0_bits_robIdxFull_value),
    .io_q3IQEnq_0_bits_robIdxFull_flag(ctrlBlock_io_q3IQEnq_0_bits_robIdxFull_flag),
    .io_q3IQEnq_0_bits_issueQueue(ctrlBlock_io_q3IQEnq_0_bits_issueQueue),
    .io_q3IQEnq_0_bits_prs1Busy(ctrlBlock_io_q3IQEnq_0_bits_prs1Busy),
    .io_q3IQEnq_0_bits_prs2Busy(ctrlBlock_io_q3IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_valid(ctrlBlock_io_q4IQEnq_0_valid),
    .io_q4IQEnq_0_bits_pc(ctrlBlock_io_q4IQEnq_0_bits_pc),
    .io_q4IQEnq_0_bits_inst(ctrlBlock_io_q4IQEnq_0_bits_inst),
    .io_q4IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType),
    .io_q4IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp),
    .io_q4IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp),
    .io_q4IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp),
    .io_q4IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp),
    .io_q4IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp),
    .io_q4IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp),
    .io_q4IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type),
    .io_q4IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type),
    .io_q4IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType),
    .io_q4IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen),
    .io_q4IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead),
    .io_q4IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite),
    .io_q4IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen),
    .io_q4IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch),
    .io_q4IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump),
    .io_q4IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv),
    .io_q4IQEnq_0_bits_excp_excpVec(ctrlBlock_io_q4IQEnq_0_bits_excp_excpVec),
    .io_q4IQEnq_0_bits_imm(ctrlBlock_io_q4IQEnq_0_bits_imm),
    .io_q4IQEnq_0_bits_csrAddress(ctrlBlock_io_q4IQEnq_0_bits_csrAddress),
    .io_q4IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid),
    .io_q4IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr),
    .io_q4IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal),
    .io_q4IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr),
    .io_q4IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall),
    .io_q4IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet),
    .io_q4IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q4IQEnq_0_bits_bpuInfo_pc(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_pc),
    .io_q4IQEnq_0_bits_bpuInfo_fallThrough(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q4IQEnq_0_bits_bpuInfo_taken(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_taken),
    .io_q4IQEnq_0_bits_bpuInfo_target(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_target),
    .io_q4IQEnq_0_bits_bpuInfo_takenOffset(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q4IQEnq_0_bits_bpuInfo_meta_valid(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbHit(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q4IQEnq_0_bits_bpuInfo_meta_rasTop(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q4IQEnq_0_bits_bpuInfo_meta_predTaken(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q4IQEnq_0_bits_bpuInfo_meta_predTarget(ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q4IQEnq_0_bits_ldst(ctrlBlock_io_q4IQEnq_0_bits_ldst),
    .io_q4IQEnq_0_bits_lrs1(ctrlBlock_io_q4IQEnq_0_bits_lrs1),
    .io_q4IQEnq_0_bits_lrs2(ctrlBlock_io_q4IQEnq_0_bits_lrs2),
    .io_q4IQEnq_0_bits_pdst(ctrlBlock_io_q4IQEnq_0_bits_pdst),
    .io_q4IQEnq_0_bits_prs1(ctrlBlock_io_q4IQEnq_0_bits_prs1),
    .io_q4IQEnq_0_bits_prs2(ctrlBlock_io_q4IQEnq_0_bits_prs2),
    .io_q4IQEnq_0_bits_oldPdst(ctrlBlock_io_q4IQEnq_0_bits_oldPdst),
    .io_q4IQEnq_0_bits_rs1Valid(ctrlBlock_io_q4IQEnq_0_bits_rs1Valid),
    .io_q4IQEnq_0_bits_rs2Valid(ctrlBlock_io_q4IQEnq_0_bits_rs2Valid),
    .io_q4IQEnq_0_bits_rdValid(ctrlBlock_io_q4IQEnq_0_bits_rdValid),
    .io_q4IQEnq_0_bits_snptId_valid(ctrlBlock_io_q4IQEnq_0_bits_snptId_valid),
    .io_q4IQEnq_0_bits_snptId_bits(ctrlBlock_io_q4IQEnq_0_bits_snptId_bits),
    .io_q4IQEnq_0_bits_robIdx_value(ctrlBlock_io_q4IQEnq_0_bits_robIdx_value),
    .io_q4IQEnq_0_bits_robIdx_flag(ctrlBlock_io_q4IQEnq_0_bits_robIdx_flag),
    .io_q4IQEnq_0_bits_robIdxFull_value(ctrlBlock_io_q4IQEnq_0_bits_robIdxFull_value),
    .io_q4IQEnq_0_bits_robIdxFull_flag(ctrlBlock_io_q4IQEnq_0_bits_robIdxFull_flag),
    .io_q4IQEnq_0_bits_lqIdx_value(ctrlBlock_io_q4IQEnq_0_bits_lqIdx_value),
    .io_q4IQEnq_0_bits_lqIdx_flag(ctrlBlock_io_q4IQEnq_0_bits_lqIdx_flag),
    .io_q4IQEnq_0_bits_sqIdx_value(ctrlBlock_io_q4IQEnq_0_bits_sqIdx_value),
    .io_q4IQEnq_0_bits_sqIdx_flag(ctrlBlock_io_q4IQEnq_0_bits_sqIdx_flag),
    .io_q4IQEnq_0_bits_issueQueue(ctrlBlock_io_q4IQEnq_0_bits_issueQueue),
    .io_q4IQEnq_0_bits_prs1Busy(ctrlBlock_io_q4IQEnq_0_bits_prs1Busy),
    .io_q4IQEnq_0_bits_prs2Busy(ctrlBlock_io_q4IQEnq_0_bits_prs2Busy),
    .io_q4IQEnq_0_bits_isSta(ctrlBlock_io_q4IQEnq_0_bits_isSta),
    .io_q4IQEnq_0_bits_isStd(ctrlBlock_io_q4IQEnq_0_bits_isStd),
    .io_q5IQEnq_0_valid(ctrlBlock_io_q5IQEnq_0_valid),
    .io_q5IQEnq_0_bits_pc(ctrlBlock_io_q5IQEnq_0_bits_pc),
    .io_q5IQEnq_0_bits_inst(ctrlBlock_io_q5IQEnq_0_bits_inst),
    .io_q5IQEnq_0_bits_ctrl_fuType(ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType),
    .io_q5IQEnq_0_bits_ctrl_aluOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp),
    .io_q5IQEnq_0_bits_ctrl_bruOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp),
    .io_q5IQEnq_0_bits_ctrl_lsuOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp),
    .io_q5IQEnq_0_bits_ctrl_csrOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp),
    .io_q5IQEnq_0_bits_ctrl_mulOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp),
    .io_q5IQEnq_0_bits_ctrl_divOp(ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp),
    .io_q5IQEnq_0_bits_ctrl_src1Type(ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type),
    .io_q5IQEnq_0_bits_ctrl_src2Type(ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type),
    .io_q5IQEnq_0_bits_ctrl_immType(ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType),
    .io_q5IQEnq_0_bits_ctrl_rfWen(ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen),
    .io_q5IQEnq_0_bits_ctrl_memRead(ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead),
    .io_q5IQEnq_0_bits_ctrl_memWrite(ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite),
    .io_q5IQEnq_0_bits_ctrl_csrWen(ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen),
    .io_q5IQEnq_0_bits_ctrl_isBranch(ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch),
    .io_q5IQEnq_0_bits_ctrl_isJump(ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump),
    .io_q5IQEnq_0_bits_ctrl_isPriv(ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv),
    .io_q5IQEnq_0_bits_excp_excpVec(ctrlBlock_io_q5IQEnq_0_bits_excp_excpVec),
    .io_q5IQEnq_0_bits_imm(ctrlBlock_io_q5IQEnq_0_bits_imm),
    .io_q5IQEnq_0_bits_csrAddress(ctrlBlock_io_q5IQEnq_0_bits_csrAddress),
    .io_q5IQEnq_0_bits_pdInfo_valid(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid),
    .io_q5IQEnq_0_bits_pdInfo_isBr(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr),
    .io_q5IQEnq_0_bits_pdInfo_isJal(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal),
    .io_q5IQEnq_0_bits_pdInfo_isJalr(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr),
    .io_q5IQEnq_0_bits_pdInfo_isCall(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall),
    .io_q5IQEnq_0_bits_pdInfo_isRet(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet),
    .io_q5IQEnq_0_bits_pdInfo_jumpTarget(ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget),
    .io_q5IQEnq_0_bits_bpuInfo_pc(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_pc),
    .io_q5IQEnq_0_bits_bpuInfo_fallThrough(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_fallThrough),
    .io_q5IQEnq_0_bits_bpuInfo_taken(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_taken),
    .io_q5IQEnq_0_bits_bpuInfo_target(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_target),
    .io_q5IQEnq_0_bits_bpuInfo_takenOffset(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_takenOffset),
    .io_q5IQEnq_0_bits_bpuInfo_meta_valid(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_valid),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbHit(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbHit),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet),
    .io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset),
    .io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter),
    .io_q5IQEnq_0_bits_bpuInfo_meta_rasTop(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_rasTop),
    .io_q5IQEnq_0_bits_bpuInfo_meta_predTaken(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_predTaken),
    .io_q5IQEnq_0_bits_bpuInfo_meta_predTarget(ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_predTarget),
    .io_q5IQEnq_0_bits_ldst(ctrlBlock_io_q5IQEnq_0_bits_ldst),
    .io_q5IQEnq_0_bits_lrs1(ctrlBlock_io_q5IQEnq_0_bits_lrs1),
    .io_q5IQEnq_0_bits_lrs2(ctrlBlock_io_q5IQEnq_0_bits_lrs2),
    .io_q5IQEnq_0_bits_pdst(ctrlBlock_io_q5IQEnq_0_bits_pdst),
    .io_q5IQEnq_0_bits_prs1(ctrlBlock_io_q5IQEnq_0_bits_prs1),
    .io_q5IQEnq_0_bits_prs2(ctrlBlock_io_q5IQEnq_0_bits_prs2),
    .io_q5IQEnq_0_bits_oldPdst(ctrlBlock_io_q5IQEnq_0_bits_oldPdst),
    .io_q5IQEnq_0_bits_rs1Valid(ctrlBlock_io_q5IQEnq_0_bits_rs1Valid),
    .io_q5IQEnq_0_bits_rs2Valid(ctrlBlock_io_q5IQEnq_0_bits_rs2Valid),
    .io_q5IQEnq_0_bits_rdValid(ctrlBlock_io_q5IQEnq_0_bits_rdValid),
    .io_q5IQEnq_0_bits_snptId_valid(ctrlBlock_io_q5IQEnq_0_bits_snptId_valid),
    .io_q5IQEnq_0_bits_snptId_bits(ctrlBlock_io_q5IQEnq_0_bits_snptId_bits),
    .io_q5IQEnq_0_bits_robIdx_value(ctrlBlock_io_q5IQEnq_0_bits_robIdx_value),
    .io_q5IQEnq_0_bits_robIdx_flag(ctrlBlock_io_q5IQEnq_0_bits_robIdx_flag),
    .io_q5IQEnq_0_bits_robIdxFull_value(ctrlBlock_io_q5IQEnq_0_bits_robIdxFull_value),
    .io_q5IQEnq_0_bits_robIdxFull_flag(ctrlBlock_io_q5IQEnq_0_bits_robIdxFull_flag),
    .io_q5IQEnq_0_bits_lqIdx_value(ctrlBlock_io_q5IQEnq_0_bits_lqIdx_value),
    .io_q5IQEnq_0_bits_lqIdx_flag(ctrlBlock_io_q5IQEnq_0_bits_lqIdx_flag),
    .io_q5IQEnq_0_bits_sqIdx_value(ctrlBlock_io_q5IQEnq_0_bits_sqIdx_value),
    .io_q5IQEnq_0_bits_sqIdx_flag(ctrlBlock_io_q5IQEnq_0_bits_sqIdx_flag),
    .io_q5IQEnq_0_bits_issueQueue(ctrlBlock_io_q5IQEnq_0_bits_issueQueue),
    .io_q5IQEnq_0_bits_prs1Busy(ctrlBlock_io_q5IQEnq_0_bits_prs1Busy),
    .io_q5IQEnq_0_bits_prs2Busy(ctrlBlock_io_q5IQEnq_0_bits_prs2Busy),
    .io_q5IQEnq_0_bits_isSta(ctrlBlock_io_q5IQEnq_0_bits_isSta),
    .io_q5IQEnq_0_bits_isStd(ctrlBlock_io_q5IQEnq_0_bits_isStd),
    .io_iqFeedback_q1FreeEntries(ctrlBlock_io_iqFeedback_q1FreeEntries),
    .io_iqFeedback_q2FreeEntries(ctrlBlock_io_iqFeedback_q2FreeEntries),
    .io_iqFeedback_q3FreeEntries(ctrlBlock_io_iqFeedback_q3FreeEntries),
    .io_iqFeedback_q4FreeEntries(ctrlBlock_io_iqFeedback_q4FreeEntries),
    .io_iqFeedback_q5FreeEntries(ctrlBlock_io_iqFeedback_q5FreeEntries),
    .io_lsEnq_req_valid(ctrlBlock_io_lsEnq_req_valid),
    .io_lsEnq_req_bits_robIdx_value(ctrlBlock_io_lsEnq_req_bits_robIdx_value),
    .io_lsEnq_req_bits_robIdx_flag(ctrlBlock_io_lsEnq_req_bits_robIdx_flag),
    .io_lsEnq_req_bits_isLoad(ctrlBlock_io_lsEnq_req_bits_isLoad),
    .io_lsEnq_req_bits_isStore(ctrlBlock_io_lsEnq_req_bits_isStore),
    .io_lsEnq_req_bits_sqIdx_value(ctrlBlock_io_lsEnq_req_bits_sqIdx_value),
    .io_lsEnq_req_bits_sqIdx_flag(ctrlBlock_io_lsEnq_req_bits_sqIdx_flag),
    .io_lsEnq_req_bits_lqIdx_value(ctrlBlock_io_lsEnq_req_bits_lqIdx_value),
    .io_lsEnq_req_bits_lqIdx_flag(ctrlBlock_io_lsEnq_req_bits_lqIdx_flag),
    .io_lsEnq_toLsqData_pc(ctrlBlock_io_lsEnq_toLsqData_pc),
    .io_lsEnq_toLsqData_inst(ctrlBlock_io_lsEnq_toLsqData_inst),
    .io_lsEnq_toLsqData_ctrl_fuType(ctrlBlock_io_lsEnq_toLsqData_ctrl_fuType),
    .io_lsEnq_toLsqData_ctrl_aluOp(ctrlBlock_io_lsEnq_toLsqData_ctrl_aluOp),
    .io_lsEnq_toLsqData_ctrl_bruOp(ctrlBlock_io_lsEnq_toLsqData_ctrl_bruOp),
    .io_lsEnq_toLsqData_ctrl_lsuOp(ctrlBlock_io_lsEnq_toLsqData_ctrl_lsuOp),
    .io_lsEnq_toLsqData_ctrl_csrOp(ctrlBlock_io_lsEnq_toLsqData_ctrl_csrOp),
    .io_lsEnq_toLsqData_ctrl_mulOp(ctrlBlock_io_lsEnq_toLsqData_ctrl_mulOp),
    .io_lsEnq_toLsqData_ctrl_divOp(ctrlBlock_io_lsEnq_toLsqData_ctrl_divOp),
    .io_lsEnq_toLsqData_ctrl_src1Type(ctrlBlock_io_lsEnq_toLsqData_ctrl_src1Type),
    .io_lsEnq_toLsqData_ctrl_src2Type(ctrlBlock_io_lsEnq_toLsqData_ctrl_src2Type),
    .io_lsEnq_toLsqData_ctrl_immType(ctrlBlock_io_lsEnq_toLsqData_ctrl_immType),
    .io_lsEnq_toLsqData_ctrl_rfWen(ctrlBlock_io_lsEnq_toLsqData_ctrl_rfWen),
    .io_lsEnq_toLsqData_ctrl_memRead(ctrlBlock_io_lsEnq_toLsqData_ctrl_memRead),
    .io_lsEnq_toLsqData_ctrl_memWrite(ctrlBlock_io_lsEnq_toLsqData_ctrl_memWrite),
    .io_lsEnq_toLsqData_ctrl_csrWen(ctrlBlock_io_lsEnq_toLsqData_ctrl_csrWen),
    .io_lsEnq_toLsqData_ctrl_isBranch(ctrlBlock_io_lsEnq_toLsqData_ctrl_isBranch),
    .io_lsEnq_toLsqData_ctrl_isJump(ctrlBlock_io_lsEnq_toLsqData_ctrl_isJump),
    .io_lsEnq_toLsqData_ctrl_isPriv(ctrlBlock_io_lsEnq_toLsqData_ctrl_isPriv),
    .io_lsEnq_toLsqData_excp_excpVec(ctrlBlock_io_lsEnq_toLsqData_excp_excpVec),
    .io_lsEnq_toLsqData_imm(ctrlBlock_io_lsEnq_toLsqData_imm),
    .io_lsEnq_toLsqData_csrAddress(ctrlBlock_io_lsEnq_toLsqData_csrAddress),
    .io_lsEnq_toLsqData_pdInfo_valid(ctrlBlock_io_lsEnq_toLsqData_pdInfo_valid),
    .io_lsEnq_toLsqData_pdInfo_isBr(ctrlBlock_io_lsEnq_toLsqData_pdInfo_isBr),
    .io_lsEnq_toLsqData_pdInfo_isJal(ctrlBlock_io_lsEnq_toLsqData_pdInfo_isJal),
    .io_lsEnq_toLsqData_pdInfo_isJalr(ctrlBlock_io_lsEnq_toLsqData_pdInfo_isJalr),
    .io_lsEnq_toLsqData_pdInfo_isCall(ctrlBlock_io_lsEnq_toLsqData_pdInfo_isCall),
    .io_lsEnq_toLsqData_pdInfo_isRet(ctrlBlock_io_lsEnq_toLsqData_pdInfo_isRet),
    .io_lsEnq_toLsqData_pdInfo_jumpTarget(ctrlBlock_io_lsEnq_toLsqData_pdInfo_jumpTarget),
    .io_lsEnq_toLsqData_bpuInfo_pc(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_pc),
    .io_lsEnq_toLsqData_bpuInfo_fallThrough(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_fallThrough),
    .io_lsEnq_toLsqData_bpuInfo_taken(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_taken),
    .io_lsEnq_toLsqData_bpuInfo_target(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_target),
    .io_lsEnq_toLsqData_bpuInfo_takenOffset(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_takenOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_valid(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_valid),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbHit(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbHit),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbOffset(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_phtCounter(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter),
    .io_lsEnq_toLsqData_bpuInfo_meta_rasTop(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_rasTop),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTaken(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_predTaken),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTarget(ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_predTarget),
    .io_lsEnq_toLsqData_ldst(ctrlBlock_io_lsEnq_toLsqData_ldst),
    .io_lsEnq_toLsqData_lrs1(ctrlBlock_io_lsEnq_toLsqData_lrs1),
    .io_lsEnq_toLsqData_lrs2(ctrlBlock_io_lsEnq_toLsqData_lrs2),
    .io_lsEnq_toLsqData_pdst(ctrlBlock_io_lsEnq_toLsqData_pdst),
    .io_lsEnq_toLsqData_prs1(ctrlBlock_io_lsEnq_toLsqData_prs1),
    .io_lsEnq_toLsqData_prs2(ctrlBlock_io_lsEnq_toLsqData_prs2),
    .io_lsEnq_toLsqData_oldPdst(ctrlBlock_io_lsEnq_toLsqData_oldPdst),
    .io_lsEnq_toLsqData_snptId_valid(ctrlBlock_io_lsEnq_toLsqData_snptId_valid),
    .io_lsEnq_toLsqData_snptId_bits(ctrlBlock_io_lsEnq_toLsqData_snptId_bits),
    .io_lsEnq_toLsqData_rs1Valid(ctrlBlock_io_lsEnq_toLsqData_rs1Valid),
    .io_lsEnq_toLsqData_rs2Valid(ctrlBlock_io_lsEnq_toLsqData_rs2Valid),
    .io_lsEnq_toLsqData_rdValid(ctrlBlock_io_lsEnq_toLsqData_rdValid),
    .io_lsEnq_toLsqData_robIdx_value(ctrlBlock_io_lsEnq_toLsqData_robIdx_value),
    .io_lsEnq_toLsqData_robIdx_flag(ctrlBlock_io_lsEnq_toLsqData_robIdx_flag),
    .io_lsEnq_lqFull(ctrlBlock_io_lsEnq_lqFull),
    .io_lsEnq_sqFull(ctrlBlock_io_lsEnq_sqFull),
    .io_writeback_0_valid(ctrlBlock_io_writeback_0_valid),
    .io_writeback_0_bits_robIdx_value(ctrlBlock_io_writeback_0_bits_robIdx_value),
    .io_writeback_0_bits_sqIdx_value(ctrlBlock_io_writeback_0_bits_sqIdx_value),
    .io_writeback_0_bits_sqIdx_flag(ctrlBlock_io_writeback_0_bits_sqIdx_flag),
    .io_writeback_0_bits_isMemWrite(ctrlBlock_io_writeback_0_bits_isMemWrite),
    .io_writeback_0_bits_isMemRead(ctrlBlock_io_writeback_0_bits_isMemRead),
    .io_writeback_0_bits_memValid(ctrlBlock_io_writeback_0_bits_memValid),
    .io_writeback_0_bits_memVaddr(ctrlBlock_io_writeback_0_bits_memVaddr),
    .io_writeback_0_bits_memPaddr(ctrlBlock_io_writeback_0_bits_memPaddr),
    .io_writeback_0_bits_memStoreData(ctrlBlock_io_writeback_0_bits_memStoreData),
    .io_writeback_0_bits_rfdata(ctrlBlock_io_writeback_0_bits_rfdata),
    .io_writeback_0_bits_csrWdata(ctrlBlock_io_writeback_0_bits_csrWdata),
    .io_writeback_0_bits_csrTimer(ctrlBlock_io_writeback_0_bits_csrTimer),
    .io_writeback_0_bits_excp_excpVec(ctrlBlock_io_writeback_0_bits_excp_excpVec),
    .io_writeback_1_valid(ctrlBlock_io_writeback_1_valid),
    .io_writeback_1_bits_robIdx_value(ctrlBlock_io_writeback_1_bits_robIdx_value),
    .io_writeback_1_bits_sqIdx_value(ctrlBlock_io_writeback_1_bits_sqIdx_value),
    .io_writeback_1_bits_sqIdx_flag(ctrlBlock_io_writeback_1_bits_sqIdx_flag),
    .io_writeback_1_bits_isMemWrite(ctrlBlock_io_writeback_1_bits_isMemWrite),
    .io_writeback_1_bits_isMemRead(ctrlBlock_io_writeback_1_bits_isMemRead),
    .io_writeback_1_bits_memValid(ctrlBlock_io_writeback_1_bits_memValid),
    .io_writeback_1_bits_memVaddr(ctrlBlock_io_writeback_1_bits_memVaddr),
    .io_writeback_1_bits_memPaddr(ctrlBlock_io_writeback_1_bits_memPaddr),
    .io_writeback_1_bits_memStoreData(ctrlBlock_io_writeback_1_bits_memStoreData),
    .io_writeback_1_bits_rfdata(ctrlBlock_io_writeback_1_bits_rfdata),
    .io_writeback_1_bits_csrWdata(ctrlBlock_io_writeback_1_bits_csrWdata),
    .io_writeback_1_bits_csrTimer(ctrlBlock_io_writeback_1_bits_csrTimer),
    .io_writeback_1_bits_excp_excpVec(ctrlBlock_io_writeback_1_bits_excp_excpVec),
    .io_writeback_2_valid(ctrlBlock_io_writeback_2_valid),
    .io_writeback_2_bits_robIdx_value(ctrlBlock_io_writeback_2_bits_robIdx_value),
    .io_writeback_2_bits_sqIdx_value(ctrlBlock_io_writeback_2_bits_sqIdx_value),
    .io_writeback_2_bits_sqIdx_flag(ctrlBlock_io_writeback_2_bits_sqIdx_flag),
    .io_writeback_2_bits_isMemWrite(ctrlBlock_io_writeback_2_bits_isMemWrite),
    .io_writeback_2_bits_isMemRead(ctrlBlock_io_writeback_2_bits_isMemRead),
    .io_writeback_2_bits_memValid(ctrlBlock_io_writeback_2_bits_memValid),
    .io_writeback_2_bits_memVaddr(ctrlBlock_io_writeback_2_bits_memVaddr),
    .io_writeback_2_bits_memPaddr(ctrlBlock_io_writeback_2_bits_memPaddr),
    .io_writeback_2_bits_memStoreData(ctrlBlock_io_writeback_2_bits_memStoreData),
    .io_writeback_2_bits_rfdata(ctrlBlock_io_writeback_2_bits_rfdata),
    .io_writeback_2_bits_csrWdata(ctrlBlock_io_writeback_2_bits_csrWdata),
    .io_writeback_2_bits_csrTimer(ctrlBlock_io_writeback_2_bits_csrTimer),
    .io_writeback_2_bits_excp_excpVec(ctrlBlock_io_writeback_2_bits_excp_excpVec),
    .io_writeback_3_valid(ctrlBlock_io_writeback_3_valid),
    .io_writeback_3_bits_robIdx_value(ctrlBlock_io_writeback_3_bits_robIdx_value),
    .io_writeback_3_bits_sqIdx_value(ctrlBlock_io_writeback_3_bits_sqIdx_value),
    .io_writeback_3_bits_sqIdx_flag(ctrlBlock_io_writeback_3_bits_sqIdx_flag),
    .io_writeback_3_bits_isMemWrite(ctrlBlock_io_writeback_3_bits_isMemWrite),
    .io_writeback_3_bits_isMemRead(ctrlBlock_io_writeback_3_bits_isMemRead),
    .io_writeback_3_bits_memValid(ctrlBlock_io_writeback_3_bits_memValid),
    .io_writeback_3_bits_memVaddr(ctrlBlock_io_writeback_3_bits_memVaddr),
    .io_writeback_3_bits_memPaddr(ctrlBlock_io_writeback_3_bits_memPaddr),
    .io_writeback_3_bits_memStoreData(ctrlBlock_io_writeback_3_bits_memStoreData),
    .io_writeback_3_bits_rfdata(ctrlBlock_io_writeback_3_bits_rfdata),
    .io_writeback_3_bits_csrWdata(ctrlBlock_io_writeback_3_bits_csrWdata),
    .io_writeback_3_bits_csrTimer(ctrlBlock_io_writeback_3_bits_csrTimer),
    .io_writeback_3_bits_excp_excpVec(ctrlBlock_io_writeback_3_bits_excp_excpVec),
    .io_writeback_4_valid(ctrlBlock_io_writeback_4_valid),
    .io_writeback_4_bits_robIdx_value(ctrlBlock_io_writeback_4_bits_robIdx_value),
    .io_writeback_4_bits_sqIdx_value(ctrlBlock_io_writeback_4_bits_sqIdx_value),
    .io_writeback_4_bits_sqIdx_flag(ctrlBlock_io_writeback_4_bits_sqIdx_flag),
    .io_writeback_4_bits_isMemWrite(ctrlBlock_io_writeback_4_bits_isMemWrite),
    .io_writeback_4_bits_isMemRead(ctrlBlock_io_writeback_4_bits_isMemRead),
    .io_writeback_4_bits_memValid(ctrlBlock_io_writeback_4_bits_memValid),
    .io_writeback_4_bits_memVaddr(ctrlBlock_io_writeback_4_bits_memVaddr),
    .io_writeback_4_bits_memPaddr(ctrlBlock_io_writeback_4_bits_memPaddr),
    .io_writeback_4_bits_memStoreData(ctrlBlock_io_writeback_4_bits_memStoreData),
    .io_writeback_4_bits_rfdata(ctrlBlock_io_writeback_4_bits_rfdata),
    .io_writeback_4_bits_csrWdata(ctrlBlock_io_writeback_4_bits_csrWdata),
    .io_writeback_4_bits_csrTimer(ctrlBlock_io_writeback_4_bits_csrTimer),
    .io_writeback_4_bits_excp_excpVec(ctrlBlock_io_writeback_4_bits_excp_excpVec),
    .io_commitToSq_valid_0(ctrlBlock_io_commitToSq_valid_0),
    .io_commitToSq_valid_1(ctrlBlock_io_commitToSq_valid_1),
    .io_commitToSq_valid_2(ctrlBlock_io_commitToSq_valid_2),
    .io_commitToSq_bits_0_sqIdx_value(ctrlBlock_io_commitToSq_bits_0_sqIdx_value),
    .io_commitToSq_bits_1_sqIdx_value(ctrlBlock_io_commitToSq_bits_1_sqIdx_value),
    .io_commitToSq_bits_2_sqIdx_value(ctrlBlock_io_commitToSq_bits_2_sqIdx_value),
    .io_commitToCsr_csrWen(ctrlBlock_io_commitToCsr_csrWen),
    .io_commitToCsr_csrWaddr(ctrlBlock_io_commitToCsr_csrWaddr),
    .io_commitToCsr_csrWdata(ctrlBlock_io_commitToCsr_csrWdata),
    .io_bruInfo_valid(ctrlBlock_io_bruInfo_valid),
    .io_bruInfo_bits_doRedirect(ctrlBlock_io_bruInfo_bits_doRedirect),
    .io_bruInfo_bits_snptId(ctrlBlock_io_bruInfo_bits_snptId),
    .io_bruInfo_bits_robIdx_value(ctrlBlock_io_bruInfo_bits_robIdx_value),
    .io_bruInfo_bits_robIdx_flag(ctrlBlock_io_bruInfo_bits_robIdx_flag),
    .io_bruInfo_bits_target(ctrlBlock_io_bruInfo_bits_target),
    .io_redirectInfo_valid(ctrlBlock_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(ctrlBlock_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_flushSelf(ctrlBlock_io_redirectInfo_bits_flushSelf),
    .io_redirectInfo_bits_fromBru(ctrlBlock_io_redirectInfo_bits_fromBru),
    .io_redirectInfo_bits_snptId(ctrlBlock_io_redirectInfo_bits_snptId),
    .io_redirectInfo_bits_robIdx_value(ctrlBlock_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(ctrlBlock_io_redirectInfo_bits_robIdx_flag),
    .io_redirectInfo_bits_fromRob(ctrlBlock_io_redirectInfo_bits_fromRob),
    .io_redirectInfo_bits_target(ctrlBlock_io_redirectInfo_bits_target),
    .io_excpEvent_excp(ctrlBlock_io_excpEvent_excp),
    .io_excpEvent_ertn(ctrlBlock_io_excpEvent_ertn),
    .io_excpInfo_vaddrError(ctrlBlock_io_excpInfo_vaddrError),
    .io_excpInfo_era(ctrlBlock_io_excpInfo_era),
    .io_excpInfo_ecode(ctrlBlock_io_excpInfo_ecode),
    .io_excpInfo_badVaddr(ctrlBlock_io_excpInfo_badVaddr),
    .io_redirectAddrFromCsr_eentry(ctrlBlock_io_redirectAddrFromCsr_eentry),
    .io_redirectAddrFromCsr_era(ctrlBlock_io_redirectAddrFromCsr_era),
    .io_extInt(ctrlBlock_io_extInt),
    .io_wakeupPorts_0_valid(ctrlBlock_io_wakeupPorts_0_valid),
    .io_wakeupPorts_0_bits_pdst(ctrlBlock_io_wakeupPorts_0_bits_pdst),
    .io_wakeupPorts_1_valid(ctrlBlock_io_wakeupPorts_1_valid),
    .io_wakeupPorts_1_bits_pdst(ctrlBlock_io_wakeupPorts_1_bits_pdst),
    .io_wakeupPorts_2_valid(ctrlBlock_io_wakeupPorts_2_valid),
    .io_wakeupPorts_2_bits_pdst(ctrlBlock_io_wakeupPorts_2_bits_pdst),
    .io_wakeupPorts_3_valid(ctrlBlock_io_wakeupPorts_3_valid),
    .io_wakeupPorts_3_bits_pdst(ctrlBlock_io_wakeupPorts_3_bits_pdst),
    .io_wakeupPorts_4_valid(ctrlBlock_io_wakeupPorts_4_valid),
    .io_wakeupPorts_4_bits_pdst(ctrlBlock_io_wakeupPorts_4_bits_pdst)
  );
  Scheduler scheduler ( // @[src/main/scala/backend/Backend.scala 62:27]
    .clock(scheduler_clock),
    .reset(scheduler_reset),
    .io_q1IQEnq_valid(scheduler_io_q1IQEnq_valid),
    .io_q1IQEnq_bits_pc(scheduler_io_q1IQEnq_bits_pc),
    .io_q1IQEnq_bits_inst(scheduler_io_q1IQEnq_bits_inst),
    .io_q1IQEnq_bits_ctrl_fuType(scheduler_io_q1IQEnq_bits_ctrl_fuType),
    .io_q1IQEnq_bits_ctrl_aluOp(scheduler_io_q1IQEnq_bits_ctrl_aluOp),
    .io_q1IQEnq_bits_ctrl_bruOp(scheduler_io_q1IQEnq_bits_ctrl_bruOp),
    .io_q1IQEnq_bits_ctrl_lsuOp(scheduler_io_q1IQEnq_bits_ctrl_lsuOp),
    .io_q1IQEnq_bits_ctrl_csrOp(scheduler_io_q1IQEnq_bits_ctrl_csrOp),
    .io_q1IQEnq_bits_ctrl_mulOp(scheduler_io_q1IQEnq_bits_ctrl_mulOp),
    .io_q1IQEnq_bits_ctrl_divOp(scheduler_io_q1IQEnq_bits_ctrl_divOp),
    .io_q1IQEnq_bits_ctrl_src1Type(scheduler_io_q1IQEnq_bits_ctrl_src1Type),
    .io_q1IQEnq_bits_ctrl_src2Type(scheduler_io_q1IQEnq_bits_ctrl_src2Type),
    .io_q1IQEnq_bits_ctrl_immType(scheduler_io_q1IQEnq_bits_ctrl_immType),
    .io_q1IQEnq_bits_ctrl_rfWen(scheduler_io_q1IQEnq_bits_ctrl_rfWen),
    .io_q1IQEnq_bits_ctrl_memRead(scheduler_io_q1IQEnq_bits_ctrl_memRead),
    .io_q1IQEnq_bits_ctrl_memWrite(scheduler_io_q1IQEnq_bits_ctrl_memWrite),
    .io_q1IQEnq_bits_ctrl_csrWen(scheduler_io_q1IQEnq_bits_ctrl_csrWen),
    .io_q1IQEnq_bits_ctrl_isBranch(scheduler_io_q1IQEnq_bits_ctrl_isBranch),
    .io_q1IQEnq_bits_ctrl_isJump(scheduler_io_q1IQEnq_bits_ctrl_isJump),
    .io_q1IQEnq_bits_ctrl_isPriv(scheduler_io_q1IQEnq_bits_ctrl_isPriv),
    .io_q1IQEnq_bits_excp_excpVec(scheduler_io_q1IQEnq_bits_excp_excpVec),
    .io_q1IQEnq_bits_imm(scheduler_io_q1IQEnq_bits_imm),
    .io_q1IQEnq_bits_csrAddress(scheduler_io_q1IQEnq_bits_csrAddress),
    .io_q1IQEnq_bits_pdInfo_valid(scheduler_io_q1IQEnq_bits_pdInfo_valid),
    .io_q1IQEnq_bits_pdInfo_isBr(scheduler_io_q1IQEnq_bits_pdInfo_isBr),
    .io_q1IQEnq_bits_pdInfo_isJal(scheduler_io_q1IQEnq_bits_pdInfo_isJal),
    .io_q1IQEnq_bits_pdInfo_isJalr(scheduler_io_q1IQEnq_bits_pdInfo_isJalr),
    .io_q1IQEnq_bits_pdInfo_isCall(scheduler_io_q1IQEnq_bits_pdInfo_isCall),
    .io_q1IQEnq_bits_pdInfo_isRet(scheduler_io_q1IQEnq_bits_pdInfo_isRet),
    .io_q1IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget),
    .io_q1IQEnq_bits_bpuInfo_pc(scheduler_io_q1IQEnq_bits_bpuInfo_pc),
    .io_q1IQEnq_bits_bpuInfo_fallThrough(scheduler_io_q1IQEnq_bits_bpuInfo_fallThrough),
    .io_q1IQEnq_bits_bpuInfo_taken(scheduler_io_q1IQEnq_bits_bpuInfo_taken),
    .io_q1IQEnq_bits_bpuInfo_target(scheduler_io_q1IQEnq_bits_bpuInfo_target),
    .io_q1IQEnq_bits_bpuInfo_takenOffset(scheduler_io_q1IQEnq_bits_bpuInfo_takenOffset),
    .io_q1IQEnq_bits_bpuInfo_meta_valid(scheduler_io_q1IQEnq_bits_bpuInfo_meta_valid),
    .io_q1IQEnq_bits_bpuInfo_meta_btbHit(scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbHit),
    .io_q1IQEnq_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsJalr),
    .io_q1IQEnq_bits_bpuInfo_meta_btbIsJal(scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsJal),
    .io_q1IQEnq_bits_bpuInfo_meta_btbIsCall(scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsCall),
    .io_q1IQEnq_bits_bpuInfo_meta_btbIsRet(scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsRet),
    .io_q1IQEnq_bits_bpuInfo_meta_btbOffset(scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbOffset),
    .io_q1IQEnq_bits_bpuInfo_meta_phtCounter(scheduler_io_q1IQEnq_bits_bpuInfo_meta_phtCounter),
    .io_q1IQEnq_bits_bpuInfo_meta_rasTop(scheduler_io_q1IQEnq_bits_bpuInfo_meta_rasTop),
    .io_q1IQEnq_bits_bpuInfo_meta_predTaken(scheduler_io_q1IQEnq_bits_bpuInfo_meta_predTaken),
    .io_q1IQEnq_bits_bpuInfo_meta_predTarget(scheduler_io_q1IQEnq_bits_bpuInfo_meta_predTarget),
    .io_q1IQEnq_bits_ldst(scheduler_io_q1IQEnq_bits_ldst),
    .io_q1IQEnq_bits_lrs1(scheduler_io_q1IQEnq_bits_lrs1),
    .io_q1IQEnq_bits_lrs2(scheduler_io_q1IQEnq_bits_lrs2),
    .io_q1IQEnq_bits_pdst(scheduler_io_q1IQEnq_bits_pdst),
    .io_q1IQEnq_bits_prs1(scheduler_io_q1IQEnq_bits_prs1),
    .io_q1IQEnq_bits_prs2(scheduler_io_q1IQEnq_bits_prs2),
    .io_q1IQEnq_bits_oldPdst(scheduler_io_q1IQEnq_bits_oldPdst),
    .io_q1IQEnq_bits_rs1Valid(scheduler_io_q1IQEnq_bits_rs1Valid),
    .io_q1IQEnq_bits_rs2Valid(scheduler_io_q1IQEnq_bits_rs2Valid),
    .io_q1IQEnq_bits_rdValid(scheduler_io_q1IQEnq_bits_rdValid),
    .io_q1IQEnq_bits_snptId_valid(scheduler_io_q1IQEnq_bits_snptId_valid),
    .io_q1IQEnq_bits_snptId_bits(scheduler_io_q1IQEnq_bits_snptId_bits),
    .io_q1IQEnq_bits_robIdx_value(scheduler_io_q1IQEnq_bits_robIdx_value),
    .io_q1IQEnq_bits_robIdx_flag(scheduler_io_q1IQEnq_bits_robIdx_flag),
    .io_q1IQEnq_bits_robIdxFull_value(scheduler_io_q1IQEnq_bits_robIdxFull_value),
    .io_q1IQEnq_bits_robIdxFull_flag(scheduler_io_q1IQEnq_bits_robIdxFull_flag),
    .io_q1IQEnq_bits_prs1Busy(scheduler_io_q1IQEnq_bits_prs1Busy),
    .io_q1IQEnq_bits_prs2Busy(scheduler_io_q1IQEnq_bits_prs2Busy),
    .io_q2IQEnq_valid(scheduler_io_q2IQEnq_valid),
    .io_q2IQEnq_bits_pc(scheduler_io_q2IQEnq_bits_pc),
    .io_q2IQEnq_bits_inst(scheduler_io_q2IQEnq_bits_inst),
    .io_q2IQEnq_bits_ctrl_fuType(scheduler_io_q2IQEnq_bits_ctrl_fuType),
    .io_q2IQEnq_bits_ctrl_aluOp(scheduler_io_q2IQEnq_bits_ctrl_aluOp),
    .io_q2IQEnq_bits_ctrl_bruOp(scheduler_io_q2IQEnq_bits_ctrl_bruOp),
    .io_q2IQEnq_bits_ctrl_lsuOp(scheduler_io_q2IQEnq_bits_ctrl_lsuOp),
    .io_q2IQEnq_bits_ctrl_csrOp(scheduler_io_q2IQEnq_bits_ctrl_csrOp),
    .io_q2IQEnq_bits_ctrl_mulOp(scheduler_io_q2IQEnq_bits_ctrl_mulOp),
    .io_q2IQEnq_bits_ctrl_divOp(scheduler_io_q2IQEnq_bits_ctrl_divOp),
    .io_q2IQEnq_bits_ctrl_src1Type(scheduler_io_q2IQEnq_bits_ctrl_src1Type),
    .io_q2IQEnq_bits_ctrl_src2Type(scheduler_io_q2IQEnq_bits_ctrl_src2Type),
    .io_q2IQEnq_bits_ctrl_immType(scheduler_io_q2IQEnq_bits_ctrl_immType),
    .io_q2IQEnq_bits_ctrl_rfWen(scheduler_io_q2IQEnq_bits_ctrl_rfWen),
    .io_q2IQEnq_bits_ctrl_memRead(scheduler_io_q2IQEnq_bits_ctrl_memRead),
    .io_q2IQEnq_bits_ctrl_memWrite(scheduler_io_q2IQEnq_bits_ctrl_memWrite),
    .io_q2IQEnq_bits_ctrl_csrWen(scheduler_io_q2IQEnq_bits_ctrl_csrWen),
    .io_q2IQEnq_bits_ctrl_isBranch(scheduler_io_q2IQEnq_bits_ctrl_isBranch),
    .io_q2IQEnq_bits_ctrl_isJump(scheduler_io_q2IQEnq_bits_ctrl_isJump),
    .io_q2IQEnq_bits_ctrl_isPriv(scheduler_io_q2IQEnq_bits_ctrl_isPriv),
    .io_q2IQEnq_bits_excp_excpVec(scheduler_io_q2IQEnq_bits_excp_excpVec),
    .io_q2IQEnq_bits_imm(scheduler_io_q2IQEnq_bits_imm),
    .io_q2IQEnq_bits_csrAddress(scheduler_io_q2IQEnq_bits_csrAddress),
    .io_q2IQEnq_bits_pdInfo_valid(scheduler_io_q2IQEnq_bits_pdInfo_valid),
    .io_q2IQEnq_bits_pdInfo_isBr(scheduler_io_q2IQEnq_bits_pdInfo_isBr),
    .io_q2IQEnq_bits_pdInfo_isJal(scheduler_io_q2IQEnq_bits_pdInfo_isJal),
    .io_q2IQEnq_bits_pdInfo_isJalr(scheduler_io_q2IQEnq_bits_pdInfo_isJalr),
    .io_q2IQEnq_bits_pdInfo_isCall(scheduler_io_q2IQEnq_bits_pdInfo_isCall),
    .io_q2IQEnq_bits_pdInfo_isRet(scheduler_io_q2IQEnq_bits_pdInfo_isRet),
    .io_q2IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget),
    .io_q2IQEnq_bits_bpuInfo_pc(scheduler_io_q2IQEnq_bits_bpuInfo_pc),
    .io_q2IQEnq_bits_bpuInfo_fallThrough(scheduler_io_q2IQEnq_bits_bpuInfo_fallThrough),
    .io_q2IQEnq_bits_bpuInfo_taken(scheduler_io_q2IQEnq_bits_bpuInfo_taken),
    .io_q2IQEnq_bits_bpuInfo_target(scheduler_io_q2IQEnq_bits_bpuInfo_target),
    .io_q2IQEnq_bits_bpuInfo_takenOffset(scheduler_io_q2IQEnq_bits_bpuInfo_takenOffset),
    .io_q2IQEnq_bits_bpuInfo_meta_valid(scheduler_io_q2IQEnq_bits_bpuInfo_meta_valid),
    .io_q2IQEnq_bits_bpuInfo_meta_btbHit(scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbHit),
    .io_q2IQEnq_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsJalr),
    .io_q2IQEnq_bits_bpuInfo_meta_btbIsJal(scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsJal),
    .io_q2IQEnq_bits_bpuInfo_meta_btbIsCall(scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsCall),
    .io_q2IQEnq_bits_bpuInfo_meta_btbIsRet(scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsRet),
    .io_q2IQEnq_bits_bpuInfo_meta_btbOffset(scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbOffset),
    .io_q2IQEnq_bits_bpuInfo_meta_phtCounter(scheduler_io_q2IQEnq_bits_bpuInfo_meta_phtCounter),
    .io_q2IQEnq_bits_bpuInfo_meta_rasTop(scheduler_io_q2IQEnq_bits_bpuInfo_meta_rasTop),
    .io_q2IQEnq_bits_bpuInfo_meta_predTaken(scheduler_io_q2IQEnq_bits_bpuInfo_meta_predTaken),
    .io_q2IQEnq_bits_bpuInfo_meta_predTarget(scheduler_io_q2IQEnq_bits_bpuInfo_meta_predTarget),
    .io_q2IQEnq_bits_ldst(scheduler_io_q2IQEnq_bits_ldst),
    .io_q2IQEnq_bits_lrs1(scheduler_io_q2IQEnq_bits_lrs1),
    .io_q2IQEnq_bits_lrs2(scheduler_io_q2IQEnq_bits_lrs2),
    .io_q2IQEnq_bits_pdst(scheduler_io_q2IQEnq_bits_pdst),
    .io_q2IQEnq_bits_prs1(scheduler_io_q2IQEnq_bits_prs1),
    .io_q2IQEnq_bits_prs2(scheduler_io_q2IQEnq_bits_prs2),
    .io_q2IQEnq_bits_oldPdst(scheduler_io_q2IQEnq_bits_oldPdst),
    .io_q2IQEnq_bits_rs1Valid(scheduler_io_q2IQEnq_bits_rs1Valid),
    .io_q2IQEnq_bits_rs2Valid(scheduler_io_q2IQEnq_bits_rs2Valid),
    .io_q2IQEnq_bits_rdValid(scheduler_io_q2IQEnq_bits_rdValid),
    .io_q2IQEnq_bits_snptId_valid(scheduler_io_q2IQEnq_bits_snptId_valid),
    .io_q2IQEnq_bits_snptId_bits(scheduler_io_q2IQEnq_bits_snptId_bits),
    .io_q2IQEnq_bits_robIdx_value(scheduler_io_q2IQEnq_bits_robIdx_value),
    .io_q2IQEnq_bits_robIdx_flag(scheduler_io_q2IQEnq_bits_robIdx_flag),
    .io_q2IQEnq_bits_robIdxFull_value(scheduler_io_q2IQEnq_bits_robIdxFull_value),
    .io_q2IQEnq_bits_robIdxFull_flag(scheduler_io_q2IQEnq_bits_robIdxFull_flag),
    .io_q2IQEnq_bits_issueQueue(scheduler_io_q2IQEnq_bits_issueQueue),
    .io_q2IQEnq_bits_prs1Busy(scheduler_io_q2IQEnq_bits_prs1Busy),
    .io_q2IQEnq_bits_prs2Busy(scheduler_io_q2IQEnq_bits_prs2Busy),
    .io_q3IQEnq_valid(scheduler_io_q3IQEnq_valid),
    .io_q3IQEnq_bits_pc(scheduler_io_q3IQEnq_bits_pc),
    .io_q3IQEnq_bits_inst(scheduler_io_q3IQEnq_bits_inst),
    .io_q3IQEnq_bits_ctrl_fuType(scheduler_io_q3IQEnq_bits_ctrl_fuType),
    .io_q3IQEnq_bits_ctrl_aluOp(scheduler_io_q3IQEnq_bits_ctrl_aluOp),
    .io_q3IQEnq_bits_ctrl_bruOp(scheduler_io_q3IQEnq_bits_ctrl_bruOp),
    .io_q3IQEnq_bits_ctrl_lsuOp(scheduler_io_q3IQEnq_bits_ctrl_lsuOp),
    .io_q3IQEnq_bits_ctrl_csrOp(scheduler_io_q3IQEnq_bits_ctrl_csrOp),
    .io_q3IQEnq_bits_ctrl_mulOp(scheduler_io_q3IQEnq_bits_ctrl_mulOp),
    .io_q3IQEnq_bits_ctrl_divOp(scheduler_io_q3IQEnq_bits_ctrl_divOp),
    .io_q3IQEnq_bits_ctrl_src1Type(scheduler_io_q3IQEnq_bits_ctrl_src1Type),
    .io_q3IQEnq_bits_ctrl_src2Type(scheduler_io_q3IQEnq_bits_ctrl_src2Type),
    .io_q3IQEnq_bits_ctrl_immType(scheduler_io_q3IQEnq_bits_ctrl_immType),
    .io_q3IQEnq_bits_ctrl_rfWen(scheduler_io_q3IQEnq_bits_ctrl_rfWen),
    .io_q3IQEnq_bits_ctrl_memRead(scheduler_io_q3IQEnq_bits_ctrl_memRead),
    .io_q3IQEnq_bits_ctrl_memWrite(scheduler_io_q3IQEnq_bits_ctrl_memWrite),
    .io_q3IQEnq_bits_ctrl_csrWen(scheduler_io_q3IQEnq_bits_ctrl_csrWen),
    .io_q3IQEnq_bits_ctrl_isBranch(scheduler_io_q3IQEnq_bits_ctrl_isBranch),
    .io_q3IQEnq_bits_ctrl_isJump(scheduler_io_q3IQEnq_bits_ctrl_isJump),
    .io_q3IQEnq_bits_ctrl_isPriv(scheduler_io_q3IQEnq_bits_ctrl_isPriv),
    .io_q3IQEnq_bits_excp_excpVec(scheduler_io_q3IQEnq_bits_excp_excpVec),
    .io_q3IQEnq_bits_imm(scheduler_io_q3IQEnq_bits_imm),
    .io_q3IQEnq_bits_csrAddress(scheduler_io_q3IQEnq_bits_csrAddress),
    .io_q3IQEnq_bits_pdInfo_valid(scheduler_io_q3IQEnq_bits_pdInfo_valid),
    .io_q3IQEnq_bits_pdInfo_isBr(scheduler_io_q3IQEnq_bits_pdInfo_isBr),
    .io_q3IQEnq_bits_pdInfo_isJal(scheduler_io_q3IQEnq_bits_pdInfo_isJal),
    .io_q3IQEnq_bits_pdInfo_isJalr(scheduler_io_q3IQEnq_bits_pdInfo_isJalr),
    .io_q3IQEnq_bits_pdInfo_isCall(scheduler_io_q3IQEnq_bits_pdInfo_isCall),
    .io_q3IQEnq_bits_pdInfo_isRet(scheduler_io_q3IQEnq_bits_pdInfo_isRet),
    .io_q3IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget),
    .io_q3IQEnq_bits_bpuInfo_pc(scheduler_io_q3IQEnq_bits_bpuInfo_pc),
    .io_q3IQEnq_bits_bpuInfo_fallThrough(scheduler_io_q3IQEnq_bits_bpuInfo_fallThrough),
    .io_q3IQEnq_bits_bpuInfo_taken(scheduler_io_q3IQEnq_bits_bpuInfo_taken),
    .io_q3IQEnq_bits_bpuInfo_target(scheduler_io_q3IQEnq_bits_bpuInfo_target),
    .io_q3IQEnq_bits_bpuInfo_takenOffset(scheduler_io_q3IQEnq_bits_bpuInfo_takenOffset),
    .io_q3IQEnq_bits_bpuInfo_meta_valid(scheduler_io_q3IQEnq_bits_bpuInfo_meta_valid),
    .io_q3IQEnq_bits_bpuInfo_meta_btbHit(scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbHit),
    .io_q3IQEnq_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsJalr),
    .io_q3IQEnq_bits_bpuInfo_meta_btbIsJal(scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsJal),
    .io_q3IQEnq_bits_bpuInfo_meta_btbIsCall(scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsCall),
    .io_q3IQEnq_bits_bpuInfo_meta_btbIsRet(scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsRet),
    .io_q3IQEnq_bits_bpuInfo_meta_btbOffset(scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbOffset),
    .io_q3IQEnq_bits_bpuInfo_meta_phtCounter(scheduler_io_q3IQEnq_bits_bpuInfo_meta_phtCounter),
    .io_q3IQEnq_bits_bpuInfo_meta_rasTop(scheduler_io_q3IQEnq_bits_bpuInfo_meta_rasTop),
    .io_q3IQEnq_bits_bpuInfo_meta_predTaken(scheduler_io_q3IQEnq_bits_bpuInfo_meta_predTaken),
    .io_q3IQEnq_bits_bpuInfo_meta_predTarget(scheduler_io_q3IQEnq_bits_bpuInfo_meta_predTarget),
    .io_q3IQEnq_bits_ldst(scheduler_io_q3IQEnq_bits_ldst),
    .io_q3IQEnq_bits_lrs1(scheduler_io_q3IQEnq_bits_lrs1),
    .io_q3IQEnq_bits_lrs2(scheduler_io_q3IQEnq_bits_lrs2),
    .io_q3IQEnq_bits_pdst(scheduler_io_q3IQEnq_bits_pdst),
    .io_q3IQEnq_bits_prs1(scheduler_io_q3IQEnq_bits_prs1),
    .io_q3IQEnq_bits_prs2(scheduler_io_q3IQEnq_bits_prs2),
    .io_q3IQEnq_bits_oldPdst(scheduler_io_q3IQEnq_bits_oldPdst),
    .io_q3IQEnq_bits_rs1Valid(scheduler_io_q3IQEnq_bits_rs1Valid),
    .io_q3IQEnq_bits_rs2Valid(scheduler_io_q3IQEnq_bits_rs2Valid),
    .io_q3IQEnq_bits_rdValid(scheduler_io_q3IQEnq_bits_rdValid),
    .io_q3IQEnq_bits_snptId_valid(scheduler_io_q3IQEnq_bits_snptId_valid),
    .io_q3IQEnq_bits_snptId_bits(scheduler_io_q3IQEnq_bits_snptId_bits),
    .io_q3IQEnq_bits_robIdx_value(scheduler_io_q3IQEnq_bits_robIdx_value),
    .io_q3IQEnq_bits_robIdx_flag(scheduler_io_q3IQEnq_bits_robIdx_flag),
    .io_q3IQEnq_bits_robIdxFull_value(scheduler_io_q3IQEnq_bits_robIdxFull_value),
    .io_q3IQEnq_bits_robIdxFull_flag(scheduler_io_q3IQEnq_bits_robIdxFull_flag),
    .io_q3IQEnq_bits_issueQueue(scheduler_io_q3IQEnq_bits_issueQueue),
    .io_q3IQEnq_bits_prs1Busy(scheduler_io_q3IQEnq_bits_prs1Busy),
    .io_q3IQEnq_bits_prs2Busy(scheduler_io_q3IQEnq_bits_prs2Busy),
    .io_q4IQEnq_valid(scheduler_io_q4IQEnq_valid),
    .io_q4IQEnq_bits_pc(scheduler_io_q4IQEnq_bits_pc),
    .io_q4IQEnq_bits_inst(scheduler_io_q4IQEnq_bits_inst),
    .io_q4IQEnq_bits_ctrl_fuType(scheduler_io_q4IQEnq_bits_ctrl_fuType),
    .io_q4IQEnq_bits_ctrl_aluOp(scheduler_io_q4IQEnq_bits_ctrl_aluOp),
    .io_q4IQEnq_bits_ctrl_bruOp(scheduler_io_q4IQEnq_bits_ctrl_bruOp),
    .io_q4IQEnq_bits_ctrl_lsuOp(scheduler_io_q4IQEnq_bits_ctrl_lsuOp),
    .io_q4IQEnq_bits_ctrl_csrOp(scheduler_io_q4IQEnq_bits_ctrl_csrOp),
    .io_q4IQEnq_bits_ctrl_mulOp(scheduler_io_q4IQEnq_bits_ctrl_mulOp),
    .io_q4IQEnq_bits_ctrl_divOp(scheduler_io_q4IQEnq_bits_ctrl_divOp),
    .io_q4IQEnq_bits_ctrl_src1Type(scheduler_io_q4IQEnq_bits_ctrl_src1Type),
    .io_q4IQEnq_bits_ctrl_src2Type(scheduler_io_q4IQEnq_bits_ctrl_src2Type),
    .io_q4IQEnq_bits_ctrl_immType(scheduler_io_q4IQEnq_bits_ctrl_immType),
    .io_q4IQEnq_bits_ctrl_rfWen(scheduler_io_q4IQEnq_bits_ctrl_rfWen),
    .io_q4IQEnq_bits_ctrl_memRead(scheduler_io_q4IQEnq_bits_ctrl_memRead),
    .io_q4IQEnq_bits_ctrl_memWrite(scheduler_io_q4IQEnq_bits_ctrl_memWrite),
    .io_q4IQEnq_bits_ctrl_csrWen(scheduler_io_q4IQEnq_bits_ctrl_csrWen),
    .io_q4IQEnq_bits_ctrl_isBranch(scheduler_io_q4IQEnq_bits_ctrl_isBranch),
    .io_q4IQEnq_bits_ctrl_isJump(scheduler_io_q4IQEnq_bits_ctrl_isJump),
    .io_q4IQEnq_bits_ctrl_isPriv(scheduler_io_q4IQEnq_bits_ctrl_isPriv),
    .io_q4IQEnq_bits_excp_excpVec(scheduler_io_q4IQEnq_bits_excp_excpVec),
    .io_q4IQEnq_bits_imm(scheduler_io_q4IQEnq_bits_imm),
    .io_q4IQEnq_bits_csrAddress(scheduler_io_q4IQEnq_bits_csrAddress),
    .io_q4IQEnq_bits_pdInfo_valid(scheduler_io_q4IQEnq_bits_pdInfo_valid),
    .io_q4IQEnq_bits_pdInfo_isBr(scheduler_io_q4IQEnq_bits_pdInfo_isBr),
    .io_q4IQEnq_bits_pdInfo_isJal(scheduler_io_q4IQEnq_bits_pdInfo_isJal),
    .io_q4IQEnq_bits_pdInfo_isJalr(scheduler_io_q4IQEnq_bits_pdInfo_isJalr),
    .io_q4IQEnq_bits_pdInfo_isCall(scheduler_io_q4IQEnq_bits_pdInfo_isCall),
    .io_q4IQEnq_bits_pdInfo_isRet(scheduler_io_q4IQEnq_bits_pdInfo_isRet),
    .io_q4IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget),
    .io_q4IQEnq_bits_bpuInfo_pc(scheduler_io_q4IQEnq_bits_bpuInfo_pc),
    .io_q4IQEnq_bits_bpuInfo_fallThrough(scheduler_io_q4IQEnq_bits_bpuInfo_fallThrough),
    .io_q4IQEnq_bits_bpuInfo_taken(scheduler_io_q4IQEnq_bits_bpuInfo_taken),
    .io_q4IQEnq_bits_bpuInfo_target(scheduler_io_q4IQEnq_bits_bpuInfo_target),
    .io_q4IQEnq_bits_bpuInfo_takenOffset(scheduler_io_q4IQEnq_bits_bpuInfo_takenOffset),
    .io_q4IQEnq_bits_bpuInfo_meta_valid(scheduler_io_q4IQEnq_bits_bpuInfo_meta_valid),
    .io_q4IQEnq_bits_bpuInfo_meta_btbHit(scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbHit),
    .io_q4IQEnq_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsJalr),
    .io_q4IQEnq_bits_bpuInfo_meta_btbIsJal(scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsJal),
    .io_q4IQEnq_bits_bpuInfo_meta_btbIsCall(scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsCall),
    .io_q4IQEnq_bits_bpuInfo_meta_btbIsRet(scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsRet),
    .io_q4IQEnq_bits_bpuInfo_meta_btbOffset(scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbOffset),
    .io_q4IQEnq_bits_bpuInfo_meta_phtCounter(scheduler_io_q4IQEnq_bits_bpuInfo_meta_phtCounter),
    .io_q4IQEnq_bits_bpuInfo_meta_rasTop(scheduler_io_q4IQEnq_bits_bpuInfo_meta_rasTop),
    .io_q4IQEnq_bits_bpuInfo_meta_predTaken(scheduler_io_q4IQEnq_bits_bpuInfo_meta_predTaken),
    .io_q4IQEnq_bits_bpuInfo_meta_predTarget(scheduler_io_q4IQEnq_bits_bpuInfo_meta_predTarget),
    .io_q4IQEnq_bits_ldst(scheduler_io_q4IQEnq_bits_ldst),
    .io_q4IQEnq_bits_lrs1(scheduler_io_q4IQEnq_bits_lrs1),
    .io_q4IQEnq_bits_lrs2(scheduler_io_q4IQEnq_bits_lrs2),
    .io_q4IQEnq_bits_pdst(scheduler_io_q4IQEnq_bits_pdst),
    .io_q4IQEnq_bits_prs1(scheduler_io_q4IQEnq_bits_prs1),
    .io_q4IQEnq_bits_prs2(scheduler_io_q4IQEnq_bits_prs2),
    .io_q4IQEnq_bits_oldPdst(scheduler_io_q4IQEnq_bits_oldPdst),
    .io_q4IQEnq_bits_rs1Valid(scheduler_io_q4IQEnq_bits_rs1Valid),
    .io_q4IQEnq_bits_rs2Valid(scheduler_io_q4IQEnq_bits_rs2Valid),
    .io_q4IQEnq_bits_rdValid(scheduler_io_q4IQEnq_bits_rdValid),
    .io_q4IQEnq_bits_snptId_valid(scheduler_io_q4IQEnq_bits_snptId_valid),
    .io_q4IQEnq_bits_snptId_bits(scheduler_io_q4IQEnq_bits_snptId_bits),
    .io_q4IQEnq_bits_robIdx_value(scheduler_io_q4IQEnq_bits_robIdx_value),
    .io_q4IQEnq_bits_robIdx_flag(scheduler_io_q4IQEnq_bits_robIdx_flag),
    .io_q4IQEnq_bits_robIdxFull_value(scheduler_io_q4IQEnq_bits_robIdxFull_value),
    .io_q4IQEnq_bits_robIdxFull_flag(scheduler_io_q4IQEnq_bits_robIdxFull_flag),
    .io_q4IQEnq_bits_lqIdx_value(scheduler_io_q4IQEnq_bits_lqIdx_value),
    .io_q4IQEnq_bits_lqIdx_flag(scheduler_io_q4IQEnq_bits_lqIdx_flag),
    .io_q4IQEnq_bits_sqIdx_value(scheduler_io_q4IQEnq_bits_sqIdx_value),
    .io_q4IQEnq_bits_sqIdx_flag(scheduler_io_q4IQEnq_bits_sqIdx_flag),
    .io_q4IQEnq_bits_issueQueue(scheduler_io_q4IQEnq_bits_issueQueue),
    .io_q4IQEnq_bits_prs1Busy(scheduler_io_q4IQEnq_bits_prs1Busy),
    .io_q4IQEnq_bits_prs2Busy(scheduler_io_q4IQEnq_bits_prs2Busy),
    .io_q4IQEnq_bits_isSta(scheduler_io_q4IQEnq_bits_isSta),
    .io_q4IQEnq_bits_isStd(scheduler_io_q4IQEnq_bits_isStd),
    .io_q5IQEnq_valid(scheduler_io_q5IQEnq_valid),
    .io_q5IQEnq_bits_pc(scheduler_io_q5IQEnq_bits_pc),
    .io_q5IQEnq_bits_inst(scheduler_io_q5IQEnq_bits_inst),
    .io_q5IQEnq_bits_ctrl_fuType(scheduler_io_q5IQEnq_bits_ctrl_fuType),
    .io_q5IQEnq_bits_ctrl_aluOp(scheduler_io_q5IQEnq_bits_ctrl_aluOp),
    .io_q5IQEnq_bits_ctrl_bruOp(scheduler_io_q5IQEnq_bits_ctrl_bruOp),
    .io_q5IQEnq_bits_ctrl_lsuOp(scheduler_io_q5IQEnq_bits_ctrl_lsuOp),
    .io_q5IQEnq_bits_ctrl_csrOp(scheduler_io_q5IQEnq_bits_ctrl_csrOp),
    .io_q5IQEnq_bits_ctrl_mulOp(scheduler_io_q5IQEnq_bits_ctrl_mulOp),
    .io_q5IQEnq_bits_ctrl_divOp(scheduler_io_q5IQEnq_bits_ctrl_divOp),
    .io_q5IQEnq_bits_ctrl_src1Type(scheduler_io_q5IQEnq_bits_ctrl_src1Type),
    .io_q5IQEnq_bits_ctrl_src2Type(scheduler_io_q5IQEnq_bits_ctrl_src2Type),
    .io_q5IQEnq_bits_ctrl_immType(scheduler_io_q5IQEnq_bits_ctrl_immType),
    .io_q5IQEnq_bits_ctrl_rfWen(scheduler_io_q5IQEnq_bits_ctrl_rfWen),
    .io_q5IQEnq_bits_ctrl_memRead(scheduler_io_q5IQEnq_bits_ctrl_memRead),
    .io_q5IQEnq_bits_ctrl_memWrite(scheduler_io_q5IQEnq_bits_ctrl_memWrite),
    .io_q5IQEnq_bits_ctrl_csrWen(scheduler_io_q5IQEnq_bits_ctrl_csrWen),
    .io_q5IQEnq_bits_ctrl_isBranch(scheduler_io_q5IQEnq_bits_ctrl_isBranch),
    .io_q5IQEnq_bits_ctrl_isJump(scheduler_io_q5IQEnq_bits_ctrl_isJump),
    .io_q5IQEnq_bits_ctrl_isPriv(scheduler_io_q5IQEnq_bits_ctrl_isPriv),
    .io_q5IQEnq_bits_excp_excpVec(scheduler_io_q5IQEnq_bits_excp_excpVec),
    .io_q5IQEnq_bits_imm(scheduler_io_q5IQEnq_bits_imm),
    .io_q5IQEnq_bits_csrAddress(scheduler_io_q5IQEnq_bits_csrAddress),
    .io_q5IQEnq_bits_pdInfo_valid(scheduler_io_q5IQEnq_bits_pdInfo_valid),
    .io_q5IQEnq_bits_pdInfo_isBr(scheduler_io_q5IQEnq_bits_pdInfo_isBr),
    .io_q5IQEnq_bits_pdInfo_isJal(scheduler_io_q5IQEnq_bits_pdInfo_isJal),
    .io_q5IQEnq_bits_pdInfo_isJalr(scheduler_io_q5IQEnq_bits_pdInfo_isJalr),
    .io_q5IQEnq_bits_pdInfo_isCall(scheduler_io_q5IQEnq_bits_pdInfo_isCall),
    .io_q5IQEnq_bits_pdInfo_isRet(scheduler_io_q5IQEnq_bits_pdInfo_isRet),
    .io_q5IQEnq_bits_pdInfo_jumpTarget(scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget),
    .io_q5IQEnq_bits_bpuInfo_pc(scheduler_io_q5IQEnq_bits_bpuInfo_pc),
    .io_q5IQEnq_bits_bpuInfo_fallThrough(scheduler_io_q5IQEnq_bits_bpuInfo_fallThrough),
    .io_q5IQEnq_bits_bpuInfo_taken(scheduler_io_q5IQEnq_bits_bpuInfo_taken),
    .io_q5IQEnq_bits_bpuInfo_target(scheduler_io_q5IQEnq_bits_bpuInfo_target),
    .io_q5IQEnq_bits_bpuInfo_takenOffset(scheduler_io_q5IQEnq_bits_bpuInfo_takenOffset),
    .io_q5IQEnq_bits_bpuInfo_meta_valid(scheduler_io_q5IQEnq_bits_bpuInfo_meta_valid),
    .io_q5IQEnq_bits_bpuInfo_meta_btbHit(scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbHit),
    .io_q5IQEnq_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsJalr),
    .io_q5IQEnq_bits_bpuInfo_meta_btbIsJal(scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsJal),
    .io_q5IQEnq_bits_bpuInfo_meta_btbIsCall(scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsCall),
    .io_q5IQEnq_bits_bpuInfo_meta_btbIsRet(scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsRet),
    .io_q5IQEnq_bits_bpuInfo_meta_btbOffset(scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbOffset),
    .io_q5IQEnq_bits_bpuInfo_meta_phtCounter(scheduler_io_q5IQEnq_bits_bpuInfo_meta_phtCounter),
    .io_q5IQEnq_bits_bpuInfo_meta_rasTop(scheduler_io_q5IQEnq_bits_bpuInfo_meta_rasTop),
    .io_q5IQEnq_bits_bpuInfo_meta_predTaken(scheduler_io_q5IQEnq_bits_bpuInfo_meta_predTaken),
    .io_q5IQEnq_bits_bpuInfo_meta_predTarget(scheduler_io_q5IQEnq_bits_bpuInfo_meta_predTarget),
    .io_q5IQEnq_bits_ldst(scheduler_io_q5IQEnq_bits_ldst),
    .io_q5IQEnq_bits_lrs1(scheduler_io_q5IQEnq_bits_lrs1),
    .io_q5IQEnq_bits_lrs2(scheduler_io_q5IQEnq_bits_lrs2),
    .io_q5IQEnq_bits_pdst(scheduler_io_q5IQEnq_bits_pdst),
    .io_q5IQEnq_bits_prs1(scheduler_io_q5IQEnq_bits_prs1),
    .io_q5IQEnq_bits_prs2(scheduler_io_q5IQEnq_bits_prs2),
    .io_q5IQEnq_bits_oldPdst(scheduler_io_q5IQEnq_bits_oldPdst),
    .io_q5IQEnq_bits_rs1Valid(scheduler_io_q5IQEnq_bits_rs1Valid),
    .io_q5IQEnq_bits_rs2Valid(scheduler_io_q5IQEnq_bits_rs2Valid),
    .io_q5IQEnq_bits_rdValid(scheduler_io_q5IQEnq_bits_rdValid),
    .io_q5IQEnq_bits_snptId_valid(scheduler_io_q5IQEnq_bits_snptId_valid),
    .io_q5IQEnq_bits_snptId_bits(scheduler_io_q5IQEnq_bits_snptId_bits),
    .io_q5IQEnq_bits_robIdx_value(scheduler_io_q5IQEnq_bits_robIdx_value),
    .io_q5IQEnq_bits_robIdx_flag(scheduler_io_q5IQEnq_bits_robIdx_flag),
    .io_q5IQEnq_bits_robIdxFull_value(scheduler_io_q5IQEnq_bits_robIdxFull_value),
    .io_q5IQEnq_bits_robIdxFull_flag(scheduler_io_q5IQEnq_bits_robIdxFull_flag),
    .io_q5IQEnq_bits_lqIdx_value(scheduler_io_q5IQEnq_bits_lqIdx_value),
    .io_q5IQEnq_bits_lqIdx_flag(scheduler_io_q5IQEnq_bits_lqIdx_flag),
    .io_q5IQEnq_bits_sqIdx_value(scheduler_io_q5IQEnq_bits_sqIdx_value),
    .io_q5IQEnq_bits_sqIdx_flag(scheduler_io_q5IQEnq_bits_sqIdx_flag),
    .io_q5IQEnq_bits_issueQueue(scheduler_io_q5IQEnq_bits_issueQueue),
    .io_q5IQEnq_bits_prs1Busy(scheduler_io_q5IQEnq_bits_prs1Busy),
    .io_q5IQEnq_bits_prs2Busy(scheduler_io_q5IQEnq_bits_prs2Busy),
    .io_q5IQEnq_bits_isSta(scheduler_io_q5IQEnq_bits_isSta),
    .io_q5IQEnq_bits_isStd(scheduler_io_q5IQEnq_bits_isStd),
    .io_q1Issue_ready(scheduler_io_q1Issue_ready),
    .io_q1Issue_valid(scheduler_io_q1Issue_valid),
    .io_q1Issue_bits_pc(scheduler_io_q1Issue_bits_pc),
    .io_q1Issue_bits_inst(scheduler_io_q1Issue_bits_inst),
    .io_q1Issue_bits_ctrl_fuType(scheduler_io_q1Issue_bits_ctrl_fuType),
    .io_q1Issue_bits_ctrl_aluOp(scheduler_io_q1Issue_bits_ctrl_aluOp),
    .io_q1Issue_bits_ctrl_bruOp(scheduler_io_q1Issue_bits_ctrl_bruOp),
    .io_q1Issue_bits_ctrl_lsuOp(scheduler_io_q1Issue_bits_ctrl_lsuOp),
    .io_q1Issue_bits_ctrl_csrOp(scheduler_io_q1Issue_bits_ctrl_csrOp),
    .io_q1Issue_bits_ctrl_mulOp(scheduler_io_q1Issue_bits_ctrl_mulOp),
    .io_q1Issue_bits_ctrl_divOp(scheduler_io_q1Issue_bits_ctrl_divOp),
    .io_q1Issue_bits_ctrl_src1Type(scheduler_io_q1Issue_bits_ctrl_src1Type),
    .io_q1Issue_bits_ctrl_src2Type(scheduler_io_q1Issue_bits_ctrl_src2Type),
    .io_q1Issue_bits_ctrl_immType(scheduler_io_q1Issue_bits_ctrl_immType),
    .io_q1Issue_bits_ctrl_rfWen(scheduler_io_q1Issue_bits_ctrl_rfWen),
    .io_q1Issue_bits_ctrl_memRead(scheduler_io_q1Issue_bits_ctrl_memRead),
    .io_q1Issue_bits_ctrl_memWrite(scheduler_io_q1Issue_bits_ctrl_memWrite),
    .io_q1Issue_bits_ctrl_csrWen(scheduler_io_q1Issue_bits_ctrl_csrWen),
    .io_q1Issue_bits_ctrl_isBranch(scheduler_io_q1Issue_bits_ctrl_isBranch),
    .io_q1Issue_bits_ctrl_isJump(scheduler_io_q1Issue_bits_ctrl_isJump),
    .io_q1Issue_bits_ctrl_isPriv(scheduler_io_q1Issue_bits_ctrl_isPriv),
    .io_q1Issue_bits_excp_excpVec(scheduler_io_q1Issue_bits_excp_excpVec),
    .io_q1Issue_bits_imm(scheduler_io_q1Issue_bits_imm),
    .io_q1Issue_bits_csrAddress(scheduler_io_q1Issue_bits_csrAddress),
    .io_q1Issue_bits_pdInfo_valid(scheduler_io_q1Issue_bits_pdInfo_valid),
    .io_q1Issue_bits_pdInfo_isBr(scheduler_io_q1Issue_bits_pdInfo_isBr),
    .io_q1Issue_bits_pdInfo_isJal(scheduler_io_q1Issue_bits_pdInfo_isJal),
    .io_q1Issue_bits_pdInfo_isJalr(scheduler_io_q1Issue_bits_pdInfo_isJalr),
    .io_q1Issue_bits_pdInfo_isCall(scheduler_io_q1Issue_bits_pdInfo_isCall),
    .io_q1Issue_bits_pdInfo_isRet(scheduler_io_q1Issue_bits_pdInfo_isRet),
    .io_q1Issue_bits_pdInfo_jumpTarget(scheduler_io_q1Issue_bits_pdInfo_jumpTarget),
    .io_q1Issue_bits_bpuInfo_pc(scheduler_io_q1Issue_bits_bpuInfo_pc),
    .io_q1Issue_bits_bpuInfo_fallThrough(scheduler_io_q1Issue_bits_bpuInfo_fallThrough),
    .io_q1Issue_bits_bpuInfo_taken(scheduler_io_q1Issue_bits_bpuInfo_taken),
    .io_q1Issue_bits_bpuInfo_target(scheduler_io_q1Issue_bits_bpuInfo_target),
    .io_q1Issue_bits_bpuInfo_takenOffset(scheduler_io_q1Issue_bits_bpuInfo_takenOffset),
    .io_q1Issue_bits_bpuInfo_meta_valid(scheduler_io_q1Issue_bits_bpuInfo_meta_valid),
    .io_q1Issue_bits_bpuInfo_meta_btbHit(scheduler_io_q1Issue_bits_bpuInfo_meta_btbHit),
    .io_q1Issue_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsJalr),
    .io_q1Issue_bits_bpuInfo_meta_btbIsJal(scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsJal),
    .io_q1Issue_bits_bpuInfo_meta_btbIsCall(scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsCall),
    .io_q1Issue_bits_bpuInfo_meta_btbIsRet(scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsRet),
    .io_q1Issue_bits_bpuInfo_meta_btbOffset(scheduler_io_q1Issue_bits_bpuInfo_meta_btbOffset),
    .io_q1Issue_bits_bpuInfo_meta_phtCounter(scheduler_io_q1Issue_bits_bpuInfo_meta_phtCounter),
    .io_q1Issue_bits_bpuInfo_meta_rasTop(scheduler_io_q1Issue_bits_bpuInfo_meta_rasTop),
    .io_q1Issue_bits_bpuInfo_meta_predTaken(scheduler_io_q1Issue_bits_bpuInfo_meta_predTaken),
    .io_q1Issue_bits_bpuInfo_meta_predTarget(scheduler_io_q1Issue_bits_bpuInfo_meta_predTarget),
    .io_q1Issue_bits_ldst(scheduler_io_q1Issue_bits_ldst),
    .io_q1Issue_bits_lrs1(scheduler_io_q1Issue_bits_lrs1),
    .io_q1Issue_bits_lrs2(scheduler_io_q1Issue_bits_lrs2),
    .io_q1Issue_bits_pdst(scheduler_io_q1Issue_bits_pdst),
    .io_q1Issue_bits_prs1(scheduler_io_q1Issue_bits_prs1),
    .io_q1Issue_bits_prs2(scheduler_io_q1Issue_bits_prs2),
    .io_q1Issue_bits_oldPdst(scheduler_io_q1Issue_bits_oldPdst),
    .io_q1Issue_bits_rs1Valid(scheduler_io_q1Issue_bits_rs1Valid),
    .io_q1Issue_bits_rs2Valid(scheduler_io_q1Issue_bits_rs2Valid),
    .io_q1Issue_bits_rdValid(scheduler_io_q1Issue_bits_rdValid),
    .io_q1Issue_bits_snptId_valid(scheduler_io_q1Issue_bits_snptId_valid),
    .io_q1Issue_bits_snptId_bits(scheduler_io_q1Issue_bits_snptId_bits),
    .io_q1Issue_bits_robIdx_value(scheduler_io_q1Issue_bits_robIdx_value),
    .io_q1Issue_bits_robIdx_flag(scheduler_io_q1Issue_bits_robIdx_flag),
    .io_q1Issue_bits_robIdxFull_value(scheduler_io_q1Issue_bits_robIdxFull_value),
    .io_q1Issue_bits_robIdxFull_flag(scheduler_io_q1Issue_bits_robIdxFull_flag),
    .io_q1Issue_bits_lqIdx_value(scheduler_io_q1Issue_bits_lqIdx_value),
    .io_q1Issue_bits_lqIdx_flag(scheduler_io_q1Issue_bits_lqIdx_flag),
    .io_q1Issue_bits_sqIdx_value(scheduler_io_q1Issue_bits_sqIdx_value),
    .io_q1Issue_bits_sqIdx_flag(scheduler_io_q1Issue_bits_sqIdx_flag),
    .io_q1Issue_bits_issueQueue(scheduler_io_q1Issue_bits_issueQueue),
    .io_q1Issue_bits_prs1Busy(scheduler_io_q1Issue_bits_prs1Busy),
    .io_q1Issue_bits_prs2Busy(scheduler_io_q1Issue_bits_prs2Busy),
    .io_q1Issue_bits_isSta(scheduler_io_q1Issue_bits_isSta),
    .io_q1Issue_bits_isStd(scheduler_io_q1Issue_bits_isStd),
    .io_q2Issue_ready(scheduler_io_q2Issue_ready),
    .io_q2Issue_valid(scheduler_io_q2Issue_valid),
    .io_q2Issue_bits_pc(scheduler_io_q2Issue_bits_pc),
    .io_q2Issue_bits_inst(scheduler_io_q2Issue_bits_inst),
    .io_q2Issue_bits_ctrl_fuType(scheduler_io_q2Issue_bits_ctrl_fuType),
    .io_q2Issue_bits_ctrl_aluOp(scheduler_io_q2Issue_bits_ctrl_aluOp),
    .io_q2Issue_bits_ctrl_bruOp(scheduler_io_q2Issue_bits_ctrl_bruOp),
    .io_q2Issue_bits_ctrl_lsuOp(scheduler_io_q2Issue_bits_ctrl_lsuOp),
    .io_q2Issue_bits_ctrl_csrOp(scheduler_io_q2Issue_bits_ctrl_csrOp),
    .io_q2Issue_bits_ctrl_mulOp(scheduler_io_q2Issue_bits_ctrl_mulOp),
    .io_q2Issue_bits_ctrl_divOp(scheduler_io_q2Issue_bits_ctrl_divOp),
    .io_q2Issue_bits_ctrl_src1Type(scheduler_io_q2Issue_bits_ctrl_src1Type),
    .io_q2Issue_bits_ctrl_src2Type(scheduler_io_q2Issue_bits_ctrl_src2Type),
    .io_q2Issue_bits_ctrl_immType(scheduler_io_q2Issue_bits_ctrl_immType),
    .io_q2Issue_bits_ctrl_rfWen(scheduler_io_q2Issue_bits_ctrl_rfWen),
    .io_q2Issue_bits_ctrl_memRead(scheduler_io_q2Issue_bits_ctrl_memRead),
    .io_q2Issue_bits_ctrl_memWrite(scheduler_io_q2Issue_bits_ctrl_memWrite),
    .io_q2Issue_bits_ctrl_csrWen(scheduler_io_q2Issue_bits_ctrl_csrWen),
    .io_q2Issue_bits_ctrl_isBranch(scheduler_io_q2Issue_bits_ctrl_isBranch),
    .io_q2Issue_bits_ctrl_isJump(scheduler_io_q2Issue_bits_ctrl_isJump),
    .io_q2Issue_bits_ctrl_isPriv(scheduler_io_q2Issue_bits_ctrl_isPriv),
    .io_q2Issue_bits_excp_excpVec(scheduler_io_q2Issue_bits_excp_excpVec),
    .io_q2Issue_bits_imm(scheduler_io_q2Issue_bits_imm),
    .io_q2Issue_bits_csrAddress(scheduler_io_q2Issue_bits_csrAddress),
    .io_q2Issue_bits_pdInfo_valid(scheduler_io_q2Issue_bits_pdInfo_valid),
    .io_q2Issue_bits_pdInfo_isBr(scheduler_io_q2Issue_bits_pdInfo_isBr),
    .io_q2Issue_bits_pdInfo_isJal(scheduler_io_q2Issue_bits_pdInfo_isJal),
    .io_q2Issue_bits_pdInfo_isJalr(scheduler_io_q2Issue_bits_pdInfo_isJalr),
    .io_q2Issue_bits_pdInfo_isCall(scheduler_io_q2Issue_bits_pdInfo_isCall),
    .io_q2Issue_bits_pdInfo_isRet(scheduler_io_q2Issue_bits_pdInfo_isRet),
    .io_q2Issue_bits_pdInfo_jumpTarget(scheduler_io_q2Issue_bits_pdInfo_jumpTarget),
    .io_q2Issue_bits_bpuInfo_pc(scheduler_io_q2Issue_bits_bpuInfo_pc),
    .io_q2Issue_bits_bpuInfo_fallThrough(scheduler_io_q2Issue_bits_bpuInfo_fallThrough),
    .io_q2Issue_bits_bpuInfo_taken(scheduler_io_q2Issue_bits_bpuInfo_taken),
    .io_q2Issue_bits_bpuInfo_target(scheduler_io_q2Issue_bits_bpuInfo_target),
    .io_q2Issue_bits_bpuInfo_takenOffset(scheduler_io_q2Issue_bits_bpuInfo_takenOffset),
    .io_q2Issue_bits_bpuInfo_meta_valid(scheduler_io_q2Issue_bits_bpuInfo_meta_valid),
    .io_q2Issue_bits_bpuInfo_meta_btbHit(scheduler_io_q2Issue_bits_bpuInfo_meta_btbHit),
    .io_q2Issue_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsJalr),
    .io_q2Issue_bits_bpuInfo_meta_btbIsJal(scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsJal),
    .io_q2Issue_bits_bpuInfo_meta_btbIsCall(scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsCall),
    .io_q2Issue_bits_bpuInfo_meta_btbIsRet(scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsRet),
    .io_q2Issue_bits_bpuInfo_meta_btbOffset(scheduler_io_q2Issue_bits_bpuInfo_meta_btbOffset),
    .io_q2Issue_bits_bpuInfo_meta_phtCounter(scheduler_io_q2Issue_bits_bpuInfo_meta_phtCounter),
    .io_q2Issue_bits_bpuInfo_meta_rasTop(scheduler_io_q2Issue_bits_bpuInfo_meta_rasTop),
    .io_q2Issue_bits_bpuInfo_meta_predTaken(scheduler_io_q2Issue_bits_bpuInfo_meta_predTaken),
    .io_q2Issue_bits_bpuInfo_meta_predTarget(scheduler_io_q2Issue_bits_bpuInfo_meta_predTarget),
    .io_q2Issue_bits_ldst(scheduler_io_q2Issue_bits_ldst),
    .io_q2Issue_bits_lrs1(scheduler_io_q2Issue_bits_lrs1),
    .io_q2Issue_bits_lrs2(scheduler_io_q2Issue_bits_lrs2),
    .io_q2Issue_bits_pdst(scheduler_io_q2Issue_bits_pdst),
    .io_q2Issue_bits_prs1(scheduler_io_q2Issue_bits_prs1),
    .io_q2Issue_bits_prs2(scheduler_io_q2Issue_bits_prs2),
    .io_q2Issue_bits_oldPdst(scheduler_io_q2Issue_bits_oldPdst),
    .io_q2Issue_bits_rs1Valid(scheduler_io_q2Issue_bits_rs1Valid),
    .io_q2Issue_bits_rs2Valid(scheduler_io_q2Issue_bits_rs2Valid),
    .io_q2Issue_bits_rdValid(scheduler_io_q2Issue_bits_rdValid),
    .io_q2Issue_bits_snptId_valid(scheduler_io_q2Issue_bits_snptId_valid),
    .io_q2Issue_bits_snptId_bits(scheduler_io_q2Issue_bits_snptId_bits),
    .io_q2Issue_bits_robIdx_value(scheduler_io_q2Issue_bits_robIdx_value),
    .io_q2Issue_bits_robIdx_flag(scheduler_io_q2Issue_bits_robIdx_flag),
    .io_q2Issue_bits_robIdxFull_value(scheduler_io_q2Issue_bits_robIdxFull_value),
    .io_q2Issue_bits_robIdxFull_flag(scheduler_io_q2Issue_bits_robIdxFull_flag),
    .io_q2Issue_bits_issueQueue(scheduler_io_q2Issue_bits_issueQueue),
    .io_q2Issue_bits_prs1Busy(scheduler_io_q2Issue_bits_prs1Busy),
    .io_q2Issue_bits_prs2Busy(scheduler_io_q2Issue_bits_prs2Busy),
    .io_q3Issue_ready(scheduler_io_q3Issue_ready),
    .io_q3Issue_valid(scheduler_io_q3Issue_valid),
    .io_q3Issue_bits_pc(scheduler_io_q3Issue_bits_pc),
    .io_q3Issue_bits_inst(scheduler_io_q3Issue_bits_inst),
    .io_q3Issue_bits_ctrl_fuType(scheduler_io_q3Issue_bits_ctrl_fuType),
    .io_q3Issue_bits_ctrl_aluOp(scheduler_io_q3Issue_bits_ctrl_aluOp),
    .io_q3Issue_bits_ctrl_bruOp(scheduler_io_q3Issue_bits_ctrl_bruOp),
    .io_q3Issue_bits_ctrl_lsuOp(scheduler_io_q3Issue_bits_ctrl_lsuOp),
    .io_q3Issue_bits_ctrl_csrOp(scheduler_io_q3Issue_bits_ctrl_csrOp),
    .io_q3Issue_bits_ctrl_mulOp(scheduler_io_q3Issue_bits_ctrl_mulOp),
    .io_q3Issue_bits_ctrl_divOp(scheduler_io_q3Issue_bits_ctrl_divOp),
    .io_q3Issue_bits_ctrl_src1Type(scheduler_io_q3Issue_bits_ctrl_src1Type),
    .io_q3Issue_bits_ctrl_src2Type(scheduler_io_q3Issue_bits_ctrl_src2Type),
    .io_q3Issue_bits_ctrl_immType(scheduler_io_q3Issue_bits_ctrl_immType),
    .io_q3Issue_bits_ctrl_rfWen(scheduler_io_q3Issue_bits_ctrl_rfWen),
    .io_q3Issue_bits_ctrl_memRead(scheduler_io_q3Issue_bits_ctrl_memRead),
    .io_q3Issue_bits_ctrl_memWrite(scheduler_io_q3Issue_bits_ctrl_memWrite),
    .io_q3Issue_bits_ctrl_csrWen(scheduler_io_q3Issue_bits_ctrl_csrWen),
    .io_q3Issue_bits_ctrl_isBranch(scheduler_io_q3Issue_bits_ctrl_isBranch),
    .io_q3Issue_bits_ctrl_isJump(scheduler_io_q3Issue_bits_ctrl_isJump),
    .io_q3Issue_bits_ctrl_isPriv(scheduler_io_q3Issue_bits_ctrl_isPriv),
    .io_q3Issue_bits_excp_excpVec(scheduler_io_q3Issue_bits_excp_excpVec),
    .io_q3Issue_bits_imm(scheduler_io_q3Issue_bits_imm),
    .io_q3Issue_bits_csrAddress(scheduler_io_q3Issue_bits_csrAddress),
    .io_q3Issue_bits_pdInfo_valid(scheduler_io_q3Issue_bits_pdInfo_valid),
    .io_q3Issue_bits_pdInfo_isBr(scheduler_io_q3Issue_bits_pdInfo_isBr),
    .io_q3Issue_bits_pdInfo_isJal(scheduler_io_q3Issue_bits_pdInfo_isJal),
    .io_q3Issue_bits_pdInfo_isJalr(scheduler_io_q3Issue_bits_pdInfo_isJalr),
    .io_q3Issue_bits_pdInfo_isCall(scheduler_io_q3Issue_bits_pdInfo_isCall),
    .io_q3Issue_bits_pdInfo_isRet(scheduler_io_q3Issue_bits_pdInfo_isRet),
    .io_q3Issue_bits_pdInfo_jumpTarget(scheduler_io_q3Issue_bits_pdInfo_jumpTarget),
    .io_q3Issue_bits_bpuInfo_pc(scheduler_io_q3Issue_bits_bpuInfo_pc),
    .io_q3Issue_bits_bpuInfo_fallThrough(scheduler_io_q3Issue_bits_bpuInfo_fallThrough),
    .io_q3Issue_bits_bpuInfo_taken(scheduler_io_q3Issue_bits_bpuInfo_taken),
    .io_q3Issue_bits_bpuInfo_target(scheduler_io_q3Issue_bits_bpuInfo_target),
    .io_q3Issue_bits_bpuInfo_takenOffset(scheduler_io_q3Issue_bits_bpuInfo_takenOffset),
    .io_q3Issue_bits_bpuInfo_meta_valid(scheduler_io_q3Issue_bits_bpuInfo_meta_valid),
    .io_q3Issue_bits_bpuInfo_meta_btbHit(scheduler_io_q3Issue_bits_bpuInfo_meta_btbHit),
    .io_q3Issue_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsJalr),
    .io_q3Issue_bits_bpuInfo_meta_btbIsJal(scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsJal),
    .io_q3Issue_bits_bpuInfo_meta_btbIsCall(scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsCall),
    .io_q3Issue_bits_bpuInfo_meta_btbIsRet(scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsRet),
    .io_q3Issue_bits_bpuInfo_meta_btbOffset(scheduler_io_q3Issue_bits_bpuInfo_meta_btbOffset),
    .io_q3Issue_bits_bpuInfo_meta_phtCounter(scheduler_io_q3Issue_bits_bpuInfo_meta_phtCounter),
    .io_q3Issue_bits_bpuInfo_meta_rasTop(scheduler_io_q3Issue_bits_bpuInfo_meta_rasTop),
    .io_q3Issue_bits_bpuInfo_meta_predTaken(scheduler_io_q3Issue_bits_bpuInfo_meta_predTaken),
    .io_q3Issue_bits_bpuInfo_meta_predTarget(scheduler_io_q3Issue_bits_bpuInfo_meta_predTarget),
    .io_q3Issue_bits_ldst(scheduler_io_q3Issue_bits_ldst),
    .io_q3Issue_bits_lrs1(scheduler_io_q3Issue_bits_lrs1),
    .io_q3Issue_bits_lrs2(scheduler_io_q3Issue_bits_lrs2),
    .io_q3Issue_bits_pdst(scheduler_io_q3Issue_bits_pdst),
    .io_q3Issue_bits_prs1(scheduler_io_q3Issue_bits_prs1),
    .io_q3Issue_bits_prs2(scheduler_io_q3Issue_bits_prs2),
    .io_q3Issue_bits_oldPdst(scheduler_io_q3Issue_bits_oldPdst),
    .io_q3Issue_bits_rs1Valid(scheduler_io_q3Issue_bits_rs1Valid),
    .io_q3Issue_bits_rs2Valid(scheduler_io_q3Issue_bits_rs2Valid),
    .io_q3Issue_bits_rdValid(scheduler_io_q3Issue_bits_rdValid),
    .io_q3Issue_bits_snptId_valid(scheduler_io_q3Issue_bits_snptId_valid),
    .io_q3Issue_bits_snptId_bits(scheduler_io_q3Issue_bits_snptId_bits),
    .io_q3Issue_bits_robIdx_value(scheduler_io_q3Issue_bits_robIdx_value),
    .io_q3Issue_bits_robIdx_flag(scheduler_io_q3Issue_bits_robIdx_flag),
    .io_q3Issue_bits_robIdxFull_value(scheduler_io_q3Issue_bits_robIdxFull_value),
    .io_q3Issue_bits_robIdxFull_flag(scheduler_io_q3Issue_bits_robIdxFull_flag),
    .io_q3Issue_bits_lqIdx_value(scheduler_io_q3Issue_bits_lqIdx_value),
    .io_q3Issue_bits_lqIdx_flag(scheduler_io_q3Issue_bits_lqIdx_flag),
    .io_q3Issue_bits_sqIdx_value(scheduler_io_q3Issue_bits_sqIdx_value),
    .io_q3Issue_bits_sqIdx_flag(scheduler_io_q3Issue_bits_sqIdx_flag),
    .io_q3Issue_bits_issueQueue(scheduler_io_q3Issue_bits_issueQueue),
    .io_q3Issue_bits_prs1Busy(scheduler_io_q3Issue_bits_prs1Busy),
    .io_q3Issue_bits_prs2Busy(scheduler_io_q3Issue_bits_prs2Busy),
    .io_q3Issue_bits_isSta(scheduler_io_q3Issue_bits_isSta),
    .io_q3Issue_bits_isStd(scheduler_io_q3Issue_bits_isStd),
    .io_q4Issue_ready(scheduler_io_q4Issue_ready),
    .io_q4Issue_valid(scheduler_io_q4Issue_valid),
    .io_q4Issue_bits_pc(scheduler_io_q4Issue_bits_pc),
    .io_q4Issue_bits_inst(scheduler_io_q4Issue_bits_inst),
    .io_q4Issue_bits_ctrl_fuType(scheduler_io_q4Issue_bits_ctrl_fuType),
    .io_q4Issue_bits_ctrl_aluOp(scheduler_io_q4Issue_bits_ctrl_aluOp),
    .io_q4Issue_bits_ctrl_bruOp(scheduler_io_q4Issue_bits_ctrl_bruOp),
    .io_q4Issue_bits_ctrl_lsuOp(scheduler_io_q4Issue_bits_ctrl_lsuOp),
    .io_q4Issue_bits_ctrl_csrOp(scheduler_io_q4Issue_bits_ctrl_csrOp),
    .io_q4Issue_bits_ctrl_mulOp(scheduler_io_q4Issue_bits_ctrl_mulOp),
    .io_q4Issue_bits_ctrl_divOp(scheduler_io_q4Issue_bits_ctrl_divOp),
    .io_q4Issue_bits_ctrl_src1Type(scheduler_io_q4Issue_bits_ctrl_src1Type),
    .io_q4Issue_bits_ctrl_src2Type(scheduler_io_q4Issue_bits_ctrl_src2Type),
    .io_q4Issue_bits_ctrl_immType(scheduler_io_q4Issue_bits_ctrl_immType),
    .io_q4Issue_bits_ctrl_rfWen(scheduler_io_q4Issue_bits_ctrl_rfWen),
    .io_q4Issue_bits_ctrl_memRead(scheduler_io_q4Issue_bits_ctrl_memRead),
    .io_q4Issue_bits_ctrl_memWrite(scheduler_io_q4Issue_bits_ctrl_memWrite),
    .io_q4Issue_bits_ctrl_csrWen(scheduler_io_q4Issue_bits_ctrl_csrWen),
    .io_q4Issue_bits_ctrl_isBranch(scheduler_io_q4Issue_bits_ctrl_isBranch),
    .io_q4Issue_bits_ctrl_isJump(scheduler_io_q4Issue_bits_ctrl_isJump),
    .io_q4Issue_bits_ctrl_isPriv(scheduler_io_q4Issue_bits_ctrl_isPriv),
    .io_q4Issue_bits_excp_excpVec(scheduler_io_q4Issue_bits_excp_excpVec),
    .io_q4Issue_bits_imm(scheduler_io_q4Issue_bits_imm),
    .io_q4Issue_bits_csrAddress(scheduler_io_q4Issue_bits_csrAddress),
    .io_q4Issue_bits_pdInfo_valid(scheduler_io_q4Issue_bits_pdInfo_valid),
    .io_q4Issue_bits_pdInfo_isBr(scheduler_io_q4Issue_bits_pdInfo_isBr),
    .io_q4Issue_bits_pdInfo_isJal(scheduler_io_q4Issue_bits_pdInfo_isJal),
    .io_q4Issue_bits_pdInfo_isJalr(scheduler_io_q4Issue_bits_pdInfo_isJalr),
    .io_q4Issue_bits_pdInfo_isCall(scheduler_io_q4Issue_bits_pdInfo_isCall),
    .io_q4Issue_bits_pdInfo_isRet(scheduler_io_q4Issue_bits_pdInfo_isRet),
    .io_q4Issue_bits_pdInfo_jumpTarget(scheduler_io_q4Issue_bits_pdInfo_jumpTarget),
    .io_q4Issue_bits_bpuInfo_pc(scheduler_io_q4Issue_bits_bpuInfo_pc),
    .io_q4Issue_bits_bpuInfo_fallThrough(scheduler_io_q4Issue_bits_bpuInfo_fallThrough),
    .io_q4Issue_bits_bpuInfo_taken(scheduler_io_q4Issue_bits_bpuInfo_taken),
    .io_q4Issue_bits_bpuInfo_target(scheduler_io_q4Issue_bits_bpuInfo_target),
    .io_q4Issue_bits_bpuInfo_takenOffset(scheduler_io_q4Issue_bits_bpuInfo_takenOffset),
    .io_q4Issue_bits_bpuInfo_meta_valid(scheduler_io_q4Issue_bits_bpuInfo_meta_valid),
    .io_q4Issue_bits_bpuInfo_meta_btbHit(scheduler_io_q4Issue_bits_bpuInfo_meta_btbHit),
    .io_q4Issue_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsJalr),
    .io_q4Issue_bits_bpuInfo_meta_btbIsJal(scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsJal),
    .io_q4Issue_bits_bpuInfo_meta_btbIsCall(scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsCall),
    .io_q4Issue_bits_bpuInfo_meta_btbIsRet(scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsRet),
    .io_q4Issue_bits_bpuInfo_meta_btbOffset(scheduler_io_q4Issue_bits_bpuInfo_meta_btbOffset),
    .io_q4Issue_bits_bpuInfo_meta_phtCounter(scheduler_io_q4Issue_bits_bpuInfo_meta_phtCounter),
    .io_q4Issue_bits_bpuInfo_meta_rasTop(scheduler_io_q4Issue_bits_bpuInfo_meta_rasTop),
    .io_q4Issue_bits_bpuInfo_meta_predTaken(scheduler_io_q4Issue_bits_bpuInfo_meta_predTaken),
    .io_q4Issue_bits_bpuInfo_meta_predTarget(scheduler_io_q4Issue_bits_bpuInfo_meta_predTarget),
    .io_q4Issue_bits_ldst(scheduler_io_q4Issue_bits_ldst),
    .io_q4Issue_bits_lrs1(scheduler_io_q4Issue_bits_lrs1),
    .io_q4Issue_bits_lrs2(scheduler_io_q4Issue_bits_lrs2),
    .io_q4Issue_bits_pdst(scheduler_io_q4Issue_bits_pdst),
    .io_q4Issue_bits_prs1(scheduler_io_q4Issue_bits_prs1),
    .io_q4Issue_bits_prs2(scheduler_io_q4Issue_bits_prs2),
    .io_q4Issue_bits_oldPdst(scheduler_io_q4Issue_bits_oldPdst),
    .io_q4Issue_bits_rs1Valid(scheduler_io_q4Issue_bits_rs1Valid),
    .io_q4Issue_bits_rs2Valid(scheduler_io_q4Issue_bits_rs2Valid),
    .io_q4Issue_bits_rdValid(scheduler_io_q4Issue_bits_rdValid),
    .io_q4Issue_bits_snptId_valid(scheduler_io_q4Issue_bits_snptId_valid),
    .io_q4Issue_bits_snptId_bits(scheduler_io_q4Issue_bits_snptId_bits),
    .io_q4Issue_bits_robIdx_value(scheduler_io_q4Issue_bits_robIdx_value),
    .io_q4Issue_bits_robIdx_flag(scheduler_io_q4Issue_bits_robIdx_flag),
    .io_q4Issue_bits_robIdxFull_value(scheduler_io_q4Issue_bits_robIdxFull_value),
    .io_q4Issue_bits_robIdxFull_flag(scheduler_io_q4Issue_bits_robIdxFull_flag),
    .io_q4Issue_bits_lqIdx_value(scheduler_io_q4Issue_bits_lqIdx_value),
    .io_q4Issue_bits_lqIdx_flag(scheduler_io_q4Issue_bits_lqIdx_flag),
    .io_q4Issue_bits_sqIdx_value(scheduler_io_q4Issue_bits_sqIdx_value),
    .io_q4Issue_bits_sqIdx_flag(scheduler_io_q4Issue_bits_sqIdx_flag),
    .io_q4Issue_bits_issueQueue(scheduler_io_q4Issue_bits_issueQueue),
    .io_q4Issue_bits_prs1Busy(scheduler_io_q4Issue_bits_prs1Busy),
    .io_q4Issue_bits_prs2Busy(scheduler_io_q4Issue_bits_prs2Busy),
    .io_q4Issue_bits_isSta(scheduler_io_q4Issue_bits_isSta),
    .io_q4Issue_bits_isStd(scheduler_io_q4Issue_bits_isStd),
    .io_q5Issue_ready(scheduler_io_q5Issue_ready),
    .io_q5Issue_valid(scheduler_io_q5Issue_valid),
    .io_q5Issue_bits_pc(scheduler_io_q5Issue_bits_pc),
    .io_q5Issue_bits_inst(scheduler_io_q5Issue_bits_inst),
    .io_q5Issue_bits_ctrl_fuType(scheduler_io_q5Issue_bits_ctrl_fuType),
    .io_q5Issue_bits_ctrl_aluOp(scheduler_io_q5Issue_bits_ctrl_aluOp),
    .io_q5Issue_bits_ctrl_bruOp(scheduler_io_q5Issue_bits_ctrl_bruOp),
    .io_q5Issue_bits_ctrl_lsuOp(scheduler_io_q5Issue_bits_ctrl_lsuOp),
    .io_q5Issue_bits_ctrl_csrOp(scheduler_io_q5Issue_bits_ctrl_csrOp),
    .io_q5Issue_bits_ctrl_mulOp(scheduler_io_q5Issue_bits_ctrl_mulOp),
    .io_q5Issue_bits_ctrl_divOp(scheduler_io_q5Issue_bits_ctrl_divOp),
    .io_q5Issue_bits_ctrl_src1Type(scheduler_io_q5Issue_bits_ctrl_src1Type),
    .io_q5Issue_bits_ctrl_src2Type(scheduler_io_q5Issue_bits_ctrl_src2Type),
    .io_q5Issue_bits_ctrl_immType(scheduler_io_q5Issue_bits_ctrl_immType),
    .io_q5Issue_bits_ctrl_rfWen(scheduler_io_q5Issue_bits_ctrl_rfWen),
    .io_q5Issue_bits_ctrl_memRead(scheduler_io_q5Issue_bits_ctrl_memRead),
    .io_q5Issue_bits_ctrl_memWrite(scheduler_io_q5Issue_bits_ctrl_memWrite),
    .io_q5Issue_bits_ctrl_csrWen(scheduler_io_q5Issue_bits_ctrl_csrWen),
    .io_q5Issue_bits_ctrl_isBranch(scheduler_io_q5Issue_bits_ctrl_isBranch),
    .io_q5Issue_bits_ctrl_isJump(scheduler_io_q5Issue_bits_ctrl_isJump),
    .io_q5Issue_bits_ctrl_isPriv(scheduler_io_q5Issue_bits_ctrl_isPriv),
    .io_q5Issue_bits_excp_excpVec(scheduler_io_q5Issue_bits_excp_excpVec),
    .io_q5Issue_bits_imm(scheduler_io_q5Issue_bits_imm),
    .io_q5Issue_bits_csrAddress(scheduler_io_q5Issue_bits_csrAddress),
    .io_q5Issue_bits_pdInfo_valid(scheduler_io_q5Issue_bits_pdInfo_valid),
    .io_q5Issue_bits_pdInfo_isBr(scheduler_io_q5Issue_bits_pdInfo_isBr),
    .io_q5Issue_bits_pdInfo_isJal(scheduler_io_q5Issue_bits_pdInfo_isJal),
    .io_q5Issue_bits_pdInfo_isJalr(scheduler_io_q5Issue_bits_pdInfo_isJalr),
    .io_q5Issue_bits_pdInfo_isCall(scheduler_io_q5Issue_bits_pdInfo_isCall),
    .io_q5Issue_bits_pdInfo_isRet(scheduler_io_q5Issue_bits_pdInfo_isRet),
    .io_q5Issue_bits_pdInfo_jumpTarget(scheduler_io_q5Issue_bits_pdInfo_jumpTarget),
    .io_q5Issue_bits_bpuInfo_pc(scheduler_io_q5Issue_bits_bpuInfo_pc),
    .io_q5Issue_bits_bpuInfo_fallThrough(scheduler_io_q5Issue_bits_bpuInfo_fallThrough),
    .io_q5Issue_bits_bpuInfo_taken(scheduler_io_q5Issue_bits_bpuInfo_taken),
    .io_q5Issue_bits_bpuInfo_target(scheduler_io_q5Issue_bits_bpuInfo_target),
    .io_q5Issue_bits_bpuInfo_takenOffset(scheduler_io_q5Issue_bits_bpuInfo_takenOffset),
    .io_q5Issue_bits_bpuInfo_meta_valid(scheduler_io_q5Issue_bits_bpuInfo_meta_valid),
    .io_q5Issue_bits_bpuInfo_meta_btbHit(scheduler_io_q5Issue_bits_bpuInfo_meta_btbHit),
    .io_q5Issue_bits_bpuInfo_meta_btbIsJalr(scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsJalr),
    .io_q5Issue_bits_bpuInfo_meta_btbIsJal(scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsJal),
    .io_q5Issue_bits_bpuInfo_meta_btbIsCall(scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsCall),
    .io_q5Issue_bits_bpuInfo_meta_btbIsRet(scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsRet),
    .io_q5Issue_bits_bpuInfo_meta_btbOffset(scheduler_io_q5Issue_bits_bpuInfo_meta_btbOffset),
    .io_q5Issue_bits_bpuInfo_meta_phtCounter(scheduler_io_q5Issue_bits_bpuInfo_meta_phtCounter),
    .io_q5Issue_bits_bpuInfo_meta_rasTop(scheduler_io_q5Issue_bits_bpuInfo_meta_rasTop),
    .io_q5Issue_bits_bpuInfo_meta_predTaken(scheduler_io_q5Issue_bits_bpuInfo_meta_predTaken),
    .io_q5Issue_bits_bpuInfo_meta_predTarget(scheduler_io_q5Issue_bits_bpuInfo_meta_predTarget),
    .io_q5Issue_bits_ldst(scheduler_io_q5Issue_bits_ldst),
    .io_q5Issue_bits_lrs1(scheduler_io_q5Issue_bits_lrs1),
    .io_q5Issue_bits_lrs2(scheduler_io_q5Issue_bits_lrs2),
    .io_q5Issue_bits_pdst(scheduler_io_q5Issue_bits_pdst),
    .io_q5Issue_bits_prs1(scheduler_io_q5Issue_bits_prs1),
    .io_q5Issue_bits_prs2(scheduler_io_q5Issue_bits_prs2),
    .io_q5Issue_bits_oldPdst(scheduler_io_q5Issue_bits_oldPdst),
    .io_q5Issue_bits_rs1Valid(scheduler_io_q5Issue_bits_rs1Valid),
    .io_q5Issue_bits_rs2Valid(scheduler_io_q5Issue_bits_rs2Valid),
    .io_q5Issue_bits_rdValid(scheduler_io_q5Issue_bits_rdValid),
    .io_q5Issue_bits_snptId_valid(scheduler_io_q5Issue_bits_snptId_valid),
    .io_q5Issue_bits_snptId_bits(scheduler_io_q5Issue_bits_snptId_bits),
    .io_q5Issue_bits_robIdx_value(scheduler_io_q5Issue_bits_robIdx_value),
    .io_q5Issue_bits_robIdx_flag(scheduler_io_q5Issue_bits_robIdx_flag),
    .io_q5Issue_bits_robIdxFull_value(scheduler_io_q5Issue_bits_robIdxFull_value),
    .io_q5Issue_bits_robIdxFull_flag(scheduler_io_q5Issue_bits_robIdxFull_flag),
    .io_q5Issue_bits_lqIdx_value(scheduler_io_q5Issue_bits_lqIdx_value),
    .io_q5Issue_bits_lqIdx_flag(scheduler_io_q5Issue_bits_lqIdx_flag),
    .io_q5Issue_bits_sqIdx_value(scheduler_io_q5Issue_bits_sqIdx_value),
    .io_q5Issue_bits_sqIdx_flag(scheduler_io_q5Issue_bits_sqIdx_flag),
    .io_q5Issue_bits_issueQueue(scheduler_io_q5Issue_bits_issueQueue),
    .io_q5Issue_bits_prs1Busy(scheduler_io_q5Issue_bits_prs1Busy),
    .io_q5Issue_bits_prs2Busy(scheduler_io_q5Issue_bits_prs2Busy),
    .io_q5Issue_bits_isSta(scheduler_io_q5Issue_bits_isSta),
    .io_q5Issue_bits_isStd(scheduler_io_q5Issue_bits_isStd),
    .io_wakeupPorts_0_valid(scheduler_io_wakeupPorts_0_valid),
    .io_wakeupPorts_0_bits_pdst(scheduler_io_wakeupPorts_0_bits_pdst),
    .io_wakeupPorts_1_valid(scheduler_io_wakeupPorts_1_valid),
    .io_wakeupPorts_1_bits_pdst(scheduler_io_wakeupPorts_1_bits_pdst),
    .io_wakeupPorts_2_valid(scheduler_io_wakeupPorts_2_valid),
    .io_wakeupPorts_2_bits_pdst(scheduler_io_wakeupPorts_2_bits_pdst),
    .io_wakeupPorts_3_valid(scheduler_io_wakeupPorts_3_valid),
    .io_wakeupPorts_3_bits_pdst(scheduler_io_wakeupPorts_3_bits_pdst),
    .io_wakeupPorts_4_valid(scheduler_io_wakeupPorts_4_valid),
    .io_wakeupPorts_4_bits_pdst(scheduler_io_wakeupPorts_4_bits_pdst),
    .io_redirectInfo_valid(scheduler_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(scheduler_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(scheduler_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(scheduler_io_redirectInfo_bits_robIdx_flag),
    .io_feedback_q1FreeEntries(scheduler_io_feedback_q1FreeEntries),
    .io_feedback_q2FreeEntries(scheduler_io_feedback_q2FreeEntries),
    .io_feedback_q3FreeEntries(scheduler_io_feedback_q3FreeEntries),
    .io_feedback_q4FreeEntries(scheduler_io_feedback_q4FreeEntries),
    .io_feedback_q5FreeEntries(scheduler_io_feedback_q5FreeEntries)
  );
  RegisterRead regRead ( // @[src/main/scala/backend/Backend.scala 63:27]
    .clock(regRead_clock),
    .reset(regRead_reset),
    .io_iqIssues_0_ready(regRead_io_iqIssues_0_ready),
    .io_iqIssues_0_valid(regRead_io_iqIssues_0_valid),
    .io_iqIssues_0_bits_pc(regRead_io_iqIssues_0_bits_pc),
    .io_iqIssues_0_bits_inst(regRead_io_iqIssues_0_bits_inst),
    .io_iqIssues_0_bits_ctrl_fuType(regRead_io_iqIssues_0_bits_ctrl_fuType),
    .io_iqIssues_0_bits_ctrl_aluOp(regRead_io_iqIssues_0_bits_ctrl_aluOp),
    .io_iqIssues_0_bits_ctrl_bruOp(regRead_io_iqIssues_0_bits_ctrl_bruOp),
    .io_iqIssues_0_bits_ctrl_lsuOp(regRead_io_iqIssues_0_bits_ctrl_lsuOp),
    .io_iqIssues_0_bits_ctrl_csrOp(regRead_io_iqIssues_0_bits_ctrl_csrOp),
    .io_iqIssues_0_bits_ctrl_mulOp(regRead_io_iqIssues_0_bits_ctrl_mulOp),
    .io_iqIssues_0_bits_ctrl_divOp(regRead_io_iqIssues_0_bits_ctrl_divOp),
    .io_iqIssues_0_bits_ctrl_src1Type(regRead_io_iqIssues_0_bits_ctrl_src1Type),
    .io_iqIssues_0_bits_ctrl_src2Type(regRead_io_iqIssues_0_bits_ctrl_src2Type),
    .io_iqIssues_0_bits_ctrl_immType(regRead_io_iqIssues_0_bits_ctrl_immType),
    .io_iqIssues_0_bits_ctrl_rfWen(regRead_io_iqIssues_0_bits_ctrl_rfWen),
    .io_iqIssues_0_bits_ctrl_memRead(regRead_io_iqIssues_0_bits_ctrl_memRead),
    .io_iqIssues_0_bits_ctrl_memWrite(regRead_io_iqIssues_0_bits_ctrl_memWrite),
    .io_iqIssues_0_bits_ctrl_csrWen(regRead_io_iqIssues_0_bits_ctrl_csrWen),
    .io_iqIssues_0_bits_ctrl_isBranch(regRead_io_iqIssues_0_bits_ctrl_isBranch),
    .io_iqIssues_0_bits_ctrl_isJump(regRead_io_iqIssues_0_bits_ctrl_isJump),
    .io_iqIssues_0_bits_ctrl_isPriv(regRead_io_iqIssues_0_bits_ctrl_isPriv),
    .io_iqIssues_0_bits_excp_excpVec(regRead_io_iqIssues_0_bits_excp_excpVec),
    .io_iqIssues_0_bits_imm(regRead_io_iqIssues_0_bits_imm),
    .io_iqIssues_0_bits_csrAddress(regRead_io_iqIssues_0_bits_csrAddress),
    .io_iqIssues_0_bits_pdInfo_valid(regRead_io_iqIssues_0_bits_pdInfo_valid),
    .io_iqIssues_0_bits_pdInfo_isBr(regRead_io_iqIssues_0_bits_pdInfo_isBr),
    .io_iqIssues_0_bits_pdInfo_isJal(regRead_io_iqIssues_0_bits_pdInfo_isJal),
    .io_iqIssues_0_bits_pdInfo_isJalr(regRead_io_iqIssues_0_bits_pdInfo_isJalr),
    .io_iqIssues_0_bits_pdInfo_isCall(regRead_io_iqIssues_0_bits_pdInfo_isCall),
    .io_iqIssues_0_bits_pdInfo_isRet(regRead_io_iqIssues_0_bits_pdInfo_isRet),
    .io_iqIssues_0_bits_pdInfo_jumpTarget(regRead_io_iqIssues_0_bits_pdInfo_jumpTarget),
    .io_iqIssues_0_bits_bpuInfo_pc(regRead_io_iqIssues_0_bits_bpuInfo_pc),
    .io_iqIssues_0_bits_bpuInfo_fallThrough(regRead_io_iqIssues_0_bits_bpuInfo_fallThrough),
    .io_iqIssues_0_bits_bpuInfo_taken(regRead_io_iqIssues_0_bits_bpuInfo_taken),
    .io_iqIssues_0_bits_bpuInfo_target(regRead_io_iqIssues_0_bits_bpuInfo_target),
    .io_iqIssues_0_bits_bpuInfo_takenOffset(regRead_io_iqIssues_0_bits_bpuInfo_takenOffset),
    .io_iqIssues_0_bits_bpuInfo_meta_valid(regRead_io_iqIssues_0_bits_bpuInfo_meta_valid),
    .io_iqIssues_0_bits_bpuInfo_meta_btbHit(regRead_io_iqIssues_0_bits_bpuInfo_meta_btbHit),
    .io_iqIssues_0_bits_bpuInfo_meta_btbIsJalr(regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsJalr),
    .io_iqIssues_0_bits_bpuInfo_meta_btbIsJal(regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsJal),
    .io_iqIssues_0_bits_bpuInfo_meta_btbIsCall(regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsCall),
    .io_iqIssues_0_bits_bpuInfo_meta_btbIsRet(regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsRet),
    .io_iqIssues_0_bits_bpuInfo_meta_btbOffset(regRead_io_iqIssues_0_bits_bpuInfo_meta_btbOffset),
    .io_iqIssues_0_bits_bpuInfo_meta_phtCounter(regRead_io_iqIssues_0_bits_bpuInfo_meta_phtCounter),
    .io_iqIssues_0_bits_bpuInfo_meta_rasTop(regRead_io_iqIssues_0_bits_bpuInfo_meta_rasTop),
    .io_iqIssues_0_bits_bpuInfo_meta_predTaken(regRead_io_iqIssues_0_bits_bpuInfo_meta_predTaken),
    .io_iqIssues_0_bits_bpuInfo_meta_predTarget(regRead_io_iqIssues_0_bits_bpuInfo_meta_predTarget),
    .io_iqIssues_0_bits_ldst(regRead_io_iqIssues_0_bits_ldst),
    .io_iqIssues_0_bits_lrs1(regRead_io_iqIssues_0_bits_lrs1),
    .io_iqIssues_0_bits_lrs2(regRead_io_iqIssues_0_bits_lrs2),
    .io_iqIssues_0_bits_pdst(regRead_io_iqIssues_0_bits_pdst),
    .io_iqIssues_0_bits_prs1(regRead_io_iqIssues_0_bits_prs1),
    .io_iqIssues_0_bits_prs2(regRead_io_iqIssues_0_bits_prs2),
    .io_iqIssues_0_bits_oldPdst(regRead_io_iqIssues_0_bits_oldPdst),
    .io_iqIssues_0_bits_rs1Valid(regRead_io_iqIssues_0_bits_rs1Valid),
    .io_iqIssues_0_bits_rs2Valid(regRead_io_iqIssues_0_bits_rs2Valid),
    .io_iqIssues_0_bits_rdValid(regRead_io_iqIssues_0_bits_rdValid),
    .io_iqIssues_0_bits_snptId_valid(regRead_io_iqIssues_0_bits_snptId_valid),
    .io_iqIssues_0_bits_snptId_bits(regRead_io_iqIssues_0_bits_snptId_bits),
    .io_iqIssues_0_bits_robIdx_value(regRead_io_iqIssues_0_bits_robIdx_value),
    .io_iqIssues_0_bits_robIdx_flag(regRead_io_iqIssues_0_bits_robIdx_flag),
    .io_iqIssues_0_bits_robIdxFull_value(regRead_io_iqIssues_0_bits_robIdxFull_value),
    .io_iqIssues_0_bits_robIdxFull_flag(regRead_io_iqIssues_0_bits_robIdxFull_flag),
    .io_iqIssues_0_bits_lqIdx_value(regRead_io_iqIssues_0_bits_lqIdx_value),
    .io_iqIssues_0_bits_lqIdx_flag(regRead_io_iqIssues_0_bits_lqIdx_flag),
    .io_iqIssues_0_bits_sqIdx_value(regRead_io_iqIssues_0_bits_sqIdx_value),
    .io_iqIssues_0_bits_sqIdx_flag(regRead_io_iqIssues_0_bits_sqIdx_flag),
    .io_iqIssues_0_bits_issueQueue(regRead_io_iqIssues_0_bits_issueQueue),
    .io_iqIssues_0_bits_prs1Busy(regRead_io_iqIssues_0_bits_prs1Busy),
    .io_iqIssues_0_bits_prs2Busy(regRead_io_iqIssues_0_bits_prs2Busy),
    .io_iqIssues_0_bits_isSta(regRead_io_iqIssues_0_bits_isSta),
    .io_iqIssues_0_bits_isStd(regRead_io_iqIssues_0_bits_isStd),
    .io_iqIssues_1_ready(regRead_io_iqIssues_1_ready),
    .io_iqIssues_1_valid(regRead_io_iqIssues_1_valid),
    .io_iqIssues_1_bits_pc(regRead_io_iqIssues_1_bits_pc),
    .io_iqIssues_1_bits_inst(regRead_io_iqIssues_1_bits_inst),
    .io_iqIssues_1_bits_ctrl_fuType(regRead_io_iqIssues_1_bits_ctrl_fuType),
    .io_iqIssues_1_bits_ctrl_aluOp(regRead_io_iqIssues_1_bits_ctrl_aluOp),
    .io_iqIssues_1_bits_ctrl_bruOp(regRead_io_iqIssues_1_bits_ctrl_bruOp),
    .io_iqIssues_1_bits_ctrl_lsuOp(regRead_io_iqIssues_1_bits_ctrl_lsuOp),
    .io_iqIssues_1_bits_ctrl_csrOp(regRead_io_iqIssues_1_bits_ctrl_csrOp),
    .io_iqIssues_1_bits_ctrl_mulOp(regRead_io_iqIssues_1_bits_ctrl_mulOp),
    .io_iqIssues_1_bits_ctrl_divOp(regRead_io_iqIssues_1_bits_ctrl_divOp),
    .io_iqIssues_1_bits_ctrl_src1Type(regRead_io_iqIssues_1_bits_ctrl_src1Type),
    .io_iqIssues_1_bits_ctrl_src2Type(regRead_io_iqIssues_1_bits_ctrl_src2Type),
    .io_iqIssues_1_bits_ctrl_immType(regRead_io_iqIssues_1_bits_ctrl_immType),
    .io_iqIssues_1_bits_ctrl_rfWen(regRead_io_iqIssues_1_bits_ctrl_rfWen),
    .io_iqIssues_1_bits_ctrl_memRead(regRead_io_iqIssues_1_bits_ctrl_memRead),
    .io_iqIssues_1_bits_ctrl_memWrite(regRead_io_iqIssues_1_bits_ctrl_memWrite),
    .io_iqIssues_1_bits_ctrl_csrWen(regRead_io_iqIssues_1_bits_ctrl_csrWen),
    .io_iqIssues_1_bits_ctrl_isBranch(regRead_io_iqIssues_1_bits_ctrl_isBranch),
    .io_iqIssues_1_bits_ctrl_isJump(regRead_io_iqIssues_1_bits_ctrl_isJump),
    .io_iqIssues_1_bits_ctrl_isPriv(regRead_io_iqIssues_1_bits_ctrl_isPriv),
    .io_iqIssues_1_bits_excp_excpVec(regRead_io_iqIssues_1_bits_excp_excpVec),
    .io_iqIssues_1_bits_imm(regRead_io_iqIssues_1_bits_imm),
    .io_iqIssues_1_bits_csrAddress(regRead_io_iqIssues_1_bits_csrAddress),
    .io_iqIssues_1_bits_pdInfo_valid(regRead_io_iqIssues_1_bits_pdInfo_valid),
    .io_iqIssues_1_bits_pdInfo_isBr(regRead_io_iqIssues_1_bits_pdInfo_isBr),
    .io_iqIssues_1_bits_pdInfo_isJal(regRead_io_iqIssues_1_bits_pdInfo_isJal),
    .io_iqIssues_1_bits_pdInfo_isJalr(regRead_io_iqIssues_1_bits_pdInfo_isJalr),
    .io_iqIssues_1_bits_pdInfo_isCall(regRead_io_iqIssues_1_bits_pdInfo_isCall),
    .io_iqIssues_1_bits_pdInfo_isRet(regRead_io_iqIssues_1_bits_pdInfo_isRet),
    .io_iqIssues_1_bits_pdInfo_jumpTarget(regRead_io_iqIssues_1_bits_pdInfo_jumpTarget),
    .io_iqIssues_1_bits_bpuInfo_pc(regRead_io_iqIssues_1_bits_bpuInfo_pc),
    .io_iqIssues_1_bits_bpuInfo_fallThrough(regRead_io_iqIssues_1_bits_bpuInfo_fallThrough),
    .io_iqIssues_1_bits_bpuInfo_taken(regRead_io_iqIssues_1_bits_bpuInfo_taken),
    .io_iqIssues_1_bits_bpuInfo_target(regRead_io_iqIssues_1_bits_bpuInfo_target),
    .io_iqIssues_1_bits_bpuInfo_takenOffset(regRead_io_iqIssues_1_bits_bpuInfo_takenOffset),
    .io_iqIssues_1_bits_bpuInfo_meta_valid(regRead_io_iqIssues_1_bits_bpuInfo_meta_valid),
    .io_iqIssues_1_bits_bpuInfo_meta_btbHit(regRead_io_iqIssues_1_bits_bpuInfo_meta_btbHit),
    .io_iqIssues_1_bits_bpuInfo_meta_btbIsJalr(regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsJalr),
    .io_iqIssues_1_bits_bpuInfo_meta_btbIsJal(regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsJal),
    .io_iqIssues_1_bits_bpuInfo_meta_btbIsCall(regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsCall),
    .io_iqIssues_1_bits_bpuInfo_meta_btbIsRet(regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsRet),
    .io_iqIssues_1_bits_bpuInfo_meta_btbOffset(regRead_io_iqIssues_1_bits_bpuInfo_meta_btbOffset),
    .io_iqIssues_1_bits_bpuInfo_meta_phtCounter(regRead_io_iqIssues_1_bits_bpuInfo_meta_phtCounter),
    .io_iqIssues_1_bits_bpuInfo_meta_rasTop(regRead_io_iqIssues_1_bits_bpuInfo_meta_rasTop),
    .io_iqIssues_1_bits_bpuInfo_meta_predTaken(regRead_io_iqIssues_1_bits_bpuInfo_meta_predTaken),
    .io_iqIssues_1_bits_bpuInfo_meta_predTarget(regRead_io_iqIssues_1_bits_bpuInfo_meta_predTarget),
    .io_iqIssues_1_bits_ldst(regRead_io_iqIssues_1_bits_ldst),
    .io_iqIssues_1_bits_lrs1(regRead_io_iqIssues_1_bits_lrs1),
    .io_iqIssues_1_bits_lrs2(regRead_io_iqIssues_1_bits_lrs2),
    .io_iqIssues_1_bits_pdst(regRead_io_iqIssues_1_bits_pdst),
    .io_iqIssues_1_bits_prs1(regRead_io_iqIssues_1_bits_prs1),
    .io_iqIssues_1_bits_prs2(regRead_io_iqIssues_1_bits_prs2),
    .io_iqIssues_1_bits_oldPdst(regRead_io_iqIssues_1_bits_oldPdst),
    .io_iqIssues_1_bits_rs1Valid(regRead_io_iqIssues_1_bits_rs1Valid),
    .io_iqIssues_1_bits_rs2Valid(regRead_io_iqIssues_1_bits_rs2Valid),
    .io_iqIssues_1_bits_rdValid(regRead_io_iqIssues_1_bits_rdValid),
    .io_iqIssues_1_bits_snptId_valid(regRead_io_iqIssues_1_bits_snptId_valid),
    .io_iqIssues_1_bits_snptId_bits(regRead_io_iqIssues_1_bits_snptId_bits),
    .io_iqIssues_1_bits_robIdx_value(regRead_io_iqIssues_1_bits_robIdx_value),
    .io_iqIssues_1_bits_robIdx_flag(regRead_io_iqIssues_1_bits_robIdx_flag),
    .io_iqIssues_1_bits_robIdxFull_value(regRead_io_iqIssues_1_bits_robIdxFull_value),
    .io_iqIssues_1_bits_robIdxFull_flag(regRead_io_iqIssues_1_bits_robIdxFull_flag),
    .io_iqIssues_1_bits_issueQueue(regRead_io_iqIssues_1_bits_issueQueue),
    .io_iqIssues_1_bits_prs1Busy(regRead_io_iqIssues_1_bits_prs1Busy),
    .io_iqIssues_1_bits_prs2Busy(regRead_io_iqIssues_1_bits_prs2Busy),
    .io_iqIssues_2_ready(regRead_io_iqIssues_2_ready),
    .io_iqIssues_2_valid(regRead_io_iqIssues_2_valid),
    .io_iqIssues_2_bits_pc(regRead_io_iqIssues_2_bits_pc),
    .io_iqIssues_2_bits_inst(regRead_io_iqIssues_2_bits_inst),
    .io_iqIssues_2_bits_ctrl_fuType(regRead_io_iqIssues_2_bits_ctrl_fuType),
    .io_iqIssues_2_bits_ctrl_aluOp(regRead_io_iqIssues_2_bits_ctrl_aluOp),
    .io_iqIssues_2_bits_ctrl_bruOp(regRead_io_iqIssues_2_bits_ctrl_bruOp),
    .io_iqIssues_2_bits_ctrl_lsuOp(regRead_io_iqIssues_2_bits_ctrl_lsuOp),
    .io_iqIssues_2_bits_ctrl_csrOp(regRead_io_iqIssues_2_bits_ctrl_csrOp),
    .io_iqIssues_2_bits_ctrl_mulOp(regRead_io_iqIssues_2_bits_ctrl_mulOp),
    .io_iqIssues_2_bits_ctrl_divOp(regRead_io_iqIssues_2_bits_ctrl_divOp),
    .io_iqIssues_2_bits_ctrl_src1Type(regRead_io_iqIssues_2_bits_ctrl_src1Type),
    .io_iqIssues_2_bits_ctrl_src2Type(regRead_io_iqIssues_2_bits_ctrl_src2Type),
    .io_iqIssues_2_bits_ctrl_immType(regRead_io_iqIssues_2_bits_ctrl_immType),
    .io_iqIssues_2_bits_ctrl_rfWen(regRead_io_iqIssues_2_bits_ctrl_rfWen),
    .io_iqIssues_2_bits_ctrl_memRead(regRead_io_iqIssues_2_bits_ctrl_memRead),
    .io_iqIssues_2_bits_ctrl_memWrite(regRead_io_iqIssues_2_bits_ctrl_memWrite),
    .io_iqIssues_2_bits_ctrl_csrWen(regRead_io_iqIssues_2_bits_ctrl_csrWen),
    .io_iqIssues_2_bits_ctrl_isBranch(regRead_io_iqIssues_2_bits_ctrl_isBranch),
    .io_iqIssues_2_bits_ctrl_isJump(regRead_io_iqIssues_2_bits_ctrl_isJump),
    .io_iqIssues_2_bits_ctrl_isPriv(regRead_io_iqIssues_2_bits_ctrl_isPriv),
    .io_iqIssues_2_bits_excp_excpVec(regRead_io_iqIssues_2_bits_excp_excpVec),
    .io_iqIssues_2_bits_imm(regRead_io_iqIssues_2_bits_imm),
    .io_iqIssues_2_bits_csrAddress(regRead_io_iqIssues_2_bits_csrAddress),
    .io_iqIssues_2_bits_pdInfo_valid(regRead_io_iqIssues_2_bits_pdInfo_valid),
    .io_iqIssues_2_bits_pdInfo_isBr(regRead_io_iqIssues_2_bits_pdInfo_isBr),
    .io_iqIssues_2_bits_pdInfo_isJal(regRead_io_iqIssues_2_bits_pdInfo_isJal),
    .io_iqIssues_2_bits_pdInfo_isJalr(regRead_io_iqIssues_2_bits_pdInfo_isJalr),
    .io_iqIssues_2_bits_pdInfo_isCall(regRead_io_iqIssues_2_bits_pdInfo_isCall),
    .io_iqIssues_2_bits_pdInfo_isRet(regRead_io_iqIssues_2_bits_pdInfo_isRet),
    .io_iqIssues_2_bits_pdInfo_jumpTarget(regRead_io_iqIssues_2_bits_pdInfo_jumpTarget),
    .io_iqIssues_2_bits_bpuInfo_pc(regRead_io_iqIssues_2_bits_bpuInfo_pc),
    .io_iqIssues_2_bits_bpuInfo_fallThrough(regRead_io_iqIssues_2_bits_bpuInfo_fallThrough),
    .io_iqIssues_2_bits_bpuInfo_taken(regRead_io_iqIssues_2_bits_bpuInfo_taken),
    .io_iqIssues_2_bits_bpuInfo_target(regRead_io_iqIssues_2_bits_bpuInfo_target),
    .io_iqIssues_2_bits_bpuInfo_takenOffset(regRead_io_iqIssues_2_bits_bpuInfo_takenOffset),
    .io_iqIssues_2_bits_bpuInfo_meta_valid(regRead_io_iqIssues_2_bits_bpuInfo_meta_valid),
    .io_iqIssues_2_bits_bpuInfo_meta_btbHit(regRead_io_iqIssues_2_bits_bpuInfo_meta_btbHit),
    .io_iqIssues_2_bits_bpuInfo_meta_btbIsJalr(regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsJalr),
    .io_iqIssues_2_bits_bpuInfo_meta_btbIsJal(regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsJal),
    .io_iqIssues_2_bits_bpuInfo_meta_btbIsCall(regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsCall),
    .io_iqIssues_2_bits_bpuInfo_meta_btbIsRet(regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsRet),
    .io_iqIssues_2_bits_bpuInfo_meta_btbOffset(regRead_io_iqIssues_2_bits_bpuInfo_meta_btbOffset),
    .io_iqIssues_2_bits_bpuInfo_meta_phtCounter(regRead_io_iqIssues_2_bits_bpuInfo_meta_phtCounter),
    .io_iqIssues_2_bits_bpuInfo_meta_rasTop(regRead_io_iqIssues_2_bits_bpuInfo_meta_rasTop),
    .io_iqIssues_2_bits_bpuInfo_meta_predTaken(regRead_io_iqIssues_2_bits_bpuInfo_meta_predTaken),
    .io_iqIssues_2_bits_bpuInfo_meta_predTarget(regRead_io_iqIssues_2_bits_bpuInfo_meta_predTarget),
    .io_iqIssues_2_bits_ldst(regRead_io_iqIssues_2_bits_ldst),
    .io_iqIssues_2_bits_lrs1(regRead_io_iqIssues_2_bits_lrs1),
    .io_iqIssues_2_bits_lrs2(regRead_io_iqIssues_2_bits_lrs2),
    .io_iqIssues_2_bits_pdst(regRead_io_iqIssues_2_bits_pdst),
    .io_iqIssues_2_bits_prs1(regRead_io_iqIssues_2_bits_prs1),
    .io_iqIssues_2_bits_prs2(regRead_io_iqIssues_2_bits_prs2),
    .io_iqIssues_2_bits_oldPdst(regRead_io_iqIssues_2_bits_oldPdst),
    .io_iqIssues_2_bits_rs1Valid(regRead_io_iqIssues_2_bits_rs1Valid),
    .io_iqIssues_2_bits_rs2Valid(regRead_io_iqIssues_2_bits_rs2Valid),
    .io_iqIssues_2_bits_rdValid(regRead_io_iqIssues_2_bits_rdValid),
    .io_iqIssues_2_bits_snptId_valid(regRead_io_iqIssues_2_bits_snptId_valid),
    .io_iqIssues_2_bits_snptId_bits(regRead_io_iqIssues_2_bits_snptId_bits),
    .io_iqIssues_2_bits_robIdx_value(regRead_io_iqIssues_2_bits_robIdx_value),
    .io_iqIssues_2_bits_robIdx_flag(regRead_io_iqIssues_2_bits_robIdx_flag),
    .io_iqIssues_2_bits_robIdxFull_value(regRead_io_iqIssues_2_bits_robIdxFull_value),
    .io_iqIssues_2_bits_robIdxFull_flag(regRead_io_iqIssues_2_bits_robIdxFull_flag),
    .io_iqIssues_2_bits_lqIdx_value(regRead_io_iqIssues_2_bits_lqIdx_value),
    .io_iqIssues_2_bits_lqIdx_flag(regRead_io_iqIssues_2_bits_lqIdx_flag),
    .io_iqIssues_2_bits_sqIdx_value(regRead_io_iqIssues_2_bits_sqIdx_value),
    .io_iqIssues_2_bits_sqIdx_flag(regRead_io_iqIssues_2_bits_sqIdx_flag),
    .io_iqIssues_2_bits_issueQueue(regRead_io_iqIssues_2_bits_issueQueue),
    .io_iqIssues_2_bits_prs1Busy(regRead_io_iqIssues_2_bits_prs1Busy),
    .io_iqIssues_2_bits_prs2Busy(regRead_io_iqIssues_2_bits_prs2Busy),
    .io_iqIssues_2_bits_isSta(regRead_io_iqIssues_2_bits_isSta),
    .io_iqIssues_2_bits_isStd(regRead_io_iqIssues_2_bits_isStd),
    .io_iqIssues_3_ready(regRead_io_iqIssues_3_ready),
    .io_iqIssues_3_valid(regRead_io_iqIssues_3_valid),
    .io_iqIssues_3_bits_pc(regRead_io_iqIssues_3_bits_pc),
    .io_iqIssues_3_bits_inst(regRead_io_iqIssues_3_bits_inst),
    .io_iqIssues_3_bits_ctrl_fuType(regRead_io_iqIssues_3_bits_ctrl_fuType),
    .io_iqIssues_3_bits_ctrl_aluOp(regRead_io_iqIssues_3_bits_ctrl_aluOp),
    .io_iqIssues_3_bits_ctrl_bruOp(regRead_io_iqIssues_3_bits_ctrl_bruOp),
    .io_iqIssues_3_bits_ctrl_lsuOp(regRead_io_iqIssues_3_bits_ctrl_lsuOp),
    .io_iqIssues_3_bits_ctrl_csrOp(regRead_io_iqIssues_3_bits_ctrl_csrOp),
    .io_iqIssues_3_bits_ctrl_mulOp(regRead_io_iqIssues_3_bits_ctrl_mulOp),
    .io_iqIssues_3_bits_ctrl_divOp(regRead_io_iqIssues_3_bits_ctrl_divOp),
    .io_iqIssues_3_bits_ctrl_src1Type(regRead_io_iqIssues_3_bits_ctrl_src1Type),
    .io_iqIssues_3_bits_ctrl_src2Type(regRead_io_iqIssues_3_bits_ctrl_src2Type),
    .io_iqIssues_3_bits_ctrl_immType(regRead_io_iqIssues_3_bits_ctrl_immType),
    .io_iqIssues_3_bits_ctrl_rfWen(regRead_io_iqIssues_3_bits_ctrl_rfWen),
    .io_iqIssues_3_bits_ctrl_memRead(regRead_io_iqIssues_3_bits_ctrl_memRead),
    .io_iqIssues_3_bits_ctrl_memWrite(regRead_io_iqIssues_3_bits_ctrl_memWrite),
    .io_iqIssues_3_bits_ctrl_csrWen(regRead_io_iqIssues_3_bits_ctrl_csrWen),
    .io_iqIssues_3_bits_ctrl_isBranch(regRead_io_iqIssues_3_bits_ctrl_isBranch),
    .io_iqIssues_3_bits_ctrl_isJump(regRead_io_iqIssues_3_bits_ctrl_isJump),
    .io_iqIssues_3_bits_ctrl_isPriv(regRead_io_iqIssues_3_bits_ctrl_isPriv),
    .io_iqIssues_3_bits_excp_excpVec(regRead_io_iqIssues_3_bits_excp_excpVec),
    .io_iqIssues_3_bits_imm(regRead_io_iqIssues_3_bits_imm),
    .io_iqIssues_3_bits_csrAddress(regRead_io_iqIssues_3_bits_csrAddress),
    .io_iqIssues_3_bits_pdInfo_valid(regRead_io_iqIssues_3_bits_pdInfo_valid),
    .io_iqIssues_3_bits_pdInfo_isBr(regRead_io_iqIssues_3_bits_pdInfo_isBr),
    .io_iqIssues_3_bits_pdInfo_isJal(regRead_io_iqIssues_3_bits_pdInfo_isJal),
    .io_iqIssues_3_bits_pdInfo_isJalr(regRead_io_iqIssues_3_bits_pdInfo_isJalr),
    .io_iqIssues_3_bits_pdInfo_isCall(regRead_io_iqIssues_3_bits_pdInfo_isCall),
    .io_iqIssues_3_bits_pdInfo_isRet(regRead_io_iqIssues_3_bits_pdInfo_isRet),
    .io_iqIssues_3_bits_pdInfo_jumpTarget(regRead_io_iqIssues_3_bits_pdInfo_jumpTarget),
    .io_iqIssues_3_bits_bpuInfo_pc(regRead_io_iqIssues_3_bits_bpuInfo_pc),
    .io_iqIssues_3_bits_bpuInfo_fallThrough(regRead_io_iqIssues_3_bits_bpuInfo_fallThrough),
    .io_iqIssues_3_bits_bpuInfo_taken(regRead_io_iqIssues_3_bits_bpuInfo_taken),
    .io_iqIssues_3_bits_bpuInfo_target(regRead_io_iqIssues_3_bits_bpuInfo_target),
    .io_iqIssues_3_bits_bpuInfo_takenOffset(regRead_io_iqIssues_3_bits_bpuInfo_takenOffset),
    .io_iqIssues_3_bits_bpuInfo_meta_valid(regRead_io_iqIssues_3_bits_bpuInfo_meta_valid),
    .io_iqIssues_3_bits_bpuInfo_meta_btbHit(regRead_io_iqIssues_3_bits_bpuInfo_meta_btbHit),
    .io_iqIssues_3_bits_bpuInfo_meta_btbIsJalr(regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsJalr),
    .io_iqIssues_3_bits_bpuInfo_meta_btbIsJal(regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsJal),
    .io_iqIssues_3_bits_bpuInfo_meta_btbIsCall(regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsCall),
    .io_iqIssues_3_bits_bpuInfo_meta_btbIsRet(regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsRet),
    .io_iqIssues_3_bits_bpuInfo_meta_btbOffset(regRead_io_iqIssues_3_bits_bpuInfo_meta_btbOffset),
    .io_iqIssues_3_bits_bpuInfo_meta_phtCounter(regRead_io_iqIssues_3_bits_bpuInfo_meta_phtCounter),
    .io_iqIssues_3_bits_bpuInfo_meta_rasTop(regRead_io_iqIssues_3_bits_bpuInfo_meta_rasTop),
    .io_iqIssues_3_bits_bpuInfo_meta_predTaken(regRead_io_iqIssues_3_bits_bpuInfo_meta_predTaken),
    .io_iqIssues_3_bits_bpuInfo_meta_predTarget(regRead_io_iqIssues_3_bits_bpuInfo_meta_predTarget),
    .io_iqIssues_3_bits_ldst(regRead_io_iqIssues_3_bits_ldst),
    .io_iqIssues_3_bits_lrs1(regRead_io_iqIssues_3_bits_lrs1),
    .io_iqIssues_3_bits_lrs2(regRead_io_iqIssues_3_bits_lrs2),
    .io_iqIssues_3_bits_pdst(regRead_io_iqIssues_3_bits_pdst),
    .io_iqIssues_3_bits_prs1(regRead_io_iqIssues_3_bits_prs1),
    .io_iqIssues_3_bits_prs2(regRead_io_iqIssues_3_bits_prs2),
    .io_iqIssues_3_bits_oldPdst(regRead_io_iqIssues_3_bits_oldPdst),
    .io_iqIssues_3_bits_rs1Valid(regRead_io_iqIssues_3_bits_rs1Valid),
    .io_iqIssues_3_bits_rs2Valid(regRead_io_iqIssues_3_bits_rs2Valid),
    .io_iqIssues_3_bits_rdValid(regRead_io_iqIssues_3_bits_rdValid),
    .io_iqIssues_3_bits_snptId_valid(regRead_io_iqIssues_3_bits_snptId_valid),
    .io_iqIssues_3_bits_snptId_bits(regRead_io_iqIssues_3_bits_snptId_bits),
    .io_iqIssues_3_bits_robIdx_value(regRead_io_iqIssues_3_bits_robIdx_value),
    .io_iqIssues_3_bits_robIdx_flag(regRead_io_iqIssues_3_bits_robIdx_flag),
    .io_iqIssues_3_bits_robIdxFull_value(regRead_io_iqIssues_3_bits_robIdxFull_value),
    .io_iqIssues_3_bits_robIdxFull_flag(regRead_io_iqIssues_3_bits_robIdxFull_flag),
    .io_iqIssues_3_bits_lqIdx_value(regRead_io_iqIssues_3_bits_lqIdx_value),
    .io_iqIssues_3_bits_lqIdx_flag(regRead_io_iqIssues_3_bits_lqIdx_flag),
    .io_iqIssues_3_bits_sqIdx_value(regRead_io_iqIssues_3_bits_sqIdx_value),
    .io_iqIssues_3_bits_sqIdx_flag(regRead_io_iqIssues_3_bits_sqIdx_flag),
    .io_iqIssues_3_bits_issueQueue(regRead_io_iqIssues_3_bits_issueQueue),
    .io_iqIssues_3_bits_prs1Busy(regRead_io_iqIssues_3_bits_prs1Busy),
    .io_iqIssues_3_bits_prs2Busy(regRead_io_iqIssues_3_bits_prs2Busy),
    .io_iqIssues_3_bits_isSta(regRead_io_iqIssues_3_bits_isSta),
    .io_iqIssues_3_bits_isStd(regRead_io_iqIssues_3_bits_isStd),
    .io_iqIssues_4_ready(regRead_io_iqIssues_4_ready),
    .io_iqIssues_4_valid(regRead_io_iqIssues_4_valid),
    .io_iqIssues_4_bits_pc(regRead_io_iqIssues_4_bits_pc),
    .io_iqIssues_4_bits_inst(regRead_io_iqIssues_4_bits_inst),
    .io_iqIssues_4_bits_ctrl_fuType(regRead_io_iqIssues_4_bits_ctrl_fuType),
    .io_iqIssues_4_bits_ctrl_aluOp(regRead_io_iqIssues_4_bits_ctrl_aluOp),
    .io_iqIssues_4_bits_ctrl_bruOp(regRead_io_iqIssues_4_bits_ctrl_bruOp),
    .io_iqIssues_4_bits_ctrl_lsuOp(regRead_io_iqIssues_4_bits_ctrl_lsuOp),
    .io_iqIssues_4_bits_ctrl_csrOp(regRead_io_iqIssues_4_bits_ctrl_csrOp),
    .io_iqIssues_4_bits_ctrl_mulOp(regRead_io_iqIssues_4_bits_ctrl_mulOp),
    .io_iqIssues_4_bits_ctrl_divOp(regRead_io_iqIssues_4_bits_ctrl_divOp),
    .io_iqIssues_4_bits_ctrl_src1Type(regRead_io_iqIssues_4_bits_ctrl_src1Type),
    .io_iqIssues_4_bits_ctrl_src2Type(regRead_io_iqIssues_4_bits_ctrl_src2Type),
    .io_iqIssues_4_bits_ctrl_immType(regRead_io_iqIssues_4_bits_ctrl_immType),
    .io_iqIssues_4_bits_ctrl_rfWen(regRead_io_iqIssues_4_bits_ctrl_rfWen),
    .io_iqIssues_4_bits_ctrl_memRead(regRead_io_iqIssues_4_bits_ctrl_memRead),
    .io_iqIssues_4_bits_ctrl_memWrite(regRead_io_iqIssues_4_bits_ctrl_memWrite),
    .io_iqIssues_4_bits_ctrl_csrWen(regRead_io_iqIssues_4_bits_ctrl_csrWen),
    .io_iqIssues_4_bits_ctrl_isBranch(regRead_io_iqIssues_4_bits_ctrl_isBranch),
    .io_iqIssues_4_bits_ctrl_isJump(regRead_io_iqIssues_4_bits_ctrl_isJump),
    .io_iqIssues_4_bits_ctrl_isPriv(regRead_io_iqIssues_4_bits_ctrl_isPriv),
    .io_iqIssues_4_bits_excp_excpVec(regRead_io_iqIssues_4_bits_excp_excpVec),
    .io_iqIssues_4_bits_imm(regRead_io_iqIssues_4_bits_imm),
    .io_iqIssues_4_bits_csrAddress(regRead_io_iqIssues_4_bits_csrAddress),
    .io_iqIssues_4_bits_pdInfo_valid(regRead_io_iqIssues_4_bits_pdInfo_valid),
    .io_iqIssues_4_bits_pdInfo_isBr(regRead_io_iqIssues_4_bits_pdInfo_isBr),
    .io_iqIssues_4_bits_pdInfo_isJal(regRead_io_iqIssues_4_bits_pdInfo_isJal),
    .io_iqIssues_4_bits_pdInfo_isJalr(regRead_io_iqIssues_4_bits_pdInfo_isJalr),
    .io_iqIssues_4_bits_pdInfo_isCall(regRead_io_iqIssues_4_bits_pdInfo_isCall),
    .io_iqIssues_4_bits_pdInfo_isRet(regRead_io_iqIssues_4_bits_pdInfo_isRet),
    .io_iqIssues_4_bits_pdInfo_jumpTarget(regRead_io_iqIssues_4_bits_pdInfo_jumpTarget),
    .io_iqIssues_4_bits_bpuInfo_pc(regRead_io_iqIssues_4_bits_bpuInfo_pc),
    .io_iqIssues_4_bits_bpuInfo_fallThrough(regRead_io_iqIssues_4_bits_bpuInfo_fallThrough),
    .io_iqIssues_4_bits_bpuInfo_taken(regRead_io_iqIssues_4_bits_bpuInfo_taken),
    .io_iqIssues_4_bits_bpuInfo_target(regRead_io_iqIssues_4_bits_bpuInfo_target),
    .io_iqIssues_4_bits_bpuInfo_takenOffset(regRead_io_iqIssues_4_bits_bpuInfo_takenOffset),
    .io_iqIssues_4_bits_bpuInfo_meta_valid(regRead_io_iqIssues_4_bits_bpuInfo_meta_valid),
    .io_iqIssues_4_bits_bpuInfo_meta_btbHit(regRead_io_iqIssues_4_bits_bpuInfo_meta_btbHit),
    .io_iqIssues_4_bits_bpuInfo_meta_btbIsJalr(regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsJalr),
    .io_iqIssues_4_bits_bpuInfo_meta_btbIsJal(regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsJal),
    .io_iqIssues_4_bits_bpuInfo_meta_btbIsCall(regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsCall),
    .io_iqIssues_4_bits_bpuInfo_meta_btbIsRet(regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsRet),
    .io_iqIssues_4_bits_bpuInfo_meta_btbOffset(regRead_io_iqIssues_4_bits_bpuInfo_meta_btbOffset),
    .io_iqIssues_4_bits_bpuInfo_meta_phtCounter(regRead_io_iqIssues_4_bits_bpuInfo_meta_phtCounter),
    .io_iqIssues_4_bits_bpuInfo_meta_rasTop(regRead_io_iqIssues_4_bits_bpuInfo_meta_rasTop),
    .io_iqIssues_4_bits_bpuInfo_meta_predTaken(regRead_io_iqIssues_4_bits_bpuInfo_meta_predTaken),
    .io_iqIssues_4_bits_bpuInfo_meta_predTarget(regRead_io_iqIssues_4_bits_bpuInfo_meta_predTarget),
    .io_iqIssues_4_bits_ldst(regRead_io_iqIssues_4_bits_ldst),
    .io_iqIssues_4_bits_lrs1(regRead_io_iqIssues_4_bits_lrs1),
    .io_iqIssues_4_bits_lrs2(regRead_io_iqIssues_4_bits_lrs2),
    .io_iqIssues_4_bits_pdst(regRead_io_iqIssues_4_bits_pdst),
    .io_iqIssues_4_bits_prs1(regRead_io_iqIssues_4_bits_prs1),
    .io_iqIssues_4_bits_prs2(regRead_io_iqIssues_4_bits_prs2),
    .io_iqIssues_4_bits_oldPdst(regRead_io_iqIssues_4_bits_oldPdst),
    .io_iqIssues_4_bits_rs1Valid(regRead_io_iqIssues_4_bits_rs1Valid),
    .io_iqIssues_4_bits_rs2Valid(regRead_io_iqIssues_4_bits_rs2Valid),
    .io_iqIssues_4_bits_rdValid(regRead_io_iqIssues_4_bits_rdValid),
    .io_iqIssues_4_bits_snptId_valid(regRead_io_iqIssues_4_bits_snptId_valid),
    .io_iqIssues_4_bits_snptId_bits(regRead_io_iqIssues_4_bits_snptId_bits),
    .io_iqIssues_4_bits_robIdx_value(regRead_io_iqIssues_4_bits_robIdx_value),
    .io_iqIssues_4_bits_robIdx_flag(regRead_io_iqIssues_4_bits_robIdx_flag),
    .io_iqIssues_4_bits_robIdxFull_value(regRead_io_iqIssues_4_bits_robIdxFull_value),
    .io_iqIssues_4_bits_robIdxFull_flag(regRead_io_iqIssues_4_bits_robIdxFull_flag),
    .io_iqIssues_4_bits_lqIdx_value(regRead_io_iqIssues_4_bits_lqIdx_value),
    .io_iqIssues_4_bits_lqIdx_flag(regRead_io_iqIssues_4_bits_lqIdx_flag),
    .io_iqIssues_4_bits_sqIdx_value(regRead_io_iqIssues_4_bits_sqIdx_value),
    .io_iqIssues_4_bits_sqIdx_flag(regRead_io_iqIssues_4_bits_sqIdx_flag),
    .io_iqIssues_4_bits_issueQueue(regRead_io_iqIssues_4_bits_issueQueue),
    .io_iqIssues_4_bits_prs1Busy(regRead_io_iqIssues_4_bits_prs1Busy),
    .io_iqIssues_4_bits_prs2Busy(regRead_io_iqIssues_4_bits_prs2Busy),
    .io_iqIssues_4_bits_isSta(regRead_io_iqIssues_4_bits_isSta),
    .io_iqIssues_4_bits_isStd(regRead_io_iqIssues_4_bits_isStd),
    .io_rfReadAddrs_0(regRead_io_rfReadAddrs_0),
    .io_rfReadAddrs_1(regRead_io_rfReadAddrs_1),
    .io_rfReadAddrs_2(regRead_io_rfReadAddrs_2),
    .io_rfReadAddrs_3(regRead_io_rfReadAddrs_3),
    .io_rfReadAddrs_4(regRead_io_rfReadAddrs_4),
    .io_rfReadAddrs_5(regRead_io_rfReadAddrs_5),
    .io_rfReadAddrs_6(regRead_io_rfReadAddrs_6),
    .io_rfReadAddrs_7(regRead_io_rfReadAddrs_7),
    .io_rfReadData_0(regRead_io_rfReadData_0),
    .io_rfReadData_1(regRead_io_rfReadData_1),
    .io_rfReadData_2(regRead_io_rfReadData_2),
    .io_rfReadData_3(regRead_io_rfReadData_3),
    .io_rfReadData_4(regRead_io_rfReadData_4),
    .io_rfReadData_5(regRead_io_rfReadData_5),
    .io_rfReadData_6(regRead_io_rfReadData_6),
    .io_rfReadData_7(regRead_io_rfReadData_7),
    .io_exeReqs_0_ready(regRead_io_exeReqs_0_ready),
    .io_exeReqs_0_valid(regRead_io_exeReqs_0_valid),
    .io_exeReqs_0_bits_uop_pc(regRead_io_exeReqs_0_bits_uop_pc),
    .io_exeReqs_0_bits_uop_inst(regRead_io_exeReqs_0_bits_uop_inst),
    .io_exeReqs_0_bits_uop_ctrl_fuType(regRead_io_exeReqs_0_bits_uop_ctrl_fuType),
    .io_exeReqs_0_bits_uop_ctrl_aluOp(regRead_io_exeReqs_0_bits_uop_ctrl_aluOp),
    .io_exeReqs_0_bits_uop_ctrl_bruOp(regRead_io_exeReqs_0_bits_uop_ctrl_bruOp),
    .io_exeReqs_0_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_0_bits_uop_ctrl_lsuOp),
    .io_exeReqs_0_bits_uop_ctrl_csrOp(regRead_io_exeReqs_0_bits_uop_ctrl_csrOp),
    .io_exeReqs_0_bits_uop_ctrl_mulOp(regRead_io_exeReqs_0_bits_uop_ctrl_mulOp),
    .io_exeReqs_0_bits_uop_ctrl_divOp(regRead_io_exeReqs_0_bits_uop_ctrl_divOp),
    .io_exeReqs_0_bits_uop_ctrl_src1Type(regRead_io_exeReqs_0_bits_uop_ctrl_src1Type),
    .io_exeReqs_0_bits_uop_ctrl_src2Type(regRead_io_exeReqs_0_bits_uop_ctrl_src2Type),
    .io_exeReqs_0_bits_uop_ctrl_immType(regRead_io_exeReqs_0_bits_uop_ctrl_immType),
    .io_exeReqs_0_bits_uop_ctrl_rfWen(regRead_io_exeReqs_0_bits_uop_ctrl_rfWen),
    .io_exeReqs_0_bits_uop_ctrl_memRead(regRead_io_exeReqs_0_bits_uop_ctrl_memRead),
    .io_exeReqs_0_bits_uop_ctrl_memWrite(regRead_io_exeReqs_0_bits_uop_ctrl_memWrite),
    .io_exeReqs_0_bits_uop_ctrl_csrWen(regRead_io_exeReqs_0_bits_uop_ctrl_csrWen),
    .io_exeReqs_0_bits_uop_ctrl_isBranch(regRead_io_exeReqs_0_bits_uop_ctrl_isBranch),
    .io_exeReqs_0_bits_uop_ctrl_isJump(regRead_io_exeReqs_0_bits_uop_ctrl_isJump),
    .io_exeReqs_0_bits_uop_ctrl_isPriv(regRead_io_exeReqs_0_bits_uop_ctrl_isPriv),
    .io_exeReqs_0_bits_uop_excp_excpVec(regRead_io_exeReqs_0_bits_uop_excp_excpVec),
    .io_exeReqs_0_bits_uop_imm(regRead_io_exeReqs_0_bits_uop_imm),
    .io_exeReqs_0_bits_uop_csrAddress(regRead_io_exeReqs_0_bits_uop_csrAddress),
    .io_exeReqs_0_bits_uop_pdInfo_valid(regRead_io_exeReqs_0_bits_uop_pdInfo_valid),
    .io_exeReqs_0_bits_uop_pdInfo_isBr(regRead_io_exeReqs_0_bits_uop_pdInfo_isBr),
    .io_exeReqs_0_bits_uop_pdInfo_isJal(regRead_io_exeReqs_0_bits_uop_pdInfo_isJal),
    .io_exeReqs_0_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_0_bits_uop_pdInfo_isJalr),
    .io_exeReqs_0_bits_uop_pdInfo_isCall(regRead_io_exeReqs_0_bits_uop_pdInfo_isCall),
    .io_exeReqs_0_bits_uop_pdInfo_isRet(regRead_io_exeReqs_0_bits_uop_pdInfo_isRet),
    .io_exeReqs_0_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_0_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_0_bits_uop_bpuInfo_pc(regRead_io_exeReqs_0_bits_uop_bpuInfo_pc),
    .io_exeReqs_0_bits_uop_bpuInfo_fallThrough(regRead_io_exeReqs_0_bits_uop_bpuInfo_fallThrough),
    .io_exeReqs_0_bits_uop_bpuInfo_taken(regRead_io_exeReqs_0_bits_uop_bpuInfo_taken),
    .io_exeReqs_0_bits_uop_bpuInfo_target(regRead_io_exeReqs_0_bits_uop_bpuInfo_target),
    .io_exeReqs_0_bits_uop_bpuInfo_takenOffset(regRead_io_exeReqs_0_bits_uop_bpuInfo_takenOffset),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_valid(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_valid),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_btbHit(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbHit),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJalr(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJal(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJal),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsCall(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsCall),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsRet(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsRet),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_btbOffset(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbOffset),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_phtCounter(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_phtCounter),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_rasTop(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_rasTop),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_predTaken(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_predTaken),
    .io_exeReqs_0_bits_uop_bpuInfo_meta_predTarget(regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_predTarget),
    .io_exeReqs_0_bits_uop_ldst(regRead_io_exeReqs_0_bits_uop_ldst),
    .io_exeReqs_0_bits_uop_lrs1(regRead_io_exeReqs_0_bits_uop_lrs1),
    .io_exeReqs_0_bits_uop_lrs2(regRead_io_exeReqs_0_bits_uop_lrs2),
    .io_exeReqs_0_bits_uop_pdst(regRead_io_exeReqs_0_bits_uop_pdst),
    .io_exeReqs_0_bits_uop_prs1(regRead_io_exeReqs_0_bits_uop_prs1),
    .io_exeReqs_0_bits_uop_prs2(regRead_io_exeReqs_0_bits_uop_prs2),
    .io_exeReqs_0_bits_uop_oldPdst(regRead_io_exeReqs_0_bits_uop_oldPdst),
    .io_exeReqs_0_bits_uop_rs1Valid(regRead_io_exeReqs_0_bits_uop_rs1Valid),
    .io_exeReqs_0_bits_uop_rs2Valid(regRead_io_exeReqs_0_bits_uop_rs2Valid),
    .io_exeReqs_0_bits_uop_rdValid(regRead_io_exeReqs_0_bits_uop_rdValid),
    .io_exeReqs_0_bits_uop_snptId_valid(regRead_io_exeReqs_0_bits_uop_snptId_valid),
    .io_exeReqs_0_bits_uop_snptId_bits(regRead_io_exeReqs_0_bits_uop_snptId_bits),
    .io_exeReqs_0_bits_uop_robIdx_value(regRead_io_exeReqs_0_bits_uop_robIdx_value),
    .io_exeReqs_0_bits_uop_robIdx_flag(regRead_io_exeReqs_0_bits_uop_robIdx_flag),
    .io_exeReqs_0_bits_uop_robIdxFull_value(regRead_io_exeReqs_0_bits_uop_robIdxFull_value),
    .io_exeReqs_0_bits_uop_robIdxFull_flag(regRead_io_exeReqs_0_bits_uop_robIdxFull_flag),
    .io_exeReqs_0_bits_uop_lqIdx_value(regRead_io_exeReqs_0_bits_uop_lqIdx_value),
    .io_exeReqs_0_bits_uop_lqIdx_flag(regRead_io_exeReqs_0_bits_uop_lqIdx_flag),
    .io_exeReqs_0_bits_uop_sqIdx_value(regRead_io_exeReqs_0_bits_uop_sqIdx_value),
    .io_exeReqs_0_bits_uop_sqIdx_flag(regRead_io_exeReqs_0_bits_uop_sqIdx_flag),
    .io_exeReqs_0_bits_uop_issueQueue(regRead_io_exeReqs_0_bits_uop_issueQueue),
    .io_exeReqs_0_bits_uop_prs1Busy(regRead_io_exeReqs_0_bits_uop_prs1Busy),
    .io_exeReqs_0_bits_uop_prs2Busy(regRead_io_exeReqs_0_bits_uop_prs2Busy),
    .io_exeReqs_0_bits_uop_isSta(regRead_io_exeReqs_0_bits_uop_isSta),
    .io_exeReqs_0_bits_uop_isStd(regRead_io_exeReqs_0_bits_uop_isStd),
    .io_exeReqs_0_bits_rs1Data(regRead_io_exeReqs_0_bits_rs1Data),
    .io_exeReqs_0_bits_rs2Data(regRead_io_exeReqs_0_bits_rs2Data),
    .io_exeReqs_1_ready(regRead_io_exeReqs_1_ready),
    .io_exeReqs_1_valid(regRead_io_exeReqs_1_valid),
    .io_exeReqs_1_bits_uop_pc(regRead_io_exeReqs_1_bits_uop_pc),
    .io_exeReqs_1_bits_uop_inst(regRead_io_exeReqs_1_bits_uop_inst),
    .io_exeReqs_1_bits_uop_ctrl_fuType(regRead_io_exeReqs_1_bits_uop_ctrl_fuType),
    .io_exeReqs_1_bits_uop_ctrl_aluOp(regRead_io_exeReqs_1_bits_uop_ctrl_aluOp),
    .io_exeReqs_1_bits_uop_ctrl_bruOp(regRead_io_exeReqs_1_bits_uop_ctrl_bruOp),
    .io_exeReqs_1_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_1_bits_uop_ctrl_lsuOp),
    .io_exeReqs_1_bits_uop_ctrl_csrOp(regRead_io_exeReqs_1_bits_uop_ctrl_csrOp),
    .io_exeReqs_1_bits_uop_ctrl_mulOp(regRead_io_exeReqs_1_bits_uop_ctrl_mulOp),
    .io_exeReqs_1_bits_uop_ctrl_divOp(regRead_io_exeReqs_1_bits_uop_ctrl_divOp),
    .io_exeReqs_1_bits_uop_ctrl_src1Type(regRead_io_exeReqs_1_bits_uop_ctrl_src1Type),
    .io_exeReqs_1_bits_uop_ctrl_src2Type(regRead_io_exeReqs_1_bits_uop_ctrl_src2Type),
    .io_exeReqs_1_bits_uop_ctrl_immType(regRead_io_exeReqs_1_bits_uop_ctrl_immType),
    .io_exeReqs_1_bits_uop_ctrl_rfWen(regRead_io_exeReqs_1_bits_uop_ctrl_rfWen),
    .io_exeReqs_1_bits_uop_ctrl_memRead(regRead_io_exeReqs_1_bits_uop_ctrl_memRead),
    .io_exeReqs_1_bits_uop_ctrl_memWrite(regRead_io_exeReqs_1_bits_uop_ctrl_memWrite),
    .io_exeReqs_1_bits_uop_ctrl_csrWen(regRead_io_exeReqs_1_bits_uop_ctrl_csrWen),
    .io_exeReqs_1_bits_uop_ctrl_isBranch(regRead_io_exeReqs_1_bits_uop_ctrl_isBranch),
    .io_exeReqs_1_bits_uop_ctrl_isJump(regRead_io_exeReqs_1_bits_uop_ctrl_isJump),
    .io_exeReqs_1_bits_uop_ctrl_isPriv(regRead_io_exeReqs_1_bits_uop_ctrl_isPriv),
    .io_exeReqs_1_bits_uop_excp_excpVec(regRead_io_exeReqs_1_bits_uop_excp_excpVec),
    .io_exeReqs_1_bits_uop_imm(regRead_io_exeReqs_1_bits_uop_imm),
    .io_exeReqs_1_bits_uop_csrAddress(regRead_io_exeReqs_1_bits_uop_csrAddress),
    .io_exeReqs_1_bits_uop_pdInfo_valid(regRead_io_exeReqs_1_bits_uop_pdInfo_valid),
    .io_exeReqs_1_bits_uop_pdInfo_isBr(regRead_io_exeReqs_1_bits_uop_pdInfo_isBr),
    .io_exeReqs_1_bits_uop_pdInfo_isJal(regRead_io_exeReqs_1_bits_uop_pdInfo_isJal),
    .io_exeReqs_1_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_1_bits_uop_pdInfo_isJalr),
    .io_exeReqs_1_bits_uop_pdInfo_isCall(regRead_io_exeReqs_1_bits_uop_pdInfo_isCall),
    .io_exeReqs_1_bits_uop_pdInfo_isRet(regRead_io_exeReqs_1_bits_uop_pdInfo_isRet),
    .io_exeReqs_1_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_1_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_1_bits_uop_bpuInfo_pc(regRead_io_exeReqs_1_bits_uop_bpuInfo_pc),
    .io_exeReqs_1_bits_uop_bpuInfo_fallThrough(regRead_io_exeReqs_1_bits_uop_bpuInfo_fallThrough),
    .io_exeReqs_1_bits_uop_bpuInfo_taken(regRead_io_exeReqs_1_bits_uop_bpuInfo_taken),
    .io_exeReqs_1_bits_uop_bpuInfo_target(regRead_io_exeReqs_1_bits_uop_bpuInfo_target),
    .io_exeReqs_1_bits_uop_bpuInfo_takenOffset(regRead_io_exeReqs_1_bits_uop_bpuInfo_takenOffset),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_valid(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_valid),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_btbHit(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbHit),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJalr(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJal(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJal),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsCall(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsCall),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsRet(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsRet),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_btbOffset(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbOffset),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_phtCounter(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_phtCounter),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_rasTop(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_rasTop),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_predTaken(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_predTaken),
    .io_exeReqs_1_bits_uop_bpuInfo_meta_predTarget(regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_predTarget),
    .io_exeReqs_1_bits_uop_ldst(regRead_io_exeReqs_1_bits_uop_ldst),
    .io_exeReqs_1_bits_uop_lrs1(regRead_io_exeReqs_1_bits_uop_lrs1),
    .io_exeReqs_1_bits_uop_lrs2(regRead_io_exeReqs_1_bits_uop_lrs2),
    .io_exeReqs_1_bits_uop_pdst(regRead_io_exeReqs_1_bits_uop_pdst),
    .io_exeReqs_1_bits_uop_prs1(regRead_io_exeReqs_1_bits_uop_prs1),
    .io_exeReqs_1_bits_uop_prs2(regRead_io_exeReqs_1_bits_uop_prs2),
    .io_exeReqs_1_bits_uop_oldPdst(regRead_io_exeReqs_1_bits_uop_oldPdst),
    .io_exeReqs_1_bits_uop_rs1Valid(regRead_io_exeReqs_1_bits_uop_rs1Valid),
    .io_exeReqs_1_bits_uop_rs2Valid(regRead_io_exeReqs_1_bits_uop_rs2Valid),
    .io_exeReqs_1_bits_uop_rdValid(regRead_io_exeReqs_1_bits_uop_rdValid),
    .io_exeReqs_1_bits_uop_snptId_valid(regRead_io_exeReqs_1_bits_uop_snptId_valid),
    .io_exeReqs_1_bits_uop_snptId_bits(regRead_io_exeReqs_1_bits_uop_snptId_bits),
    .io_exeReqs_1_bits_uop_robIdx_value(regRead_io_exeReqs_1_bits_uop_robIdx_value),
    .io_exeReqs_1_bits_uop_robIdx_flag(regRead_io_exeReqs_1_bits_uop_robIdx_flag),
    .io_exeReqs_1_bits_uop_robIdxFull_value(regRead_io_exeReqs_1_bits_uop_robIdxFull_value),
    .io_exeReqs_1_bits_uop_robIdxFull_flag(regRead_io_exeReqs_1_bits_uop_robIdxFull_flag),
    .io_exeReqs_1_bits_uop_issueQueue(regRead_io_exeReqs_1_bits_uop_issueQueue),
    .io_exeReqs_1_bits_uop_prs1Busy(regRead_io_exeReqs_1_bits_uop_prs1Busy),
    .io_exeReqs_1_bits_uop_prs2Busy(regRead_io_exeReqs_1_bits_uop_prs2Busy),
    .io_exeReqs_1_bits_rs1Data(regRead_io_exeReqs_1_bits_rs1Data),
    .io_exeReqs_1_bits_rs2Data(regRead_io_exeReqs_1_bits_rs2Data),
    .io_exeReqs_2_ready(regRead_io_exeReqs_2_ready),
    .io_exeReqs_2_valid(regRead_io_exeReqs_2_valid),
    .io_exeReqs_2_bits_uop_pc(regRead_io_exeReqs_2_bits_uop_pc),
    .io_exeReqs_2_bits_uop_inst(regRead_io_exeReqs_2_bits_uop_inst),
    .io_exeReqs_2_bits_uop_ctrl_fuType(regRead_io_exeReqs_2_bits_uop_ctrl_fuType),
    .io_exeReqs_2_bits_uop_ctrl_aluOp(regRead_io_exeReqs_2_bits_uop_ctrl_aluOp),
    .io_exeReqs_2_bits_uop_ctrl_bruOp(regRead_io_exeReqs_2_bits_uop_ctrl_bruOp),
    .io_exeReqs_2_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_2_bits_uop_ctrl_lsuOp),
    .io_exeReqs_2_bits_uop_ctrl_csrOp(regRead_io_exeReqs_2_bits_uop_ctrl_csrOp),
    .io_exeReqs_2_bits_uop_ctrl_mulOp(regRead_io_exeReqs_2_bits_uop_ctrl_mulOp),
    .io_exeReqs_2_bits_uop_ctrl_divOp(regRead_io_exeReqs_2_bits_uop_ctrl_divOp),
    .io_exeReqs_2_bits_uop_ctrl_src1Type(regRead_io_exeReqs_2_bits_uop_ctrl_src1Type),
    .io_exeReqs_2_bits_uop_ctrl_src2Type(regRead_io_exeReqs_2_bits_uop_ctrl_src2Type),
    .io_exeReqs_2_bits_uop_ctrl_immType(regRead_io_exeReqs_2_bits_uop_ctrl_immType),
    .io_exeReqs_2_bits_uop_ctrl_rfWen(regRead_io_exeReqs_2_bits_uop_ctrl_rfWen),
    .io_exeReqs_2_bits_uop_ctrl_memRead(regRead_io_exeReqs_2_bits_uop_ctrl_memRead),
    .io_exeReqs_2_bits_uop_ctrl_memWrite(regRead_io_exeReqs_2_bits_uop_ctrl_memWrite),
    .io_exeReqs_2_bits_uop_ctrl_csrWen(regRead_io_exeReqs_2_bits_uop_ctrl_csrWen),
    .io_exeReqs_2_bits_uop_ctrl_isBranch(regRead_io_exeReqs_2_bits_uop_ctrl_isBranch),
    .io_exeReqs_2_bits_uop_ctrl_isJump(regRead_io_exeReqs_2_bits_uop_ctrl_isJump),
    .io_exeReqs_2_bits_uop_ctrl_isPriv(regRead_io_exeReqs_2_bits_uop_ctrl_isPriv),
    .io_exeReqs_2_bits_uop_excp_excpVec(regRead_io_exeReqs_2_bits_uop_excp_excpVec),
    .io_exeReqs_2_bits_uop_imm(regRead_io_exeReqs_2_bits_uop_imm),
    .io_exeReqs_2_bits_uop_csrAddress(regRead_io_exeReqs_2_bits_uop_csrAddress),
    .io_exeReqs_2_bits_uop_pdInfo_valid(regRead_io_exeReqs_2_bits_uop_pdInfo_valid),
    .io_exeReqs_2_bits_uop_pdInfo_isBr(regRead_io_exeReqs_2_bits_uop_pdInfo_isBr),
    .io_exeReqs_2_bits_uop_pdInfo_isJal(regRead_io_exeReqs_2_bits_uop_pdInfo_isJal),
    .io_exeReqs_2_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_2_bits_uop_pdInfo_isJalr),
    .io_exeReqs_2_bits_uop_pdInfo_isCall(regRead_io_exeReqs_2_bits_uop_pdInfo_isCall),
    .io_exeReqs_2_bits_uop_pdInfo_isRet(regRead_io_exeReqs_2_bits_uop_pdInfo_isRet),
    .io_exeReqs_2_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_2_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_2_bits_uop_bpuInfo_pc(regRead_io_exeReqs_2_bits_uop_bpuInfo_pc),
    .io_exeReqs_2_bits_uop_bpuInfo_fallThrough(regRead_io_exeReqs_2_bits_uop_bpuInfo_fallThrough),
    .io_exeReqs_2_bits_uop_bpuInfo_taken(regRead_io_exeReqs_2_bits_uop_bpuInfo_taken),
    .io_exeReqs_2_bits_uop_bpuInfo_target(regRead_io_exeReqs_2_bits_uop_bpuInfo_target),
    .io_exeReqs_2_bits_uop_bpuInfo_takenOffset(regRead_io_exeReqs_2_bits_uop_bpuInfo_takenOffset),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_valid(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_valid),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_btbHit(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbHit),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJalr(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJal(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJal),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsCall(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsCall),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsRet(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsRet),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_btbOffset(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbOffset),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_phtCounter(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_phtCounter),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_rasTop(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_rasTop),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_predTaken(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_predTaken),
    .io_exeReqs_2_bits_uop_bpuInfo_meta_predTarget(regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_predTarget),
    .io_exeReqs_2_bits_uop_ldst(regRead_io_exeReqs_2_bits_uop_ldst),
    .io_exeReqs_2_bits_uop_lrs1(regRead_io_exeReqs_2_bits_uop_lrs1),
    .io_exeReqs_2_bits_uop_lrs2(regRead_io_exeReqs_2_bits_uop_lrs2),
    .io_exeReqs_2_bits_uop_pdst(regRead_io_exeReqs_2_bits_uop_pdst),
    .io_exeReqs_2_bits_uop_prs1(regRead_io_exeReqs_2_bits_uop_prs1),
    .io_exeReqs_2_bits_uop_prs2(regRead_io_exeReqs_2_bits_uop_prs2),
    .io_exeReqs_2_bits_uop_oldPdst(regRead_io_exeReqs_2_bits_uop_oldPdst),
    .io_exeReqs_2_bits_uop_rs1Valid(regRead_io_exeReqs_2_bits_uop_rs1Valid),
    .io_exeReqs_2_bits_uop_rs2Valid(regRead_io_exeReqs_2_bits_uop_rs2Valid),
    .io_exeReqs_2_bits_uop_rdValid(regRead_io_exeReqs_2_bits_uop_rdValid),
    .io_exeReqs_2_bits_uop_snptId_valid(regRead_io_exeReqs_2_bits_uop_snptId_valid),
    .io_exeReqs_2_bits_uop_snptId_bits(regRead_io_exeReqs_2_bits_uop_snptId_bits),
    .io_exeReqs_2_bits_uop_robIdx_value(regRead_io_exeReqs_2_bits_uop_robIdx_value),
    .io_exeReqs_2_bits_uop_robIdx_flag(regRead_io_exeReqs_2_bits_uop_robIdx_flag),
    .io_exeReqs_2_bits_uop_robIdxFull_value(regRead_io_exeReqs_2_bits_uop_robIdxFull_value),
    .io_exeReqs_2_bits_uop_robIdxFull_flag(regRead_io_exeReqs_2_bits_uop_robIdxFull_flag),
    .io_exeReqs_2_bits_uop_lqIdx_value(regRead_io_exeReqs_2_bits_uop_lqIdx_value),
    .io_exeReqs_2_bits_uop_lqIdx_flag(regRead_io_exeReqs_2_bits_uop_lqIdx_flag),
    .io_exeReqs_2_bits_uop_sqIdx_value(regRead_io_exeReqs_2_bits_uop_sqIdx_value),
    .io_exeReqs_2_bits_uop_sqIdx_flag(regRead_io_exeReqs_2_bits_uop_sqIdx_flag),
    .io_exeReqs_2_bits_uop_issueQueue(regRead_io_exeReqs_2_bits_uop_issueQueue),
    .io_exeReqs_2_bits_uop_prs1Busy(regRead_io_exeReqs_2_bits_uop_prs1Busy),
    .io_exeReqs_2_bits_uop_prs2Busy(regRead_io_exeReqs_2_bits_uop_prs2Busy),
    .io_exeReqs_2_bits_uop_isSta(regRead_io_exeReqs_2_bits_uop_isSta),
    .io_exeReqs_2_bits_uop_isStd(regRead_io_exeReqs_2_bits_uop_isStd),
    .io_exeReqs_2_bits_rs1Data(regRead_io_exeReqs_2_bits_rs1Data),
    .io_exeReqs_2_bits_rs2Data(regRead_io_exeReqs_2_bits_rs2Data),
    .io_exeReqs_3_ready(regRead_io_exeReqs_3_ready),
    .io_exeReqs_3_valid(regRead_io_exeReqs_3_valid),
    .io_exeReqs_3_bits_uop_pc(regRead_io_exeReqs_3_bits_uop_pc),
    .io_exeReqs_3_bits_uop_inst(regRead_io_exeReqs_3_bits_uop_inst),
    .io_exeReqs_3_bits_uop_ctrl_fuType(regRead_io_exeReqs_3_bits_uop_ctrl_fuType),
    .io_exeReqs_3_bits_uop_ctrl_aluOp(regRead_io_exeReqs_3_bits_uop_ctrl_aluOp),
    .io_exeReqs_3_bits_uop_ctrl_bruOp(regRead_io_exeReqs_3_bits_uop_ctrl_bruOp),
    .io_exeReqs_3_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_3_bits_uop_ctrl_lsuOp),
    .io_exeReqs_3_bits_uop_ctrl_csrOp(regRead_io_exeReqs_3_bits_uop_ctrl_csrOp),
    .io_exeReqs_3_bits_uop_ctrl_mulOp(regRead_io_exeReqs_3_bits_uop_ctrl_mulOp),
    .io_exeReqs_3_bits_uop_ctrl_divOp(regRead_io_exeReqs_3_bits_uop_ctrl_divOp),
    .io_exeReqs_3_bits_uop_ctrl_src1Type(regRead_io_exeReqs_3_bits_uop_ctrl_src1Type),
    .io_exeReqs_3_bits_uop_ctrl_src2Type(regRead_io_exeReqs_3_bits_uop_ctrl_src2Type),
    .io_exeReqs_3_bits_uop_ctrl_immType(regRead_io_exeReqs_3_bits_uop_ctrl_immType),
    .io_exeReqs_3_bits_uop_ctrl_rfWen(regRead_io_exeReqs_3_bits_uop_ctrl_rfWen),
    .io_exeReqs_3_bits_uop_ctrl_memRead(regRead_io_exeReqs_3_bits_uop_ctrl_memRead),
    .io_exeReqs_3_bits_uop_ctrl_memWrite(regRead_io_exeReqs_3_bits_uop_ctrl_memWrite),
    .io_exeReqs_3_bits_uop_ctrl_csrWen(regRead_io_exeReqs_3_bits_uop_ctrl_csrWen),
    .io_exeReqs_3_bits_uop_ctrl_isBranch(regRead_io_exeReqs_3_bits_uop_ctrl_isBranch),
    .io_exeReqs_3_bits_uop_ctrl_isJump(regRead_io_exeReqs_3_bits_uop_ctrl_isJump),
    .io_exeReqs_3_bits_uop_ctrl_isPriv(regRead_io_exeReqs_3_bits_uop_ctrl_isPriv),
    .io_exeReqs_3_bits_uop_excp_excpVec(regRead_io_exeReqs_3_bits_uop_excp_excpVec),
    .io_exeReqs_3_bits_uop_imm(regRead_io_exeReqs_3_bits_uop_imm),
    .io_exeReqs_3_bits_uop_csrAddress(regRead_io_exeReqs_3_bits_uop_csrAddress),
    .io_exeReqs_3_bits_uop_pdInfo_valid(regRead_io_exeReqs_3_bits_uop_pdInfo_valid),
    .io_exeReqs_3_bits_uop_pdInfo_isBr(regRead_io_exeReqs_3_bits_uop_pdInfo_isBr),
    .io_exeReqs_3_bits_uop_pdInfo_isJal(regRead_io_exeReqs_3_bits_uop_pdInfo_isJal),
    .io_exeReqs_3_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_3_bits_uop_pdInfo_isJalr),
    .io_exeReqs_3_bits_uop_pdInfo_isCall(regRead_io_exeReqs_3_bits_uop_pdInfo_isCall),
    .io_exeReqs_3_bits_uop_pdInfo_isRet(regRead_io_exeReqs_3_bits_uop_pdInfo_isRet),
    .io_exeReqs_3_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_3_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_3_bits_uop_bpuInfo_pc(regRead_io_exeReqs_3_bits_uop_bpuInfo_pc),
    .io_exeReqs_3_bits_uop_bpuInfo_fallThrough(regRead_io_exeReqs_3_bits_uop_bpuInfo_fallThrough),
    .io_exeReqs_3_bits_uop_bpuInfo_taken(regRead_io_exeReqs_3_bits_uop_bpuInfo_taken),
    .io_exeReqs_3_bits_uop_bpuInfo_target(regRead_io_exeReqs_3_bits_uop_bpuInfo_target),
    .io_exeReqs_3_bits_uop_bpuInfo_takenOffset(regRead_io_exeReqs_3_bits_uop_bpuInfo_takenOffset),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_valid(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_valid),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_btbHit(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbHit),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJalr(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJal(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJal),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsCall(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsCall),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsRet(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsRet),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_btbOffset(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbOffset),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_phtCounter(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_phtCounter),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_rasTop(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_rasTop),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_predTaken(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_predTaken),
    .io_exeReqs_3_bits_uop_bpuInfo_meta_predTarget(regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_predTarget),
    .io_exeReqs_3_bits_uop_ldst(regRead_io_exeReqs_3_bits_uop_ldst),
    .io_exeReqs_3_bits_uop_lrs1(regRead_io_exeReqs_3_bits_uop_lrs1),
    .io_exeReqs_3_bits_uop_lrs2(regRead_io_exeReqs_3_bits_uop_lrs2),
    .io_exeReqs_3_bits_uop_pdst(regRead_io_exeReqs_3_bits_uop_pdst),
    .io_exeReqs_3_bits_uop_prs1(regRead_io_exeReqs_3_bits_uop_prs1),
    .io_exeReqs_3_bits_uop_prs2(regRead_io_exeReqs_3_bits_uop_prs2),
    .io_exeReqs_3_bits_uop_oldPdst(regRead_io_exeReqs_3_bits_uop_oldPdst),
    .io_exeReqs_3_bits_uop_rs1Valid(regRead_io_exeReqs_3_bits_uop_rs1Valid),
    .io_exeReqs_3_bits_uop_rs2Valid(regRead_io_exeReqs_3_bits_uop_rs2Valid),
    .io_exeReqs_3_bits_uop_rdValid(regRead_io_exeReqs_3_bits_uop_rdValid),
    .io_exeReqs_3_bits_uop_snptId_valid(regRead_io_exeReqs_3_bits_uop_snptId_valid),
    .io_exeReqs_3_bits_uop_snptId_bits(regRead_io_exeReqs_3_bits_uop_snptId_bits),
    .io_exeReqs_3_bits_uop_robIdx_value(regRead_io_exeReqs_3_bits_uop_robIdx_value),
    .io_exeReqs_3_bits_uop_robIdx_flag(regRead_io_exeReqs_3_bits_uop_robIdx_flag),
    .io_exeReqs_3_bits_uop_robIdxFull_value(regRead_io_exeReqs_3_bits_uop_robIdxFull_value),
    .io_exeReqs_3_bits_uop_robIdxFull_flag(regRead_io_exeReqs_3_bits_uop_robIdxFull_flag),
    .io_exeReqs_3_bits_uop_lqIdx_value(regRead_io_exeReqs_3_bits_uop_lqIdx_value),
    .io_exeReqs_3_bits_uop_lqIdx_flag(regRead_io_exeReqs_3_bits_uop_lqIdx_flag),
    .io_exeReqs_3_bits_uop_sqIdx_value(regRead_io_exeReqs_3_bits_uop_sqIdx_value),
    .io_exeReqs_3_bits_uop_sqIdx_flag(regRead_io_exeReqs_3_bits_uop_sqIdx_flag),
    .io_exeReqs_3_bits_uop_issueQueue(regRead_io_exeReqs_3_bits_uop_issueQueue),
    .io_exeReqs_3_bits_uop_prs1Busy(regRead_io_exeReqs_3_bits_uop_prs1Busy),
    .io_exeReqs_3_bits_uop_prs2Busy(regRead_io_exeReqs_3_bits_uop_prs2Busy),
    .io_exeReqs_3_bits_uop_isSta(regRead_io_exeReqs_3_bits_uop_isSta),
    .io_exeReqs_3_bits_uop_isStd(regRead_io_exeReqs_3_bits_uop_isStd),
    .io_exeReqs_3_bits_rs1Data(regRead_io_exeReqs_3_bits_rs1Data),
    .io_exeReqs_3_bits_rs2Data(regRead_io_exeReqs_3_bits_rs2Data),
    .io_exeReqs_4_ready(regRead_io_exeReqs_4_ready),
    .io_exeReqs_4_valid(regRead_io_exeReqs_4_valid),
    .io_exeReqs_4_bits_uop_pc(regRead_io_exeReqs_4_bits_uop_pc),
    .io_exeReqs_4_bits_uop_inst(regRead_io_exeReqs_4_bits_uop_inst),
    .io_exeReqs_4_bits_uop_ctrl_fuType(regRead_io_exeReqs_4_bits_uop_ctrl_fuType),
    .io_exeReqs_4_bits_uop_ctrl_aluOp(regRead_io_exeReqs_4_bits_uop_ctrl_aluOp),
    .io_exeReqs_4_bits_uop_ctrl_bruOp(regRead_io_exeReqs_4_bits_uop_ctrl_bruOp),
    .io_exeReqs_4_bits_uop_ctrl_lsuOp(regRead_io_exeReqs_4_bits_uop_ctrl_lsuOp),
    .io_exeReqs_4_bits_uop_ctrl_csrOp(regRead_io_exeReqs_4_bits_uop_ctrl_csrOp),
    .io_exeReqs_4_bits_uop_ctrl_mulOp(regRead_io_exeReqs_4_bits_uop_ctrl_mulOp),
    .io_exeReqs_4_bits_uop_ctrl_divOp(regRead_io_exeReqs_4_bits_uop_ctrl_divOp),
    .io_exeReqs_4_bits_uop_ctrl_src1Type(regRead_io_exeReqs_4_bits_uop_ctrl_src1Type),
    .io_exeReqs_4_bits_uop_ctrl_src2Type(regRead_io_exeReqs_4_bits_uop_ctrl_src2Type),
    .io_exeReqs_4_bits_uop_ctrl_immType(regRead_io_exeReqs_4_bits_uop_ctrl_immType),
    .io_exeReqs_4_bits_uop_ctrl_rfWen(regRead_io_exeReqs_4_bits_uop_ctrl_rfWen),
    .io_exeReqs_4_bits_uop_ctrl_memRead(regRead_io_exeReqs_4_bits_uop_ctrl_memRead),
    .io_exeReqs_4_bits_uop_ctrl_memWrite(regRead_io_exeReqs_4_bits_uop_ctrl_memWrite),
    .io_exeReqs_4_bits_uop_ctrl_csrWen(regRead_io_exeReqs_4_bits_uop_ctrl_csrWen),
    .io_exeReqs_4_bits_uop_ctrl_isBranch(regRead_io_exeReqs_4_bits_uop_ctrl_isBranch),
    .io_exeReqs_4_bits_uop_ctrl_isJump(regRead_io_exeReqs_4_bits_uop_ctrl_isJump),
    .io_exeReqs_4_bits_uop_ctrl_isPriv(regRead_io_exeReqs_4_bits_uop_ctrl_isPriv),
    .io_exeReqs_4_bits_uop_excp_excpVec(regRead_io_exeReqs_4_bits_uop_excp_excpVec),
    .io_exeReqs_4_bits_uop_imm(regRead_io_exeReqs_4_bits_uop_imm),
    .io_exeReqs_4_bits_uop_csrAddress(regRead_io_exeReqs_4_bits_uop_csrAddress),
    .io_exeReqs_4_bits_uop_pdInfo_valid(regRead_io_exeReqs_4_bits_uop_pdInfo_valid),
    .io_exeReqs_4_bits_uop_pdInfo_isBr(regRead_io_exeReqs_4_bits_uop_pdInfo_isBr),
    .io_exeReqs_4_bits_uop_pdInfo_isJal(regRead_io_exeReqs_4_bits_uop_pdInfo_isJal),
    .io_exeReqs_4_bits_uop_pdInfo_isJalr(regRead_io_exeReqs_4_bits_uop_pdInfo_isJalr),
    .io_exeReqs_4_bits_uop_pdInfo_isCall(regRead_io_exeReqs_4_bits_uop_pdInfo_isCall),
    .io_exeReqs_4_bits_uop_pdInfo_isRet(regRead_io_exeReqs_4_bits_uop_pdInfo_isRet),
    .io_exeReqs_4_bits_uop_pdInfo_jumpTarget(regRead_io_exeReqs_4_bits_uop_pdInfo_jumpTarget),
    .io_exeReqs_4_bits_uop_bpuInfo_pc(regRead_io_exeReqs_4_bits_uop_bpuInfo_pc),
    .io_exeReqs_4_bits_uop_bpuInfo_fallThrough(regRead_io_exeReqs_4_bits_uop_bpuInfo_fallThrough),
    .io_exeReqs_4_bits_uop_bpuInfo_taken(regRead_io_exeReqs_4_bits_uop_bpuInfo_taken),
    .io_exeReqs_4_bits_uop_bpuInfo_target(regRead_io_exeReqs_4_bits_uop_bpuInfo_target),
    .io_exeReqs_4_bits_uop_bpuInfo_takenOffset(regRead_io_exeReqs_4_bits_uop_bpuInfo_takenOffset),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_valid(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_valid),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_btbHit(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbHit),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJalr(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJal(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJal),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsCall(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsCall),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsRet(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsRet),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_btbOffset(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbOffset),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_phtCounter(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_phtCounter),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_rasTop(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_rasTop),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_predTaken(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_predTaken),
    .io_exeReqs_4_bits_uop_bpuInfo_meta_predTarget(regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_predTarget),
    .io_exeReqs_4_bits_uop_ldst(regRead_io_exeReqs_4_bits_uop_ldst),
    .io_exeReqs_4_bits_uop_lrs1(regRead_io_exeReqs_4_bits_uop_lrs1),
    .io_exeReqs_4_bits_uop_lrs2(regRead_io_exeReqs_4_bits_uop_lrs2),
    .io_exeReqs_4_bits_uop_pdst(regRead_io_exeReqs_4_bits_uop_pdst),
    .io_exeReqs_4_bits_uop_prs1(regRead_io_exeReqs_4_bits_uop_prs1),
    .io_exeReqs_4_bits_uop_prs2(regRead_io_exeReqs_4_bits_uop_prs2),
    .io_exeReqs_4_bits_uop_oldPdst(regRead_io_exeReqs_4_bits_uop_oldPdst),
    .io_exeReqs_4_bits_uop_rs1Valid(regRead_io_exeReqs_4_bits_uop_rs1Valid),
    .io_exeReqs_4_bits_uop_rs2Valid(regRead_io_exeReqs_4_bits_uop_rs2Valid),
    .io_exeReqs_4_bits_uop_rdValid(regRead_io_exeReqs_4_bits_uop_rdValid),
    .io_exeReqs_4_bits_uop_snptId_valid(regRead_io_exeReqs_4_bits_uop_snptId_valid),
    .io_exeReqs_4_bits_uop_snptId_bits(regRead_io_exeReqs_4_bits_uop_snptId_bits),
    .io_exeReqs_4_bits_uop_robIdx_value(regRead_io_exeReqs_4_bits_uop_robIdx_value),
    .io_exeReqs_4_bits_uop_robIdx_flag(regRead_io_exeReqs_4_bits_uop_robIdx_flag),
    .io_exeReqs_4_bits_uop_robIdxFull_value(regRead_io_exeReqs_4_bits_uop_robIdxFull_value),
    .io_exeReqs_4_bits_uop_robIdxFull_flag(regRead_io_exeReqs_4_bits_uop_robIdxFull_flag),
    .io_exeReqs_4_bits_uop_lqIdx_value(regRead_io_exeReqs_4_bits_uop_lqIdx_value),
    .io_exeReqs_4_bits_uop_lqIdx_flag(regRead_io_exeReqs_4_bits_uop_lqIdx_flag),
    .io_exeReqs_4_bits_uop_sqIdx_value(regRead_io_exeReqs_4_bits_uop_sqIdx_value),
    .io_exeReqs_4_bits_uop_sqIdx_flag(regRead_io_exeReqs_4_bits_uop_sqIdx_flag),
    .io_exeReqs_4_bits_uop_issueQueue(regRead_io_exeReqs_4_bits_uop_issueQueue),
    .io_exeReqs_4_bits_uop_prs1Busy(regRead_io_exeReqs_4_bits_uop_prs1Busy),
    .io_exeReqs_4_bits_uop_prs2Busy(regRead_io_exeReqs_4_bits_uop_prs2Busy),
    .io_exeReqs_4_bits_uop_isSta(regRead_io_exeReqs_4_bits_uop_isSta),
    .io_exeReqs_4_bits_uop_isStd(regRead_io_exeReqs_4_bits_uop_isStd),
    .io_exeReqs_4_bits_rs2Data(regRead_io_exeReqs_4_bits_rs2Data),
    .io_redirectInfo_valid(regRead_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(regRead_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(regRead_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(regRead_io_redirectInfo_bits_robIdx_flag)
  );
  RegFile regFile ( // @[src/main/scala/backend/Backend.scala 64:27]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_readPorts_0_addr(regFile_io_readPorts_0_addr),
    .io_readPorts_0_data(regFile_io_readPorts_0_data),
    .io_readPorts_1_addr(regFile_io_readPorts_1_addr),
    .io_readPorts_1_data(regFile_io_readPorts_1_data),
    .io_readPorts_2_addr(regFile_io_readPorts_2_addr),
    .io_readPorts_2_data(regFile_io_readPorts_2_data),
    .io_readPorts_3_addr(regFile_io_readPorts_3_addr),
    .io_readPorts_3_data(regFile_io_readPorts_3_data),
    .io_readPorts_4_addr(regFile_io_readPorts_4_addr),
    .io_readPorts_4_data(regFile_io_readPorts_4_data),
    .io_readPorts_5_addr(regFile_io_readPorts_5_addr),
    .io_readPorts_5_data(regFile_io_readPorts_5_data),
    .io_readPorts_6_addr(regFile_io_readPorts_6_addr),
    .io_readPorts_6_data(regFile_io_readPorts_6_data),
    .io_readPorts_7_addr(regFile_io_readPorts_7_addr),
    .io_readPorts_7_data(regFile_io_readPorts_7_data),
    .io_writePorts_0_valid(regFile_io_writePorts_0_valid),
    .io_writePorts_0_addr(regFile_io_writePorts_0_addr),
    .io_writePorts_0_data(regFile_io_writePorts_0_data),
    .io_writePorts_1_valid(regFile_io_writePorts_1_valid),
    .io_writePorts_1_addr(regFile_io_writePorts_1_addr),
    .io_writePorts_1_data(regFile_io_writePorts_1_data),
    .io_writePorts_2_valid(regFile_io_writePorts_2_valid),
    .io_writePorts_2_addr(regFile_io_writePorts_2_addr),
    .io_writePorts_2_data(regFile_io_writePorts_2_data),
    .io_writePorts_3_valid(regFile_io_writePorts_3_valid),
    .io_writePorts_3_addr(regFile_io_writePorts_3_addr),
    .io_writePorts_3_data(regFile_io_writePorts_3_data),
    .io_writePorts_4_valid(regFile_io_writePorts_4_valid),
    .io_writePorts_4_addr(regFile_io_writePorts_4_addr),
    .io_writePorts_4_data(regFile_io_writePorts_4_data)
  );
  ExeUnit exeUnits_0 ( // @[src/main/scala/backend/Backend.scala 83:11]
    .clock(exeUnits_0_clock),
    .reset(exeUnits_0_reset),
    .io_inReq_ready(exeUnits_0_io_inReq_ready),
    .io_inReq_valid(exeUnits_0_io_inReq_valid),
    .io_inReq_bits_uop_pc(exeUnits_0_io_inReq_bits_uop_pc),
    .io_inReq_bits_uop_inst(exeUnits_0_io_inReq_bits_uop_inst),
    .io_inReq_bits_uop_ctrl_fuType(exeUnits_0_io_inReq_bits_uop_ctrl_fuType),
    .io_inReq_bits_uop_ctrl_aluOp(exeUnits_0_io_inReq_bits_uop_ctrl_aluOp),
    .io_inReq_bits_uop_ctrl_bruOp(exeUnits_0_io_inReq_bits_uop_ctrl_bruOp),
    .io_inReq_bits_uop_ctrl_lsuOp(exeUnits_0_io_inReq_bits_uop_ctrl_lsuOp),
    .io_inReq_bits_uop_ctrl_csrOp(exeUnits_0_io_inReq_bits_uop_ctrl_csrOp),
    .io_inReq_bits_uop_ctrl_mulOp(exeUnits_0_io_inReq_bits_uop_ctrl_mulOp),
    .io_inReq_bits_uop_ctrl_divOp(exeUnits_0_io_inReq_bits_uop_ctrl_divOp),
    .io_inReq_bits_uop_ctrl_src1Type(exeUnits_0_io_inReq_bits_uop_ctrl_src1Type),
    .io_inReq_bits_uop_ctrl_src2Type(exeUnits_0_io_inReq_bits_uop_ctrl_src2Type),
    .io_inReq_bits_uop_ctrl_immType(exeUnits_0_io_inReq_bits_uop_ctrl_immType),
    .io_inReq_bits_uop_ctrl_rfWen(exeUnits_0_io_inReq_bits_uop_ctrl_rfWen),
    .io_inReq_bits_uop_ctrl_memRead(exeUnits_0_io_inReq_bits_uop_ctrl_memRead),
    .io_inReq_bits_uop_ctrl_memWrite(exeUnits_0_io_inReq_bits_uop_ctrl_memWrite),
    .io_inReq_bits_uop_ctrl_csrWen(exeUnits_0_io_inReq_bits_uop_ctrl_csrWen),
    .io_inReq_bits_uop_ctrl_isBranch(exeUnits_0_io_inReq_bits_uop_ctrl_isBranch),
    .io_inReq_bits_uop_ctrl_isJump(exeUnits_0_io_inReq_bits_uop_ctrl_isJump),
    .io_inReq_bits_uop_ctrl_isPriv(exeUnits_0_io_inReq_bits_uop_ctrl_isPriv),
    .io_inReq_bits_uop_excp_excpVec(exeUnits_0_io_inReq_bits_uop_excp_excpVec),
    .io_inReq_bits_uop_imm(exeUnits_0_io_inReq_bits_uop_imm),
    .io_inReq_bits_uop_csrAddress(exeUnits_0_io_inReq_bits_uop_csrAddress),
    .io_inReq_bits_uop_pdInfo_valid(exeUnits_0_io_inReq_bits_uop_pdInfo_valid),
    .io_inReq_bits_uop_pdInfo_isBr(exeUnits_0_io_inReq_bits_uop_pdInfo_isBr),
    .io_inReq_bits_uop_pdInfo_isJal(exeUnits_0_io_inReq_bits_uop_pdInfo_isJal),
    .io_inReq_bits_uop_pdInfo_isJalr(exeUnits_0_io_inReq_bits_uop_pdInfo_isJalr),
    .io_inReq_bits_uop_pdInfo_isCall(exeUnits_0_io_inReq_bits_uop_pdInfo_isCall),
    .io_inReq_bits_uop_pdInfo_isRet(exeUnits_0_io_inReq_bits_uop_pdInfo_isRet),
    .io_inReq_bits_uop_pdInfo_jumpTarget(exeUnits_0_io_inReq_bits_uop_pdInfo_jumpTarget),
    .io_inReq_bits_uop_bpuInfo_pc(exeUnits_0_io_inReq_bits_uop_bpuInfo_pc),
    .io_inReq_bits_uop_bpuInfo_fallThrough(exeUnits_0_io_inReq_bits_uop_bpuInfo_fallThrough),
    .io_inReq_bits_uop_bpuInfo_taken(exeUnits_0_io_inReq_bits_uop_bpuInfo_taken),
    .io_inReq_bits_uop_bpuInfo_target(exeUnits_0_io_inReq_bits_uop_bpuInfo_target),
    .io_inReq_bits_uop_bpuInfo_takenOffset(exeUnits_0_io_inReq_bits_uop_bpuInfo_takenOffset),
    .io_inReq_bits_uop_bpuInfo_meta_valid(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_valid),
    .io_inReq_bits_uop_bpuInfo_meta_btbHit(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbHit),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsJal),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsCall),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsRet),
    .io_inReq_bits_uop_bpuInfo_meta_btbOffset(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbOffset),
    .io_inReq_bits_uop_bpuInfo_meta_phtCounter(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_phtCounter),
    .io_inReq_bits_uop_bpuInfo_meta_rasTop(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_rasTop),
    .io_inReq_bits_uop_bpuInfo_meta_predTaken(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_predTaken),
    .io_inReq_bits_uop_bpuInfo_meta_predTarget(exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_predTarget),
    .io_inReq_bits_uop_ldst(exeUnits_0_io_inReq_bits_uop_ldst),
    .io_inReq_bits_uop_lrs1(exeUnits_0_io_inReq_bits_uop_lrs1),
    .io_inReq_bits_uop_lrs2(exeUnits_0_io_inReq_bits_uop_lrs2),
    .io_inReq_bits_uop_pdst(exeUnits_0_io_inReq_bits_uop_pdst),
    .io_inReq_bits_uop_prs1(exeUnits_0_io_inReq_bits_uop_prs1),
    .io_inReq_bits_uop_prs2(exeUnits_0_io_inReq_bits_uop_prs2),
    .io_inReq_bits_uop_oldPdst(exeUnits_0_io_inReq_bits_uop_oldPdst),
    .io_inReq_bits_uop_rs1Valid(exeUnits_0_io_inReq_bits_uop_rs1Valid),
    .io_inReq_bits_uop_rs2Valid(exeUnits_0_io_inReq_bits_uop_rs2Valid),
    .io_inReq_bits_uop_rdValid(exeUnits_0_io_inReq_bits_uop_rdValid),
    .io_inReq_bits_uop_snptId_valid(exeUnits_0_io_inReq_bits_uop_snptId_valid),
    .io_inReq_bits_uop_snptId_bits(exeUnits_0_io_inReq_bits_uop_snptId_bits),
    .io_inReq_bits_uop_robIdx_value(exeUnits_0_io_inReq_bits_uop_robIdx_value),
    .io_inReq_bits_uop_robIdx_flag(exeUnits_0_io_inReq_bits_uop_robIdx_flag),
    .io_inReq_bits_uop_robIdxFull_value(exeUnits_0_io_inReq_bits_uop_robIdxFull_value),
    .io_inReq_bits_uop_robIdxFull_flag(exeUnits_0_io_inReq_bits_uop_robIdxFull_flag),
    .io_inReq_bits_uop_lqIdx_value(exeUnits_0_io_inReq_bits_uop_lqIdx_value),
    .io_inReq_bits_uop_lqIdx_flag(exeUnits_0_io_inReq_bits_uop_lqIdx_flag),
    .io_inReq_bits_uop_sqIdx_value(exeUnits_0_io_inReq_bits_uop_sqIdx_value),
    .io_inReq_bits_uop_sqIdx_flag(exeUnits_0_io_inReq_bits_uop_sqIdx_flag),
    .io_inReq_bits_uop_issueQueue(exeUnits_0_io_inReq_bits_uop_issueQueue),
    .io_inReq_bits_uop_prs1Busy(exeUnits_0_io_inReq_bits_uop_prs1Busy),
    .io_inReq_bits_uop_prs2Busy(exeUnits_0_io_inReq_bits_uop_prs2Busy),
    .io_inReq_bits_uop_isSta(exeUnits_0_io_inReq_bits_uop_isSta),
    .io_inReq_bits_uop_isStd(exeUnits_0_io_inReq_bits_uop_isStd),
    .io_inReq_bits_rs1Data(exeUnits_0_io_inReq_bits_rs1Data),
    .io_inReq_bits_rs2Data(exeUnits_0_io_inReq_bits_rs2Data),
    .io_outResult_ready(exeUnits_0_io_outResult_ready),
    .io_outResult_valid(exeUnits_0_io_outResult_valid),
    .io_outResult_bits_uop_pc(exeUnits_0_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_inst(exeUnits_0_io_outResult_bits_uop_inst),
    .io_outResult_bits_uop_ctrl_fuType(exeUnits_0_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_aluOp(exeUnits_0_io_outResult_bits_uop_ctrl_aluOp),
    .io_outResult_bits_uop_ctrl_bruOp(exeUnits_0_io_outResult_bits_uop_ctrl_bruOp),
    .io_outResult_bits_uop_ctrl_lsuOp(exeUnits_0_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_ctrl_csrOp(exeUnits_0_io_outResult_bits_uop_ctrl_csrOp),
    .io_outResult_bits_uop_ctrl_mulOp(exeUnits_0_io_outResult_bits_uop_ctrl_mulOp),
    .io_outResult_bits_uop_ctrl_divOp(exeUnits_0_io_outResult_bits_uop_ctrl_divOp),
    .io_outResult_bits_uop_ctrl_src1Type(exeUnits_0_io_outResult_bits_uop_ctrl_src1Type),
    .io_outResult_bits_uop_ctrl_src2Type(exeUnits_0_io_outResult_bits_uop_ctrl_src2Type),
    .io_outResult_bits_uop_ctrl_immType(exeUnits_0_io_outResult_bits_uop_ctrl_immType),
    .io_outResult_bits_uop_ctrl_rfWen(exeUnits_0_io_outResult_bits_uop_ctrl_rfWen),
    .io_outResult_bits_uop_ctrl_memRead(exeUnits_0_io_outResult_bits_uop_ctrl_memRead),
    .io_outResult_bits_uop_ctrl_memWrite(exeUnits_0_io_outResult_bits_uop_ctrl_memWrite),
    .io_outResult_bits_uop_ctrl_csrWen(exeUnits_0_io_outResult_bits_uop_ctrl_csrWen),
    .io_outResult_bits_uop_ctrl_isBranch(exeUnits_0_io_outResult_bits_uop_ctrl_isBranch),
    .io_outResult_bits_uop_ctrl_isJump(exeUnits_0_io_outResult_bits_uop_ctrl_isJump),
    .io_outResult_bits_uop_ctrl_isPriv(exeUnits_0_io_outResult_bits_uop_ctrl_isPriv),
    .io_outResult_bits_uop_excp_excpVec(exeUnits_0_io_outResult_bits_uop_excp_excpVec),
    .io_outResult_bits_uop_imm(exeUnits_0_io_outResult_bits_uop_imm),
    .io_outResult_bits_uop_csrAddress(exeUnits_0_io_outResult_bits_uop_csrAddress),
    .io_outResult_bits_uop_pdInfo_valid(exeUnits_0_io_outResult_bits_uop_pdInfo_valid),
    .io_outResult_bits_uop_pdInfo_isBr(exeUnits_0_io_outResult_bits_uop_pdInfo_isBr),
    .io_outResult_bits_uop_pdInfo_isJal(exeUnits_0_io_outResult_bits_uop_pdInfo_isJal),
    .io_outResult_bits_uop_pdInfo_isJalr(exeUnits_0_io_outResult_bits_uop_pdInfo_isJalr),
    .io_outResult_bits_uop_pdInfo_isCall(exeUnits_0_io_outResult_bits_uop_pdInfo_isCall),
    .io_outResult_bits_uop_pdInfo_isRet(exeUnits_0_io_outResult_bits_uop_pdInfo_isRet),
    .io_outResult_bits_uop_pdInfo_jumpTarget(exeUnits_0_io_outResult_bits_uop_pdInfo_jumpTarget),
    .io_outResult_bits_uop_bpuInfo_pc(exeUnits_0_io_outResult_bits_uop_bpuInfo_pc),
    .io_outResult_bits_uop_bpuInfo_fallThrough(exeUnits_0_io_outResult_bits_uop_bpuInfo_fallThrough),
    .io_outResult_bits_uop_bpuInfo_taken(exeUnits_0_io_outResult_bits_uop_bpuInfo_taken),
    .io_outResult_bits_uop_bpuInfo_target(exeUnits_0_io_outResult_bits_uop_bpuInfo_target),
    .io_outResult_bits_uop_bpuInfo_takenOffset(exeUnits_0_io_outResult_bits_uop_bpuInfo_takenOffset),
    .io_outResult_bits_uop_bpuInfo_meta_valid(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_valid),
    .io_outResult_bits_uop_bpuInfo_meta_btbHit(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbHit),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsJal),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsCall),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsRet),
    .io_outResult_bits_uop_bpuInfo_meta_btbOffset(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbOffset),
    .io_outResult_bits_uop_bpuInfo_meta_phtCounter(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_phtCounter),
    .io_outResult_bits_uop_bpuInfo_meta_rasTop(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_rasTop),
    .io_outResult_bits_uop_bpuInfo_meta_predTaken(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_predTaken),
    .io_outResult_bits_uop_bpuInfo_meta_predTarget(exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_predTarget),
    .io_outResult_bits_uop_ldst(exeUnits_0_io_outResult_bits_uop_ldst),
    .io_outResult_bits_uop_lrs1(exeUnits_0_io_outResult_bits_uop_lrs1),
    .io_outResult_bits_uop_lrs2(exeUnits_0_io_outResult_bits_uop_lrs2),
    .io_outResult_bits_uop_pdst(exeUnits_0_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_prs1(exeUnits_0_io_outResult_bits_uop_prs1),
    .io_outResult_bits_uop_prs2(exeUnits_0_io_outResult_bits_uop_prs2),
    .io_outResult_bits_uop_oldPdst(exeUnits_0_io_outResult_bits_uop_oldPdst),
    .io_outResult_bits_uop_rs1Valid(exeUnits_0_io_outResult_bits_uop_rs1Valid),
    .io_outResult_bits_uop_rs2Valid(exeUnits_0_io_outResult_bits_uop_rs2Valid),
    .io_outResult_bits_uop_rdValid(exeUnits_0_io_outResult_bits_uop_rdValid),
    .io_outResult_bits_uop_snptId_valid(exeUnits_0_io_outResult_bits_uop_snptId_valid),
    .io_outResult_bits_uop_snptId_bits(exeUnits_0_io_outResult_bits_uop_snptId_bits),
    .io_outResult_bits_uop_robIdx_value(exeUnits_0_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(exeUnits_0_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(exeUnits_0_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(exeUnits_0_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(exeUnits_0_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_lqIdx_flag(exeUnits_0_io_outResult_bits_uop_lqIdx_flag),
    .io_outResult_bits_uop_sqIdx_value(exeUnits_0_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_uop_sqIdx_flag(exeUnits_0_io_outResult_bits_uop_sqIdx_flag),
    .io_outResult_bits_uop_issueQueue(exeUnits_0_io_outResult_bits_uop_issueQueue),
    .io_outResult_bits_uop_prs1Busy(exeUnits_0_io_outResult_bits_uop_prs1Busy),
    .io_outResult_bits_uop_prs2Busy(exeUnits_0_io_outResult_bits_uop_prs2Busy),
    .io_outResult_bits_uop_isSta(exeUnits_0_io_outResult_bits_uop_isSta),
    .io_outResult_bits_uop_isStd(exeUnits_0_io_outResult_bits_uop_isStd),
    .io_outResult_bits_data(exeUnits_0_io_outResult_bits_data),
    .io_outResult_bits_memStoreData(exeUnits_0_io_outResult_bits_memStoreData),
    .io_outResult_bits_csrWen(exeUnits_0_io_outResult_bits_csrWen),
    .io_outResult_bits_csrWaddr(exeUnits_0_io_outResult_bits_csrWaddr),
    .io_outResult_bits_csrWdata(exeUnits_0_io_outResult_bits_csrWdata),
    .io_outResult_bits_csrTimer(exeUnits_0_io_outResult_bits_csrTimer),
    .io_csrRaddr(exeUnits_0_io_csrRaddr),
    .io_csrRdata(exeUnits_0_io_csrRdata),
    .io_timerInfo_tid(exeUnits_0_io_timerInfo_tid),
    .io_timerInfo_timer(exeUnits_0_io_timerInfo_timer)
  );
  ExeUnit_1 exeUnits_1 ( // @[src/main/scala/backend/Backend.scala 84:11]
    .clock(exeUnits_1_clock),
    .reset(exeUnits_1_reset),
    .io_inReq_ready(exeUnits_1_io_inReq_ready),
    .io_inReq_valid(exeUnits_1_io_inReq_valid),
    .io_inReq_bits_uop_pc(exeUnits_1_io_inReq_bits_uop_pc),
    .io_inReq_bits_uop_inst(exeUnits_1_io_inReq_bits_uop_inst),
    .io_inReq_bits_uop_ctrl_fuType(exeUnits_1_io_inReq_bits_uop_ctrl_fuType),
    .io_inReq_bits_uop_ctrl_aluOp(exeUnits_1_io_inReq_bits_uop_ctrl_aluOp),
    .io_inReq_bits_uop_ctrl_bruOp(exeUnits_1_io_inReq_bits_uop_ctrl_bruOp),
    .io_inReq_bits_uop_ctrl_lsuOp(exeUnits_1_io_inReq_bits_uop_ctrl_lsuOp),
    .io_inReq_bits_uop_ctrl_csrOp(exeUnits_1_io_inReq_bits_uop_ctrl_csrOp),
    .io_inReq_bits_uop_ctrl_mulOp(exeUnits_1_io_inReq_bits_uop_ctrl_mulOp),
    .io_inReq_bits_uop_ctrl_divOp(exeUnits_1_io_inReq_bits_uop_ctrl_divOp),
    .io_inReq_bits_uop_ctrl_src1Type(exeUnits_1_io_inReq_bits_uop_ctrl_src1Type),
    .io_inReq_bits_uop_ctrl_src2Type(exeUnits_1_io_inReq_bits_uop_ctrl_src2Type),
    .io_inReq_bits_uop_ctrl_immType(exeUnits_1_io_inReq_bits_uop_ctrl_immType),
    .io_inReq_bits_uop_ctrl_rfWen(exeUnits_1_io_inReq_bits_uop_ctrl_rfWen),
    .io_inReq_bits_uop_ctrl_memRead(exeUnits_1_io_inReq_bits_uop_ctrl_memRead),
    .io_inReq_bits_uop_ctrl_memWrite(exeUnits_1_io_inReq_bits_uop_ctrl_memWrite),
    .io_inReq_bits_uop_ctrl_csrWen(exeUnits_1_io_inReq_bits_uop_ctrl_csrWen),
    .io_inReq_bits_uop_ctrl_isBranch(exeUnits_1_io_inReq_bits_uop_ctrl_isBranch),
    .io_inReq_bits_uop_ctrl_isJump(exeUnits_1_io_inReq_bits_uop_ctrl_isJump),
    .io_inReq_bits_uop_ctrl_isPriv(exeUnits_1_io_inReq_bits_uop_ctrl_isPriv),
    .io_inReq_bits_uop_excp_excpVec(exeUnits_1_io_inReq_bits_uop_excp_excpVec),
    .io_inReq_bits_uop_imm(exeUnits_1_io_inReq_bits_uop_imm),
    .io_inReq_bits_uop_csrAddress(exeUnits_1_io_inReq_bits_uop_csrAddress),
    .io_inReq_bits_uop_pdInfo_valid(exeUnits_1_io_inReq_bits_uop_pdInfo_valid),
    .io_inReq_bits_uop_pdInfo_isBr(exeUnits_1_io_inReq_bits_uop_pdInfo_isBr),
    .io_inReq_bits_uop_pdInfo_isJal(exeUnits_1_io_inReq_bits_uop_pdInfo_isJal),
    .io_inReq_bits_uop_pdInfo_isJalr(exeUnits_1_io_inReq_bits_uop_pdInfo_isJalr),
    .io_inReq_bits_uop_pdInfo_isCall(exeUnits_1_io_inReq_bits_uop_pdInfo_isCall),
    .io_inReq_bits_uop_pdInfo_isRet(exeUnits_1_io_inReq_bits_uop_pdInfo_isRet),
    .io_inReq_bits_uop_pdInfo_jumpTarget(exeUnits_1_io_inReq_bits_uop_pdInfo_jumpTarget),
    .io_inReq_bits_uop_bpuInfo_pc(exeUnits_1_io_inReq_bits_uop_bpuInfo_pc),
    .io_inReq_bits_uop_bpuInfo_fallThrough(exeUnits_1_io_inReq_bits_uop_bpuInfo_fallThrough),
    .io_inReq_bits_uop_bpuInfo_taken(exeUnits_1_io_inReq_bits_uop_bpuInfo_taken),
    .io_inReq_bits_uop_bpuInfo_target(exeUnits_1_io_inReq_bits_uop_bpuInfo_target),
    .io_inReq_bits_uop_bpuInfo_takenOffset(exeUnits_1_io_inReq_bits_uop_bpuInfo_takenOffset),
    .io_inReq_bits_uop_bpuInfo_meta_valid(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_valid),
    .io_inReq_bits_uop_bpuInfo_meta_btbHit(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbHit),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsJal),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsCall),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsRet),
    .io_inReq_bits_uop_bpuInfo_meta_btbOffset(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbOffset),
    .io_inReq_bits_uop_bpuInfo_meta_phtCounter(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_phtCounter),
    .io_inReq_bits_uop_bpuInfo_meta_rasTop(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_rasTop),
    .io_inReq_bits_uop_bpuInfo_meta_predTaken(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_predTaken),
    .io_inReq_bits_uop_bpuInfo_meta_predTarget(exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_predTarget),
    .io_inReq_bits_uop_ldst(exeUnits_1_io_inReq_bits_uop_ldst),
    .io_inReq_bits_uop_lrs1(exeUnits_1_io_inReq_bits_uop_lrs1),
    .io_inReq_bits_uop_lrs2(exeUnits_1_io_inReq_bits_uop_lrs2),
    .io_inReq_bits_uop_pdst(exeUnits_1_io_inReq_bits_uop_pdst),
    .io_inReq_bits_uop_prs1(exeUnits_1_io_inReq_bits_uop_prs1),
    .io_inReq_bits_uop_prs2(exeUnits_1_io_inReq_bits_uop_prs2),
    .io_inReq_bits_uop_oldPdst(exeUnits_1_io_inReq_bits_uop_oldPdst),
    .io_inReq_bits_uop_rs1Valid(exeUnits_1_io_inReq_bits_uop_rs1Valid),
    .io_inReq_bits_uop_rs2Valid(exeUnits_1_io_inReq_bits_uop_rs2Valid),
    .io_inReq_bits_uop_rdValid(exeUnits_1_io_inReq_bits_uop_rdValid),
    .io_inReq_bits_uop_snptId_valid(exeUnits_1_io_inReq_bits_uop_snptId_valid),
    .io_inReq_bits_uop_snptId_bits(exeUnits_1_io_inReq_bits_uop_snptId_bits),
    .io_inReq_bits_uop_robIdx_value(exeUnits_1_io_inReq_bits_uop_robIdx_value),
    .io_inReq_bits_uop_robIdx_flag(exeUnits_1_io_inReq_bits_uop_robIdx_flag),
    .io_inReq_bits_uop_robIdxFull_value(exeUnits_1_io_inReq_bits_uop_robIdxFull_value),
    .io_inReq_bits_uop_robIdxFull_flag(exeUnits_1_io_inReq_bits_uop_robIdxFull_flag),
    .io_inReq_bits_uop_issueQueue(exeUnits_1_io_inReq_bits_uop_issueQueue),
    .io_inReq_bits_uop_prs1Busy(exeUnits_1_io_inReq_bits_uop_prs1Busy),
    .io_inReq_bits_uop_prs2Busy(exeUnits_1_io_inReq_bits_uop_prs2Busy),
    .io_inReq_bits_rs1Data(exeUnits_1_io_inReq_bits_rs1Data),
    .io_inReq_bits_rs2Data(exeUnits_1_io_inReq_bits_rs2Data),
    .io_outResult_ready(exeUnits_1_io_outResult_ready),
    .io_outResult_valid(exeUnits_1_io_outResult_valid),
    .io_outResult_bits_uop_pc(exeUnits_1_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_inst(exeUnits_1_io_outResult_bits_uop_inst),
    .io_outResult_bits_uop_ctrl_fuType(exeUnits_1_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_aluOp(exeUnits_1_io_outResult_bits_uop_ctrl_aluOp),
    .io_outResult_bits_uop_ctrl_bruOp(exeUnits_1_io_outResult_bits_uop_ctrl_bruOp),
    .io_outResult_bits_uop_ctrl_lsuOp(exeUnits_1_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_ctrl_csrOp(exeUnits_1_io_outResult_bits_uop_ctrl_csrOp),
    .io_outResult_bits_uop_ctrl_mulOp(exeUnits_1_io_outResult_bits_uop_ctrl_mulOp),
    .io_outResult_bits_uop_ctrl_divOp(exeUnits_1_io_outResult_bits_uop_ctrl_divOp),
    .io_outResult_bits_uop_ctrl_src1Type(exeUnits_1_io_outResult_bits_uop_ctrl_src1Type),
    .io_outResult_bits_uop_ctrl_src2Type(exeUnits_1_io_outResult_bits_uop_ctrl_src2Type),
    .io_outResult_bits_uop_ctrl_immType(exeUnits_1_io_outResult_bits_uop_ctrl_immType),
    .io_outResult_bits_uop_ctrl_rfWen(exeUnits_1_io_outResult_bits_uop_ctrl_rfWen),
    .io_outResult_bits_uop_ctrl_memRead(exeUnits_1_io_outResult_bits_uop_ctrl_memRead),
    .io_outResult_bits_uop_ctrl_memWrite(exeUnits_1_io_outResult_bits_uop_ctrl_memWrite),
    .io_outResult_bits_uop_ctrl_csrWen(exeUnits_1_io_outResult_bits_uop_ctrl_csrWen),
    .io_outResult_bits_uop_ctrl_isBranch(exeUnits_1_io_outResult_bits_uop_ctrl_isBranch),
    .io_outResult_bits_uop_ctrl_isJump(exeUnits_1_io_outResult_bits_uop_ctrl_isJump),
    .io_outResult_bits_uop_ctrl_isPriv(exeUnits_1_io_outResult_bits_uop_ctrl_isPriv),
    .io_outResult_bits_uop_excp_excpVec(exeUnits_1_io_outResult_bits_uop_excp_excpVec),
    .io_outResult_bits_uop_imm(exeUnits_1_io_outResult_bits_uop_imm),
    .io_outResult_bits_uop_csrAddress(exeUnits_1_io_outResult_bits_uop_csrAddress),
    .io_outResult_bits_uop_pdInfo_valid(exeUnits_1_io_outResult_bits_uop_pdInfo_valid),
    .io_outResult_bits_uop_pdInfo_isBr(exeUnits_1_io_outResult_bits_uop_pdInfo_isBr),
    .io_outResult_bits_uop_pdInfo_isJal(exeUnits_1_io_outResult_bits_uop_pdInfo_isJal),
    .io_outResult_bits_uop_pdInfo_isJalr(exeUnits_1_io_outResult_bits_uop_pdInfo_isJalr),
    .io_outResult_bits_uop_pdInfo_isCall(exeUnits_1_io_outResult_bits_uop_pdInfo_isCall),
    .io_outResult_bits_uop_pdInfo_isRet(exeUnits_1_io_outResult_bits_uop_pdInfo_isRet),
    .io_outResult_bits_uop_pdInfo_jumpTarget(exeUnits_1_io_outResult_bits_uop_pdInfo_jumpTarget),
    .io_outResult_bits_uop_bpuInfo_pc(exeUnits_1_io_outResult_bits_uop_bpuInfo_pc),
    .io_outResult_bits_uop_bpuInfo_fallThrough(exeUnits_1_io_outResult_bits_uop_bpuInfo_fallThrough),
    .io_outResult_bits_uop_bpuInfo_taken(exeUnits_1_io_outResult_bits_uop_bpuInfo_taken),
    .io_outResult_bits_uop_bpuInfo_target(exeUnits_1_io_outResult_bits_uop_bpuInfo_target),
    .io_outResult_bits_uop_bpuInfo_takenOffset(exeUnits_1_io_outResult_bits_uop_bpuInfo_takenOffset),
    .io_outResult_bits_uop_bpuInfo_meta_valid(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_valid),
    .io_outResult_bits_uop_bpuInfo_meta_btbHit(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbHit),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsJal),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsCall),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsRet),
    .io_outResult_bits_uop_bpuInfo_meta_btbOffset(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbOffset),
    .io_outResult_bits_uop_bpuInfo_meta_phtCounter(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_phtCounter),
    .io_outResult_bits_uop_bpuInfo_meta_rasTop(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_rasTop),
    .io_outResult_bits_uop_bpuInfo_meta_predTaken(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_predTaken),
    .io_outResult_bits_uop_bpuInfo_meta_predTarget(exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_predTarget),
    .io_outResult_bits_uop_ldst(exeUnits_1_io_outResult_bits_uop_ldst),
    .io_outResult_bits_uop_lrs1(exeUnits_1_io_outResult_bits_uop_lrs1),
    .io_outResult_bits_uop_lrs2(exeUnits_1_io_outResult_bits_uop_lrs2),
    .io_outResult_bits_uop_pdst(exeUnits_1_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_prs1(exeUnits_1_io_outResult_bits_uop_prs1),
    .io_outResult_bits_uop_prs2(exeUnits_1_io_outResult_bits_uop_prs2),
    .io_outResult_bits_uop_oldPdst(exeUnits_1_io_outResult_bits_uop_oldPdst),
    .io_outResult_bits_uop_rs1Valid(exeUnits_1_io_outResult_bits_uop_rs1Valid),
    .io_outResult_bits_uop_rs2Valid(exeUnits_1_io_outResult_bits_uop_rs2Valid),
    .io_outResult_bits_uop_rdValid(exeUnits_1_io_outResult_bits_uop_rdValid),
    .io_outResult_bits_uop_snptId_valid(exeUnits_1_io_outResult_bits_uop_snptId_valid),
    .io_outResult_bits_uop_snptId_bits(exeUnits_1_io_outResult_bits_uop_snptId_bits),
    .io_outResult_bits_uop_robIdx_value(exeUnits_1_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(exeUnits_1_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(exeUnits_1_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(exeUnits_1_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_issueQueue(exeUnits_1_io_outResult_bits_uop_issueQueue),
    .io_outResult_bits_uop_prs1Busy(exeUnits_1_io_outResult_bits_uop_prs1Busy),
    .io_outResult_bits_uop_prs2Busy(exeUnits_1_io_outResult_bits_uop_prs2Busy),
    .io_outResult_bits_data(exeUnits_1_io_outResult_bits_data),
    .io_outResult_bits_memStoreData(exeUnits_1_io_outResult_bits_memStoreData),
    .io_redirectInfo_valid(exeUnits_1_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(exeUnits_1_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(exeUnits_1_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(exeUnits_1_io_redirectInfo_bits_robIdx_flag)
  );
  ExeUnit_2 exeUnits_2 ( // @[src/main/scala/backend/Backend.scala 85:11]
    .clock(exeUnits_2_clock),
    .reset(exeUnits_2_reset),
    .io_inReq_ready(exeUnits_2_io_inReq_ready),
    .io_inReq_valid(exeUnits_2_io_inReq_valid),
    .io_inReq_bits_uop_pc(exeUnits_2_io_inReq_bits_uop_pc),
    .io_inReq_bits_uop_inst(exeUnits_2_io_inReq_bits_uop_inst),
    .io_inReq_bits_uop_ctrl_fuType(exeUnits_2_io_inReq_bits_uop_ctrl_fuType),
    .io_inReq_bits_uop_ctrl_aluOp(exeUnits_2_io_inReq_bits_uop_ctrl_aluOp),
    .io_inReq_bits_uop_ctrl_bruOp(exeUnits_2_io_inReq_bits_uop_ctrl_bruOp),
    .io_inReq_bits_uop_ctrl_lsuOp(exeUnits_2_io_inReq_bits_uop_ctrl_lsuOp),
    .io_inReq_bits_uop_ctrl_csrOp(exeUnits_2_io_inReq_bits_uop_ctrl_csrOp),
    .io_inReq_bits_uop_ctrl_mulOp(exeUnits_2_io_inReq_bits_uop_ctrl_mulOp),
    .io_inReq_bits_uop_ctrl_divOp(exeUnits_2_io_inReq_bits_uop_ctrl_divOp),
    .io_inReq_bits_uop_ctrl_src1Type(exeUnits_2_io_inReq_bits_uop_ctrl_src1Type),
    .io_inReq_bits_uop_ctrl_src2Type(exeUnits_2_io_inReq_bits_uop_ctrl_src2Type),
    .io_inReq_bits_uop_ctrl_immType(exeUnits_2_io_inReq_bits_uop_ctrl_immType),
    .io_inReq_bits_uop_ctrl_rfWen(exeUnits_2_io_inReq_bits_uop_ctrl_rfWen),
    .io_inReq_bits_uop_ctrl_memRead(exeUnits_2_io_inReq_bits_uop_ctrl_memRead),
    .io_inReq_bits_uop_ctrl_memWrite(exeUnits_2_io_inReq_bits_uop_ctrl_memWrite),
    .io_inReq_bits_uop_ctrl_csrWen(exeUnits_2_io_inReq_bits_uop_ctrl_csrWen),
    .io_inReq_bits_uop_ctrl_isBranch(exeUnits_2_io_inReq_bits_uop_ctrl_isBranch),
    .io_inReq_bits_uop_ctrl_isJump(exeUnits_2_io_inReq_bits_uop_ctrl_isJump),
    .io_inReq_bits_uop_ctrl_isPriv(exeUnits_2_io_inReq_bits_uop_ctrl_isPriv),
    .io_inReq_bits_uop_excp_excpVec(exeUnits_2_io_inReq_bits_uop_excp_excpVec),
    .io_inReq_bits_uop_imm(exeUnits_2_io_inReq_bits_uop_imm),
    .io_inReq_bits_uop_csrAddress(exeUnits_2_io_inReq_bits_uop_csrAddress),
    .io_inReq_bits_uop_pdInfo_valid(exeUnits_2_io_inReq_bits_uop_pdInfo_valid),
    .io_inReq_bits_uop_pdInfo_isBr(exeUnits_2_io_inReq_bits_uop_pdInfo_isBr),
    .io_inReq_bits_uop_pdInfo_isJal(exeUnits_2_io_inReq_bits_uop_pdInfo_isJal),
    .io_inReq_bits_uop_pdInfo_isJalr(exeUnits_2_io_inReq_bits_uop_pdInfo_isJalr),
    .io_inReq_bits_uop_pdInfo_isCall(exeUnits_2_io_inReq_bits_uop_pdInfo_isCall),
    .io_inReq_bits_uop_pdInfo_isRet(exeUnits_2_io_inReq_bits_uop_pdInfo_isRet),
    .io_inReq_bits_uop_pdInfo_jumpTarget(exeUnits_2_io_inReq_bits_uop_pdInfo_jumpTarget),
    .io_inReq_bits_uop_bpuInfo_pc(exeUnits_2_io_inReq_bits_uop_bpuInfo_pc),
    .io_inReq_bits_uop_bpuInfo_fallThrough(exeUnits_2_io_inReq_bits_uop_bpuInfo_fallThrough),
    .io_inReq_bits_uop_bpuInfo_taken(exeUnits_2_io_inReq_bits_uop_bpuInfo_taken),
    .io_inReq_bits_uop_bpuInfo_target(exeUnits_2_io_inReq_bits_uop_bpuInfo_target),
    .io_inReq_bits_uop_bpuInfo_takenOffset(exeUnits_2_io_inReq_bits_uop_bpuInfo_takenOffset),
    .io_inReq_bits_uop_bpuInfo_meta_valid(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_valid),
    .io_inReq_bits_uop_bpuInfo_meta_btbHit(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbHit),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsJal),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsCall),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsRet),
    .io_inReq_bits_uop_bpuInfo_meta_btbOffset(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbOffset),
    .io_inReq_bits_uop_bpuInfo_meta_phtCounter(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_phtCounter),
    .io_inReq_bits_uop_bpuInfo_meta_rasTop(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_rasTop),
    .io_inReq_bits_uop_bpuInfo_meta_predTaken(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_predTaken),
    .io_inReq_bits_uop_bpuInfo_meta_predTarget(exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_predTarget),
    .io_inReq_bits_uop_ldst(exeUnits_2_io_inReq_bits_uop_ldst),
    .io_inReq_bits_uop_lrs1(exeUnits_2_io_inReq_bits_uop_lrs1),
    .io_inReq_bits_uop_lrs2(exeUnits_2_io_inReq_bits_uop_lrs2),
    .io_inReq_bits_uop_pdst(exeUnits_2_io_inReq_bits_uop_pdst),
    .io_inReq_bits_uop_prs1(exeUnits_2_io_inReq_bits_uop_prs1),
    .io_inReq_bits_uop_prs2(exeUnits_2_io_inReq_bits_uop_prs2),
    .io_inReq_bits_uop_oldPdst(exeUnits_2_io_inReq_bits_uop_oldPdst),
    .io_inReq_bits_uop_rs1Valid(exeUnits_2_io_inReq_bits_uop_rs1Valid),
    .io_inReq_bits_uop_rs2Valid(exeUnits_2_io_inReq_bits_uop_rs2Valid),
    .io_inReq_bits_uop_rdValid(exeUnits_2_io_inReq_bits_uop_rdValid),
    .io_inReq_bits_uop_snptId_valid(exeUnits_2_io_inReq_bits_uop_snptId_valid),
    .io_inReq_bits_uop_snptId_bits(exeUnits_2_io_inReq_bits_uop_snptId_bits),
    .io_inReq_bits_uop_robIdx_value(exeUnits_2_io_inReq_bits_uop_robIdx_value),
    .io_inReq_bits_uop_robIdx_flag(exeUnits_2_io_inReq_bits_uop_robIdx_flag),
    .io_inReq_bits_uop_robIdxFull_value(exeUnits_2_io_inReq_bits_uop_robIdxFull_value),
    .io_inReq_bits_uop_robIdxFull_flag(exeUnits_2_io_inReq_bits_uop_robIdxFull_flag),
    .io_inReq_bits_uop_lqIdx_value(exeUnits_2_io_inReq_bits_uop_lqIdx_value),
    .io_inReq_bits_uop_lqIdx_flag(exeUnits_2_io_inReq_bits_uop_lqIdx_flag),
    .io_inReq_bits_uop_sqIdx_value(exeUnits_2_io_inReq_bits_uop_sqIdx_value),
    .io_inReq_bits_uop_sqIdx_flag(exeUnits_2_io_inReq_bits_uop_sqIdx_flag),
    .io_inReq_bits_uop_issueQueue(exeUnits_2_io_inReq_bits_uop_issueQueue),
    .io_inReq_bits_uop_prs1Busy(exeUnits_2_io_inReq_bits_uop_prs1Busy),
    .io_inReq_bits_uop_prs2Busy(exeUnits_2_io_inReq_bits_uop_prs2Busy),
    .io_inReq_bits_uop_isSta(exeUnits_2_io_inReq_bits_uop_isSta),
    .io_inReq_bits_uop_isStd(exeUnits_2_io_inReq_bits_uop_isStd),
    .io_inReq_bits_rs1Data(exeUnits_2_io_inReq_bits_rs1Data),
    .io_inReq_bits_rs2Data(exeUnits_2_io_inReq_bits_rs2Data),
    .io_outResult_ready(exeUnits_2_io_outResult_ready),
    .io_outResult_valid(exeUnits_2_io_outResult_valid),
    .io_outResult_bits_uop_pc(exeUnits_2_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_inst(exeUnits_2_io_outResult_bits_uop_inst),
    .io_outResult_bits_uop_ctrl_fuType(exeUnits_2_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_aluOp(exeUnits_2_io_outResult_bits_uop_ctrl_aluOp),
    .io_outResult_bits_uop_ctrl_bruOp(exeUnits_2_io_outResult_bits_uop_ctrl_bruOp),
    .io_outResult_bits_uop_ctrl_lsuOp(exeUnits_2_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_ctrl_csrOp(exeUnits_2_io_outResult_bits_uop_ctrl_csrOp),
    .io_outResult_bits_uop_ctrl_mulOp(exeUnits_2_io_outResult_bits_uop_ctrl_mulOp),
    .io_outResult_bits_uop_ctrl_divOp(exeUnits_2_io_outResult_bits_uop_ctrl_divOp),
    .io_outResult_bits_uop_ctrl_src1Type(exeUnits_2_io_outResult_bits_uop_ctrl_src1Type),
    .io_outResult_bits_uop_ctrl_src2Type(exeUnits_2_io_outResult_bits_uop_ctrl_src2Type),
    .io_outResult_bits_uop_ctrl_immType(exeUnits_2_io_outResult_bits_uop_ctrl_immType),
    .io_outResult_bits_uop_ctrl_rfWen(exeUnits_2_io_outResult_bits_uop_ctrl_rfWen),
    .io_outResult_bits_uop_ctrl_memRead(exeUnits_2_io_outResult_bits_uop_ctrl_memRead),
    .io_outResult_bits_uop_ctrl_memWrite(exeUnits_2_io_outResult_bits_uop_ctrl_memWrite),
    .io_outResult_bits_uop_ctrl_csrWen(exeUnits_2_io_outResult_bits_uop_ctrl_csrWen),
    .io_outResult_bits_uop_ctrl_isBranch(exeUnits_2_io_outResult_bits_uop_ctrl_isBranch),
    .io_outResult_bits_uop_ctrl_isJump(exeUnits_2_io_outResult_bits_uop_ctrl_isJump),
    .io_outResult_bits_uop_ctrl_isPriv(exeUnits_2_io_outResult_bits_uop_ctrl_isPriv),
    .io_outResult_bits_uop_excp_excpVec(exeUnits_2_io_outResult_bits_uop_excp_excpVec),
    .io_outResult_bits_uop_imm(exeUnits_2_io_outResult_bits_uop_imm),
    .io_outResult_bits_uop_csrAddress(exeUnits_2_io_outResult_bits_uop_csrAddress),
    .io_outResult_bits_uop_pdInfo_valid(exeUnits_2_io_outResult_bits_uop_pdInfo_valid),
    .io_outResult_bits_uop_pdInfo_isBr(exeUnits_2_io_outResult_bits_uop_pdInfo_isBr),
    .io_outResult_bits_uop_pdInfo_isJal(exeUnits_2_io_outResult_bits_uop_pdInfo_isJal),
    .io_outResult_bits_uop_pdInfo_isJalr(exeUnits_2_io_outResult_bits_uop_pdInfo_isJalr),
    .io_outResult_bits_uop_pdInfo_isCall(exeUnits_2_io_outResult_bits_uop_pdInfo_isCall),
    .io_outResult_bits_uop_pdInfo_isRet(exeUnits_2_io_outResult_bits_uop_pdInfo_isRet),
    .io_outResult_bits_uop_pdInfo_jumpTarget(exeUnits_2_io_outResult_bits_uop_pdInfo_jumpTarget),
    .io_outResult_bits_uop_bpuInfo_pc(exeUnits_2_io_outResult_bits_uop_bpuInfo_pc),
    .io_outResult_bits_uop_bpuInfo_fallThrough(exeUnits_2_io_outResult_bits_uop_bpuInfo_fallThrough),
    .io_outResult_bits_uop_bpuInfo_taken(exeUnits_2_io_outResult_bits_uop_bpuInfo_taken),
    .io_outResult_bits_uop_bpuInfo_target(exeUnits_2_io_outResult_bits_uop_bpuInfo_target),
    .io_outResult_bits_uop_bpuInfo_takenOffset(exeUnits_2_io_outResult_bits_uop_bpuInfo_takenOffset),
    .io_outResult_bits_uop_bpuInfo_meta_valid(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_valid),
    .io_outResult_bits_uop_bpuInfo_meta_btbHit(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbHit),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsJal),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsCall),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsRet),
    .io_outResult_bits_uop_bpuInfo_meta_btbOffset(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbOffset),
    .io_outResult_bits_uop_bpuInfo_meta_phtCounter(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_phtCounter),
    .io_outResult_bits_uop_bpuInfo_meta_rasTop(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_rasTop),
    .io_outResult_bits_uop_bpuInfo_meta_predTaken(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_predTaken),
    .io_outResult_bits_uop_bpuInfo_meta_predTarget(exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_predTarget),
    .io_outResult_bits_uop_ldst(exeUnits_2_io_outResult_bits_uop_ldst),
    .io_outResult_bits_uop_lrs1(exeUnits_2_io_outResult_bits_uop_lrs1),
    .io_outResult_bits_uop_lrs2(exeUnits_2_io_outResult_bits_uop_lrs2),
    .io_outResult_bits_uop_pdst(exeUnits_2_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_prs1(exeUnits_2_io_outResult_bits_uop_prs1),
    .io_outResult_bits_uop_prs2(exeUnits_2_io_outResult_bits_uop_prs2),
    .io_outResult_bits_uop_oldPdst(exeUnits_2_io_outResult_bits_uop_oldPdst),
    .io_outResult_bits_uop_rs1Valid(exeUnits_2_io_outResult_bits_uop_rs1Valid),
    .io_outResult_bits_uop_rs2Valid(exeUnits_2_io_outResult_bits_uop_rs2Valid),
    .io_outResult_bits_uop_rdValid(exeUnits_2_io_outResult_bits_uop_rdValid),
    .io_outResult_bits_uop_snptId_valid(exeUnits_2_io_outResult_bits_uop_snptId_valid),
    .io_outResult_bits_uop_snptId_bits(exeUnits_2_io_outResult_bits_uop_snptId_bits),
    .io_outResult_bits_uop_robIdx_value(exeUnits_2_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(exeUnits_2_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(exeUnits_2_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(exeUnits_2_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(exeUnits_2_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_lqIdx_flag(exeUnits_2_io_outResult_bits_uop_lqIdx_flag),
    .io_outResult_bits_uop_sqIdx_value(exeUnits_2_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_uop_sqIdx_flag(exeUnits_2_io_outResult_bits_uop_sqIdx_flag),
    .io_outResult_bits_uop_issueQueue(exeUnits_2_io_outResult_bits_uop_issueQueue),
    .io_outResult_bits_uop_prs1Busy(exeUnits_2_io_outResult_bits_uop_prs1Busy),
    .io_outResult_bits_uop_prs2Busy(exeUnits_2_io_outResult_bits_uop_prs2Busy),
    .io_outResult_bits_uop_isSta(exeUnits_2_io_outResult_bits_uop_isSta),
    .io_outResult_bits_uop_isStd(exeUnits_2_io_outResult_bits_uop_isStd),
    .io_outResult_bits_data(exeUnits_2_io_outResult_bits_data),
    .io_outResult_bits_memStoreData(exeUnits_2_io_outResult_bits_memStoreData),
    .io_bruInfo_valid(exeUnits_2_io_bruInfo_valid),
    .io_bruInfo_bits_doRedirect(exeUnits_2_io_bruInfo_bits_doRedirect),
    .io_bruInfo_bits_snptId(exeUnits_2_io_bruInfo_bits_snptId),
    .io_bruInfo_bits_robIdx_value(exeUnits_2_io_bruInfo_bits_robIdx_value),
    .io_bruInfo_bits_robIdx_flag(exeUnits_2_io_bruInfo_bits_robIdx_flag),
    .io_bruInfo_bits_target(exeUnits_2_io_bruInfo_bits_target),
    .io_bpuUpdate_valid(exeUnits_2_io_bpuUpdate_valid),
    .io_bpuUpdate_pc(exeUnits_2_io_bpuUpdate_pc),
    .io_bpuUpdate_taken(exeUnits_2_io_bpuUpdate_taken),
    .io_bpuUpdate_target(exeUnits_2_io_bpuUpdate_target),
    .io_bpuUpdate_oldPhtCounter(exeUnits_2_io_bpuUpdate_oldPhtCounter),
    .io_bpuUpdate_isJalr(exeUnits_2_io_bpuUpdate_isJalr),
    .io_bpuUpdate_isJal(exeUnits_2_io_bpuUpdate_isJal),
    .io_bpuUpdate_offset(exeUnits_2_io_bpuUpdate_offset),
    .io_redirectInfo_valid(exeUnits_2_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(exeUnits_2_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(exeUnits_2_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(exeUnits_2_io_redirectInfo_bits_robIdx_flag)
  );
  ExeUnit_3 exeUnits_3 ( // @[src/main/scala/backend/Backend.scala 87:11]
    .clock(exeUnits_3_clock),
    .reset(exeUnits_3_reset),
    .io_inReq_ready(exeUnits_3_io_inReq_ready),
    .io_inReq_valid(exeUnits_3_io_inReq_valid),
    .io_inReq_bits_uop_pc(exeUnits_3_io_inReq_bits_uop_pc),
    .io_inReq_bits_uop_inst(exeUnits_3_io_inReq_bits_uop_inst),
    .io_inReq_bits_uop_ctrl_fuType(exeUnits_3_io_inReq_bits_uop_ctrl_fuType),
    .io_inReq_bits_uop_ctrl_aluOp(exeUnits_3_io_inReq_bits_uop_ctrl_aluOp),
    .io_inReq_bits_uop_ctrl_bruOp(exeUnits_3_io_inReq_bits_uop_ctrl_bruOp),
    .io_inReq_bits_uop_ctrl_lsuOp(exeUnits_3_io_inReq_bits_uop_ctrl_lsuOp),
    .io_inReq_bits_uop_ctrl_csrOp(exeUnits_3_io_inReq_bits_uop_ctrl_csrOp),
    .io_inReq_bits_uop_ctrl_mulOp(exeUnits_3_io_inReq_bits_uop_ctrl_mulOp),
    .io_inReq_bits_uop_ctrl_divOp(exeUnits_3_io_inReq_bits_uop_ctrl_divOp),
    .io_inReq_bits_uop_ctrl_src1Type(exeUnits_3_io_inReq_bits_uop_ctrl_src1Type),
    .io_inReq_bits_uop_ctrl_src2Type(exeUnits_3_io_inReq_bits_uop_ctrl_src2Type),
    .io_inReq_bits_uop_ctrl_immType(exeUnits_3_io_inReq_bits_uop_ctrl_immType),
    .io_inReq_bits_uop_ctrl_rfWen(exeUnits_3_io_inReq_bits_uop_ctrl_rfWen),
    .io_inReq_bits_uop_ctrl_memRead(exeUnits_3_io_inReq_bits_uop_ctrl_memRead),
    .io_inReq_bits_uop_ctrl_memWrite(exeUnits_3_io_inReq_bits_uop_ctrl_memWrite),
    .io_inReq_bits_uop_ctrl_csrWen(exeUnits_3_io_inReq_bits_uop_ctrl_csrWen),
    .io_inReq_bits_uop_ctrl_isBranch(exeUnits_3_io_inReq_bits_uop_ctrl_isBranch),
    .io_inReq_bits_uop_ctrl_isJump(exeUnits_3_io_inReq_bits_uop_ctrl_isJump),
    .io_inReq_bits_uop_ctrl_isPriv(exeUnits_3_io_inReq_bits_uop_ctrl_isPriv),
    .io_inReq_bits_uop_excp_excpVec(exeUnits_3_io_inReq_bits_uop_excp_excpVec),
    .io_inReq_bits_uop_imm(exeUnits_3_io_inReq_bits_uop_imm),
    .io_inReq_bits_uop_csrAddress(exeUnits_3_io_inReq_bits_uop_csrAddress),
    .io_inReq_bits_uop_pdInfo_valid(exeUnits_3_io_inReq_bits_uop_pdInfo_valid),
    .io_inReq_bits_uop_pdInfo_isBr(exeUnits_3_io_inReq_bits_uop_pdInfo_isBr),
    .io_inReq_bits_uop_pdInfo_isJal(exeUnits_3_io_inReq_bits_uop_pdInfo_isJal),
    .io_inReq_bits_uop_pdInfo_isJalr(exeUnits_3_io_inReq_bits_uop_pdInfo_isJalr),
    .io_inReq_bits_uop_pdInfo_isCall(exeUnits_3_io_inReq_bits_uop_pdInfo_isCall),
    .io_inReq_bits_uop_pdInfo_isRet(exeUnits_3_io_inReq_bits_uop_pdInfo_isRet),
    .io_inReq_bits_uop_pdInfo_jumpTarget(exeUnits_3_io_inReq_bits_uop_pdInfo_jumpTarget),
    .io_inReq_bits_uop_bpuInfo_pc(exeUnits_3_io_inReq_bits_uop_bpuInfo_pc),
    .io_inReq_bits_uop_bpuInfo_fallThrough(exeUnits_3_io_inReq_bits_uop_bpuInfo_fallThrough),
    .io_inReq_bits_uop_bpuInfo_taken(exeUnits_3_io_inReq_bits_uop_bpuInfo_taken),
    .io_inReq_bits_uop_bpuInfo_target(exeUnits_3_io_inReq_bits_uop_bpuInfo_target),
    .io_inReq_bits_uop_bpuInfo_takenOffset(exeUnits_3_io_inReq_bits_uop_bpuInfo_takenOffset),
    .io_inReq_bits_uop_bpuInfo_meta_valid(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_valid),
    .io_inReq_bits_uop_bpuInfo_meta_btbHit(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbHit),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsJal),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsCall),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsRet),
    .io_inReq_bits_uop_bpuInfo_meta_btbOffset(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbOffset),
    .io_inReq_bits_uop_bpuInfo_meta_phtCounter(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_phtCounter),
    .io_inReq_bits_uop_bpuInfo_meta_rasTop(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_rasTop),
    .io_inReq_bits_uop_bpuInfo_meta_predTaken(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_predTaken),
    .io_inReq_bits_uop_bpuInfo_meta_predTarget(exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_predTarget),
    .io_inReq_bits_uop_ldst(exeUnits_3_io_inReq_bits_uop_ldst),
    .io_inReq_bits_uop_lrs1(exeUnits_3_io_inReq_bits_uop_lrs1),
    .io_inReq_bits_uop_lrs2(exeUnits_3_io_inReq_bits_uop_lrs2),
    .io_inReq_bits_uop_pdst(exeUnits_3_io_inReq_bits_uop_pdst),
    .io_inReq_bits_uop_prs1(exeUnits_3_io_inReq_bits_uop_prs1),
    .io_inReq_bits_uop_prs2(exeUnits_3_io_inReq_bits_uop_prs2),
    .io_inReq_bits_uop_oldPdst(exeUnits_3_io_inReq_bits_uop_oldPdst),
    .io_inReq_bits_uop_rs1Valid(exeUnits_3_io_inReq_bits_uop_rs1Valid),
    .io_inReq_bits_uop_rs2Valid(exeUnits_3_io_inReq_bits_uop_rs2Valid),
    .io_inReq_bits_uop_rdValid(exeUnits_3_io_inReq_bits_uop_rdValid),
    .io_inReq_bits_uop_snptId_valid(exeUnits_3_io_inReq_bits_uop_snptId_valid),
    .io_inReq_bits_uop_snptId_bits(exeUnits_3_io_inReq_bits_uop_snptId_bits),
    .io_inReq_bits_uop_robIdx_value(exeUnits_3_io_inReq_bits_uop_robIdx_value),
    .io_inReq_bits_uop_robIdx_flag(exeUnits_3_io_inReq_bits_uop_robIdx_flag),
    .io_inReq_bits_uop_robIdxFull_value(exeUnits_3_io_inReq_bits_uop_robIdxFull_value),
    .io_inReq_bits_uop_robIdxFull_flag(exeUnits_3_io_inReq_bits_uop_robIdxFull_flag),
    .io_inReq_bits_uop_lqIdx_value(exeUnits_3_io_inReq_bits_uop_lqIdx_value),
    .io_inReq_bits_uop_lqIdx_flag(exeUnits_3_io_inReq_bits_uop_lqIdx_flag),
    .io_inReq_bits_uop_sqIdx_value(exeUnits_3_io_inReq_bits_uop_sqIdx_value),
    .io_inReq_bits_uop_sqIdx_flag(exeUnits_3_io_inReq_bits_uop_sqIdx_flag),
    .io_inReq_bits_uop_issueQueue(exeUnits_3_io_inReq_bits_uop_issueQueue),
    .io_inReq_bits_uop_prs1Busy(exeUnits_3_io_inReq_bits_uop_prs1Busy),
    .io_inReq_bits_uop_prs2Busy(exeUnits_3_io_inReq_bits_uop_prs2Busy),
    .io_inReq_bits_uop_isSta(exeUnits_3_io_inReq_bits_uop_isSta),
    .io_inReq_bits_uop_isStd(exeUnits_3_io_inReq_bits_uop_isStd),
    .io_inReq_bits_rs1Data(exeUnits_3_io_inReq_bits_rs1Data),
    .io_inReq_bits_rs2Data(exeUnits_3_io_inReq_bits_rs2Data),
    .io_outResult_ready(exeUnits_3_io_outResult_ready),
    .io_outResult_valid(exeUnits_3_io_outResult_valid),
    .io_outResult_bits_uop_pc(exeUnits_3_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_inst(exeUnits_3_io_outResult_bits_uop_inst),
    .io_outResult_bits_uop_ctrl_fuType(exeUnits_3_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_aluOp(exeUnits_3_io_outResult_bits_uop_ctrl_aluOp),
    .io_outResult_bits_uop_ctrl_bruOp(exeUnits_3_io_outResult_bits_uop_ctrl_bruOp),
    .io_outResult_bits_uop_ctrl_lsuOp(exeUnits_3_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_ctrl_csrOp(exeUnits_3_io_outResult_bits_uop_ctrl_csrOp),
    .io_outResult_bits_uop_ctrl_mulOp(exeUnits_3_io_outResult_bits_uop_ctrl_mulOp),
    .io_outResult_bits_uop_ctrl_divOp(exeUnits_3_io_outResult_bits_uop_ctrl_divOp),
    .io_outResult_bits_uop_ctrl_src1Type(exeUnits_3_io_outResult_bits_uop_ctrl_src1Type),
    .io_outResult_bits_uop_ctrl_src2Type(exeUnits_3_io_outResult_bits_uop_ctrl_src2Type),
    .io_outResult_bits_uop_ctrl_immType(exeUnits_3_io_outResult_bits_uop_ctrl_immType),
    .io_outResult_bits_uop_ctrl_rfWen(exeUnits_3_io_outResult_bits_uop_ctrl_rfWen),
    .io_outResult_bits_uop_ctrl_memRead(exeUnits_3_io_outResult_bits_uop_ctrl_memRead),
    .io_outResult_bits_uop_ctrl_memWrite(exeUnits_3_io_outResult_bits_uop_ctrl_memWrite),
    .io_outResult_bits_uop_ctrl_csrWen(exeUnits_3_io_outResult_bits_uop_ctrl_csrWen),
    .io_outResult_bits_uop_ctrl_isBranch(exeUnits_3_io_outResult_bits_uop_ctrl_isBranch),
    .io_outResult_bits_uop_ctrl_isJump(exeUnits_3_io_outResult_bits_uop_ctrl_isJump),
    .io_outResult_bits_uop_ctrl_isPriv(exeUnits_3_io_outResult_bits_uop_ctrl_isPriv),
    .io_outResult_bits_uop_excp_excpVec(exeUnits_3_io_outResult_bits_uop_excp_excpVec),
    .io_outResult_bits_uop_imm(exeUnits_3_io_outResult_bits_uop_imm),
    .io_outResult_bits_uop_csrAddress(exeUnits_3_io_outResult_bits_uop_csrAddress),
    .io_outResult_bits_uop_pdInfo_valid(exeUnits_3_io_outResult_bits_uop_pdInfo_valid),
    .io_outResult_bits_uop_pdInfo_isBr(exeUnits_3_io_outResult_bits_uop_pdInfo_isBr),
    .io_outResult_bits_uop_pdInfo_isJal(exeUnits_3_io_outResult_bits_uop_pdInfo_isJal),
    .io_outResult_bits_uop_pdInfo_isJalr(exeUnits_3_io_outResult_bits_uop_pdInfo_isJalr),
    .io_outResult_bits_uop_pdInfo_isCall(exeUnits_3_io_outResult_bits_uop_pdInfo_isCall),
    .io_outResult_bits_uop_pdInfo_isRet(exeUnits_3_io_outResult_bits_uop_pdInfo_isRet),
    .io_outResult_bits_uop_pdInfo_jumpTarget(exeUnits_3_io_outResult_bits_uop_pdInfo_jumpTarget),
    .io_outResult_bits_uop_bpuInfo_pc(exeUnits_3_io_outResult_bits_uop_bpuInfo_pc),
    .io_outResult_bits_uop_bpuInfo_fallThrough(exeUnits_3_io_outResult_bits_uop_bpuInfo_fallThrough),
    .io_outResult_bits_uop_bpuInfo_taken(exeUnits_3_io_outResult_bits_uop_bpuInfo_taken),
    .io_outResult_bits_uop_bpuInfo_target(exeUnits_3_io_outResult_bits_uop_bpuInfo_target),
    .io_outResult_bits_uop_bpuInfo_takenOffset(exeUnits_3_io_outResult_bits_uop_bpuInfo_takenOffset),
    .io_outResult_bits_uop_bpuInfo_meta_valid(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_valid),
    .io_outResult_bits_uop_bpuInfo_meta_btbHit(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbHit),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsJal),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsCall),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsRet),
    .io_outResult_bits_uop_bpuInfo_meta_btbOffset(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbOffset),
    .io_outResult_bits_uop_bpuInfo_meta_phtCounter(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_phtCounter),
    .io_outResult_bits_uop_bpuInfo_meta_rasTop(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_rasTop),
    .io_outResult_bits_uop_bpuInfo_meta_predTaken(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_predTaken),
    .io_outResult_bits_uop_bpuInfo_meta_predTarget(exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_predTarget),
    .io_outResult_bits_uop_ldst(exeUnits_3_io_outResult_bits_uop_ldst),
    .io_outResult_bits_uop_lrs1(exeUnits_3_io_outResult_bits_uop_lrs1),
    .io_outResult_bits_uop_lrs2(exeUnits_3_io_outResult_bits_uop_lrs2),
    .io_outResult_bits_uop_pdst(exeUnits_3_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_prs1(exeUnits_3_io_outResult_bits_uop_prs1),
    .io_outResult_bits_uop_prs2(exeUnits_3_io_outResult_bits_uop_prs2),
    .io_outResult_bits_uop_oldPdst(exeUnits_3_io_outResult_bits_uop_oldPdst),
    .io_outResult_bits_uop_rs1Valid(exeUnits_3_io_outResult_bits_uop_rs1Valid),
    .io_outResult_bits_uop_rs2Valid(exeUnits_3_io_outResult_bits_uop_rs2Valid),
    .io_outResult_bits_uop_rdValid(exeUnits_3_io_outResult_bits_uop_rdValid),
    .io_outResult_bits_uop_snptId_valid(exeUnits_3_io_outResult_bits_uop_snptId_valid),
    .io_outResult_bits_uop_snptId_bits(exeUnits_3_io_outResult_bits_uop_snptId_bits),
    .io_outResult_bits_uop_robIdx_value(exeUnits_3_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(exeUnits_3_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(exeUnits_3_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(exeUnits_3_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(exeUnits_3_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_lqIdx_flag(exeUnits_3_io_outResult_bits_uop_lqIdx_flag),
    .io_outResult_bits_uop_sqIdx_value(exeUnits_3_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_uop_sqIdx_flag(exeUnits_3_io_outResult_bits_uop_sqIdx_flag),
    .io_outResult_bits_uop_issueQueue(exeUnits_3_io_outResult_bits_uop_issueQueue),
    .io_outResult_bits_uop_prs1Busy(exeUnits_3_io_outResult_bits_uop_prs1Busy),
    .io_outResult_bits_uop_prs2Busy(exeUnits_3_io_outResult_bits_uop_prs2Busy),
    .io_outResult_bits_uop_isSta(exeUnits_3_io_outResult_bits_uop_isSta),
    .io_outResult_bits_uop_isStd(exeUnits_3_io_outResult_bits_uop_isStd),
    .io_outResult_bits_data(exeUnits_3_io_outResult_bits_data),
    .io_outResult_bits_redirect_valid(exeUnits_3_io_outResult_bits_redirect_valid),
    .io_outResult_bits_redirect_bits_valid(exeUnits_3_io_outResult_bits_redirect_bits_valid),
    .io_outResult_bits_redirect_bits_robIdx_value(exeUnits_3_io_outResult_bits_redirect_bits_robIdx_value),
    .io_outResult_bits_redirect_bits_robIdx_flag(exeUnits_3_io_outResult_bits_redirect_bits_robIdx_flag),
    .io_outResult_bits_memValid(exeUnits_3_io_outResult_bits_memValid),
    .io_outResult_bits_memRead(exeUnits_3_io_outResult_bits_memRead),
    .io_outResult_bits_memWrite(exeUnits_3_io_outResult_bits_memWrite),
    .io_outResult_bits_memVaddr(exeUnits_3_io_outResult_bits_memVaddr),
    .io_outResult_bits_memPaddr(exeUnits_3_io_outResult_bits_memPaddr),
    .io_outResult_bits_memStoreData(exeUnits_3_io_outResult_bits_memStoreData),
    .io_outResult_bits_csrWen(exeUnits_3_io_outResult_bits_csrWen),
    .io_outResult_bits_csrWaddr(exeUnits_3_io_outResult_bits_csrWaddr),
    .io_outResult_bits_csrWdata(exeUnits_3_io_outResult_bits_csrWdata),
    .io_outResult_bits_csrTimer(exeUnits_3_io_outResult_bits_csrTimer)
  );
  ExeUnit_4 exeUnits_4 ( // @[src/main/scala/backend/Backend.scala 88:11]
    .clock(exeUnits_4_clock),
    .reset(exeUnits_4_reset),
    .io_inReq_ready(exeUnits_4_io_inReq_ready),
    .io_inReq_valid(exeUnits_4_io_inReq_valid),
    .io_inReq_bits_uop_pc(exeUnits_4_io_inReq_bits_uop_pc),
    .io_inReq_bits_uop_inst(exeUnits_4_io_inReq_bits_uop_inst),
    .io_inReq_bits_uop_ctrl_fuType(exeUnits_4_io_inReq_bits_uop_ctrl_fuType),
    .io_inReq_bits_uop_ctrl_aluOp(exeUnits_4_io_inReq_bits_uop_ctrl_aluOp),
    .io_inReq_bits_uop_ctrl_bruOp(exeUnits_4_io_inReq_bits_uop_ctrl_bruOp),
    .io_inReq_bits_uop_ctrl_lsuOp(exeUnits_4_io_inReq_bits_uop_ctrl_lsuOp),
    .io_inReq_bits_uop_ctrl_csrOp(exeUnits_4_io_inReq_bits_uop_ctrl_csrOp),
    .io_inReq_bits_uop_ctrl_mulOp(exeUnits_4_io_inReq_bits_uop_ctrl_mulOp),
    .io_inReq_bits_uop_ctrl_divOp(exeUnits_4_io_inReq_bits_uop_ctrl_divOp),
    .io_inReq_bits_uop_ctrl_src1Type(exeUnits_4_io_inReq_bits_uop_ctrl_src1Type),
    .io_inReq_bits_uop_ctrl_src2Type(exeUnits_4_io_inReq_bits_uop_ctrl_src2Type),
    .io_inReq_bits_uop_ctrl_immType(exeUnits_4_io_inReq_bits_uop_ctrl_immType),
    .io_inReq_bits_uop_ctrl_rfWen(exeUnits_4_io_inReq_bits_uop_ctrl_rfWen),
    .io_inReq_bits_uop_ctrl_memRead(exeUnits_4_io_inReq_bits_uop_ctrl_memRead),
    .io_inReq_bits_uop_ctrl_memWrite(exeUnits_4_io_inReq_bits_uop_ctrl_memWrite),
    .io_inReq_bits_uop_ctrl_csrWen(exeUnits_4_io_inReq_bits_uop_ctrl_csrWen),
    .io_inReq_bits_uop_ctrl_isBranch(exeUnits_4_io_inReq_bits_uop_ctrl_isBranch),
    .io_inReq_bits_uop_ctrl_isJump(exeUnits_4_io_inReq_bits_uop_ctrl_isJump),
    .io_inReq_bits_uop_ctrl_isPriv(exeUnits_4_io_inReq_bits_uop_ctrl_isPriv),
    .io_inReq_bits_uop_excp_excpVec(exeUnits_4_io_inReq_bits_uop_excp_excpVec),
    .io_inReq_bits_uop_imm(exeUnits_4_io_inReq_bits_uop_imm),
    .io_inReq_bits_uop_csrAddress(exeUnits_4_io_inReq_bits_uop_csrAddress),
    .io_inReq_bits_uop_pdInfo_valid(exeUnits_4_io_inReq_bits_uop_pdInfo_valid),
    .io_inReq_bits_uop_pdInfo_isBr(exeUnits_4_io_inReq_bits_uop_pdInfo_isBr),
    .io_inReq_bits_uop_pdInfo_isJal(exeUnits_4_io_inReq_bits_uop_pdInfo_isJal),
    .io_inReq_bits_uop_pdInfo_isJalr(exeUnits_4_io_inReq_bits_uop_pdInfo_isJalr),
    .io_inReq_bits_uop_pdInfo_isCall(exeUnits_4_io_inReq_bits_uop_pdInfo_isCall),
    .io_inReq_bits_uop_pdInfo_isRet(exeUnits_4_io_inReq_bits_uop_pdInfo_isRet),
    .io_inReq_bits_uop_pdInfo_jumpTarget(exeUnits_4_io_inReq_bits_uop_pdInfo_jumpTarget),
    .io_inReq_bits_uop_bpuInfo_pc(exeUnits_4_io_inReq_bits_uop_bpuInfo_pc),
    .io_inReq_bits_uop_bpuInfo_fallThrough(exeUnits_4_io_inReq_bits_uop_bpuInfo_fallThrough),
    .io_inReq_bits_uop_bpuInfo_taken(exeUnits_4_io_inReq_bits_uop_bpuInfo_taken),
    .io_inReq_bits_uop_bpuInfo_target(exeUnits_4_io_inReq_bits_uop_bpuInfo_target),
    .io_inReq_bits_uop_bpuInfo_takenOffset(exeUnits_4_io_inReq_bits_uop_bpuInfo_takenOffset),
    .io_inReq_bits_uop_bpuInfo_meta_valid(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_valid),
    .io_inReq_bits_uop_bpuInfo_meta_btbHit(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbHit),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsJal),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsCall),
    .io_inReq_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsRet),
    .io_inReq_bits_uop_bpuInfo_meta_btbOffset(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbOffset),
    .io_inReq_bits_uop_bpuInfo_meta_phtCounter(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_phtCounter),
    .io_inReq_bits_uop_bpuInfo_meta_rasTop(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_rasTop),
    .io_inReq_bits_uop_bpuInfo_meta_predTaken(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_predTaken),
    .io_inReq_bits_uop_bpuInfo_meta_predTarget(exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_predTarget),
    .io_inReq_bits_uop_ldst(exeUnits_4_io_inReq_bits_uop_ldst),
    .io_inReq_bits_uop_lrs1(exeUnits_4_io_inReq_bits_uop_lrs1),
    .io_inReq_bits_uop_lrs2(exeUnits_4_io_inReq_bits_uop_lrs2),
    .io_inReq_bits_uop_pdst(exeUnits_4_io_inReq_bits_uop_pdst),
    .io_inReq_bits_uop_prs1(exeUnits_4_io_inReq_bits_uop_prs1),
    .io_inReq_bits_uop_prs2(exeUnits_4_io_inReq_bits_uop_prs2),
    .io_inReq_bits_uop_oldPdst(exeUnits_4_io_inReq_bits_uop_oldPdst),
    .io_inReq_bits_uop_rs1Valid(exeUnits_4_io_inReq_bits_uop_rs1Valid),
    .io_inReq_bits_uop_rs2Valid(exeUnits_4_io_inReq_bits_uop_rs2Valid),
    .io_inReq_bits_uop_rdValid(exeUnits_4_io_inReq_bits_uop_rdValid),
    .io_inReq_bits_uop_snptId_valid(exeUnits_4_io_inReq_bits_uop_snptId_valid),
    .io_inReq_bits_uop_snptId_bits(exeUnits_4_io_inReq_bits_uop_snptId_bits),
    .io_inReq_bits_uop_robIdx_value(exeUnits_4_io_inReq_bits_uop_robIdx_value),
    .io_inReq_bits_uop_robIdx_flag(exeUnits_4_io_inReq_bits_uop_robIdx_flag),
    .io_inReq_bits_uop_robIdxFull_value(exeUnits_4_io_inReq_bits_uop_robIdxFull_value),
    .io_inReq_bits_uop_robIdxFull_flag(exeUnits_4_io_inReq_bits_uop_robIdxFull_flag),
    .io_inReq_bits_uop_lqIdx_value(exeUnits_4_io_inReq_bits_uop_lqIdx_value),
    .io_inReq_bits_uop_lqIdx_flag(exeUnits_4_io_inReq_bits_uop_lqIdx_flag),
    .io_inReq_bits_uop_sqIdx_value(exeUnits_4_io_inReq_bits_uop_sqIdx_value),
    .io_inReq_bits_uop_sqIdx_flag(exeUnits_4_io_inReq_bits_uop_sqIdx_flag),
    .io_inReq_bits_uop_issueQueue(exeUnits_4_io_inReq_bits_uop_issueQueue),
    .io_inReq_bits_uop_prs1Busy(exeUnits_4_io_inReq_bits_uop_prs1Busy),
    .io_inReq_bits_uop_prs2Busy(exeUnits_4_io_inReq_bits_uop_prs2Busy),
    .io_inReq_bits_uop_isSta(exeUnits_4_io_inReq_bits_uop_isSta),
    .io_inReq_bits_uop_isStd(exeUnits_4_io_inReq_bits_uop_isStd),
    .io_inReq_bits_rs2Data(exeUnits_4_io_inReq_bits_rs2Data),
    .io_outResult_ready(exeUnits_4_io_outResult_ready),
    .io_outResult_valid(exeUnits_4_io_outResult_valid),
    .io_outResult_bits_uop_pc(exeUnits_4_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_inst(exeUnits_4_io_outResult_bits_uop_inst),
    .io_outResult_bits_uop_ctrl_fuType(exeUnits_4_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_aluOp(exeUnits_4_io_outResult_bits_uop_ctrl_aluOp),
    .io_outResult_bits_uop_ctrl_bruOp(exeUnits_4_io_outResult_bits_uop_ctrl_bruOp),
    .io_outResult_bits_uop_ctrl_lsuOp(exeUnits_4_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_ctrl_csrOp(exeUnits_4_io_outResult_bits_uop_ctrl_csrOp),
    .io_outResult_bits_uop_ctrl_mulOp(exeUnits_4_io_outResult_bits_uop_ctrl_mulOp),
    .io_outResult_bits_uop_ctrl_divOp(exeUnits_4_io_outResult_bits_uop_ctrl_divOp),
    .io_outResult_bits_uop_ctrl_src1Type(exeUnits_4_io_outResult_bits_uop_ctrl_src1Type),
    .io_outResult_bits_uop_ctrl_src2Type(exeUnits_4_io_outResult_bits_uop_ctrl_src2Type),
    .io_outResult_bits_uop_ctrl_immType(exeUnits_4_io_outResult_bits_uop_ctrl_immType),
    .io_outResult_bits_uop_ctrl_rfWen(exeUnits_4_io_outResult_bits_uop_ctrl_rfWen),
    .io_outResult_bits_uop_ctrl_memRead(exeUnits_4_io_outResult_bits_uop_ctrl_memRead),
    .io_outResult_bits_uop_ctrl_memWrite(exeUnits_4_io_outResult_bits_uop_ctrl_memWrite),
    .io_outResult_bits_uop_ctrl_csrWen(exeUnits_4_io_outResult_bits_uop_ctrl_csrWen),
    .io_outResult_bits_uop_ctrl_isBranch(exeUnits_4_io_outResult_bits_uop_ctrl_isBranch),
    .io_outResult_bits_uop_ctrl_isJump(exeUnits_4_io_outResult_bits_uop_ctrl_isJump),
    .io_outResult_bits_uop_ctrl_isPriv(exeUnits_4_io_outResult_bits_uop_ctrl_isPriv),
    .io_outResult_bits_uop_excp_excpVec(exeUnits_4_io_outResult_bits_uop_excp_excpVec),
    .io_outResult_bits_uop_imm(exeUnits_4_io_outResult_bits_uop_imm),
    .io_outResult_bits_uop_csrAddress(exeUnits_4_io_outResult_bits_uop_csrAddress),
    .io_outResult_bits_uop_pdInfo_valid(exeUnits_4_io_outResult_bits_uop_pdInfo_valid),
    .io_outResult_bits_uop_pdInfo_isBr(exeUnits_4_io_outResult_bits_uop_pdInfo_isBr),
    .io_outResult_bits_uop_pdInfo_isJal(exeUnits_4_io_outResult_bits_uop_pdInfo_isJal),
    .io_outResult_bits_uop_pdInfo_isJalr(exeUnits_4_io_outResult_bits_uop_pdInfo_isJalr),
    .io_outResult_bits_uop_pdInfo_isCall(exeUnits_4_io_outResult_bits_uop_pdInfo_isCall),
    .io_outResult_bits_uop_pdInfo_isRet(exeUnits_4_io_outResult_bits_uop_pdInfo_isRet),
    .io_outResult_bits_uop_pdInfo_jumpTarget(exeUnits_4_io_outResult_bits_uop_pdInfo_jumpTarget),
    .io_outResult_bits_uop_bpuInfo_pc(exeUnits_4_io_outResult_bits_uop_bpuInfo_pc),
    .io_outResult_bits_uop_bpuInfo_fallThrough(exeUnits_4_io_outResult_bits_uop_bpuInfo_fallThrough),
    .io_outResult_bits_uop_bpuInfo_taken(exeUnits_4_io_outResult_bits_uop_bpuInfo_taken),
    .io_outResult_bits_uop_bpuInfo_target(exeUnits_4_io_outResult_bits_uop_bpuInfo_target),
    .io_outResult_bits_uop_bpuInfo_takenOffset(exeUnits_4_io_outResult_bits_uop_bpuInfo_takenOffset),
    .io_outResult_bits_uop_bpuInfo_meta_valid(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_valid),
    .io_outResult_bits_uop_bpuInfo_meta_btbHit(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbHit),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJalr(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsJal(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsJal),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsCall(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsCall),
    .io_outResult_bits_uop_bpuInfo_meta_btbIsRet(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsRet),
    .io_outResult_bits_uop_bpuInfo_meta_btbOffset(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbOffset),
    .io_outResult_bits_uop_bpuInfo_meta_phtCounter(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_phtCounter),
    .io_outResult_bits_uop_bpuInfo_meta_rasTop(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_rasTop),
    .io_outResult_bits_uop_bpuInfo_meta_predTaken(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_predTaken),
    .io_outResult_bits_uop_bpuInfo_meta_predTarget(exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_predTarget),
    .io_outResult_bits_uop_ldst(exeUnits_4_io_outResult_bits_uop_ldst),
    .io_outResult_bits_uop_lrs1(exeUnits_4_io_outResult_bits_uop_lrs1),
    .io_outResult_bits_uop_lrs2(exeUnits_4_io_outResult_bits_uop_lrs2),
    .io_outResult_bits_uop_pdst(exeUnits_4_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_prs1(exeUnits_4_io_outResult_bits_uop_prs1),
    .io_outResult_bits_uop_prs2(exeUnits_4_io_outResult_bits_uop_prs2),
    .io_outResult_bits_uop_oldPdst(exeUnits_4_io_outResult_bits_uop_oldPdst),
    .io_outResult_bits_uop_rs1Valid(exeUnits_4_io_outResult_bits_uop_rs1Valid),
    .io_outResult_bits_uop_rs2Valid(exeUnits_4_io_outResult_bits_uop_rs2Valid),
    .io_outResult_bits_uop_rdValid(exeUnits_4_io_outResult_bits_uop_rdValid),
    .io_outResult_bits_uop_snptId_valid(exeUnits_4_io_outResult_bits_uop_snptId_valid),
    .io_outResult_bits_uop_snptId_bits(exeUnits_4_io_outResult_bits_uop_snptId_bits),
    .io_outResult_bits_uop_robIdx_value(exeUnits_4_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(exeUnits_4_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(exeUnits_4_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(exeUnits_4_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(exeUnits_4_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_lqIdx_flag(exeUnits_4_io_outResult_bits_uop_lqIdx_flag),
    .io_outResult_bits_uop_sqIdx_value(exeUnits_4_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_uop_sqIdx_flag(exeUnits_4_io_outResult_bits_uop_sqIdx_flag),
    .io_outResult_bits_uop_issueQueue(exeUnits_4_io_outResult_bits_uop_issueQueue),
    .io_outResult_bits_uop_prs1Busy(exeUnits_4_io_outResult_bits_uop_prs1Busy),
    .io_outResult_bits_uop_prs2Busy(exeUnits_4_io_outResult_bits_uop_prs2Busy),
    .io_outResult_bits_uop_isSta(exeUnits_4_io_outResult_bits_uop_isSta),
    .io_outResult_bits_uop_isStd(exeUnits_4_io_outResult_bits_uop_isStd),
    .io_outResult_bits_data(exeUnits_4_io_outResult_bits_data),
    .io_outResult_bits_redirect_valid(exeUnits_4_io_outResult_bits_redirect_valid),
    .io_outResult_bits_redirect_bits_valid(exeUnits_4_io_outResult_bits_redirect_bits_valid),
    .io_outResult_bits_redirect_bits_robIdx_value(exeUnits_4_io_outResult_bits_redirect_bits_robIdx_value),
    .io_outResult_bits_redirect_bits_robIdx_flag(exeUnits_4_io_outResult_bits_redirect_bits_robIdx_flag),
    .io_outResult_bits_memValid(exeUnits_4_io_outResult_bits_memValid),
    .io_outResult_bits_memRead(exeUnits_4_io_outResult_bits_memRead),
    .io_outResult_bits_memWrite(exeUnits_4_io_outResult_bits_memWrite),
    .io_outResult_bits_memVaddr(exeUnits_4_io_outResult_bits_memVaddr),
    .io_outResult_bits_memPaddr(exeUnits_4_io_outResult_bits_memPaddr),
    .io_outResult_bits_memStoreData(exeUnits_4_io_outResult_bits_memStoreData),
    .io_outResult_bits_csrWen(exeUnits_4_io_outResult_bits_csrWen),
    .io_outResult_bits_csrWaddr(exeUnits_4_io_outResult_bits_csrWaddr),
    .io_outResult_bits_csrWdata(exeUnits_4_io_outResult_bits_csrWdata),
    .io_outResult_bits_csrTimer(exeUnits_4_io_outResult_bits_csrTimer)
  );
  Writeback writeback ( // @[src/main/scala/backend/Backend.scala 115:25]
    .clock(writeback_clock),
    .reset(writeback_reset),
    .io_InExeResults_0_ready(writeback_io_InExeResults_0_ready),
    .io_InExeResults_0_valid(writeback_io_InExeResults_0_valid),
    .io_InExeResults_0_bits_uop_pc(writeback_io_InExeResults_0_bits_uop_pc),
    .io_InExeResults_0_bits_uop_inst(writeback_io_InExeResults_0_bits_uop_inst),
    .io_InExeResults_0_bits_uop_ctrl_fuType(writeback_io_InExeResults_0_bits_uop_ctrl_fuType),
    .io_InExeResults_0_bits_uop_ctrl_aluOp(writeback_io_InExeResults_0_bits_uop_ctrl_aluOp),
    .io_InExeResults_0_bits_uop_ctrl_bruOp(writeback_io_InExeResults_0_bits_uop_ctrl_bruOp),
    .io_InExeResults_0_bits_uop_ctrl_lsuOp(writeback_io_InExeResults_0_bits_uop_ctrl_lsuOp),
    .io_InExeResults_0_bits_uop_ctrl_csrOp(writeback_io_InExeResults_0_bits_uop_ctrl_csrOp),
    .io_InExeResults_0_bits_uop_ctrl_mulOp(writeback_io_InExeResults_0_bits_uop_ctrl_mulOp),
    .io_InExeResults_0_bits_uop_ctrl_divOp(writeback_io_InExeResults_0_bits_uop_ctrl_divOp),
    .io_InExeResults_0_bits_uop_ctrl_src1Type(writeback_io_InExeResults_0_bits_uop_ctrl_src1Type),
    .io_InExeResults_0_bits_uop_ctrl_src2Type(writeback_io_InExeResults_0_bits_uop_ctrl_src2Type),
    .io_InExeResults_0_bits_uop_ctrl_immType(writeback_io_InExeResults_0_bits_uop_ctrl_immType),
    .io_InExeResults_0_bits_uop_ctrl_rfWen(writeback_io_InExeResults_0_bits_uop_ctrl_rfWen),
    .io_InExeResults_0_bits_uop_ctrl_memRead(writeback_io_InExeResults_0_bits_uop_ctrl_memRead),
    .io_InExeResults_0_bits_uop_ctrl_memWrite(writeback_io_InExeResults_0_bits_uop_ctrl_memWrite),
    .io_InExeResults_0_bits_uop_ctrl_csrWen(writeback_io_InExeResults_0_bits_uop_ctrl_csrWen),
    .io_InExeResults_0_bits_uop_ctrl_isBranch(writeback_io_InExeResults_0_bits_uop_ctrl_isBranch),
    .io_InExeResults_0_bits_uop_ctrl_isJump(writeback_io_InExeResults_0_bits_uop_ctrl_isJump),
    .io_InExeResults_0_bits_uop_ctrl_isPriv(writeback_io_InExeResults_0_bits_uop_ctrl_isPriv),
    .io_InExeResults_0_bits_uop_excp_excpVec(writeback_io_InExeResults_0_bits_uop_excp_excpVec),
    .io_InExeResults_0_bits_uop_imm(writeback_io_InExeResults_0_bits_uop_imm),
    .io_InExeResults_0_bits_uop_csrAddress(writeback_io_InExeResults_0_bits_uop_csrAddress),
    .io_InExeResults_0_bits_uop_pdInfo_valid(writeback_io_InExeResults_0_bits_uop_pdInfo_valid),
    .io_InExeResults_0_bits_uop_pdInfo_isBr(writeback_io_InExeResults_0_bits_uop_pdInfo_isBr),
    .io_InExeResults_0_bits_uop_pdInfo_isJal(writeback_io_InExeResults_0_bits_uop_pdInfo_isJal),
    .io_InExeResults_0_bits_uop_pdInfo_isJalr(writeback_io_InExeResults_0_bits_uop_pdInfo_isJalr),
    .io_InExeResults_0_bits_uop_pdInfo_isCall(writeback_io_InExeResults_0_bits_uop_pdInfo_isCall),
    .io_InExeResults_0_bits_uop_pdInfo_isRet(writeback_io_InExeResults_0_bits_uop_pdInfo_isRet),
    .io_InExeResults_0_bits_uop_pdInfo_jumpTarget(writeback_io_InExeResults_0_bits_uop_pdInfo_jumpTarget),
    .io_InExeResults_0_bits_uop_bpuInfo_pc(writeback_io_InExeResults_0_bits_uop_bpuInfo_pc),
    .io_InExeResults_0_bits_uop_bpuInfo_fallThrough(writeback_io_InExeResults_0_bits_uop_bpuInfo_fallThrough),
    .io_InExeResults_0_bits_uop_bpuInfo_taken(writeback_io_InExeResults_0_bits_uop_bpuInfo_taken),
    .io_InExeResults_0_bits_uop_bpuInfo_target(writeback_io_InExeResults_0_bits_uop_bpuInfo_target),
    .io_InExeResults_0_bits_uop_bpuInfo_takenOffset(writeback_io_InExeResults_0_bits_uop_bpuInfo_takenOffset),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_valid(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_valid),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_btbHit(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbHit),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJalr(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJal(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJal),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsCall(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsCall),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsRet(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsRet),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_btbOffset(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbOffset),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_phtCounter(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_phtCounter),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_rasTop(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_rasTop),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_predTaken(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_predTaken),
    .io_InExeResults_0_bits_uop_bpuInfo_meta_predTarget(writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_predTarget),
    .io_InExeResults_0_bits_uop_ldst(writeback_io_InExeResults_0_bits_uop_ldst),
    .io_InExeResults_0_bits_uop_lrs1(writeback_io_InExeResults_0_bits_uop_lrs1),
    .io_InExeResults_0_bits_uop_lrs2(writeback_io_InExeResults_0_bits_uop_lrs2),
    .io_InExeResults_0_bits_uop_pdst(writeback_io_InExeResults_0_bits_uop_pdst),
    .io_InExeResults_0_bits_uop_prs1(writeback_io_InExeResults_0_bits_uop_prs1),
    .io_InExeResults_0_bits_uop_prs2(writeback_io_InExeResults_0_bits_uop_prs2),
    .io_InExeResults_0_bits_uop_oldPdst(writeback_io_InExeResults_0_bits_uop_oldPdst),
    .io_InExeResults_0_bits_uop_rs1Valid(writeback_io_InExeResults_0_bits_uop_rs1Valid),
    .io_InExeResults_0_bits_uop_rs2Valid(writeback_io_InExeResults_0_bits_uop_rs2Valid),
    .io_InExeResults_0_bits_uop_rdValid(writeback_io_InExeResults_0_bits_uop_rdValid),
    .io_InExeResults_0_bits_uop_snptId_valid(writeback_io_InExeResults_0_bits_uop_snptId_valid),
    .io_InExeResults_0_bits_uop_snptId_bits(writeback_io_InExeResults_0_bits_uop_snptId_bits),
    .io_InExeResults_0_bits_uop_robIdx_value(writeback_io_InExeResults_0_bits_uop_robIdx_value),
    .io_InExeResults_0_bits_uop_robIdx_flag(writeback_io_InExeResults_0_bits_uop_robIdx_flag),
    .io_InExeResults_0_bits_uop_robIdxFull_value(writeback_io_InExeResults_0_bits_uop_robIdxFull_value),
    .io_InExeResults_0_bits_uop_robIdxFull_flag(writeback_io_InExeResults_0_bits_uop_robIdxFull_flag),
    .io_InExeResults_0_bits_uop_lqIdx_value(writeback_io_InExeResults_0_bits_uop_lqIdx_value),
    .io_InExeResults_0_bits_uop_lqIdx_flag(writeback_io_InExeResults_0_bits_uop_lqIdx_flag),
    .io_InExeResults_0_bits_uop_sqIdx_value(writeback_io_InExeResults_0_bits_uop_sqIdx_value),
    .io_InExeResults_0_bits_uop_sqIdx_flag(writeback_io_InExeResults_0_bits_uop_sqIdx_flag),
    .io_InExeResults_0_bits_uop_issueQueue(writeback_io_InExeResults_0_bits_uop_issueQueue),
    .io_InExeResults_0_bits_uop_prs1Busy(writeback_io_InExeResults_0_bits_uop_prs1Busy),
    .io_InExeResults_0_bits_uop_prs2Busy(writeback_io_InExeResults_0_bits_uop_prs2Busy),
    .io_InExeResults_0_bits_uop_isSta(writeback_io_InExeResults_0_bits_uop_isSta),
    .io_InExeResults_0_bits_uop_isStd(writeback_io_InExeResults_0_bits_uop_isStd),
    .io_InExeResults_0_bits_data(writeback_io_InExeResults_0_bits_data),
    .io_InExeResults_0_bits_memStoreData(writeback_io_InExeResults_0_bits_memStoreData),
    .io_InExeResults_0_bits_csrWen(writeback_io_InExeResults_0_bits_csrWen),
    .io_InExeResults_0_bits_csrWaddr(writeback_io_InExeResults_0_bits_csrWaddr),
    .io_InExeResults_0_bits_csrWdata(writeback_io_InExeResults_0_bits_csrWdata),
    .io_InExeResults_0_bits_csrTimer(writeback_io_InExeResults_0_bits_csrTimer),
    .io_InExeResults_1_ready(writeback_io_InExeResults_1_ready),
    .io_InExeResults_1_valid(writeback_io_InExeResults_1_valid),
    .io_InExeResults_1_bits_uop_pc(writeback_io_InExeResults_1_bits_uop_pc),
    .io_InExeResults_1_bits_uop_inst(writeback_io_InExeResults_1_bits_uop_inst),
    .io_InExeResults_1_bits_uop_ctrl_fuType(writeback_io_InExeResults_1_bits_uop_ctrl_fuType),
    .io_InExeResults_1_bits_uop_ctrl_aluOp(writeback_io_InExeResults_1_bits_uop_ctrl_aluOp),
    .io_InExeResults_1_bits_uop_ctrl_bruOp(writeback_io_InExeResults_1_bits_uop_ctrl_bruOp),
    .io_InExeResults_1_bits_uop_ctrl_lsuOp(writeback_io_InExeResults_1_bits_uop_ctrl_lsuOp),
    .io_InExeResults_1_bits_uop_ctrl_csrOp(writeback_io_InExeResults_1_bits_uop_ctrl_csrOp),
    .io_InExeResults_1_bits_uop_ctrl_mulOp(writeback_io_InExeResults_1_bits_uop_ctrl_mulOp),
    .io_InExeResults_1_bits_uop_ctrl_divOp(writeback_io_InExeResults_1_bits_uop_ctrl_divOp),
    .io_InExeResults_1_bits_uop_ctrl_src1Type(writeback_io_InExeResults_1_bits_uop_ctrl_src1Type),
    .io_InExeResults_1_bits_uop_ctrl_src2Type(writeback_io_InExeResults_1_bits_uop_ctrl_src2Type),
    .io_InExeResults_1_bits_uop_ctrl_immType(writeback_io_InExeResults_1_bits_uop_ctrl_immType),
    .io_InExeResults_1_bits_uop_ctrl_rfWen(writeback_io_InExeResults_1_bits_uop_ctrl_rfWen),
    .io_InExeResults_1_bits_uop_ctrl_memRead(writeback_io_InExeResults_1_bits_uop_ctrl_memRead),
    .io_InExeResults_1_bits_uop_ctrl_memWrite(writeback_io_InExeResults_1_bits_uop_ctrl_memWrite),
    .io_InExeResults_1_bits_uop_ctrl_csrWen(writeback_io_InExeResults_1_bits_uop_ctrl_csrWen),
    .io_InExeResults_1_bits_uop_ctrl_isBranch(writeback_io_InExeResults_1_bits_uop_ctrl_isBranch),
    .io_InExeResults_1_bits_uop_ctrl_isJump(writeback_io_InExeResults_1_bits_uop_ctrl_isJump),
    .io_InExeResults_1_bits_uop_ctrl_isPriv(writeback_io_InExeResults_1_bits_uop_ctrl_isPriv),
    .io_InExeResults_1_bits_uop_excp_excpVec(writeback_io_InExeResults_1_bits_uop_excp_excpVec),
    .io_InExeResults_1_bits_uop_imm(writeback_io_InExeResults_1_bits_uop_imm),
    .io_InExeResults_1_bits_uop_csrAddress(writeback_io_InExeResults_1_bits_uop_csrAddress),
    .io_InExeResults_1_bits_uop_pdInfo_valid(writeback_io_InExeResults_1_bits_uop_pdInfo_valid),
    .io_InExeResults_1_bits_uop_pdInfo_isBr(writeback_io_InExeResults_1_bits_uop_pdInfo_isBr),
    .io_InExeResults_1_bits_uop_pdInfo_isJal(writeback_io_InExeResults_1_bits_uop_pdInfo_isJal),
    .io_InExeResults_1_bits_uop_pdInfo_isJalr(writeback_io_InExeResults_1_bits_uop_pdInfo_isJalr),
    .io_InExeResults_1_bits_uop_pdInfo_isCall(writeback_io_InExeResults_1_bits_uop_pdInfo_isCall),
    .io_InExeResults_1_bits_uop_pdInfo_isRet(writeback_io_InExeResults_1_bits_uop_pdInfo_isRet),
    .io_InExeResults_1_bits_uop_pdInfo_jumpTarget(writeback_io_InExeResults_1_bits_uop_pdInfo_jumpTarget),
    .io_InExeResults_1_bits_uop_bpuInfo_pc(writeback_io_InExeResults_1_bits_uop_bpuInfo_pc),
    .io_InExeResults_1_bits_uop_bpuInfo_fallThrough(writeback_io_InExeResults_1_bits_uop_bpuInfo_fallThrough),
    .io_InExeResults_1_bits_uop_bpuInfo_taken(writeback_io_InExeResults_1_bits_uop_bpuInfo_taken),
    .io_InExeResults_1_bits_uop_bpuInfo_target(writeback_io_InExeResults_1_bits_uop_bpuInfo_target),
    .io_InExeResults_1_bits_uop_bpuInfo_takenOffset(writeback_io_InExeResults_1_bits_uop_bpuInfo_takenOffset),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_valid(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_valid),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_btbHit(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbHit),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJalr(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJal(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJal),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsCall(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsCall),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsRet(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsRet),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_btbOffset(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbOffset),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_phtCounter(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_phtCounter),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_rasTop(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_rasTop),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_predTaken(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_predTaken),
    .io_InExeResults_1_bits_uop_bpuInfo_meta_predTarget(writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_predTarget),
    .io_InExeResults_1_bits_uop_ldst(writeback_io_InExeResults_1_bits_uop_ldst),
    .io_InExeResults_1_bits_uop_lrs1(writeback_io_InExeResults_1_bits_uop_lrs1),
    .io_InExeResults_1_bits_uop_lrs2(writeback_io_InExeResults_1_bits_uop_lrs2),
    .io_InExeResults_1_bits_uop_pdst(writeback_io_InExeResults_1_bits_uop_pdst),
    .io_InExeResults_1_bits_uop_prs1(writeback_io_InExeResults_1_bits_uop_prs1),
    .io_InExeResults_1_bits_uop_prs2(writeback_io_InExeResults_1_bits_uop_prs2),
    .io_InExeResults_1_bits_uop_oldPdst(writeback_io_InExeResults_1_bits_uop_oldPdst),
    .io_InExeResults_1_bits_uop_rs1Valid(writeback_io_InExeResults_1_bits_uop_rs1Valid),
    .io_InExeResults_1_bits_uop_rs2Valid(writeback_io_InExeResults_1_bits_uop_rs2Valid),
    .io_InExeResults_1_bits_uop_rdValid(writeback_io_InExeResults_1_bits_uop_rdValid),
    .io_InExeResults_1_bits_uop_snptId_valid(writeback_io_InExeResults_1_bits_uop_snptId_valid),
    .io_InExeResults_1_bits_uop_snptId_bits(writeback_io_InExeResults_1_bits_uop_snptId_bits),
    .io_InExeResults_1_bits_uop_robIdx_value(writeback_io_InExeResults_1_bits_uop_robIdx_value),
    .io_InExeResults_1_bits_uop_robIdx_flag(writeback_io_InExeResults_1_bits_uop_robIdx_flag),
    .io_InExeResults_1_bits_uop_robIdxFull_value(writeback_io_InExeResults_1_bits_uop_robIdxFull_value),
    .io_InExeResults_1_bits_uop_robIdxFull_flag(writeback_io_InExeResults_1_bits_uop_robIdxFull_flag),
    .io_InExeResults_1_bits_uop_issueQueue(writeback_io_InExeResults_1_bits_uop_issueQueue),
    .io_InExeResults_1_bits_uop_prs1Busy(writeback_io_InExeResults_1_bits_uop_prs1Busy),
    .io_InExeResults_1_bits_uop_prs2Busy(writeback_io_InExeResults_1_bits_uop_prs2Busy),
    .io_InExeResults_1_bits_data(writeback_io_InExeResults_1_bits_data),
    .io_InExeResults_1_bits_memStoreData(writeback_io_InExeResults_1_bits_memStoreData),
    .io_InExeResults_2_ready(writeback_io_InExeResults_2_ready),
    .io_InExeResults_2_valid(writeback_io_InExeResults_2_valid),
    .io_InExeResults_2_bits_uop_pc(writeback_io_InExeResults_2_bits_uop_pc),
    .io_InExeResults_2_bits_uop_inst(writeback_io_InExeResults_2_bits_uop_inst),
    .io_InExeResults_2_bits_uop_ctrl_fuType(writeback_io_InExeResults_2_bits_uop_ctrl_fuType),
    .io_InExeResults_2_bits_uop_ctrl_aluOp(writeback_io_InExeResults_2_bits_uop_ctrl_aluOp),
    .io_InExeResults_2_bits_uop_ctrl_bruOp(writeback_io_InExeResults_2_bits_uop_ctrl_bruOp),
    .io_InExeResults_2_bits_uop_ctrl_lsuOp(writeback_io_InExeResults_2_bits_uop_ctrl_lsuOp),
    .io_InExeResults_2_bits_uop_ctrl_csrOp(writeback_io_InExeResults_2_bits_uop_ctrl_csrOp),
    .io_InExeResults_2_bits_uop_ctrl_mulOp(writeback_io_InExeResults_2_bits_uop_ctrl_mulOp),
    .io_InExeResults_2_bits_uop_ctrl_divOp(writeback_io_InExeResults_2_bits_uop_ctrl_divOp),
    .io_InExeResults_2_bits_uop_ctrl_src1Type(writeback_io_InExeResults_2_bits_uop_ctrl_src1Type),
    .io_InExeResults_2_bits_uop_ctrl_src2Type(writeback_io_InExeResults_2_bits_uop_ctrl_src2Type),
    .io_InExeResults_2_bits_uop_ctrl_immType(writeback_io_InExeResults_2_bits_uop_ctrl_immType),
    .io_InExeResults_2_bits_uop_ctrl_rfWen(writeback_io_InExeResults_2_bits_uop_ctrl_rfWen),
    .io_InExeResults_2_bits_uop_ctrl_memRead(writeback_io_InExeResults_2_bits_uop_ctrl_memRead),
    .io_InExeResults_2_bits_uop_ctrl_memWrite(writeback_io_InExeResults_2_bits_uop_ctrl_memWrite),
    .io_InExeResults_2_bits_uop_ctrl_csrWen(writeback_io_InExeResults_2_bits_uop_ctrl_csrWen),
    .io_InExeResults_2_bits_uop_ctrl_isBranch(writeback_io_InExeResults_2_bits_uop_ctrl_isBranch),
    .io_InExeResults_2_bits_uop_ctrl_isJump(writeback_io_InExeResults_2_bits_uop_ctrl_isJump),
    .io_InExeResults_2_bits_uop_ctrl_isPriv(writeback_io_InExeResults_2_bits_uop_ctrl_isPriv),
    .io_InExeResults_2_bits_uop_excp_excpVec(writeback_io_InExeResults_2_bits_uop_excp_excpVec),
    .io_InExeResults_2_bits_uop_imm(writeback_io_InExeResults_2_bits_uop_imm),
    .io_InExeResults_2_bits_uop_csrAddress(writeback_io_InExeResults_2_bits_uop_csrAddress),
    .io_InExeResults_2_bits_uop_pdInfo_valid(writeback_io_InExeResults_2_bits_uop_pdInfo_valid),
    .io_InExeResults_2_bits_uop_pdInfo_isBr(writeback_io_InExeResults_2_bits_uop_pdInfo_isBr),
    .io_InExeResults_2_bits_uop_pdInfo_isJal(writeback_io_InExeResults_2_bits_uop_pdInfo_isJal),
    .io_InExeResults_2_bits_uop_pdInfo_isJalr(writeback_io_InExeResults_2_bits_uop_pdInfo_isJalr),
    .io_InExeResults_2_bits_uop_pdInfo_isCall(writeback_io_InExeResults_2_bits_uop_pdInfo_isCall),
    .io_InExeResults_2_bits_uop_pdInfo_isRet(writeback_io_InExeResults_2_bits_uop_pdInfo_isRet),
    .io_InExeResults_2_bits_uop_pdInfo_jumpTarget(writeback_io_InExeResults_2_bits_uop_pdInfo_jumpTarget),
    .io_InExeResults_2_bits_uop_bpuInfo_pc(writeback_io_InExeResults_2_bits_uop_bpuInfo_pc),
    .io_InExeResults_2_bits_uop_bpuInfo_fallThrough(writeback_io_InExeResults_2_bits_uop_bpuInfo_fallThrough),
    .io_InExeResults_2_bits_uop_bpuInfo_taken(writeback_io_InExeResults_2_bits_uop_bpuInfo_taken),
    .io_InExeResults_2_bits_uop_bpuInfo_target(writeback_io_InExeResults_2_bits_uop_bpuInfo_target),
    .io_InExeResults_2_bits_uop_bpuInfo_takenOffset(writeback_io_InExeResults_2_bits_uop_bpuInfo_takenOffset),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_valid(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_valid),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_btbHit(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbHit),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJalr(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJal(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJal),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsCall(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsCall),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsRet(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsRet),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_btbOffset(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbOffset),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_phtCounter(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_phtCounter),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_rasTop(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_rasTop),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_predTaken(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_predTaken),
    .io_InExeResults_2_bits_uop_bpuInfo_meta_predTarget(writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_predTarget),
    .io_InExeResults_2_bits_uop_ldst(writeback_io_InExeResults_2_bits_uop_ldst),
    .io_InExeResults_2_bits_uop_lrs1(writeback_io_InExeResults_2_bits_uop_lrs1),
    .io_InExeResults_2_bits_uop_lrs2(writeback_io_InExeResults_2_bits_uop_lrs2),
    .io_InExeResults_2_bits_uop_pdst(writeback_io_InExeResults_2_bits_uop_pdst),
    .io_InExeResults_2_bits_uop_prs1(writeback_io_InExeResults_2_bits_uop_prs1),
    .io_InExeResults_2_bits_uop_prs2(writeback_io_InExeResults_2_bits_uop_prs2),
    .io_InExeResults_2_bits_uop_oldPdst(writeback_io_InExeResults_2_bits_uop_oldPdst),
    .io_InExeResults_2_bits_uop_rs1Valid(writeback_io_InExeResults_2_bits_uop_rs1Valid),
    .io_InExeResults_2_bits_uop_rs2Valid(writeback_io_InExeResults_2_bits_uop_rs2Valid),
    .io_InExeResults_2_bits_uop_rdValid(writeback_io_InExeResults_2_bits_uop_rdValid),
    .io_InExeResults_2_bits_uop_snptId_valid(writeback_io_InExeResults_2_bits_uop_snptId_valid),
    .io_InExeResults_2_bits_uop_snptId_bits(writeback_io_InExeResults_2_bits_uop_snptId_bits),
    .io_InExeResults_2_bits_uop_robIdx_value(writeback_io_InExeResults_2_bits_uop_robIdx_value),
    .io_InExeResults_2_bits_uop_robIdx_flag(writeback_io_InExeResults_2_bits_uop_robIdx_flag),
    .io_InExeResults_2_bits_uop_robIdxFull_value(writeback_io_InExeResults_2_bits_uop_robIdxFull_value),
    .io_InExeResults_2_bits_uop_robIdxFull_flag(writeback_io_InExeResults_2_bits_uop_robIdxFull_flag),
    .io_InExeResults_2_bits_uop_lqIdx_value(writeback_io_InExeResults_2_bits_uop_lqIdx_value),
    .io_InExeResults_2_bits_uop_lqIdx_flag(writeback_io_InExeResults_2_bits_uop_lqIdx_flag),
    .io_InExeResults_2_bits_uop_sqIdx_value(writeback_io_InExeResults_2_bits_uop_sqIdx_value),
    .io_InExeResults_2_bits_uop_sqIdx_flag(writeback_io_InExeResults_2_bits_uop_sqIdx_flag),
    .io_InExeResults_2_bits_uop_issueQueue(writeback_io_InExeResults_2_bits_uop_issueQueue),
    .io_InExeResults_2_bits_uop_prs1Busy(writeback_io_InExeResults_2_bits_uop_prs1Busy),
    .io_InExeResults_2_bits_uop_prs2Busy(writeback_io_InExeResults_2_bits_uop_prs2Busy),
    .io_InExeResults_2_bits_uop_isSta(writeback_io_InExeResults_2_bits_uop_isSta),
    .io_InExeResults_2_bits_uop_isStd(writeback_io_InExeResults_2_bits_uop_isStd),
    .io_InExeResults_2_bits_data(writeback_io_InExeResults_2_bits_data),
    .io_InExeResults_2_bits_memStoreData(writeback_io_InExeResults_2_bits_memStoreData),
    .io_InExeResults_3_ready(writeback_io_InExeResults_3_ready),
    .io_InExeResults_3_valid(writeback_io_InExeResults_3_valid),
    .io_InExeResults_3_bits_uop_pc(writeback_io_InExeResults_3_bits_uop_pc),
    .io_InExeResults_3_bits_uop_ctrl_fuType(writeback_io_InExeResults_3_bits_uop_ctrl_fuType),
    .io_InExeResults_3_bits_uop_ctrl_lsuOp(writeback_io_InExeResults_3_bits_uop_ctrl_lsuOp),
    .io_InExeResults_3_bits_uop_ctrl_rfWen(writeback_io_InExeResults_3_bits_uop_ctrl_rfWen),
    .io_InExeResults_3_bits_uop_excp_excpVec(writeback_io_InExeResults_3_bits_uop_excp_excpVec),
    .io_InExeResults_3_bits_uop_pdst(writeback_io_InExeResults_3_bits_uop_pdst),
    .io_InExeResults_3_bits_uop_rdValid(writeback_io_InExeResults_3_bits_uop_rdValid),
    .io_InExeResults_3_bits_uop_robIdx_value(writeback_io_InExeResults_3_bits_uop_robIdx_value),
    .io_InExeResults_3_bits_uop_robIdx_flag(writeback_io_InExeResults_3_bits_uop_robIdx_flag),
    .io_InExeResults_3_bits_uop_robIdxFull_value(writeback_io_InExeResults_3_bits_uop_robIdxFull_value),
    .io_InExeResults_3_bits_uop_robIdxFull_flag(writeback_io_InExeResults_3_bits_uop_robIdxFull_flag),
    .io_InExeResults_3_bits_uop_lqIdx_value(writeback_io_InExeResults_3_bits_uop_lqIdx_value),
    .io_InExeResults_3_bits_uop_sqIdx_value(writeback_io_InExeResults_3_bits_uop_sqIdx_value),
    .io_InExeResults_3_bits_data(writeback_io_InExeResults_3_bits_data),
    .io_InExeResults_3_bits_memVaddr(writeback_io_InExeResults_3_bits_memVaddr),
    .io_InExeResults_3_bits_memPaddr(writeback_io_InExeResults_3_bits_memPaddr),
    .io_InExeResults_4_ready(writeback_io_InExeResults_4_ready),
    .io_InExeResults_4_valid(writeback_io_InExeResults_4_valid),
    .io_InExeResults_4_bits_uop_pc(writeback_io_InExeResults_4_bits_uop_pc),
    .io_InExeResults_4_bits_uop_ctrl_fuType(writeback_io_InExeResults_4_bits_uop_ctrl_fuType),
    .io_InExeResults_4_bits_uop_ctrl_lsuOp(writeback_io_InExeResults_4_bits_uop_ctrl_lsuOp),
    .io_InExeResults_4_bits_uop_excp_excpVec(writeback_io_InExeResults_4_bits_uop_excp_excpVec),
    .io_InExeResults_4_bits_uop_pdst(writeback_io_InExeResults_4_bits_uop_pdst),
    .io_InExeResults_4_bits_uop_robIdx_value(writeback_io_InExeResults_4_bits_uop_robIdx_value),
    .io_InExeResults_4_bits_uop_robIdx_flag(writeback_io_InExeResults_4_bits_uop_robIdx_flag),
    .io_InExeResults_4_bits_uop_robIdxFull_value(writeback_io_InExeResults_4_bits_uop_robIdxFull_value),
    .io_InExeResults_4_bits_uop_robIdxFull_flag(writeback_io_InExeResults_4_bits_uop_robIdxFull_flag),
    .io_InExeResults_4_bits_uop_lqIdx_value(writeback_io_InExeResults_4_bits_uop_lqIdx_value),
    .io_InExeResults_4_bits_uop_sqIdx_value(writeback_io_InExeResults_4_bits_uop_sqIdx_value),
    .io_InExeResults_4_bits_redirect_bits_robIdx_value(writeback_io_InExeResults_4_bits_redirect_bits_robIdx_value),
    .io_InExeResults_4_bits_redirect_bits_robIdx_flag(writeback_io_InExeResults_4_bits_redirect_bits_robIdx_flag),
    .io_InExeResults_4_bits_memVaddr(writeback_io_InExeResults_4_bits_memVaddr),
    .io_InExeResults_4_bits_memPaddr(writeback_io_InExeResults_4_bits_memPaddr),
    .io_InExeResults_4_bits_memStoreData(writeback_io_InExeResults_4_bits_memStoreData),
    .io_rfWritePorts_0_valid(writeback_io_rfWritePorts_0_valid),
    .io_rfWritePorts_0_addr(writeback_io_rfWritePorts_0_addr),
    .io_rfWritePorts_0_data(writeback_io_rfWritePorts_0_data),
    .io_rfWritePorts_1_valid(writeback_io_rfWritePorts_1_valid),
    .io_rfWritePorts_1_addr(writeback_io_rfWritePorts_1_addr),
    .io_rfWritePorts_1_data(writeback_io_rfWritePorts_1_data),
    .io_rfWritePorts_2_valid(writeback_io_rfWritePorts_2_valid),
    .io_rfWritePorts_2_addr(writeback_io_rfWritePorts_2_addr),
    .io_rfWritePorts_2_data(writeback_io_rfWritePorts_2_data),
    .io_rfWritePorts_3_valid(writeback_io_rfWritePorts_3_valid),
    .io_rfWritePorts_3_addr(writeback_io_rfWritePorts_3_addr),
    .io_rfWritePorts_3_data(writeback_io_rfWritePorts_3_data),
    .io_rfWritePorts_4_valid(writeback_io_rfWritePorts_4_valid),
    .io_rfWritePorts_4_addr(writeback_io_rfWritePorts_4_addr),
    .io_rfWritePorts_4_data(writeback_io_rfWritePorts_4_data),
    .io_wakeupPorts_0_valid(writeback_io_wakeupPorts_0_valid),
    .io_wakeupPorts_0_bits_pdst(writeback_io_wakeupPorts_0_bits_pdst),
    .io_wakeupPorts_1_valid(writeback_io_wakeupPorts_1_valid),
    .io_wakeupPorts_1_bits_pdst(writeback_io_wakeupPorts_1_bits_pdst),
    .io_wakeupPorts_2_valid(writeback_io_wakeupPorts_2_valid),
    .io_wakeupPorts_2_bits_pdst(writeback_io_wakeupPorts_2_bits_pdst),
    .io_wakeupPorts_3_valid(writeback_io_wakeupPorts_3_valid),
    .io_wakeupPorts_3_bits_pdst(writeback_io_wakeupPorts_3_bits_pdst),
    .io_wakeupPorts_4_valid(writeback_io_wakeupPorts_4_valid),
    .io_wakeupPorts_4_bits_pdst(writeback_io_wakeupPorts_4_bits_pdst),
    .io_toRObResults_0_valid(writeback_io_toRObResults_0_valid),
    .io_toRObResults_0_bits_robIdx_value(writeback_io_toRObResults_0_bits_robIdx_value),
    .io_toRObResults_0_bits_robIdx_flag(writeback_io_toRObResults_0_bits_robIdx_flag),
    .io_toRObResults_0_bits_sqIdx_value(writeback_io_toRObResults_0_bits_sqIdx_value),
    .io_toRObResults_0_bits_sqIdx_flag(writeback_io_toRObResults_0_bits_sqIdx_flag),
    .io_toRObResults_0_bits_isMemWrite(writeback_io_toRObResults_0_bits_isMemWrite),
    .io_toRObResults_0_bits_isMemRead(writeback_io_toRObResults_0_bits_isMemRead),
    .io_toRObResults_0_bits_memValid(writeback_io_toRObResults_0_bits_memValid),
    .io_toRObResults_0_bits_memVaddr(writeback_io_toRObResults_0_bits_memVaddr),
    .io_toRObResults_0_bits_memPaddr(writeback_io_toRObResults_0_bits_memPaddr),
    .io_toRObResults_0_bits_memStoreData(writeback_io_toRObResults_0_bits_memStoreData),
    .io_toRObResults_0_bits_rfdata(writeback_io_toRObResults_0_bits_rfdata),
    .io_toRObResults_0_bits_csrWen(writeback_io_toRObResults_0_bits_csrWen),
    .io_toRObResults_0_bits_csrWaddr(writeback_io_toRObResults_0_bits_csrWaddr),
    .io_toRObResults_0_bits_csrWdata(writeback_io_toRObResults_0_bits_csrWdata),
    .io_toRObResults_0_bits_csrTimer(writeback_io_toRObResults_0_bits_csrTimer),
    .io_toRObResults_0_bits_excp_excpVec(writeback_io_toRObResults_0_bits_excp_excpVec),
    .io_toRObResults_0_bits_isBypass(writeback_io_toRObResults_0_bits_isBypass),
    .io_toRObResults_1_valid(writeback_io_toRObResults_1_valid),
    .io_toRObResults_1_bits_robIdx_value(writeback_io_toRObResults_1_bits_robIdx_value),
    .io_toRObResults_1_bits_robIdx_flag(writeback_io_toRObResults_1_bits_robIdx_flag),
    .io_toRObResults_1_bits_sqIdx_value(writeback_io_toRObResults_1_bits_sqIdx_value),
    .io_toRObResults_1_bits_sqIdx_flag(writeback_io_toRObResults_1_bits_sqIdx_flag),
    .io_toRObResults_1_bits_isMemWrite(writeback_io_toRObResults_1_bits_isMemWrite),
    .io_toRObResults_1_bits_isMemRead(writeback_io_toRObResults_1_bits_isMemRead),
    .io_toRObResults_1_bits_memValid(writeback_io_toRObResults_1_bits_memValid),
    .io_toRObResults_1_bits_memVaddr(writeback_io_toRObResults_1_bits_memVaddr),
    .io_toRObResults_1_bits_memPaddr(writeback_io_toRObResults_1_bits_memPaddr),
    .io_toRObResults_1_bits_memStoreData(writeback_io_toRObResults_1_bits_memStoreData),
    .io_toRObResults_1_bits_rfdata(writeback_io_toRObResults_1_bits_rfdata),
    .io_toRObResults_1_bits_csrWen(writeback_io_toRObResults_1_bits_csrWen),
    .io_toRObResults_1_bits_csrWaddr(writeback_io_toRObResults_1_bits_csrWaddr),
    .io_toRObResults_1_bits_csrWdata(writeback_io_toRObResults_1_bits_csrWdata),
    .io_toRObResults_1_bits_csrTimer(writeback_io_toRObResults_1_bits_csrTimer),
    .io_toRObResults_1_bits_excp_excpVec(writeback_io_toRObResults_1_bits_excp_excpVec),
    .io_toRObResults_1_bits_isBypass(writeback_io_toRObResults_1_bits_isBypass),
    .io_toRObResults_2_valid(writeback_io_toRObResults_2_valid),
    .io_toRObResults_2_bits_robIdx_value(writeback_io_toRObResults_2_bits_robIdx_value),
    .io_toRObResults_2_bits_robIdx_flag(writeback_io_toRObResults_2_bits_robIdx_flag),
    .io_toRObResults_2_bits_sqIdx_value(writeback_io_toRObResults_2_bits_sqIdx_value),
    .io_toRObResults_2_bits_sqIdx_flag(writeback_io_toRObResults_2_bits_sqIdx_flag),
    .io_toRObResults_2_bits_isMemWrite(writeback_io_toRObResults_2_bits_isMemWrite),
    .io_toRObResults_2_bits_isMemRead(writeback_io_toRObResults_2_bits_isMemRead),
    .io_toRObResults_2_bits_memValid(writeback_io_toRObResults_2_bits_memValid),
    .io_toRObResults_2_bits_memVaddr(writeback_io_toRObResults_2_bits_memVaddr),
    .io_toRObResults_2_bits_memPaddr(writeback_io_toRObResults_2_bits_memPaddr),
    .io_toRObResults_2_bits_memStoreData(writeback_io_toRObResults_2_bits_memStoreData),
    .io_toRObResults_2_bits_rfdata(writeback_io_toRObResults_2_bits_rfdata),
    .io_toRObResults_2_bits_csrWen(writeback_io_toRObResults_2_bits_csrWen),
    .io_toRObResults_2_bits_csrWaddr(writeback_io_toRObResults_2_bits_csrWaddr),
    .io_toRObResults_2_bits_csrWdata(writeback_io_toRObResults_2_bits_csrWdata),
    .io_toRObResults_2_bits_csrTimer(writeback_io_toRObResults_2_bits_csrTimer),
    .io_toRObResults_2_bits_excp_excpVec(writeback_io_toRObResults_2_bits_excp_excpVec),
    .io_toRObResults_2_bits_isBypass(writeback_io_toRObResults_2_bits_isBypass),
    .io_toRObResults_3_valid(writeback_io_toRObResults_3_valid),
    .io_toRObResults_3_bits_robIdx_value(writeback_io_toRObResults_3_bits_robIdx_value),
    .io_toRObResults_3_bits_robIdx_flag(writeback_io_toRObResults_3_bits_robIdx_flag),
    .io_toRObResults_3_bits_sqIdx_value(writeback_io_toRObResults_3_bits_sqIdx_value),
    .io_toRObResults_3_bits_sqIdx_flag(writeback_io_toRObResults_3_bits_sqIdx_flag),
    .io_toRObResults_3_bits_isMemWrite(writeback_io_toRObResults_3_bits_isMemWrite),
    .io_toRObResults_3_bits_isMemRead(writeback_io_toRObResults_3_bits_isMemRead),
    .io_toRObResults_3_bits_memValid(writeback_io_toRObResults_3_bits_memValid),
    .io_toRObResults_3_bits_memVaddr(writeback_io_toRObResults_3_bits_memVaddr),
    .io_toRObResults_3_bits_memPaddr(writeback_io_toRObResults_3_bits_memPaddr),
    .io_toRObResults_3_bits_memStoreData(writeback_io_toRObResults_3_bits_memStoreData),
    .io_toRObResults_3_bits_rfdata(writeback_io_toRObResults_3_bits_rfdata),
    .io_toRObResults_3_bits_csrWen(writeback_io_toRObResults_3_bits_csrWen),
    .io_toRObResults_3_bits_csrWaddr(writeback_io_toRObResults_3_bits_csrWaddr),
    .io_toRObResults_3_bits_csrWdata(writeback_io_toRObResults_3_bits_csrWdata),
    .io_toRObResults_3_bits_csrTimer(writeback_io_toRObResults_3_bits_csrTimer),
    .io_toRObResults_3_bits_excp_excpVec(writeback_io_toRObResults_3_bits_excp_excpVec),
    .io_toRObResults_3_bits_isBypass(writeback_io_toRObResults_3_bits_isBypass),
    .io_toRObResults_4_valid(writeback_io_toRObResults_4_valid),
    .io_toRObResults_4_bits_robIdx_value(writeback_io_toRObResults_4_bits_robIdx_value),
    .io_toRObResults_4_bits_robIdx_flag(writeback_io_toRObResults_4_bits_robIdx_flag),
    .io_toRObResults_4_bits_sqIdx_value(writeback_io_toRObResults_4_bits_sqIdx_value),
    .io_toRObResults_4_bits_sqIdx_flag(writeback_io_toRObResults_4_bits_sqIdx_flag),
    .io_toRObResults_4_bits_isMemWrite(writeback_io_toRObResults_4_bits_isMemWrite),
    .io_toRObResults_4_bits_isMemRead(writeback_io_toRObResults_4_bits_isMemRead),
    .io_toRObResults_4_bits_memValid(writeback_io_toRObResults_4_bits_memValid),
    .io_toRObResults_4_bits_memVaddr(writeback_io_toRObResults_4_bits_memVaddr),
    .io_toRObResults_4_bits_memPaddr(writeback_io_toRObResults_4_bits_memPaddr),
    .io_toRObResults_4_bits_memStoreData(writeback_io_toRObResults_4_bits_memStoreData),
    .io_toRObResults_4_bits_rfdata(writeback_io_toRObResults_4_bits_rfdata),
    .io_toRObResults_4_bits_csrWen(writeback_io_toRObResults_4_bits_csrWen),
    .io_toRObResults_4_bits_csrWaddr(writeback_io_toRObResults_4_bits_csrWaddr),
    .io_toRObResults_4_bits_csrWdata(writeback_io_toRObResults_4_bits_csrWdata),
    .io_toRObResults_4_bits_csrTimer(writeback_io_toRObResults_4_bits_csrTimer),
    .io_toRObResults_4_bits_excp_excpVec(writeback_io_toRObResults_4_bits_excp_excpVec),
    .io_toRObResults_4_bits_isBypass(writeback_io_toRObResults_4_bits_isBypass)
  );
  assign io_in_0_ready = ctrlBlock_io_in_0_ready; // @[src/main/scala/backend/Backend.scala 120:23]
  assign io_in_1_ready = ctrlBlock_io_in_1_ready; // @[src/main/scala/backend/Backend.scala 120:23]
  assign io_in_2_ready = ctrlBlock_io_in_2_ready; // @[src/main/scala/backend/Backend.scala 120:23]
  assign io_redirectInfo_valid = ctrlBlock_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 111:19]
  assign io_redirectInfo_bits_doRedirect = ctrlBlock_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 111:19]
  assign io_redirectInfo_bits_robIdx_value = ctrlBlock_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 111:19]
  assign io_redirectInfo_bits_robIdx_flag = ctrlBlock_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 111:19]
  assign io_redirectInfo_bits_target = ctrlBlock_io_redirectInfo_bits_target; // @[src/main/scala/backend/Backend.scala 111:19]
  assign io_csrReq_addr = exeUnits_0_io_csrRaddr; // @[src/main/scala/backend/Backend.scala 92:18]
  assign io_lsEnq_req_valid = ctrlBlock_io_lsEnq_req_valid; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_robIdx_value = ctrlBlock_io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_robIdx_flag = ctrlBlock_io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_isLoad = ctrlBlock_io_lsEnq_req_bits_isLoad; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_isStore = ctrlBlock_io_lsEnq_req_bits_isStore; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_sqIdx_value = ctrlBlock_io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_sqIdx_flag = ctrlBlock_io_lsEnq_req_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_lqIdx_value = ctrlBlock_io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_req_bits_lqIdx_flag = ctrlBlock_io_lsEnq_req_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pc = ctrlBlock_io_lsEnq_toLsqData_pc; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_inst = ctrlBlock_io_lsEnq_toLsqData_inst; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_fuType = ctrlBlock_io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_aluOp = ctrlBlock_io_lsEnq_toLsqData_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_bruOp = ctrlBlock_io_lsEnq_toLsqData_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_lsuOp = ctrlBlock_io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_csrOp = ctrlBlock_io_lsEnq_toLsqData_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_mulOp = ctrlBlock_io_lsEnq_toLsqData_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_divOp = ctrlBlock_io_lsEnq_toLsqData_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_src1Type = ctrlBlock_io_lsEnq_toLsqData_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_src2Type = ctrlBlock_io_lsEnq_toLsqData_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_immType = ctrlBlock_io_lsEnq_toLsqData_ctrl_immType; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_rfWen = ctrlBlock_io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_memRead = ctrlBlock_io_lsEnq_toLsqData_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_memWrite = ctrlBlock_io_lsEnq_toLsqData_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_csrWen = ctrlBlock_io_lsEnq_toLsqData_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_isBranch = ctrlBlock_io_lsEnq_toLsqData_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_isJump = ctrlBlock_io_lsEnq_toLsqData_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ctrl_isPriv = ctrlBlock_io_lsEnq_toLsqData_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_excp_excpVec = ctrlBlock_io_lsEnq_toLsqData_excp_excpVec; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_imm = ctrlBlock_io_lsEnq_toLsqData_imm; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_csrAddress = ctrlBlock_io_lsEnq_toLsqData_csrAddress; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdInfo_valid = ctrlBlock_io_lsEnq_toLsqData_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdInfo_isBr = ctrlBlock_io_lsEnq_toLsqData_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdInfo_isJal = ctrlBlock_io_lsEnq_toLsqData_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdInfo_isJalr = ctrlBlock_io_lsEnq_toLsqData_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdInfo_isCall = ctrlBlock_io_lsEnq_toLsqData_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdInfo_isRet = ctrlBlock_io_lsEnq_toLsqData_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdInfo_jumpTarget = ctrlBlock_io_lsEnq_toLsqData_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_pc = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_fallThrough = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_taken = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_target = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_takenOffset = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_valid = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbHit = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_btbOffset = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_phtCounter = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_rasTop = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_predTaken = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_bpuInfo_meta_predTarget = ctrlBlock_io_lsEnq_toLsqData_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_ldst = ctrlBlock_io_lsEnq_toLsqData_ldst; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_lrs1 = ctrlBlock_io_lsEnq_toLsqData_lrs1; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_lrs2 = ctrlBlock_io_lsEnq_toLsqData_lrs2; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_pdst = ctrlBlock_io_lsEnq_toLsqData_pdst; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_prs1 = ctrlBlock_io_lsEnq_toLsqData_prs1; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_prs2 = ctrlBlock_io_lsEnq_toLsqData_prs2; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_oldPdst = ctrlBlock_io_lsEnq_toLsqData_oldPdst; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_snptId_valid = ctrlBlock_io_lsEnq_toLsqData_snptId_valid; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_snptId_bits = ctrlBlock_io_lsEnq_toLsqData_snptId_bits; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_rs1Valid = ctrlBlock_io_lsEnq_toLsqData_rs1Valid; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_rs2Valid = ctrlBlock_io_lsEnq_toLsqData_rs2Valid; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_rdValid = ctrlBlock_io_lsEnq_toLsqData_rdValid; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_robIdx_value = ctrlBlock_io_lsEnq_toLsqData_robIdx_value; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_lsEnq_toLsqData_robIdx_flag = ctrlBlock_io_lsEnq_toLsqData_robIdx_flag; // @[src/main/scala/backend/Backend.scala 61:12]
  assign io_toMemResult_0_valid = exeUnits_3_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pc = exeUnits_3_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_inst = exeUnits_3_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_fuType = exeUnits_3_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_aluOp = exeUnits_3_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_bruOp = exeUnits_3_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_lsuOp = exeUnits_3_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_csrOp = exeUnits_3_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_mulOp = exeUnits_3_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_divOp = exeUnits_3_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_src1Type = exeUnits_3_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_src2Type = exeUnits_3_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_immType = exeUnits_3_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_rfWen = exeUnits_3_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_memRead = exeUnits_3_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_memWrite = exeUnits_3_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_csrWen = exeUnits_3_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_isBranch = exeUnits_3_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_isJump = exeUnits_3_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ctrl_isPriv = exeUnits_3_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_excp_excpVec = exeUnits_3_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_imm = exeUnits_3_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_csrAddress = exeUnits_3_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdInfo_valid = exeUnits_3_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdInfo_isBr = exeUnits_3_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdInfo_isJal = exeUnits_3_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdInfo_isJalr = exeUnits_3_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdInfo_isCall = exeUnits_3_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdInfo_isRet = exeUnits_3_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdInfo_jumpTarget = exeUnits_3_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_pc = exeUnits_3_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_fallThrough = exeUnits_3_io_outResult_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_taken = exeUnits_3_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_target = exeUnits_3_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_takenOffset = exeUnits_3_io_outResult_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_valid = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget = exeUnits_3_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_ldst = exeUnits_3_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_lrs1 = exeUnits_3_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_lrs2 = exeUnits_3_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_pdst = exeUnits_3_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_prs1 = exeUnits_3_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_prs2 = exeUnits_3_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_oldPdst = exeUnits_3_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_rs1Valid = exeUnits_3_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_rs2Valid = exeUnits_3_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_rdValid = exeUnits_3_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_snptId_valid = exeUnits_3_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_snptId_bits = exeUnits_3_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_robIdx_value = exeUnits_3_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_robIdx_flag = exeUnits_3_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_robIdxFull_value = exeUnits_3_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_robIdxFull_flag = exeUnits_3_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_lqIdx_value = exeUnits_3_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_lqIdx_flag = exeUnits_3_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_sqIdx_value = exeUnits_3_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_sqIdx_flag = exeUnits_3_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_issueQueue = exeUnits_3_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_prs1Busy = exeUnits_3_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_prs2Busy = exeUnits_3_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_isSta = exeUnits_3_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_uop_isStd = exeUnits_3_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_data = exeUnits_3_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_redirect_valid = exeUnits_3_io_outResult_bits_redirect_valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_redirect_bits_valid = exeUnits_3_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_redirect_bits_robIdx_value = exeUnits_3_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_redirect_bits_robIdx_flag = exeUnits_3_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_memValid = exeUnits_3_io_outResult_bits_memValid; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_memRead = exeUnits_3_io_outResult_bits_memRead; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_memWrite = exeUnits_3_io_outResult_bits_memWrite; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_memVaddr = exeUnits_3_io_outResult_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_memPaddr = exeUnits_3_io_outResult_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_memStoreData = exeUnits_3_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_csrWen = exeUnits_3_io_outResult_bits_csrWen; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_csrWaddr = exeUnits_3_io_outResult_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_csrWdata = exeUnits_3_io_outResult_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_0_bits_csrTimer = exeUnits_3_io_outResult_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 178:28]
  assign io_toMemResult_1_valid = exeUnits_4_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pc = exeUnits_4_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_inst = exeUnits_4_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_fuType = exeUnits_4_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_aluOp = exeUnits_4_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_bruOp = exeUnits_4_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_lsuOp = exeUnits_4_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_csrOp = exeUnits_4_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_mulOp = exeUnits_4_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_divOp = exeUnits_4_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_src1Type = exeUnits_4_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_src2Type = exeUnits_4_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_immType = exeUnits_4_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_rfWen = exeUnits_4_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_memRead = exeUnits_4_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_memWrite = exeUnits_4_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_csrWen = exeUnits_4_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_isBranch = exeUnits_4_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_isJump = exeUnits_4_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ctrl_isPriv = exeUnits_4_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_excp_excpVec = exeUnits_4_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_imm = exeUnits_4_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_csrAddress = exeUnits_4_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdInfo_valid = exeUnits_4_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdInfo_isBr = exeUnits_4_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdInfo_isJal = exeUnits_4_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdInfo_isJalr = exeUnits_4_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdInfo_isCall = exeUnits_4_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdInfo_isRet = exeUnits_4_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdInfo_jumpTarget = exeUnits_4_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_pc = exeUnits_4_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_fallThrough = exeUnits_4_io_outResult_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_taken = exeUnits_4_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_target = exeUnits_4_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_takenOffset = exeUnits_4_io_outResult_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_valid = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget = exeUnits_4_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_ldst = exeUnits_4_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_lrs1 = exeUnits_4_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_lrs2 = exeUnits_4_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_pdst = exeUnits_4_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_prs1 = exeUnits_4_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_prs2 = exeUnits_4_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_oldPdst = exeUnits_4_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_rs1Valid = exeUnits_4_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_rs2Valid = exeUnits_4_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_rdValid = exeUnits_4_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_snptId_valid = exeUnits_4_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_snptId_bits = exeUnits_4_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_robIdx_value = exeUnits_4_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_robIdx_flag = exeUnits_4_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_robIdxFull_value = exeUnits_4_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_robIdxFull_flag = exeUnits_4_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_lqIdx_value = exeUnits_4_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_lqIdx_flag = exeUnits_4_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_sqIdx_value = exeUnits_4_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_sqIdx_flag = exeUnits_4_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_issueQueue = exeUnits_4_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_prs1Busy = exeUnits_4_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_prs2Busy = exeUnits_4_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_isSta = exeUnits_4_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_uop_isStd = exeUnits_4_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_data = exeUnits_4_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_redirect_valid = exeUnits_4_io_outResult_bits_redirect_valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_redirect_bits_valid = exeUnits_4_io_outResult_bits_redirect_bits_valid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_redirect_bits_robIdx_value = exeUnits_4_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_redirect_bits_robIdx_flag = exeUnits_4_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_memValid = exeUnits_4_io_outResult_bits_memValid; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_memRead = exeUnits_4_io_outResult_bits_memRead; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_memWrite = exeUnits_4_io_outResult_bits_memWrite; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_memVaddr = exeUnits_4_io_outResult_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_memPaddr = exeUnits_4_io_outResult_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_memStoreData = exeUnits_4_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_csrWen = exeUnits_4_io_outResult_bits_csrWen; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_csrWaddr = exeUnits_4_io_outResult_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_csrWdata = exeUnits_4_io_outResult_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_toMemResult_1_bits_csrTimer = exeUnits_4_io_outResult_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 179:28]
  assign io_fromMemResult_0_ready = writeback_io_InExeResults_3_ready; // @[src/main/scala/backend/Backend.scala 191:23]
  assign io_fromMemResult_1_ready = writeback_io_InExeResults_4_ready; // @[src/main/scala/backend/Backend.scala 192:23]
  assign io_commitToSq_valid_0 = ctrlBlock_io_commitToSq_valid_0; // @[src/main/scala/backend/Backend.scala 58:17]
  assign io_commitToSq_valid_1 = ctrlBlock_io_commitToSq_valid_1; // @[src/main/scala/backend/Backend.scala 58:17]
  assign io_commitToSq_valid_2 = ctrlBlock_io_commitToSq_valid_2; // @[src/main/scala/backend/Backend.scala 58:17]
  assign io_commitToSq_bits_0_sqIdx_value = ctrlBlock_io_commitToSq_bits_0_sqIdx_value; // @[src/main/scala/backend/Backend.scala 58:17]
  assign io_commitToSq_bits_1_sqIdx_value = ctrlBlock_io_commitToSq_bits_1_sqIdx_value; // @[src/main/scala/backend/Backend.scala 58:17]
  assign io_commitToSq_bits_2_sqIdx_value = ctrlBlock_io_commitToSq_bits_2_sqIdx_value; // @[src/main/scala/backend/Backend.scala 58:17]
  assign io_commitToCsr_csrWen = ctrlBlock_io_commitToCsr_csrWen; // @[src/main/scala/backend/Backend.scala 59:18]
  assign io_commitToCsr_csrWaddr = ctrlBlock_io_commitToCsr_csrWaddr; // @[src/main/scala/backend/Backend.scala 59:18]
  assign io_commitToCsr_csrWdata = ctrlBlock_io_commitToCsr_csrWdata; // @[src/main/scala/backend/Backend.scala 59:18]
  assign io_excpEvent_excp = ctrlBlock_io_excpEvent_excp; // @[src/main/scala/backend/Backend.scala 53:16]
  assign io_excpEvent_ertn = ctrlBlock_io_excpEvent_ertn; // @[src/main/scala/backend/Backend.scala 53:16]
  assign io_excpInfo_vaddrError = ctrlBlock_io_excpInfo_vaddrError; // @[src/main/scala/backend/Backend.scala 54:15]
  assign io_excpInfo_era = ctrlBlock_io_excpInfo_era; // @[src/main/scala/backend/Backend.scala 54:15]
  assign io_excpInfo_ecode = ctrlBlock_io_excpInfo_ecode; // @[src/main/scala/backend/Backend.scala 54:15]
  assign io_excpInfo_badVaddr = ctrlBlock_io_excpInfo_badVaddr; // @[src/main/scala/backend/Backend.scala 54:15]
  assign io_bpuUpdate_valid = exeUnits_2_io_bpuUpdate_valid; // @[src/main/scala/backend/Backend.scala 104:16]
  assign io_bpuUpdate_pc = exeUnits_2_io_bpuUpdate_pc; // @[src/main/scala/backend/Backend.scala 104:16]
  assign io_bpuUpdate_taken = exeUnits_2_io_bpuUpdate_taken; // @[src/main/scala/backend/Backend.scala 104:16]
  assign io_bpuUpdate_target = exeUnits_2_io_bpuUpdate_target; // @[src/main/scala/backend/Backend.scala 104:16]
  assign io_bpuUpdate_oldPhtCounter = exeUnits_2_io_bpuUpdate_oldPhtCounter; // @[src/main/scala/backend/Backend.scala 104:16]
  assign io_bpuUpdate_isJalr = exeUnits_2_io_bpuUpdate_isJalr; // @[src/main/scala/backend/Backend.scala 104:16]
  assign io_bpuUpdate_isJal = exeUnits_2_io_bpuUpdate_isJal; // @[src/main/scala/backend/Backend.scala 104:16]
  assign io_bpuUpdate_offset = exeUnits_2_io_bpuUpdate_offset; // @[src/main/scala/backend/Backend.scala 104:16]
  assign ctrlBlock_clock = clock;
  assign ctrlBlock_reset = reset;
  assign ctrlBlock_io_in_0_valid = io_in_0_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_instr = io_in_0_bits_instr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pc = io_in_0_bits_pc; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_valid = io_in_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isBr = io_in_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJal = io_in_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isJalr = io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isCall = io_in_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_isRet = io_in_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_pdInfo_jumpTarget = io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_pc = io_in_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_fallThrough = io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_taken = io_in_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_target = io_in_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_takenOffset = io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_valid = io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_btbHit = io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsJalr = io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsJal = io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsCall = io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_btbIsRet = io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_btbOffset = io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_phtCounter = io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_rasTop = io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_predTaken = io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_bpuInfo_meta_predTarget = io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbRefill = io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPif = io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_exception_excpTlbPpi = io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_0_bits_exception_excpAdef = io_in_0_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_valid = io_in_1_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_instr = io_in_1_bits_instr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pc = io_in_1_bits_pc; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_valid = io_in_1_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isBr = io_in_1_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJal = io_in_1_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isJalr = io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isCall = io_in_1_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_isRet = io_in_1_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_pdInfo_jumpTarget = io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_pc = io_in_1_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_fallThrough = io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_taken = io_in_1_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_target = io_in_1_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_takenOffset = io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_valid = io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_btbHit = io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsJalr = io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsJal = io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsCall = io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_btbIsRet = io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_btbOffset = io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_phtCounter = io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_rasTop = io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_predTaken = io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_bpuInfo_meta_predTarget = io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbRefill = io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPif = io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_exception_excpTlbPpi = io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_1_bits_exception_excpAdef = io_in_1_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_valid = io_in_2_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_instr = io_in_2_bits_instr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pc = io_in_2_bits_pc; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_valid = io_in_2_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isBr = io_in_2_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJal = io_in_2_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isJalr = io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isCall = io_in_2_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_isRet = io_in_2_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_pdInfo_jumpTarget = io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_pc = io_in_2_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_fallThrough = io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_taken = io_in_2_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_target = io_in_2_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_takenOffset = io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_valid = io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_btbHit = io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsJalr = io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsJal = io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsCall = io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_btbIsRet = io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_btbOffset = io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_phtCounter = io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_rasTop = io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_predTaken = io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_bpuInfo_meta_predTarget = io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbRefill = io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPif = io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_exception_excpTlbPpi = io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_in_2_bits_exception_excpAdef = io_in_2_bits_exception_excpAdef; // @[src/main/scala/backend/Backend.scala 120:23]
  assign ctrlBlock_io_iqFeedback_q1FreeEntries = scheduler_io_feedback_q1FreeEntries; // @[src/main/scala/backend/Backend.scala 133:27]
  assign ctrlBlock_io_iqFeedback_q2FreeEntries = scheduler_io_feedback_q2FreeEntries; // @[src/main/scala/backend/Backend.scala 133:27]
  assign ctrlBlock_io_iqFeedback_q3FreeEntries = scheduler_io_feedback_q3FreeEntries; // @[src/main/scala/backend/Backend.scala 133:27]
  assign ctrlBlock_io_iqFeedback_q4FreeEntries = scheduler_io_feedback_q4FreeEntries; // @[src/main/scala/backend/Backend.scala 133:27]
  assign ctrlBlock_io_iqFeedback_q5FreeEntries = scheduler_io_feedback_q5FreeEntries; // @[src/main/scala/backend/Backend.scala 133:27]
  assign ctrlBlock_io_lsEnq_lqFull = io_lsEnq_lqFull; // @[src/main/scala/backend/Backend.scala 61:12]
  assign ctrlBlock_io_lsEnq_sqFull = io_lsEnq_sqFull; // @[src/main/scala/backend/Backend.scala 61:12]
  assign ctrlBlock_io_writeback_0_valid = writeback_io_toRObResults_0_valid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_robIdx_value = writeback_io_toRObResults_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_sqIdx_value = writeback_io_toRObResults_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_sqIdx_flag = writeback_io_toRObResults_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_isMemWrite = writeback_io_toRObResults_0_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_isMemRead = writeback_io_toRObResults_0_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_memValid = writeback_io_toRObResults_0_bits_memValid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_memVaddr = writeback_io_toRObResults_0_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_memPaddr = writeback_io_toRObResults_0_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_memStoreData = writeback_io_toRObResults_0_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_rfdata = writeback_io_toRObResults_0_bits_rfdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_csrWdata = writeback_io_toRObResults_0_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_csrTimer = writeback_io_toRObResults_0_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_0_bits_excp_excpVec = writeback_io_toRObResults_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_valid = writeback_io_toRObResults_1_valid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_robIdx_value = writeback_io_toRObResults_1_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_sqIdx_value = writeback_io_toRObResults_1_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_sqIdx_flag = writeback_io_toRObResults_1_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_isMemWrite = writeback_io_toRObResults_1_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_isMemRead = writeback_io_toRObResults_1_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_memValid = writeback_io_toRObResults_1_bits_memValid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_memVaddr = writeback_io_toRObResults_1_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_memPaddr = writeback_io_toRObResults_1_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_memStoreData = writeback_io_toRObResults_1_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_rfdata = writeback_io_toRObResults_1_bits_rfdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_csrWdata = writeback_io_toRObResults_1_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_csrTimer = writeback_io_toRObResults_1_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_1_bits_excp_excpVec = writeback_io_toRObResults_1_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_valid = writeback_io_toRObResults_2_valid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_robIdx_value = writeback_io_toRObResults_2_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_sqIdx_value = writeback_io_toRObResults_2_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_sqIdx_flag = writeback_io_toRObResults_2_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_isMemWrite = writeback_io_toRObResults_2_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_isMemRead = writeback_io_toRObResults_2_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_memValid = writeback_io_toRObResults_2_bits_memValid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_memVaddr = writeback_io_toRObResults_2_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_memPaddr = writeback_io_toRObResults_2_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_memStoreData = writeback_io_toRObResults_2_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_rfdata = writeback_io_toRObResults_2_bits_rfdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_csrWdata = writeback_io_toRObResults_2_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_csrTimer = writeback_io_toRObResults_2_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_2_bits_excp_excpVec = writeback_io_toRObResults_2_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_valid = writeback_io_toRObResults_3_valid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_robIdx_value = writeback_io_toRObResults_3_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_sqIdx_value = writeback_io_toRObResults_3_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_sqIdx_flag = writeback_io_toRObResults_3_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_isMemWrite = writeback_io_toRObResults_3_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_isMemRead = writeback_io_toRObResults_3_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_memValid = writeback_io_toRObResults_3_bits_memValid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_memVaddr = writeback_io_toRObResults_3_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_memPaddr = writeback_io_toRObResults_3_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_memStoreData = writeback_io_toRObResults_3_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_rfdata = writeback_io_toRObResults_3_bits_rfdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_csrWdata = writeback_io_toRObResults_3_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_csrTimer = writeback_io_toRObResults_3_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_3_bits_excp_excpVec = writeback_io_toRObResults_3_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_valid = writeback_io_toRObResults_4_valid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_robIdx_value = writeback_io_toRObResults_4_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_sqIdx_value = writeback_io_toRObResults_4_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_sqIdx_flag = writeback_io_toRObResults_4_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_isMemWrite = writeback_io_toRObResults_4_bits_isMemWrite; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_isMemRead = writeback_io_toRObResults_4_bits_isMemRead; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_memValid = writeback_io_toRObResults_4_bits_memValid; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_memVaddr = writeback_io_toRObResults_4_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_memPaddr = writeback_io_toRObResults_4_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_memStoreData = writeback_io_toRObResults_4_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_rfdata = writeback_io_toRObResults_4_bits_rfdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_csrWdata = writeback_io_toRObResults_4_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_csrTimer = writeback_io_toRObResults_4_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_writeback_4_bits_excp_excpVec = writeback_io_toRObResults_4_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 241:26]
  assign ctrlBlock_io_bruInfo_valid = exeUnits_2_io_bruInfo_valid; // @[src/main/scala/backend/Backend.scala 108:24]
  assign ctrlBlock_io_bruInfo_bits_doRedirect = exeUnits_2_io_bruInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 108:24]
  assign ctrlBlock_io_bruInfo_bits_snptId = exeUnits_2_io_bruInfo_bits_snptId; // @[src/main/scala/backend/Backend.scala 108:24]
  assign ctrlBlock_io_bruInfo_bits_robIdx_value = exeUnits_2_io_bruInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 108:24]
  assign ctrlBlock_io_bruInfo_bits_robIdx_flag = exeUnits_2_io_bruInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 108:24]
  assign ctrlBlock_io_bruInfo_bits_target = exeUnits_2_io_bruInfo_bits_target; // @[src/main/scala/backend/Backend.scala 108:24]
  assign ctrlBlock_io_redirectAddrFromCsr_eentry = io_redirectAddrFromCsr_eentry; // @[src/main/scala/backend/Backend.scala 55:26]
  assign ctrlBlock_io_redirectAddrFromCsr_era = io_redirectAddrFromCsr_era; // @[src/main/scala/backend/Backend.scala 55:26]
  assign ctrlBlock_io_extInt = io_extInt; // @[src/main/scala/backend/Backend.scala 122:23]
  assign ctrlBlock_io_wakeupPorts_0_valid = writeback_io_wakeupPorts_0_valid; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_0_bits_pdst = writeback_io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_1_valid = writeback_io_wakeupPorts_1_valid; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_1_bits_pdst = writeback_io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_2_valid = writeback_io_wakeupPorts_2_valid; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_2_bits_pdst = writeback_io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_3_valid = writeback_io_wakeupPorts_3_valid; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_3_bits_pdst = writeback_io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_4_valid = writeback_io_wakeupPorts_4_valid; // @[src/main/scala/backend/Backend.scala 218:28]
  assign ctrlBlock_io_wakeupPorts_4_bits_pdst = writeback_io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/Backend.scala 218:28]
  assign scheduler_clock = clock;
  assign scheduler_reset = reset;
  assign scheduler_io_q1IQEnq_valid = ctrlBlock_io_q1IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pc = ctrlBlock_io_q1IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_inst = ctrlBlock_io_q1IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_fuType = ctrlBlock_io_q1IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_divOp = ctrlBlock_io_q1IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q1IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q1IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_immType = ctrlBlock_io_q1IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q1IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_memRead = ctrlBlock_io_q1IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q1IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q1IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isJump = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q1IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_excp_excpVec = ctrlBlock_io_q1IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_imm = ctrlBlock_io_q1IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_csrAddress = ctrlBlock_io_q1IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_valid = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q1IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_pc = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_fallThrough = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_taken = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_target = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_takenOffset = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_valid = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbHit = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsJalr = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsJal = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsCall = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbIsRet = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_btbOffset = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_phtCounter = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_rasTop = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_predTaken = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_bpuInfo_meta_predTarget = ctrlBlock_io_q1IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_ldst = ctrlBlock_io_q1IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_lrs1 = ctrlBlock_io_q1IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_lrs2 = ctrlBlock_io_q1IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_pdst = ctrlBlock_io_q1IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_prs1 = ctrlBlock_io_q1IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_prs2 = ctrlBlock_io_q1IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_oldPdst = ctrlBlock_io_q1IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_rs1Valid = ctrlBlock_io_q1IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_rs2Valid = ctrlBlock_io_q1IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_rdValid = ctrlBlock_io_q1IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_snptId_valid = ctrlBlock_io_q1IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_snptId_bits = ctrlBlock_io_q1IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_robIdx_value = ctrlBlock_io_q1IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_robIdx_flag = ctrlBlock_io_q1IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_robIdxFull_value = ctrlBlock_io_q1IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_robIdxFull_flag = ctrlBlock_io_q1IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_prs1Busy = ctrlBlock_io_q1IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q1IQEnq_bits_prs2Busy = ctrlBlock_io_q1IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 127:24]
  assign scheduler_io_q2IQEnq_valid = ctrlBlock_io_q2IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pc = ctrlBlock_io_q2IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_inst = ctrlBlock_io_q2IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_fuType = ctrlBlock_io_q2IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_divOp = ctrlBlock_io_q2IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q2IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q2IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_immType = ctrlBlock_io_q2IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q2IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_memRead = ctrlBlock_io_q2IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q2IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q2IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isJump = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q2IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_excp_excpVec = ctrlBlock_io_q2IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_imm = ctrlBlock_io_q2IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_csrAddress = ctrlBlock_io_q2IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_valid = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q2IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_pc = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_fallThrough = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_taken = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_target = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_takenOffset = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_valid = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbHit = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsJalr = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsJal = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsCall = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbIsRet = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_btbOffset = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_phtCounter = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_rasTop = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_predTaken = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_bpuInfo_meta_predTarget = ctrlBlock_io_q2IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_ldst = ctrlBlock_io_q2IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_lrs1 = ctrlBlock_io_q2IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_lrs2 = ctrlBlock_io_q2IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_pdst = ctrlBlock_io_q2IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_prs1 = ctrlBlock_io_q2IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_prs2 = ctrlBlock_io_q2IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_oldPdst = ctrlBlock_io_q2IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_rs1Valid = ctrlBlock_io_q2IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_rs2Valid = ctrlBlock_io_q2IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_rdValid = ctrlBlock_io_q2IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_snptId_valid = ctrlBlock_io_q2IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_snptId_bits = ctrlBlock_io_q2IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_robIdx_value = ctrlBlock_io_q2IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_robIdx_flag = ctrlBlock_io_q2IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_robIdxFull_value = ctrlBlock_io_q2IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_robIdxFull_flag = ctrlBlock_io_q2IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_issueQueue = ctrlBlock_io_q2IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_prs1Busy = ctrlBlock_io_q2IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q2IQEnq_bits_prs2Busy = ctrlBlock_io_q2IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 128:24]
  assign scheduler_io_q3IQEnq_valid = ctrlBlock_io_q3IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pc = ctrlBlock_io_q3IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_inst = ctrlBlock_io_q3IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_fuType = ctrlBlock_io_q3IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_divOp = ctrlBlock_io_q3IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q3IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q3IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_immType = ctrlBlock_io_q3IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q3IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_memRead = ctrlBlock_io_q3IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q3IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q3IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isJump = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q3IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_excp_excpVec = ctrlBlock_io_q3IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_imm = ctrlBlock_io_q3IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_csrAddress = ctrlBlock_io_q3IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_valid = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q3IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_pc = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_fallThrough = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_taken = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_target = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_takenOffset = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_valid = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbHit = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsJalr = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsJal = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsCall = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbIsRet = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_btbOffset = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_phtCounter = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_rasTop = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_predTaken = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_bpuInfo_meta_predTarget = ctrlBlock_io_q3IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_ldst = ctrlBlock_io_q3IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_lrs1 = ctrlBlock_io_q3IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_lrs2 = ctrlBlock_io_q3IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_pdst = ctrlBlock_io_q3IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_prs1 = ctrlBlock_io_q3IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_prs2 = ctrlBlock_io_q3IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_oldPdst = ctrlBlock_io_q3IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_rs1Valid = ctrlBlock_io_q3IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_rs2Valid = ctrlBlock_io_q3IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_rdValid = ctrlBlock_io_q3IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_snptId_valid = ctrlBlock_io_q3IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_snptId_bits = ctrlBlock_io_q3IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_robIdx_value = ctrlBlock_io_q3IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_robIdx_flag = ctrlBlock_io_q3IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_robIdxFull_value = ctrlBlock_io_q3IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_robIdxFull_flag = ctrlBlock_io_q3IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_issueQueue = ctrlBlock_io_q3IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_prs1Busy = ctrlBlock_io_q3IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q3IQEnq_bits_prs2Busy = ctrlBlock_io_q3IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 129:24]
  assign scheduler_io_q4IQEnq_valid = ctrlBlock_io_q4IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pc = ctrlBlock_io_q4IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_inst = ctrlBlock_io_q4IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_fuType = ctrlBlock_io_q4IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_divOp = ctrlBlock_io_q4IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q4IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q4IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_immType = ctrlBlock_io_q4IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q4IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_memRead = ctrlBlock_io_q4IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q4IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q4IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isJump = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q4IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_excp_excpVec = ctrlBlock_io_q4IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_imm = ctrlBlock_io_q4IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_csrAddress = ctrlBlock_io_q4IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_valid = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q4IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_pc = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_fallThrough = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_taken = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_target = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_takenOffset = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_valid = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbHit = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsJalr = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsJal = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsCall = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbIsRet = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_btbOffset = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_phtCounter = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_rasTop = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_predTaken = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_bpuInfo_meta_predTarget = ctrlBlock_io_q4IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_ldst = ctrlBlock_io_q4IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_lrs1 = ctrlBlock_io_q4IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_lrs2 = ctrlBlock_io_q4IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_pdst = ctrlBlock_io_q4IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_prs1 = ctrlBlock_io_q4IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_prs2 = ctrlBlock_io_q4IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_oldPdst = ctrlBlock_io_q4IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_rs1Valid = ctrlBlock_io_q4IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_rs2Valid = ctrlBlock_io_q4IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_rdValid = ctrlBlock_io_q4IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_snptId_valid = ctrlBlock_io_q4IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_snptId_bits = ctrlBlock_io_q4IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_robIdx_value = ctrlBlock_io_q4IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_robIdx_flag = ctrlBlock_io_q4IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_robIdxFull_value = ctrlBlock_io_q4IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_robIdxFull_flag = ctrlBlock_io_q4IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_lqIdx_value = ctrlBlock_io_q4IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_lqIdx_flag = ctrlBlock_io_q4IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_sqIdx_value = ctrlBlock_io_q4IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_sqIdx_flag = ctrlBlock_io_q4IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_issueQueue = ctrlBlock_io_q4IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_prs1Busy = ctrlBlock_io_q4IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_prs2Busy = ctrlBlock_io_q4IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_isSta = ctrlBlock_io_q4IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q4IQEnq_bits_isStd = ctrlBlock_io_q4IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 130:24]
  assign scheduler_io_q5IQEnq_valid = ctrlBlock_io_q5IQEnq_0_valid; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pc = ctrlBlock_io_q5IQEnq_0_bits_pc; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_inst = ctrlBlock_io_q5IQEnq_0_bits_inst; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_fuType = ctrlBlock_io_q5IQEnq_0_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_aluOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_bruOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_lsuOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_csrOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_mulOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_divOp = ctrlBlock_io_q5IQEnq_0_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_src1Type = ctrlBlock_io_q5IQEnq_0_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_src2Type = ctrlBlock_io_q5IQEnq_0_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_immType = ctrlBlock_io_q5IQEnq_0_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_rfWen = ctrlBlock_io_q5IQEnq_0_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_memRead = ctrlBlock_io_q5IQEnq_0_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_memWrite = ctrlBlock_io_q5IQEnq_0_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_csrWen = ctrlBlock_io_q5IQEnq_0_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isBranch = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isJump = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ctrl_isPriv = ctrlBlock_io_q5IQEnq_0_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_excp_excpVec = ctrlBlock_io_q5IQEnq_0_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_imm = ctrlBlock_io_q5IQEnq_0_bits_imm; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_csrAddress = ctrlBlock_io_q5IQEnq_0_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_valid = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isBr = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isJal = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isJalr = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isCall = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_isRet = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdInfo_jumpTarget = ctrlBlock_io_q5IQEnq_0_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_pc = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_fallThrough = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_taken = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_target = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_takenOffset = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_valid = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbHit = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsJalr = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsJal = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsCall = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbIsRet = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_btbOffset = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_phtCounter = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_rasTop = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_predTaken = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_bpuInfo_meta_predTarget = ctrlBlock_io_q5IQEnq_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_ldst = ctrlBlock_io_q5IQEnq_0_bits_ldst; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_lrs1 = ctrlBlock_io_q5IQEnq_0_bits_lrs1; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_lrs2 = ctrlBlock_io_q5IQEnq_0_bits_lrs2; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_pdst = ctrlBlock_io_q5IQEnq_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_prs1 = ctrlBlock_io_q5IQEnq_0_bits_prs1; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_prs2 = ctrlBlock_io_q5IQEnq_0_bits_prs2; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_oldPdst = ctrlBlock_io_q5IQEnq_0_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_rs1Valid = ctrlBlock_io_q5IQEnq_0_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_rs2Valid = ctrlBlock_io_q5IQEnq_0_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_rdValid = ctrlBlock_io_q5IQEnq_0_bits_rdValid; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_snptId_valid = ctrlBlock_io_q5IQEnq_0_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_snptId_bits = ctrlBlock_io_q5IQEnq_0_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_robIdx_value = ctrlBlock_io_q5IQEnq_0_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_robIdx_flag = ctrlBlock_io_q5IQEnq_0_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_robIdxFull_value = ctrlBlock_io_q5IQEnq_0_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_robIdxFull_flag = ctrlBlock_io_q5IQEnq_0_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_lqIdx_value = ctrlBlock_io_q5IQEnq_0_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_lqIdx_flag = ctrlBlock_io_q5IQEnq_0_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_sqIdx_value = ctrlBlock_io_q5IQEnq_0_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_sqIdx_flag = ctrlBlock_io_q5IQEnq_0_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_issueQueue = ctrlBlock_io_q5IQEnq_0_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_prs1Busy = ctrlBlock_io_q5IQEnq_0_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_prs2Busy = ctrlBlock_io_q5IQEnq_0_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_isSta = ctrlBlock_io_q5IQEnq_0_bits_isSta; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q5IQEnq_bits_isStd = ctrlBlock_io_q5IQEnq_0_bits_isStd; // @[src/main/scala/backend/Backend.scala 131:24]
  assign scheduler_io_q1Issue_ready = regRead_io_iqIssues_0_ready; // @[src/main/scala/backend/Backend.scala 138:26]
  assign scheduler_io_q2Issue_ready = regRead_io_iqIssues_1_ready; // @[src/main/scala/backend/Backend.scala 139:26]
  assign scheduler_io_q3Issue_ready = regRead_io_iqIssues_2_ready; // @[src/main/scala/backend/Backend.scala 140:26]
  assign scheduler_io_q4Issue_ready = regRead_io_iqIssues_3_ready; // @[src/main/scala/backend/Backend.scala 141:26]
  assign scheduler_io_q5Issue_ready = regRead_io_iqIssues_4_ready; // @[src/main/scala/backend/Backend.scala 142:26]
  assign scheduler_io_wakeupPorts_0_valid = writeback_io_wakeupPorts_0_valid; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_0_bits_pdst = writeback_io_wakeupPorts_0_bits_pdst; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_1_valid = writeback_io_wakeupPorts_1_valid; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_1_bits_pdst = writeback_io_wakeupPorts_1_bits_pdst; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_2_valid = writeback_io_wakeupPorts_2_valid; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_2_bits_pdst = writeback_io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_3_valid = writeback_io_wakeupPorts_3_valid; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_3_bits_pdst = writeback_io_wakeupPorts_3_bits_pdst; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_4_valid = writeback_io_wakeupPorts_4_valid; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_wakeupPorts_4_bits_pdst = writeback_io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/Backend.scala 217:28]
  assign scheduler_io_redirectInfo_valid = ctrlBlock_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 112:29]
  assign scheduler_io_redirectInfo_bits_doRedirect = ctrlBlock_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 112:29]
  assign scheduler_io_redirectInfo_bits_robIdx_value = ctrlBlock_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 112:29]
  assign scheduler_io_redirectInfo_bits_robIdx_flag = ctrlBlock_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 112:29]
  assign regRead_clock = clock;
  assign regRead_reset = reset;
  assign regRead_io_iqIssues_0_valid = scheduler_io_q1Issue_valid; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pc = scheduler_io_q1Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_inst = scheduler_io_q1Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_fuType = scheduler_io_q1Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_aluOp = scheduler_io_q1Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_bruOp = scheduler_io_q1Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_lsuOp = scheduler_io_q1Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_csrOp = scheduler_io_q1Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_mulOp = scheduler_io_q1Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_divOp = scheduler_io_q1Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_src1Type = scheduler_io_q1Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_src2Type = scheduler_io_q1Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_immType = scheduler_io_q1Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_rfWen = scheduler_io_q1Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_memRead = scheduler_io_q1Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_memWrite = scheduler_io_q1Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_csrWen = scheduler_io_q1Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_isBranch = scheduler_io_q1Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_isJump = scheduler_io_q1Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ctrl_isPriv = scheduler_io_q1Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_excp_excpVec = scheduler_io_q1Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_imm = scheduler_io_q1Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_csrAddress = scheduler_io_q1Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_valid = scheduler_io_q1Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isBr = scheduler_io_q1Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isJal = scheduler_io_q1Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isJalr = scheduler_io_q1Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isCall = scheduler_io_q1Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_isRet = scheduler_io_q1Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdInfo_jumpTarget = scheduler_io_q1Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_pc = scheduler_io_q1Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_fallThrough = scheduler_io_q1Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_taken = scheduler_io_q1Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_target = scheduler_io_q1Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_takenOffset = scheduler_io_q1Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_valid = scheduler_io_q1Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_btbHit = scheduler_io_q1Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsJalr = scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsJal = scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsCall = scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_btbIsRet = scheduler_io_q1Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_btbOffset = scheduler_io_q1Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_phtCounter = scheduler_io_q1Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_rasTop = scheduler_io_q1Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_predTaken = scheduler_io_q1Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_bpuInfo_meta_predTarget = scheduler_io_q1Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_ldst = scheduler_io_q1Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_lrs1 = scheduler_io_q1Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_lrs2 = scheduler_io_q1Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_pdst = scheduler_io_q1Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_prs1 = scheduler_io_q1Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_prs2 = scheduler_io_q1Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_oldPdst = scheduler_io_q1Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_rs1Valid = scheduler_io_q1Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_rs2Valid = scheduler_io_q1Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_rdValid = scheduler_io_q1Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_snptId_valid = scheduler_io_q1Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_snptId_bits = scheduler_io_q1Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_robIdx_value = scheduler_io_q1Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_robIdx_flag = scheduler_io_q1Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_robIdxFull_value = scheduler_io_q1Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_robIdxFull_flag = scheduler_io_q1Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_lqIdx_value = scheduler_io_q1Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_lqIdx_flag = scheduler_io_q1Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_sqIdx_value = scheduler_io_q1Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_sqIdx_flag = scheduler_io_q1Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_issueQueue = scheduler_io_q1Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_prs1Busy = scheduler_io_q1Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_prs2Busy = scheduler_io_q1Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_isSta = scheduler_io_q1Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_0_bits_isStd = scheduler_io_q1Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 138:26]
  assign regRead_io_iqIssues_1_valid = scheduler_io_q2Issue_valid; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pc = scheduler_io_q2Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_inst = scheduler_io_q2Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_fuType = scheduler_io_q2Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_aluOp = scheduler_io_q2Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_bruOp = scheduler_io_q2Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_lsuOp = scheduler_io_q2Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_csrOp = scheduler_io_q2Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_mulOp = scheduler_io_q2Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_divOp = scheduler_io_q2Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_src1Type = scheduler_io_q2Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_src2Type = scheduler_io_q2Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_immType = scheduler_io_q2Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_rfWen = scheduler_io_q2Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_memRead = scheduler_io_q2Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_memWrite = scheduler_io_q2Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_csrWen = scheduler_io_q2Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_isBranch = scheduler_io_q2Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_isJump = scheduler_io_q2Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ctrl_isPriv = scheduler_io_q2Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_excp_excpVec = scheduler_io_q2Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_imm = scheduler_io_q2Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_csrAddress = scheduler_io_q2Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_valid = scheduler_io_q2Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isBr = scheduler_io_q2Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isJal = scheduler_io_q2Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isJalr = scheduler_io_q2Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isCall = scheduler_io_q2Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_isRet = scheduler_io_q2Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdInfo_jumpTarget = scheduler_io_q2Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_pc = scheduler_io_q2Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_fallThrough = scheduler_io_q2Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_taken = scheduler_io_q2Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_target = scheduler_io_q2Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_takenOffset = scheduler_io_q2Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_valid = scheduler_io_q2Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_btbHit = scheduler_io_q2Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsJalr = scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsJal = scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsCall = scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_btbIsRet = scheduler_io_q2Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_btbOffset = scheduler_io_q2Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_phtCounter = scheduler_io_q2Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_rasTop = scheduler_io_q2Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_predTaken = scheduler_io_q2Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_bpuInfo_meta_predTarget = scheduler_io_q2Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_ldst = scheduler_io_q2Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_lrs1 = scheduler_io_q2Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_lrs2 = scheduler_io_q2Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_pdst = scheduler_io_q2Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_prs1 = scheduler_io_q2Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_prs2 = scheduler_io_q2Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_oldPdst = scheduler_io_q2Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_rs1Valid = scheduler_io_q2Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_rs2Valid = scheduler_io_q2Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_rdValid = scheduler_io_q2Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_snptId_valid = scheduler_io_q2Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_snptId_bits = scheduler_io_q2Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_robIdx_value = scheduler_io_q2Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_robIdx_flag = scheduler_io_q2Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_robIdxFull_value = scheduler_io_q2Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_robIdxFull_flag = scheduler_io_q2Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_issueQueue = scheduler_io_q2Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_prs1Busy = scheduler_io_q2Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_1_bits_prs2Busy = scheduler_io_q2Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 139:26]
  assign regRead_io_iqIssues_2_valid = scheduler_io_q3Issue_valid; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pc = scheduler_io_q3Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_inst = scheduler_io_q3Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_fuType = scheduler_io_q3Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_aluOp = scheduler_io_q3Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_bruOp = scheduler_io_q3Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_lsuOp = scheduler_io_q3Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_csrOp = scheduler_io_q3Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_mulOp = scheduler_io_q3Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_divOp = scheduler_io_q3Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_src1Type = scheduler_io_q3Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_src2Type = scheduler_io_q3Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_immType = scheduler_io_q3Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_rfWen = scheduler_io_q3Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_memRead = scheduler_io_q3Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_memWrite = scheduler_io_q3Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_csrWen = scheduler_io_q3Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_isBranch = scheduler_io_q3Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_isJump = scheduler_io_q3Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ctrl_isPriv = scheduler_io_q3Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_excp_excpVec = scheduler_io_q3Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_imm = scheduler_io_q3Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_csrAddress = scheduler_io_q3Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_valid = scheduler_io_q3Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isBr = scheduler_io_q3Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isJal = scheduler_io_q3Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isJalr = scheduler_io_q3Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isCall = scheduler_io_q3Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_isRet = scheduler_io_q3Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdInfo_jumpTarget = scheduler_io_q3Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_pc = scheduler_io_q3Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_fallThrough = scheduler_io_q3Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_taken = scheduler_io_q3Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_target = scheduler_io_q3Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_takenOffset = scheduler_io_q3Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_valid = scheduler_io_q3Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_btbHit = scheduler_io_q3Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsJalr = scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsJal = scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsCall = scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_btbIsRet = scheduler_io_q3Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_btbOffset = scheduler_io_q3Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_phtCounter = scheduler_io_q3Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_rasTop = scheduler_io_q3Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_predTaken = scheduler_io_q3Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_bpuInfo_meta_predTarget = scheduler_io_q3Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_ldst = scheduler_io_q3Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_lrs1 = scheduler_io_q3Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_lrs2 = scheduler_io_q3Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_pdst = scheduler_io_q3Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_prs1 = scheduler_io_q3Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_prs2 = scheduler_io_q3Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_oldPdst = scheduler_io_q3Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_rs1Valid = scheduler_io_q3Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_rs2Valid = scheduler_io_q3Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_rdValid = scheduler_io_q3Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_snptId_valid = scheduler_io_q3Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_snptId_bits = scheduler_io_q3Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_robIdx_value = scheduler_io_q3Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_robIdx_flag = scheduler_io_q3Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_robIdxFull_value = scheduler_io_q3Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_robIdxFull_flag = scheduler_io_q3Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_lqIdx_value = scheduler_io_q3Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_lqIdx_flag = scheduler_io_q3Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_sqIdx_value = scheduler_io_q3Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_sqIdx_flag = scheduler_io_q3Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_issueQueue = scheduler_io_q3Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_prs1Busy = scheduler_io_q3Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_prs2Busy = scheduler_io_q3Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_isSta = scheduler_io_q3Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_2_bits_isStd = scheduler_io_q3Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 140:26]
  assign regRead_io_iqIssues_3_valid = scheduler_io_q4Issue_valid; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pc = scheduler_io_q4Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_inst = scheduler_io_q4Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_fuType = scheduler_io_q4Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_aluOp = scheduler_io_q4Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_bruOp = scheduler_io_q4Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_lsuOp = scheduler_io_q4Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_csrOp = scheduler_io_q4Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_mulOp = scheduler_io_q4Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_divOp = scheduler_io_q4Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_src1Type = scheduler_io_q4Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_src2Type = scheduler_io_q4Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_immType = scheduler_io_q4Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_rfWen = scheduler_io_q4Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_memRead = scheduler_io_q4Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_memWrite = scheduler_io_q4Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_csrWen = scheduler_io_q4Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_isBranch = scheduler_io_q4Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_isJump = scheduler_io_q4Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ctrl_isPriv = scheduler_io_q4Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_excp_excpVec = scheduler_io_q4Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_imm = scheduler_io_q4Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_csrAddress = scheduler_io_q4Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_valid = scheduler_io_q4Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isBr = scheduler_io_q4Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isJal = scheduler_io_q4Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isJalr = scheduler_io_q4Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isCall = scheduler_io_q4Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_isRet = scheduler_io_q4Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdInfo_jumpTarget = scheduler_io_q4Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_pc = scheduler_io_q4Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_fallThrough = scheduler_io_q4Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_taken = scheduler_io_q4Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_target = scheduler_io_q4Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_takenOffset = scheduler_io_q4Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_valid = scheduler_io_q4Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_btbHit = scheduler_io_q4Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsJalr = scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsJal = scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsCall = scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_btbIsRet = scheduler_io_q4Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_btbOffset = scheduler_io_q4Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_phtCounter = scheduler_io_q4Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_rasTop = scheduler_io_q4Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_predTaken = scheduler_io_q4Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_bpuInfo_meta_predTarget = scheduler_io_q4Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_ldst = scheduler_io_q4Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_lrs1 = scheduler_io_q4Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_lrs2 = scheduler_io_q4Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_pdst = scheduler_io_q4Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_prs1 = scheduler_io_q4Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_prs2 = scheduler_io_q4Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_oldPdst = scheduler_io_q4Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_rs1Valid = scheduler_io_q4Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_rs2Valid = scheduler_io_q4Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_rdValid = scheduler_io_q4Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_snptId_valid = scheduler_io_q4Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_snptId_bits = scheduler_io_q4Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_robIdx_value = scheduler_io_q4Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_robIdx_flag = scheduler_io_q4Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_robIdxFull_value = scheduler_io_q4Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_robIdxFull_flag = scheduler_io_q4Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_lqIdx_value = scheduler_io_q4Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_lqIdx_flag = scheduler_io_q4Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_sqIdx_value = scheduler_io_q4Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_sqIdx_flag = scheduler_io_q4Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_issueQueue = scheduler_io_q4Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_prs1Busy = scheduler_io_q4Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_prs2Busy = scheduler_io_q4Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_isSta = scheduler_io_q4Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_3_bits_isStd = scheduler_io_q4Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 141:26]
  assign regRead_io_iqIssues_4_valid = scheduler_io_q5Issue_valid; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pc = scheduler_io_q5Issue_bits_pc; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_inst = scheduler_io_q5Issue_bits_inst; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_fuType = scheduler_io_q5Issue_bits_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_aluOp = scheduler_io_q5Issue_bits_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_bruOp = scheduler_io_q5Issue_bits_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_lsuOp = scheduler_io_q5Issue_bits_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_csrOp = scheduler_io_q5Issue_bits_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_mulOp = scheduler_io_q5Issue_bits_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_divOp = scheduler_io_q5Issue_bits_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_src1Type = scheduler_io_q5Issue_bits_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_src2Type = scheduler_io_q5Issue_bits_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_immType = scheduler_io_q5Issue_bits_ctrl_immType; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_rfWen = scheduler_io_q5Issue_bits_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_memRead = scheduler_io_q5Issue_bits_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_memWrite = scheduler_io_q5Issue_bits_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_csrWen = scheduler_io_q5Issue_bits_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_isBranch = scheduler_io_q5Issue_bits_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_isJump = scheduler_io_q5Issue_bits_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ctrl_isPriv = scheduler_io_q5Issue_bits_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_excp_excpVec = scheduler_io_q5Issue_bits_excp_excpVec; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_imm = scheduler_io_q5Issue_bits_imm; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_csrAddress = scheduler_io_q5Issue_bits_csrAddress; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_valid = scheduler_io_q5Issue_bits_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isBr = scheduler_io_q5Issue_bits_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isJal = scheduler_io_q5Issue_bits_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isJalr = scheduler_io_q5Issue_bits_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isCall = scheduler_io_q5Issue_bits_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_isRet = scheduler_io_q5Issue_bits_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdInfo_jumpTarget = scheduler_io_q5Issue_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_pc = scheduler_io_q5Issue_bits_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_fallThrough = scheduler_io_q5Issue_bits_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_taken = scheduler_io_q5Issue_bits_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_target = scheduler_io_q5Issue_bits_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_takenOffset = scheduler_io_q5Issue_bits_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_valid = scheduler_io_q5Issue_bits_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_btbHit = scheduler_io_q5Issue_bits_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsJalr = scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsJal = scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsCall = scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_btbIsRet = scheduler_io_q5Issue_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_btbOffset = scheduler_io_q5Issue_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_phtCounter = scheduler_io_q5Issue_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_rasTop = scheduler_io_q5Issue_bits_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_predTaken = scheduler_io_q5Issue_bits_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_bpuInfo_meta_predTarget = scheduler_io_q5Issue_bits_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_ldst = scheduler_io_q5Issue_bits_ldst; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_lrs1 = scheduler_io_q5Issue_bits_lrs1; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_lrs2 = scheduler_io_q5Issue_bits_lrs2; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_pdst = scheduler_io_q5Issue_bits_pdst; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_prs1 = scheduler_io_q5Issue_bits_prs1; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_prs2 = scheduler_io_q5Issue_bits_prs2; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_oldPdst = scheduler_io_q5Issue_bits_oldPdst; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_rs1Valid = scheduler_io_q5Issue_bits_rs1Valid; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_rs2Valid = scheduler_io_q5Issue_bits_rs2Valid; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_rdValid = scheduler_io_q5Issue_bits_rdValid; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_snptId_valid = scheduler_io_q5Issue_bits_snptId_valid; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_snptId_bits = scheduler_io_q5Issue_bits_snptId_bits; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_robIdx_value = scheduler_io_q5Issue_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_robIdx_flag = scheduler_io_q5Issue_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_robIdxFull_value = scheduler_io_q5Issue_bits_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_robIdxFull_flag = scheduler_io_q5Issue_bits_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_lqIdx_value = scheduler_io_q5Issue_bits_lqIdx_value; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_lqIdx_flag = scheduler_io_q5Issue_bits_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_sqIdx_value = scheduler_io_q5Issue_bits_sqIdx_value; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_sqIdx_flag = scheduler_io_q5Issue_bits_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_issueQueue = scheduler_io_q5Issue_bits_issueQueue; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_prs1Busy = scheduler_io_q5Issue_bits_prs1Busy; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_prs2Busy = scheduler_io_q5Issue_bits_prs2Busy; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_isSta = scheduler_io_q5Issue_bits_isSta; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_iqIssues_4_bits_isStd = scheduler_io_q5Issue_bits_isStd; // @[src/main/scala/backend/Backend.scala 142:26]
  assign regRead_io_rfReadData_0 = regFile_io_readPorts_0_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_rfReadData_1 = regFile_io_readPorts_1_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_rfReadData_2 = regFile_io_readPorts_2_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_rfReadData_3 = regFile_io_readPorts_3_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_rfReadData_4 = regFile_io_readPorts_4_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_rfReadData_5 = regFile_io_readPorts_5_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_rfReadData_6 = regFile_io_readPorts_6_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_rfReadData_7 = regFile_io_readPorts_7_data; // @[src/main/scala/backend/Backend.scala 149:34]
  assign regRead_io_exeReqs_0_ready = exeUnits_0_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 163:17]
  assign regRead_io_exeReqs_1_ready = exeUnits_1_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 163:17]
  assign regRead_io_exeReqs_2_ready = exeUnits_2_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 163:17]
  assign regRead_io_exeReqs_3_ready = exeUnits_3_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 163:17]
  assign regRead_io_exeReqs_4_ready = exeUnits_4_io_inReq_ready; // @[src/main/scala/backend/Backend.scala 163:17]
  assign regRead_io_redirectInfo_valid = ctrlBlock_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 113:27]
  assign regRead_io_redirectInfo_bits_doRedirect = ctrlBlock_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 113:27]
  assign regRead_io_redirectInfo_bits_robIdx_value = ctrlBlock_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 113:27]
  assign regRead_io_redirectInfo_bits_robIdx_flag = ctrlBlock_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 113:27]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_readPorts_0_addr = regRead_io_rfReadAddrs_0; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_readPorts_1_addr = regRead_io_rfReadAddrs_1; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_readPorts_2_addr = regRead_io_rfReadAddrs_2; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_readPorts_3_addr = regRead_io_rfReadAddrs_3; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_readPorts_4_addr = regRead_io_rfReadAddrs_4; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_readPorts_5_addr = regRead_io_rfReadAddrs_5; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_readPorts_6_addr = regRead_io_rfReadAddrs_6; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_readPorts_7_addr = regRead_io_rfReadAddrs_7; // @[src/main/scala/backend/Backend.scala 148:34]
  assign regFile_io_writePorts_0_valid = writeback_io_rfWritePorts_0_valid; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_0_addr = writeback_io_rfWritePorts_0_addr; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_0_data = writeback_io_rfWritePorts_0_data; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_1_valid = writeback_io_rfWritePorts_1_valid; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_1_addr = writeback_io_rfWritePorts_1_addr; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_1_data = writeback_io_rfWritePorts_1_data; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_2_valid = writeback_io_rfWritePorts_2_valid; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_2_addr = writeback_io_rfWritePorts_2_addr; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_2_data = writeback_io_rfWritePorts_2_data; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_3_valid = writeback_io_rfWritePorts_3_valid; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_3_addr = writeback_io_rfWritePorts_3_addr; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_3_data = writeback_io_rfWritePorts_3_data; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_4_valid = writeback_io_rfWritePorts_4_valid; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_4_addr = writeback_io_rfWritePorts_4_addr; // @[src/main/scala/backend/Backend.scala 211:29]
  assign regFile_io_writePorts_4_data = writeback_io_rfWritePorts_4_data; // @[src/main/scala/backend/Backend.scala 211:29]
  assign exeUnits_0_clock = clock;
  assign exeUnits_0_reset = reset;
  assign exeUnits_0_io_inReq_valid = regRead_io_exeReqs_0_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pc = regRead_io_exeReqs_0_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_inst = regRead_io_exeReqs_0_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_fuType = regRead_io_exeReqs_0_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_aluOp = regRead_io_exeReqs_0_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_bruOp = regRead_io_exeReqs_0_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_lsuOp = regRead_io_exeReqs_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_csrOp = regRead_io_exeReqs_0_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_mulOp = regRead_io_exeReqs_0_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_divOp = regRead_io_exeReqs_0_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_src1Type = regRead_io_exeReqs_0_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_src2Type = regRead_io_exeReqs_0_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_immType = regRead_io_exeReqs_0_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_rfWen = regRead_io_exeReqs_0_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_memRead = regRead_io_exeReqs_0_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_memWrite = regRead_io_exeReqs_0_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_csrWen = regRead_io_exeReqs_0_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_isBranch = regRead_io_exeReqs_0_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_isJump = regRead_io_exeReqs_0_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ctrl_isPriv = regRead_io_exeReqs_0_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_excp_excpVec = regRead_io_exeReqs_0_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_imm = regRead_io_exeReqs_0_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_csrAddress = regRead_io_exeReqs_0_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdInfo_valid = regRead_io_exeReqs_0_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdInfo_isBr = regRead_io_exeReqs_0_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdInfo_isJal = regRead_io_exeReqs_0_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdInfo_isJalr = regRead_io_exeReqs_0_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdInfo_isCall = regRead_io_exeReqs_0_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdInfo_isRet = regRead_io_exeReqs_0_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdInfo_jumpTarget = regRead_io_exeReqs_0_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_pc = regRead_io_exeReqs_0_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_fallThrough = regRead_io_exeReqs_0_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_taken = regRead_io_exeReqs_0_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_target = regRead_io_exeReqs_0_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_takenOffset = regRead_io_exeReqs_0_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_valid = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbHit = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsJal = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsCall = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbIsRet = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_btbOffset = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_phtCounter = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_rasTop = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_predTaken = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_bpuInfo_meta_predTarget = regRead_io_exeReqs_0_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_ldst = regRead_io_exeReqs_0_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_lrs1 = regRead_io_exeReqs_0_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_lrs2 = regRead_io_exeReqs_0_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_pdst = regRead_io_exeReqs_0_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_prs1 = regRead_io_exeReqs_0_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_prs2 = regRead_io_exeReqs_0_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_oldPdst = regRead_io_exeReqs_0_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_rs1Valid = regRead_io_exeReqs_0_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_rs2Valid = regRead_io_exeReqs_0_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_rdValid = regRead_io_exeReqs_0_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_snptId_valid = regRead_io_exeReqs_0_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_snptId_bits = regRead_io_exeReqs_0_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_robIdx_value = regRead_io_exeReqs_0_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_robIdx_flag = regRead_io_exeReqs_0_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_robIdxFull_value = regRead_io_exeReqs_0_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_robIdxFull_flag = regRead_io_exeReqs_0_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_lqIdx_value = regRead_io_exeReqs_0_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_lqIdx_flag = regRead_io_exeReqs_0_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_sqIdx_value = regRead_io_exeReqs_0_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_sqIdx_flag = regRead_io_exeReqs_0_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_issueQueue = regRead_io_exeReqs_0_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_prs1Busy = regRead_io_exeReqs_0_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_prs2Busy = regRead_io_exeReqs_0_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_isSta = regRead_io_exeReqs_0_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_uop_isStd = regRead_io_exeReqs_0_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_rs1Data = regRead_io_exeReqs_0_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_inReq_bits_rs2Data = regRead_io_exeReqs_0_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_0_io_outResult_ready = writeback_io_InExeResults_0_ready; // @[src/main/scala/backend/Backend.scala 175:34]
  assign exeUnits_0_io_csrRdata = io_csrResp_data; // @[src/main/scala/backend/Backend.scala 91:27]
  assign exeUnits_0_io_timerInfo_tid = io_timerInfo_tid; // @[src/main/scala/backend/Backend.scala 98:28]
  assign exeUnits_0_io_timerInfo_timer = io_timerInfo_timer; // @[src/main/scala/backend/Backend.scala 98:28]
  assign exeUnits_1_clock = clock;
  assign exeUnits_1_reset = reset;
  assign exeUnits_1_io_inReq_valid = regRead_io_exeReqs_1_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pc = regRead_io_exeReqs_1_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_inst = regRead_io_exeReqs_1_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_fuType = regRead_io_exeReqs_1_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_aluOp = regRead_io_exeReqs_1_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_bruOp = regRead_io_exeReqs_1_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_lsuOp = regRead_io_exeReqs_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_csrOp = regRead_io_exeReqs_1_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_mulOp = regRead_io_exeReqs_1_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_divOp = regRead_io_exeReqs_1_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_src1Type = regRead_io_exeReqs_1_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_src2Type = regRead_io_exeReqs_1_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_immType = regRead_io_exeReqs_1_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_rfWen = regRead_io_exeReqs_1_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_memRead = regRead_io_exeReqs_1_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_memWrite = regRead_io_exeReqs_1_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_csrWen = regRead_io_exeReqs_1_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_isBranch = regRead_io_exeReqs_1_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_isJump = regRead_io_exeReqs_1_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ctrl_isPriv = regRead_io_exeReqs_1_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_excp_excpVec = regRead_io_exeReqs_1_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_imm = regRead_io_exeReqs_1_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_csrAddress = regRead_io_exeReqs_1_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdInfo_valid = regRead_io_exeReqs_1_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdInfo_isBr = regRead_io_exeReqs_1_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdInfo_isJal = regRead_io_exeReqs_1_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdInfo_isJalr = regRead_io_exeReqs_1_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdInfo_isCall = regRead_io_exeReqs_1_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdInfo_isRet = regRead_io_exeReqs_1_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdInfo_jumpTarget = regRead_io_exeReqs_1_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_pc = regRead_io_exeReqs_1_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_fallThrough = regRead_io_exeReqs_1_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_taken = regRead_io_exeReqs_1_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_target = regRead_io_exeReqs_1_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_takenOffset = regRead_io_exeReqs_1_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_valid = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbHit = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsJal = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsCall = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbIsRet = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_btbOffset = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_phtCounter = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_rasTop = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_predTaken = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_bpuInfo_meta_predTarget = regRead_io_exeReqs_1_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_ldst = regRead_io_exeReqs_1_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_lrs1 = regRead_io_exeReqs_1_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_lrs2 = regRead_io_exeReqs_1_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_pdst = regRead_io_exeReqs_1_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_prs1 = regRead_io_exeReqs_1_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_prs2 = regRead_io_exeReqs_1_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_oldPdst = regRead_io_exeReqs_1_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_rs1Valid = regRead_io_exeReqs_1_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_rs2Valid = regRead_io_exeReqs_1_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_rdValid = regRead_io_exeReqs_1_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_snptId_valid = regRead_io_exeReqs_1_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_snptId_bits = regRead_io_exeReqs_1_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_robIdx_value = regRead_io_exeReqs_1_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_robIdx_flag = regRead_io_exeReqs_1_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_robIdxFull_value = regRead_io_exeReqs_1_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_robIdxFull_flag = regRead_io_exeReqs_1_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_issueQueue = regRead_io_exeReqs_1_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_prs1Busy = regRead_io_exeReqs_1_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_uop_prs2Busy = regRead_io_exeReqs_1_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_rs1Data = regRead_io_exeReqs_1_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_inReq_bits_rs2Data = regRead_io_exeReqs_1_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_1_io_outResult_ready = writeback_io_InExeResults_1_ready; // @[src/main/scala/backend/Backend.scala 175:34]
  assign exeUnits_1_io_redirectInfo_valid = ctrlBlock_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_1_io_redirectInfo_bits_doRedirect = ctrlBlock_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_1_io_redirectInfo_bits_robIdx_value = ctrlBlock_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_1_io_redirectInfo_bits_robIdx_flag = ctrlBlock_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_2_clock = clock;
  assign exeUnits_2_reset = reset;
  assign exeUnits_2_io_inReq_valid = regRead_io_exeReqs_2_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pc = regRead_io_exeReqs_2_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_inst = regRead_io_exeReqs_2_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_fuType = regRead_io_exeReqs_2_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_aluOp = regRead_io_exeReqs_2_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_bruOp = regRead_io_exeReqs_2_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_lsuOp = regRead_io_exeReqs_2_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_csrOp = regRead_io_exeReqs_2_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_mulOp = regRead_io_exeReqs_2_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_divOp = regRead_io_exeReqs_2_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_src1Type = regRead_io_exeReqs_2_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_src2Type = regRead_io_exeReqs_2_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_immType = regRead_io_exeReqs_2_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_rfWen = regRead_io_exeReqs_2_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_memRead = regRead_io_exeReqs_2_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_memWrite = regRead_io_exeReqs_2_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_csrWen = regRead_io_exeReqs_2_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_isBranch = regRead_io_exeReqs_2_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_isJump = regRead_io_exeReqs_2_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ctrl_isPriv = regRead_io_exeReqs_2_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_excp_excpVec = regRead_io_exeReqs_2_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_imm = regRead_io_exeReqs_2_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_csrAddress = regRead_io_exeReqs_2_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdInfo_valid = regRead_io_exeReqs_2_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdInfo_isBr = regRead_io_exeReqs_2_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdInfo_isJal = regRead_io_exeReqs_2_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdInfo_isJalr = regRead_io_exeReqs_2_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdInfo_isCall = regRead_io_exeReqs_2_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdInfo_isRet = regRead_io_exeReqs_2_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdInfo_jumpTarget = regRead_io_exeReqs_2_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_pc = regRead_io_exeReqs_2_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_fallThrough = regRead_io_exeReqs_2_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_taken = regRead_io_exeReqs_2_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_target = regRead_io_exeReqs_2_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_takenOffset = regRead_io_exeReqs_2_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_valid = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbHit = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsJal = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsCall = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbIsRet = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_btbOffset = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_phtCounter = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_rasTop = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_predTaken = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_bpuInfo_meta_predTarget = regRead_io_exeReqs_2_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_ldst = regRead_io_exeReqs_2_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_lrs1 = regRead_io_exeReqs_2_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_lrs2 = regRead_io_exeReqs_2_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_pdst = regRead_io_exeReqs_2_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_prs1 = regRead_io_exeReqs_2_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_prs2 = regRead_io_exeReqs_2_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_oldPdst = regRead_io_exeReqs_2_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_rs1Valid = regRead_io_exeReqs_2_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_rs2Valid = regRead_io_exeReqs_2_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_rdValid = regRead_io_exeReqs_2_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_snptId_valid = regRead_io_exeReqs_2_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_snptId_bits = regRead_io_exeReqs_2_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_robIdx_value = regRead_io_exeReqs_2_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_robIdx_flag = regRead_io_exeReqs_2_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_robIdxFull_value = regRead_io_exeReqs_2_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_robIdxFull_flag = regRead_io_exeReqs_2_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_lqIdx_value = regRead_io_exeReqs_2_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_lqIdx_flag = regRead_io_exeReqs_2_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_sqIdx_value = regRead_io_exeReqs_2_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_sqIdx_flag = regRead_io_exeReqs_2_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_issueQueue = regRead_io_exeReqs_2_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_prs1Busy = regRead_io_exeReqs_2_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_prs2Busy = regRead_io_exeReqs_2_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_isSta = regRead_io_exeReqs_2_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_uop_isStd = regRead_io_exeReqs_2_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_rs1Data = regRead_io_exeReqs_2_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_inReq_bits_rs2Data = regRead_io_exeReqs_2_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_2_io_outResult_ready = writeback_io_InExeResults_2_ready; // @[src/main/scala/backend/Backend.scala 175:34]
  assign exeUnits_2_io_redirectInfo_valid = ctrlBlock_io_redirectInfo_valid; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_2_io_redirectInfo_bits_doRedirect = ctrlBlock_io_redirectInfo_bits_doRedirect; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_2_io_redirectInfo_bits_robIdx_value = ctrlBlock_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_2_io_redirectInfo_bits_robIdx_flag = ctrlBlock_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 206:38]
  assign exeUnits_3_clock = clock;
  assign exeUnits_3_reset = reset;
  assign exeUnits_3_io_inReq_valid = regRead_io_exeReqs_3_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pc = regRead_io_exeReqs_3_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_inst = regRead_io_exeReqs_3_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_fuType = regRead_io_exeReqs_3_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_aluOp = regRead_io_exeReqs_3_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_bruOp = regRead_io_exeReqs_3_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_lsuOp = regRead_io_exeReqs_3_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_csrOp = regRead_io_exeReqs_3_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_mulOp = regRead_io_exeReqs_3_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_divOp = regRead_io_exeReqs_3_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_src1Type = regRead_io_exeReqs_3_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_src2Type = regRead_io_exeReqs_3_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_immType = regRead_io_exeReqs_3_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_rfWen = regRead_io_exeReqs_3_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_memRead = regRead_io_exeReqs_3_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_memWrite = regRead_io_exeReqs_3_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_csrWen = regRead_io_exeReqs_3_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_isBranch = regRead_io_exeReqs_3_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_isJump = regRead_io_exeReqs_3_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ctrl_isPriv = regRead_io_exeReqs_3_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_excp_excpVec = regRead_io_exeReqs_3_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_imm = regRead_io_exeReqs_3_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_csrAddress = regRead_io_exeReqs_3_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdInfo_valid = regRead_io_exeReqs_3_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdInfo_isBr = regRead_io_exeReqs_3_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdInfo_isJal = regRead_io_exeReqs_3_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdInfo_isJalr = regRead_io_exeReqs_3_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdInfo_isCall = regRead_io_exeReqs_3_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdInfo_isRet = regRead_io_exeReqs_3_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdInfo_jumpTarget = regRead_io_exeReqs_3_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_pc = regRead_io_exeReqs_3_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_fallThrough = regRead_io_exeReqs_3_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_taken = regRead_io_exeReqs_3_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_target = regRead_io_exeReqs_3_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_takenOffset = regRead_io_exeReqs_3_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_valid = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbHit = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsJal = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsCall = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbIsRet = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_btbOffset = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_phtCounter = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_rasTop = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_predTaken = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_bpuInfo_meta_predTarget = regRead_io_exeReqs_3_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_ldst = regRead_io_exeReqs_3_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_lrs1 = regRead_io_exeReqs_3_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_lrs2 = regRead_io_exeReqs_3_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_pdst = regRead_io_exeReqs_3_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_prs1 = regRead_io_exeReqs_3_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_prs2 = regRead_io_exeReqs_3_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_oldPdst = regRead_io_exeReqs_3_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_rs1Valid = regRead_io_exeReqs_3_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_rs2Valid = regRead_io_exeReqs_3_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_rdValid = regRead_io_exeReqs_3_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_snptId_valid = regRead_io_exeReqs_3_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_snptId_bits = regRead_io_exeReqs_3_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_robIdx_value = regRead_io_exeReqs_3_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_robIdx_flag = regRead_io_exeReqs_3_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_robIdxFull_value = regRead_io_exeReqs_3_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_robIdxFull_flag = regRead_io_exeReqs_3_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_lqIdx_value = regRead_io_exeReqs_3_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_lqIdx_flag = regRead_io_exeReqs_3_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_sqIdx_value = regRead_io_exeReqs_3_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_sqIdx_flag = regRead_io_exeReqs_3_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_issueQueue = regRead_io_exeReqs_3_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_prs1Busy = regRead_io_exeReqs_3_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_prs2Busy = regRead_io_exeReqs_3_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_isSta = regRead_io_exeReqs_3_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_uop_isStd = regRead_io_exeReqs_3_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_rs1Data = regRead_io_exeReqs_3_bits_rs1Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_inReq_bits_rs2Data = regRead_io_exeReqs_3_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_3_io_outResult_ready = io_toMemResult_0_ready; // @[src/main/scala/backend/Backend.scala 178:28]
  assign exeUnits_4_clock = clock;
  assign exeUnits_4_reset = reset;
  assign exeUnits_4_io_inReq_valid = regRead_io_exeReqs_4_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pc = regRead_io_exeReqs_4_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_inst = regRead_io_exeReqs_4_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_fuType = regRead_io_exeReqs_4_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_aluOp = regRead_io_exeReqs_4_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_bruOp = regRead_io_exeReqs_4_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_lsuOp = regRead_io_exeReqs_4_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_csrOp = regRead_io_exeReqs_4_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_mulOp = regRead_io_exeReqs_4_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_divOp = regRead_io_exeReqs_4_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_src1Type = regRead_io_exeReqs_4_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_src2Type = regRead_io_exeReqs_4_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_immType = regRead_io_exeReqs_4_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_rfWen = regRead_io_exeReqs_4_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_memRead = regRead_io_exeReqs_4_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_memWrite = regRead_io_exeReqs_4_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_csrWen = regRead_io_exeReqs_4_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_isBranch = regRead_io_exeReqs_4_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_isJump = regRead_io_exeReqs_4_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ctrl_isPriv = regRead_io_exeReqs_4_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_excp_excpVec = regRead_io_exeReqs_4_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_imm = regRead_io_exeReqs_4_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_csrAddress = regRead_io_exeReqs_4_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdInfo_valid = regRead_io_exeReqs_4_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdInfo_isBr = regRead_io_exeReqs_4_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdInfo_isJal = regRead_io_exeReqs_4_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdInfo_isJalr = regRead_io_exeReqs_4_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdInfo_isCall = regRead_io_exeReqs_4_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdInfo_isRet = regRead_io_exeReqs_4_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdInfo_jumpTarget = regRead_io_exeReqs_4_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_pc = regRead_io_exeReqs_4_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_fallThrough = regRead_io_exeReqs_4_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_taken = regRead_io_exeReqs_4_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_target = regRead_io_exeReqs_4_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_takenOffset = regRead_io_exeReqs_4_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_valid = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbHit = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsJalr = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsJal = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsCall = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbIsRet = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_btbOffset = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_phtCounter = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_rasTop = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_predTaken = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_bpuInfo_meta_predTarget = regRead_io_exeReqs_4_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_ldst = regRead_io_exeReqs_4_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_lrs1 = regRead_io_exeReqs_4_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_lrs2 = regRead_io_exeReqs_4_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_pdst = regRead_io_exeReqs_4_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_prs1 = regRead_io_exeReqs_4_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_prs2 = regRead_io_exeReqs_4_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_oldPdst = regRead_io_exeReqs_4_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_rs1Valid = regRead_io_exeReqs_4_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_rs2Valid = regRead_io_exeReqs_4_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_rdValid = regRead_io_exeReqs_4_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_snptId_valid = regRead_io_exeReqs_4_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_snptId_bits = regRead_io_exeReqs_4_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_robIdx_value = regRead_io_exeReqs_4_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_robIdx_flag = regRead_io_exeReqs_4_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_robIdxFull_value = regRead_io_exeReqs_4_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_robIdxFull_flag = regRead_io_exeReqs_4_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_lqIdx_value = regRead_io_exeReqs_4_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_lqIdx_flag = regRead_io_exeReqs_4_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_sqIdx_value = regRead_io_exeReqs_4_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_sqIdx_flag = regRead_io_exeReqs_4_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_issueQueue = regRead_io_exeReqs_4_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_prs1Busy = regRead_io_exeReqs_4_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_prs2Busy = regRead_io_exeReqs_4_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_isSta = regRead_io_exeReqs_4_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_uop_isStd = regRead_io_exeReqs_4_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_inReq_bits_rs2Data = regRead_io_exeReqs_4_bits_rs2Data; // @[src/main/scala/backend/Backend.scala 163:17]
  assign exeUnits_4_io_outResult_ready = io_toMemResult_1_ready; // @[src/main/scala/backend/Backend.scala 179:28]
  assign writeback_clock = clock;
  assign writeback_reset = reset;
  assign writeback_io_InExeResults_0_valid = exeUnits_0_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pc = exeUnits_0_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_inst = exeUnits_0_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_fuType = exeUnits_0_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_aluOp = exeUnits_0_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_bruOp = exeUnits_0_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_lsuOp = exeUnits_0_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_csrOp = exeUnits_0_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_mulOp = exeUnits_0_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_divOp = exeUnits_0_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_src1Type = exeUnits_0_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_src2Type = exeUnits_0_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_immType = exeUnits_0_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_rfWen = exeUnits_0_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_memRead = exeUnits_0_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_memWrite = exeUnits_0_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_csrWen = exeUnits_0_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_isBranch = exeUnits_0_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_isJump = exeUnits_0_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ctrl_isPriv = exeUnits_0_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_excp_excpVec = exeUnits_0_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_imm = exeUnits_0_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_csrAddress = exeUnits_0_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdInfo_valid = exeUnits_0_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdInfo_isBr = exeUnits_0_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdInfo_isJal = exeUnits_0_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdInfo_isJalr = exeUnits_0_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdInfo_isCall = exeUnits_0_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdInfo_isRet = exeUnits_0_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdInfo_jumpTarget = exeUnits_0_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_pc = exeUnits_0_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_fallThrough = exeUnits_0_io_outResult_bits_uop_bpuInfo_fallThrough
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_taken = exeUnits_0_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_target = exeUnits_0_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_takenOffset = exeUnits_0_io_outResult_bits_uop_bpuInfo_takenOffset
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_valid = exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbHit = exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbHit
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJalr =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsJal =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsCall =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbIsRet =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_btbOffset =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_phtCounter =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_rasTop = exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_rasTop
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_predTaken =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_bpuInfo_meta_predTarget =
    exeUnits_0_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_ldst = exeUnits_0_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_lrs1 = exeUnits_0_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_lrs2 = exeUnits_0_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_pdst = exeUnits_0_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_prs1 = exeUnits_0_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_prs2 = exeUnits_0_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_oldPdst = exeUnits_0_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_rs1Valid = exeUnits_0_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_rs2Valid = exeUnits_0_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_rdValid = exeUnits_0_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_snptId_valid = exeUnits_0_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_snptId_bits = exeUnits_0_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_robIdx_value = exeUnits_0_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_robIdx_flag = exeUnits_0_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_robIdxFull_value = exeUnits_0_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_robIdxFull_flag = exeUnits_0_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_lqIdx_value = exeUnits_0_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_lqIdx_flag = exeUnits_0_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_sqIdx_value = exeUnits_0_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_sqIdx_flag = exeUnits_0_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_issueQueue = exeUnits_0_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_prs1Busy = exeUnits_0_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_prs2Busy = exeUnits_0_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_isSta = exeUnits_0_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_uop_isStd = exeUnits_0_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_data = exeUnits_0_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_memStoreData = exeUnits_0_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_csrWen = exeUnits_0_io_outResult_bits_csrWen; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_csrWaddr = exeUnits_0_io_outResult_bits_csrWaddr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_csrWdata = exeUnits_0_io_outResult_bits_csrWdata; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_0_bits_csrTimer = exeUnits_0_io_outResult_bits_csrTimer; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_valid = exeUnits_1_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pc = exeUnits_1_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_inst = exeUnits_1_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_fuType = exeUnits_1_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_aluOp = exeUnits_1_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_bruOp = exeUnits_1_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_lsuOp = exeUnits_1_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_csrOp = exeUnits_1_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_mulOp = exeUnits_1_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_divOp = exeUnits_1_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_src1Type = exeUnits_1_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_src2Type = exeUnits_1_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_immType = exeUnits_1_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_rfWen = exeUnits_1_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_memRead = exeUnits_1_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_memWrite = exeUnits_1_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_csrWen = exeUnits_1_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_isBranch = exeUnits_1_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_isJump = exeUnits_1_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ctrl_isPriv = exeUnits_1_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_excp_excpVec = exeUnits_1_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_imm = exeUnits_1_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_csrAddress = exeUnits_1_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdInfo_valid = exeUnits_1_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdInfo_isBr = exeUnits_1_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdInfo_isJal = exeUnits_1_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdInfo_isJalr = exeUnits_1_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdInfo_isCall = exeUnits_1_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdInfo_isRet = exeUnits_1_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdInfo_jumpTarget = exeUnits_1_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_pc = exeUnits_1_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_fallThrough = exeUnits_1_io_outResult_bits_uop_bpuInfo_fallThrough
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_taken = exeUnits_1_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_target = exeUnits_1_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_takenOffset = exeUnits_1_io_outResult_bits_uop_bpuInfo_takenOffset
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_valid = exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbHit = exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbHit
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJalr =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsJal =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsCall =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbIsRet =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_btbOffset =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_phtCounter =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_rasTop = exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_rasTop
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_predTaken =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_bpuInfo_meta_predTarget =
    exeUnits_1_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_ldst = exeUnits_1_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_lrs1 = exeUnits_1_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_lrs2 = exeUnits_1_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_pdst = exeUnits_1_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_prs1 = exeUnits_1_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_prs2 = exeUnits_1_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_oldPdst = exeUnits_1_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_rs1Valid = exeUnits_1_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_rs2Valid = exeUnits_1_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_rdValid = exeUnits_1_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_snptId_valid = exeUnits_1_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_snptId_bits = exeUnits_1_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_robIdx_value = exeUnits_1_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_robIdx_flag = exeUnits_1_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_robIdxFull_value = exeUnits_1_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_robIdxFull_flag = exeUnits_1_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_issueQueue = exeUnits_1_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_prs1Busy = exeUnits_1_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_uop_prs2Busy = exeUnits_1_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_data = exeUnits_1_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_1_bits_memStoreData = exeUnits_1_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_valid = exeUnits_2_io_outResult_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pc = exeUnits_2_io_outResult_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_inst = exeUnits_2_io_outResult_bits_uop_inst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_fuType = exeUnits_2_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_aluOp = exeUnits_2_io_outResult_bits_uop_ctrl_aluOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_bruOp = exeUnits_2_io_outResult_bits_uop_ctrl_bruOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_lsuOp = exeUnits_2_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_csrOp = exeUnits_2_io_outResult_bits_uop_ctrl_csrOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_mulOp = exeUnits_2_io_outResult_bits_uop_ctrl_mulOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_divOp = exeUnits_2_io_outResult_bits_uop_ctrl_divOp; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_src1Type = exeUnits_2_io_outResult_bits_uop_ctrl_src1Type; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_src2Type = exeUnits_2_io_outResult_bits_uop_ctrl_src2Type; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_immType = exeUnits_2_io_outResult_bits_uop_ctrl_immType; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_rfWen = exeUnits_2_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_memRead = exeUnits_2_io_outResult_bits_uop_ctrl_memRead; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_memWrite = exeUnits_2_io_outResult_bits_uop_ctrl_memWrite; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_csrWen = exeUnits_2_io_outResult_bits_uop_ctrl_csrWen; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_isBranch = exeUnits_2_io_outResult_bits_uop_ctrl_isBranch; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_isJump = exeUnits_2_io_outResult_bits_uop_ctrl_isJump; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ctrl_isPriv = exeUnits_2_io_outResult_bits_uop_ctrl_isPriv; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_excp_excpVec = exeUnits_2_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_imm = exeUnits_2_io_outResult_bits_uop_imm; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_csrAddress = exeUnits_2_io_outResult_bits_uop_csrAddress; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdInfo_valid = exeUnits_2_io_outResult_bits_uop_pdInfo_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdInfo_isBr = exeUnits_2_io_outResult_bits_uop_pdInfo_isBr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdInfo_isJal = exeUnits_2_io_outResult_bits_uop_pdInfo_isJal; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdInfo_isJalr = exeUnits_2_io_outResult_bits_uop_pdInfo_isJalr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdInfo_isCall = exeUnits_2_io_outResult_bits_uop_pdInfo_isCall; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdInfo_isRet = exeUnits_2_io_outResult_bits_uop_pdInfo_isRet; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdInfo_jumpTarget = exeUnits_2_io_outResult_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_pc = exeUnits_2_io_outResult_bits_uop_bpuInfo_pc; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_fallThrough = exeUnits_2_io_outResult_bits_uop_bpuInfo_fallThrough
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_taken = exeUnits_2_io_outResult_bits_uop_bpuInfo_taken; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_target = exeUnits_2_io_outResult_bits_uop_bpuInfo_target; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_takenOffset = exeUnits_2_io_outResult_bits_uop_bpuInfo_takenOffset
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_valid = exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbHit = exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbHit
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJalr =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsJal =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsCall =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbIsRet =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_btbOffset =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_phtCounter =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_rasTop = exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_rasTop
    ; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_predTaken =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_bpuInfo_meta_predTarget =
    exeUnits_2_io_outResult_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_ldst = exeUnits_2_io_outResult_bits_uop_ldst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_lrs1 = exeUnits_2_io_outResult_bits_uop_lrs1; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_lrs2 = exeUnits_2_io_outResult_bits_uop_lrs2; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_pdst = exeUnits_2_io_outResult_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_prs1 = exeUnits_2_io_outResult_bits_uop_prs1; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_prs2 = exeUnits_2_io_outResult_bits_uop_prs2; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_oldPdst = exeUnits_2_io_outResult_bits_uop_oldPdst; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_rs1Valid = exeUnits_2_io_outResult_bits_uop_rs1Valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_rs2Valid = exeUnits_2_io_outResult_bits_uop_rs2Valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_rdValid = exeUnits_2_io_outResult_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_snptId_valid = exeUnits_2_io_outResult_bits_uop_snptId_valid; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_snptId_bits = exeUnits_2_io_outResult_bits_uop_snptId_bits; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_robIdx_value = exeUnits_2_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_robIdx_flag = exeUnits_2_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_robIdxFull_value = exeUnits_2_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_robIdxFull_flag = exeUnits_2_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_lqIdx_value = exeUnits_2_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_lqIdx_flag = exeUnits_2_io_outResult_bits_uop_lqIdx_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_sqIdx_value = exeUnits_2_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_sqIdx_flag = exeUnits_2_io_outResult_bits_uop_sqIdx_flag; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_issueQueue = exeUnits_2_io_outResult_bits_uop_issueQueue; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_prs1Busy = exeUnits_2_io_outResult_bits_uop_prs1Busy; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_prs2Busy = exeUnits_2_io_outResult_bits_uop_prs2Busy; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_isSta = exeUnits_2_io_outResult_bits_uop_isSta; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_uop_isStd = exeUnits_2_io_outResult_bits_uop_isStd; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_data = exeUnits_2_io_outResult_bits_data; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_2_bits_memStoreData = exeUnits_2_io_outResult_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 175:34]
  assign writeback_io_InExeResults_3_valid = io_fromMemResult_0_valid; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_pc = io_fromMemResult_0_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_ctrl_fuType = io_fromMemResult_0_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_ctrl_lsuOp = io_fromMemResult_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_ctrl_rfWen = io_fromMemResult_0_bits_uop_ctrl_rfWen; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_excp_excpVec = io_fromMemResult_0_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_pdst = io_fromMemResult_0_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_rdValid = io_fromMemResult_0_bits_uop_rdValid; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_robIdx_value = io_fromMemResult_0_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_robIdx_flag = io_fromMemResult_0_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_robIdxFull_value = io_fromMemResult_0_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_robIdxFull_flag = io_fromMemResult_0_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_lqIdx_value = io_fromMemResult_0_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_uop_sqIdx_value = io_fromMemResult_0_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_data = io_fromMemResult_0_bits_data; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_memVaddr = io_fromMemResult_0_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_3_bits_memPaddr = io_fromMemResult_0_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 191:23]
  assign writeback_io_InExeResults_4_valid = io_fromMemResult_1_valid; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_pc = io_fromMemResult_1_bits_uop_pc; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_ctrl_fuType = io_fromMemResult_1_bits_uop_ctrl_fuType; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_ctrl_lsuOp = io_fromMemResult_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_excp_excpVec = io_fromMemResult_1_bits_uop_excp_excpVec; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_pdst = io_fromMemResult_1_bits_uop_pdst; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_robIdx_value = io_fromMemResult_1_bits_uop_robIdx_value; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_robIdx_flag = io_fromMemResult_1_bits_uop_robIdx_flag; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_robIdxFull_value = io_fromMemResult_1_bits_uop_robIdxFull_value; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_robIdxFull_flag = io_fromMemResult_1_bits_uop_robIdxFull_flag; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_lqIdx_value = io_fromMemResult_1_bits_uop_lqIdx_value; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_uop_sqIdx_value = io_fromMemResult_1_bits_uop_sqIdx_value; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_redirect_bits_robIdx_value =
    io_fromMemResult_1_bits_redirect_bits_robIdx_value; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_redirect_bits_robIdx_flag = io_fromMemResult_1_bits_redirect_bits_robIdx_flag; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_memVaddr = io_fromMemResult_1_bits_memVaddr; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_memPaddr = io_fromMemResult_1_bits_memPaddr; // @[src/main/scala/backend/Backend.scala 192:23]
  assign writeback_io_InExeResults_4_bits_memStoreData = io_fromMemResult_1_bits_memStoreData; // @[src/main/scala/backend/Backend.scala 192:23]
endmodule
