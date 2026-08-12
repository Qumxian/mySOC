module CircularQueue(
  input         clock,
  input         reset,
  output        io_enq_0_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_bpuInfo_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_taken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_bpuInfo_target, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [2:0]  io_enq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpAle, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_enq_1_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_bpuInfo_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_bpuInfo_fallThrough, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_taken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_bpuInfo_target, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_1_bits_bpuInfo_takenOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_meta_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [2:0]  io_enq_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpAle, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_enq_2_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_bpuInfo_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_bpuInfo_fallThrough, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_taken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_bpuInfo_target, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_2_bits_bpuInfo_takenOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_meta_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [2:0]  io_enq_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpAle, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_enq_3_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_bpuInfo_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_bpuInfo_fallThrough, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_taken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_bpuInfo_target, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_3_bits_bpuInfo_takenOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_meta_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_meta_btbHit, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_3_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [1:0]  io_enq_3_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [2:0]  io_enq_3_bits_bpuInfo_meta_rasTop, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_bpuInfo_meta_predTaken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_bpuInfo_meta_predTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpAle, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_deq_0_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_bpuInfo_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_bpuInfo_fallThrough, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_taken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_bpuInfo_target, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_0_bits_bpuInfo_takenOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_meta_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_meta_btbHit, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_0_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_0_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [2:0]  io_deq_0_bits_bpuInfo_meta_rasTop, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_bpuInfo_meta_predTaken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_bpuInfo_meta_predTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpAle, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_deq_1_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_bpuInfo_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_bpuInfo_fallThrough, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_taken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_bpuInfo_target, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_1_bits_bpuInfo_takenOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_meta_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_meta_btbHit, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_1_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_1_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [2:0]  io_deq_1_bits_bpuInfo_meta_rasTop, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_bpuInfo_meta_predTaken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_bpuInfo_meta_predTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpAle, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_deq_2_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_bpuInfo_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_bpuInfo_fallThrough, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_taken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_bpuInfo_target, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_2_bits_bpuInfo_takenOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_meta_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_meta_btbHit, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_meta_btbIsJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_meta_btbIsJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_meta_btbIsCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_meta_btbIsRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_2_bits_bpuInfo_meta_btbOffset, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [1:0]  io_deq_2_bits_bpuInfo_meta_phtCounter, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [2:0]  io_deq_2_bits_bpuInfo_meta_rasTop, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_bpuInfo_meta_predTaken, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_bpuInfo_meta_predTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpAle, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_flush // @[src/main/scala/util/CircularQueue.scala 83:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [3:0] deqPtr_value; // @[src/main/scala/util/CircularQueue.scala 101:23]
  reg  deqPtr_flag; // @[src/main/scala/util/CircularQueue.scala 101:23]
  reg [3:0] enqPtr_value; // @[src/main/scala/util/CircularQueue.scala 102:23]
  reg  enqPtr_flag; // @[src/main/scala/util/CircularQueue.scala 102:23]
  reg [31:0] data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_0_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_0_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_0_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_0_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_0_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_0_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_0_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_0_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_0_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_1_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_1_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_1_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_1_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_1_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_1_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_1_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_1_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_1_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_2_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_2_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_2_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_2_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_2_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_2_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_2_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_2_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_2_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_3_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_3_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_3_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_3_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_3_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_3_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_3_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_3_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_3_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_4_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_4_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_4_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_4_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_4_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_4_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_4_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_4_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_4_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_5_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_5_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_5_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_5_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_5_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_5_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_5_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_5_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_5_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_6_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_6_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_6_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_6_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_6_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_6_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_6_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_6_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_6_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_7_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_7_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_7_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_7_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_7_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_7_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_7_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_7_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_7_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_8_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_8_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_8_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_8_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_8_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_8_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_8_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_8_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_8_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_9_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_9_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_9_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_9_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_9_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_9_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_9_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_9_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_9_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_10_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_10_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_10_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_10_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_10_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_10_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_10_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_10_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_10_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_11_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_11_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_11_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_11_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_11_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_11_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_11_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_11_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_11_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_12_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_12_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_12_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_12_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_12_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_12_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_12_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_12_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_12_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_13_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_13_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_13_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_13_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_13_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_13_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_13_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_13_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_13_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_14_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_14_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_14_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_14_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_14_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_14_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_14_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_14_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_14_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_15_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_15_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_15_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_15_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_15_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [1:0] data_15_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [2:0] data_15_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg [31:0] data_15_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21]
  reg  data_15_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21]
  wire  _empty_T = deqPtr_value == enqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 117:39]
  wire  empty = deqPtr_value == enqPtr_value & deqPtr_flag == enqPtr_flag; // @[src/main/scala/util/CircularQueuePtr.scala 117:54]
  wire  full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/util/CircularQueue.scala 129:47]
  wire [3:0] _count_T_2 = enqPtr_value - deqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 160:18]
  wire [4:0] _GEN_8644 = {{1'd0}, enqPtr_value}; // @[src/main/scala/util/CircularQueuePtr.scala 161:18]
  wire [5:0] _count_T_3 = 5'h10 + _GEN_8644; // @[src/main/scala/util/CircularQueuePtr.scala 161:18]
  wire [5:0] _GEN_8645 = {{2'd0}, deqPtr_value}; // @[src/main/scala/util/CircularQueuePtr.scala 161:33]
  wire [5:0] _count_T_5 = _count_T_3 - _GEN_8645; // @[src/main/scala/util/CircularQueuePtr.scala 161:33]
  wire [5:0] _count_T_6 = enqPtr_flag == deqPtr_flag ? {{2'd0}, _count_T_2} : _count_T_5; // @[src/main/scala/util/CircularQueuePtr.scala 159:8]
  wire  _T_1 = ~io_enq_0_valid & io_enq_1_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire  _T_6 = ~io_enq_1_valid & io_enq_2_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire  _T_11 = ~io_enq_2_valid & io_enq_3_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire [4:0] count = _count_T_6[4:0]; // @[src/main/scala/util/CircularQueue.scala 143:23 146:9]
  wire [5:0] _canEnq_T = {{1'd0}, count}; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq = _canEnq_T < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_15 = io_enq_0_ready & io_enq_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx = _GEN_8644[3:0]; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire  _GEN_0 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_1 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_1_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_2 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_2_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_3 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_3_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_4 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_4_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_5 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_5_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_6 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_6_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_7 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_7_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_8 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_8_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_9 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_9_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_10 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_10_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_11 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_11_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_12 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_12_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_13 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_13_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_14 = 4'he == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_14_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_15 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_15_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_16 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_17 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_1_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_18 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_2_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_19 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_3_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_20 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_4_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_21 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_5_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_22 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_6_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_23 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_7_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_24 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_8_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_25 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_9_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_26 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_10_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_27 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_11_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_28 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_12_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_29 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_13_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_30 = 4'he == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_14_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_31 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_15_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_32 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_33 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_1_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_34 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_2_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_35 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_3_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_36 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_4_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_37 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_5_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_38 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_6_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_39 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_7_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_40 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_8_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_41 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_9_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_42 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_10_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_43 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_11_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_44 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_12_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_45 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_13_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_46 = 4'he == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_14_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_47 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_15_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_48 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_49 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_1_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_50 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_2_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_51 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_3_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_52 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_4_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_53 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_5_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_54 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_6_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_55 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_7_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_56 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_8_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_57 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_9_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_58 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpAdef : data_10_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_59 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpAdef : data_11_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_60 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpAdef : data_12_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_61 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpAdef : data_13_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_62 = 4'he == writeIdx ? io_enq_0_bits_exception_excpAdef : data_14_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_63 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpAdef : data_15_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_64 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpAle : data_0_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_65 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpAle : data_1_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_66 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpAle : data_2_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_67 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpAle : data_3_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_68 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpAle : data_4_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_69 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpAle : data_5_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_70 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpAle : data_6_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_71 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpAle : data_7_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_72 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpAle : data_8_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_73 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpAle : data_9_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_74 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpAle : data_10_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_75 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpAle : data_11_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_76 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpAle : data_12_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_77 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpAle : data_13_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_78 = 4'he == writeIdx ? io_enq_0_bits_exception_excpAle : data_14_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_79 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpAle : data_15_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_80 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_0_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_81 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_1_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_82 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_2_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_83 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_3_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_84 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_4_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_85 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_5_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_86 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_6_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_87 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_7_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_88 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_8_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_89 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_9_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_90 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_10_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_91 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_11_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_92 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_12_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_93 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_13_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_94 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_14_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_95 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_pc : data_15_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_96 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_0_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_97 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_1_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_98 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_2_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_99 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_3_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_100 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_4_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_101 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_5_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_102 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_6_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_103 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_7_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_104 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_8_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_105 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_9_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_106 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_10_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_107 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_11_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_108 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_12_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_109 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_13_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_110 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_14_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_111 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_fallThrough : data_15_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_112 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_0_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_113 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_1_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_114 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_2_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_115 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_3_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_116 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_4_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_117 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_5_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_118 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_6_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_119 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_7_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_120 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_8_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_121 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_9_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_122 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_10_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_123 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_11_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_124 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_12_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_125 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_13_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_126 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_14_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_127 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_taken : data_15_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_128 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_0_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_129 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_1_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_130 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_2_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_131 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_3_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_132 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_4_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_133 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_5_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_134 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_6_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_135 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_7_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_136 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_8_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_137 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_target : data_9_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_138 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_target : data_10_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_139 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_target : data_11_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_140 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_target : data_12_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_141 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_target : data_13_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_142 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_target : data_14_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_143 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_target : data_15_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_144 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_0_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_145 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_1_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_146 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_2_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_147 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_3_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_148 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_4_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_149 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_5_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_150 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_6_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_151 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_7_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_152 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_8_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_153 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_9_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_154 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_10_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_155 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_11_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_156 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_12_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_157 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_13_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_158 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_14_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_159 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_takenOffset : data_15_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_160 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_0_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_161 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_1_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_162 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_2_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_163 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_3_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_164 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_4_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_165 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_5_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_166 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_6_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_167 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_7_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_168 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_8_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_169 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_9_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_170 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_10_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_171 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_11_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_172 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_12_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_173 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_13_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_174 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_14_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_175 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_valid : data_15_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_176 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_0_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_177 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_1_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_178 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_2_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_179 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_3_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_180 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_4_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_181 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_5_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_182 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_6_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_183 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_7_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_184 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_8_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_185 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_9_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_186 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_10_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_187 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_11_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_188 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_12_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_189 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_13_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_190 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_14_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_191 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbHit : data_15_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_192 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_193 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_194 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_195 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_196 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_197 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_5_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_198 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_6_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_199 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_7_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_200 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_8_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_201 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_9_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_202 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_10_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_203 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_11_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_204 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_12_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_205 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_13_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_206 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_14_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_207 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJalr : data_15_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_208 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_209 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_210 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_211 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_212 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_213 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_5_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_214 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_6_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_215 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_7_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_216 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_8_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_217 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_9_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_218 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_10_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_219 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_11_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_220 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_12_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_221 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_13_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_222 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_14_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_223 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsJal : data_15_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_224 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_225 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_226 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_227 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_228 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_229 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_5_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_230 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_6_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_231 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_7_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_232 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_8_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_233 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_9_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_234 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_10_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_235 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_11_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_236 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_12_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_237 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_13_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_238 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_14_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_239 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsCall : data_15_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_240 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_241 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_242 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_243 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_244 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_245 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_5_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_246 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_6_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_247 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_7_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_248 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_8_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_249 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_9_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_250 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_10_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_251 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_11_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_252 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_12_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_253 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_13_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_254 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_14_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_255 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbIsRet : data_15_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_256 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_0_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_257 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_1_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_258 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_2_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_259 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_3_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_260 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_4_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_261 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_5_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_262 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_6_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_263 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_7_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_264 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_8_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_265 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_9_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_266 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_10_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_267 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_11_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_268 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_12_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_269 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_13_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_270 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_14_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_271 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_btbOffset : data_15_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_272 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_0_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_273 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_1_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_274 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_2_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_275 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_3_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_276 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_4_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_277 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_5_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_278 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_6_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_279 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_7_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_280 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_8_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_281 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_9_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_282 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_10_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_283 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_11_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_284 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_12_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_285 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_13_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_286 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_14_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [1:0] _GEN_287 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_phtCounter : data_15_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_288 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_0_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_289 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_1_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_290 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_2_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_291 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_3_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_292 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_4_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_293 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_5_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_294 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_6_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_295 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_7_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_296 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_8_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_297 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_9_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_298 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_10_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_299 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_11_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_300 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_12_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_301 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_13_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_302 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_14_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [2:0] _GEN_303 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_rasTop : data_15_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_304 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_0_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_305 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_1_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_306 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_2_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_307 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_3_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_308 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_4_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_309 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_5_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_310 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_6_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_311 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_7_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_312 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_8_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_313 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_9_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_314 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_10_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_315 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_11_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_316 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_12_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_317 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_13_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_318 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_14_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_319 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTaken : data_15_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_320 = 4'h0 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_0_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_321 = 4'h1 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_1_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_322 = 4'h2 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_2_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_323 = 4'h3 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_3_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_324 = 4'h4 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_4_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_325 = 4'h5 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_5_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_326 = 4'h6 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_6_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_327 = 4'h7 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_7_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_328 = 4'h8 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_8_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_329 = 4'h9 == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_9_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_330 = 4'ha == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_10_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_331 = 4'hb == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_11_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_332 = 4'hc == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_12_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_333 = 4'hd == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_13_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_334 = 4'he == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_14_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_335 = 4'hf == writeIdx ? io_enq_0_bits_bpuInfo_meta_predTarget : data_15_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_336 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_337 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_338 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_339 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_340 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_341 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_342 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_343 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_344 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_345 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_346 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_valid : data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_347 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_valid : data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_348 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_valid : data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_349 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_valid : data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_350 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_valid : data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_351 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_valid : data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_352 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_353 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_354 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_355 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_356 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_357 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_358 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_359 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_360 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_361 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_362 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_363 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_364 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_365 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_366 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_367 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_368 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_369 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_370 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_371 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_372 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_373 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_374 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_375 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_376 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_377 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_378 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_379 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_380 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_381 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_382 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_383 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_384 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_385 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_386 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_387 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_388 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_389 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_390 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_391 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_392 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_393 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_394 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_395 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_396 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_397 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_398 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_399 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_400 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_401 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_402 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_403 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_404 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_405 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_406 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_407 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_408 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_409 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_410 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_411 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_412 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_413 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_414 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_415 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_416 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_417 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_418 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_419 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_420 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_421 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_422 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_423 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_424 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_425 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_426 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_427 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_428 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_429 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_430 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_431 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_432 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_433 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_434 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_435 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_436 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_437 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_438 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_439 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_440 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_441 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_442 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_443 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_444 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_445 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_446 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_447 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_448 = 4'h0 == writeIdx ? io_enq_0_bits_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_449 = 4'h1 == writeIdx ? io_enq_0_bits_pc : data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_450 = 4'h2 == writeIdx ? io_enq_0_bits_pc : data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_451 = 4'h3 == writeIdx ? io_enq_0_bits_pc : data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_452 = 4'h4 == writeIdx ? io_enq_0_bits_pc : data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_453 = 4'h5 == writeIdx ? io_enq_0_bits_pc : data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_454 = 4'h6 == writeIdx ? io_enq_0_bits_pc : data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_455 = 4'h7 == writeIdx ? io_enq_0_bits_pc : data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_456 = 4'h8 == writeIdx ? io_enq_0_bits_pc : data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_457 = 4'h9 == writeIdx ? io_enq_0_bits_pc : data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_458 = 4'ha == writeIdx ? io_enq_0_bits_pc : data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_459 = 4'hb == writeIdx ? io_enq_0_bits_pc : data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_460 = 4'hc == writeIdx ? io_enq_0_bits_pc : data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_461 = 4'hd == writeIdx ? io_enq_0_bits_pc : data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_462 = 4'he == writeIdx ? io_enq_0_bits_pc : data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_463 = 4'hf == writeIdx ? io_enq_0_bits_pc : data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_464 = 4'h0 == writeIdx ? io_enq_0_bits_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_465 = 4'h1 == writeIdx ? io_enq_0_bits_instr : data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_466 = 4'h2 == writeIdx ? io_enq_0_bits_instr : data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_467 = 4'h3 == writeIdx ? io_enq_0_bits_instr : data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_468 = 4'h4 == writeIdx ? io_enq_0_bits_instr : data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_469 = 4'h5 == writeIdx ? io_enq_0_bits_instr : data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_470 = 4'h6 == writeIdx ? io_enq_0_bits_instr : data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_471 = 4'h7 == writeIdx ? io_enq_0_bits_instr : data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_472 = 4'h8 == writeIdx ? io_enq_0_bits_instr : data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_473 = 4'h9 == writeIdx ? io_enq_0_bits_instr : data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_474 = 4'ha == writeIdx ? io_enq_0_bits_instr : data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_475 = 4'hb == writeIdx ? io_enq_0_bits_instr : data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_476 = 4'hc == writeIdx ? io_enq_0_bits_instr : data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_477 = 4'hd == writeIdx ? io_enq_0_bits_instr : data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_478 = 4'he == writeIdx ? io_enq_0_bits_instr : data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire [31:0] _GEN_479 = 4'hf == writeIdx ? io_enq_0_bits_instr : data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 192:{22,22}]
  wire  _GEN_480 = _T_15 ? _GEN_0 : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_481 = _T_15 ? _GEN_1 : data_1_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_482 = _T_15 ? _GEN_2 : data_2_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_483 = _T_15 ? _GEN_3 : data_3_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_484 = _T_15 ? _GEN_4 : data_4_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_485 = _T_15 ? _GEN_5 : data_5_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_486 = _T_15 ? _GEN_6 : data_6_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_487 = _T_15 ? _GEN_7 : data_7_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_488 = _T_15 ? _GEN_8 : data_8_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_489 = _T_15 ? _GEN_9 : data_9_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_490 = _T_15 ? _GEN_10 : data_10_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_491 = _T_15 ? _GEN_11 : data_11_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_492 = _T_15 ? _GEN_12 : data_12_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_493 = _T_15 ? _GEN_13 : data_13_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_494 = _T_15 ? _GEN_14 : data_14_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_495 = _T_15 ? _GEN_15 : data_15_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_496 = _T_15 ? _GEN_16 : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_497 = _T_15 ? _GEN_17 : data_1_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_498 = _T_15 ? _GEN_18 : data_2_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_499 = _T_15 ? _GEN_19 : data_3_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_500 = _T_15 ? _GEN_20 : data_4_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_501 = _T_15 ? _GEN_21 : data_5_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_502 = _T_15 ? _GEN_22 : data_6_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_503 = _T_15 ? _GEN_23 : data_7_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_504 = _T_15 ? _GEN_24 : data_8_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_505 = _T_15 ? _GEN_25 : data_9_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_506 = _T_15 ? _GEN_26 : data_10_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_507 = _T_15 ? _GEN_27 : data_11_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_508 = _T_15 ? _GEN_28 : data_12_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_509 = _T_15 ? _GEN_29 : data_13_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_510 = _T_15 ? _GEN_30 : data_14_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_511 = _T_15 ? _GEN_31 : data_15_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_512 = _T_15 ? _GEN_32 : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_513 = _T_15 ? _GEN_33 : data_1_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_514 = _T_15 ? _GEN_34 : data_2_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_515 = _T_15 ? _GEN_35 : data_3_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_516 = _T_15 ? _GEN_36 : data_4_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_517 = _T_15 ? _GEN_37 : data_5_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_518 = _T_15 ? _GEN_38 : data_6_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_519 = _T_15 ? _GEN_39 : data_7_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_520 = _T_15 ? _GEN_40 : data_8_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_521 = _T_15 ? _GEN_41 : data_9_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_522 = _T_15 ? _GEN_42 : data_10_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_523 = _T_15 ? _GEN_43 : data_11_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_524 = _T_15 ? _GEN_44 : data_12_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_525 = _T_15 ? _GEN_45 : data_13_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_526 = _T_15 ? _GEN_46 : data_14_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_527 = _T_15 ? _GEN_47 : data_15_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_528 = _T_15 ? _GEN_48 : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_529 = _T_15 ? _GEN_49 : data_1_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_530 = _T_15 ? _GEN_50 : data_2_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_531 = _T_15 ? _GEN_51 : data_3_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_532 = _T_15 ? _GEN_52 : data_4_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_533 = _T_15 ? _GEN_53 : data_5_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_534 = _T_15 ? _GEN_54 : data_6_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_535 = _T_15 ? _GEN_55 : data_7_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_536 = _T_15 ? _GEN_56 : data_8_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_537 = _T_15 ? _GEN_57 : data_9_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_538 = _T_15 ? _GEN_58 : data_10_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_539 = _T_15 ? _GEN_59 : data_11_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_540 = _T_15 ? _GEN_60 : data_12_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_541 = _T_15 ? _GEN_61 : data_13_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_542 = _T_15 ? _GEN_62 : data_14_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_543 = _T_15 ? _GEN_63 : data_15_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_544 = _T_15 ? _GEN_64 : data_0_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_545 = _T_15 ? _GEN_65 : data_1_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_546 = _T_15 ? _GEN_66 : data_2_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_547 = _T_15 ? _GEN_67 : data_3_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_548 = _T_15 ? _GEN_68 : data_4_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_549 = _T_15 ? _GEN_69 : data_5_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_550 = _T_15 ? _GEN_70 : data_6_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_551 = _T_15 ? _GEN_71 : data_7_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_552 = _T_15 ? _GEN_72 : data_8_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_553 = _T_15 ? _GEN_73 : data_9_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_554 = _T_15 ? _GEN_74 : data_10_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_555 = _T_15 ? _GEN_75 : data_11_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_556 = _T_15 ? _GEN_76 : data_12_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_557 = _T_15 ? _GEN_77 : data_13_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_558 = _T_15 ? _GEN_78 : data_14_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_559 = _T_15 ? _GEN_79 : data_15_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_560 = _T_15 ? _GEN_80 : data_0_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_561 = _T_15 ? _GEN_81 : data_1_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_562 = _T_15 ? _GEN_82 : data_2_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_563 = _T_15 ? _GEN_83 : data_3_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_564 = _T_15 ? _GEN_84 : data_4_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_565 = _T_15 ? _GEN_85 : data_5_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_566 = _T_15 ? _GEN_86 : data_6_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_567 = _T_15 ? _GEN_87 : data_7_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_568 = _T_15 ? _GEN_88 : data_8_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_569 = _T_15 ? _GEN_89 : data_9_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_570 = _T_15 ? _GEN_90 : data_10_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_571 = _T_15 ? _GEN_91 : data_11_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_572 = _T_15 ? _GEN_92 : data_12_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_573 = _T_15 ? _GEN_93 : data_13_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_574 = _T_15 ? _GEN_94 : data_14_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_575 = _T_15 ? _GEN_95 : data_15_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_576 = _T_15 ? _GEN_96 : data_0_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_577 = _T_15 ? _GEN_97 : data_1_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_578 = _T_15 ? _GEN_98 : data_2_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_579 = _T_15 ? _GEN_99 : data_3_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_580 = _T_15 ? _GEN_100 : data_4_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_581 = _T_15 ? _GEN_101 : data_5_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_582 = _T_15 ? _GEN_102 : data_6_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_583 = _T_15 ? _GEN_103 : data_7_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_584 = _T_15 ? _GEN_104 : data_8_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_585 = _T_15 ? _GEN_105 : data_9_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_586 = _T_15 ? _GEN_106 : data_10_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_587 = _T_15 ? _GEN_107 : data_11_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_588 = _T_15 ? _GEN_108 : data_12_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_589 = _T_15 ? _GEN_109 : data_13_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_590 = _T_15 ? _GEN_110 : data_14_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_591 = _T_15 ? _GEN_111 : data_15_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_592 = _T_15 ? _GEN_112 : data_0_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_593 = _T_15 ? _GEN_113 : data_1_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_594 = _T_15 ? _GEN_114 : data_2_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_595 = _T_15 ? _GEN_115 : data_3_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_596 = _T_15 ? _GEN_116 : data_4_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_597 = _T_15 ? _GEN_117 : data_5_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_598 = _T_15 ? _GEN_118 : data_6_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_599 = _T_15 ? _GEN_119 : data_7_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_600 = _T_15 ? _GEN_120 : data_8_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_601 = _T_15 ? _GEN_121 : data_9_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_602 = _T_15 ? _GEN_122 : data_10_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_603 = _T_15 ? _GEN_123 : data_11_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_604 = _T_15 ? _GEN_124 : data_12_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_605 = _T_15 ? _GEN_125 : data_13_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_606 = _T_15 ? _GEN_126 : data_14_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_607 = _T_15 ? _GEN_127 : data_15_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_608 = _T_15 ? _GEN_128 : data_0_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_609 = _T_15 ? _GEN_129 : data_1_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_610 = _T_15 ? _GEN_130 : data_2_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_611 = _T_15 ? _GEN_131 : data_3_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_612 = _T_15 ? _GEN_132 : data_4_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_613 = _T_15 ? _GEN_133 : data_5_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_614 = _T_15 ? _GEN_134 : data_6_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_615 = _T_15 ? _GEN_135 : data_7_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_616 = _T_15 ? _GEN_136 : data_8_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_617 = _T_15 ? _GEN_137 : data_9_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_618 = _T_15 ? _GEN_138 : data_10_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_619 = _T_15 ? _GEN_139 : data_11_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_620 = _T_15 ? _GEN_140 : data_12_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_621 = _T_15 ? _GEN_141 : data_13_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_622 = _T_15 ? _GEN_142 : data_14_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_623 = _T_15 ? _GEN_143 : data_15_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_624 = _T_15 ? _GEN_144 : data_0_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_625 = _T_15 ? _GEN_145 : data_1_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_626 = _T_15 ? _GEN_146 : data_2_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_627 = _T_15 ? _GEN_147 : data_3_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_628 = _T_15 ? _GEN_148 : data_4_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_629 = _T_15 ? _GEN_149 : data_5_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_630 = _T_15 ? _GEN_150 : data_6_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_631 = _T_15 ? _GEN_151 : data_7_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_632 = _T_15 ? _GEN_152 : data_8_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_633 = _T_15 ? _GEN_153 : data_9_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_634 = _T_15 ? _GEN_154 : data_10_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_635 = _T_15 ? _GEN_155 : data_11_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_636 = _T_15 ? _GEN_156 : data_12_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_637 = _T_15 ? _GEN_157 : data_13_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_638 = _T_15 ? _GEN_158 : data_14_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_639 = _T_15 ? _GEN_159 : data_15_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_640 = _T_15 ? _GEN_160 : data_0_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_641 = _T_15 ? _GEN_161 : data_1_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_642 = _T_15 ? _GEN_162 : data_2_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_643 = _T_15 ? _GEN_163 : data_3_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_644 = _T_15 ? _GEN_164 : data_4_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_645 = _T_15 ? _GEN_165 : data_5_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_646 = _T_15 ? _GEN_166 : data_6_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_647 = _T_15 ? _GEN_167 : data_7_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_648 = _T_15 ? _GEN_168 : data_8_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_649 = _T_15 ? _GEN_169 : data_9_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_650 = _T_15 ? _GEN_170 : data_10_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_651 = _T_15 ? _GEN_171 : data_11_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_652 = _T_15 ? _GEN_172 : data_12_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_653 = _T_15 ? _GEN_173 : data_13_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_654 = _T_15 ? _GEN_174 : data_14_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_655 = _T_15 ? _GEN_175 : data_15_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_656 = _T_15 ? _GEN_176 : data_0_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_657 = _T_15 ? _GEN_177 : data_1_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_658 = _T_15 ? _GEN_178 : data_2_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_659 = _T_15 ? _GEN_179 : data_3_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_660 = _T_15 ? _GEN_180 : data_4_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_661 = _T_15 ? _GEN_181 : data_5_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_662 = _T_15 ? _GEN_182 : data_6_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_663 = _T_15 ? _GEN_183 : data_7_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_664 = _T_15 ? _GEN_184 : data_8_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_665 = _T_15 ? _GEN_185 : data_9_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_666 = _T_15 ? _GEN_186 : data_10_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_667 = _T_15 ? _GEN_187 : data_11_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_668 = _T_15 ? _GEN_188 : data_12_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_669 = _T_15 ? _GEN_189 : data_13_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_670 = _T_15 ? _GEN_190 : data_14_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_671 = _T_15 ? _GEN_191 : data_15_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_672 = _T_15 ? _GEN_192 : data_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_673 = _T_15 ? _GEN_193 : data_1_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_674 = _T_15 ? _GEN_194 : data_2_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_675 = _T_15 ? _GEN_195 : data_3_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_676 = _T_15 ? _GEN_196 : data_4_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_677 = _T_15 ? _GEN_197 : data_5_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_678 = _T_15 ? _GEN_198 : data_6_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_679 = _T_15 ? _GEN_199 : data_7_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_680 = _T_15 ? _GEN_200 : data_8_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_681 = _T_15 ? _GEN_201 : data_9_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_682 = _T_15 ? _GEN_202 : data_10_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_683 = _T_15 ? _GEN_203 : data_11_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_684 = _T_15 ? _GEN_204 : data_12_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_685 = _T_15 ? _GEN_205 : data_13_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_686 = _T_15 ? _GEN_206 : data_14_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_687 = _T_15 ? _GEN_207 : data_15_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_688 = _T_15 ? _GEN_208 : data_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_689 = _T_15 ? _GEN_209 : data_1_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_690 = _T_15 ? _GEN_210 : data_2_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_691 = _T_15 ? _GEN_211 : data_3_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_692 = _T_15 ? _GEN_212 : data_4_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_693 = _T_15 ? _GEN_213 : data_5_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_694 = _T_15 ? _GEN_214 : data_6_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_695 = _T_15 ? _GEN_215 : data_7_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_696 = _T_15 ? _GEN_216 : data_8_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_697 = _T_15 ? _GEN_217 : data_9_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_698 = _T_15 ? _GEN_218 : data_10_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_699 = _T_15 ? _GEN_219 : data_11_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_700 = _T_15 ? _GEN_220 : data_12_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_701 = _T_15 ? _GEN_221 : data_13_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_702 = _T_15 ? _GEN_222 : data_14_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_703 = _T_15 ? _GEN_223 : data_15_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_704 = _T_15 ? _GEN_224 : data_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_705 = _T_15 ? _GEN_225 : data_1_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_706 = _T_15 ? _GEN_226 : data_2_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_707 = _T_15 ? _GEN_227 : data_3_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_708 = _T_15 ? _GEN_228 : data_4_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_709 = _T_15 ? _GEN_229 : data_5_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_710 = _T_15 ? _GEN_230 : data_6_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_711 = _T_15 ? _GEN_231 : data_7_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_712 = _T_15 ? _GEN_232 : data_8_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_713 = _T_15 ? _GEN_233 : data_9_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_714 = _T_15 ? _GEN_234 : data_10_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_715 = _T_15 ? _GEN_235 : data_11_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_716 = _T_15 ? _GEN_236 : data_12_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_717 = _T_15 ? _GEN_237 : data_13_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_718 = _T_15 ? _GEN_238 : data_14_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_719 = _T_15 ? _GEN_239 : data_15_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_720 = _T_15 ? _GEN_240 : data_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_721 = _T_15 ? _GEN_241 : data_1_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_722 = _T_15 ? _GEN_242 : data_2_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_723 = _T_15 ? _GEN_243 : data_3_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_724 = _T_15 ? _GEN_244 : data_4_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_725 = _T_15 ? _GEN_245 : data_5_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_726 = _T_15 ? _GEN_246 : data_6_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_727 = _T_15 ? _GEN_247 : data_7_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_728 = _T_15 ? _GEN_248 : data_8_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_729 = _T_15 ? _GEN_249 : data_9_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_730 = _T_15 ? _GEN_250 : data_10_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_731 = _T_15 ? _GEN_251 : data_11_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_732 = _T_15 ? _GEN_252 : data_12_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_733 = _T_15 ? _GEN_253 : data_13_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_734 = _T_15 ? _GEN_254 : data_14_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_735 = _T_15 ? _GEN_255 : data_15_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_736 = _T_15 ? _GEN_256 : data_0_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_737 = _T_15 ? _GEN_257 : data_1_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_738 = _T_15 ? _GEN_258 : data_2_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_739 = _T_15 ? _GEN_259 : data_3_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_740 = _T_15 ? _GEN_260 : data_4_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_741 = _T_15 ? _GEN_261 : data_5_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_742 = _T_15 ? _GEN_262 : data_6_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_743 = _T_15 ? _GEN_263 : data_7_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_744 = _T_15 ? _GEN_264 : data_8_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_745 = _T_15 ? _GEN_265 : data_9_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_746 = _T_15 ? _GEN_266 : data_10_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_747 = _T_15 ? _GEN_267 : data_11_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_748 = _T_15 ? _GEN_268 : data_12_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_749 = _T_15 ? _GEN_269 : data_13_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_750 = _T_15 ? _GEN_270 : data_14_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_751 = _T_15 ? _GEN_271 : data_15_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_752 = _T_15 ? _GEN_272 : data_0_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_753 = _T_15 ? _GEN_273 : data_1_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_754 = _T_15 ? _GEN_274 : data_2_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_755 = _T_15 ? _GEN_275 : data_3_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_756 = _T_15 ? _GEN_276 : data_4_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_757 = _T_15 ? _GEN_277 : data_5_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_758 = _T_15 ? _GEN_278 : data_6_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_759 = _T_15 ? _GEN_279 : data_7_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_760 = _T_15 ? _GEN_280 : data_8_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_761 = _T_15 ? _GEN_281 : data_9_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_762 = _T_15 ? _GEN_282 : data_10_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_763 = _T_15 ? _GEN_283 : data_11_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_764 = _T_15 ? _GEN_284 : data_12_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_765 = _T_15 ? _GEN_285 : data_13_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_766 = _T_15 ? _GEN_286 : data_14_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [1:0] _GEN_767 = _T_15 ? _GEN_287 : data_15_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_768 = _T_15 ? _GEN_288 : data_0_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_769 = _T_15 ? _GEN_289 : data_1_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_770 = _T_15 ? _GEN_290 : data_2_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_771 = _T_15 ? _GEN_291 : data_3_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_772 = _T_15 ? _GEN_292 : data_4_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_773 = _T_15 ? _GEN_293 : data_5_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_774 = _T_15 ? _GEN_294 : data_6_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_775 = _T_15 ? _GEN_295 : data_7_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_776 = _T_15 ? _GEN_296 : data_8_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_777 = _T_15 ? _GEN_297 : data_9_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_778 = _T_15 ? _GEN_298 : data_10_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_779 = _T_15 ? _GEN_299 : data_11_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_780 = _T_15 ? _GEN_300 : data_12_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_781 = _T_15 ? _GEN_301 : data_13_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_782 = _T_15 ? _GEN_302 : data_14_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [2:0] _GEN_783 = _T_15 ? _GEN_303 : data_15_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_784 = _T_15 ? _GEN_304 : data_0_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_785 = _T_15 ? _GEN_305 : data_1_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_786 = _T_15 ? _GEN_306 : data_2_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_787 = _T_15 ? _GEN_307 : data_3_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_788 = _T_15 ? _GEN_308 : data_4_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_789 = _T_15 ? _GEN_309 : data_5_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_790 = _T_15 ? _GEN_310 : data_6_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_791 = _T_15 ? _GEN_311 : data_7_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_792 = _T_15 ? _GEN_312 : data_8_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_793 = _T_15 ? _GEN_313 : data_9_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_794 = _T_15 ? _GEN_314 : data_10_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_795 = _T_15 ? _GEN_315 : data_11_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_796 = _T_15 ? _GEN_316 : data_12_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_797 = _T_15 ? _GEN_317 : data_13_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_798 = _T_15 ? _GEN_318 : data_14_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_799 = _T_15 ? _GEN_319 : data_15_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_800 = _T_15 ? _GEN_320 : data_0_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_801 = _T_15 ? _GEN_321 : data_1_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_802 = _T_15 ? _GEN_322 : data_2_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_803 = _T_15 ? _GEN_323 : data_3_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_804 = _T_15 ? _GEN_324 : data_4_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_805 = _T_15 ? _GEN_325 : data_5_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_806 = _T_15 ? _GEN_326 : data_6_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_807 = _T_15 ? _GEN_327 : data_7_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_808 = _T_15 ? _GEN_328 : data_8_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_809 = _T_15 ? _GEN_329 : data_9_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_810 = _T_15 ? _GEN_330 : data_10_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_811 = _T_15 ? _GEN_331 : data_11_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_812 = _T_15 ? _GEN_332 : data_12_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_813 = _T_15 ? _GEN_333 : data_13_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_814 = _T_15 ? _GEN_334 : data_14_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_815 = _T_15 ? _GEN_335 : data_15_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_816 = _T_15 ? _GEN_336 : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_817 = _T_15 ? _GEN_337 : data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_818 = _T_15 ? _GEN_338 : data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_819 = _T_15 ? _GEN_339 : data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_820 = _T_15 ? _GEN_340 : data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_821 = _T_15 ? _GEN_341 : data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_822 = _T_15 ? _GEN_342 : data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_823 = _T_15 ? _GEN_343 : data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_824 = _T_15 ? _GEN_344 : data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_825 = _T_15 ? _GEN_345 : data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_826 = _T_15 ? _GEN_346 : data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_827 = _T_15 ? _GEN_347 : data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_828 = _T_15 ? _GEN_348 : data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_829 = _T_15 ? _GEN_349 : data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_830 = _T_15 ? _GEN_350 : data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_831 = _T_15 ? _GEN_351 : data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_832 = _T_15 ? _GEN_352 : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_833 = _T_15 ? _GEN_353 : data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_834 = _T_15 ? _GEN_354 : data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_835 = _T_15 ? _GEN_355 : data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_836 = _T_15 ? _GEN_356 : data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_837 = _T_15 ? _GEN_357 : data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_838 = _T_15 ? _GEN_358 : data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_839 = _T_15 ? _GEN_359 : data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_840 = _T_15 ? _GEN_360 : data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_841 = _T_15 ? _GEN_361 : data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_842 = _T_15 ? _GEN_362 : data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_843 = _T_15 ? _GEN_363 : data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_844 = _T_15 ? _GEN_364 : data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_845 = _T_15 ? _GEN_365 : data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_846 = _T_15 ? _GEN_366 : data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_847 = _T_15 ? _GEN_367 : data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_848 = _T_15 ? _GEN_368 : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_849 = _T_15 ? _GEN_369 : data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_850 = _T_15 ? _GEN_370 : data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_851 = _T_15 ? _GEN_371 : data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_852 = _T_15 ? _GEN_372 : data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_853 = _T_15 ? _GEN_373 : data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_854 = _T_15 ? _GEN_374 : data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_855 = _T_15 ? _GEN_375 : data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_856 = _T_15 ? _GEN_376 : data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_857 = _T_15 ? _GEN_377 : data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_858 = _T_15 ? _GEN_378 : data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_859 = _T_15 ? _GEN_379 : data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_860 = _T_15 ? _GEN_380 : data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_861 = _T_15 ? _GEN_381 : data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_862 = _T_15 ? _GEN_382 : data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_863 = _T_15 ? _GEN_383 : data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_864 = _T_15 ? _GEN_384 : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_865 = _T_15 ? _GEN_385 : data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_866 = _T_15 ? _GEN_386 : data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_867 = _T_15 ? _GEN_387 : data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_868 = _T_15 ? _GEN_388 : data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_869 = _T_15 ? _GEN_389 : data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_870 = _T_15 ? _GEN_390 : data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_871 = _T_15 ? _GEN_391 : data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_872 = _T_15 ? _GEN_392 : data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_873 = _T_15 ? _GEN_393 : data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_874 = _T_15 ? _GEN_394 : data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_875 = _T_15 ? _GEN_395 : data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_876 = _T_15 ? _GEN_396 : data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_877 = _T_15 ? _GEN_397 : data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_878 = _T_15 ? _GEN_398 : data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_879 = _T_15 ? _GEN_399 : data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_880 = _T_15 ? _GEN_400 : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_881 = _T_15 ? _GEN_401 : data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_882 = _T_15 ? _GEN_402 : data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_883 = _T_15 ? _GEN_403 : data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_884 = _T_15 ? _GEN_404 : data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_885 = _T_15 ? _GEN_405 : data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_886 = _T_15 ? _GEN_406 : data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_887 = _T_15 ? _GEN_407 : data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_888 = _T_15 ? _GEN_408 : data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_889 = _T_15 ? _GEN_409 : data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_890 = _T_15 ? _GEN_410 : data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_891 = _T_15 ? _GEN_411 : data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_892 = _T_15 ? _GEN_412 : data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_893 = _T_15 ? _GEN_413 : data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_894 = _T_15 ? _GEN_414 : data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_895 = _T_15 ? _GEN_415 : data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_896 = _T_15 ? _GEN_416 : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_897 = _T_15 ? _GEN_417 : data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_898 = _T_15 ? _GEN_418 : data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_899 = _T_15 ? _GEN_419 : data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_900 = _T_15 ? _GEN_420 : data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_901 = _T_15 ? _GEN_421 : data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_902 = _T_15 ? _GEN_422 : data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_903 = _T_15 ? _GEN_423 : data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_904 = _T_15 ? _GEN_424 : data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_905 = _T_15 ? _GEN_425 : data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_906 = _T_15 ? _GEN_426 : data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_907 = _T_15 ? _GEN_427 : data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_908 = _T_15 ? _GEN_428 : data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_909 = _T_15 ? _GEN_429 : data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_910 = _T_15 ? _GEN_430 : data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire  _GEN_911 = _T_15 ? _GEN_431 : data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_912 = _T_15 ? _GEN_432 : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_913 = _T_15 ? _GEN_433 : data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_914 = _T_15 ? _GEN_434 : data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_915 = _T_15 ? _GEN_435 : data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_916 = _T_15 ? _GEN_436 : data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_917 = _T_15 ? _GEN_437 : data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_918 = _T_15 ? _GEN_438 : data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_919 = _T_15 ? _GEN_439 : data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_920 = _T_15 ? _GEN_440 : data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_921 = _T_15 ? _GEN_441 : data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_922 = _T_15 ? _GEN_442 : data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_923 = _T_15 ? _GEN_443 : data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_924 = _T_15 ? _GEN_444 : data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_925 = _T_15 ? _GEN_445 : data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_926 = _T_15 ? _GEN_446 : data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_927 = _T_15 ? _GEN_447 : data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_928 = _T_15 ? _GEN_448 : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_929 = _T_15 ? _GEN_449 : data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_930 = _T_15 ? _GEN_450 : data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_931 = _T_15 ? _GEN_451 : data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_932 = _T_15 ? _GEN_452 : data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_933 = _T_15 ? _GEN_453 : data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_934 = _T_15 ? _GEN_454 : data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_935 = _T_15 ? _GEN_455 : data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_936 = _T_15 ? _GEN_456 : data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_937 = _T_15 ? _GEN_457 : data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_938 = _T_15 ? _GEN_458 : data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_939 = _T_15 ? _GEN_459 : data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_940 = _T_15 ? _GEN_460 : data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_941 = _T_15 ? _GEN_461 : data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_942 = _T_15 ? _GEN_462 : data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_943 = _T_15 ? _GEN_463 : data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_944 = _T_15 ? _GEN_464 : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_945 = _T_15 ? _GEN_465 : data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_946 = _T_15 ? _GEN_466 : data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_947 = _T_15 ? _GEN_467 : data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_948 = _T_15 ? _GEN_468 : data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_949 = _T_15 ? _GEN_469 : data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_950 = _T_15 ? _GEN_470 : data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_951 = _T_15 ? _GEN_471 : data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_952 = _T_15 ? _GEN_472 : data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_953 = _T_15 ? _GEN_473 : data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_954 = _T_15 ? _GEN_474 : data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_955 = _T_15 ? _GEN_475 : data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_956 = _T_15 ? _GEN_476 : data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_957 = _T_15 ? _GEN_477 : data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_958 = _T_15 ? _GEN_478 : data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [31:0] _GEN_959 = _T_15 ? _GEN_479 : data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:21 187:27]
  wire [5:0] _canEnq_T_1 = count + 5'h1; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq_1 = _canEnq_T_1 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_16 = io_enq_1_ready & io_enq_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_1 = enqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire  _GEN_960 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_480; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_961 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_481; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_962 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_482; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_963 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_483; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_964 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_484; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_965 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_485; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_966 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_486; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_967 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_487; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_968 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_488; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_969 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_489; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_970 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_490; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_971 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_491; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_972 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_492; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_973 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_493; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_974 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_494; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_975 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_495; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_976 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_496; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_977 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_497; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_978 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_498; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_979 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_499; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_980 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_500; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_981 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_501; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_982 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_502; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_983 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_503; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_984 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_504; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_985 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_505; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_986 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_506; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_987 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_507; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_988 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_508; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_989 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_509; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_990 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_510; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_991 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_511; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_992 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_512; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_993 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_513; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_994 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_514; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_995 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_515; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_996 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_516; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_997 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_517; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_998 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_518; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_999 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_519; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1000 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_520; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1001 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_521; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1002 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_522; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1003 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_523; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1004 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_524; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1005 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_525; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1006 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_526; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1007 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_527; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1008 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_528; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1009 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_529; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1010 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_530; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1011 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_531; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1012 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_532; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1013 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_533; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1014 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_534; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1015 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_535; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1016 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_536; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1017 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_537; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1018 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_538; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1019 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_539; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1020 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_540; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1021 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_541; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1022 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_542; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1023 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_543; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1024 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_544; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1025 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_545; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1026 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_546; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1027 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_547; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1028 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_548; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1029 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_549; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1030 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_550; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1031 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_551; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1032 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_552; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1033 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_553; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1034 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_554; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1035 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_555; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1036 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_556; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1037 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_557; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1038 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_558; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1039 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpAle : _GEN_559; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1040 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_560; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1041 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_561; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1042 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_562; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1043 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_563; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1044 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_564; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1045 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_565; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1046 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_566; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1047 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_567; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1048 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_568; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1049 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_569; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1050 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_570; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1051 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_571; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1052 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_572; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1053 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_573; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1054 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_574; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1055 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_pc : _GEN_575; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1056 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_576; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1057 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_577; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1058 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_578; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1059 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_579; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1060 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_580; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1061 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_581; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1062 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_582; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1063 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_583; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1064 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_584; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1065 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_585; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1066 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_586; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1067 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_587; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1068 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_588; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1069 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_589; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1070 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_590; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1071 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_fallThrough : _GEN_591; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1072 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_592; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1073 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_593; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1074 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_594; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1075 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_595; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1076 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_596; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1077 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_597; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1078 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_598; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1079 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_599; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1080 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_600; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1081 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_601; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1082 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_602; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1083 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_603; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1084 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_604; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1085 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_605; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1086 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_606; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1087 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_taken : _GEN_607; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1088 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_608; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1089 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_609; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1090 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_610; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1091 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_611; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1092 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_612; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1093 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_613; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1094 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_614; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1095 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_615; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1096 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_616; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1097 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_617; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1098 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_618; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1099 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_619; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1100 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_620; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1101 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_621; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1102 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_622; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1103 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_target : _GEN_623; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1104 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_624; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1105 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_625; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1106 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_626; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1107 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_627; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1108 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_628; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1109 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_629; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1110 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_630; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1111 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_631; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1112 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_632; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1113 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_633; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1114 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_634; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1115 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_635; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1116 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_636; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1117 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_637; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1118 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_638; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1119 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_takenOffset : _GEN_639; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1120 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_640; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1121 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_641; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1122 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_642; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1123 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_643; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1124 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_644; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1125 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_645; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1126 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_646; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1127 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_647; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1128 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_648; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1129 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_649; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1130 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_650; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1131 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_651; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1132 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_652; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1133 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_653; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1134 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_654; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1135 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_valid : _GEN_655; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1136 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_656; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1137 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_657; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1138 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_658; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1139 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_659; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1140 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_660; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1141 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_661; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1142 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_662; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1143 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_663; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1144 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_664; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1145 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_665; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1146 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_666; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1147 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_667; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1148 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_668; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1149 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_669; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1150 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_670; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1151 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbHit : _GEN_671; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1152 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_672; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1153 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_673; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1154 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_674; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1155 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_675; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1156 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_676; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1157 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_677; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1158 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_678; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1159 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_679; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1160 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_680; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1161 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_681; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1162 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_682; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1163 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_683; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1164 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_684; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1165 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_685; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1166 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_686; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1167 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJalr : _GEN_687; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1168 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_688; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1169 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_689; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1170 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_690; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1171 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_691; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1172 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_692; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1173 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_693; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1174 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_694; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1175 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_695; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1176 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_696; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1177 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_697; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1178 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_698; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1179 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_699; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1180 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_700; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1181 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_701; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1182 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_702; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1183 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsJal : _GEN_703; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1184 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_704; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1185 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_705; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1186 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_706; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1187 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_707; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1188 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_708; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1189 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_709; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1190 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_710; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1191 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_711; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1192 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_712; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1193 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_713; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1194 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_714; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1195 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_715; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1196 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_716; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1197 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_717; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1198 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_718; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1199 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsCall : _GEN_719; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1200 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_720; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1201 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_721; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1202 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_722; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1203 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_723; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1204 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_724; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1205 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_725; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1206 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_726; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1207 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_727; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1208 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_728; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1209 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_729; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1210 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_730; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1211 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_731; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1212 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_732; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1213 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_733; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1214 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_734; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1215 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbIsRet : _GEN_735; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1216 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_736; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1217 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_737; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1218 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_738; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1219 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_739; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1220 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_740; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1221 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_741; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1222 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_742; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1223 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_743; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1224 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_744; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1225 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_745; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1226 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_746; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1227 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_747; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1228 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_748; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1229 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_749; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1230 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_750; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1231 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_btbOffset : _GEN_751; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1232 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_752; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1233 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_753; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1234 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_754; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1235 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_755; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1236 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_756; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1237 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_757; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1238 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_758; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1239 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_759; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1240 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_760; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1241 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_761; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1242 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_762; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1243 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_763; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1244 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_764; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1245 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_765; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1246 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_766; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_1247 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_phtCounter : _GEN_767; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1248 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_768; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1249 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_769; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1250 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_770; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1251 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_771; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1252 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_772; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1253 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_773; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1254 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_774; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1255 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_775; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1256 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_776; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1257 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_777; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1258 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_778; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1259 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_779; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1260 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_780; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1261 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_781; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1262 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_782; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_1263 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_rasTop : _GEN_783; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1264 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_784; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1265 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_785; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1266 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_786; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1267 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_787; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1268 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_788; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1269 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_789; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1270 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_790; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1271 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_791; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1272 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_792; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1273 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_793; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1274 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_794; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1275 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_795; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1276 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_796; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1277 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_797; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1278 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_798; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1279 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTaken : _GEN_799; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1280 = 4'h0 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_800; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1281 = 4'h1 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_801; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1282 = 4'h2 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_802; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1283 = 4'h3 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_803; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1284 = 4'h4 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_804; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1285 = 4'h5 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_805; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1286 = 4'h6 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_806; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1287 = 4'h7 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_807; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1288 = 4'h8 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_808; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1289 = 4'h9 == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_809; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1290 = 4'ha == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_810; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1291 = 4'hb == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_811; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1292 = 4'hc == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_812; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1293 = 4'hd == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_813; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1294 = 4'he == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_814; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1295 = 4'hf == writeIdx_1 ? io_enq_1_bits_bpuInfo_meta_predTarget : _GEN_815; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1296 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_816; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1297 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_817; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1298 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_818; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1299 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_819; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1300 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_820; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1301 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_821; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1302 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_822; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1303 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_823; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1304 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_824; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1305 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_825; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1306 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_826; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1307 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_827; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1308 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_828; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1309 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_829; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1310 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_830; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1311 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_831; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1312 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_832; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1313 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_833; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1314 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_834; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1315 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_835; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1316 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_836; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1317 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_837; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1318 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_838; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1319 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_839; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1320 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_840; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1321 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_841; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1322 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_842; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1323 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_843; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1324 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_844; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1325 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_845; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1326 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_846; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1327 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_847; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1328 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_848; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1329 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_849; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1330 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_850; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1331 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_851; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1332 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_852; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1333 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_853; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1334 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_854; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1335 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_855; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1336 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_856; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1337 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_857; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1338 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_858; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1339 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_859; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1340 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_860; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1341 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_861; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1342 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_862; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1343 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_863; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1344 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_864; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1345 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_865; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1346 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_866; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1347 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_867; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1348 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_868; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1349 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_869; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1350 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_870; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1351 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_871; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1352 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_872; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1353 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_873; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1354 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_874; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1355 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_875; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1356 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_876; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1357 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_877; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1358 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_878; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1359 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_879; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1360 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_880; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1361 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_881; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1362 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_882; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1363 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_883; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1364 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_884; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1365 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_885; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1366 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_886; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1367 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_887; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1368 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_888; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1369 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_889; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1370 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_890; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1371 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_891; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1372 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_892; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1373 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_893; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1374 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_894; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1375 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_895; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1376 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_896; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1377 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_897; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1378 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_898; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1379 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_899; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1380 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_900; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1381 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_901; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1382 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_902; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1383 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_903; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1384 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_904; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1385 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_905; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1386 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_906; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1387 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_907; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1388 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_908; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1389 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_909; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1390 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_910; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1391 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_911; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1392 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_912; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1393 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_913; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1394 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_914; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1395 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_915; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1396 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_916; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1397 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_917; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1398 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_918; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1399 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_919; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1400 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_920; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1401 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_921; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1402 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_922; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1403 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_923; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1404 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_924; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1405 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_925; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1406 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_926; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1407 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_927; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1408 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_928; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1409 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_929; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1410 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_930; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1411 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_931; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1412 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_932; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1413 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_933; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1414 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_934; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1415 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_935; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1416 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_936; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1417 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_937; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1418 = 4'ha == writeIdx_1 ? io_enq_1_bits_pc : _GEN_938; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1419 = 4'hb == writeIdx_1 ? io_enq_1_bits_pc : _GEN_939; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1420 = 4'hc == writeIdx_1 ? io_enq_1_bits_pc : _GEN_940; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1421 = 4'hd == writeIdx_1 ? io_enq_1_bits_pc : _GEN_941; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1422 = 4'he == writeIdx_1 ? io_enq_1_bits_pc : _GEN_942; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1423 = 4'hf == writeIdx_1 ? io_enq_1_bits_pc : _GEN_943; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1424 = 4'h0 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_944; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1425 = 4'h1 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_945; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1426 = 4'h2 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_946; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1427 = 4'h3 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_947; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1428 = 4'h4 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_948; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1429 = 4'h5 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_949; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1430 = 4'h6 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_950; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1431 = 4'h7 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_951; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1432 = 4'h8 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_952; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1433 = 4'h9 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_953; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1434 = 4'ha == writeIdx_1 ? io_enq_1_bits_instr : _GEN_954; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1435 = 4'hb == writeIdx_1 ? io_enq_1_bits_instr : _GEN_955; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1436 = 4'hc == writeIdx_1 ? io_enq_1_bits_instr : _GEN_956; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1437 = 4'hd == writeIdx_1 ? io_enq_1_bits_instr : _GEN_957; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1438 = 4'he == writeIdx_1 ? io_enq_1_bits_instr : _GEN_958; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1439 = 4'hf == writeIdx_1 ? io_enq_1_bits_instr : _GEN_959; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1440 = _T_16 ? _GEN_960 : _GEN_480; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1441 = _T_16 ? _GEN_961 : _GEN_481; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1442 = _T_16 ? _GEN_962 : _GEN_482; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1443 = _T_16 ? _GEN_963 : _GEN_483; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1444 = _T_16 ? _GEN_964 : _GEN_484; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1445 = _T_16 ? _GEN_965 : _GEN_485; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1446 = _T_16 ? _GEN_966 : _GEN_486; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1447 = _T_16 ? _GEN_967 : _GEN_487; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1448 = _T_16 ? _GEN_968 : _GEN_488; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1449 = _T_16 ? _GEN_969 : _GEN_489; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1450 = _T_16 ? _GEN_970 : _GEN_490; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1451 = _T_16 ? _GEN_971 : _GEN_491; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1452 = _T_16 ? _GEN_972 : _GEN_492; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1453 = _T_16 ? _GEN_973 : _GEN_493; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1454 = _T_16 ? _GEN_974 : _GEN_494; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1455 = _T_16 ? _GEN_975 : _GEN_495; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1456 = _T_16 ? _GEN_976 : _GEN_496; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1457 = _T_16 ? _GEN_977 : _GEN_497; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1458 = _T_16 ? _GEN_978 : _GEN_498; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1459 = _T_16 ? _GEN_979 : _GEN_499; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1460 = _T_16 ? _GEN_980 : _GEN_500; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1461 = _T_16 ? _GEN_981 : _GEN_501; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1462 = _T_16 ? _GEN_982 : _GEN_502; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1463 = _T_16 ? _GEN_983 : _GEN_503; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1464 = _T_16 ? _GEN_984 : _GEN_504; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1465 = _T_16 ? _GEN_985 : _GEN_505; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1466 = _T_16 ? _GEN_986 : _GEN_506; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1467 = _T_16 ? _GEN_987 : _GEN_507; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1468 = _T_16 ? _GEN_988 : _GEN_508; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1469 = _T_16 ? _GEN_989 : _GEN_509; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1470 = _T_16 ? _GEN_990 : _GEN_510; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1471 = _T_16 ? _GEN_991 : _GEN_511; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1472 = _T_16 ? _GEN_992 : _GEN_512; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1473 = _T_16 ? _GEN_993 : _GEN_513; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1474 = _T_16 ? _GEN_994 : _GEN_514; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1475 = _T_16 ? _GEN_995 : _GEN_515; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1476 = _T_16 ? _GEN_996 : _GEN_516; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1477 = _T_16 ? _GEN_997 : _GEN_517; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1478 = _T_16 ? _GEN_998 : _GEN_518; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1479 = _T_16 ? _GEN_999 : _GEN_519; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1480 = _T_16 ? _GEN_1000 : _GEN_520; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1481 = _T_16 ? _GEN_1001 : _GEN_521; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1482 = _T_16 ? _GEN_1002 : _GEN_522; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1483 = _T_16 ? _GEN_1003 : _GEN_523; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1484 = _T_16 ? _GEN_1004 : _GEN_524; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1485 = _T_16 ? _GEN_1005 : _GEN_525; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1486 = _T_16 ? _GEN_1006 : _GEN_526; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1487 = _T_16 ? _GEN_1007 : _GEN_527; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1488 = _T_16 ? _GEN_1008 : _GEN_528; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1489 = _T_16 ? _GEN_1009 : _GEN_529; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1490 = _T_16 ? _GEN_1010 : _GEN_530; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1491 = _T_16 ? _GEN_1011 : _GEN_531; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1492 = _T_16 ? _GEN_1012 : _GEN_532; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1493 = _T_16 ? _GEN_1013 : _GEN_533; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1494 = _T_16 ? _GEN_1014 : _GEN_534; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1495 = _T_16 ? _GEN_1015 : _GEN_535; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1496 = _T_16 ? _GEN_1016 : _GEN_536; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1497 = _T_16 ? _GEN_1017 : _GEN_537; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1498 = _T_16 ? _GEN_1018 : _GEN_538; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1499 = _T_16 ? _GEN_1019 : _GEN_539; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1500 = _T_16 ? _GEN_1020 : _GEN_540; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1501 = _T_16 ? _GEN_1021 : _GEN_541; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1502 = _T_16 ? _GEN_1022 : _GEN_542; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1503 = _T_16 ? _GEN_1023 : _GEN_543; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1504 = _T_16 ? _GEN_1024 : _GEN_544; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1505 = _T_16 ? _GEN_1025 : _GEN_545; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1506 = _T_16 ? _GEN_1026 : _GEN_546; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1507 = _T_16 ? _GEN_1027 : _GEN_547; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1508 = _T_16 ? _GEN_1028 : _GEN_548; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1509 = _T_16 ? _GEN_1029 : _GEN_549; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1510 = _T_16 ? _GEN_1030 : _GEN_550; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1511 = _T_16 ? _GEN_1031 : _GEN_551; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1512 = _T_16 ? _GEN_1032 : _GEN_552; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1513 = _T_16 ? _GEN_1033 : _GEN_553; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1514 = _T_16 ? _GEN_1034 : _GEN_554; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1515 = _T_16 ? _GEN_1035 : _GEN_555; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1516 = _T_16 ? _GEN_1036 : _GEN_556; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1517 = _T_16 ? _GEN_1037 : _GEN_557; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1518 = _T_16 ? _GEN_1038 : _GEN_558; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1519 = _T_16 ? _GEN_1039 : _GEN_559; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1520 = _T_16 ? _GEN_1040 : _GEN_560; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1521 = _T_16 ? _GEN_1041 : _GEN_561; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1522 = _T_16 ? _GEN_1042 : _GEN_562; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1523 = _T_16 ? _GEN_1043 : _GEN_563; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1524 = _T_16 ? _GEN_1044 : _GEN_564; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1525 = _T_16 ? _GEN_1045 : _GEN_565; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1526 = _T_16 ? _GEN_1046 : _GEN_566; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1527 = _T_16 ? _GEN_1047 : _GEN_567; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1528 = _T_16 ? _GEN_1048 : _GEN_568; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1529 = _T_16 ? _GEN_1049 : _GEN_569; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1530 = _T_16 ? _GEN_1050 : _GEN_570; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1531 = _T_16 ? _GEN_1051 : _GEN_571; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1532 = _T_16 ? _GEN_1052 : _GEN_572; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1533 = _T_16 ? _GEN_1053 : _GEN_573; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1534 = _T_16 ? _GEN_1054 : _GEN_574; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1535 = _T_16 ? _GEN_1055 : _GEN_575; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1536 = _T_16 ? _GEN_1056 : _GEN_576; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1537 = _T_16 ? _GEN_1057 : _GEN_577; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1538 = _T_16 ? _GEN_1058 : _GEN_578; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1539 = _T_16 ? _GEN_1059 : _GEN_579; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1540 = _T_16 ? _GEN_1060 : _GEN_580; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1541 = _T_16 ? _GEN_1061 : _GEN_581; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1542 = _T_16 ? _GEN_1062 : _GEN_582; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1543 = _T_16 ? _GEN_1063 : _GEN_583; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1544 = _T_16 ? _GEN_1064 : _GEN_584; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1545 = _T_16 ? _GEN_1065 : _GEN_585; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1546 = _T_16 ? _GEN_1066 : _GEN_586; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1547 = _T_16 ? _GEN_1067 : _GEN_587; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1548 = _T_16 ? _GEN_1068 : _GEN_588; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1549 = _T_16 ? _GEN_1069 : _GEN_589; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1550 = _T_16 ? _GEN_1070 : _GEN_590; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1551 = _T_16 ? _GEN_1071 : _GEN_591; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1552 = _T_16 ? _GEN_1072 : _GEN_592; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1553 = _T_16 ? _GEN_1073 : _GEN_593; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1554 = _T_16 ? _GEN_1074 : _GEN_594; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1555 = _T_16 ? _GEN_1075 : _GEN_595; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1556 = _T_16 ? _GEN_1076 : _GEN_596; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1557 = _T_16 ? _GEN_1077 : _GEN_597; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1558 = _T_16 ? _GEN_1078 : _GEN_598; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1559 = _T_16 ? _GEN_1079 : _GEN_599; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1560 = _T_16 ? _GEN_1080 : _GEN_600; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1561 = _T_16 ? _GEN_1081 : _GEN_601; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1562 = _T_16 ? _GEN_1082 : _GEN_602; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1563 = _T_16 ? _GEN_1083 : _GEN_603; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1564 = _T_16 ? _GEN_1084 : _GEN_604; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1565 = _T_16 ? _GEN_1085 : _GEN_605; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1566 = _T_16 ? _GEN_1086 : _GEN_606; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1567 = _T_16 ? _GEN_1087 : _GEN_607; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1568 = _T_16 ? _GEN_1088 : _GEN_608; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1569 = _T_16 ? _GEN_1089 : _GEN_609; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1570 = _T_16 ? _GEN_1090 : _GEN_610; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1571 = _T_16 ? _GEN_1091 : _GEN_611; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1572 = _T_16 ? _GEN_1092 : _GEN_612; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1573 = _T_16 ? _GEN_1093 : _GEN_613; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1574 = _T_16 ? _GEN_1094 : _GEN_614; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1575 = _T_16 ? _GEN_1095 : _GEN_615; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1576 = _T_16 ? _GEN_1096 : _GEN_616; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1577 = _T_16 ? _GEN_1097 : _GEN_617; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1578 = _T_16 ? _GEN_1098 : _GEN_618; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1579 = _T_16 ? _GEN_1099 : _GEN_619; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1580 = _T_16 ? _GEN_1100 : _GEN_620; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1581 = _T_16 ? _GEN_1101 : _GEN_621; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1582 = _T_16 ? _GEN_1102 : _GEN_622; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1583 = _T_16 ? _GEN_1103 : _GEN_623; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1584 = _T_16 ? _GEN_1104 : _GEN_624; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1585 = _T_16 ? _GEN_1105 : _GEN_625; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1586 = _T_16 ? _GEN_1106 : _GEN_626; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1587 = _T_16 ? _GEN_1107 : _GEN_627; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1588 = _T_16 ? _GEN_1108 : _GEN_628; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1589 = _T_16 ? _GEN_1109 : _GEN_629; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1590 = _T_16 ? _GEN_1110 : _GEN_630; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1591 = _T_16 ? _GEN_1111 : _GEN_631; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1592 = _T_16 ? _GEN_1112 : _GEN_632; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1593 = _T_16 ? _GEN_1113 : _GEN_633; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1594 = _T_16 ? _GEN_1114 : _GEN_634; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1595 = _T_16 ? _GEN_1115 : _GEN_635; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1596 = _T_16 ? _GEN_1116 : _GEN_636; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1597 = _T_16 ? _GEN_1117 : _GEN_637; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1598 = _T_16 ? _GEN_1118 : _GEN_638; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1599 = _T_16 ? _GEN_1119 : _GEN_639; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1600 = _T_16 ? _GEN_1120 : _GEN_640; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1601 = _T_16 ? _GEN_1121 : _GEN_641; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1602 = _T_16 ? _GEN_1122 : _GEN_642; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1603 = _T_16 ? _GEN_1123 : _GEN_643; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1604 = _T_16 ? _GEN_1124 : _GEN_644; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1605 = _T_16 ? _GEN_1125 : _GEN_645; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1606 = _T_16 ? _GEN_1126 : _GEN_646; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1607 = _T_16 ? _GEN_1127 : _GEN_647; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1608 = _T_16 ? _GEN_1128 : _GEN_648; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1609 = _T_16 ? _GEN_1129 : _GEN_649; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1610 = _T_16 ? _GEN_1130 : _GEN_650; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1611 = _T_16 ? _GEN_1131 : _GEN_651; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1612 = _T_16 ? _GEN_1132 : _GEN_652; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1613 = _T_16 ? _GEN_1133 : _GEN_653; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1614 = _T_16 ? _GEN_1134 : _GEN_654; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1615 = _T_16 ? _GEN_1135 : _GEN_655; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1616 = _T_16 ? _GEN_1136 : _GEN_656; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1617 = _T_16 ? _GEN_1137 : _GEN_657; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1618 = _T_16 ? _GEN_1138 : _GEN_658; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1619 = _T_16 ? _GEN_1139 : _GEN_659; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1620 = _T_16 ? _GEN_1140 : _GEN_660; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1621 = _T_16 ? _GEN_1141 : _GEN_661; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1622 = _T_16 ? _GEN_1142 : _GEN_662; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1623 = _T_16 ? _GEN_1143 : _GEN_663; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1624 = _T_16 ? _GEN_1144 : _GEN_664; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1625 = _T_16 ? _GEN_1145 : _GEN_665; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1626 = _T_16 ? _GEN_1146 : _GEN_666; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1627 = _T_16 ? _GEN_1147 : _GEN_667; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1628 = _T_16 ? _GEN_1148 : _GEN_668; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1629 = _T_16 ? _GEN_1149 : _GEN_669; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1630 = _T_16 ? _GEN_1150 : _GEN_670; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1631 = _T_16 ? _GEN_1151 : _GEN_671; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1632 = _T_16 ? _GEN_1152 : _GEN_672; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1633 = _T_16 ? _GEN_1153 : _GEN_673; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1634 = _T_16 ? _GEN_1154 : _GEN_674; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1635 = _T_16 ? _GEN_1155 : _GEN_675; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1636 = _T_16 ? _GEN_1156 : _GEN_676; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1637 = _T_16 ? _GEN_1157 : _GEN_677; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1638 = _T_16 ? _GEN_1158 : _GEN_678; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1639 = _T_16 ? _GEN_1159 : _GEN_679; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1640 = _T_16 ? _GEN_1160 : _GEN_680; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1641 = _T_16 ? _GEN_1161 : _GEN_681; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1642 = _T_16 ? _GEN_1162 : _GEN_682; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1643 = _T_16 ? _GEN_1163 : _GEN_683; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1644 = _T_16 ? _GEN_1164 : _GEN_684; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1645 = _T_16 ? _GEN_1165 : _GEN_685; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1646 = _T_16 ? _GEN_1166 : _GEN_686; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1647 = _T_16 ? _GEN_1167 : _GEN_687; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1648 = _T_16 ? _GEN_1168 : _GEN_688; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1649 = _T_16 ? _GEN_1169 : _GEN_689; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1650 = _T_16 ? _GEN_1170 : _GEN_690; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1651 = _T_16 ? _GEN_1171 : _GEN_691; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1652 = _T_16 ? _GEN_1172 : _GEN_692; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1653 = _T_16 ? _GEN_1173 : _GEN_693; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1654 = _T_16 ? _GEN_1174 : _GEN_694; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1655 = _T_16 ? _GEN_1175 : _GEN_695; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1656 = _T_16 ? _GEN_1176 : _GEN_696; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1657 = _T_16 ? _GEN_1177 : _GEN_697; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1658 = _T_16 ? _GEN_1178 : _GEN_698; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1659 = _T_16 ? _GEN_1179 : _GEN_699; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1660 = _T_16 ? _GEN_1180 : _GEN_700; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1661 = _T_16 ? _GEN_1181 : _GEN_701; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1662 = _T_16 ? _GEN_1182 : _GEN_702; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1663 = _T_16 ? _GEN_1183 : _GEN_703; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1664 = _T_16 ? _GEN_1184 : _GEN_704; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1665 = _T_16 ? _GEN_1185 : _GEN_705; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1666 = _T_16 ? _GEN_1186 : _GEN_706; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1667 = _T_16 ? _GEN_1187 : _GEN_707; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1668 = _T_16 ? _GEN_1188 : _GEN_708; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1669 = _T_16 ? _GEN_1189 : _GEN_709; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1670 = _T_16 ? _GEN_1190 : _GEN_710; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1671 = _T_16 ? _GEN_1191 : _GEN_711; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1672 = _T_16 ? _GEN_1192 : _GEN_712; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1673 = _T_16 ? _GEN_1193 : _GEN_713; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1674 = _T_16 ? _GEN_1194 : _GEN_714; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1675 = _T_16 ? _GEN_1195 : _GEN_715; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1676 = _T_16 ? _GEN_1196 : _GEN_716; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1677 = _T_16 ? _GEN_1197 : _GEN_717; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1678 = _T_16 ? _GEN_1198 : _GEN_718; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1679 = _T_16 ? _GEN_1199 : _GEN_719; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1680 = _T_16 ? _GEN_1200 : _GEN_720; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1681 = _T_16 ? _GEN_1201 : _GEN_721; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1682 = _T_16 ? _GEN_1202 : _GEN_722; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1683 = _T_16 ? _GEN_1203 : _GEN_723; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1684 = _T_16 ? _GEN_1204 : _GEN_724; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1685 = _T_16 ? _GEN_1205 : _GEN_725; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1686 = _T_16 ? _GEN_1206 : _GEN_726; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1687 = _T_16 ? _GEN_1207 : _GEN_727; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1688 = _T_16 ? _GEN_1208 : _GEN_728; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1689 = _T_16 ? _GEN_1209 : _GEN_729; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1690 = _T_16 ? _GEN_1210 : _GEN_730; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1691 = _T_16 ? _GEN_1211 : _GEN_731; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1692 = _T_16 ? _GEN_1212 : _GEN_732; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1693 = _T_16 ? _GEN_1213 : _GEN_733; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1694 = _T_16 ? _GEN_1214 : _GEN_734; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1695 = _T_16 ? _GEN_1215 : _GEN_735; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1696 = _T_16 ? _GEN_1216 : _GEN_736; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1697 = _T_16 ? _GEN_1217 : _GEN_737; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1698 = _T_16 ? _GEN_1218 : _GEN_738; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1699 = _T_16 ? _GEN_1219 : _GEN_739; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1700 = _T_16 ? _GEN_1220 : _GEN_740; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1701 = _T_16 ? _GEN_1221 : _GEN_741; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1702 = _T_16 ? _GEN_1222 : _GEN_742; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1703 = _T_16 ? _GEN_1223 : _GEN_743; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1704 = _T_16 ? _GEN_1224 : _GEN_744; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1705 = _T_16 ? _GEN_1225 : _GEN_745; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1706 = _T_16 ? _GEN_1226 : _GEN_746; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1707 = _T_16 ? _GEN_1227 : _GEN_747; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1708 = _T_16 ? _GEN_1228 : _GEN_748; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1709 = _T_16 ? _GEN_1229 : _GEN_749; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1710 = _T_16 ? _GEN_1230 : _GEN_750; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1711 = _T_16 ? _GEN_1231 : _GEN_751; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1712 = _T_16 ? _GEN_1232 : _GEN_752; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1713 = _T_16 ? _GEN_1233 : _GEN_753; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1714 = _T_16 ? _GEN_1234 : _GEN_754; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1715 = _T_16 ? _GEN_1235 : _GEN_755; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1716 = _T_16 ? _GEN_1236 : _GEN_756; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1717 = _T_16 ? _GEN_1237 : _GEN_757; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1718 = _T_16 ? _GEN_1238 : _GEN_758; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1719 = _T_16 ? _GEN_1239 : _GEN_759; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1720 = _T_16 ? _GEN_1240 : _GEN_760; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1721 = _T_16 ? _GEN_1241 : _GEN_761; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1722 = _T_16 ? _GEN_1242 : _GEN_762; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1723 = _T_16 ? _GEN_1243 : _GEN_763; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1724 = _T_16 ? _GEN_1244 : _GEN_764; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1725 = _T_16 ? _GEN_1245 : _GEN_765; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1726 = _T_16 ? _GEN_1246 : _GEN_766; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_1727 = _T_16 ? _GEN_1247 : _GEN_767; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1728 = _T_16 ? _GEN_1248 : _GEN_768; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1729 = _T_16 ? _GEN_1249 : _GEN_769; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1730 = _T_16 ? _GEN_1250 : _GEN_770; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1731 = _T_16 ? _GEN_1251 : _GEN_771; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1732 = _T_16 ? _GEN_1252 : _GEN_772; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1733 = _T_16 ? _GEN_1253 : _GEN_773; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1734 = _T_16 ? _GEN_1254 : _GEN_774; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1735 = _T_16 ? _GEN_1255 : _GEN_775; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1736 = _T_16 ? _GEN_1256 : _GEN_776; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1737 = _T_16 ? _GEN_1257 : _GEN_777; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1738 = _T_16 ? _GEN_1258 : _GEN_778; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1739 = _T_16 ? _GEN_1259 : _GEN_779; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1740 = _T_16 ? _GEN_1260 : _GEN_780; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1741 = _T_16 ? _GEN_1261 : _GEN_781; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1742 = _T_16 ? _GEN_1262 : _GEN_782; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_1743 = _T_16 ? _GEN_1263 : _GEN_783; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1744 = _T_16 ? _GEN_1264 : _GEN_784; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1745 = _T_16 ? _GEN_1265 : _GEN_785; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1746 = _T_16 ? _GEN_1266 : _GEN_786; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1747 = _T_16 ? _GEN_1267 : _GEN_787; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1748 = _T_16 ? _GEN_1268 : _GEN_788; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1749 = _T_16 ? _GEN_1269 : _GEN_789; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1750 = _T_16 ? _GEN_1270 : _GEN_790; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1751 = _T_16 ? _GEN_1271 : _GEN_791; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1752 = _T_16 ? _GEN_1272 : _GEN_792; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1753 = _T_16 ? _GEN_1273 : _GEN_793; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1754 = _T_16 ? _GEN_1274 : _GEN_794; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1755 = _T_16 ? _GEN_1275 : _GEN_795; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1756 = _T_16 ? _GEN_1276 : _GEN_796; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1757 = _T_16 ? _GEN_1277 : _GEN_797; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1758 = _T_16 ? _GEN_1278 : _GEN_798; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1759 = _T_16 ? _GEN_1279 : _GEN_799; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1760 = _T_16 ? _GEN_1280 : _GEN_800; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1761 = _T_16 ? _GEN_1281 : _GEN_801; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1762 = _T_16 ? _GEN_1282 : _GEN_802; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1763 = _T_16 ? _GEN_1283 : _GEN_803; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1764 = _T_16 ? _GEN_1284 : _GEN_804; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1765 = _T_16 ? _GEN_1285 : _GEN_805; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1766 = _T_16 ? _GEN_1286 : _GEN_806; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1767 = _T_16 ? _GEN_1287 : _GEN_807; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1768 = _T_16 ? _GEN_1288 : _GEN_808; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1769 = _T_16 ? _GEN_1289 : _GEN_809; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1770 = _T_16 ? _GEN_1290 : _GEN_810; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1771 = _T_16 ? _GEN_1291 : _GEN_811; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1772 = _T_16 ? _GEN_1292 : _GEN_812; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1773 = _T_16 ? _GEN_1293 : _GEN_813; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1774 = _T_16 ? _GEN_1294 : _GEN_814; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1775 = _T_16 ? _GEN_1295 : _GEN_815; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1776 = _T_16 ? _GEN_1296 : _GEN_816; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1777 = _T_16 ? _GEN_1297 : _GEN_817; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1778 = _T_16 ? _GEN_1298 : _GEN_818; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1779 = _T_16 ? _GEN_1299 : _GEN_819; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1780 = _T_16 ? _GEN_1300 : _GEN_820; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1781 = _T_16 ? _GEN_1301 : _GEN_821; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1782 = _T_16 ? _GEN_1302 : _GEN_822; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1783 = _T_16 ? _GEN_1303 : _GEN_823; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1784 = _T_16 ? _GEN_1304 : _GEN_824; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1785 = _T_16 ? _GEN_1305 : _GEN_825; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1786 = _T_16 ? _GEN_1306 : _GEN_826; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1787 = _T_16 ? _GEN_1307 : _GEN_827; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1788 = _T_16 ? _GEN_1308 : _GEN_828; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1789 = _T_16 ? _GEN_1309 : _GEN_829; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1790 = _T_16 ? _GEN_1310 : _GEN_830; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1791 = _T_16 ? _GEN_1311 : _GEN_831; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1792 = _T_16 ? _GEN_1312 : _GEN_832; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1793 = _T_16 ? _GEN_1313 : _GEN_833; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1794 = _T_16 ? _GEN_1314 : _GEN_834; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1795 = _T_16 ? _GEN_1315 : _GEN_835; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1796 = _T_16 ? _GEN_1316 : _GEN_836; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1797 = _T_16 ? _GEN_1317 : _GEN_837; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1798 = _T_16 ? _GEN_1318 : _GEN_838; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1799 = _T_16 ? _GEN_1319 : _GEN_839; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1800 = _T_16 ? _GEN_1320 : _GEN_840; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1801 = _T_16 ? _GEN_1321 : _GEN_841; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1802 = _T_16 ? _GEN_1322 : _GEN_842; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1803 = _T_16 ? _GEN_1323 : _GEN_843; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1804 = _T_16 ? _GEN_1324 : _GEN_844; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1805 = _T_16 ? _GEN_1325 : _GEN_845; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1806 = _T_16 ? _GEN_1326 : _GEN_846; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1807 = _T_16 ? _GEN_1327 : _GEN_847; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1808 = _T_16 ? _GEN_1328 : _GEN_848; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1809 = _T_16 ? _GEN_1329 : _GEN_849; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1810 = _T_16 ? _GEN_1330 : _GEN_850; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1811 = _T_16 ? _GEN_1331 : _GEN_851; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1812 = _T_16 ? _GEN_1332 : _GEN_852; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1813 = _T_16 ? _GEN_1333 : _GEN_853; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1814 = _T_16 ? _GEN_1334 : _GEN_854; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1815 = _T_16 ? _GEN_1335 : _GEN_855; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1816 = _T_16 ? _GEN_1336 : _GEN_856; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1817 = _T_16 ? _GEN_1337 : _GEN_857; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1818 = _T_16 ? _GEN_1338 : _GEN_858; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1819 = _T_16 ? _GEN_1339 : _GEN_859; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1820 = _T_16 ? _GEN_1340 : _GEN_860; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1821 = _T_16 ? _GEN_1341 : _GEN_861; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1822 = _T_16 ? _GEN_1342 : _GEN_862; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1823 = _T_16 ? _GEN_1343 : _GEN_863; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1824 = _T_16 ? _GEN_1344 : _GEN_864; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1825 = _T_16 ? _GEN_1345 : _GEN_865; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1826 = _T_16 ? _GEN_1346 : _GEN_866; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1827 = _T_16 ? _GEN_1347 : _GEN_867; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1828 = _T_16 ? _GEN_1348 : _GEN_868; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1829 = _T_16 ? _GEN_1349 : _GEN_869; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1830 = _T_16 ? _GEN_1350 : _GEN_870; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1831 = _T_16 ? _GEN_1351 : _GEN_871; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1832 = _T_16 ? _GEN_1352 : _GEN_872; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1833 = _T_16 ? _GEN_1353 : _GEN_873; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1834 = _T_16 ? _GEN_1354 : _GEN_874; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1835 = _T_16 ? _GEN_1355 : _GEN_875; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1836 = _T_16 ? _GEN_1356 : _GEN_876; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1837 = _T_16 ? _GEN_1357 : _GEN_877; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1838 = _T_16 ? _GEN_1358 : _GEN_878; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1839 = _T_16 ? _GEN_1359 : _GEN_879; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1840 = _T_16 ? _GEN_1360 : _GEN_880; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1841 = _T_16 ? _GEN_1361 : _GEN_881; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1842 = _T_16 ? _GEN_1362 : _GEN_882; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1843 = _T_16 ? _GEN_1363 : _GEN_883; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1844 = _T_16 ? _GEN_1364 : _GEN_884; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1845 = _T_16 ? _GEN_1365 : _GEN_885; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1846 = _T_16 ? _GEN_1366 : _GEN_886; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1847 = _T_16 ? _GEN_1367 : _GEN_887; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1848 = _T_16 ? _GEN_1368 : _GEN_888; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1849 = _T_16 ? _GEN_1369 : _GEN_889; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1850 = _T_16 ? _GEN_1370 : _GEN_890; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1851 = _T_16 ? _GEN_1371 : _GEN_891; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1852 = _T_16 ? _GEN_1372 : _GEN_892; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1853 = _T_16 ? _GEN_1373 : _GEN_893; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1854 = _T_16 ? _GEN_1374 : _GEN_894; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1855 = _T_16 ? _GEN_1375 : _GEN_895; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1856 = _T_16 ? _GEN_1376 : _GEN_896; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1857 = _T_16 ? _GEN_1377 : _GEN_897; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1858 = _T_16 ? _GEN_1378 : _GEN_898; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1859 = _T_16 ? _GEN_1379 : _GEN_899; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1860 = _T_16 ? _GEN_1380 : _GEN_900; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1861 = _T_16 ? _GEN_1381 : _GEN_901; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1862 = _T_16 ? _GEN_1382 : _GEN_902; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1863 = _T_16 ? _GEN_1383 : _GEN_903; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1864 = _T_16 ? _GEN_1384 : _GEN_904; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1865 = _T_16 ? _GEN_1385 : _GEN_905; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1866 = _T_16 ? _GEN_1386 : _GEN_906; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1867 = _T_16 ? _GEN_1387 : _GEN_907; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1868 = _T_16 ? _GEN_1388 : _GEN_908; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1869 = _T_16 ? _GEN_1389 : _GEN_909; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1870 = _T_16 ? _GEN_1390 : _GEN_910; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1871 = _T_16 ? _GEN_1391 : _GEN_911; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1872 = _T_16 ? _GEN_1392 : _GEN_912; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1873 = _T_16 ? _GEN_1393 : _GEN_913; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1874 = _T_16 ? _GEN_1394 : _GEN_914; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1875 = _T_16 ? _GEN_1395 : _GEN_915; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1876 = _T_16 ? _GEN_1396 : _GEN_916; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1877 = _T_16 ? _GEN_1397 : _GEN_917; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1878 = _T_16 ? _GEN_1398 : _GEN_918; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1879 = _T_16 ? _GEN_1399 : _GEN_919; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1880 = _T_16 ? _GEN_1400 : _GEN_920; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1881 = _T_16 ? _GEN_1401 : _GEN_921; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1882 = _T_16 ? _GEN_1402 : _GEN_922; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1883 = _T_16 ? _GEN_1403 : _GEN_923; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1884 = _T_16 ? _GEN_1404 : _GEN_924; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1885 = _T_16 ? _GEN_1405 : _GEN_925; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1886 = _T_16 ? _GEN_1406 : _GEN_926; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1887 = _T_16 ? _GEN_1407 : _GEN_927; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1888 = _T_16 ? _GEN_1408 : _GEN_928; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1889 = _T_16 ? _GEN_1409 : _GEN_929; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1890 = _T_16 ? _GEN_1410 : _GEN_930; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1891 = _T_16 ? _GEN_1411 : _GEN_931; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1892 = _T_16 ? _GEN_1412 : _GEN_932; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1893 = _T_16 ? _GEN_1413 : _GEN_933; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1894 = _T_16 ? _GEN_1414 : _GEN_934; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1895 = _T_16 ? _GEN_1415 : _GEN_935; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1896 = _T_16 ? _GEN_1416 : _GEN_936; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1897 = _T_16 ? _GEN_1417 : _GEN_937; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1898 = _T_16 ? _GEN_1418 : _GEN_938; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1899 = _T_16 ? _GEN_1419 : _GEN_939; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1900 = _T_16 ? _GEN_1420 : _GEN_940; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1901 = _T_16 ? _GEN_1421 : _GEN_941; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1902 = _T_16 ? _GEN_1422 : _GEN_942; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1903 = _T_16 ? _GEN_1423 : _GEN_943; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1904 = _T_16 ? _GEN_1424 : _GEN_944; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1905 = _T_16 ? _GEN_1425 : _GEN_945; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1906 = _T_16 ? _GEN_1426 : _GEN_946; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1907 = _T_16 ? _GEN_1427 : _GEN_947; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1908 = _T_16 ? _GEN_1428 : _GEN_948; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1909 = _T_16 ? _GEN_1429 : _GEN_949; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1910 = _T_16 ? _GEN_1430 : _GEN_950; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1911 = _T_16 ? _GEN_1431 : _GEN_951; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1912 = _T_16 ? _GEN_1432 : _GEN_952; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1913 = _T_16 ? _GEN_1433 : _GEN_953; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1914 = _T_16 ? _GEN_1434 : _GEN_954; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1915 = _T_16 ? _GEN_1435 : _GEN_955; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1916 = _T_16 ? _GEN_1436 : _GEN_956; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1917 = _T_16 ? _GEN_1437 : _GEN_957; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1918 = _T_16 ? _GEN_1438 : _GEN_958; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1919 = _T_16 ? _GEN_1439 : _GEN_959; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [5:0] _canEnq_T_2 = count + 5'h2; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq_2 = _canEnq_T_2 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_17 = io_enq_2_ready & io_enq_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_2 = enqPtr_value + 4'h2; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire  _GEN_1920 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1440; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1921 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1441; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1922 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1442; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1923 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1443; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1924 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1444; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1925 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1445; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1926 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1446; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1927 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1447; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1928 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1448; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1929 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1449; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1930 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1450; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1931 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1451; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1932 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1452; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1933 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1453; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1934 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1454; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1935 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_1455; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1936 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1456; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1937 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1457; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1938 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1458; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1939 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1459; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1940 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1460; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1941 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1461; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1942 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1462; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1943 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1463; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1944 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1464; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1945 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1465; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1946 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1466; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1947 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1467; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1948 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1468; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1949 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1469; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1950 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1470; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1951 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_1471; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1952 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1472; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1953 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1473; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1954 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1474; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1955 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1475; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1956 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1476; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1957 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1477; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1958 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1478; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1959 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1479; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1960 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1480; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1961 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1481; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1962 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1482; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1963 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1483; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1964 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1484; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1965 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1485; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1966 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1486; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1967 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_1487; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1968 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1488; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1969 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1489; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1970 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1490; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1971 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1491; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1972 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1492; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1973 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1493; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1974 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1494; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1975 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1495; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1976 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1496; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1977 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1497; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1978 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1498; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1979 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1499; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1980 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1500; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1981 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1501; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1982 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1502; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1983 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_1503; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1984 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1504; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1985 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1505; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1986 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1506; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1987 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1507; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1988 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1508; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1989 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1509; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1990 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1510; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1991 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1511; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1992 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1512; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1993 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1513; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1994 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1514; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1995 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1515; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1996 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1516; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1997 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1517; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1998 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1518; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1999 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpAle : _GEN_1519; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2000 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1520; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2001 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1521; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2002 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1522; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2003 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1523; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2004 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1524; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2005 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1525; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2006 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1526; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2007 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1527; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2008 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1528; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2009 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1529; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2010 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1530; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2011 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1531; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2012 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1532; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2013 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1533; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2014 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1534; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2015 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_pc : _GEN_1535; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2016 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1536; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2017 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1537; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2018 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1538; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2019 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1539; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2020 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1540; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2021 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1541; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2022 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1542; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2023 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1543; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2024 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1544; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2025 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1545; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2026 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1546; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2027 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1547; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2028 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1548; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2029 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1549; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2030 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1550; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2031 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_fallThrough : _GEN_1551; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2032 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1552; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2033 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1553; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2034 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1554; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2035 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1555; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2036 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1556; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2037 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1557; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2038 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1558; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2039 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1559; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2040 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1560; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2041 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1561; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2042 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1562; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2043 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1563; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2044 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1564; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2045 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1565; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2046 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1566; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2047 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_taken : _GEN_1567; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2048 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1568; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2049 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1569; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2050 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1570; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2051 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1571; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2052 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1572; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2053 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1573; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2054 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1574; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2055 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1575; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2056 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1576; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2057 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1577; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2058 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1578; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2059 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1579; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2060 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1580; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2061 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1581; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2062 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1582; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2063 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_target : _GEN_1583; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2064 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1584; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2065 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1585; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2066 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1586; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2067 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1587; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2068 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1588; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2069 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1589; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2070 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1590; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2071 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1591; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2072 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1592; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2073 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1593; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2074 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1594; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2075 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1595; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2076 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1596; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2077 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1597; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2078 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1598; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2079 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_takenOffset : _GEN_1599; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2080 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1600; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2081 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1601; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2082 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1602; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2083 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1603; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2084 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1604; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2085 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1605; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2086 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1606; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2087 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1607; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2088 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1608; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2089 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1609; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2090 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1610; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2091 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1611; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2092 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1612; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2093 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1613; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2094 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1614; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2095 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_valid : _GEN_1615; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2096 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1616; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2097 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1617; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2098 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1618; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2099 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1619; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2100 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1620; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2101 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1621; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2102 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1622; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2103 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1623; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2104 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1624; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2105 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1625; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2106 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1626; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2107 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1627; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2108 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1628; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2109 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1629; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2110 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1630; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2111 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbHit : _GEN_1631; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2112 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1632; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2113 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1633; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2114 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1634; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2115 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1635; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2116 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1636; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2117 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1637; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2118 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1638; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2119 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1639; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2120 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1640; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2121 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1641; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2122 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1642; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2123 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1643; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2124 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1644; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2125 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1645; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2126 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1646; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2127 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJalr : _GEN_1647; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2128 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1648; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2129 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1649; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2130 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1650; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2131 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1651; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2132 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1652; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2133 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1653; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2134 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1654; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2135 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1655; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2136 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1656; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2137 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1657; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2138 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1658; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2139 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1659; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2140 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1660; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2141 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1661; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2142 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1662; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2143 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsJal : _GEN_1663; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2144 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1664; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2145 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1665; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2146 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1666; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2147 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1667; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2148 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1668; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2149 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1669; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2150 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1670; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2151 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1671; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2152 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1672; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2153 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1673; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2154 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1674; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2155 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1675; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2156 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1676; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2157 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1677; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2158 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1678; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2159 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsCall : _GEN_1679; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2160 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1680; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2161 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1681; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2162 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1682; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2163 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1683; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2164 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1684; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2165 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1685; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2166 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1686; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2167 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1687; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2168 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1688; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2169 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1689; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2170 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1690; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2171 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1691; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2172 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1692; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2173 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1693; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2174 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1694; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2175 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbIsRet : _GEN_1695; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2176 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1696; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2177 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1697; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2178 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1698; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2179 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1699; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2180 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1700; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2181 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1701; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2182 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1702; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2183 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1703; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2184 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1704; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2185 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1705; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2186 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1706; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2187 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1707; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2188 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1708; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2189 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1709; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2190 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1710; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2191 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_btbOffset : _GEN_1711; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2192 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1712; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2193 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1713; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2194 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1714; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2195 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1715; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2196 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1716; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2197 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1717; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2198 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1718; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2199 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1719; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2200 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1720; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2201 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1721; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2202 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1722; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2203 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1723; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2204 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1724; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2205 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1725; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2206 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1726; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [1:0] _GEN_2207 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_phtCounter : _GEN_1727; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2208 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1728; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2209 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1729; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2210 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1730; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2211 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1731; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2212 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1732; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2213 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1733; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2214 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1734; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2215 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1735; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2216 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1736; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2217 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1737; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2218 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1738; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2219 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1739; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2220 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1740; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2221 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1741; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2222 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1742; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [2:0] _GEN_2223 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_rasTop : _GEN_1743; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2224 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1744; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2225 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1745; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2226 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1746; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2227 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1747; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2228 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1748; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2229 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1749; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2230 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1750; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2231 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1751; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2232 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1752; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2233 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1753; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2234 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1754; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2235 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1755; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2236 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1756; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2237 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1757; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2238 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1758; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2239 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTaken : _GEN_1759; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2240 = 4'h0 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1760; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2241 = 4'h1 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1761; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2242 = 4'h2 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1762; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2243 = 4'h3 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1763; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2244 = 4'h4 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1764; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2245 = 4'h5 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1765; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2246 = 4'h6 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1766; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2247 = 4'h7 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1767; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2248 = 4'h8 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1768; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2249 = 4'h9 == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1769; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2250 = 4'ha == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1770; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2251 = 4'hb == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1771; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2252 = 4'hc == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1772; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2253 = 4'hd == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1773; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2254 = 4'he == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1774; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2255 = 4'hf == writeIdx_2 ? io_enq_2_bits_bpuInfo_meta_predTarget : _GEN_1775; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2256 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1776; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2257 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1777; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2258 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1778; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2259 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1779; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2260 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1780; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2261 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1781; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2262 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1782; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2263 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1783; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2264 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1784; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2265 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1785; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2266 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1786; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2267 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1787; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2268 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1788; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2269 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1789; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2270 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1790; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2271 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_1791; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2272 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1792; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2273 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1793; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2274 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1794; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2275 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1795; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2276 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1796; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2277 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1797; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2278 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1798; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2279 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1799; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2280 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1800; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2281 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1801; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2282 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1802; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2283 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1803; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2284 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1804; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2285 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1805; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2286 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1806; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2287 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_1807; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2288 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1808; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2289 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1809; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2290 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1810; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2291 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1811; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2292 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1812; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2293 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1813; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2294 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1814; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2295 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1815; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2296 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1816; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2297 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1817; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2298 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1818; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2299 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1819; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2300 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1820; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2301 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1821; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2302 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1822; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2303 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_1823; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2304 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1824; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2305 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1825; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2306 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1826; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2307 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1827; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2308 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1828; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2309 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1829; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2310 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1830; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2311 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1831; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2312 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1832; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2313 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1833; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2314 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1834; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2315 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1835; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2316 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1836; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2317 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1837; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2318 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1838; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2319 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_1839; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2320 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1840; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2321 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1841; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2322 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1842; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2323 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1843; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2324 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1844; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2325 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1845; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2326 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1846; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2327 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1847; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2328 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1848; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2329 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1849; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2330 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1850; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2331 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1851; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2332 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1852; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2333 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1853; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2334 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1854; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2335 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_1855; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2336 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1856; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2337 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1857; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2338 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1858; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2339 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1859; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2340 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1860; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2341 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1861; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2342 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1862; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2343 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1863; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2344 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1864; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2345 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1865; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2346 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1866; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2347 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1867; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2348 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1868; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2349 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1869; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2350 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1870; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2351 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_1871; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2352 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1872; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2353 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1873; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2354 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1874; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2355 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1875; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2356 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1876; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2357 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1877; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2358 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1878; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2359 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1879; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2360 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1880; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2361 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1881; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2362 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1882; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2363 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1883; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2364 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1884; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2365 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1885; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2366 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1886; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2367 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_1887; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2368 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1888; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2369 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1889; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2370 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1890; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2371 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1891; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2372 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1892; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2373 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1893; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2374 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1894; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2375 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1895; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2376 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1896; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2377 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1897; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2378 = 4'ha == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1898; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2379 = 4'hb == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1899; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2380 = 4'hc == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1900; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2381 = 4'hd == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1901; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2382 = 4'he == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1902; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2383 = 4'hf == writeIdx_2 ? io_enq_2_bits_pc : _GEN_1903; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2384 = 4'h0 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1904; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2385 = 4'h1 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1905; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2386 = 4'h2 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1906; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2387 = 4'h3 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1907; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2388 = 4'h4 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1908; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2389 = 4'h5 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1909; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2390 = 4'h6 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1910; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2391 = 4'h7 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1911; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2392 = 4'h8 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1912; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2393 = 4'h9 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1913; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2394 = 4'ha == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1914; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2395 = 4'hb == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1915; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2396 = 4'hc == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1916; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2397 = 4'hd == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1917; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2398 = 4'he == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1918; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_2399 = 4'hf == writeIdx_2 ? io_enq_2_bits_instr : _GEN_1919; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_2400 = _T_17 ? _GEN_1920 : _GEN_1440; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2401 = _T_17 ? _GEN_1921 : _GEN_1441; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2402 = _T_17 ? _GEN_1922 : _GEN_1442; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2403 = _T_17 ? _GEN_1923 : _GEN_1443; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2404 = _T_17 ? _GEN_1924 : _GEN_1444; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2405 = _T_17 ? _GEN_1925 : _GEN_1445; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2406 = _T_17 ? _GEN_1926 : _GEN_1446; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2407 = _T_17 ? _GEN_1927 : _GEN_1447; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2408 = _T_17 ? _GEN_1928 : _GEN_1448; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2409 = _T_17 ? _GEN_1929 : _GEN_1449; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2410 = _T_17 ? _GEN_1930 : _GEN_1450; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2411 = _T_17 ? _GEN_1931 : _GEN_1451; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2412 = _T_17 ? _GEN_1932 : _GEN_1452; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2413 = _T_17 ? _GEN_1933 : _GEN_1453; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2414 = _T_17 ? _GEN_1934 : _GEN_1454; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2415 = _T_17 ? _GEN_1935 : _GEN_1455; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2416 = _T_17 ? _GEN_1936 : _GEN_1456; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2417 = _T_17 ? _GEN_1937 : _GEN_1457; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2418 = _T_17 ? _GEN_1938 : _GEN_1458; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2419 = _T_17 ? _GEN_1939 : _GEN_1459; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2420 = _T_17 ? _GEN_1940 : _GEN_1460; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2421 = _T_17 ? _GEN_1941 : _GEN_1461; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2422 = _T_17 ? _GEN_1942 : _GEN_1462; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2423 = _T_17 ? _GEN_1943 : _GEN_1463; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2424 = _T_17 ? _GEN_1944 : _GEN_1464; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2425 = _T_17 ? _GEN_1945 : _GEN_1465; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2426 = _T_17 ? _GEN_1946 : _GEN_1466; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2427 = _T_17 ? _GEN_1947 : _GEN_1467; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2428 = _T_17 ? _GEN_1948 : _GEN_1468; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2429 = _T_17 ? _GEN_1949 : _GEN_1469; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2430 = _T_17 ? _GEN_1950 : _GEN_1470; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2431 = _T_17 ? _GEN_1951 : _GEN_1471; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2432 = _T_17 ? _GEN_1952 : _GEN_1472; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2433 = _T_17 ? _GEN_1953 : _GEN_1473; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2434 = _T_17 ? _GEN_1954 : _GEN_1474; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2435 = _T_17 ? _GEN_1955 : _GEN_1475; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2436 = _T_17 ? _GEN_1956 : _GEN_1476; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2437 = _T_17 ? _GEN_1957 : _GEN_1477; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2438 = _T_17 ? _GEN_1958 : _GEN_1478; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2439 = _T_17 ? _GEN_1959 : _GEN_1479; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2440 = _T_17 ? _GEN_1960 : _GEN_1480; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2441 = _T_17 ? _GEN_1961 : _GEN_1481; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2442 = _T_17 ? _GEN_1962 : _GEN_1482; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2443 = _T_17 ? _GEN_1963 : _GEN_1483; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2444 = _T_17 ? _GEN_1964 : _GEN_1484; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2445 = _T_17 ? _GEN_1965 : _GEN_1485; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2446 = _T_17 ? _GEN_1966 : _GEN_1486; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2447 = _T_17 ? _GEN_1967 : _GEN_1487; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2448 = _T_17 ? _GEN_1968 : _GEN_1488; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2449 = _T_17 ? _GEN_1969 : _GEN_1489; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2450 = _T_17 ? _GEN_1970 : _GEN_1490; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2451 = _T_17 ? _GEN_1971 : _GEN_1491; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2452 = _T_17 ? _GEN_1972 : _GEN_1492; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2453 = _T_17 ? _GEN_1973 : _GEN_1493; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2454 = _T_17 ? _GEN_1974 : _GEN_1494; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2455 = _T_17 ? _GEN_1975 : _GEN_1495; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2456 = _T_17 ? _GEN_1976 : _GEN_1496; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2457 = _T_17 ? _GEN_1977 : _GEN_1497; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2458 = _T_17 ? _GEN_1978 : _GEN_1498; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2459 = _T_17 ? _GEN_1979 : _GEN_1499; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2460 = _T_17 ? _GEN_1980 : _GEN_1500; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2461 = _T_17 ? _GEN_1981 : _GEN_1501; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2462 = _T_17 ? _GEN_1982 : _GEN_1502; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2463 = _T_17 ? _GEN_1983 : _GEN_1503; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2464 = _T_17 ? _GEN_1984 : _GEN_1504; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2465 = _T_17 ? _GEN_1985 : _GEN_1505; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2466 = _T_17 ? _GEN_1986 : _GEN_1506; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2467 = _T_17 ? _GEN_1987 : _GEN_1507; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2468 = _T_17 ? _GEN_1988 : _GEN_1508; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2469 = _T_17 ? _GEN_1989 : _GEN_1509; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2470 = _T_17 ? _GEN_1990 : _GEN_1510; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2471 = _T_17 ? _GEN_1991 : _GEN_1511; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2472 = _T_17 ? _GEN_1992 : _GEN_1512; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2473 = _T_17 ? _GEN_1993 : _GEN_1513; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2474 = _T_17 ? _GEN_1994 : _GEN_1514; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2475 = _T_17 ? _GEN_1995 : _GEN_1515; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2476 = _T_17 ? _GEN_1996 : _GEN_1516; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2477 = _T_17 ? _GEN_1997 : _GEN_1517; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2478 = _T_17 ? _GEN_1998 : _GEN_1518; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2479 = _T_17 ? _GEN_1999 : _GEN_1519; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2480 = _T_17 ? _GEN_2000 : _GEN_1520; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2481 = _T_17 ? _GEN_2001 : _GEN_1521; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2482 = _T_17 ? _GEN_2002 : _GEN_1522; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2483 = _T_17 ? _GEN_2003 : _GEN_1523; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2484 = _T_17 ? _GEN_2004 : _GEN_1524; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2485 = _T_17 ? _GEN_2005 : _GEN_1525; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2486 = _T_17 ? _GEN_2006 : _GEN_1526; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2487 = _T_17 ? _GEN_2007 : _GEN_1527; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2488 = _T_17 ? _GEN_2008 : _GEN_1528; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2489 = _T_17 ? _GEN_2009 : _GEN_1529; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2490 = _T_17 ? _GEN_2010 : _GEN_1530; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2491 = _T_17 ? _GEN_2011 : _GEN_1531; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2492 = _T_17 ? _GEN_2012 : _GEN_1532; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2493 = _T_17 ? _GEN_2013 : _GEN_1533; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2494 = _T_17 ? _GEN_2014 : _GEN_1534; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2495 = _T_17 ? _GEN_2015 : _GEN_1535; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2496 = _T_17 ? _GEN_2016 : _GEN_1536; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2497 = _T_17 ? _GEN_2017 : _GEN_1537; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2498 = _T_17 ? _GEN_2018 : _GEN_1538; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2499 = _T_17 ? _GEN_2019 : _GEN_1539; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2500 = _T_17 ? _GEN_2020 : _GEN_1540; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2501 = _T_17 ? _GEN_2021 : _GEN_1541; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2502 = _T_17 ? _GEN_2022 : _GEN_1542; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2503 = _T_17 ? _GEN_2023 : _GEN_1543; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2504 = _T_17 ? _GEN_2024 : _GEN_1544; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2505 = _T_17 ? _GEN_2025 : _GEN_1545; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2506 = _T_17 ? _GEN_2026 : _GEN_1546; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2507 = _T_17 ? _GEN_2027 : _GEN_1547; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2508 = _T_17 ? _GEN_2028 : _GEN_1548; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2509 = _T_17 ? _GEN_2029 : _GEN_1549; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2510 = _T_17 ? _GEN_2030 : _GEN_1550; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2511 = _T_17 ? _GEN_2031 : _GEN_1551; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2512 = _T_17 ? _GEN_2032 : _GEN_1552; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2513 = _T_17 ? _GEN_2033 : _GEN_1553; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2514 = _T_17 ? _GEN_2034 : _GEN_1554; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2515 = _T_17 ? _GEN_2035 : _GEN_1555; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2516 = _T_17 ? _GEN_2036 : _GEN_1556; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2517 = _T_17 ? _GEN_2037 : _GEN_1557; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2518 = _T_17 ? _GEN_2038 : _GEN_1558; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2519 = _T_17 ? _GEN_2039 : _GEN_1559; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2520 = _T_17 ? _GEN_2040 : _GEN_1560; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2521 = _T_17 ? _GEN_2041 : _GEN_1561; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2522 = _T_17 ? _GEN_2042 : _GEN_1562; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2523 = _T_17 ? _GEN_2043 : _GEN_1563; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2524 = _T_17 ? _GEN_2044 : _GEN_1564; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2525 = _T_17 ? _GEN_2045 : _GEN_1565; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2526 = _T_17 ? _GEN_2046 : _GEN_1566; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2527 = _T_17 ? _GEN_2047 : _GEN_1567; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2528 = _T_17 ? _GEN_2048 : _GEN_1568; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2529 = _T_17 ? _GEN_2049 : _GEN_1569; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2530 = _T_17 ? _GEN_2050 : _GEN_1570; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2531 = _T_17 ? _GEN_2051 : _GEN_1571; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2532 = _T_17 ? _GEN_2052 : _GEN_1572; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2533 = _T_17 ? _GEN_2053 : _GEN_1573; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2534 = _T_17 ? _GEN_2054 : _GEN_1574; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2535 = _T_17 ? _GEN_2055 : _GEN_1575; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2536 = _T_17 ? _GEN_2056 : _GEN_1576; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2537 = _T_17 ? _GEN_2057 : _GEN_1577; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2538 = _T_17 ? _GEN_2058 : _GEN_1578; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2539 = _T_17 ? _GEN_2059 : _GEN_1579; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2540 = _T_17 ? _GEN_2060 : _GEN_1580; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2541 = _T_17 ? _GEN_2061 : _GEN_1581; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2542 = _T_17 ? _GEN_2062 : _GEN_1582; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2543 = _T_17 ? _GEN_2063 : _GEN_1583; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2544 = _T_17 ? _GEN_2064 : _GEN_1584; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2545 = _T_17 ? _GEN_2065 : _GEN_1585; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2546 = _T_17 ? _GEN_2066 : _GEN_1586; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2547 = _T_17 ? _GEN_2067 : _GEN_1587; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2548 = _T_17 ? _GEN_2068 : _GEN_1588; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2549 = _T_17 ? _GEN_2069 : _GEN_1589; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2550 = _T_17 ? _GEN_2070 : _GEN_1590; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2551 = _T_17 ? _GEN_2071 : _GEN_1591; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2552 = _T_17 ? _GEN_2072 : _GEN_1592; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2553 = _T_17 ? _GEN_2073 : _GEN_1593; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2554 = _T_17 ? _GEN_2074 : _GEN_1594; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2555 = _T_17 ? _GEN_2075 : _GEN_1595; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2556 = _T_17 ? _GEN_2076 : _GEN_1596; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2557 = _T_17 ? _GEN_2077 : _GEN_1597; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2558 = _T_17 ? _GEN_2078 : _GEN_1598; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2559 = _T_17 ? _GEN_2079 : _GEN_1599; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2560 = _T_17 ? _GEN_2080 : _GEN_1600; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2561 = _T_17 ? _GEN_2081 : _GEN_1601; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2562 = _T_17 ? _GEN_2082 : _GEN_1602; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2563 = _T_17 ? _GEN_2083 : _GEN_1603; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2564 = _T_17 ? _GEN_2084 : _GEN_1604; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2565 = _T_17 ? _GEN_2085 : _GEN_1605; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2566 = _T_17 ? _GEN_2086 : _GEN_1606; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2567 = _T_17 ? _GEN_2087 : _GEN_1607; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2568 = _T_17 ? _GEN_2088 : _GEN_1608; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2569 = _T_17 ? _GEN_2089 : _GEN_1609; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2570 = _T_17 ? _GEN_2090 : _GEN_1610; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2571 = _T_17 ? _GEN_2091 : _GEN_1611; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2572 = _T_17 ? _GEN_2092 : _GEN_1612; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2573 = _T_17 ? _GEN_2093 : _GEN_1613; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2574 = _T_17 ? _GEN_2094 : _GEN_1614; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2575 = _T_17 ? _GEN_2095 : _GEN_1615; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2576 = _T_17 ? _GEN_2096 : _GEN_1616; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2577 = _T_17 ? _GEN_2097 : _GEN_1617; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2578 = _T_17 ? _GEN_2098 : _GEN_1618; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2579 = _T_17 ? _GEN_2099 : _GEN_1619; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2580 = _T_17 ? _GEN_2100 : _GEN_1620; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2581 = _T_17 ? _GEN_2101 : _GEN_1621; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2582 = _T_17 ? _GEN_2102 : _GEN_1622; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2583 = _T_17 ? _GEN_2103 : _GEN_1623; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2584 = _T_17 ? _GEN_2104 : _GEN_1624; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2585 = _T_17 ? _GEN_2105 : _GEN_1625; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2586 = _T_17 ? _GEN_2106 : _GEN_1626; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2587 = _T_17 ? _GEN_2107 : _GEN_1627; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2588 = _T_17 ? _GEN_2108 : _GEN_1628; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2589 = _T_17 ? _GEN_2109 : _GEN_1629; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2590 = _T_17 ? _GEN_2110 : _GEN_1630; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2591 = _T_17 ? _GEN_2111 : _GEN_1631; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2592 = _T_17 ? _GEN_2112 : _GEN_1632; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2593 = _T_17 ? _GEN_2113 : _GEN_1633; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2594 = _T_17 ? _GEN_2114 : _GEN_1634; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2595 = _T_17 ? _GEN_2115 : _GEN_1635; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2596 = _T_17 ? _GEN_2116 : _GEN_1636; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2597 = _T_17 ? _GEN_2117 : _GEN_1637; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2598 = _T_17 ? _GEN_2118 : _GEN_1638; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2599 = _T_17 ? _GEN_2119 : _GEN_1639; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2600 = _T_17 ? _GEN_2120 : _GEN_1640; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2601 = _T_17 ? _GEN_2121 : _GEN_1641; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2602 = _T_17 ? _GEN_2122 : _GEN_1642; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2603 = _T_17 ? _GEN_2123 : _GEN_1643; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2604 = _T_17 ? _GEN_2124 : _GEN_1644; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2605 = _T_17 ? _GEN_2125 : _GEN_1645; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2606 = _T_17 ? _GEN_2126 : _GEN_1646; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2607 = _T_17 ? _GEN_2127 : _GEN_1647; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2608 = _T_17 ? _GEN_2128 : _GEN_1648; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2609 = _T_17 ? _GEN_2129 : _GEN_1649; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2610 = _T_17 ? _GEN_2130 : _GEN_1650; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2611 = _T_17 ? _GEN_2131 : _GEN_1651; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2612 = _T_17 ? _GEN_2132 : _GEN_1652; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2613 = _T_17 ? _GEN_2133 : _GEN_1653; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2614 = _T_17 ? _GEN_2134 : _GEN_1654; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2615 = _T_17 ? _GEN_2135 : _GEN_1655; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2616 = _T_17 ? _GEN_2136 : _GEN_1656; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2617 = _T_17 ? _GEN_2137 : _GEN_1657; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2618 = _T_17 ? _GEN_2138 : _GEN_1658; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2619 = _T_17 ? _GEN_2139 : _GEN_1659; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2620 = _T_17 ? _GEN_2140 : _GEN_1660; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2621 = _T_17 ? _GEN_2141 : _GEN_1661; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2622 = _T_17 ? _GEN_2142 : _GEN_1662; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2623 = _T_17 ? _GEN_2143 : _GEN_1663; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2624 = _T_17 ? _GEN_2144 : _GEN_1664; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2625 = _T_17 ? _GEN_2145 : _GEN_1665; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2626 = _T_17 ? _GEN_2146 : _GEN_1666; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2627 = _T_17 ? _GEN_2147 : _GEN_1667; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2628 = _T_17 ? _GEN_2148 : _GEN_1668; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2629 = _T_17 ? _GEN_2149 : _GEN_1669; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2630 = _T_17 ? _GEN_2150 : _GEN_1670; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2631 = _T_17 ? _GEN_2151 : _GEN_1671; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2632 = _T_17 ? _GEN_2152 : _GEN_1672; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2633 = _T_17 ? _GEN_2153 : _GEN_1673; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2634 = _T_17 ? _GEN_2154 : _GEN_1674; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2635 = _T_17 ? _GEN_2155 : _GEN_1675; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2636 = _T_17 ? _GEN_2156 : _GEN_1676; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2637 = _T_17 ? _GEN_2157 : _GEN_1677; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2638 = _T_17 ? _GEN_2158 : _GEN_1678; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2639 = _T_17 ? _GEN_2159 : _GEN_1679; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2640 = _T_17 ? _GEN_2160 : _GEN_1680; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2641 = _T_17 ? _GEN_2161 : _GEN_1681; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2642 = _T_17 ? _GEN_2162 : _GEN_1682; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2643 = _T_17 ? _GEN_2163 : _GEN_1683; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2644 = _T_17 ? _GEN_2164 : _GEN_1684; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2645 = _T_17 ? _GEN_2165 : _GEN_1685; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2646 = _T_17 ? _GEN_2166 : _GEN_1686; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2647 = _T_17 ? _GEN_2167 : _GEN_1687; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2648 = _T_17 ? _GEN_2168 : _GEN_1688; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2649 = _T_17 ? _GEN_2169 : _GEN_1689; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2650 = _T_17 ? _GEN_2170 : _GEN_1690; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2651 = _T_17 ? _GEN_2171 : _GEN_1691; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2652 = _T_17 ? _GEN_2172 : _GEN_1692; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2653 = _T_17 ? _GEN_2173 : _GEN_1693; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2654 = _T_17 ? _GEN_2174 : _GEN_1694; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2655 = _T_17 ? _GEN_2175 : _GEN_1695; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2656 = _T_17 ? _GEN_2176 : _GEN_1696; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2657 = _T_17 ? _GEN_2177 : _GEN_1697; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2658 = _T_17 ? _GEN_2178 : _GEN_1698; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2659 = _T_17 ? _GEN_2179 : _GEN_1699; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2660 = _T_17 ? _GEN_2180 : _GEN_1700; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2661 = _T_17 ? _GEN_2181 : _GEN_1701; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2662 = _T_17 ? _GEN_2182 : _GEN_1702; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2663 = _T_17 ? _GEN_2183 : _GEN_1703; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2664 = _T_17 ? _GEN_2184 : _GEN_1704; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2665 = _T_17 ? _GEN_2185 : _GEN_1705; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2666 = _T_17 ? _GEN_2186 : _GEN_1706; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2667 = _T_17 ? _GEN_2187 : _GEN_1707; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2668 = _T_17 ? _GEN_2188 : _GEN_1708; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2669 = _T_17 ? _GEN_2189 : _GEN_1709; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2670 = _T_17 ? _GEN_2190 : _GEN_1710; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2671 = _T_17 ? _GEN_2191 : _GEN_1711; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2672 = _T_17 ? _GEN_2192 : _GEN_1712; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2673 = _T_17 ? _GEN_2193 : _GEN_1713; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2674 = _T_17 ? _GEN_2194 : _GEN_1714; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2675 = _T_17 ? _GEN_2195 : _GEN_1715; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2676 = _T_17 ? _GEN_2196 : _GEN_1716; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2677 = _T_17 ? _GEN_2197 : _GEN_1717; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2678 = _T_17 ? _GEN_2198 : _GEN_1718; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2679 = _T_17 ? _GEN_2199 : _GEN_1719; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2680 = _T_17 ? _GEN_2200 : _GEN_1720; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2681 = _T_17 ? _GEN_2201 : _GEN_1721; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2682 = _T_17 ? _GEN_2202 : _GEN_1722; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2683 = _T_17 ? _GEN_2203 : _GEN_1723; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2684 = _T_17 ? _GEN_2204 : _GEN_1724; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2685 = _T_17 ? _GEN_2205 : _GEN_1725; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2686 = _T_17 ? _GEN_2206 : _GEN_1726; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [1:0] _GEN_2687 = _T_17 ? _GEN_2207 : _GEN_1727; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2688 = _T_17 ? _GEN_2208 : _GEN_1728; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2689 = _T_17 ? _GEN_2209 : _GEN_1729; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2690 = _T_17 ? _GEN_2210 : _GEN_1730; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2691 = _T_17 ? _GEN_2211 : _GEN_1731; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2692 = _T_17 ? _GEN_2212 : _GEN_1732; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2693 = _T_17 ? _GEN_2213 : _GEN_1733; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2694 = _T_17 ? _GEN_2214 : _GEN_1734; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2695 = _T_17 ? _GEN_2215 : _GEN_1735; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2696 = _T_17 ? _GEN_2216 : _GEN_1736; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2697 = _T_17 ? _GEN_2217 : _GEN_1737; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2698 = _T_17 ? _GEN_2218 : _GEN_1738; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2699 = _T_17 ? _GEN_2219 : _GEN_1739; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2700 = _T_17 ? _GEN_2220 : _GEN_1740; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2701 = _T_17 ? _GEN_2221 : _GEN_1741; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2702 = _T_17 ? _GEN_2222 : _GEN_1742; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [2:0] _GEN_2703 = _T_17 ? _GEN_2223 : _GEN_1743; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2704 = _T_17 ? _GEN_2224 : _GEN_1744; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2705 = _T_17 ? _GEN_2225 : _GEN_1745; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2706 = _T_17 ? _GEN_2226 : _GEN_1746; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2707 = _T_17 ? _GEN_2227 : _GEN_1747; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2708 = _T_17 ? _GEN_2228 : _GEN_1748; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2709 = _T_17 ? _GEN_2229 : _GEN_1749; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2710 = _T_17 ? _GEN_2230 : _GEN_1750; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2711 = _T_17 ? _GEN_2231 : _GEN_1751; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2712 = _T_17 ? _GEN_2232 : _GEN_1752; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2713 = _T_17 ? _GEN_2233 : _GEN_1753; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2714 = _T_17 ? _GEN_2234 : _GEN_1754; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2715 = _T_17 ? _GEN_2235 : _GEN_1755; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2716 = _T_17 ? _GEN_2236 : _GEN_1756; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2717 = _T_17 ? _GEN_2237 : _GEN_1757; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2718 = _T_17 ? _GEN_2238 : _GEN_1758; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2719 = _T_17 ? _GEN_2239 : _GEN_1759; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2720 = _T_17 ? _GEN_2240 : _GEN_1760; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2721 = _T_17 ? _GEN_2241 : _GEN_1761; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2722 = _T_17 ? _GEN_2242 : _GEN_1762; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2723 = _T_17 ? _GEN_2243 : _GEN_1763; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2724 = _T_17 ? _GEN_2244 : _GEN_1764; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2725 = _T_17 ? _GEN_2245 : _GEN_1765; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2726 = _T_17 ? _GEN_2246 : _GEN_1766; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2727 = _T_17 ? _GEN_2247 : _GEN_1767; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2728 = _T_17 ? _GEN_2248 : _GEN_1768; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2729 = _T_17 ? _GEN_2249 : _GEN_1769; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2730 = _T_17 ? _GEN_2250 : _GEN_1770; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2731 = _T_17 ? _GEN_2251 : _GEN_1771; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2732 = _T_17 ? _GEN_2252 : _GEN_1772; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2733 = _T_17 ? _GEN_2253 : _GEN_1773; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2734 = _T_17 ? _GEN_2254 : _GEN_1774; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2735 = _T_17 ? _GEN_2255 : _GEN_1775; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2736 = _T_17 ? _GEN_2256 : _GEN_1776; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2737 = _T_17 ? _GEN_2257 : _GEN_1777; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2738 = _T_17 ? _GEN_2258 : _GEN_1778; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2739 = _T_17 ? _GEN_2259 : _GEN_1779; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2740 = _T_17 ? _GEN_2260 : _GEN_1780; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2741 = _T_17 ? _GEN_2261 : _GEN_1781; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2742 = _T_17 ? _GEN_2262 : _GEN_1782; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2743 = _T_17 ? _GEN_2263 : _GEN_1783; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2744 = _T_17 ? _GEN_2264 : _GEN_1784; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2745 = _T_17 ? _GEN_2265 : _GEN_1785; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2746 = _T_17 ? _GEN_2266 : _GEN_1786; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2747 = _T_17 ? _GEN_2267 : _GEN_1787; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2748 = _T_17 ? _GEN_2268 : _GEN_1788; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2749 = _T_17 ? _GEN_2269 : _GEN_1789; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2750 = _T_17 ? _GEN_2270 : _GEN_1790; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2751 = _T_17 ? _GEN_2271 : _GEN_1791; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2752 = _T_17 ? _GEN_2272 : _GEN_1792; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2753 = _T_17 ? _GEN_2273 : _GEN_1793; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2754 = _T_17 ? _GEN_2274 : _GEN_1794; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2755 = _T_17 ? _GEN_2275 : _GEN_1795; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2756 = _T_17 ? _GEN_2276 : _GEN_1796; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2757 = _T_17 ? _GEN_2277 : _GEN_1797; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2758 = _T_17 ? _GEN_2278 : _GEN_1798; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2759 = _T_17 ? _GEN_2279 : _GEN_1799; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2760 = _T_17 ? _GEN_2280 : _GEN_1800; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2761 = _T_17 ? _GEN_2281 : _GEN_1801; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2762 = _T_17 ? _GEN_2282 : _GEN_1802; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2763 = _T_17 ? _GEN_2283 : _GEN_1803; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2764 = _T_17 ? _GEN_2284 : _GEN_1804; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2765 = _T_17 ? _GEN_2285 : _GEN_1805; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2766 = _T_17 ? _GEN_2286 : _GEN_1806; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2767 = _T_17 ? _GEN_2287 : _GEN_1807; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2768 = _T_17 ? _GEN_2288 : _GEN_1808; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2769 = _T_17 ? _GEN_2289 : _GEN_1809; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2770 = _T_17 ? _GEN_2290 : _GEN_1810; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2771 = _T_17 ? _GEN_2291 : _GEN_1811; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2772 = _T_17 ? _GEN_2292 : _GEN_1812; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2773 = _T_17 ? _GEN_2293 : _GEN_1813; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2774 = _T_17 ? _GEN_2294 : _GEN_1814; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2775 = _T_17 ? _GEN_2295 : _GEN_1815; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2776 = _T_17 ? _GEN_2296 : _GEN_1816; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2777 = _T_17 ? _GEN_2297 : _GEN_1817; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2778 = _T_17 ? _GEN_2298 : _GEN_1818; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2779 = _T_17 ? _GEN_2299 : _GEN_1819; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2780 = _T_17 ? _GEN_2300 : _GEN_1820; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2781 = _T_17 ? _GEN_2301 : _GEN_1821; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2782 = _T_17 ? _GEN_2302 : _GEN_1822; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2783 = _T_17 ? _GEN_2303 : _GEN_1823; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2784 = _T_17 ? _GEN_2304 : _GEN_1824; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2785 = _T_17 ? _GEN_2305 : _GEN_1825; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2786 = _T_17 ? _GEN_2306 : _GEN_1826; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2787 = _T_17 ? _GEN_2307 : _GEN_1827; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2788 = _T_17 ? _GEN_2308 : _GEN_1828; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2789 = _T_17 ? _GEN_2309 : _GEN_1829; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2790 = _T_17 ? _GEN_2310 : _GEN_1830; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2791 = _T_17 ? _GEN_2311 : _GEN_1831; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2792 = _T_17 ? _GEN_2312 : _GEN_1832; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2793 = _T_17 ? _GEN_2313 : _GEN_1833; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2794 = _T_17 ? _GEN_2314 : _GEN_1834; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2795 = _T_17 ? _GEN_2315 : _GEN_1835; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2796 = _T_17 ? _GEN_2316 : _GEN_1836; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2797 = _T_17 ? _GEN_2317 : _GEN_1837; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2798 = _T_17 ? _GEN_2318 : _GEN_1838; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2799 = _T_17 ? _GEN_2319 : _GEN_1839; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2800 = _T_17 ? _GEN_2320 : _GEN_1840; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2801 = _T_17 ? _GEN_2321 : _GEN_1841; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2802 = _T_17 ? _GEN_2322 : _GEN_1842; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2803 = _T_17 ? _GEN_2323 : _GEN_1843; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2804 = _T_17 ? _GEN_2324 : _GEN_1844; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2805 = _T_17 ? _GEN_2325 : _GEN_1845; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2806 = _T_17 ? _GEN_2326 : _GEN_1846; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2807 = _T_17 ? _GEN_2327 : _GEN_1847; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2808 = _T_17 ? _GEN_2328 : _GEN_1848; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2809 = _T_17 ? _GEN_2329 : _GEN_1849; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2810 = _T_17 ? _GEN_2330 : _GEN_1850; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2811 = _T_17 ? _GEN_2331 : _GEN_1851; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2812 = _T_17 ? _GEN_2332 : _GEN_1852; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2813 = _T_17 ? _GEN_2333 : _GEN_1853; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2814 = _T_17 ? _GEN_2334 : _GEN_1854; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2815 = _T_17 ? _GEN_2335 : _GEN_1855; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2816 = _T_17 ? _GEN_2336 : _GEN_1856; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2817 = _T_17 ? _GEN_2337 : _GEN_1857; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2818 = _T_17 ? _GEN_2338 : _GEN_1858; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2819 = _T_17 ? _GEN_2339 : _GEN_1859; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2820 = _T_17 ? _GEN_2340 : _GEN_1860; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2821 = _T_17 ? _GEN_2341 : _GEN_1861; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2822 = _T_17 ? _GEN_2342 : _GEN_1862; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2823 = _T_17 ? _GEN_2343 : _GEN_1863; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2824 = _T_17 ? _GEN_2344 : _GEN_1864; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2825 = _T_17 ? _GEN_2345 : _GEN_1865; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2826 = _T_17 ? _GEN_2346 : _GEN_1866; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2827 = _T_17 ? _GEN_2347 : _GEN_1867; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2828 = _T_17 ? _GEN_2348 : _GEN_1868; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2829 = _T_17 ? _GEN_2349 : _GEN_1869; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2830 = _T_17 ? _GEN_2350 : _GEN_1870; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_2831 = _T_17 ? _GEN_2351 : _GEN_1871; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2832 = _T_17 ? _GEN_2352 : _GEN_1872; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2833 = _T_17 ? _GEN_2353 : _GEN_1873; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2834 = _T_17 ? _GEN_2354 : _GEN_1874; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2835 = _T_17 ? _GEN_2355 : _GEN_1875; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2836 = _T_17 ? _GEN_2356 : _GEN_1876; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2837 = _T_17 ? _GEN_2357 : _GEN_1877; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2838 = _T_17 ? _GEN_2358 : _GEN_1878; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2839 = _T_17 ? _GEN_2359 : _GEN_1879; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2840 = _T_17 ? _GEN_2360 : _GEN_1880; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2841 = _T_17 ? _GEN_2361 : _GEN_1881; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2842 = _T_17 ? _GEN_2362 : _GEN_1882; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2843 = _T_17 ? _GEN_2363 : _GEN_1883; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2844 = _T_17 ? _GEN_2364 : _GEN_1884; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2845 = _T_17 ? _GEN_2365 : _GEN_1885; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2846 = _T_17 ? _GEN_2366 : _GEN_1886; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2847 = _T_17 ? _GEN_2367 : _GEN_1887; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2848 = _T_17 ? _GEN_2368 : _GEN_1888; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2849 = _T_17 ? _GEN_2369 : _GEN_1889; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2850 = _T_17 ? _GEN_2370 : _GEN_1890; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2851 = _T_17 ? _GEN_2371 : _GEN_1891; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2852 = _T_17 ? _GEN_2372 : _GEN_1892; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2853 = _T_17 ? _GEN_2373 : _GEN_1893; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2854 = _T_17 ? _GEN_2374 : _GEN_1894; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2855 = _T_17 ? _GEN_2375 : _GEN_1895; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2856 = _T_17 ? _GEN_2376 : _GEN_1896; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2857 = _T_17 ? _GEN_2377 : _GEN_1897; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2858 = _T_17 ? _GEN_2378 : _GEN_1898; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2859 = _T_17 ? _GEN_2379 : _GEN_1899; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2860 = _T_17 ? _GEN_2380 : _GEN_1900; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2861 = _T_17 ? _GEN_2381 : _GEN_1901; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2862 = _T_17 ? _GEN_2382 : _GEN_1902; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2863 = _T_17 ? _GEN_2383 : _GEN_1903; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2864 = _T_17 ? _GEN_2384 : _GEN_1904; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2865 = _T_17 ? _GEN_2385 : _GEN_1905; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2866 = _T_17 ? _GEN_2386 : _GEN_1906; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2867 = _T_17 ? _GEN_2387 : _GEN_1907; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2868 = _T_17 ? _GEN_2388 : _GEN_1908; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2869 = _T_17 ? _GEN_2389 : _GEN_1909; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2870 = _T_17 ? _GEN_2390 : _GEN_1910; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2871 = _T_17 ? _GEN_2391 : _GEN_1911; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2872 = _T_17 ? _GEN_2392 : _GEN_1912; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2873 = _T_17 ? _GEN_2393 : _GEN_1913; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2874 = _T_17 ? _GEN_2394 : _GEN_1914; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2875 = _T_17 ? _GEN_2395 : _GEN_1915; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2876 = _T_17 ? _GEN_2396 : _GEN_1916; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2877 = _T_17 ? _GEN_2397 : _GEN_1917; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2878 = _T_17 ? _GEN_2398 : _GEN_1918; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_2879 = _T_17 ? _GEN_2399 : _GEN_1919; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [5:0] _canEnq_T_3 = count + 5'h3; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq_3 = _canEnq_T_3 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_18 = io_enq_3_ready & io_enq_3_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_3 = enqPtr_value + 4'h3; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire [1:0] _enqFireCnt_T_4 = _T_15 + _T_16; // @[src/main/scala/util/CircularQueue.scala 198:25]
  wire [1:0] _enqFireCnt_T_6 = _T_17 + _T_18; // @[src/main/scala/util/CircularQueue.scala 198:25]
  wire [2:0] enqFireCnt = _enqFireCnt_T_4 + _enqFireCnt_T_6; // @[src/main/scala/util/CircularQueue.scala 198:25]
  wire [3:0] _GEN_8646 = {{1'd0}, enqFireCnt}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [4:0] enqPtr_newIncValue = enqPtr_value + _GEN_8646; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  enqPtr_wrap = enqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] enqPtr_newPtr_value = enqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  canDeq = count > 5'h0; // @[src/main/scala/util/CircularQueue.scala 211:24]
  wire [4:0] _readIdx_T = {{1'd0}, deqPtr_value}; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [3:0] readIdx = _readIdx_T[3:0]; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [31:0] _GEN_3841 = 4'h1 == readIdx ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3842 = 4'h2 == readIdx ? data_2_instr : _GEN_3841; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3843 = 4'h3 == readIdx ? data_3_instr : _GEN_3842; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3844 = 4'h4 == readIdx ? data_4_instr : _GEN_3843; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3845 = 4'h5 == readIdx ? data_5_instr : _GEN_3844; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3846 = 4'h6 == readIdx ? data_6_instr : _GEN_3845; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3847 = 4'h7 == readIdx ? data_7_instr : _GEN_3846; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3848 = 4'h8 == readIdx ? data_8_instr : _GEN_3847; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3849 = 4'h9 == readIdx ? data_9_instr : _GEN_3848; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3850 = 4'ha == readIdx ? data_10_instr : _GEN_3849; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3851 = 4'hb == readIdx ? data_11_instr : _GEN_3850; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3852 = 4'hc == readIdx ? data_12_instr : _GEN_3851; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3853 = 4'hd == readIdx ? data_13_instr : _GEN_3852; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3854 = 4'he == readIdx ? data_14_instr : _GEN_3853; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3857 = 4'h1 == readIdx ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3858 = 4'h2 == readIdx ? data_2_pc : _GEN_3857; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3859 = 4'h3 == readIdx ? data_3_pc : _GEN_3858; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3860 = 4'h4 == readIdx ? data_4_pc : _GEN_3859; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3861 = 4'h5 == readIdx ? data_5_pc : _GEN_3860; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3862 = 4'h6 == readIdx ? data_6_pc : _GEN_3861; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3863 = 4'h7 == readIdx ? data_7_pc : _GEN_3862; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3864 = 4'h8 == readIdx ? data_8_pc : _GEN_3863; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3865 = 4'h9 == readIdx ? data_9_pc : _GEN_3864; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3866 = 4'ha == readIdx ? data_10_pc : _GEN_3865; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3867 = 4'hb == readIdx ? data_11_pc : _GEN_3866; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3868 = 4'hc == readIdx ? data_12_pc : _GEN_3867; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3869 = 4'hd == readIdx ? data_13_pc : _GEN_3868; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3870 = 4'he == readIdx ? data_14_pc : _GEN_3869; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3873 = 4'h1 == readIdx ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3874 = 4'h2 == readIdx ? data_2_pdInfo_valid : _GEN_3873; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3875 = 4'h3 == readIdx ? data_3_pdInfo_valid : _GEN_3874; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3876 = 4'h4 == readIdx ? data_4_pdInfo_valid : _GEN_3875; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3877 = 4'h5 == readIdx ? data_5_pdInfo_valid : _GEN_3876; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3878 = 4'h6 == readIdx ? data_6_pdInfo_valid : _GEN_3877; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3879 = 4'h7 == readIdx ? data_7_pdInfo_valid : _GEN_3878; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3880 = 4'h8 == readIdx ? data_8_pdInfo_valid : _GEN_3879; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3881 = 4'h9 == readIdx ? data_9_pdInfo_valid : _GEN_3880; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3882 = 4'ha == readIdx ? data_10_pdInfo_valid : _GEN_3881; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3883 = 4'hb == readIdx ? data_11_pdInfo_valid : _GEN_3882; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3884 = 4'hc == readIdx ? data_12_pdInfo_valid : _GEN_3883; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3885 = 4'hd == readIdx ? data_13_pdInfo_valid : _GEN_3884; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3886 = 4'he == readIdx ? data_14_pdInfo_valid : _GEN_3885; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3889 = 4'h1 == readIdx ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3890 = 4'h2 == readIdx ? data_2_pdInfo_isBr : _GEN_3889; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3891 = 4'h3 == readIdx ? data_3_pdInfo_isBr : _GEN_3890; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3892 = 4'h4 == readIdx ? data_4_pdInfo_isBr : _GEN_3891; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3893 = 4'h5 == readIdx ? data_5_pdInfo_isBr : _GEN_3892; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3894 = 4'h6 == readIdx ? data_6_pdInfo_isBr : _GEN_3893; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3895 = 4'h7 == readIdx ? data_7_pdInfo_isBr : _GEN_3894; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3896 = 4'h8 == readIdx ? data_8_pdInfo_isBr : _GEN_3895; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3897 = 4'h9 == readIdx ? data_9_pdInfo_isBr : _GEN_3896; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3898 = 4'ha == readIdx ? data_10_pdInfo_isBr : _GEN_3897; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3899 = 4'hb == readIdx ? data_11_pdInfo_isBr : _GEN_3898; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3900 = 4'hc == readIdx ? data_12_pdInfo_isBr : _GEN_3899; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3901 = 4'hd == readIdx ? data_13_pdInfo_isBr : _GEN_3900; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3902 = 4'he == readIdx ? data_14_pdInfo_isBr : _GEN_3901; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3905 = 4'h1 == readIdx ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3906 = 4'h2 == readIdx ? data_2_pdInfo_isJal : _GEN_3905; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3907 = 4'h3 == readIdx ? data_3_pdInfo_isJal : _GEN_3906; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3908 = 4'h4 == readIdx ? data_4_pdInfo_isJal : _GEN_3907; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3909 = 4'h5 == readIdx ? data_5_pdInfo_isJal : _GEN_3908; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3910 = 4'h6 == readIdx ? data_6_pdInfo_isJal : _GEN_3909; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3911 = 4'h7 == readIdx ? data_7_pdInfo_isJal : _GEN_3910; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3912 = 4'h8 == readIdx ? data_8_pdInfo_isJal : _GEN_3911; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3913 = 4'h9 == readIdx ? data_9_pdInfo_isJal : _GEN_3912; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3914 = 4'ha == readIdx ? data_10_pdInfo_isJal : _GEN_3913; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3915 = 4'hb == readIdx ? data_11_pdInfo_isJal : _GEN_3914; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3916 = 4'hc == readIdx ? data_12_pdInfo_isJal : _GEN_3915; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3917 = 4'hd == readIdx ? data_13_pdInfo_isJal : _GEN_3916; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3918 = 4'he == readIdx ? data_14_pdInfo_isJal : _GEN_3917; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3921 = 4'h1 == readIdx ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3922 = 4'h2 == readIdx ? data_2_pdInfo_isJalr : _GEN_3921; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3923 = 4'h3 == readIdx ? data_3_pdInfo_isJalr : _GEN_3922; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3924 = 4'h4 == readIdx ? data_4_pdInfo_isJalr : _GEN_3923; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3925 = 4'h5 == readIdx ? data_5_pdInfo_isJalr : _GEN_3924; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3926 = 4'h6 == readIdx ? data_6_pdInfo_isJalr : _GEN_3925; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3927 = 4'h7 == readIdx ? data_7_pdInfo_isJalr : _GEN_3926; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3928 = 4'h8 == readIdx ? data_8_pdInfo_isJalr : _GEN_3927; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3929 = 4'h9 == readIdx ? data_9_pdInfo_isJalr : _GEN_3928; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3930 = 4'ha == readIdx ? data_10_pdInfo_isJalr : _GEN_3929; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3931 = 4'hb == readIdx ? data_11_pdInfo_isJalr : _GEN_3930; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3932 = 4'hc == readIdx ? data_12_pdInfo_isJalr : _GEN_3931; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3933 = 4'hd == readIdx ? data_13_pdInfo_isJalr : _GEN_3932; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3934 = 4'he == readIdx ? data_14_pdInfo_isJalr : _GEN_3933; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3937 = 4'h1 == readIdx ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3938 = 4'h2 == readIdx ? data_2_pdInfo_isCall : _GEN_3937; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3939 = 4'h3 == readIdx ? data_3_pdInfo_isCall : _GEN_3938; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3940 = 4'h4 == readIdx ? data_4_pdInfo_isCall : _GEN_3939; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3941 = 4'h5 == readIdx ? data_5_pdInfo_isCall : _GEN_3940; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3942 = 4'h6 == readIdx ? data_6_pdInfo_isCall : _GEN_3941; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3943 = 4'h7 == readIdx ? data_7_pdInfo_isCall : _GEN_3942; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3944 = 4'h8 == readIdx ? data_8_pdInfo_isCall : _GEN_3943; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3945 = 4'h9 == readIdx ? data_9_pdInfo_isCall : _GEN_3944; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3946 = 4'ha == readIdx ? data_10_pdInfo_isCall : _GEN_3945; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3947 = 4'hb == readIdx ? data_11_pdInfo_isCall : _GEN_3946; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3948 = 4'hc == readIdx ? data_12_pdInfo_isCall : _GEN_3947; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3949 = 4'hd == readIdx ? data_13_pdInfo_isCall : _GEN_3948; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3950 = 4'he == readIdx ? data_14_pdInfo_isCall : _GEN_3949; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3953 = 4'h1 == readIdx ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3954 = 4'h2 == readIdx ? data_2_pdInfo_isRet : _GEN_3953; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3955 = 4'h3 == readIdx ? data_3_pdInfo_isRet : _GEN_3954; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3956 = 4'h4 == readIdx ? data_4_pdInfo_isRet : _GEN_3955; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3957 = 4'h5 == readIdx ? data_5_pdInfo_isRet : _GEN_3956; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3958 = 4'h6 == readIdx ? data_6_pdInfo_isRet : _GEN_3957; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3959 = 4'h7 == readIdx ? data_7_pdInfo_isRet : _GEN_3958; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3960 = 4'h8 == readIdx ? data_8_pdInfo_isRet : _GEN_3959; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3961 = 4'h9 == readIdx ? data_9_pdInfo_isRet : _GEN_3960; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3962 = 4'ha == readIdx ? data_10_pdInfo_isRet : _GEN_3961; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3963 = 4'hb == readIdx ? data_11_pdInfo_isRet : _GEN_3962; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3964 = 4'hc == readIdx ? data_12_pdInfo_isRet : _GEN_3963; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3965 = 4'hd == readIdx ? data_13_pdInfo_isRet : _GEN_3964; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_3966 = 4'he == readIdx ? data_14_pdInfo_isRet : _GEN_3965; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3969 = 4'h1 == readIdx ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3970 = 4'h2 == readIdx ? data_2_pdInfo_jumpTarget : _GEN_3969; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3971 = 4'h3 == readIdx ? data_3_pdInfo_jumpTarget : _GEN_3970; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3972 = 4'h4 == readIdx ? data_4_pdInfo_jumpTarget : _GEN_3971; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3973 = 4'h5 == readIdx ? data_5_pdInfo_jumpTarget : _GEN_3972; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3974 = 4'h6 == readIdx ? data_6_pdInfo_jumpTarget : _GEN_3973; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3975 = 4'h7 == readIdx ? data_7_pdInfo_jumpTarget : _GEN_3974; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3976 = 4'h8 == readIdx ? data_8_pdInfo_jumpTarget : _GEN_3975; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3977 = 4'h9 == readIdx ? data_9_pdInfo_jumpTarget : _GEN_3976; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3978 = 4'ha == readIdx ? data_10_pdInfo_jumpTarget : _GEN_3977; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3979 = 4'hb == readIdx ? data_11_pdInfo_jumpTarget : _GEN_3978; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3980 = 4'hc == readIdx ? data_12_pdInfo_jumpTarget : _GEN_3979; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3981 = 4'hd == readIdx ? data_13_pdInfo_jumpTarget : _GEN_3980; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3982 = 4'he == readIdx ? data_14_pdInfo_jumpTarget : _GEN_3981; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3985 = 4'h1 == readIdx ? data_1_bpuInfo_pc : data_0_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3986 = 4'h2 == readIdx ? data_2_bpuInfo_pc : _GEN_3985; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3987 = 4'h3 == readIdx ? data_3_bpuInfo_pc : _GEN_3986; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3988 = 4'h4 == readIdx ? data_4_bpuInfo_pc : _GEN_3987; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3989 = 4'h5 == readIdx ? data_5_bpuInfo_pc : _GEN_3988; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3990 = 4'h6 == readIdx ? data_6_bpuInfo_pc : _GEN_3989; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3991 = 4'h7 == readIdx ? data_7_bpuInfo_pc : _GEN_3990; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3992 = 4'h8 == readIdx ? data_8_bpuInfo_pc : _GEN_3991; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3993 = 4'h9 == readIdx ? data_9_bpuInfo_pc : _GEN_3992; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3994 = 4'ha == readIdx ? data_10_bpuInfo_pc : _GEN_3993; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3995 = 4'hb == readIdx ? data_11_bpuInfo_pc : _GEN_3994; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3996 = 4'hc == readIdx ? data_12_bpuInfo_pc : _GEN_3995; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3997 = 4'hd == readIdx ? data_13_bpuInfo_pc : _GEN_3996; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_3998 = 4'he == readIdx ? data_14_bpuInfo_pc : _GEN_3997; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4001 = 4'h1 == readIdx ? data_1_bpuInfo_fallThrough : data_0_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4002 = 4'h2 == readIdx ? data_2_bpuInfo_fallThrough : _GEN_4001; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4003 = 4'h3 == readIdx ? data_3_bpuInfo_fallThrough : _GEN_4002; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4004 = 4'h4 == readIdx ? data_4_bpuInfo_fallThrough : _GEN_4003; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4005 = 4'h5 == readIdx ? data_5_bpuInfo_fallThrough : _GEN_4004; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4006 = 4'h6 == readIdx ? data_6_bpuInfo_fallThrough : _GEN_4005; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4007 = 4'h7 == readIdx ? data_7_bpuInfo_fallThrough : _GEN_4006; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4008 = 4'h8 == readIdx ? data_8_bpuInfo_fallThrough : _GEN_4007; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4009 = 4'h9 == readIdx ? data_9_bpuInfo_fallThrough : _GEN_4008; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4010 = 4'ha == readIdx ? data_10_bpuInfo_fallThrough : _GEN_4009; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4011 = 4'hb == readIdx ? data_11_bpuInfo_fallThrough : _GEN_4010; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4012 = 4'hc == readIdx ? data_12_bpuInfo_fallThrough : _GEN_4011; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4013 = 4'hd == readIdx ? data_13_bpuInfo_fallThrough : _GEN_4012; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4014 = 4'he == readIdx ? data_14_bpuInfo_fallThrough : _GEN_4013; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4017 = 4'h1 == readIdx ? data_1_bpuInfo_taken : data_0_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4018 = 4'h2 == readIdx ? data_2_bpuInfo_taken : _GEN_4017; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4019 = 4'h3 == readIdx ? data_3_bpuInfo_taken : _GEN_4018; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4020 = 4'h4 == readIdx ? data_4_bpuInfo_taken : _GEN_4019; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4021 = 4'h5 == readIdx ? data_5_bpuInfo_taken : _GEN_4020; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4022 = 4'h6 == readIdx ? data_6_bpuInfo_taken : _GEN_4021; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4023 = 4'h7 == readIdx ? data_7_bpuInfo_taken : _GEN_4022; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4024 = 4'h8 == readIdx ? data_8_bpuInfo_taken : _GEN_4023; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4025 = 4'h9 == readIdx ? data_9_bpuInfo_taken : _GEN_4024; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4026 = 4'ha == readIdx ? data_10_bpuInfo_taken : _GEN_4025; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4027 = 4'hb == readIdx ? data_11_bpuInfo_taken : _GEN_4026; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4028 = 4'hc == readIdx ? data_12_bpuInfo_taken : _GEN_4027; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4029 = 4'hd == readIdx ? data_13_bpuInfo_taken : _GEN_4028; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4030 = 4'he == readIdx ? data_14_bpuInfo_taken : _GEN_4029; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4033 = 4'h1 == readIdx ? data_1_bpuInfo_target : data_0_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4034 = 4'h2 == readIdx ? data_2_bpuInfo_target : _GEN_4033; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4035 = 4'h3 == readIdx ? data_3_bpuInfo_target : _GEN_4034; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4036 = 4'h4 == readIdx ? data_4_bpuInfo_target : _GEN_4035; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4037 = 4'h5 == readIdx ? data_5_bpuInfo_target : _GEN_4036; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4038 = 4'h6 == readIdx ? data_6_bpuInfo_target : _GEN_4037; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4039 = 4'h7 == readIdx ? data_7_bpuInfo_target : _GEN_4038; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4040 = 4'h8 == readIdx ? data_8_bpuInfo_target : _GEN_4039; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4041 = 4'h9 == readIdx ? data_9_bpuInfo_target : _GEN_4040; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4042 = 4'ha == readIdx ? data_10_bpuInfo_target : _GEN_4041; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4043 = 4'hb == readIdx ? data_11_bpuInfo_target : _GEN_4042; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4044 = 4'hc == readIdx ? data_12_bpuInfo_target : _GEN_4043; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4045 = 4'hd == readIdx ? data_13_bpuInfo_target : _GEN_4044; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4046 = 4'he == readIdx ? data_14_bpuInfo_target : _GEN_4045; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4049 = 4'h1 == readIdx ? data_1_bpuInfo_takenOffset : data_0_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4050 = 4'h2 == readIdx ? data_2_bpuInfo_takenOffset : _GEN_4049; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4051 = 4'h3 == readIdx ? data_3_bpuInfo_takenOffset : _GEN_4050; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4052 = 4'h4 == readIdx ? data_4_bpuInfo_takenOffset : _GEN_4051; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4053 = 4'h5 == readIdx ? data_5_bpuInfo_takenOffset : _GEN_4052; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4054 = 4'h6 == readIdx ? data_6_bpuInfo_takenOffset : _GEN_4053; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4055 = 4'h7 == readIdx ? data_7_bpuInfo_takenOffset : _GEN_4054; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4056 = 4'h8 == readIdx ? data_8_bpuInfo_takenOffset : _GEN_4055; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4057 = 4'h9 == readIdx ? data_9_bpuInfo_takenOffset : _GEN_4056; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4058 = 4'ha == readIdx ? data_10_bpuInfo_takenOffset : _GEN_4057; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4059 = 4'hb == readIdx ? data_11_bpuInfo_takenOffset : _GEN_4058; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4060 = 4'hc == readIdx ? data_12_bpuInfo_takenOffset : _GEN_4059; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4061 = 4'hd == readIdx ? data_13_bpuInfo_takenOffset : _GEN_4060; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4062 = 4'he == readIdx ? data_14_bpuInfo_takenOffset : _GEN_4061; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4065 = 4'h1 == readIdx ? data_1_bpuInfo_meta_valid : data_0_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4066 = 4'h2 == readIdx ? data_2_bpuInfo_meta_valid : _GEN_4065; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4067 = 4'h3 == readIdx ? data_3_bpuInfo_meta_valid : _GEN_4066; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4068 = 4'h4 == readIdx ? data_4_bpuInfo_meta_valid : _GEN_4067; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4069 = 4'h5 == readIdx ? data_5_bpuInfo_meta_valid : _GEN_4068; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4070 = 4'h6 == readIdx ? data_6_bpuInfo_meta_valid : _GEN_4069; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4071 = 4'h7 == readIdx ? data_7_bpuInfo_meta_valid : _GEN_4070; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4072 = 4'h8 == readIdx ? data_8_bpuInfo_meta_valid : _GEN_4071; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4073 = 4'h9 == readIdx ? data_9_bpuInfo_meta_valid : _GEN_4072; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4074 = 4'ha == readIdx ? data_10_bpuInfo_meta_valid : _GEN_4073; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4075 = 4'hb == readIdx ? data_11_bpuInfo_meta_valid : _GEN_4074; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4076 = 4'hc == readIdx ? data_12_bpuInfo_meta_valid : _GEN_4075; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4077 = 4'hd == readIdx ? data_13_bpuInfo_meta_valid : _GEN_4076; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4078 = 4'he == readIdx ? data_14_bpuInfo_meta_valid : _GEN_4077; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4081 = 4'h1 == readIdx ? data_1_bpuInfo_meta_btbHit : data_0_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4082 = 4'h2 == readIdx ? data_2_bpuInfo_meta_btbHit : _GEN_4081; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4083 = 4'h3 == readIdx ? data_3_bpuInfo_meta_btbHit : _GEN_4082; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4084 = 4'h4 == readIdx ? data_4_bpuInfo_meta_btbHit : _GEN_4083; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4085 = 4'h5 == readIdx ? data_5_bpuInfo_meta_btbHit : _GEN_4084; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4086 = 4'h6 == readIdx ? data_6_bpuInfo_meta_btbHit : _GEN_4085; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4087 = 4'h7 == readIdx ? data_7_bpuInfo_meta_btbHit : _GEN_4086; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4088 = 4'h8 == readIdx ? data_8_bpuInfo_meta_btbHit : _GEN_4087; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4089 = 4'h9 == readIdx ? data_9_bpuInfo_meta_btbHit : _GEN_4088; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4090 = 4'ha == readIdx ? data_10_bpuInfo_meta_btbHit : _GEN_4089; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4091 = 4'hb == readIdx ? data_11_bpuInfo_meta_btbHit : _GEN_4090; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4092 = 4'hc == readIdx ? data_12_bpuInfo_meta_btbHit : _GEN_4091; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4093 = 4'hd == readIdx ? data_13_bpuInfo_meta_btbHit : _GEN_4092; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4094 = 4'he == readIdx ? data_14_bpuInfo_meta_btbHit : _GEN_4093; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4097 = 4'h1 == readIdx ? data_1_bpuInfo_meta_btbIsJalr : data_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4098 = 4'h2 == readIdx ? data_2_bpuInfo_meta_btbIsJalr : _GEN_4097; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4099 = 4'h3 == readIdx ? data_3_bpuInfo_meta_btbIsJalr : _GEN_4098; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4100 = 4'h4 == readIdx ? data_4_bpuInfo_meta_btbIsJalr : _GEN_4099; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4101 = 4'h5 == readIdx ? data_5_bpuInfo_meta_btbIsJalr : _GEN_4100; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4102 = 4'h6 == readIdx ? data_6_bpuInfo_meta_btbIsJalr : _GEN_4101; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4103 = 4'h7 == readIdx ? data_7_bpuInfo_meta_btbIsJalr : _GEN_4102; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4104 = 4'h8 == readIdx ? data_8_bpuInfo_meta_btbIsJalr : _GEN_4103; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4105 = 4'h9 == readIdx ? data_9_bpuInfo_meta_btbIsJalr : _GEN_4104; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4106 = 4'ha == readIdx ? data_10_bpuInfo_meta_btbIsJalr : _GEN_4105; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4107 = 4'hb == readIdx ? data_11_bpuInfo_meta_btbIsJalr : _GEN_4106; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4108 = 4'hc == readIdx ? data_12_bpuInfo_meta_btbIsJalr : _GEN_4107; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4109 = 4'hd == readIdx ? data_13_bpuInfo_meta_btbIsJalr : _GEN_4108; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4110 = 4'he == readIdx ? data_14_bpuInfo_meta_btbIsJalr : _GEN_4109; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4113 = 4'h1 == readIdx ? data_1_bpuInfo_meta_btbIsJal : data_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4114 = 4'h2 == readIdx ? data_2_bpuInfo_meta_btbIsJal : _GEN_4113; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4115 = 4'h3 == readIdx ? data_3_bpuInfo_meta_btbIsJal : _GEN_4114; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4116 = 4'h4 == readIdx ? data_4_bpuInfo_meta_btbIsJal : _GEN_4115; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4117 = 4'h5 == readIdx ? data_5_bpuInfo_meta_btbIsJal : _GEN_4116; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4118 = 4'h6 == readIdx ? data_6_bpuInfo_meta_btbIsJal : _GEN_4117; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4119 = 4'h7 == readIdx ? data_7_bpuInfo_meta_btbIsJal : _GEN_4118; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4120 = 4'h8 == readIdx ? data_8_bpuInfo_meta_btbIsJal : _GEN_4119; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4121 = 4'h9 == readIdx ? data_9_bpuInfo_meta_btbIsJal : _GEN_4120; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4122 = 4'ha == readIdx ? data_10_bpuInfo_meta_btbIsJal : _GEN_4121; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4123 = 4'hb == readIdx ? data_11_bpuInfo_meta_btbIsJal : _GEN_4122; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4124 = 4'hc == readIdx ? data_12_bpuInfo_meta_btbIsJal : _GEN_4123; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4125 = 4'hd == readIdx ? data_13_bpuInfo_meta_btbIsJal : _GEN_4124; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4126 = 4'he == readIdx ? data_14_bpuInfo_meta_btbIsJal : _GEN_4125; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4129 = 4'h1 == readIdx ? data_1_bpuInfo_meta_btbIsCall : data_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4130 = 4'h2 == readIdx ? data_2_bpuInfo_meta_btbIsCall : _GEN_4129; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4131 = 4'h3 == readIdx ? data_3_bpuInfo_meta_btbIsCall : _GEN_4130; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4132 = 4'h4 == readIdx ? data_4_bpuInfo_meta_btbIsCall : _GEN_4131; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4133 = 4'h5 == readIdx ? data_5_bpuInfo_meta_btbIsCall : _GEN_4132; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4134 = 4'h6 == readIdx ? data_6_bpuInfo_meta_btbIsCall : _GEN_4133; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4135 = 4'h7 == readIdx ? data_7_bpuInfo_meta_btbIsCall : _GEN_4134; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4136 = 4'h8 == readIdx ? data_8_bpuInfo_meta_btbIsCall : _GEN_4135; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4137 = 4'h9 == readIdx ? data_9_bpuInfo_meta_btbIsCall : _GEN_4136; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4138 = 4'ha == readIdx ? data_10_bpuInfo_meta_btbIsCall : _GEN_4137; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4139 = 4'hb == readIdx ? data_11_bpuInfo_meta_btbIsCall : _GEN_4138; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4140 = 4'hc == readIdx ? data_12_bpuInfo_meta_btbIsCall : _GEN_4139; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4141 = 4'hd == readIdx ? data_13_bpuInfo_meta_btbIsCall : _GEN_4140; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4142 = 4'he == readIdx ? data_14_bpuInfo_meta_btbIsCall : _GEN_4141; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4145 = 4'h1 == readIdx ? data_1_bpuInfo_meta_btbIsRet : data_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4146 = 4'h2 == readIdx ? data_2_bpuInfo_meta_btbIsRet : _GEN_4145; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4147 = 4'h3 == readIdx ? data_3_bpuInfo_meta_btbIsRet : _GEN_4146; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4148 = 4'h4 == readIdx ? data_4_bpuInfo_meta_btbIsRet : _GEN_4147; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4149 = 4'h5 == readIdx ? data_5_bpuInfo_meta_btbIsRet : _GEN_4148; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4150 = 4'h6 == readIdx ? data_6_bpuInfo_meta_btbIsRet : _GEN_4149; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4151 = 4'h7 == readIdx ? data_7_bpuInfo_meta_btbIsRet : _GEN_4150; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4152 = 4'h8 == readIdx ? data_8_bpuInfo_meta_btbIsRet : _GEN_4151; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4153 = 4'h9 == readIdx ? data_9_bpuInfo_meta_btbIsRet : _GEN_4152; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4154 = 4'ha == readIdx ? data_10_bpuInfo_meta_btbIsRet : _GEN_4153; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4155 = 4'hb == readIdx ? data_11_bpuInfo_meta_btbIsRet : _GEN_4154; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4156 = 4'hc == readIdx ? data_12_bpuInfo_meta_btbIsRet : _GEN_4155; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4157 = 4'hd == readIdx ? data_13_bpuInfo_meta_btbIsRet : _GEN_4156; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4158 = 4'he == readIdx ? data_14_bpuInfo_meta_btbIsRet : _GEN_4157; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4161 = 4'h1 == readIdx ? data_1_bpuInfo_meta_btbOffset : data_0_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4162 = 4'h2 == readIdx ? data_2_bpuInfo_meta_btbOffset : _GEN_4161; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4163 = 4'h3 == readIdx ? data_3_bpuInfo_meta_btbOffset : _GEN_4162; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4164 = 4'h4 == readIdx ? data_4_bpuInfo_meta_btbOffset : _GEN_4163; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4165 = 4'h5 == readIdx ? data_5_bpuInfo_meta_btbOffset : _GEN_4164; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4166 = 4'h6 == readIdx ? data_6_bpuInfo_meta_btbOffset : _GEN_4165; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4167 = 4'h7 == readIdx ? data_7_bpuInfo_meta_btbOffset : _GEN_4166; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4168 = 4'h8 == readIdx ? data_8_bpuInfo_meta_btbOffset : _GEN_4167; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4169 = 4'h9 == readIdx ? data_9_bpuInfo_meta_btbOffset : _GEN_4168; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4170 = 4'ha == readIdx ? data_10_bpuInfo_meta_btbOffset : _GEN_4169; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4171 = 4'hb == readIdx ? data_11_bpuInfo_meta_btbOffset : _GEN_4170; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4172 = 4'hc == readIdx ? data_12_bpuInfo_meta_btbOffset : _GEN_4171; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4173 = 4'hd == readIdx ? data_13_bpuInfo_meta_btbOffset : _GEN_4172; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4174 = 4'he == readIdx ? data_14_bpuInfo_meta_btbOffset : _GEN_4173; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4177 = 4'h1 == readIdx ? data_1_bpuInfo_meta_phtCounter : data_0_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4178 = 4'h2 == readIdx ? data_2_bpuInfo_meta_phtCounter : _GEN_4177; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4179 = 4'h3 == readIdx ? data_3_bpuInfo_meta_phtCounter : _GEN_4178; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4180 = 4'h4 == readIdx ? data_4_bpuInfo_meta_phtCounter : _GEN_4179; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4181 = 4'h5 == readIdx ? data_5_bpuInfo_meta_phtCounter : _GEN_4180; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4182 = 4'h6 == readIdx ? data_6_bpuInfo_meta_phtCounter : _GEN_4181; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4183 = 4'h7 == readIdx ? data_7_bpuInfo_meta_phtCounter : _GEN_4182; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4184 = 4'h8 == readIdx ? data_8_bpuInfo_meta_phtCounter : _GEN_4183; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4185 = 4'h9 == readIdx ? data_9_bpuInfo_meta_phtCounter : _GEN_4184; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4186 = 4'ha == readIdx ? data_10_bpuInfo_meta_phtCounter : _GEN_4185; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4187 = 4'hb == readIdx ? data_11_bpuInfo_meta_phtCounter : _GEN_4186; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4188 = 4'hc == readIdx ? data_12_bpuInfo_meta_phtCounter : _GEN_4187; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4189 = 4'hd == readIdx ? data_13_bpuInfo_meta_phtCounter : _GEN_4188; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4190 = 4'he == readIdx ? data_14_bpuInfo_meta_phtCounter : _GEN_4189; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4193 = 4'h1 == readIdx ? data_1_bpuInfo_meta_rasTop : data_0_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4194 = 4'h2 == readIdx ? data_2_bpuInfo_meta_rasTop : _GEN_4193; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4195 = 4'h3 == readIdx ? data_3_bpuInfo_meta_rasTop : _GEN_4194; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4196 = 4'h4 == readIdx ? data_4_bpuInfo_meta_rasTop : _GEN_4195; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4197 = 4'h5 == readIdx ? data_5_bpuInfo_meta_rasTop : _GEN_4196; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4198 = 4'h6 == readIdx ? data_6_bpuInfo_meta_rasTop : _GEN_4197; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4199 = 4'h7 == readIdx ? data_7_bpuInfo_meta_rasTop : _GEN_4198; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4200 = 4'h8 == readIdx ? data_8_bpuInfo_meta_rasTop : _GEN_4199; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4201 = 4'h9 == readIdx ? data_9_bpuInfo_meta_rasTop : _GEN_4200; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4202 = 4'ha == readIdx ? data_10_bpuInfo_meta_rasTop : _GEN_4201; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4203 = 4'hb == readIdx ? data_11_bpuInfo_meta_rasTop : _GEN_4202; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4204 = 4'hc == readIdx ? data_12_bpuInfo_meta_rasTop : _GEN_4203; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4205 = 4'hd == readIdx ? data_13_bpuInfo_meta_rasTop : _GEN_4204; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4206 = 4'he == readIdx ? data_14_bpuInfo_meta_rasTop : _GEN_4205; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4209 = 4'h1 == readIdx ? data_1_bpuInfo_meta_predTaken : data_0_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4210 = 4'h2 == readIdx ? data_2_bpuInfo_meta_predTaken : _GEN_4209; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4211 = 4'h3 == readIdx ? data_3_bpuInfo_meta_predTaken : _GEN_4210; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4212 = 4'h4 == readIdx ? data_4_bpuInfo_meta_predTaken : _GEN_4211; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4213 = 4'h5 == readIdx ? data_5_bpuInfo_meta_predTaken : _GEN_4212; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4214 = 4'h6 == readIdx ? data_6_bpuInfo_meta_predTaken : _GEN_4213; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4215 = 4'h7 == readIdx ? data_7_bpuInfo_meta_predTaken : _GEN_4214; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4216 = 4'h8 == readIdx ? data_8_bpuInfo_meta_predTaken : _GEN_4215; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4217 = 4'h9 == readIdx ? data_9_bpuInfo_meta_predTaken : _GEN_4216; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4218 = 4'ha == readIdx ? data_10_bpuInfo_meta_predTaken : _GEN_4217; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4219 = 4'hb == readIdx ? data_11_bpuInfo_meta_predTaken : _GEN_4218; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4220 = 4'hc == readIdx ? data_12_bpuInfo_meta_predTaken : _GEN_4219; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4221 = 4'hd == readIdx ? data_13_bpuInfo_meta_predTaken : _GEN_4220; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4222 = 4'he == readIdx ? data_14_bpuInfo_meta_predTaken : _GEN_4221; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4225 = 4'h1 == readIdx ? data_1_bpuInfo_meta_predTarget : data_0_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4226 = 4'h2 == readIdx ? data_2_bpuInfo_meta_predTarget : _GEN_4225; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4227 = 4'h3 == readIdx ? data_3_bpuInfo_meta_predTarget : _GEN_4226; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4228 = 4'h4 == readIdx ? data_4_bpuInfo_meta_predTarget : _GEN_4227; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4229 = 4'h5 == readIdx ? data_5_bpuInfo_meta_predTarget : _GEN_4228; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4230 = 4'h6 == readIdx ? data_6_bpuInfo_meta_predTarget : _GEN_4229; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4231 = 4'h7 == readIdx ? data_7_bpuInfo_meta_predTarget : _GEN_4230; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4232 = 4'h8 == readIdx ? data_8_bpuInfo_meta_predTarget : _GEN_4231; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4233 = 4'h9 == readIdx ? data_9_bpuInfo_meta_predTarget : _GEN_4232; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4234 = 4'ha == readIdx ? data_10_bpuInfo_meta_predTarget : _GEN_4233; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4235 = 4'hb == readIdx ? data_11_bpuInfo_meta_predTarget : _GEN_4234; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4236 = 4'hc == readIdx ? data_12_bpuInfo_meta_predTarget : _GEN_4235; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4237 = 4'hd == readIdx ? data_13_bpuInfo_meta_predTarget : _GEN_4236; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4238 = 4'he == readIdx ? data_14_bpuInfo_meta_predTarget : _GEN_4237; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4241 = 4'h1 == readIdx ? data_1_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4242 = 4'h2 == readIdx ? data_2_exception_excpTlbRefill : _GEN_4241; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4243 = 4'h3 == readIdx ? data_3_exception_excpTlbRefill : _GEN_4242; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4244 = 4'h4 == readIdx ? data_4_exception_excpTlbRefill : _GEN_4243; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4245 = 4'h5 == readIdx ? data_5_exception_excpTlbRefill : _GEN_4244; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4246 = 4'h6 == readIdx ? data_6_exception_excpTlbRefill : _GEN_4245; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4247 = 4'h7 == readIdx ? data_7_exception_excpTlbRefill : _GEN_4246; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4248 = 4'h8 == readIdx ? data_8_exception_excpTlbRefill : _GEN_4247; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4249 = 4'h9 == readIdx ? data_9_exception_excpTlbRefill : _GEN_4248; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4250 = 4'ha == readIdx ? data_10_exception_excpTlbRefill : _GEN_4249; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4251 = 4'hb == readIdx ? data_11_exception_excpTlbRefill : _GEN_4250; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4252 = 4'hc == readIdx ? data_12_exception_excpTlbRefill : _GEN_4251; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4253 = 4'hd == readIdx ? data_13_exception_excpTlbRefill : _GEN_4252; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4254 = 4'he == readIdx ? data_14_exception_excpTlbRefill : _GEN_4253; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4257 = 4'h1 == readIdx ? data_1_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4258 = 4'h2 == readIdx ? data_2_exception_excpTlbPif : _GEN_4257; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4259 = 4'h3 == readIdx ? data_3_exception_excpTlbPif : _GEN_4258; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4260 = 4'h4 == readIdx ? data_4_exception_excpTlbPif : _GEN_4259; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4261 = 4'h5 == readIdx ? data_5_exception_excpTlbPif : _GEN_4260; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4262 = 4'h6 == readIdx ? data_6_exception_excpTlbPif : _GEN_4261; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4263 = 4'h7 == readIdx ? data_7_exception_excpTlbPif : _GEN_4262; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4264 = 4'h8 == readIdx ? data_8_exception_excpTlbPif : _GEN_4263; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4265 = 4'h9 == readIdx ? data_9_exception_excpTlbPif : _GEN_4264; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4266 = 4'ha == readIdx ? data_10_exception_excpTlbPif : _GEN_4265; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4267 = 4'hb == readIdx ? data_11_exception_excpTlbPif : _GEN_4266; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4268 = 4'hc == readIdx ? data_12_exception_excpTlbPif : _GEN_4267; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4269 = 4'hd == readIdx ? data_13_exception_excpTlbPif : _GEN_4268; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4270 = 4'he == readIdx ? data_14_exception_excpTlbPif : _GEN_4269; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4273 = 4'h1 == readIdx ? data_1_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4274 = 4'h2 == readIdx ? data_2_exception_excpTlbPpi : _GEN_4273; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4275 = 4'h3 == readIdx ? data_3_exception_excpTlbPpi : _GEN_4274; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4276 = 4'h4 == readIdx ? data_4_exception_excpTlbPpi : _GEN_4275; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4277 = 4'h5 == readIdx ? data_5_exception_excpTlbPpi : _GEN_4276; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4278 = 4'h6 == readIdx ? data_6_exception_excpTlbPpi : _GEN_4277; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4279 = 4'h7 == readIdx ? data_7_exception_excpTlbPpi : _GEN_4278; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4280 = 4'h8 == readIdx ? data_8_exception_excpTlbPpi : _GEN_4279; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4281 = 4'h9 == readIdx ? data_9_exception_excpTlbPpi : _GEN_4280; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4282 = 4'ha == readIdx ? data_10_exception_excpTlbPpi : _GEN_4281; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4283 = 4'hb == readIdx ? data_11_exception_excpTlbPpi : _GEN_4282; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4284 = 4'hc == readIdx ? data_12_exception_excpTlbPpi : _GEN_4283; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4285 = 4'hd == readIdx ? data_13_exception_excpTlbPpi : _GEN_4284; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4286 = 4'he == readIdx ? data_14_exception_excpTlbPpi : _GEN_4285; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4289 = 4'h1 == readIdx ? data_1_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4290 = 4'h2 == readIdx ? data_2_exception_excpAdef : _GEN_4289; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4291 = 4'h3 == readIdx ? data_3_exception_excpAdef : _GEN_4290; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4292 = 4'h4 == readIdx ? data_4_exception_excpAdef : _GEN_4291; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4293 = 4'h5 == readIdx ? data_5_exception_excpAdef : _GEN_4292; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4294 = 4'h6 == readIdx ? data_6_exception_excpAdef : _GEN_4293; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4295 = 4'h7 == readIdx ? data_7_exception_excpAdef : _GEN_4294; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4296 = 4'h8 == readIdx ? data_8_exception_excpAdef : _GEN_4295; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4297 = 4'h9 == readIdx ? data_9_exception_excpAdef : _GEN_4296; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4298 = 4'ha == readIdx ? data_10_exception_excpAdef : _GEN_4297; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4299 = 4'hb == readIdx ? data_11_exception_excpAdef : _GEN_4298; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4300 = 4'hc == readIdx ? data_12_exception_excpAdef : _GEN_4299; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4301 = 4'hd == readIdx ? data_13_exception_excpAdef : _GEN_4300; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4302 = 4'he == readIdx ? data_14_exception_excpAdef : _GEN_4301; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4305 = 4'h1 == readIdx ? data_1_exception_excpAle : data_0_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4306 = 4'h2 == readIdx ? data_2_exception_excpAle : _GEN_4305; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4307 = 4'h3 == readIdx ? data_3_exception_excpAle : _GEN_4306; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4308 = 4'h4 == readIdx ? data_4_exception_excpAle : _GEN_4307; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4309 = 4'h5 == readIdx ? data_5_exception_excpAle : _GEN_4308; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4310 = 4'h6 == readIdx ? data_6_exception_excpAle : _GEN_4309; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4311 = 4'h7 == readIdx ? data_7_exception_excpAle : _GEN_4310; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4312 = 4'h8 == readIdx ? data_8_exception_excpAle : _GEN_4311; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4313 = 4'h9 == readIdx ? data_9_exception_excpAle : _GEN_4312; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4314 = 4'ha == readIdx ? data_10_exception_excpAle : _GEN_4313; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4315 = 4'hb == readIdx ? data_11_exception_excpAle : _GEN_4314; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4316 = 4'hc == readIdx ? data_12_exception_excpAle : _GEN_4315; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4317 = 4'hd == readIdx ? data_13_exception_excpAle : _GEN_4316; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4318 = 4'he == readIdx ? data_14_exception_excpAle : _GEN_4317; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  canDeq_1 = count > 5'h1; // @[src/main/scala/util/CircularQueue.scala 211:24]
  wire [3:0] readIdx_1 = deqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [31:0] _GEN_4321 = 4'h1 == readIdx_1 ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4322 = 4'h2 == readIdx_1 ? data_2_instr : _GEN_4321; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4323 = 4'h3 == readIdx_1 ? data_3_instr : _GEN_4322; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4324 = 4'h4 == readIdx_1 ? data_4_instr : _GEN_4323; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4325 = 4'h5 == readIdx_1 ? data_5_instr : _GEN_4324; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4326 = 4'h6 == readIdx_1 ? data_6_instr : _GEN_4325; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4327 = 4'h7 == readIdx_1 ? data_7_instr : _GEN_4326; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4328 = 4'h8 == readIdx_1 ? data_8_instr : _GEN_4327; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4329 = 4'h9 == readIdx_1 ? data_9_instr : _GEN_4328; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4330 = 4'ha == readIdx_1 ? data_10_instr : _GEN_4329; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4331 = 4'hb == readIdx_1 ? data_11_instr : _GEN_4330; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4332 = 4'hc == readIdx_1 ? data_12_instr : _GEN_4331; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4333 = 4'hd == readIdx_1 ? data_13_instr : _GEN_4332; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4334 = 4'he == readIdx_1 ? data_14_instr : _GEN_4333; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4337 = 4'h1 == readIdx_1 ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4338 = 4'h2 == readIdx_1 ? data_2_pc : _GEN_4337; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4339 = 4'h3 == readIdx_1 ? data_3_pc : _GEN_4338; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4340 = 4'h4 == readIdx_1 ? data_4_pc : _GEN_4339; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4341 = 4'h5 == readIdx_1 ? data_5_pc : _GEN_4340; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4342 = 4'h6 == readIdx_1 ? data_6_pc : _GEN_4341; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4343 = 4'h7 == readIdx_1 ? data_7_pc : _GEN_4342; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4344 = 4'h8 == readIdx_1 ? data_8_pc : _GEN_4343; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4345 = 4'h9 == readIdx_1 ? data_9_pc : _GEN_4344; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4346 = 4'ha == readIdx_1 ? data_10_pc : _GEN_4345; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4347 = 4'hb == readIdx_1 ? data_11_pc : _GEN_4346; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4348 = 4'hc == readIdx_1 ? data_12_pc : _GEN_4347; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4349 = 4'hd == readIdx_1 ? data_13_pc : _GEN_4348; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4350 = 4'he == readIdx_1 ? data_14_pc : _GEN_4349; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4353 = 4'h1 == readIdx_1 ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4354 = 4'h2 == readIdx_1 ? data_2_pdInfo_valid : _GEN_4353; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4355 = 4'h3 == readIdx_1 ? data_3_pdInfo_valid : _GEN_4354; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4356 = 4'h4 == readIdx_1 ? data_4_pdInfo_valid : _GEN_4355; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4357 = 4'h5 == readIdx_1 ? data_5_pdInfo_valid : _GEN_4356; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4358 = 4'h6 == readIdx_1 ? data_6_pdInfo_valid : _GEN_4357; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4359 = 4'h7 == readIdx_1 ? data_7_pdInfo_valid : _GEN_4358; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4360 = 4'h8 == readIdx_1 ? data_8_pdInfo_valid : _GEN_4359; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4361 = 4'h9 == readIdx_1 ? data_9_pdInfo_valid : _GEN_4360; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4362 = 4'ha == readIdx_1 ? data_10_pdInfo_valid : _GEN_4361; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4363 = 4'hb == readIdx_1 ? data_11_pdInfo_valid : _GEN_4362; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4364 = 4'hc == readIdx_1 ? data_12_pdInfo_valid : _GEN_4363; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4365 = 4'hd == readIdx_1 ? data_13_pdInfo_valid : _GEN_4364; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4366 = 4'he == readIdx_1 ? data_14_pdInfo_valid : _GEN_4365; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4369 = 4'h1 == readIdx_1 ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4370 = 4'h2 == readIdx_1 ? data_2_pdInfo_isBr : _GEN_4369; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4371 = 4'h3 == readIdx_1 ? data_3_pdInfo_isBr : _GEN_4370; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4372 = 4'h4 == readIdx_1 ? data_4_pdInfo_isBr : _GEN_4371; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4373 = 4'h5 == readIdx_1 ? data_5_pdInfo_isBr : _GEN_4372; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4374 = 4'h6 == readIdx_1 ? data_6_pdInfo_isBr : _GEN_4373; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4375 = 4'h7 == readIdx_1 ? data_7_pdInfo_isBr : _GEN_4374; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4376 = 4'h8 == readIdx_1 ? data_8_pdInfo_isBr : _GEN_4375; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4377 = 4'h9 == readIdx_1 ? data_9_pdInfo_isBr : _GEN_4376; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4378 = 4'ha == readIdx_1 ? data_10_pdInfo_isBr : _GEN_4377; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4379 = 4'hb == readIdx_1 ? data_11_pdInfo_isBr : _GEN_4378; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4380 = 4'hc == readIdx_1 ? data_12_pdInfo_isBr : _GEN_4379; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4381 = 4'hd == readIdx_1 ? data_13_pdInfo_isBr : _GEN_4380; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4382 = 4'he == readIdx_1 ? data_14_pdInfo_isBr : _GEN_4381; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4385 = 4'h1 == readIdx_1 ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4386 = 4'h2 == readIdx_1 ? data_2_pdInfo_isJal : _GEN_4385; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4387 = 4'h3 == readIdx_1 ? data_3_pdInfo_isJal : _GEN_4386; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4388 = 4'h4 == readIdx_1 ? data_4_pdInfo_isJal : _GEN_4387; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4389 = 4'h5 == readIdx_1 ? data_5_pdInfo_isJal : _GEN_4388; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4390 = 4'h6 == readIdx_1 ? data_6_pdInfo_isJal : _GEN_4389; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4391 = 4'h7 == readIdx_1 ? data_7_pdInfo_isJal : _GEN_4390; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4392 = 4'h8 == readIdx_1 ? data_8_pdInfo_isJal : _GEN_4391; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4393 = 4'h9 == readIdx_1 ? data_9_pdInfo_isJal : _GEN_4392; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4394 = 4'ha == readIdx_1 ? data_10_pdInfo_isJal : _GEN_4393; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4395 = 4'hb == readIdx_1 ? data_11_pdInfo_isJal : _GEN_4394; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4396 = 4'hc == readIdx_1 ? data_12_pdInfo_isJal : _GEN_4395; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4397 = 4'hd == readIdx_1 ? data_13_pdInfo_isJal : _GEN_4396; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4398 = 4'he == readIdx_1 ? data_14_pdInfo_isJal : _GEN_4397; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4401 = 4'h1 == readIdx_1 ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4402 = 4'h2 == readIdx_1 ? data_2_pdInfo_isJalr : _GEN_4401; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4403 = 4'h3 == readIdx_1 ? data_3_pdInfo_isJalr : _GEN_4402; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4404 = 4'h4 == readIdx_1 ? data_4_pdInfo_isJalr : _GEN_4403; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4405 = 4'h5 == readIdx_1 ? data_5_pdInfo_isJalr : _GEN_4404; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4406 = 4'h6 == readIdx_1 ? data_6_pdInfo_isJalr : _GEN_4405; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4407 = 4'h7 == readIdx_1 ? data_7_pdInfo_isJalr : _GEN_4406; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4408 = 4'h8 == readIdx_1 ? data_8_pdInfo_isJalr : _GEN_4407; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4409 = 4'h9 == readIdx_1 ? data_9_pdInfo_isJalr : _GEN_4408; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4410 = 4'ha == readIdx_1 ? data_10_pdInfo_isJalr : _GEN_4409; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4411 = 4'hb == readIdx_1 ? data_11_pdInfo_isJalr : _GEN_4410; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4412 = 4'hc == readIdx_1 ? data_12_pdInfo_isJalr : _GEN_4411; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4413 = 4'hd == readIdx_1 ? data_13_pdInfo_isJalr : _GEN_4412; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4414 = 4'he == readIdx_1 ? data_14_pdInfo_isJalr : _GEN_4413; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4417 = 4'h1 == readIdx_1 ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4418 = 4'h2 == readIdx_1 ? data_2_pdInfo_isCall : _GEN_4417; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4419 = 4'h3 == readIdx_1 ? data_3_pdInfo_isCall : _GEN_4418; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4420 = 4'h4 == readIdx_1 ? data_4_pdInfo_isCall : _GEN_4419; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4421 = 4'h5 == readIdx_1 ? data_5_pdInfo_isCall : _GEN_4420; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4422 = 4'h6 == readIdx_1 ? data_6_pdInfo_isCall : _GEN_4421; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4423 = 4'h7 == readIdx_1 ? data_7_pdInfo_isCall : _GEN_4422; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4424 = 4'h8 == readIdx_1 ? data_8_pdInfo_isCall : _GEN_4423; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4425 = 4'h9 == readIdx_1 ? data_9_pdInfo_isCall : _GEN_4424; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4426 = 4'ha == readIdx_1 ? data_10_pdInfo_isCall : _GEN_4425; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4427 = 4'hb == readIdx_1 ? data_11_pdInfo_isCall : _GEN_4426; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4428 = 4'hc == readIdx_1 ? data_12_pdInfo_isCall : _GEN_4427; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4429 = 4'hd == readIdx_1 ? data_13_pdInfo_isCall : _GEN_4428; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4430 = 4'he == readIdx_1 ? data_14_pdInfo_isCall : _GEN_4429; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4433 = 4'h1 == readIdx_1 ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4434 = 4'h2 == readIdx_1 ? data_2_pdInfo_isRet : _GEN_4433; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4435 = 4'h3 == readIdx_1 ? data_3_pdInfo_isRet : _GEN_4434; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4436 = 4'h4 == readIdx_1 ? data_4_pdInfo_isRet : _GEN_4435; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4437 = 4'h5 == readIdx_1 ? data_5_pdInfo_isRet : _GEN_4436; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4438 = 4'h6 == readIdx_1 ? data_6_pdInfo_isRet : _GEN_4437; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4439 = 4'h7 == readIdx_1 ? data_7_pdInfo_isRet : _GEN_4438; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4440 = 4'h8 == readIdx_1 ? data_8_pdInfo_isRet : _GEN_4439; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4441 = 4'h9 == readIdx_1 ? data_9_pdInfo_isRet : _GEN_4440; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4442 = 4'ha == readIdx_1 ? data_10_pdInfo_isRet : _GEN_4441; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4443 = 4'hb == readIdx_1 ? data_11_pdInfo_isRet : _GEN_4442; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4444 = 4'hc == readIdx_1 ? data_12_pdInfo_isRet : _GEN_4443; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4445 = 4'hd == readIdx_1 ? data_13_pdInfo_isRet : _GEN_4444; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4446 = 4'he == readIdx_1 ? data_14_pdInfo_isRet : _GEN_4445; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4449 = 4'h1 == readIdx_1 ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4450 = 4'h2 == readIdx_1 ? data_2_pdInfo_jumpTarget : _GEN_4449; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4451 = 4'h3 == readIdx_1 ? data_3_pdInfo_jumpTarget : _GEN_4450; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4452 = 4'h4 == readIdx_1 ? data_4_pdInfo_jumpTarget : _GEN_4451; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4453 = 4'h5 == readIdx_1 ? data_5_pdInfo_jumpTarget : _GEN_4452; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4454 = 4'h6 == readIdx_1 ? data_6_pdInfo_jumpTarget : _GEN_4453; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4455 = 4'h7 == readIdx_1 ? data_7_pdInfo_jumpTarget : _GEN_4454; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4456 = 4'h8 == readIdx_1 ? data_8_pdInfo_jumpTarget : _GEN_4455; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4457 = 4'h9 == readIdx_1 ? data_9_pdInfo_jumpTarget : _GEN_4456; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4458 = 4'ha == readIdx_1 ? data_10_pdInfo_jumpTarget : _GEN_4457; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4459 = 4'hb == readIdx_1 ? data_11_pdInfo_jumpTarget : _GEN_4458; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4460 = 4'hc == readIdx_1 ? data_12_pdInfo_jumpTarget : _GEN_4459; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4461 = 4'hd == readIdx_1 ? data_13_pdInfo_jumpTarget : _GEN_4460; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4462 = 4'he == readIdx_1 ? data_14_pdInfo_jumpTarget : _GEN_4461; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4465 = 4'h1 == readIdx_1 ? data_1_bpuInfo_pc : data_0_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4466 = 4'h2 == readIdx_1 ? data_2_bpuInfo_pc : _GEN_4465; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4467 = 4'h3 == readIdx_1 ? data_3_bpuInfo_pc : _GEN_4466; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4468 = 4'h4 == readIdx_1 ? data_4_bpuInfo_pc : _GEN_4467; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4469 = 4'h5 == readIdx_1 ? data_5_bpuInfo_pc : _GEN_4468; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4470 = 4'h6 == readIdx_1 ? data_6_bpuInfo_pc : _GEN_4469; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4471 = 4'h7 == readIdx_1 ? data_7_bpuInfo_pc : _GEN_4470; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4472 = 4'h8 == readIdx_1 ? data_8_bpuInfo_pc : _GEN_4471; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4473 = 4'h9 == readIdx_1 ? data_9_bpuInfo_pc : _GEN_4472; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4474 = 4'ha == readIdx_1 ? data_10_bpuInfo_pc : _GEN_4473; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4475 = 4'hb == readIdx_1 ? data_11_bpuInfo_pc : _GEN_4474; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4476 = 4'hc == readIdx_1 ? data_12_bpuInfo_pc : _GEN_4475; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4477 = 4'hd == readIdx_1 ? data_13_bpuInfo_pc : _GEN_4476; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4478 = 4'he == readIdx_1 ? data_14_bpuInfo_pc : _GEN_4477; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4481 = 4'h1 == readIdx_1 ? data_1_bpuInfo_fallThrough : data_0_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4482 = 4'h2 == readIdx_1 ? data_2_bpuInfo_fallThrough : _GEN_4481; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4483 = 4'h3 == readIdx_1 ? data_3_bpuInfo_fallThrough : _GEN_4482; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4484 = 4'h4 == readIdx_1 ? data_4_bpuInfo_fallThrough : _GEN_4483; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4485 = 4'h5 == readIdx_1 ? data_5_bpuInfo_fallThrough : _GEN_4484; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4486 = 4'h6 == readIdx_1 ? data_6_bpuInfo_fallThrough : _GEN_4485; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4487 = 4'h7 == readIdx_1 ? data_7_bpuInfo_fallThrough : _GEN_4486; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4488 = 4'h8 == readIdx_1 ? data_8_bpuInfo_fallThrough : _GEN_4487; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4489 = 4'h9 == readIdx_1 ? data_9_bpuInfo_fallThrough : _GEN_4488; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4490 = 4'ha == readIdx_1 ? data_10_bpuInfo_fallThrough : _GEN_4489; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4491 = 4'hb == readIdx_1 ? data_11_bpuInfo_fallThrough : _GEN_4490; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4492 = 4'hc == readIdx_1 ? data_12_bpuInfo_fallThrough : _GEN_4491; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4493 = 4'hd == readIdx_1 ? data_13_bpuInfo_fallThrough : _GEN_4492; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4494 = 4'he == readIdx_1 ? data_14_bpuInfo_fallThrough : _GEN_4493; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4497 = 4'h1 == readIdx_1 ? data_1_bpuInfo_taken : data_0_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4498 = 4'h2 == readIdx_1 ? data_2_bpuInfo_taken : _GEN_4497; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4499 = 4'h3 == readIdx_1 ? data_3_bpuInfo_taken : _GEN_4498; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4500 = 4'h4 == readIdx_1 ? data_4_bpuInfo_taken : _GEN_4499; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4501 = 4'h5 == readIdx_1 ? data_5_bpuInfo_taken : _GEN_4500; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4502 = 4'h6 == readIdx_1 ? data_6_bpuInfo_taken : _GEN_4501; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4503 = 4'h7 == readIdx_1 ? data_7_bpuInfo_taken : _GEN_4502; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4504 = 4'h8 == readIdx_1 ? data_8_bpuInfo_taken : _GEN_4503; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4505 = 4'h9 == readIdx_1 ? data_9_bpuInfo_taken : _GEN_4504; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4506 = 4'ha == readIdx_1 ? data_10_bpuInfo_taken : _GEN_4505; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4507 = 4'hb == readIdx_1 ? data_11_bpuInfo_taken : _GEN_4506; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4508 = 4'hc == readIdx_1 ? data_12_bpuInfo_taken : _GEN_4507; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4509 = 4'hd == readIdx_1 ? data_13_bpuInfo_taken : _GEN_4508; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4510 = 4'he == readIdx_1 ? data_14_bpuInfo_taken : _GEN_4509; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4513 = 4'h1 == readIdx_1 ? data_1_bpuInfo_target : data_0_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4514 = 4'h2 == readIdx_1 ? data_2_bpuInfo_target : _GEN_4513; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4515 = 4'h3 == readIdx_1 ? data_3_bpuInfo_target : _GEN_4514; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4516 = 4'h4 == readIdx_1 ? data_4_bpuInfo_target : _GEN_4515; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4517 = 4'h5 == readIdx_1 ? data_5_bpuInfo_target : _GEN_4516; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4518 = 4'h6 == readIdx_1 ? data_6_bpuInfo_target : _GEN_4517; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4519 = 4'h7 == readIdx_1 ? data_7_bpuInfo_target : _GEN_4518; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4520 = 4'h8 == readIdx_1 ? data_8_bpuInfo_target : _GEN_4519; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4521 = 4'h9 == readIdx_1 ? data_9_bpuInfo_target : _GEN_4520; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4522 = 4'ha == readIdx_1 ? data_10_bpuInfo_target : _GEN_4521; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4523 = 4'hb == readIdx_1 ? data_11_bpuInfo_target : _GEN_4522; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4524 = 4'hc == readIdx_1 ? data_12_bpuInfo_target : _GEN_4523; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4525 = 4'hd == readIdx_1 ? data_13_bpuInfo_target : _GEN_4524; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4526 = 4'he == readIdx_1 ? data_14_bpuInfo_target : _GEN_4525; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4529 = 4'h1 == readIdx_1 ? data_1_bpuInfo_takenOffset : data_0_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4530 = 4'h2 == readIdx_1 ? data_2_bpuInfo_takenOffset : _GEN_4529; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4531 = 4'h3 == readIdx_1 ? data_3_bpuInfo_takenOffset : _GEN_4530; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4532 = 4'h4 == readIdx_1 ? data_4_bpuInfo_takenOffset : _GEN_4531; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4533 = 4'h5 == readIdx_1 ? data_5_bpuInfo_takenOffset : _GEN_4532; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4534 = 4'h6 == readIdx_1 ? data_6_bpuInfo_takenOffset : _GEN_4533; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4535 = 4'h7 == readIdx_1 ? data_7_bpuInfo_takenOffset : _GEN_4534; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4536 = 4'h8 == readIdx_1 ? data_8_bpuInfo_takenOffset : _GEN_4535; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4537 = 4'h9 == readIdx_1 ? data_9_bpuInfo_takenOffset : _GEN_4536; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4538 = 4'ha == readIdx_1 ? data_10_bpuInfo_takenOffset : _GEN_4537; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4539 = 4'hb == readIdx_1 ? data_11_bpuInfo_takenOffset : _GEN_4538; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4540 = 4'hc == readIdx_1 ? data_12_bpuInfo_takenOffset : _GEN_4539; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4541 = 4'hd == readIdx_1 ? data_13_bpuInfo_takenOffset : _GEN_4540; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4542 = 4'he == readIdx_1 ? data_14_bpuInfo_takenOffset : _GEN_4541; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4545 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_valid : data_0_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4546 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_valid : _GEN_4545; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4547 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_valid : _GEN_4546; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4548 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_valid : _GEN_4547; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4549 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_valid : _GEN_4548; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4550 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_valid : _GEN_4549; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4551 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_valid : _GEN_4550; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4552 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_valid : _GEN_4551; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4553 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_valid : _GEN_4552; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4554 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_valid : _GEN_4553; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4555 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_valid : _GEN_4554; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4556 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_valid : _GEN_4555; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4557 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_valid : _GEN_4556; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4558 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_valid : _GEN_4557; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4561 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_btbHit : data_0_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4562 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_btbHit : _GEN_4561; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4563 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_btbHit : _GEN_4562; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4564 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_btbHit : _GEN_4563; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4565 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_btbHit : _GEN_4564; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4566 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_btbHit : _GEN_4565; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4567 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_btbHit : _GEN_4566; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4568 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_btbHit : _GEN_4567; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4569 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_btbHit : _GEN_4568; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4570 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_btbHit : _GEN_4569; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4571 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_btbHit : _GEN_4570; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4572 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_btbHit : _GEN_4571; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4573 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_btbHit : _GEN_4572; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4574 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_btbHit : _GEN_4573; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4577 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_btbIsJalr : data_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4578 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_btbIsJalr : _GEN_4577; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4579 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_btbIsJalr : _GEN_4578; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4580 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_btbIsJalr : _GEN_4579; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4581 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_btbIsJalr : _GEN_4580; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4582 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_btbIsJalr : _GEN_4581; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4583 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_btbIsJalr : _GEN_4582; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4584 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_btbIsJalr : _GEN_4583; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4585 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_btbIsJalr : _GEN_4584; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4586 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_btbIsJalr : _GEN_4585; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4587 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_btbIsJalr : _GEN_4586; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4588 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_btbIsJalr : _GEN_4587; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4589 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_btbIsJalr : _GEN_4588; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4590 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_btbIsJalr : _GEN_4589; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4593 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_btbIsJal : data_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4594 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_btbIsJal : _GEN_4593; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4595 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_btbIsJal : _GEN_4594; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4596 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_btbIsJal : _GEN_4595; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4597 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_btbIsJal : _GEN_4596; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4598 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_btbIsJal : _GEN_4597; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4599 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_btbIsJal : _GEN_4598; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4600 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_btbIsJal : _GEN_4599; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4601 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_btbIsJal : _GEN_4600; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4602 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_btbIsJal : _GEN_4601; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4603 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_btbIsJal : _GEN_4602; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4604 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_btbIsJal : _GEN_4603; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4605 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_btbIsJal : _GEN_4604; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4606 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_btbIsJal : _GEN_4605; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4609 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_btbIsCall : data_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4610 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_btbIsCall : _GEN_4609; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4611 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_btbIsCall : _GEN_4610; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4612 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_btbIsCall : _GEN_4611; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4613 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_btbIsCall : _GEN_4612; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4614 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_btbIsCall : _GEN_4613; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4615 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_btbIsCall : _GEN_4614; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4616 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_btbIsCall : _GEN_4615; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4617 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_btbIsCall : _GEN_4616; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4618 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_btbIsCall : _GEN_4617; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4619 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_btbIsCall : _GEN_4618; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4620 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_btbIsCall : _GEN_4619; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4621 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_btbIsCall : _GEN_4620; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4622 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_btbIsCall : _GEN_4621; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4625 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_btbIsRet : data_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4626 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_btbIsRet : _GEN_4625; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4627 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_btbIsRet : _GEN_4626; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4628 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_btbIsRet : _GEN_4627; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4629 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_btbIsRet : _GEN_4628; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4630 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_btbIsRet : _GEN_4629; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4631 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_btbIsRet : _GEN_4630; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4632 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_btbIsRet : _GEN_4631; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4633 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_btbIsRet : _GEN_4632; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4634 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_btbIsRet : _GEN_4633; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4635 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_btbIsRet : _GEN_4634; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4636 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_btbIsRet : _GEN_4635; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4637 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_btbIsRet : _GEN_4636; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4638 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_btbIsRet : _GEN_4637; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4641 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_btbOffset : data_0_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4642 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_btbOffset : _GEN_4641; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4643 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_btbOffset : _GEN_4642; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4644 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_btbOffset : _GEN_4643; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4645 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_btbOffset : _GEN_4644; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4646 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_btbOffset : _GEN_4645; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4647 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_btbOffset : _GEN_4646; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4648 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_btbOffset : _GEN_4647; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4649 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_btbOffset : _GEN_4648; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4650 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_btbOffset : _GEN_4649; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4651 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_btbOffset : _GEN_4650; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4652 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_btbOffset : _GEN_4651; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4653 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_btbOffset : _GEN_4652; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4654 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_btbOffset : _GEN_4653; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4657 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_phtCounter : data_0_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4658 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_phtCounter : _GEN_4657; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4659 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_phtCounter : _GEN_4658; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4660 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_phtCounter : _GEN_4659; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4661 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_phtCounter : _GEN_4660; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4662 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_phtCounter : _GEN_4661; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4663 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_phtCounter : _GEN_4662; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4664 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_phtCounter : _GEN_4663; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4665 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_phtCounter : _GEN_4664; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4666 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_phtCounter : _GEN_4665; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4667 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_phtCounter : _GEN_4666; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4668 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_phtCounter : _GEN_4667; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4669 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_phtCounter : _GEN_4668; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_4670 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_phtCounter : _GEN_4669; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4673 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_rasTop : data_0_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4674 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_rasTop : _GEN_4673; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4675 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_rasTop : _GEN_4674; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4676 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_rasTop : _GEN_4675; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4677 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_rasTop : _GEN_4676; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4678 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_rasTop : _GEN_4677; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4679 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_rasTop : _GEN_4678; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4680 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_rasTop : _GEN_4679; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4681 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_rasTop : _GEN_4680; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4682 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_rasTop : _GEN_4681; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4683 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_rasTop : _GEN_4682; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4684 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_rasTop : _GEN_4683; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4685 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_rasTop : _GEN_4684; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_4686 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_rasTop : _GEN_4685; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4689 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_predTaken : data_0_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4690 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_predTaken : _GEN_4689; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4691 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_predTaken : _GEN_4690; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4692 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_predTaken : _GEN_4691; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4693 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_predTaken : _GEN_4692; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4694 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_predTaken : _GEN_4693; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4695 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_predTaken : _GEN_4694; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4696 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_predTaken : _GEN_4695; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4697 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_predTaken : _GEN_4696; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4698 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_predTaken : _GEN_4697; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4699 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_predTaken : _GEN_4698; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4700 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_predTaken : _GEN_4699; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4701 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_predTaken : _GEN_4700; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4702 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_predTaken : _GEN_4701; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4705 = 4'h1 == readIdx_1 ? data_1_bpuInfo_meta_predTarget : data_0_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4706 = 4'h2 == readIdx_1 ? data_2_bpuInfo_meta_predTarget : _GEN_4705; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4707 = 4'h3 == readIdx_1 ? data_3_bpuInfo_meta_predTarget : _GEN_4706; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4708 = 4'h4 == readIdx_1 ? data_4_bpuInfo_meta_predTarget : _GEN_4707; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4709 = 4'h5 == readIdx_1 ? data_5_bpuInfo_meta_predTarget : _GEN_4708; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4710 = 4'h6 == readIdx_1 ? data_6_bpuInfo_meta_predTarget : _GEN_4709; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4711 = 4'h7 == readIdx_1 ? data_7_bpuInfo_meta_predTarget : _GEN_4710; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4712 = 4'h8 == readIdx_1 ? data_8_bpuInfo_meta_predTarget : _GEN_4711; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4713 = 4'h9 == readIdx_1 ? data_9_bpuInfo_meta_predTarget : _GEN_4712; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4714 = 4'ha == readIdx_1 ? data_10_bpuInfo_meta_predTarget : _GEN_4713; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4715 = 4'hb == readIdx_1 ? data_11_bpuInfo_meta_predTarget : _GEN_4714; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4716 = 4'hc == readIdx_1 ? data_12_bpuInfo_meta_predTarget : _GEN_4715; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4717 = 4'hd == readIdx_1 ? data_13_bpuInfo_meta_predTarget : _GEN_4716; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4718 = 4'he == readIdx_1 ? data_14_bpuInfo_meta_predTarget : _GEN_4717; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4721 = 4'h1 == readIdx_1 ? data_1_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4722 = 4'h2 == readIdx_1 ? data_2_exception_excpTlbRefill : _GEN_4721; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4723 = 4'h3 == readIdx_1 ? data_3_exception_excpTlbRefill : _GEN_4722; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4724 = 4'h4 == readIdx_1 ? data_4_exception_excpTlbRefill : _GEN_4723; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4725 = 4'h5 == readIdx_1 ? data_5_exception_excpTlbRefill : _GEN_4724; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4726 = 4'h6 == readIdx_1 ? data_6_exception_excpTlbRefill : _GEN_4725; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4727 = 4'h7 == readIdx_1 ? data_7_exception_excpTlbRefill : _GEN_4726; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4728 = 4'h8 == readIdx_1 ? data_8_exception_excpTlbRefill : _GEN_4727; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4729 = 4'h9 == readIdx_1 ? data_9_exception_excpTlbRefill : _GEN_4728; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4730 = 4'ha == readIdx_1 ? data_10_exception_excpTlbRefill : _GEN_4729; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4731 = 4'hb == readIdx_1 ? data_11_exception_excpTlbRefill : _GEN_4730; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4732 = 4'hc == readIdx_1 ? data_12_exception_excpTlbRefill : _GEN_4731; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4733 = 4'hd == readIdx_1 ? data_13_exception_excpTlbRefill : _GEN_4732; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4734 = 4'he == readIdx_1 ? data_14_exception_excpTlbRefill : _GEN_4733; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4737 = 4'h1 == readIdx_1 ? data_1_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4738 = 4'h2 == readIdx_1 ? data_2_exception_excpTlbPif : _GEN_4737; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4739 = 4'h3 == readIdx_1 ? data_3_exception_excpTlbPif : _GEN_4738; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4740 = 4'h4 == readIdx_1 ? data_4_exception_excpTlbPif : _GEN_4739; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4741 = 4'h5 == readIdx_1 ? data_5_exception_excpTlbPif : _GEN_4740; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4742 = 4'h6 == readIdx_1 ? data_6_exception_excpTlbPif : _GEN_4741; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4743 = 4'h7 == readIdx_1 ? data_7_exception_excpTlbPif : _GEN_4742; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4744 = 4'h8 == readIdx_1 ? data_8_exception_excpTlbPif : _GEN_4743; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4745 = 4'h9 == readIdx_1 ? data_9_exception_excpTlbPif : _GEN_4744; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4746 = 4'ha == readIdx_1 ? data_10_exception_excpTlbPif : _GEN_4745; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4747 = 4'hb == readIdx_1 ? data_11_exception_excpTlbPif : _GEN_4746; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4748 = 4'hc == readIdx_1 ? data_12_exception_excpTlbPif : _GEN_4747; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4749 = 4'hd == readIdx_1 ? data_13_exception_excpTlbPif : _GEN_4748; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4750 = 4'he == readIdx_1 ? data_14_exception_excpTlbPif : _GEN_4749; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4753 = 4'h1 == readIdx_1 ? data_1_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4754 = 4'h2 == readIdx_1 ? data_2_exception_excpTlbPpi : _GEN_4753; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4755 = 4'h3 == readIdx_1 ? data_3_exception_excpTlbPpi : _GEN_4754; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4756 = 4'h4 == readIdx_1 ? data_4_exception_excpTlbPpi : _GEN_4755; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4757 = 4'h5 == readIdx_1 ? data_5_exception_excpTlbPpi : _GEN_4756; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4758 = 4'h6 == readIdx_1 ? data_6_exception_excpTlbPpi : _GEN_4757; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4759 = 4'h7 == readIdx_1 ? data_7_exception_excpTlbPpi : _GEN_4758; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4760 = 4'h8 == readIdx_1 ? data_8_exception_excpTlbPpi : _GEN_4759; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4761 = 4'h9 == readIdx_1 ? data_9_exception_excpTlbPpi : _GEN_4760; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4762 = 4'ha == readIdx_1 ? data_10_exception_excpTlbPpi : _GEN_4761; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4763 = 4'hb == readIdx_1 ? data_11_exception_excpTlbPpi : _GEN_4762; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4764 = 4'hc == readIdx_1 ? data_12_exception_excpTlbPpi : _GEN_4763; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4765 = 4'hd == readIdx_1 ? data_13_exception_excpTlbPpi : _GEN_4764; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4766 = 4'he == readIdx_1 ? data_14_exception_excpTlbPpi : _GEN_4765; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4769 = 4'h1 == readIdx_1 ? data_1_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4770 = 4'h2 == readIdx_1 ? data_2_exception_excpAdef : _GEN_4769; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4771 = 4'h3 == readIdx_1 ? data_3_exception_excpAdef : _GEN_4770; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4772 = 4'h4 == readIdx_1 ? data_4_exception_excpAdef : _GEN_4771; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4773 = 4'h5 == readIdx_1 ? data_5_exception_excpAdef : _GEN_4772; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4774 = 4'h6 == readIdx_1 ? data_6_exception_excpAdef : _GEN_4773; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4775 = 4'h7 == readIdx_1 ? data_7_exception_excpAdef : _GEN_4774; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4776 = 4'h8 == readIdx_1 ? data_8_exception_excpAdef : _GEN_4775; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4777 = 4'h9 == readIdx_1 ? data_9_exception_excpAdef : _GEN_4776; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4778 = 4'ha == readIdx_1 ? data_10_exception_excpAdef : _GEN_4777; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4779 = 4'hb == readIdx_1 ? data_11_exception_excpAdef : _GEN_4778; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4780 = 4'hc == readIdx_1 ? data_12_exception_excpAdef : _GEN_4779; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4781 = 4'hd == readIdx_1 ? data_13_exception_excpAdef : _GEN_4780; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4782 = 4'he == readIdx_1 ? data_14_exception_excpAdef : _GEN_4781; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4785 = 4'h1 == readIdx_1 ? data_1_exception_excpAle : data_0_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4786 = 4'h2 == readIdx_1 ? data_2_exception_excpAle : _GEN_4785; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4787 = 4'h3 == readIdx_1 ? data_3_exception_excpAle : _GEN_4786; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4788 = 4'h4 == readIdx_1 ? data_4_exception_excpAle : _GEN_4787; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4789 = 4'h5 == readIdx_1 ? data_5_exception_excpAle : _GEN_4788; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4790 = 4'h6 == readIdx_1 ? data_6_exception_excpAle : _GEN_4789; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4791 = 4'h7 == readIdx_1 ? data_7_exception_excpAle : _GEN_4790; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4792 = 4'h8 == readIdx_1 ? data_8_exception_excpAle : _GEN_4791; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4793 = 4'h9 == readIdx_1 ? data_9_exception_excpAle : _GEN_4792; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4794 = 4'ha == readIdx_1 ? data_10_exception_excpAle : _GEN_4793; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4795 = 4'hb == readIdx_1 ? data_11_exception_excpAle : _GEN_4794; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4796 = 4'hc == readIdx_1 ? data_12_exception_excpAle : _GEN_4795; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4797 = 4'hd == readIdx_1 ? data_13_exception_excpAle : _GEN_4796; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4798 = 4'he == readIdx_1 ? data_14_exception_excpAle : _GEN_4797; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  canDeq_2 = count > 5'h2; // @[src/main/scala/util/CircularQueue.scala 211:24]
  wire [3:0] readIdx_2 = deqPtr_value + 4'h2; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [31:0] _GEN_4801 = 4'h1 == readIdx_2 ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4802 = 4'h2 == readIdx_2 ? data_2_instr : _GEN_4801; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4803 = 4'h3 == readIdx_2 ? data_3_instr : _GEN_4802; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4804 = 4'h4 == readIdx_2 ? data_4_instr : _GEN_4803; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4805 = 4'h5 == readIdx_2 ? data_5_instr : _GEN_4804; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4806 = 4'h6 == readIdx_2 ? data_6_instr : _GEN_4805; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4807 = 4'h7 == readIdx_2 ? data_7_instr : _GEN_4806; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4808 = 4'h8 == readIdx_2 ? data_8_instr : _GEN_4807; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4809 = 4'h9 == readIdx_2 ? data_9_instr : _GEN_4808; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4810 = 4'ha == readIdx_2 ? data_10_instr : _GEN_4809; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4811 = 4'hb == readIdx_2 ? data_11_instr : _GEN_4810; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4812 = 4'hc == readIdx_2 ? data_12_instr : _GEN_4811; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4813 = 4'hd == readIdx_2 ? data_13_instr : _GEN_4812; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4814 = 4'he == readIdx_2 ? data_14_instr : _GEN_4813; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4817 = 4'h1 == readIdx_2 ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4818 = 4'h2 == readIdx_2 ? data_2_pc : _GEN_4817; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4819 = 4'h3 == readIdx_2 ? data_3_pc : _GEN_4818; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4820 = 4'h4 == readIdx_2 ? data_4_pc : _GEN_4819; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4821 = 4'h5 == readIdx_2 ? data_5_pc : _GEN_4820; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4822 = 4'h6 == readIdx_2 ? data_6_pc : _GEN_4821; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4823 = 4'h7 == readIdx_2 ? data_7_pc : _GEN_4822; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4824 = 4'h8 == readIdx_2 ? data_8_pc : _GEN_4823; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4825 = 4'h9 == readIdx_2 ? data_9_pc : _GEN_4824; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4826 = 4'ha == readIdx_2 ? data_10_pc : _GEN_4825; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4827 = 4'hb == readIdx_2 ? data_11_pc : _GEN_4826; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4828 = 4'hc == readIdx_2 ? data_12_pc : _GEN_4827; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4829 = 4'hd == readIdx_2 ? data_13_pc : _GEN_4828; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4830 = 4'he == readIdx_2 ? data_14_pc : _GEN_4829; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4833 = 4'h1 == readIdx_2 ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4834 = 4'h2 == readIdx_2 ? data_2_pdInfo_valid : _GEN_4833; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4835 = 4'h3 == readIdx_2 ? data_3_pdInfo_valid : _GEN_4834; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4836 = 4'h4 == readIdx_2 ? data_4_pdInfo_valid : _GEN_4835; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4837 = 4'h5 == readIdx_2 ? data_5_pdInfo_valid : _GEN_4836; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4838 = 4'h6 == readIdx_2 ? data_6_pdInfo_valid : _GEN_4837; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4839 = 4'h7 == readIdx_2 ? data_7_pdInfo_valid : _GEN_4838; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4840 = 4'h8 == readIdx_2 ? data_8_pdInfo_valid : _GEN_4839; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4841 = 4'h9 == readIdx_2 ? data_9_pdInfo_valid : _GEN_4840; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4842 = 4'ha == readIdx_2 ? data_10_pdInfo_valid : _GEN_4841; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4843 = 4'hb == readIdx_2 ? data_11_pdInfo_valid : _GEN_4842; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4844 = 4'hc == readIdx_2 ? data_12_pdInfo_valid : _GEN_4843; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4845 = 4'hd == readIdx_2 ? data_13_pdInfo_valid : _GEN_4844; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4846 = 4'he == readIdx_2 ? data_14_pdInfo_valid : _GEN_4845; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4849 = 4'h1 == readIdx_2 ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4850 = 4'h2 == readIdx_2 ? data_2_pdInfo_isBr : _GEN_4849; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4851 = 4'h3 == readIdx_2 ? data_3_pdInfo_isBr : _GEN_4850; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4852 = 4'h4 == readIdx_2 ? data_4_pdInfo_isBr : _GEN_4851; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4853 = 4'h5 == readIdx_2 ? data_5_pdInfo_isBr : _GEN_4852; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4854 = 4'h6 == readIdx_2 ? data_6_pdInfo_isBr : _GEN_4853; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4855 = 4'h7 == readIdx_2 ? data_7_pdInfo_isBr : _GEN_4854; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4856 = 4'h8 == readIdx_2 ? data_8_pdInfo_isBr : _GEN_4855; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4857 = 4'h9 == readIdx_2 ? data_9_pdInfo_isBr : _GEN_4856; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4858 = 4'ha == readIdx_2 ? data_10_pdInfo_isBr : _GEN_4857; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4859 = 4'hb == readIdx_2 ? data_11_pdInfo_isBr : _GEN_4858; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4860 = 4'hc == readIdx_2 ? data_12_pdInfo_isBr : _GEN_4859; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4861 = 4'hd == readIdx_2 ? data_13_pdInfo_isBr : _GEN_4860; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4862 = 4'he == readIdx_2 ? data_14_pdInfo_isBr : _GEN_4861; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4865 = 4'h1 == readIdx_2 ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4866 = 4'h2 == readIdx_2 ? data_2_pdInfo_isJal : _GEN_4865; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4867 = 4'h3 == readIdx_2 ? data_3_pdInfo_isJal : _GEN_4866; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4868 = 4'h4 == readIdx_2 ? data_4_pdInfo_isJal : _GEN_4867; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4869 = 4'h5 == readIdx_2 ? data_5_pdInfo_isJal : _GEN_4868; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4870 = 4'h6 == readIdx_2 ? data_6_pdInfo_isJal : _GEN_4869; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4871 = 4'h7 == readIdx_2 ? data_7_pdInfo_isJal : _GEN_4870; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4872 = 4'h8 == readIdx_2 ? data_8_pdInfo_isJal : _GEN_4871; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4873 = 4'h9 == readIdx_2 ? data_9_pdInfo_isJal : _GEN_4872; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4874 = 4'ha == readIdx_2 ? data_10_pdInfo_isJal : _GEN_4873; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4875 = 4'hb == readIdx_2 ? data_11_pdInfo_isJal : _GEN_4874; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4876 = 4'hc == readIdx_2 ? data_12_pdInfo_isJal : _GEN_4875; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4877 = 4'hd == readIdx_2 ? data_13_pdInfo_isJal : _GEN_4876; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4878 = 4'he == readIdx_2 ? data_14_pdInfo_isJal : _GEN_4877; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4881 = 4'h1 == readIdx_2 ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4882 = 4'h2 == readIdx_2 ? data_2_pdInfo_isJalr : _GEN_4881; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4883 = 4'h3 == readIdx_2 ? data_3_pdInfo_isJalr : _GEN_4882; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4884 = 4'h4 == readIdx_2 ? data_4_pdInfo_isJalr : _GEN_4883; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4885 = 4'h5 == readIdx_2 ? data_5_pdInfo_isJalr : _GEN_4884; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4886 = 4'h6 == readIdx_2 ? data_6_pdInfo_isJalr : _GEN_4885; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4887 = 4'h7 == readIdx_2 ? data_7_pdInfo_isJalr : _GEN_4886; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4888 = 4'h8 == readIdx_2 ? data_8_pdInfo_isJalr : _GEN_4887; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4889 = 4'h9 == readIdx_2 ? data_9_pdInfo_isJalr : _GEN_4888; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4890 = 4'ha == readIdx_2 ? data_10_pdInfo_isJalr : _GEN_4889; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4891 = 4'hb == readIdx_2 ? data_11_pdInfo_isJalr : _GEN_4890; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4892 = 4'hc == readIdx_2 ? data_12_pdInfo_isJalr : _GEN_4891; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4893 = 4'hd == readIdx_2 ? data_13_pdInfo_isJalr : _GEN_4892; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4894 = 4'he == readIdx_2 ? data_14_pdInfo_isJalr : _GEN_4893; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4897 = 4'h1 == readIdx_2 ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4898 = 4'h2 == readIdx_2 ? data_2_pdInfo_isCall : _GEN_4897; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4899 = 4'h3 == readIdx_2 ? data_3_pdInfo_isCall : _GEN_4898; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4900 = 4'h4 == readIdx_2 ? data_4_pdInfo_isCall : _GEN_4899; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4901 = 4'h5 == readIdx_2 ? data_5_pdInfo_isCall : _GEN_4900; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4902 = 4'h6 == readIdx_2 ? data_6_pdInfo_isCall : _GEN_4901; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4903 = 4'h7 == readIdx_2 ? data_7_pdInfo_isCall : _GEN_4902; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4904 = 4'h8 == readIdx_2 ? data_8_pdInfo_isCall : _GEN_4903; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4905 = 4'h9 == readIdx_2 ? data_9_pdInfo_isCall : _GEN_4904; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4906 = 4'ha == readIdx_2 ? data_10_pdInfo_isCall : _GEN_4905; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4907 = 4'hb == readIdx_2 ? data_11_pdInfo_isCall : _GEN_4906; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4908 = 4'hc == readIdx_2 ? data_12_pdInfo_isCall : _GEN_4907; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4909 = 4'hd == readIdx_2 ? data_13_pdInfo_isCall : _GEN_4908; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4910 = 4'he == readIdx_2 ? data_14_pdInfo_isCall : _GEN_4909; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4913 = 4'h1 == readIdx_2 ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4914 = 4'h2 == readIdx_2 ? data_2_pdInfo_isRet : _GEN_4913; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4915 = 4'h3 == readIdx_2 ? data_3_pdInfo_isRet : _GEN_4914; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4916 = 4'h4 == readIdx_2 ? data_4_pdInfo_isRet : _GEN_4915; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4917 = 4'h5 == readIdx_2 ? data_5_pdInfo_isRet : _GEN_4916; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4918 = 4'h6 == readIdx_2 ? data_6_pdInfo_isRet : _GEN_4917; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4919 = 4'h7 == readIdx_2 ? data_7_pdInfo_isRet : _GEN_4918; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4920 = 4'h8 == readIdx_2 ? data_8_pdInfo_isRet : _GEN_4919; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4921 = 4'h9 == readIdx_2 ? data_9_pdInfo_isRet : _GEN_4920; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4922 = 4'ha == readIdx_2 ? data_10_pdInfo_isRet : _GEN_4921; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4923 = 4'hb == readIdx_2 ? data_11_pdInfo_isRet : _GEN_4922; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4924 = 4'hc == readIdx_2 ? data_12_pdInfo_isRet : _GEN_4923; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4925 = 4'hd == readIdx_2 ? data_13_pdInfo_isRet : _GEN_4924; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4926 = 4'he == readIdx_2 ? data_14_pdInfo_isRet : _GEN_4925; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4929 = 4'h1 == readIdx_2 ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4930 = 4'h2 == readIdx_2 ? data_2_pdInfo_jumpTarget : _GEN_4929; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4931 = 4'h3 == readIdx_2 ? data_3_pdInfo_jumpTarget : _GEN_4930; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4932 = 4'h4 == readIdx_2 ? data_4_pdInfo_jumpTarget : _GEN_4931; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4933 = 4'h5 == readIdx_2 ? data_5_pdInfo_jumpTarget : _GEN_4932; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4934 = 4'h6 == readIdx_2 ? data_6_pdInfo_jumpTarget : _GEN_4933; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4935 = 4'h7 == readIdx_2 ? data_7_pdInfo_jumpTarget : _GEN_4934; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4936 = 4'h8 == readIdx_2 ? data_8_pdInfo_jumpTarget : _GEN_4935; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4937 = 4'h9 == readIdx_2 ? data_9_pdInfo_jumpTarget : _GEN_4936; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4938 = 4'ha == readIdx_2 ? data_10_pdInfo_jumpTarget : _GEN_4937; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4939 = 4'hb == readIdx_2 ? data_11_pdInfo_jumpTarget : _GEN_4938; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4940 = 4'hc == readIdx_2 ? data_12_pdInfo_jumpTarget : _GEN_4939; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4941 = 4'hd == readIdx_2 ? data_13_pdInfo_jumpTarget : _GEN_4940; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4942 = 4'he == readIdx_2 ? data_14_pdInfo_jumpTarget : _GEN_4941; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4945 = 4'h1 == readIdx_2 ? data_1_bpuInfo_pc : data_0_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4946 = 4'h2 == readIdx_2 ? data_2_bpuInfo_pc : _GEN_4945; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4947 = 4'h3 == readIdx_2 ? data_3_bpuInfo_pc : _GEN_4946; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4948 = 4'h4 == readIdx_2 ? data_4_bpuInfo_pc : _GEN_4947; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4949 = 4'h5 == readIdx_2 ? data_5_bpuInfo_pc : _GEN_4948; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4950 = 4'h6 == readIdx_2 ? data_6_bpuInfo_pc : _GEN_4949; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4951 = 4'h7 == readIdx_2 ? data_7_bpuInfo_pc : _GEN_4950; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4952 = 4'h8 == readIdx_2 ? data_8_bpuInfo_pc : _GEN_4951; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4953 = 4'h9 == readIdx_2 ? data_9_bpuInfo_pc : _GEN_4952; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4954 = 4'ha == readIdx_2 ? data_10_bpuInfo_pc : _GEN_4953; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4955 = 4'hb == readIdx_2 ? data_11_bpuInfo_pc : _GEN_4954; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4956 = 4'hc == readIdx_2 ? data_12_bpuInfo_pc : _GEN_4955; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4957 = 4'hd == readIdx_2 ? data_13_bpuInfo_pc : _GEN_4956; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4958 = 4'he == readIdx_2 ? data_14_bpuInfo_pc : _GEN_4957; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4961 = 4'h1 == readIdx_2 ? data_1_bpuInfo_fallThrough : data_0_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4962 = 4'h2 == readIdx_2 ? data_2_bpuInfo_fallThrough : _GEN_4961; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4963 = 4'h3 == readIdx_2 ? data_3_bpuInfo_fallThrough : _GEN_4962; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4964 = 4'h4 == readIdx_2 ? data_4_bpuInfo_fallThrough : _GEN_4963; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4965 = 4'h5 == readIdx_2 ? data_5_bpuInfo_fallThrough : _GEN_4964; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4966 = 4'h6 == readIdx_2 ? data_6_bpuInfo_fallThrough : _GEN_4965; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4967 = 4'h7 == readIdx_2 ? data_7_bpuInfo_fallThrough : _GEN_4966; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4968 = 4'h8 == readIdx_2 ? data_8_bpuInfo_fallThrough : _GEN_4967; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4969 = 4'h9 == readIdx_2 ? data_9_bpuInfo_fallThrough : _GEN_4968; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4970 = 4'ha == readIdx_2 ? data_10_bpuInfo_fallThrough : _GEN_4969; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4971 = 4'hb == readIdx_2 ? data_11_bpuInfo_fallThrough : _GEN_4970; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4972 = 4'hc == readIdx_2 ? data_12_bpuInfo_fallThrough : _GEN_4971; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4973 = 4'hd == readIdx_2 ? data_13_bpuInfo_fallThrough : _GEN_4972; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4974 = 4'he == readIdx_2 ? data_14_bpuInfo_fallThrough : _GEN_4973; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4977 = 4'h1 == readIdx_2 ? data_1_bpuInfo_taken : data_0_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4978 = 4'h2 == readIdx_2 ? data_2_bpuInfo_taken : _GEN_4977; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4979 = 4'h3 == readIdx_2 ? data_3_bpuInfo_taken : _GEN_4978; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4980 = 4'h4 == readIdx_2 ? data_4_bpuInfo_taken : _GEN_4979; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4981 = 4'h5 == readIdx_2 ? data_5_bpuInfo_taken : _GEN_4980; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4982 = 4'h6 == readIdx_2 ? data_6_bpuInfo_taken : _GEN_4981; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4983 = 4'h7 == readIdx_2 ? data_7_bpuInfo_taken : _GEN_4982; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4984 = 4'h8 == readIdx_2 ? data_8_bpuInfo_taken : _GEN_4983; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4985 = 4'h9 == readIdx_2 ? data_9_bpuInfo_taken : _GEN_4984; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4986 = 4'ha == readIdx_2 ? data_10_bpuInfo_taken : _GEN_4985; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4987 = 4'hb == readIdx_2 ? data_11_bpuInfo_taken : _GEN_4986; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4988 = 4'hc == readIdx_2 ? data_12_bpuInfo_taken : _GEN_4987; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4989 = 4'hd == readIdx_2 ? data_13_bpuInfo_taken : _GEN_4988; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_4990 = 4'he == readIdx_2 ? data_14_bpuInfo_taken : _GEN_4989; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4993 = 4'h1 == readIdx_2 ? data_1_bpuInfo_target : data_0_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4994 = 4'h2 == readIdx_2 ? data_2_bpuInfo_target : _GEN_4993; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4995 = 4'h3 == readIdx_2 ? data_3_bpuInfo_target : _GEN_4994; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4996 = 4'h4 == readIdx_2 ? data_4_bpuInfo_target : _GEN_4995; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4997 = 4'h5 == readIdx_2 ? data_5_bpuInfo_target : _GEN_4996; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4998 = 4'h6 == readIdx_2 ? data_6_bpuInfo_target : _GEN_4997; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_4999 = 4'h7 == readIdx_2 ? data_7_bpuInfo_target : _GEN_4998; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5000 = 4'h8 == readIdx_2 ? data_8_bpuInfo_target : _GEN_4999; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5001 = 4'h9 == readIdx_2 ? data_9_bpuInfo_target : _GEN_5000; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5002 = 4'ha == readIdx_2 ? data_10_bpuInfo_target : _GEN_5001; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5003 = 4'hb == readIdx_2 ? data_11_bpuInfo_target : _GEN_5002; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5004 = 4'hc == readIdx_2 ? data_12_bpuInfo_target : _GEN_5003; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5005 = 4'hd == readIdx_2 ? data_13_bpuInfo_target : _GEN_5004; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5006 = 4'he == readIdx_2 ? data_14_bpuInfo_target : _GEN_5005; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5009 = 4'h1 == readIdx_2 ? data_1_bpuInfo_takenOffset : data_0_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5010 = 4'h2 == readIdx_2 ? data_2_bpuInfo_takenOffset : _GEN_5009; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5011 = 4'h3 == readIdx_2 ? data_3_bpuInfo_takenOffset : _GEN_5010; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5012 = 4'h4 == readIdx_2 ? data_4_bpuInfo_takenOffset : _GEN_5011; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5013 = 4'h5 == readIdx_2 ? data_5_bpuInfo_takenOffset : _GEN_5012; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5014 = 4'h6 == readIdx_2 ? data_6_bpuInfo_takenOffset : _GEN_5013; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5015 = 4'h7 == readIdx_2 ? data_7_bpuInfo_takenOffset : _GEN_5014; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5016 = 4'h8 == readIdx_2 ? data_8_bpuInfo_takenOffset : _GEN_5015; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5017 = 4'h9 == readIdx_2 ? data_9_bpuInfo_takenOffset : _GEN_5016; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5018 = 4'ha == readIdx_2 ? data_10_bpuInfo_takenOffset : _GEN_5017; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5019 = 4'hb == readIdx_2 ? data_11_bpuInfo_takenOffset : _GEN_5018; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5020 = 4'hc == readIdx_2 ? data_12_bpuInfo_takenOffset : _GEN_5019; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5021 = 4'hd == readIdx_2 ? data_13_bpuInfo_takenOffset : _GEN_5020; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5022 = 4'he == readIdx_2 ? data_14_bpuInfo_takenOffset : _GEN_5021; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5025 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_valid : data_0_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5026 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_valid : _GEN_5025; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5027 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_valid : _GEN_5026; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5028 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_valid : _GEN_5027; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5029 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_valid : _GEN_5028; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5030 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_valid : _GEN_5029; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5031 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_valid : _GEN_5030; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5032 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_valid : _GEN_5031; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5033 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_valid : _GEN_5032; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5034 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_valid : _GEN_5033; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5035 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_valid : _GEN_5034; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5036 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_valid : _GEN_5035; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5037 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_valid : _GEN_5036; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5038 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_valid : _GEN_5037; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5041 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_btbHit : data_0_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5042 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_btbHit : _GEN_5041; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5043 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_btbHit : _GEN_5042; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5044 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_btbHit : _GEN_5043; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5045 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_btbHit : _GEN_5044; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5046 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_btbHit : _GEN_5045; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5047 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_btbHit : _GEN_5046; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5048 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_btbHit : _GEN_5047; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5049 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_btbHit : _GEN_5048; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5050 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_btbHit : _GEN_5049; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5051 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_btbHit : _GEN_5050; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5052 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_btbHit : _GEN_5051; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5053 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_btbHit : _GEN_5052; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5054 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_btbHit : _GEN_5053; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5057 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_btbIsJalr : data_0_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5058 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_btbIsJalr : _GEN_5057; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5059 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_btbIsJalr : _GEN_5058; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5060 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_btbIsJalr : _GEN_5059; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5061 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_btbIsJalr : _GEN_5060; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5062 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_btbIsJalr : _GEN_5061; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5063 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_btbIsJalr : _GEN_5062; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5064 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_btbIsJalr : _GEN_5063; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5065 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_btbIsJalr : _GEN_5064; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5066 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_btbIsJalr : _GEN_5065; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5067 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_btbIsJalr : _GEN_5066; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5068 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_btbIsJalr : _GEN_5067; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5069 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_btbIsJalr : _GEN_5068; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5070 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_btbIsJalr : _GEN_5069; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5073 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_btbIsJal : data_0_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5074 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_btbIsJal : _GEN_5073; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5075 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_btbIsJal : _GEN_5074; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5076 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_btbIsJal : _GEN_5075; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5077 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_btbIsJal : _GEN_5076; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5078 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_btbIsJal : _GEN_5077; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5079 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_btbIsJal : _GEN_5078; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5080 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_btbIsJal : _GEN_5079; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5081 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_btbIsJal : _GEN_5080; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5082 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_btbIsJal : _GEN_5081; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5083 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_btbIsJal : _GEN_5082; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5084 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_btbIsJal : _GEN_5083; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5085 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_btbIsJal : _GEN_5084; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5086 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_btbIsJal : _GEN_5085; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5089 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_btbIsCall : data_0_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5090 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_btbIsCall : _GEN_5089; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5091 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_btbIsCall : _GEN_5090; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5092 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_btbIsCall : _GEN_5091; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5093 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_btbIsCall : _GEN_5092; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5094 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_btbIsCall : _GEN_5093; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5095 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_btbIsCall : _GEN_5094; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5096 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_btbIsCall : _GEN_5095; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5097 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_btbIsCall : _GEN_5096; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5098 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_btbIsCall : _GEN_5097; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5099 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_btbIsCall : _GEN_5098; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5100 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_btbIsCall : _GEN_5099; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5101 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_btbIsCall : _GEN_5100; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5102 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_btbIsCall : _GEN_5101; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5105 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_btbIsRet : data_0_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5106 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_btbIsRet : _GEN_5105; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5107 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_btbIsRet : _GEN_5106; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5108 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_btbIsRet : _GEN_5107; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5109 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_btbIsRet : _GEN_5108; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5110 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_btbIsRet : _GEN_5109; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5111 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_btbIsRet : _GEN_5110; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5112 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_btbIsRet : _GEN_5111; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5113 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_btbIsRet : _GEN_5112; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5114 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_btbIsRet : _GEN_5113; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5115 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_btbIsRet : _GEN_5114; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5116 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_btbIsRet : _GEN_5115; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5117 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_btbIsRet : _GEN_5116; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5118 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_btbIsRet : _GEN_5117; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5121 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_btbOffset : data_0_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5122 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_btbOffset : _GEN_5121; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5123 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_btbOffset : _GEN_5122; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5124 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_btbOffset : _GEN_5123; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5125 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_btbOffset : _GEN_5124; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5126 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_btbOffset : _GEN_5125; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5127 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_btbOffset : _GEN_5126; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5128 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_btbOffset : _GEN_5127; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5129 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_btbOffset : _GEN_5128; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5130 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_btbOffset : _GEN_5129; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5131 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_btbOffset : _GEN_5130; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5132 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_btbOffset : _GEN_5131; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5133 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_btbOffset : _GEN_5132; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5134 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_btbOffset : _GEN_5133; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5137 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_phtCounter : data_0_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5138 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_phtCounter : _GEN_5137; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5139 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_phtCounter : _GEN_5138; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5140 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_phtCounter : _GEN_5139; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5141 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_phtCounter : _GEN_5140; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5142 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_phtCounter : _GEN_5141; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5143 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_phtCounter : _GEN_5142; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5144 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_phtCounter : _GEN_5143; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5145 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_phtCounter : _GEN_5144; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5146 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_phtCounter : _GEN_5145; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5147 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_phtCounter : _GEN_5146; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5148 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_phtCounter : _GEN_5147; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5149 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_phtCounter : _GEN_5148; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [1:0] _GEN_5150 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_phtCounter : _GEN_5149; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5153 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_rasTop : data_0_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5154 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_rasTop : _GEN_5153; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5155 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_rasTop : _GEN_5154; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5156 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_rasTop : _GEN_5155; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5157 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_rasTop : _GEN_5156; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5158 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_rasTop : _GEN_5157; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5159 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_rasTop : _GEN_5158; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5160 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_rasTop : _GEN_5159; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5161 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_rasTop : _GEN_5160; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5162 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_rasTop : _GEN_5161; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5163 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_rasTop : _GEN_5162; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5164 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_rasTop : _GEN_5163; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5165 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_rasTop : _GEN_5164; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [2:0] _GEN_5166 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_rasTop : _GEN_5165; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5169 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_predTaken : data_0_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5170 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_predTaken : _GEN_5169; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5171 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_predTaken : _GEN_5170; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5172 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_predTaken : _GEN_5171; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5173 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_predTaken : _GEN_5172; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5174 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_predTaken : _GEN_5173; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5175 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_predTaken : _GEN_5174; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5176 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_predTaken : _GEN_5175; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5177 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_predTaken : _GEN_5176; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5178 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_predTaken : _GEN_5177; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5179 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_predTaken : _GEN_5178; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5180 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_predTaken : _GEN_5179; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5181 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_predTaken : _GEN_5180; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5182 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_predTaken : _GEN_5181; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5185 = 4'h1 == readIdx_2 ? data_1_bpuInfo_meta_predTarget : data_0_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5186 = 4'h2 == readIdx_2 ? data_2_bpuInfo_meta_predTarget : _GEN_5185; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5187 = 4'h3 == readIdx_2 ? data_3_bpuInfo_meta_predTarget : _GEN_5186; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5188 = 4'h4 == readIdx_2 ? data_4_bpuInfo_meta_predTarget : _GEN_5187; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5189 = 4'h5 == readIdx_2 ? data_5_bpuInfo_meta_predTarget : _GEN_5188; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5190 = 4'h6 == readIdx_2 ? data_6_bpuInfo_meta_predTarget : _GEN_5189; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5191 = 4'h7 == readIdx_2 ? data_7_bpuInfo_meta_predTarget : _GEN_5190; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5192 = 4'h8 == readIdx_2 ? data_8_bpuInfo_meta_predTarget : _GEN_5191; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5193 = 4'h9 == readIdx_2 ? data_9_bpuInfo_meta_predTarget : _GEN_5192; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5194 = 4'ha == readIdx_2 ? data_10_bpuInfo_meta_predTarget : _GEN_5193; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5195 = 4'hb == readIdx_2 ? data_11_bpuInfo_meta_predTarget : _GEN_5194; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5196 = 4'hc == readIdx_2 ? data_12_bpuInfo_meta_predTarget : _GEN_5195; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5197 = 4'hd == readIdx_2 ? data_13_bpuInfo_meta_predTarget : _GEN_5196; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_5198 = 4'he == readIdx_2 ? data_14_bpuInfo_meta_predTarget : _GEN_5197; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5201 = 4'h1 == readIdx_2 ? data_1_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5202 = 4'h2 == readIdx_2 ? data_2_exception_excpTlbRefill : _GEN_5201; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5203 = 4'h3 == readIdx_2 ? data_3_exception_excpTlbRefill : _GEN_5202; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5204 = 4'h4 == readIdx_2 ? data_4_exception_excpTlbRefill : _GEN_5203; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5205 = 4'h5 == readIdx_2 ? data_5_exception_excpTlbRefill : _GEN_5204; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5206 = 4'h6 == readIdx_2 ? data_6_exception_excpTlbRefill : _GEN_5205; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5207 = 4'h7 == readIdx_2 ? data_7_exception_excpTlbRefill : _GEN_5206; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5208 = 4'h8 == readIdx_2 ? data_8_exception_excpTlbRefill : _GEN_5207; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5209 = 4'h9 == readIdx_2 ? data_9_exception_excpTlbRefill : _GEN_5208; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5210 = 4'ha == readIdx_2 ? data_10_exception_excpTlbRefill : _GEN_5209; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5211 = 4'hb == readIdx_2 ? data_11_exception_excpTlbRefill : _GEN_5210; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5212 = 4'hc == readIdx_2 ? data_12_exception_excpTlbRefill : _GEN_5211; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5213 = 4'hd == readIdx_2 ? data_13_exception_excpTlbRefill : _GEN_5212; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5214 = 4'he == readIdx_2 ? data_14_exception_excpTlbRefill : _GEN_5213; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5217 = 4'h1 == readIdx_2 ? data_1_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5218 = 4'h2 == readIdx_2 ? data_2_exception_excpTlbPif : _GEN_5217; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5219 = 4'h3 == readIdx_2 ? data_3_exception_excpTlbPif : _GEN_5218; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5220 = 4'h4 == readIdx_2 ? data_4_exception_excpTlbPif : _GEN_5219; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5221 = 4'h5 == readIdx_2 ? data_5_exception_excpTlbPif : _GEN_5220; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5222 = 4'h6 == readIdx_2 ? data_6_exception_excpTlbPif : _GEN_5221; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5223 = 4'h7 == readIdx_2 ? data_7_exception_excpTlbPif : _GEN_5222; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5224 = 4'h8 == readIdx_2 ? data_8_exception_excpTlbPif : _GEN_5223; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5225 = 4'h9 == readIdx_2 ? data_9_exception_excpTlbPif : _GEN_5224; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5226 = 4'ha == readIdx_2 ? data_10_exception_excpTlbPif : _GEN_5225; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5227 = 4'hb == readIdx_2 ? data_11_exception_excpTlbPif : _GEN_5226; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5228 = 4'hc == readIdx_2 ? data_12_exception_excpTlbPif : _GEN_5227; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5229 = 4'hd == readIdx_2 ? data_13_exception_excpTlbPif : _GEN_5228; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5230 = 4'he == readIdx_2 ? data_14_exception_excpTlbPif : _GEN_5229; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5233 = 4'h1 == readIdx_2 ? data_1_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5234 = 4'h2 == readIdx_2 ? data_2_exception_excpTlbPpi : _GEN_5233; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5235 = 4'h3 == readIdx_2 ? data_3_exception_excpTlbPpi : _GEN_5234; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5236 = 4'h4 == readIdx_2 ? data_4_exception_excpTlbPpi : _GEN_5235; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5237 = 4'h5 == readIdx_2 ? data_5_exception_excpTlbPpi : _GEN_5236; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5238 = 4'h6 == readIdx_2 ? data_6_exception_excpTlbPpi : _GEN_5237; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5239 = 4'h7 == readIdx_2 ? data_7_exception_excpTlbPpi : _GEN_5238; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5240 = 4'h8 == readIdx_2 ? data_8_exception_excpTlbPpi : _GEN_5239; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5241 = 4'h9 == readIdx_2 ? data_9_exception_excpTlbPpi : _GEN_5240; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5242 = 4'ha == readIdx_2 ? data_10_exception_excpTlbPpi : _GEN_5241; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5243 = 4'hb == readIdx_2 ? data_11_exception_excpTlbPpi : _GEN_5242; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5244 = 4'hc == readIdx_2 ? data_12_exception_excpTlbPpi : _GEN_5243; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5245 = 4'hd == readIdx_2 ? data_13_exception_excpTlbPpi : _GEN_5244; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5246 = 4'he == readIdx_2 ? data_14_exception_excpTlbPpi : _GEN_5245; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5249 = 4'h1 == readIdx_2 ? data_1_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5250 = 4'h2 == readIdx_2 ? data_2_exception_excpAdef : _GEN_5249; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5251 = 4'h3 == readIdx_2 ? data_3_exception_excpAdef : _GEN_5250; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5252 = 4'h4 == readIdx_2 ? data_4_exception_excpAdef : _GEN_5251; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5253 = 4'h5 == readIdx_2 ? data_5_exception_excpAdef : _GEN_5252; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5254 = 4'h6 == readIdx_2 ? data_6_exception_excpAdef : _GEN_5253; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5255 = 4'h7 == readIdx_2 ? data_7_exception_excpAdef : _GEN_5254; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5256 = 4'h8 == readIdx_2 ? data_8_exception_excpAdef : _GEN_5255; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5257 = 4'h9 == readIdx_2 ? data_9_exception_excpAdef : _GEN_5256; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5258 = 4'ha == readIdx_2 ? data_10_exception_excpAdef : _GEN_5257; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5259 = 4'hb == readIdx_2 ? data_11_exception_excpAdef : _GEN_5258; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5260 = 4'hc == readIdx_2 ? data_12_exception_excpAdef : _GEN_5259; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5261 = 4'hd == readIdx_2 ? data_13_exception_excpAdef : _GEN_5260; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5262 = 4'he == readIdx_2 ? data_14_exception_excpAdef : _GEN_5261; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5265 = 4'h1 == readIdx_2 ? data_1_exception_excpAle : data_0_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5266 = 4'h2 == readIdx_2 ? data_2_exception_excpAle : _GEN_5265; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5267 = 4'h3 == readIdx_2 ? data_3_exception_excpAle : _GEN_5266; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5268 = 4'h4 == readIdx_2 ? data_4_exception_excpAle : _GEN_5267; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5269 = 4'h5 == readIdx_2 ? data_5_exception_excpAle : _GEN_5268; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5270 = 4'h6 == readIdx_2 ? data_6_exception_excpAle : _GEN_5269; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5271 = 4'h7 == readIdx_2 ? data_7_exception_excpAle : _GEN_5270; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5272 = 4'h8 == readIdx_2 ? data_8_exception_excpAle : _GEN_5271; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5273 = 4'h9 == readIdx_2 ? data_9_exception_excpAle : _GEN_5272; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5274 = 4'ha == readIdx_2 ? data_10_exception_excpAle : _GEN_5273; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5275 = 4'hb == readIdx_2 ? data_11_exception_excpAle : _GEN_5274; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5276 = 4'hc == readIdx_2 ? data_12_exception_excpAle : _GEN_5275; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5277 = 4'hd == readIdx_2 ? data_13_exception_excpAle : _GEN_5276; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_5278 = 4'he == readIdx_2 ? data_14_exception_excpAle : _GEN_5277; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _deqFireCnt_T = io_deq_0_ready & io_deq_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _deqFireCnt_T_1 = io_deq_1_ready & io_deq_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _deqFireCnt_T_2 = io_deq_2_ready & io_deq_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [1:0] _deqFireCnt_T_3 = _deqFireCnt_T_1 + _deqFireCnt_T_2; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [1:0] _GEN_8647 = {{1'd0}, _deqFireCnt_T}; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [2:0] _deqFireCnt_T_5 = _GEN_8647 + _deqFireCnt_T_3; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [1:0] deqFireCnt = _deqFireCnt_T_5[1:0]; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [3:0] _GEN_8648 = {{2'd0}, deqFireCnt}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [4:0] deqPtr_newIncValue = deqPtr_value + _GEN_8648; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  deqPtr_wrap = deqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] deqPtr_newPtr_value = deqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_enq_0_ready = canEnq & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_enq_1_ready = canEnq_1 & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_enq_2_ready = canEnq_2 & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_enq_3_ready = canEnq_3 & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_deq_0_valid = canDeq & ~empty; // @[src/main/scala/util/CircularQueue.scala 213:31]
  assign io_deq_0_bits_instr = 4'hf == readIdx ? data_15_instr : _GEN_3854; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pc = 4'hf == readIdx ? data_15_pc : _GEN_3870; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_valid = 4'hf == readIdx ? data_15_pdInfo_valid : _GEN_3886; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isBr = 4'hf == readIdx ? data_15_pdInfo_isBr : _GEN_3902; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isJal = 4'hf == readIdx ? data_15_pdInfo_isJal : _GEN_3918; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isJalr = 4'hf == readIdx ? data_15_pdInfo_isJalr : _GEN_3934; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isCall = 4'hf == readIdx ? data_15_pdInfo_isCall : _GEN_3950; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isRet = 4'hf == readIdx ? data_15_pdInfo_isRet : _GEN_3966; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_jumpTarget = 4'hf == readIdx ? data_15_pdInfo_jumpTarget : _GEN_3982; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_pc = 4'hf == readIdx ? data_15_bpuInfo_pc : _GEN_3998; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_fallThrough = 4'hf == readIdx ? data_15_bpuInfo_fallThrough : _GEN_4014; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_taken = 4'hf == readIdx ? data_15_bpuInfo_taken : _GEN_4030; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_target = 4'hf == readIdx ? data_15_bpuInfo_target : _GEN_4046; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_takenOffset = 4'hf == readIdx ? data_15_bpuInfo_takenOffset : _GEN_4062; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_valid = 4'hf == readIdx ? data_15_bpuInfo_meta_valid : _GEN_4078; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_btbHit = 4'hf == readIdx ? data_15_bpuInfo_meta_btbHit : _GEN_4094; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_btbIsJalr = 4'hf == readIdx ? data_15_bpuInfo_meta_btbIsJalr : _GEN_4110; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_btbIsJal = 4'hf == readIdx ? data_15_bpuInfo_meta_btbIsJal : _GEN_4126; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_btbIsCall = 4'hf == readIdx ? data_15_bpuInfo_meta_btbIsCall : _GEN_4142; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_btbIsRet = 4'hf == readIdx ? data_15_bpuInfo_meta_btbIsRet : _GEN_4158; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_btbOffset = 4'hf == readIdx ? data_15_bpuInfo_meta_btbOffset : _GEN_4174; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_phtCounter = 4'hf == readIdx ? data_15_bpuInfo_meta_phtCounter : _GEN_4190; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_rasTop = 4'hf == readIdx ? data_15_bpuInfo_meta_rasTop : _GEN_4206; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_predTaken = 4'hf == readIdx ? data_15_bpuInfo_meta_predTaken : _GEN_4222; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_bpuInfo_meta_predTarget = 4'hf == readIdx ? data_15_bpuInfo_meta_predTarget : _GEN_4238; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpTlbRefill = 4'hf == readIdx ? data_15_exception_excpTlbRefill : _GEN_4254; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpTlbPif = 4'hf == readIdx ? data_15_exception_excpTlbPif : _GEN_4270; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpTlbPpi = 4'hf == readIdx ? data_15_exception_excpTlbPpi : _GEN_4286; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpAdef = 4'hf == readIdx ? data_15_exception_excpAdef : _GEN_4302; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpAle = 4'hf == readIdx ? data_15_exception_excpAle : _GEN_4318; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_valid = canDeq_1 & ~empty; // @[src/main/scala/util/CircularQueue.scala 213:31]
  assign io_deq_1_bits_instr = 4'hf == readIdx_1 ? data_15_instr : _GEN_4334; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pc = 4'hf == readIdx_1 ? data_15_pc : _GEN_4350; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_valid = 4'hf == readIdx_1 ? data_15_pdInfo_valid : _GEN_4366; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isBr = 4'hf == readIdx_1 ? data_15_pdInfo_isBr : _GEN_4382; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isJal = 4'hf == readIdx_1 ? data_15_pdInfo_isJal : _GEN_4398; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isJalr = 4'hf == readIdx_1 ? data_15_pdInfo_isJalr : _GEN_4414; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isCall = 4'hf == readIdx_1 ? data_15_pdInfo_isCall : _GEN_4430; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isRet = 4'hf == readIdx_1 ? data_15_pdInfo_isRet : _GEN_4446; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_jumpTarget = 4'hf == readIdx_1 ? data_15_pdInfo_jumpTarget : _GEN_4462; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_pc = 4'hf == readIdx_1 ? data_15_bpuInfo_pc : _GEN_4478; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_fallThrough = 4'hf == readIdx_1 ? data_15_bpuInfo_fallThrough : _GEN_4494; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_taken = 4'hf == readIdx_1 ? data_15_bpuInfo_taken : _GEN_4510; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_target = 4'hf == readIdx_1 ? data_15_bpuInfo_target : _GEN_4526; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_takenOffset = 4'hf == readIdx_1 ? data_15_bpuInfo_takenOffset : _GEN_4542; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_valid = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_valid : _GEN_4558; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_btbHit = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_btbHit : _GEN_4574; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_btbIsJalr = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_btbIsJalr : _GEN_4590; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_btbIsJal = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_btbIsJal : _GEN_4606; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_btbIsCall = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_btbIsCall : _GEN_4622; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_btbIsRet = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_btbIsRet : _GEN_4638; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_btbOffset = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_btbOffset : _GEN_4654; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_phtCounter = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_phtCounter : _GEN_4670; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_rasTop = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_rasTop : _GEN_4686; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_predTaken = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_predTaken : _GEN_4702; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_bpuInfo_meta_predTarget = 4'hf == readIdx_1 ? data_15_bpuInfo_meta_predTarget : _GEN_4718; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpTlbRefill = 4'hf == readIdx_1 ? data_15_exception_excpTlbRefill : _GEN_4734; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpTlbPif = 4'hf == readIdx_1 ? data_15_exception_excpTlbPif : _GEN_4750; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpTlbPpi = 4'hf == readIdx_1 ? data_15_exception_excpTlbPpi : _GEN_4766; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpAdef = 4'hf == readIdx_1 ? data_15_exception_excpAdef : _GEN_4782; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpAle = 4'hf == readIdx_1 ? data_15_exception_excpAle : _GEN_4798; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_valid = canDeq_2 & ~empty; // @[src/main/scala/util/CircularQueue.scala 213:31]
  assign io_deq_2_bits_instr = 4'hf == readIdx_2 ? data_15_instr : _GEN_4814; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pc = 4'hf == readIdx_2 ? data_15_pc : _GEN_4830; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_valid = 4'hf == readIdx_2 ? data_15_pdInfo_valid : _GEN_4846; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isBr = 4'hf == readIdx_2 ? data_15_pdInfo_isBr : _GEN_4862; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isJal = 4'hf == readIdx_2 ? data_15_pdInfo_isJal : _GEN_4878; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isJalr = 4'hf == readIdx_2 ? data_15_pdInfo_isJalr : _GEN_4894; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isCall = 4'hf == readIdx_2 ? data_15_pdInfo_isCall : _GEN_4910; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isRet = 4'hf == readIdx_2 ? data_15_pdInfo_isRet : _GEN_4926; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_jumpTarget = 4'hf == readIdx_2 ? data_15_pdInfo_jumpTarget : _GEN_4942; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_pc = 4'hf == readIdx_2 ? data_15_bpuInfo_pc : _GEN_4958; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_fallThrough = 4'hf == readIdx_2 ? data_15_bpuInfo_fallThrough : _GEN_4974; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_taken = 4'hf == readIdx_2 ? data_15_bpuInfo_taken : _GEN_4990; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_target = 4'hf == readIdx_2 ? data_15_bpuInfo_target : _GEN_5006; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_takenOffset = 4'hf == readIdx_2 ? data_15_bpuInfo_takenOffset : _GEN_5022; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_valid = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_valid : _GEN_5038; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_btbHit = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_btbHit : _GEN_5054; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_btbIsJalr = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_btbIsJalr : _GEN_5070; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_btbIsJal = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_btbIsJal : _GEN_5086; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_btbIsCall = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_btbIsCall : _GEN_5102; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_btbIsRet = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_btbIsRet : _GEN_5118; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_btbOffset = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_btbOffset : _GEN_5134; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_phtCounter = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_phtCounter : _GEN_5150; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_rasTop = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_rasTop : _GEN_5166; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_predTaken = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_predTaken : _GEN_5182; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_bpuInfo_meta_predTarget = 4'hf == readIdx_2 ? data_15_bpuInfo_meta_predTarget : _GEN_5198; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpTlbRefill = 4'hf == readIdx_2 ? data_15_exception_excpTlbRefill : _GEN_5214; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpTlbPif = 4'hf == readIdx_2 ? data_15_exception_excpTlbPif : _GEN_5230; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpTlbPpi = 4'hf == readIdx_2 ? data_15_exception_excpTlbPpi : _GEN_5246; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpAdef = 4'hf == readIdx_2 ? data_15_exception_excpAdef : _GEN_5262; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpAle = 4'hf == readIdx_2 ? data_15_exception_excpAle : _GEN_5278; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 101:23]
      deqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 101:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      deqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 244:18]
    end else begin
      deqPtr_value <= deqPtr_newPtr_value; // @[src/main/scala/util/CircularQueue.scala 224:10]
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 101:23]
      deqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 101:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      deqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 245:17]
    end else if (deqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
      deqPtr_flag <= ~deqPtr_flag;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 102:23]
      enqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 102:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      enqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 246:18]
    end else begin
      enqPtr_value <= enqPtr_newPtr_value; // @[src/main/scala/util/CircularQueue.scala 201:10]
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 102:23]
      enqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 102:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      enqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 247:17]
    end else if (enqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
      enqPtr_flag <= ~enqPtr_flag;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_instr <= _GEN_2864;
      end
    end else begin
      data_0_instr <= _GEN_2864;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pc <= _GEN_2848;
      end
    end else begin
      data_0_pc <= _GEN_2848;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_valid <= _GEN_2736;
      end
    end else begin
      data_0_pdInfo_valid <= _GEN_2736;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isBr <= _GEN_2752;
      end
    end else begin
      data_0_pdInfo_isBr <= _GEN_2752;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isJal <= _GEN_2768;
      end
    end else begin
      data_0_pdInfo_isJal <= _GEN_2768;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isJalr <= _GEN_2784;
      end
    end else begin
      data_0_pdInfo_isJalr <= _GEN_2784;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isCall <= _GEN_2800;
      end
    end else begin
      data_0_pdInfo_isCall <= _GEN_2800;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isRet <= _GEN_2816;
      end
    end else begin
      data_0_pdInfo_isRet <= _GEN_2816;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_jumpTarget <= _GEN_2832;
      end
    end else begin
      data_0_pdInfo_jumpTarget <= _GEN_2832;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_pc <= _GEN_2480;
      end
    end else begin
      data_0_bpuInfo_pc <= _GEN_2480;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_fallThrough <= _GEN_2496;
      end
    end else begin
      data_0_bpuInfo_fallThrough <= _GEN_2496;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_taken <= _GEN_2512;
      end
    end else begin
      data_0_bpuInfo_taken <= _GEN_2512;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_target <= _GEN_2528;
      end
    end else begin
      data_0_bpuInfo_target <= _GEN_2528;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_takenOffset <= _GEN_2544;
      end
    end else begin
      data_0_bpuInfo_takenOffset <= _GEN_2544;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_valid <= _GEN_2560;
      end
    end else begin
      data_0_bpuInfo_meta_valid <= _GEN_2560;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_btbHit <= _GEN_2576;
      end
    end else begin
      data_0_bpuInfo_meta_btbHit <= _GEN_2576;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_btbIsJalr <= _GEN_2592;
      end
    end else begin
      data_0_bpuInfo_meta_btbIsJalr <= _GEN_2592;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_btbIsJal <= _GEN_2608;
      end
    end else begin
      data_0_bpuInfo_meta_btbIsJal <= _GEN_2608;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_btbIsCall <= _GEN_2624;
      end
    end else begin
      data_0_bpuInfo_meta_btbIsCall <= _GEN_2624;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_btbIsRet <= _GEN_2640;
      end
    end else begin
      data_0_bpuInfo_meta_btbIsRet <= _GEN_2640;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_btbOffset <= _GEN_2656;
      end
    end else begin
      data_0_bpuInfo_meta_btbOffset <= _GEN_2656;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_phtCounter <= _GEN_2672;
      end
    end else begin
      data_0_bpuInfo_meta_phtCounter <= _GEN_2672;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_rasTop <= _GEN_2688;
      end
    end else begin
      data_0_bpuInfo_meta_rasTop <= _GEN_2688;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_predTaken <= _GEN_2704;
      end
    end else begin
      data_0_bpuInfo_meta_predTaken <= _GEN_2704;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_bpuInfo_meta_predTarget <= _GEN_2720;
      end
    end else begin
      data_0_bpuInfo_meta_predTarget <= _GEN_2720;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpTlbRefill <= _GEN_2400;
      end
    end else begin
      data_0_exception_excpTlbRefill <= _GEN_2400;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpTlbPif <= _GEN_2416;
      end
    end else begin
      data_0_exception_excpTlbPif <= _GEN_2416;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpTlbPpi <= _GEN_2432;
      end
    end else begin
      data_0_exception_excpTlbPpi <= _GEN_2432;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpAdef <= _GEN_2448;
      end
    end else begin
      data_0_exception_excpAdef <= _GEN_2448;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_0_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpAle <= _GEN_2464;
      end
    end else begin
      data_0_exception_excpAle <= _GEN_2464;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_instr <= _GEN_2865;
      end
    end else begin
      data_1_instr <= _GEN_2865;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pc <= _GEN_2849;
      end
    end else begin
      data_1_pc <= _GEN_2849;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_valid <= _GEN_2737;
      end
    end else begin
      data_1_pdInfo_valid <= _GEN_2737;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isBr <= _GEN_2753;
      end
    end else begin
      data_1_pdInfo_isBr <= _GEN_2753;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isJal <= _GEN_2769;
      end
    end else begin
      data_1_pdInfo_isJal <= _GEN_2769;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isJalr <= _GEN_2785;
      end
    end else begin
      data_1_pdInfo_isJalr <= _GEN_2785;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isCall <= _GEN_2801;
      end
    end else begin
      data_1_pdInfo_isCall <= _GEN_2801;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isRet <= _GEN_2817;
      end
    end else begin
      data_1_pdInfo_isRet <= _GEN_2817;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_jumpTarget <= _GEN_2833;
      end
    end else begin
      data_1_pdInfo_jumpTarget <= _GEN_2833;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_pc <= _GEN_2481;
      end
    end else begin
      data_1_bpuInfo_pc <= _GEN_2481;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_fallThrough <= _GEN_2497;
      end
    end else begin
      data_1_bpuInfo_fallThrough <= _GEN_2497;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_taken <= _GEN_2513;
      end
    end else begin
      data_1_bpuInfo_taken <= _GEN_2513;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_target <= _GEN_2529;
      end
    end else begin
      data_1_bpuInfo_target <= _GEN_2529;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_takenOffset <= _GEN_2545;
      end
    end else begin
      data_1_bpuInfo_takenOffset <= _GEN_2545;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_valid <= _GEN_2561;
      end
    end else begin
      data_1_bpuInfo_meta_valid <= _GEN_2561;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_btbHit <= _GEN_2577;
      end
    end else begin
      data_1_bpuInfo_meta_btbHit <= _GEN_2577;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_btbIsJalr <= _GEN_2593;
      end
    end else begin
      data_1_bpuInfo_meta_btbIsJalr <= _GEN_2593;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_btbIsJal <= _GEN_2609;
      end
    end else begin
      data_1_bpuInfo_meta_btbIsJal <= _GEN_2609;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_btbIsCall <= _GEN_2625;
      end
    end else begin
      data_1_bpuInfo_meta_btbIsCall <= _GEN_2625;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_btbIsRet <= _GEN_2641;
      end
    end else begin
      data_1_bpuInfo_meta_btbIsRet <= _GEN_2641;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_btbOffset <= _GEN_2657;
      end
    end else begin
      data_1_bpuInfo_meta_btbOffset <= _GEN_2657;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_phtCounter <= _GEN_2673;
      end
    end else begin
      data_1_bpuInfo_meta_phtCounter <= _GEN_2673;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_rasTop <= _GEN_2689;
      end
    end else begin
      data_1_bpuInfo_meta_rasTop <= _GEN_2689;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_predTaken <= _GEN_2705;
      end
    end else begin
      data_1_bpuInfo_meta_predTaken <= _GEN_2705;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_bpuInfo_meta_predTarget <= _GEN_2721;
      end
    end else begin
      data_1_bpuInfo_meta_predTarget <= _GEN_2721;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpTlbRefill <= _GEN_2401;
      end
    end else begin
      data_1_exception_excpTlbRefill <= _GEN_2401;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpTlbPif <= _GEN_2417;
      end
    end else begin
      data_1_exception_excpTlbPif <= _GEN_2417;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpTlbPpi <= _GEN_2433;
      end
    end else begin
      data_1_exception_excpTlbPpi <= _GEN_2433;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpAdef <= _GEN_2449;
      end
    end else begin
      data_1_exception_excpAdef <= _GEN_2449;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_1_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpAle <= _GEN_2465;
      end
    end else begin
      data_1_exception_excpAle <= _GEN_2465;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_instr <= _GEN_2866;
      end
    end else begin
      data_2_instr <= _GEN_2866;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pc <= _GEN_2850;
      end
    end else begin
      data_2_pc <= _GEN_2850;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_valid <= _GEN_2738;
      end
    end else begin
      data_2_pdInfo_valid <= _GEN_2738;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isBr <= _GEN_2754;
      end
    end else begin
      data_2_pdInfo_isBr <= _GEN_2754;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isJal <= _GEN_2770;
      end
    end else begin
      data_2_pdInfo_isJal <= _GEN_2770;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isJalr <= _GEN_2786;
      end
    end else begin
      data_2_pdInfo_isJalr <= _GEN_2786;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isCall <= _GEN_2802;
      end
    end else begin
      data_2_pdInfo_isCall <= _GEN_2802;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isRet <= _GEN_2818;
      end
    end else begin
      data_2_pdInfo_isRet <= _GEN_2818;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_jumpTarget <= _GEN_2834;
      end
    end else begin
      data_2_pdInfo_jumpTarget <= _GEN_2834;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_pc <= _GEN_2482;
      end
    end else begin
      data_2_bpuInfo_pc <= _GEN_2482;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_fallThrough <= _GEN_2498;
      end
    end else begin
      data_2_bpuInfo_fallThrough <= _GEN_2498;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_taken <= _GEN_2514;
      end
    end else begin
      data_2_bpuInfo_taken <= _GEN_2514;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_target <= _GEN_2530;
      end
    end else begin
      data_2_bpuInfo_target <= _GEN_2530;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_takenOffset <= _GEN_2546;
      end
    end else begin
      data_2_bpuInfo_takenOffset <= _GEN_2546;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_valid <= _GEN_2562;
      end
    end else begin
      data_2_bpuInfo_meta_valid <= _GEN_2562;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_btbHit <= _GEN_2578;
      end
    end else begin
      data_2_bpuInfo_meta_btbHit <= _GEN_2578;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_btbIsJalr <= _GEN_2594;
      end
    end else begin
      data_2_bpuInfo_meta_btbIsJalr <= _GEN_2594;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_btbIsJal <= _GEN_2610;
      end
    end else begin
      data_2_bpuInfo_meta_btbIsJal <= _GEN_2610;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_btbIsCall <= _GEN_2626;
      end
    end else begin
      data_2_bpuInfo_meta_btbIsCall <= _GEN_2626;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_btbIsRet <= _GEN_2642;
      end
    end else begin
      data_2_bpuInfo_meta_btbIsRet <= _GEN_2642;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_btbOffset <= _GEN_2658;
      end
    end else begin
      data_2_bpuInfo_meta_btbOffset <= _GEN_2658;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_phtCounter <= _GEN_2674;
      end
    end else begin
      data_2_bpuInfo_meta_phtCounter <= _GEN_2674;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_rasTop <= _GEN_2690;
      end
    end else begin
      data_2_bpuInfo_meta_rasTop <= _GEN_2690;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_predTaken <= _GEN_2706;
      end
    end else begin
      data_2_bpuInfo_meta_predTaken <= _GEN_2706;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_bpuInfo_meta_predTarget <= _GEN_2722;
      end
    end else begin
      data_2_bpuInfo_meta_predTarget <= _GEN_2722;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpTlbRefill <= _GEN_2402;
      end
    end else begin
      data_2_exception_excpTlbRefill <= _GEN_2402;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpTlbPif <= _GEN_2418;
      end
    end else begin
      data_2_exception_excpTlbPif <= _GEN_2418;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpTlbPpi <= _GEN_2434;
      end
    end else begin
      data_2_exception_excpTlbPpi <= _GEN_2434;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpAdef <= _GEN_2450;
      end
    end else begin
      data_2_exception_excpAdef <= _GEN_2450;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_2_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpAle <= _GEN_2466;
      end
    end else begin
      data_2_exception_excpAle <= _GEN_2466;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_instr <= _GEN_2867;
      end
    end else begin
      data_3_instr <= _GEN_2867;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pc <= _GEN_2851;
      end
    end else begin
      data_3_pc <= _GEN_2851;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_valid <= _GEN_2739;
      end
    end else begin
      data_3_pdInfo_valid <= _GEN_2739;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isBr <= _GEN_2755;
      end
    end else begin
      data_3_pdInfo_isBr <= _GEN_2755;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isJal <= _GEN_2771;
      end
    end else begin
      data_3_pdInfo_isJal <= _GEN_2771;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isJalr <= _GEN_2787;
      end
    end else begin
      data_3_pdInfo_isJalr <= _GEN_2787;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isCall <= _GEN_2803;
      end
    end else begin
      data_3_pdInfo_isCall <= _GEN_2803;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isRet <= _GEN_2819;
      end
    end else begin
      data_3_pdInfo_isRet <= _GEN_2819;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_jumpTarget <= _GEN_2835;
      end
    end else begin
      data_3_pdInfo_jumpTarget <= _GEN_2835;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_pc <= _GEN_2483;
      end
    end else begin
      data_3_bpuInfo_pc <= _GEN_2483;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_fallThrough <= _GEN_2499;
      end
    end else begin
      data_3_bpuInfo_fallThrough <= _GEN_2499;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_taken <= _GEN_2515;
      end
    end else begin
      data_3_bpuInfo_taken <= _GEN_2515;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_target <= _GEN_2531;
      end
    end else begin
      data_3_bpuInfo_target <= _GEN_2531;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_takenOffset <= _GEN_2547;
      end
    end else begin
      data_3_bpuInfo_takenOffset <= _GEN_2547;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_valid <= _GEN_2563;
      end
    end else begin
      data_3_bpuInfo_meta_valid <= _GEN_2563;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_btbHit <= _GEN_2579;
      end
    end else begin
      data_3_bpuInfo_meta_btbHit <= _GEN_2579;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_btbIsJalr <= _GEN_2595;
      end
    end else begin
      data_3_bpuInfo_meta_btbIsJalr <= _GEN_2595;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_btbIsJal <= _GEN_2611;
      end
    end else begin
      data_3_bpuInfo_meta_btbIsJal <= _GEN_2611;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_btbIsCall <= _GEN_2627;
      end
    end else begin
      data_3_bpuInfo_meta_btbIsCall <= _GEN_2627;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_btbIsRet <= _GEN_2643;
      end
    end else begin
      data_3_bpuInfo_meta_btbIsRet <= _GEN_2643;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_btbOffset <= _GEN_2659;
      end
    end else begin
      data_3_bpuInfo_meta_btbOffset <= _GEN_2659;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_phtCounter <= _GEN_2675;
      end
    end else begin
      data_3_bpuInfo_meta_phtCounter <= _GEN_2675;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_rasTop <= _GEN_2691;
      end
    end else begin
      data_3_bpuInfo_meta_rasTop <= _GEN_2691;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_predTaken <= _GEN_2707;
      end
    end else begin
      data_3_bpuInfo_meta_predTaken <= _GEN_2707;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_bpuInfo_meta_predTarget <= _GEN_2723;
      end
    end else begin
      data_3_bpuInfo_meta_predTarget <= _GEN_2723;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpTlbRefill <= _GEN_2403;
      end
    end else begin
      data_3_exception_excpTlbRefill <= _GEN_2403;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpTlbPif <= _GEN_2419;
      end
    end else begin
      data_3_exception_excpTlbPif <= _GEN_2419;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpTlbPpi <= _GEN_2435;
      end
    end else begin
      data_3_exception_excpTlbPpi <= _GEN_2435;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpAdef <= _GEN_2451;
      end
    end else begin
      data_3_exception_excpAdef <= _GEN_2451;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_3_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpAle <= _GEN_2467;
      end
    end else begin
      data_3_exception_excpAle <= _GEN_2467;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_instr <= _GEN_2868;
      end
    end else begin
      data_4_instr <= _GEN_2868;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pc <= _GEN_2852;
      end
    end else begin
      data_4_pc <= _GEN_2852;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_valid <= _GEN_2740;
      end
    end else begin
      data_4_pdInfo_valid <= _GEN_2740;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isBr <= _GEN_2756;
      end
    end else begin
      data_4_pdInfo_isBr <= _GEN_2756;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isJal <= _GEN_2772;
      end
    end else begin
      data_4_pdInfo_isJal <= _GEN_2772;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isJalr <= _GEN_2788;
      end
    end else begin
      data_4_pdInfo_isJalr <= _GEN_2788;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isCall <= _GEN_2804;
      end
    end else begin
      data_4_pdInfo_isCall <= _GEN_2804;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isRet <= _GEN_2820;
      end
    end else begin
      data_4_pdInfo_isRet <= _GEN_2820;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_jumpTarget <= _GEN_2836;
      end
    end else begin
      data_4_pdInfo_jumpTarget <= _GEN_2836;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_pc <= _GEN_2484;
      end
    end else begin
      data_4_bpuInfo_pc <= _GEN_2484;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_fallThrough <= _GEN_2500;
      end
    end else begin
      data_4_bpuInfo_fallThrough <= _GEN_2500;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_taken <= _GEN_2516;
      end
    end else begin
      data_4_bpuInfo_taken <= _GEN_2516;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_target <= _GEN_2532;
      end
    end else begin
      data_4_bpuInfo_target <= _GEN_2532;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_takenOffset <= _GEN_2548;
      end
    end else begin
      data_4_bpuInfo_takenOffset <= _GEN_2548;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_valid <= _GEN_2564;
      end
    end else begin
      data_4_bpuInfo_meta_valid <= _GEN_2564;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_btbHit <= _GEN_2580;
      end
    end else begin
      data_4_bpuInfo_meta_btbHit <= _GEN_2580;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_btbIsJalr <= _GEN_2596;
      end
    end else begin
      data_4_bpuInfo_meta_btbIsJalr <= _GEN_2596;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_btbIsJal <= _GEN_2612;
      end
    end else begin
      data_4_bpuInfo_meta_btbIsJal <= _GEN_2612;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_btbIsCall <= _GEN_2628;
      end
    end else begin
      data_4_bpuInfo_meta_btbIsCall <= _GEN_2628;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_btbIsRet <= _GEN_2644;
      end
    end else begin
      data_4_bpuInfo_meta_btbIsRet <= _GEN_2644;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_btbOffset <= _GEN_2660;
      end
    end else begin
      data_4_bpuInfo_meta_btbOffset <= _GEN_2660;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_phtCounter <= _GEN_2676;
      end
    end else begin
      data_4_bpuInfo_meta_phtCounter <= _GEN_2676;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_rasTop <= _GEN_2692;
      end
    end else begin
      data_4_bpuInfo_meta_rasTop <= _GEN_2692;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_predTaken <= _GEN_2708;
      end
    end else begin
      data_4_bpuInfo_meta_predTaken <= _GEN_2708;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_bpuInfo_meta_predTarget <= _GEN_2724;
      end
    end else begin
      data_4_bpuInfo_meta_predTarget <= _GEN_2724;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpTlbRefill <= _GEN_2404;
      end
    end else begin
      data_4_exception_excpTlbRefill <= _GEN_2404;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpTlbPif <= _GEN_2420;
      end
    end else begin
      data_4_exception_excpTlbPif <= _GEN_2420;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpTlbPpi <= _GEN_2436;
      end
    end else begin
      data_4_exception_excpTlbPpi <= _GEN_2436;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpAdef <= _GEN_2452;
      end
    end else begin
      data_4_exception_excpAdef <= _GEN_2452;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_4_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpAle <= _GEN_2468;
      end
    end else begin
      data_4_exception_excpAle <= _GEN_2468;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_instr <= _GEN_2869;
      end
    end else begin
      data_5_instr <= _GEN_2869;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pc <= _GEN_2853;
      end
    end else begin
      data_5_pc <= _GEN_2853;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_valid <= _GEN_2741;
      end
    end else begin
      data_5_pdInfo_valid <= _GEN_2741;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isBr <= _GEN_2757;
      end
    end else begin
      data_5_pdInfo_isBr <= _GEN_2757;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isJal <= _GEN_2773;
      end
    end else begin
      data_5_pdInfo_isJal <= _GEN_2773;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isJalr <= _GEN_2789;
      end
    end else begin
      data_5_pdInfo_isJalr <= _GEN_2789;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isCall <= _GEN_2805;
      end
    end else begin
      data_5_pdInfo_isCall <= _GEN_2805;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isRet <= _GEN_2821;
      end
    end else begin
      data_5_pdInfo_isRet <= _GEN_2821;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_jumpTarget <= _GEN_2837;
      end
    end else begin
      data_5_pdInfo_jumpTarget <= _GEN_2837;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_pc <= _GEN_2485;
      end
    end else begin
      data_5_bpuInfo_pc <= _GEN_2485;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_fallThrough <= _GEN_2501;
      end
    end else begin
      data_5_bpuInfo_fallThrough <= _GEN_2501;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_taken <= _GEN_2517;
      end
    end else begin
      data_5_bpuInfo_taken <= _GEN_2517;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_target <= _GEN_2533;
      end
    end else begin
      data_5_bpuInfo_target <= _GEN_2533;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_takenOffset <= _GEN_2549;
      end
    end else begin
      data_5_bpuInfo_takenOffset <= _GEN_2549;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_valid <= _GEN_2565;
      end
    end else begin
      data_5_bpuInfo_meta_valid <= _GEN_2565;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_btbHit <= _GEN_2581;
      end
    end else begin
      data_5_bpuInfo_meta_btbHit <= _GEN_2581;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_btbIsJalr <= _GEN_2597;
      end
    end else begin
      data_5_bpuInfo_meta_btbIsJalr <= _GEN_2597;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_btbIsJal <= _GEN_2613;
      end
    end else begin
      data_5_bpuInfo_meta_btbIsJal <= _GEN_2613;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_btbIsCall <= _GEN_2629;
      end
    end else begin
      data_5_bpuInfo_meta_btbIsCall <= _GEN_2629;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_btbIsRet <= _GEN_2645;
      end
    end else begin
      data_5_bpuInfo_meta_btbIsRet <= _GEN_2645;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_btbOffset <= _GEN_2661;
      end
    end else begin
      data_5_bpuInfo_meta_btbOffset <= _GEN_2661;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_phtCounter <= _GEN_2677;
      end
    end else begin
      data_5_bpuInfo_meta_phtCounter <= _GEN_2677;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_rasTop <= _GEN_2693;
      end
    end else begin
      data_5_bpuInfo_meta_rasTop <= _GEN_2693;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_predTaken <= _GEN_2709;
      end
    end else begin
      data_5_bpuInfo_meta_predTaken <= _GEN_2709;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_bpuInfo_meta_predTarget <= _GEN_2725;
      end
    end else begin
      data_5_bpuInfo_meta_predTarget <= _GEN_2725;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpTlbRefill <= _GEN_2405;
      end
    end else begin
      data_5_exception_excpTlbRefill <= _GEN_2405;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpTlbPif <= _GEN_2421;
      end
    end else begin
      data_5_exception_excpTlbPif <= _GEN_2421;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpTlbPpi <= _GEN_2437;
      end
    end else begin
      data_5_exception_excpTlbPpi <= _GEN_2437;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpAdef <= _GEN_2453;
      end
    end else begin
      data_5_exception_excpAdef <= _GEN_2453;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_5_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpAle <= _GEN_2469;
      end
    end else begin
      data_5_exception_excpAle <= _GEN_2469;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_instr <= _GEN_2870;
      end
    end else begin
      data_6_instr <= _GEN_2870;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pc <= _GEN_2854;
      end
    end else begin
      data_6_pc <= _GEN_2854;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_valid <= _GEN_2742;
      end
    end else begin
      data_6_pdInfo_valid <= _GEN_2742;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isBr <= _GEN_2758;
      end
    end else begin
      data_6_pdInfo_isBr <= _GEN_2758;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isJal <= _GEN_2774;
      end
    end else begin
      data_6_pdInfo_isJal <= _GEN_2774;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isJalr <= _GEN_2790;
      end
    end else begin
      data_6_pdInfo_isJalr <= _GEN_2790;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isCall <= _GEN_2806;
      end
    end else begin
      data_6_pdInfo_isCall <= _GEN_2806;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isRet <= _GEN_2822;
      end
    end else begin
      data_6_pdInfo_isRet <= _GEN_2822;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_jumpTarget <= _GEN_2838;
      end
    end else begin
      data_6_pdInfo_jumpTarget <= _GEN_2838;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_pc <= _GEN_2486;
      end
    end else begin
      data_6_bpuInfo_pc <= _GEN_2486;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_fallThrough <= _GEN_2502;
      end
    end else begin
      data_6_bpuInfo_fallThrough <= _GEN_2502;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_taken <= _GEN_2518;
      end
    end else begin
      data_6_bpuInfo_taken <= _GEN_2518;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_target <= _GEN_2534;
      end
    end else begin
      data_6_bpuInfo_target <= _GEN_2534;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_takenOffset <= _GEN_2550;
      end
    end else begin
      data_6_bpuInfo_takenOffset <= _GEN_2550;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_valid <= _GEN_2566;
      end
    end else begin
      data_6_bpuInfo_meta_valid <= _GEN_2566;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_btbHit <= _GEN_2582;
      end
    end else begin
      data_6_bpuInfo_meta_btbHit <= _GEN_2582;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_btbIsJalr <= _GEN_2598;
      end
    end else begin
      data_6_bpuInfo_meta_btbIsJalr <= _GEN_2598;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_btbIsJal <= _GEN_2614;
      end
    end else begin
      data_6_bpuInfo_meta_btbIsJal <= _GEN_2614;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_btbIsCall <= _GEN_2630;
      end
    end else begin
      data_6_bpuInfo_meta_btbIsCall <= _GEN_2630;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_btbIsRet <= _GEN_2646;
      end
    end else begin
      data_6_bpuInfo_meta_btbIsRet <= _GEN_2646;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_btbOffset <= _GEN_2662;
      end
    end else begin
      data_6_bpuInfo_meta_btbOffset <= _GEN_2662;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_phtCounter <= _GEN_2678;
      end
    end else begin
      data_6_bpuInfo_meta_phtCounter <= _GEN_2678;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_rasTop <= _GEN_2694;
      end
    end else begin
      data_6_bpuInfo_meta_rasTop <= _GEN_2694;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_predTaken <= _GEN_2710;
      end
    end else begin
      data_6_bpuInfo_meta_predTaken <= _GEN_2710;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_bpuInfo_meta_predTarget <= _GEN_2726;
      end
    end else begin
      data_6_bpuInfo_meta_predTarget <= _GEN_2726;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpTlbRefill <= _GEN_2406;
      end
    end else begin
      data_6_exception_excpTlbRefill <= _GEN_2406;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpTlbPif <= _GEN_2422;
      end
    end else begin
      data_6_exception_excpTlbPif <= _GEN_2422;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpTlbPpi <= _GEN_2438;
      end
    end else begin
      data_6_exception_excpTlbPpi <= _GEN_2438;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpAdef <= _GEN_2454;
      end
    end else begin
      data_6_exception_excpAdef <= _GEN_2454;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_6_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpAle <= _GEN_2470;
      end
    end else begin
      data_6_exception_excpAle <= _GEN_2470;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_instr <= _GEN_2871;
      end
    end else begin
      data_7_instr <= _GEN_2871;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pc <= _GEN_2855;
      end
    end else begin
      data_7_pc <= _GEN_2855;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_valid <= _GEN_2743;
      end
    end else begin
      data_7_pdInfo_valid <= _GEN_2743;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isBr <= _GEN_2759;
      end
    end else begin
      data_7_pdInfo_isBr <= _GEN_2759;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isJal <= _GEN_2775;
      end
    end else begin
      data_7_pdInfo_isJal <= _GEN_2775;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isJalr <= _GEN_2791;
      end
    end else begin
      data_7_pdInfo_isJalr <= _GEN_2791;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isCall <= _GEN_2807;
      end
    end else begin
      data_7_pdInfo_isCall <= _GEN_2807;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isRet <= _GEN_2823;
      end
    end else begin
      data_7_pdInfo_isRet <= _GEN_2823;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_jumpTarget <= _GEN_2839;
      end
    end else begin
      data_7_pdInfo_jumpTarget <= _GEN_2839;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_pc <= _GEN_2487;
      end
    end else begin
      data_7_bpuInfo_pc <= _GEN_2487;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_fallThrough <= _GEN_2503;
      end
    end else begin
      data_7_bpuInfo_fallThrough <= _GEN_2503;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_taken <= _GEN_2519;
      end
    end else begin
      data_7_bpuInfo_taken <= _GEN_2519;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_target <= _GEN_2535;
      end
    end else begin
      data_7_bpuInfo_target <= _GEN_2535;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_takenOffset <= _GEN_2551;
      end
    end else begin
      data_7_bpuInfo_takenOffset <= _GEN_2551;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_valid <= _GEN_2567;
      end
    end else begin
      data_7_bpuInfo_meta_valid <= _GEN_2567;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_btbHit <= _GEN_2583;
      end
    end else begin
      data_7_bpuInfo_meta_btbHit <= _GEN_2583;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_btbIsJalr <= _GEN_2599;
      end
    end else begin
      data_7_bpuInfo_meta_btbIsJalr <= _GEN_2599;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_btbIsJal <= _GEN_2615;
      end
    end else begin
      data_7_bpuInfo_meta_btbIsJal <= _GEN_2615;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_btbIsCall <= _GEN_2631;
      end
    end else begin
      data_7_bpuInfo_meta_btbIsCall <= _GEN_2631;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_btbIsRet <= _GEN_2647;
      end
    end else begin
      data_7_bpuInfo_meta_btbIsRet <= _GEN_2647;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_btbOffset <= _GEN_2663;
      end
    end else begin
      data_7_bpuInfo_meta_btbOffset <= _GEN_2663;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_phtCounter <= _GEN_2679;
      end
    end else begin
      data_7_bpuInfo_meta_phtCounter <= _GEN_2679;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_rasTop <= _GEN_2695;
      end
    end else begin
      data_7_bpuInfo_meta_rasTop <= _GEN_2695;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_predTaken <= _GEN_2711;
      end
    end else begin
      data_7_bpuInfo_meta_predTaken <= _GEN_2711;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_bpuInfo_meta_predTarget <= _GEN_2727;
      end
    end else begin
      data_7_bpuInfo_meta_predTarget <= _GEN_2727;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpTlbRefill <= _GEN_2407;
      end
    end else begin
      data_7_exception_excpTlbRefill <= _GEN_2407;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpTlbPif <= _GEN_2423;
      end
    end else begin
      data_7_exception_excpTlbPif <= _GEN_2423;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpTlbPpi <= _GEN_2439;
      end
    end else begin
      data_7_exception_excpTlbPpi <= _GEN_2439;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpAdef <= _GEN_2455;
      end
    end else begin
      data_7_exception_excpAdef <= _GEN_2455;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_7_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpAle <= _GEN_2471;
      end
    end else begin
      data_7_exception_excpAle <= _GEN_2471;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_instr <= _GEN_2872;
      end
    end else begin
      data_8_instr <= _GEN_2872;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pc <= _GEN_2856;
      end
    end else begin
      data_8_pc <= _GEN_2856;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_valid <= _GEN_2744;
      end
    end else begin
      data_8_pdInfo_valid <= _GEN_2744;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isBr <= _GEN_2760;
      end
    end else begin
      data_8_pdInfo_isBr <= _GEN_2760;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isJal <= _GEN_2776;
      end
    end else begin
      data_8_pdInfo_isJal <= _GEN_2776;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isJalr <= _GEN_2792;
      end
    end else begin
      data_8_pdInfo_isJalr <= _GEN_2792;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isCall <= _GEN_2808;
      end
    end else begin
      data_8_pdInfo_isCall <= _GEN_2808;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isRet <= _GEN_2824;
      end
    end else begin
      data_8_pdInfo_isRet <= _GEN_2824;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_jumpTarget <= _GEN_2840;
      end
    end else begin
      data_8_pdInfo_jumpTarget <= _GEN_2840;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_pc <= _GEN_2488;
      end
    end else begin
      data_8_bpuInfo_pc <= _GEN_2488;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_fallThrough <= _GEN_2504;
      end
    end else begin
      data_8_bpuInfo_fallThrough <= _GEN_2504;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_taken <= _GEN_2520;
      end
    end else begin
      data_8_bpuInfo_taken <= _GEN_2520;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_target <= _GEN_2536;
      end
    end else begin
      data_8_bpuInfo_target <= _GEN_2536;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_takenOffset <= _GEN_2552;
      end
    end else begin
      data_8_bpuInfo_takenOffset <= _GEN_2552;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_valid <= _GEN_2568;
      end
    end else begin
      data_8_bpuInfo_meta_valid <= _GEN_2568;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_btbHit <= _GEN_2584;
      end
    end else begin
      data_8_bpuInfo_meta_btbHit <= _GEN_2584;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_btbIsJalr <= _GEN_2600;
      end
    end else begin
      data_8_bpuInfo_meta_btbIsJalr <= _GEN_2600;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_btbIsJal <= _GEN_2616;
      end
    end else begin
      data_8_bpuInfo_meta_btbIsJal <= _GEN_2616;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_btbIsCall <= _GEN_2632;
      end
    end else begin
      data_8_bpuInfo_meta_btbIsCall <= _GEN_2632;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_btbIsRet <= _GEN_2648;
      end
    end else begin
      data_8_bpuInfo_meta_btbIsRet <= _GEN_2648;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_btbOffset <= _GEN_2664;
      end
    end else begin
      data_8_bpuInfo_meta_btbOffset <= _GEN_2664;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_phtCounter <= _GEN_2680;
      end
    end else begin
      data_8_bpuInfo_meta_phtCounter <= _GEN_2680;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_rasTop <= _GEN_2696;
      end
    end else begin
      data_8_bpuInfo_meta_rasTop <= _GEN_2696;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_predTaken <= _GEN_2712;
      end
    end else begin
      data_8_bpuInfo_meta_predTaken <= _GEN_2712;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_bpuInfo_meta_predTarget <= _GEN_2728;
      end
    end else begin
      data_8_bpuInfo_meta_predTarget <= _GEN_2728;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpTlbRefill <= _GEN_2408;
      end
    end else begin
      data_8_exception_excpTlbRefill <= _GEN_2408;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpTlbPif <= _GEN_2424;
      end
    end else begin
      data_8_exception_excpTlbPif <= _GEN_2424;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpTlbPpi <= _GEN_2440;
      end
    end else begin
      data_8_exception_excpTlbPpi <= _GEN_2440;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpAdef <= _GEN_2456;
      end
    end else begin
      data_8_exception_excpAdef <= _GEN_2456;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_8_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpAle <= _GEN_2472;
      end
    end else begin
      data_8_exception_excpAle <= _GEN_2472;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_instr <= _GEN_2873;
      end
    end else begin
      data_9_instr <= _GEN_2873;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pc <= _GEN_2857;
      end
    end else begin
      data_9_pc <= _GEN_2857;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_valid <= _GEN_2745;
      end
    end else begin
      data_9_pdInfo_valid <= _GEN_2745;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isBr <= _GEN_2761;
      end
    end else begin
      data_9_pdInfo_isBr <= _GEN_2761;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isJal <= _GEN_2777;
      end
    end else begin
      data_9_pdInfo_isJal <= _GEN_2777;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isJalr <= _GEN_2793;
      end
    end else begin
      data_9_pdInfo_isJalr <= _GEN_2793;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isCall <= _GEN_2809;
      end
    end else begin
      data_9_pdInfo_isCall <= _GEN_2809;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isRet <= _GEN_2825;
      end
    end else begin
      data_9_pdInfo_isRet <= _GEN_2825;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_jumpTarget <= _GEN_2841;
      end
    end else begin
      data_9_pdInfo_jumpTarget <= _GEN_2841;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_pc <= _GEN_2489;
      end
    end else begin
      data_9_bpuInfo_pc <= _GEN_2489;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_fallThrough <= _GEN_2505;
      end
    end else begin
      data_9_bpuInfo_fallThrough <= _GEN_2505;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_taken <= _GEN_2521;
      end
    end else begin
      data_9_bpuInfo_taken <= _GEN_2521;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_target <= _GEN_2537;
      end
    end else begin
      data_9_bpuInfo_target <= _GEN_2537;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_takenOffset <= _GEN_2553;
      end
    end else begin
      data_9_bpuInfo_takenOffset <= _GEN_2553;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_valid <= _GEN_2569;
      end
    end else begin
      data_9_bpuInfo_meta_valid <= _GEN_2569;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_btbHit <= _GEN_2585;
      end
    end else begin
      data_9_bpuInfo_meta_btbHit <= _GEN_2585;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_btbIsJalr <= _GEN_2601;
      end
    end else begin
      data_9_bpuInfo_meta_btbIsJalr <= _GEN_2601;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_btbIsJal <= _GEN_2617;
      end
    end else begin
      data_9_bpuInfo_meta_btbIsJal <= _GEN_2617;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_btbIsCall <= _GEN_2633;
      end
    end else begin
      data_9_bpuInfo_meta_btbIsCall <= _GEN_2633;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_btbIsRet <= _GEN_2649;
      end
    end else begin
      data_9_bpuInfo_meta_btbIsRet <= _GEN_2649;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_btbOffset <= _GEN_2665;
      end
    end else begin
      data_9_bpuInfo_meta_btbOffset <= _GEN_2665;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_phtCounter <= _GEN_2681;
      end
    end else begin
      data_9_bpuInfo_meta_phtCounter <= _GEN_2681;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_rasTop <= _GEN_2697;
      end
    end else begin
      data_9_bpuInfo_meta_rasTop <= _GEN_2697;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_predTaken <= _GEN_2713;
      end
    end else begin
      data_9_bpuInfo_meta_predTaken <= _GEN_2713;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_bpuInfo_meta_predTarget <= _GEN_2729;
      end
    end else begin
      data_9_bpuInfo_meta_predTarget <= _GEN_2729;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpTlbRefill <= _GEN_2409;
      end
    end else begin
      data_9_exception_excpTlbRefill <= _GEN_2409;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpTlbPif <= _GEN_2425;
      end
    end else begin
      data_9_exception_excpTlbPif <= _GEN_2425;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpTlbPpi <= _GEN_2441;
      end
    end else begin
      data_9_exception_excpTlbPpi <= _GEN_2441;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpAdef <= _GEN_2457;
      end
    end else begin
      data_9_exception_excpAdef <= _GEN_2457;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_9_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpAle <= _GEN_2473;
      end
    end else begin
      data_9_exception_excpAle <= _GEN_2473;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_instr <= _GEN_2874;
      end
    end else begin
      data_10_instr <= _GEN_2874;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pc <= _GEN_2858;
      end
    end else begin
      data_10_pc <= _GEN_2858;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_valid <= _GEN_2746;
      end
    end else begin
      data_10_pdInfo_valid <= _GEN_2746;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isBr <= _GEN_2762;
      end
    end else begin
      data_10_pdInfo_isBr <= _GEN_2762;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isJal <= _GEN_2778;
      end
    end else begin
      data_10_pdInfo_isJal <= _GEN_2778;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isJalr <= _GEN_2794;
      end
    end else begin
      data_10_pdInfo_isJalr <= _GEN_2794;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isCall <= _GEN_2810;
      end
    end else begin
      data_10_pdInfo_isCall <= _GEN_2810;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isRet <= _GEN_2826;
      end
    end else begin
      data_10_pdInfo_isRet <= _GEN_2826;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_jumpTarget <= _GEN_2842;
      end
    end else begin
      data_10_pdInfo_jumpTarget <= _GEN_2842;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_pc <= _GEN_2490;
      end
    end else begin
      data_10_bpuInfo_pc <= _GEN_2490;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_fallThrough <= _GEN_2506;
      end
    end else begin
      data_10_bpuInfo_fallThrough <= _GEN_2506;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_taken <= _GEN_2522;
      end
    end else begin
      data_10_bpuInfo_taken <= _GEN_2522;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_target <= _GEN_2538;
      end
    end else begin
      data_10_bpuInfo_target <= _GEN_2538;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_takenOffset <= _GEN_2554;
      end
    end else begin
      data_10_bpuInfo_takenOffset <= _GEN_2554;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_valid <= _GEN_2570;
      end
    end else begin
      data_10_bpuInfo_meta_valid <= _GEN_2570;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_btbHit <= _GEN_2586;
      end
    end else begin
      data_10_bpuInfo_meta_btbHit <= _GEN_2586;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_btbIsJalr <= _GEN_2602;
      end
    end else begin
      data_10_bpuInfo_meta_btbIsJalr <= _GEN_2602;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_btbIsJal <= _GEN_2618;
      end
    end else begin
      data_10_bpuInfo_meta_btbIsJal <= _GEN_2618;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_btbIsCall <= _GEN_2634;
      end
    end else begin
      data_10_bpuInfo_meta_btbIsCall <= _GEN_2634;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_btbIsRet <= _GEN_2650;
      end
    end else begin
      data_10_bpuInfo_meta_btbIsRet <= _GEN_2650;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_btbOffset <= _GEN_2666;
      end
    end else begin
      data_10_bpuInfo_meta_btbOffset <= _GEN_2666;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_phtCounter <= _GEN_2682;
      end
    end else begin
      data_10_bpuInfo_meta_phtCounter <= _GEN_2682;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_rasTop <= _GEN_2698;
      end
    end else begin
      data_10_bpuInfo_meta_rasTop <= _GEN_2698;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_predTaken <= _GEN_2714;
      end
    end else begin
      data_10_bpuInfo_meta_predTaken <= _GEN_2714;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_bpuInfo_meta_predTarget <= _GEN_2730;
      end
    end else begin
      data_10_bpuInfo_meta_predTarget <= _GEN_2730;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpTlbRefill <= _GEN_2410;
      end
    end else begin
      data_10_exception_excpTlbRefill <= _GEN_2410;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpTlbPif <= _GEN_2426;
      end
    end else begin
      data_10_exception_excpTlbPif <= _GEN_2426;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpTlbPpi <= _GEN_2442;
      end
    end else begin
      data_10_exception_excpTlbPpi <= _GEN_2442;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpAdef <= _GEN_2458;
      end
    end else begin
      data_10_exception_excpAdef <= _GEN_2458;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_10_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpAle <= _GEN_2474;
      end
    end else begin
      data_10_exception_excpAle <= _GEN_2474;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_instr <= _GEN_2875;
      end
    end else begin
      data_11_instr <= _GEN_2875;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pc <= _GEN_2859;
      end
    end else begin
      data_11_pc <= _GEN_2859;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_valid <= _GEN_2747;
      end
    end else begin
      data_11_pdInfo_valid <= _GEN_2747;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isBr <= _GEN_2763;
      end
    end else begin
      data_11_pdInfo_isBr <= _GEN_2763;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isJal <= _GEN_2779;
      end
    end else begin
      data_11_pdInfo_isJal <= _GEN_2779;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isJalr <= _GEN_2795;
      end
    end else begin
      data_11_pdInfo_isJalr <= _GEN_2795;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isCall <= _GEN_2811;
      end
    end else begin
      data_11_pdInfo_isCall <= _GEN_2811;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isRet <= _GEN_2827;
      end
    end else begin
      data_11_pdInfo_isRet <= _GEN_2827;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_jumpTarget <= _GEN_2843;
      end
    end else begin
      data_11_pdInfo_jumpTarget <= _GEN_2843;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_pc <= _GEN_2491;
      end
    end else begin
      data_11_bpuInfo_pc <= _GEN_2491;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_fallThrough <= _GEN_2507;
      end
    end else begin
      data_11_bpuInfo_fallThrough <= _GEN_2507;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_taken <= _GEN_2523;
      end
    end else begin
      data_11_bpuInfo_taken <= _GEN_2523;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_target <= _GEN_2539;
      end
    end else begin
      data_11_bpuInfo_target <= _GEN_2539;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_takenOffset <= _GEN_2555;
      end
    end else begin
      data_11_bpuInfo_takenOffset <= _GEN_2555;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_valid <= _GEN_2571;
      end
    end else begin
      data_11_bpuInfo_meta_valid <= _GEN_2571;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_btbHit <= _GEN_2587;
      end
    end else begin
      data_11_bpuInfo_meta_btbHit <= _GEN_2587;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_btbIsJalr <= _GEN_2603;
      end
    end else begin
      data_11_bpuInfo_meta_btbIsJalr <= _GEN_2603;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_btbIsJal <= _GEN_2619;
      end
    end else begin
      data_11_bpuInfo_meta_btbIsJal <= _GEN_2619;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_btbIsCall <= _GEN_2635;
      end
    end else begin
      data_11_bpuInfo_meta_btbIsCall <= _GEN_2635;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_btbIsRet <= _GEN_2651;
      end
    end else begin
      data_11_bpuInfo_meta_btbIsRet <= _GEN_2651;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_btbOffset <= _GEN_2667;
      end
    end else begin
      data_11_bpuInfo_meta_btbOffset <= _GEN_2667;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_phtCounter <= _GEN_2683;
      end
    end else begin
      data_11_bpuInfo_meta_phtCounter <= _GEN_2683;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_rasTop <= _GEN_2699;
      end
    end else begin
      data_11_bpuInfo_meta_rasTop <= _GEN_2699;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_predTaken <= _GEN_2715;
      end
    end else begin
      data_11_bpuInfo_meta_predTaken <= _GEN_2715;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_bpuInfo_meta_predTarget <= _GEN_2731;
      end
    end else begin
      data_11_bpuInfo_meta_predTarget <= _GEN_2731;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpTlbRefill <= _GEN_2411;
      end
    end else begin
      data_11_exception_excpTlbRefill <= _GEN_2411;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpTlbPif <= _GEN_2427;
      end
    end else begin
      data_11_exception_excpTlbPif <= _GEN_2427;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpTlbPpi <= _GEN_2443;
      end
    end else begin
      data_11_exception_excpTlbPpi <= _GEN_2443;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpAdef <= _GEN_2459;
      end
    end else begin
      data_11_exception_excpAdef <= _GEN_2459;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_11_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpAle <= _GEN_2475;
      end
    end else begin
      data_11_exception_excpAle <= _GEN_2475;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_instr <= _GEN_2876;
      end
    end else begin
      data_12_instr <= _GEN_2876;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pc <= _GEN_2860;
      end
    end else begin
      data_12_pc <= _GEN_2860;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_valid <= _GEN_2748;
      end
    end else begin
      data_12_pdInfo_valid <= _GEN_2748;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isBr <= _GEN_2764;
      end
    end else begin
      data_12_pdInfo_isBr <= _GEN_2764;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isJal <= _GEN_2780;
      end
    end else begin
      data_12_pdInfo_isJal <= _GEN_2780;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isJalr <= _GEN_2796;
      end
    end else begin
      data_12_pdInfo_isJalr <= _GEN_2796;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isCall <= _GEN_2812;
      end
    end else begin
      data_12_pdInfo_isCall <= _GEN_2812;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isRet <= _GEN_2828;
      end
    end else begin
      data_12_pdInfo_isRet <= _GEN_2828;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_jumpTarget <= _GEN_2844;
      end
    end else begin
      data_12_pdInfo_jumpTarget <= _GEN_2844;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_pc <= _GEN_2492;
      end
    end else begin
      data_12_bpuInfo_pc <= _GEN_2492;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_fallThrough <= _GEN_2508;
      end
    end else begin
      data_12_bpuInfo_fallThrough <= _GEN_2508;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_taken <= _GEN_2524;
      end
    end else begin
      data_12_bpuInfo_taken <= _GEN_2524;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_target <= _GEN_2540;
      end
    end else begin
      data_12_bpuInfo_target <= _GEN_2540;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_takenOffset <= _GEN_2556;
      end
    end else begin
      data_12_bpuInfo_takenOffset <= _GEN_2556;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_valid <= _GEN_2572;
      end
    end else begin
      data_12_bpuInfo_meta_valid <= _GEN_2572;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_btbHit <= _GEN_2588;
      end
    end else begin
      data_12_bpuInfo_meta_btbHit <= _GEN_2588;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_btbIsJalr <= _GEN_2604;
      end
    end else begin
      data_12_bpuInfo_meta_btbIsJalr <= _GEN_2604;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_btbIsJal <= _GEN_2620;
      end
    end else begin
      data_12_bpuInfo_meta_btbIsJal <= _GEN_2620;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_btbIsCall <= _GEN_2636;
      end
    end else begin
      data_12_bpuInfo_meta_btbIsCall <= _GEN_2636;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_btbIsRet <= _GEN_2652;
      end
    end else begin
      data_12_bpuInfo_meta_btbIsRet <= _GEN_2652;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_btbOffset <= _GEN_2668;
      end
    end else begin
      data_12_bpuInfo_meta_btbOffset <= _GEN_2668;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_phtCounter <= _GEN_2684;
      end
    end else begin
      data_12_bpuInfo_meta_phtCounter <= _GEN_2684;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_rasTop <= _GEN_2700;
      end
    end else begin
      data_12_bpuInfo_meta_rasTop <= _GEN_2700;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_predTaken <= _GEN_2716;
      end
    end else begin
      data_12_bpuInfo_meta_predTaken <= _GEN_2716;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_bpuInfo_meta_predTarget <= _GEN_2732;
      end
    end else begin
      data_12_bpuInfo_meta_predTarget <= _GEN_2732;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpTlbRefill <= _GEN_2412;
      end
    end else begin
      data_12_exception_excpTlbRefill <= _GEN_2412;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpTlbPif <= _GEN_2428;
      end
    end else begin
      data_12_exception_excpTlbPif <= _GEN_2428;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpTlbPpi <= _GEN_2444;
      end
    end else begin
      data_12_exception_excpTlbPpi <= _GEN_2444;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpAdef <= _GEN_2460;
      end
    end else begin
      data_12_exception_excpAdef <= _GEN_2460;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_12_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpAle <= _GEN_2476;
      end
    end else begin
      data_12_exception_excpAle <= _GEN_2476;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_instr <= _GEN_2877;
      end
    end else begin
      data_13_instr <= _GEN_2877;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pc <= _GEN_2861;
      end
    end else begin
      data_13_pc <= _GEN_2861;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_valid <= _GEN_2749;
      end
    end else begin
      data_13_pdInfo_valid <= _GEN_2749;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isBr <= _GEN_2765;
      end
    end else begin
      data_13_pdInfo_isBr <= _GEN_2765;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isJal <= _GEN_2781;
      end
    end else begin
      data_13_pdInfo_isJal <= _GEN_2781;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isJalr <= _GEN_2797;
      end
    end else begin
      data_13_pdInfo_isJalr <= _GEN_2797;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isCall <= _GEN_2813;
      end
    end else begin
      data_13_pdInfo_isCall <= _GEN_2813;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isRet <= _GEN_2829;
      end
    end else begin
      data_13_pdInfo_isRet <= _GEN_2829;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_jumpTarget <= _GEN_2845;
      end
    end else begin
      data_13_pdInfo_jumpTarget <= _GEN_2845;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_pc <= _GEN_2493;
      end
    end else begin
      data_13_bpuInfo_pc <= _GEN_2493;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_fallThrough <= _GEN_2509;
      end
    end else begin
      data_13_bpuInfo_fallThrough <= _GEN_2509;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_taken <= _GEN_2525;
      end
    end else begin
      data_13_bpuInfo_taken <= _GEN_2525;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_target <= _GEN_2541;
      end
    end else begin
      data_13_bpuInfo_target <= _GEN_2541;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_takenOffset <= _GEN_2557;
      end
    end else begin
      data_13_bpuInfo_takenOffset <= _GEN_2557;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_valid <= _GEN_2573;
      end
    end else begin
      data_13_bpuInfo_meta_valid <= _GEN_2573;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_btbHit <= _GEN_2589;
      end
    end else begin
      data_13_bpuInfo_meta_btbHit <= _GEN_2589;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_btbIsJalr <= _GEN_2605;
      end
    end else begin
      data_13_bpuInfo_meta_btbIsJalr <= _GEN_2605;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_btbIsJal <= _GEN_2621;
      end
    end else begin
      data_13_bpuInfo_meta_btbIsJal <= _GEN_2621;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_btbIsCall <= _GEN_2637;
      end
    end else begin
      data_13_bpuInfo_meta_btbIsCall <= _GEN_2637;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_btbIsRet <= _GEN_2653;
      end
    end else begin
      data_13_bpuInfo_meta_btbIsRet <= _GEN_2653;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_btbOffset <= _GEN_2669;
      end
    end else begin
      data_13_bpuInfo_meta_btbOffset <= _GEN_2669;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_phtCounter <= _GEN_2685;
      end
    end else begin
      data_13_bpuInfo_meta_phtCounter <= _GEN_2685;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_rasTop <= _GEN_2701;
      end
    end else begin
      data_13_bpuInfo_meta_rasTop <= _GEN_2701;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_predTaken <= _GEN_2717;
      end
    end else begin
      data_13_bpuInfo_meta_predTaken <= _GEN_2717;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_bpuInfo_meta_predTarget <= _GEN_2733;
      end
    end else begin
      data_13_bpuInfo_meta_predTarget <= _GEN_2733;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpTlbRefill <= _GEN_2413;
      end
    end else begin
      data_13_exception_excpTlbRefill <= _GEN_2413;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpTlbPif <= _GEN_2429;
      end
    end else begin
      data_13_exception_excpTlbPif <= _GEN_2429;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpTlbPpi <= _GEN_2445;
      end
    end else begin
      data_13_exception_excpTlbPpi <= _GEN_2445;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpAdef <= _GEN_2461;
      end
    end else begin
      data_13_exception_excpAdef <= _GEN_2461;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_13_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpAle <= _GEN_2477;
      end
    end else begin
      data_13_exception_excpAle <= _GEN_2477;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_instr <= _GEN_2878;
      end
    end else begin
      data_14_instr <= _GEN_2878;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pc <= _GEN_2862;
      end
    end else begin
      data_14_pc <= _GEN_2862;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_valid <= _GEN_2750;
      end
    end else begin
      data_14_pdInfo_valid <= _GEN_2750;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isBr <= _GEN_2766;
      end
    end else begin
      data_14_pdInfo_isBr <= _GEN_2766;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isJal <= _GEN_2782;
      end
    end else begin
      data_14_pdInfo_isJal <= _GEN_2782;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isJalr <= _GEN_2798;
      end
    end else begin
      data_14_pdInfo_isJalr <= _GEN_2798;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isCall <= _GEN_2814;
      end
    end else begin
      data_14_pdInfo_isCall <= _GEN_2814;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isRet <= _GEN_2830;
      end
    end else begin
      data_14_pdInfo_isRet <= _GEN_2830;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_jumpTarget <= _GEN_2846;
      end
    end else begin
      data_14_pdInfo_jumpTarget <= _GEN_2846;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_pc <= _GEN_2494;
      end
    end else begin
      data_14_bpuInfo_pc <= _GEN_2494;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_fallThrough <= _GEN_2510;
      end
    end else begin
      data_14_bpuInfo_fallThrough <= _GEN_2510;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_taken <= _GEN_2526;
      end
    end else begin
      data_14_bpuInfo_taken <= _GEN_2526;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_target <= _GEN_2542;
      end
    end else begin
      data_14_bpuInfo_target <= _GEN_2542;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_takenOffset <= _GEN_2558;
      end
    end else begin
      data_14_bpuInfo_takenOffset <= _GEN_2558;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_valid <= _GEN_2574;
      end
    end else begin
      data_14_bpuInfo_meta_valid <= _GEN_2574;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_btbHit <= _GEN_2590;
      end
    end else begin
      data_14_bpuInfo_meta_btbHit <= _GEN_2590;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_btbIsJalr <= _GEN_2606;
      end
    end else begin
      data_14_bpuInfo_meta_btbIsJalr <= _GEN_2606;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_btbIsJal <= _GEN_2622;
      end
    end else begin
      data_14_bpuInfo_meta_btbIsJal <= _GEN_2622;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_btbIsCall <= _GEN_2638;
      end
    end else begin
      data_14_bpuInfo_meta_btbIsCall <= _GEN_2638;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_btbIsRet <= _GEN_2654;
      end
    end else begin
      data_14_bpuInfo_meta_btbIsRet <= _GEN_2654;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_btbOffset <= _GEN_2670;
      end
    end else begin
      data_14_bpuInfo_meta_btbOffset <= _GEN_2670;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_phtCounter <= _GEN_2686;
      end
    end else begin
      data_14_bpuInfo_meta_phtCounter <= _GEN_2686;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_rasTop <= _GEN_2702;
      end
    end else begin
      data_14_bpuInfo_meta_rasTop <= _GEN_2702;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_predTaken <= _GEN_2718;
      end
    end else begin
      data_14_bpuInfo_meta_predTaken <= _GEN_2718;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_bpuInfo_meta_predTarget <= _GEN_2734;
      end
    end else begin
      data_14_bpuInfo_meta_predTarget <= _GEN_2734;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpTlbRefill <= _GEN_2414;
      end
    end else begin
      data_14_exception_excpTlbRefill <= _GEN_2414;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpTlbPif <= _GEN_2430;
      end
    end else begin
      data_14_exception_excpTlbPif <= _GEN_2430;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpTlbPpi <= _GEN_2446;
      end
    end else begin
      data_14_exception_excpTlbPpi <= _GEN_2446;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpAdef <= _GEN_2462;
      end
    end else begin
      data_14_exception_excpAdef <= _GEN_2462;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_14_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpAle <= _GEN_2478;
      end
    end else begin
      data_14_exception_excpAle <= _GEN_2478;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_instr <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_instr <= _GEN_2879;
      end
    end else begin
      data_15_instr <= _GEN_2879;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pc <= _GEN_2863;
      end
    end else begin
      data_15_pc <= _GEN_2863;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pdInfo_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_valid <= _GEN_2751;
      end
    end else begin
      data_15_pdInfo_valid <= _GEN_2751;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pdInfo_isBr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isBr <= _GEN_2767;
      end
    end else begin
      data_15_pdInfo_isBr <= _GEN_2767;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pdInfo_isJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isJal <= _GEN_2783;
      end
    end else begin
      data_15_pdInfo_isJal <= _GEN_2783;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pdInfo_isJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isJalr <= _GEN_2799;
      end
    end else begin
      data_15_pdInfo_isJalr <= _GEN_2799;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pdInfo_isCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isCall <= _GEN_2815;
      end
    end else begin
      data_15_pdInfo_isCall <= _GEN_2815;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pdInfo_isRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isRet <= _GEN_2831;
      end
    end else begin
      data_15_pdInfo_isRet <= _GEN_2831;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_jumpTarget <= _GEN_2847;
      end
    end else begin
      data_15_pdInfo_jumpTarget <= _GEN_2847;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_pc <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_pc <= io_enq_3_bits_bpuInfo_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_pc <= _GEN_2495;
      end
    end else begin
      data_15_bpuInfo_pc <= _GEN_2495;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_fallThrough <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_fallThrough <= io_enq_3_bits_bpuInfo_fallThrough; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_fallThrough <= _GEN_2511;
      end
    end else begin
      data_15_bpuInfo_fallThrough <= _GEN_2511;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_taken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_taken <= io_enq_3_bits_bpuInfo_taken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_taken <= _GEN_2527;
      end
    end else begin
      data_15_bpuInfo_taken <= _GEN_2527;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_target <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_target <= io_enq_3_bits_bpuInfo_target; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_target <= _GEN_2543;
      end
    end else begin
      data_15_bpuInfo_target <= _GEN_2543;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_takenOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_takenOffset <= io_enq_3_bits_bpuInfo_takenOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_takenOffset <= _GEN_2559;
      end
    end else begin
      data_15_bpuInfo_takenOffset <= _GEN_2559;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_valid <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_valid <= io_enq_3_bits_bpuInfo_meta_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_valid <= _GEN_2575;
      end
    end else begin
      data_15_bpuInfo_meta_valid <= _GEN_2575;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_btbHit <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_btbHit <= io_enq_3_bits_bpuInfo_meta_btbHit; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_btbHit <= _GEN_2591;
      end
    end else begin
      data_15_bpuInfo_meta_btbHit <= _GEN_2591;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_btbIsJalr <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_btbIsJalr <= io_enq_3_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_btbIsJalr <= _GEN_2607;
      end
    end else begin
      data_15_bpuInfo_meta_btbIsJalr <= _GEN_2607;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_btbIsJal <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_btbIsJal <= io_enq_3_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_btbIsJal <= _GEN_2623;
      end
    end else begin
      data_15_bpuInfo_meta_btbIsJal <= _GEN_2623;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_btbIsCall <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_btbIsCall <= io_enq_3_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_btbIsCall <= _GEN_2639;
      end
    end else begin
      data_15_bpuInfo_meta_btbIsCall <= _GEN_2639;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_btbIsRet <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_btbIsRet <= io_enq_3_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_btbIsRet <= _GEN_2655;
      end
    end else begin
      data_15_bpuInfo_meta_btbIsRet <= _GEN_2655;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_btbOffset <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_btbOffset <= io_enq_3_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_btbOffset <= _GEN_2671;
      end
    end else begin
      data_15_bpuInfo_meta_btbOffset <= _GEN_2671;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_phtCounter <= 2'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_phtCounter <= io_enq_3_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_phtCounter <= _GEN_2687;
      end
    end else begin
      data_15_bpuInfo_meta_phtCounter <= _GEN_2687;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_rasTop <= 3'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_rasTop <= io_enq_3_bits_bpuInfo_meta_rasTop; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_rasTop <= _GEN_2703;
      end
    end else begin
      data_15_bpuInfo_meta_rasTop <= _GEN_2703;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_predTaken <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_predTaken <= io_enq_3_bits_bpuInfo_meta_predTaken; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_predTaken <= _GEN_2719;
      end
    end else begin
      data_15_bpuInfo_meta_predTaken <= _GEN_2719;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_bpuInfo_meta_predTarget <= 32'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_bpuInfo_meta_predTarget <= io_enq_3_bits_bpuInfo_meta_predTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_bpuInfo_meta_predTarget <= _GEN_2735;
      end
    end else begin
      data_15_bpuInfo_meta_predTarget <= _GEN_2735;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_exception_excpTlbRefill <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpTlbRefill <= _GEN_2415;
      end
    end else begin
      data_15_exception_excpTlbRefill <= _GEN_2415;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_exception_excpTlbPif <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpTlbPif <= _GEN_2431;
      end
    end else begin
      data_15_exception_excpTlbPif <= _GEN_2431;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_exception_excpTlbPpi <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpTlbPpi <= _GEN_2447;
      end
    end else begin
      data_15_exception_excpTlbPpi <= _GEN_2447;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_exception_excpAdef <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpAdef <= _GEN_2463;
      end
    end else begin
      data_15_exception_excpAdef <= _GEN_2463;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 118:21]
      data_15_exception_excpAle <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 118:21]
    end else if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpAle <= io_enq_3_bits_exception_excpAle; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpAle <= _GEN_2479;
      end
    end else begin
      data_15_exception_excpAle <= _GEN_2479;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: IBF input invalid\n    at CircularQueue.scala:175 assert(false.B, \"IBF input invalid\")\n"
            ); // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1 & ~reset) begin
          $fatal; // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: IBF input invalid\n    at CircularQueue.scala:175 assert(false.B, \"IBF input invalid\")\n"
            ); // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_6 & ~reset) begin
          $fatal; // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_11 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: IBF input invalid\n    at CircularQueue.scala:175 assert(false.B, \"IBF input invalid\")\n"
            ); // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_11 & ~reset) begin
          $fatal; // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  deqPtr_value = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  deqPtr_flag = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  enqPtr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  enqPtr_flag = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  data_0_instr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  data_0_pc = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  data_0_pdInfo_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  data_0_pdInfo_isBr = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  data_0_pdInfo_isJal = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  data_0_pdInfo_isJalr = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  data_0_pdInfo_isCall = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  data_0_pdInfo_isRet = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  data_0_pdInfo_jumpTarget = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  data_0_bpuInfo_pc = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  data_0_bpuInfo_fallThrough = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  data_0_bpuInfo_taken = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  data_0_bpuInfo_target = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  data_0_bpuInfo_takenOffset = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  data_0_bpuInfo_meta_valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  data_0_bpuInfo_meta_btbHit = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  data_0_bpuInfo_meta_btbIsJalr = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  data_0_bpuInfo_meta_btbIsJal = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  data_0_bpuInfo_meta_btbIsCall = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  data_0_bpuInfo_meta_btbIsRet = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  data_0_bpuInfo_meta_btbOffset = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  data_0_bpuInfo_meta_phtCounter = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  data_0_bpuInfo_meta_rasTop = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  data_0_bpuInfo_meta_predTaken = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  data_0_bpuInfo_meta_predTarget = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  data_0_exception_excpTlbRefill = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  data_0_exception_excpTlbPif = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  data_0_exception_excpTlbPpi = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  data_0_exception_excpAdef = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_0_exception_excpAle = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  data_1_instr = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  data_1_pc = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  data_1_pdInfo_valid = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  data_1_pdInfo_isBr = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  data_1_pdInfo_isJal = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  data_1_pdInfo_isJalr = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  data_1_pdInfo_isCall = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  data_1_pdInfo_isRet = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  data_1_pdInfo_jumpTarget = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  data_1_bpuInfo_pc = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  data_1_bpuInfo_fallThrough = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  data_1_bpuInfo_taken = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_1_bpuInfo_target = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  data_1_bpuInfo_takenOffset = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  data_1_bpuInfo_meta_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  data_1_bpuInfo_meta_btbHit = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  data_1_bpuInfo_meta_btbIsJalr = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  data_1_bpuInfo_meta_btbIsJal = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  data_1_bpuInfo_meta_btbIsCall = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  data_1_bpuInfo_meta_btbIsRet = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  data_1_bpuInfo_meta_btbOffset = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  data_1_bpuInfo_meta_phtCounter = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  data_1_bpuInfo_meta_rasTop = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  data_1_bpuInfo_meta_predTaken = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  data_1_bpuInfo_meta_predTarget = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  data_1_exception_excpTlbRefill = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  data_1_exception_excpTlbPif = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  data_1_exception_excpTlbPpi = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  data_1_exception_excpAdef = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  data_1_exception_excpAle = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  data_2_instr = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  data_2_pc = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  data_2_pdInfo_valid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  data_2_pdInfo_isBr = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  data_2_pdInfo_isJal = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  data_2_pdInfo_isJalr = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  data_2_pdInfo_isCall = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  data_2_pdInfo_isRet = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  data_2_pdInfo_jumpTarget = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  data_2_bpuInfo_pc = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  data_2_bpuInfo_fallThrough = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  data_2_bpuInfo_taken = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  data_2_bpuInfo_target = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  data_2_bpuInfo_takenOffset = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  data_2_bpuInfo_meta_valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  data_2_bpuInfo_meta_btbHit = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  data_2_bpuInfo_meta_btbIsJalr = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  data_2_bpuInfo_meta_btbIsJal = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  data_2_bpuInfo_meta_btbIsCall = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  data_2_bpuInfo_meta_btbIsRet = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  data_2_bpuInfo_meta_btbOffset = _RAND_84[1:0];
  _RAND_85 = {1{`RANDOM}};
  data_2_bpuInfo_meta_phtCounter = _RAND_85[1:0];
  _RAND_86 = {1{`RANDOM}};
  data_2_bpuInfo_meta_rasTop = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  data_2_bpuInfo_meta_predTaken = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  data_2_bpuInfo_meta_predTarget = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  data_2_exception_excpTlbRefill = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  data_2_exception_excpTlbPif = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  data_2_exception_excpTlbPpi = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  data_2_exception_excpAdef = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  data_2_exception_excpAle = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  data_3_instr = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  data_3_pc = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  data_3_pdInfo_valid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  data_3_pdInfo_isBr = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  data_3_pdInfo_isJal = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  data_3_pdInfo_isJalr = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  data_3_pdInfo_isCall = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  data_3_pdInfo_isRet = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  data_3_pdInfo_jumpTarget = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  data_3_bpuInfo_pc = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  data_3_bpuInfo_fallThrough = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  data_3_bpuInfo_taken = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  data_3_bpuInfo_target = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  data_3_bpuInfo_takenOffset = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  data_3_bpuInfo_meta_valid = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  data_3_bpuInfo_meta_btbHit = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  data_3_bpuInfo_meta_btbIsJalr = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  data_3_bpuInfo_meta_btbIsJal = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  data_3_bpuInfo_meta_btbIsCall = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  data_3_bpuInfo_meta_btbIsRet = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  data_3_bpuInfo_meta_btbOffset = _RAND_114[1:0];
  _RAND_115 = {1{`RANDOM}};
  data_3_bpuInfo_meta_phtCounter = _RAND_115[1:0];
  _RAND_116 = {1{`RANDOM}};
  data_3_bpuInfo_meta_rasTop = _RAND_116[2:0];
  _RAND_117 = {1{`RANDOM}};
  data_3_bpuInfo_meta_predTaken = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  data_3_bpuInfo_meta_predTarget = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  data_3_exception_excpTlbRefill = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  data_3_exception_excpTlbPif = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  data_3_exception_excpTlbPpi = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  data_3_exception_excpAdef = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  data_3_exception_excpAle = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  data_4_instr = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  data_4_pc = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  data_4_pdInfo_valid = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  data_4_pdInfo_isBr = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  data_4_pdInfo_isJal = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  data_4_pdInfo_isJalr = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  data_4_pdInfo_isCall = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  data_4_pdInfo_isRet = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  data_4_pdInfo_jumpTarget = _RAND_132[31:0];
  _RAND_133 = {1{`RANDOM}};
  data_4_bpuInfo_pc = _RAND_133[31:0];
  _RAND_134 = {1{`RANDOM}};
  data_4_bpuInfo_fallThrough = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  data_4_bpuInfo_taken = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  data_4_bpuInfo_target = _RAND_136[31:0];
  _RAND_137 = {1{`RANDOM}};
  data_4_bpuInfo_takenOffset = _RAND_137[1:0];
  _RAND_138 = {1{`RANDOM}};
  data_4_bpuInfo_meta_valid = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  data_4_bpuInfo_meta_btbHit = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  data_4_bpuInfo_meta_btbIsJalr = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  data_4_bpuInfo_meta_btbIsJal = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  data_4_bpuInfo_meta_btbIsCall = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  data_4_bpuInfo_meta_btbIsRet = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  data_4_bpuInfo_meta_btbOffset = _RAND_144[1:0];
  _RAND_145 = {1{`RANDOM}};
  data_4_bpuInfo_meta_phtCounter = _RAND_145[1:0];
  _RAND_146 = {1{`RANDOM}};
  data_4_bpuInfo_meta_rasTop = _RAND_146[2:0];
  _RAND_147 = {1{`RANDOM}};
  data_4_bpuInfo_meta_predTaken = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  data_4_bpuInfo_meta_predTarget = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  data_4_exception_excpTlbRefill = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  data_4_exception_excpTlbPif = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  data_4_exception_excpTlbPpi = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  data_4_exception_excpAdef = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  data_4_exception_excpAle = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  data_5_instr = _RAND_154[31:0];
  _RAND_155 = {1{`RANDOM}};
  data_5_pc = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  data_5_pdInfo_valid = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  data_5_pdInfo_isBr = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  data_5_pdInfo_isJal = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  data_5_pdInfo_isJalr = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  data_5_pdInfo_isCall = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  data_5_pdInfo_isRet = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  data_5_pdInfo_jumpTarget = _RAND_162[31:0];
  _RAND_163 = {1{`RANDOM}};
  data_5_bpuInfo_pc = _RAND_163[31:0];
  _RAND_164 = {1{`RANDOM}};
  data_5_bpuInfo_fallThrough = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  data_5_bpuInfo_taken = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  data_5_bpuInfo_target = _RAND_166[31:0];
  _RAND_167 = {1{`RANDOM}};
  data_5_bpuInfo_takenOffset = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  data_5_bpuInfo_meta_valid = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  data_5_bpuInfo_meta_btbHit = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  data_5_bpuInfo_meta_btbIsJalr = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  data_5_bpuInfo_meta_btbIsJal = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  data_5_bpuInfo_meta_btbIsCall = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  data_5_bpuInfo_meta_btbIsRet = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  data_5_bpuInfo_meta_btbOffset = _RAND_174[1:0];
  _RAND_175 = {1{`RANDOM}};
  data_5_bpuInfo_meta_phtCounter = _RAND_175[1:0];
  _RAND_176 = {1{`RANDOM}};
  data_5_bpuInfo_meta_rasTop = _RAND_176[2:0];
  _RAND_177 = {1{`RANDOM}};
  data_5_bpuInfo_meta_predTaken = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  data_5_bpuInfo_meta_predTarget = _RAND_178[31:0];
  _RAND_179 = {1{`RANDOM}};
  data_5_exception_excpTlbRefill = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  data_5_exception_excpTlbPif = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  data_5_exception_excpTlbPpi = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  data_5_exception_excpAdef = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  data_5_exception_excpAle = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  data_6_instr = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  data_6_pc = _RAND_185[31:0];
  _RAND_186 = {1{`RANDOM}};
  data_6_pdInfo_valid = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  data_6_pdInfo_isBr = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  data_6_pdInfo_isJal = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  data_6_pdInfo_isJalr = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  data_6_pdInfo_isCall = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  data_6_pdInfo_isRet = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  data_6_pdInfo_jumpTarget = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  data_6_bpuInfo_pc = _RAND_193[31:0];
  _RAND_194 = {1{`RANDOM}};
  data_6_bpuInfo_fallThrough = _RAND_194[31:0];
  _RAND_195 = {1{`RANDOM}};
  data_6_bpuInfo_taken = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  data_6_bpuInfo_target = _RAND_196[31:0];
  _RAND_197 = {1{`RANDOM}};
  data_6_bpuInfo_takenOffset = _RAND_197[1:0];
  _RAND_198 = {1{`RANDOM}};
  data_6_bpuInfo_meta_valid = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  data_6_bpuInfo_meta_btbHit = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  data_6_bpuInfo_meta_btbIsJalr = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  data_6_bpuInfo_meta_btbIsJal = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  data_6_bpuInfo_meta_btbIsCall = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  data_6_bpuInfo_meta_btbIsRet = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  data_6_bpuInfo_meta_btbOffset = _RAND_204[1:0];
  _RAND_205 = {1{`RANDOM}};
  data_6_bpuInfo_meta_phtCounter = _RAND_205[1:0];
  _RAND_206 = {1{`RANDOM}};
  data_6_bpuInfo_meta_rasTop = _RAND_206[2:0];
  _RAND_207 = {1{`RANDOM}};
  data_6_bpuInfo_meta_predTaken = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  data_6_bpuInfo_meta_predTarget = _RAND_208[31:0];
  _RAND_209 = {1{`RANDOM}};
  data_6_exception_excpTlbRefill = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  data_6_exception_excpTlbPif = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  data_6_exception_excpTlbPpi = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  data_6_exception_excpAdef = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  data_6_exception_excpAle = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  data_7_instr = _RAND_214[31:0];
  _RAND_215 = {1{`RANDOM}};
  data_7_pc = _RAND_215[31:0];
  _RAND_216 = {1{`RANDOM}};
  data_7_pdInfo_valid = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  data_7_pdInfo_isBr = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  data_7_pdInfo_isJal = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  data_7_pdInfo_isJalr = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  data_7_pdInfo_isCall = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  data_7_pdInfo_isRet = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  data_7_pdInfo_jumpTarget = _RAND_222[31:0];
  _RAND_223 = {1{`RANDOM}};
  data_7_bpuInfo_pc = _RAND_223[31:0];
  _RAND_224 = {1{`RANDOM}};
  data_7_bpuInfo_fallThrough = _RAND_224[31:0];
  _RAND_225 = {1{`RANDOM}};
  data_7_bpuInfo_taken = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  data_7_bpuInfo_target = _RAND_226[31:0];
  _RAND_227 = {1{`RANDOM}};
  data_7_bpuInfo_takenOffset = _RAND_227[1:0];
  _RAND_228 = {1{`RANDOM}};
  data_7_bpuInfo_meta_valid = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  data_7_bpuInfo_meta_btbHit = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  data_7_bpuInfo_meta_btbIsJalr = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  data_7_bpuInfo_meta_btbIsJal = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  data_7_bpuInfo_meta_btbIsCall = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  data_7_bpuInfo_meta_btbIsRet = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  data_7_bpuInfo_meta_btbOffset = _RAND_234[1:0];
  _RAND_235 = {1{`RANDOM}};
  data_7_bpuInfo_meta_phtCounter = _RAND_235[1:0];
  _RAND_236 = {1{`RANDOM}};
  data_7_bpuInfo_meta_rasTop = _RAND_236[2:0];
  _RAND_237 = {1{`RANDOM}};
  data_7_bpuInfo_meta_predTaken = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  data_7_bpuInfo_meta_predTarget = _RAND_238[31:0];
  _RAND_239 = {1{`RANDOM}};
  data_7_exception_excpTlbRefill = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  data_7_exception_excpTlbPif = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  data_7_exception_excpTlbPpi = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  data_7_exception_excpAdef = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  data_7_exception_excpAle = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  data_8_instr = _RAND_244[31:0];
  _RAND_245 = {1{`RANDOM}};
  data_8_pc = _RAND_245[31:0];
  _RAND_246 = {1{`RANDOM}};
  data_8_pdInfo_valid = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  data_8_pdInfo_isBr = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  data_8_pdInfo_isJal = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  data_8_pdInfo_isJalr = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  data_8_pdInfo_isCall = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  data_8_pdInfo_isRet = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  data_8_pdInfo_jumpTarget = _RAND_252[31:0];
  _RAND_253 = {1{`RANDOM}};
  data_8_bpuInfo_pc = _RAND_253[31:0];
  _RAND_254 = {1{`RANDOM}};
  data_8_bpuInfo_fallThrough = _RAND_254[31:0];
  _RAND_255 = {1{`RANDOM}};
  data_8_bpuInfo_taken = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  data_8_bpuInfo_target = _RAND_256[31:0];
  _RAND_257 = {1{`RANDOM}};
  data_8_bpuInfo_takenOffset = _RAND_257[1:0];
  _RAND_258 = {1{`RANDOM}};
  data_8_bpuInfo_meta_valid = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  data_8_bpuInfo_meta_btbHit = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  data_8_bpuInfo_meta_btbIsJalr = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  data_8_bpuInfo_meta_btbIsJal = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  data_8_bpuInfo_meta_btbIsCall = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  data_8_bpuInfo_meta_btbIsRet = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  data_8_bpuInfo_meta_btbOffset = _RAND_264[1:0];
  _RAND_265 = {1{`RANDOM}};
  data_8_bpuInfo_meta_phtCounter = _RAND_265[1:0];
  _RAND_266 = {1{`RANDOM}};
  data_8_bpuInfo_meta_rasTop = _RAND_266[2:0];
  _RAND_267 = {1{`RANDOM}};
  data_8_bpuInfo_meta_predTaken = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  data_8_bpuInfo_meta_predTarget = _RAND_268[31:0];
  _RAND_269 = {1{`RANDOM}};
  data_8_exception_excpTlbRefill = _RAND_269[0:0];
  _RAND_270 = {1{`RANDOM}};
  data_8_exception_excpTlbPif = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  data_8_exception_excpTlbPpi = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  data_8_exception_excpAdef = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  data_8_exception_excpAle = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  data_9_instr = _RAND_274[31:0];
  _RAND_275 = {1{`RANDOM}};
  data_9_pc = _RAND_275[31:0];
  _RAND_276 = {1{`RANDOM}};
  data_9_pdInfo_valid = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  data_9_pdInfo_isBr = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  data_9_pdInfo_isJal = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  data_9_pdInfo_isJalr = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  data_9_pdInfo_isCall = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  data_9_pdInfo_isRet = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  data_9_pdInfo_jumpTarget = _RAND_282[31:0];
  _RAND_283 = {1{`RANDOM}};
  data_9_bpuInfo_pc = _RAND_283[31:0];
  _RAND_284 = {1{`RANDOM}};
  data_9_bpuInfo_fallThrough = _RAND_284[31:0];
  _RAND_285 = {1{`RANDOM}};
  data_9_bpuInfo_taken = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  data_9_bpuInfo_target = _RAND_286[31:0];
  _RAND_287 = {1{`RANDOM}};
  data_9_bpuInfo_takenOffset = _RAND_287[1:0];
  _RAND_288 = {1{`RANDOM}};
  data_9_bpuInfo_meta_valid = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  data_9_bpuInfo_meta_btbHit = _RAND_289[0:0];
  _RAND_290 = {1{`RANDOM}};
  data_9_bpuInfo_meta_btbIsJalr = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  data_9_bpuInfo_meta_btbIsJal = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  data_9_bpuInfo_meta_btbIsCall = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  data_9_bpuInfo_meta_btbIsRet = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  data_9_bpuInfo_meta_btbOffset = _RAND_294[1:0];
  _RAND_295 = {1{`RANDOM}};
  data_9_bpuInfo_meta_phtCounter = _RAND_295[1:0];
  _RAND_296 = {1{`RANDOM}};
  data_9_bpuInfo_meta_rasTop = _RAND_296[2:0];
  _RAND_297 = {1{`RANDOM}};
  data_9_bpuInfo_meta_predTaken = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  data_9_bpuInfo_meta_predTarget = _RAND_298[31:0];
  _RAND_299 = {1{`RANDOM}};
  data_9_exception_excpTlbRefill = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  data_9_exception_excpTlbPif = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  data_9_exception_excpTlbPpi = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  data_9_exception_excpAdef = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  data_9_exception_excpAle = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  data_10_instr = _RAND_304[31:0];
  _RAND_305 = {1{`RANDOM}};
  data_10_pc = _RAND_305[31:0];
  _RAND_306 = {1{`RANDOM}};
  data_10_pdInfo_valid = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  data_10_pdInfo_isBr = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  data_10_pdInfo_isJal = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  data_10_pdInfo_isJalr = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  data_10_pdInfo_isCall = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  data_10_pdInfo_isRet = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  data_10_pdInfo_jumpTarget = _RAND_312[31:0];
  _RAND_313 = {1{`RANDOM}};
  data_10_bpuInfo_pc = _RAND_313[31:0];
  _RAND_314 = {1{`RANDOM}};
  data_10_bpuInfo_fallThrough = _RAND_314[31:0];
  _RAND_315 = {1{`RANDOM}};
  data_10_bpuInfo_taken = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  data_10_bpuInfo_target = _RAND_316[31:0];
  _RAND_317 = {1{`RANDOM}};
  data_10_bpuInfo_takenOffset = _RAND_317[1:0];
  _RAND_318 = {1{`RANDOM}};
  data_10_bpuInfo_meta_valid = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  data_10_bpuInfo_meta_btbHit = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  data_10_bpuInfo_meta_btbIsJalr = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  data_10_bpuInfo_meta_btbIsJal = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  data_10_bpuInfo_meta_btbIsCall = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  data_10_bpuInfo_meta_btbIsRet = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  data_10_bpuInfo_meta_btbOffset = _RAND_324[1:0];
  _RAND_325 = {1{`RANDOM}};
  data_10_bpuInfo_meta_phtCounter = _RAND_325[1:0];
  _RAND_326 = {1{`RANDOM}};
  data_10_bpuInfo_meta_rasTop = _RAND_326[2:0];
  _RAND_327 = {1{`RANDOM}};
  data_10_bpuInfo_meta_predTaken = _RAND_327[0:0];
  _RAND_328 = {1{`RANDOM}};
  data_10_bpuInfo_meta_predTarget = _RAND_328[31:0];
  _RAND_329 = {1{`RANDOM}};
  data_10_exception_excpTlbRefill = _RAND_329[0:0];
  _RAND_330 = {1{`RANDOM}};
  data_10_exception_excpTlbPif = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  data_10_exception_excpTlbPpi = _RAND_331[0:0];
  _RAND_332 = {1{`RANDOM}};
  data_10_exception_excpAdef = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  data_10_exception_excpAle = _RAND_333[0:0];
  _RAND_334 = {1{`RANDOM}};
  data_11_instr = _RAND_334[31:0];
  _RAND_335 = {1{`RANDOM}};
  data_11_pc = _RAND_335[31:0];
  _RAND_336 = {1{`RANDOM}};
  data_11_pdInfo_valid = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  data_11_pdInfo_isBr = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  data_11_pdInfo_isJal = _RAND_338[0:0];
  _RAND_339 = {1{`RANDOM}};
  data_11_pdInfo_isJalr = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  data_11_pdInfo_isCall = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  data_11_pdInfo_isRet = _RAND_341[0:0];
  _RAND_342 = {1{`RANDOM}};
  data_11_pdInfo_jumpTarget = _RAND_342[31:0];
  _RAND_343 = {1{`RANDOM}};
  data_11_bpuInfo_pc = _RAND_343[31:0];
  _RAND_344 = {1{`RANDOM}};
  data_11_bpuInfo_fallThrough = _RAND_344[31:0];
  _RAND_345 = {1{`RANDOM}};
  data_11_bpuInfo_taken = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  data_11_bpuInfo_target = _RAND_346[31:0];
  _RAND_347 = {1{`RANDOM}};
  data_11_bpuInfo_takenOffset = _RAND_347[1:0];
  _RAND_348 = {1{`RANDOM}};
  data_11_bpuInfo_meta_valid = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  data_11_bpuInfo_meta_btbHit = _RAND_349[0:0];
  _RAND_350 = {1{`RANDOM}};
  data_11_bpuInfo_meta_btbIsJalr = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  data_11_bpuInfo_meta_btbIsJal = _RAND_351[0:0];
  _RAND_352 = {1{`RANDOM}};
  data_11_bpuInfo_meta_btbIsCall = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  data_11_bpuInfo_meta_btbIsRet = _RAND_353[0:0];
  _RAND_354 = {1{`RANDOM}};
  data_11_bpuInfo_meta_btbOffset = _RAND_354[1:0];
  _RAND_355 = {1{`RANDOM}};
  data_11_bpuInfo_meta_phtCounter = _RAND_355[1:0];
  _RAND_356 = {1{`RANDOM}};
  data_11_bpuInfo_meta_rasTop = _RAND_356[2:0];
  _RAND_357 = {1{`RANDOM}};
  data_11_bpuInfo_meta_predTaken = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  data_11_bpuInfo_meta_predTarget = _RAND_358[31:0];
  _RAND_359 = {1{`RANDOM}};
  data_11_exception_excpTlbRefill = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  data_11_exception_excpTlbPif = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  data_11_exception_excpTlbPpi = _RAND_361[0:0];
  _RAND_362 = {1{`RANDOM}};
  data_11_exception_excpAdef = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  data_11_exception_excpAle = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  data_12_instr = _RAND_364[31:0];
  _RAND_365 = {1{`RANDOM}};
  data_12_pc = _RAND_365[31:0];
  _RAND_366 = {1{`RANDOM}};
  data_12_pdInfo_valid = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  data_12_pdInfo_isBr = _RAND_367[0:0];
  _RAND_368 = {1{`RANDOM}};
  data_12_pdInfo_isJal = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  data_12_pdInfo_isJalr = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  data_12_pdInfo_isCall = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  data_12_pdInfo_isRet = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  data_12_pdInfo_jumpTarget = _RAND_372[31:0];
  _RAND_373 = {1{`RANDOM}};
  data_12_bpuInfo_pc = _RAND_373[31:0];
  _RAND_374 = {1{`RANDOM}};
  data_12_bpuInfo_fallThrough = _RAND_374[31:0];
  _RAND_375 = {1{`RANDOM}};
  data_12_bpuInfo_taken = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  data_12_bpuInfo_target = _RAND_376[31:0];
  _RAND_377 = {1{`RANDOM}};
  data_12_bpuInfo_takenOffset = _RAND_377[1:0];
  _RAND_378 = {1{`RANDOM}};
  data_12_bpuInfo_meta_valid = _RAND_378[0:0];
  _RAND_379 = {1{`RANDOM}};
  data_12_bpuInfo_meta_btbHit = _RAND_379[0:0];
  _RAND_380 = {1{`RANDOM}};
  data_12_bpuInfo_meta_btbIsJalr = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  data_12_bpuInfo_meta_btbIsJal = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  data_12_bpuInfo_meta_btbIsCall = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  data_12_bpuInfo_meta_btbIsRet = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  data_12_bpuInfo_meta_btbOffset = _RAND_384[1:0];
  _RAND_385 = {1{`RANDOM}};
  data_12_bpuInfo_meta_phtCounter = _RAND_385[1:0];
  _RAND_386 = {1{`RANDOM}};
  data_12_bpuInfo_meta_rasTop = _RAND_386[2:0];
  _RAND_387 = {1{`RANDOM}};
  data_12_bpuInfo_meta_predTaken = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  data_12_bpuInfo_meta_predTarget = _RAND_388[31:0];
  _RAND_389 = {1{`RANDOM}};
  data_12_exception_excpTlbRefill = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  data_12_exception_excpTlbPif = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  data_12_exception_excpTlbPpi = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  data_12_exception_excpAdef = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  data_12_exception_excpAle = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  data_13_instr = _RAND_394[31:0];
  _RAND_395 = {1{`RANDOM}};
  data_13_pc = _RAND_395[31:0];
  _RAND_396 = {1{`RANDOM}};
  data_13_pdInfo_valid = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  data_13_pdInfo_isBr = _RAND_397[0:0];
  _RAND_398 = {1{`RANDOM}};
  data_13_pdInfo_isJal = _RAND_398[0:0];
  _RAND_399 = {1{`RANDOM}};
  data_13_pdInfo_isJalr = _RAND_399[0:0];
  _RAND_400 = {1{`RANDOM}};
  data_13_pdInfo_isCall = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  data_13_pdInfo_isRet = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  data_13_pdInfo_jumpTarget = _RAND_402[31:0];
  _RAND_403 = {1{`RANDOM}};
  data_13_bpuInfo_pc = _RAND_403[31:0];
  _RAND_404 = {1{`RANDOM}};
  data_13_bpuInfo_fallThrough = _RAND_404[31:0];
  _RAND_405 = {1{`RANDOM}};
  data_13_bpuInfo_taken = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  data_13_bpuInfo_target = _RAND_406[31:0];
  _RAND_407 = {1{`RANDOM}};
  data_13_bpuInfo_takenOffset = _RAND_407[1:0];
  _RAND_408 = {1{`RANDOM}};
  data_13_bpuInfo_meta_valid = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  data_13_bpuInfo_meta_btbHit = _RAND_409[0:0];
  _RAND_410 = {1{`RANDOM}};
  data_13_bpuInfo_meta_btbIsJalr = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  data_13_bpuInfo_meta_btbIsJal = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  data_13_bpuInfo_meta_btbIsCall = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  data_13_bpuInfo_meta_btbIsRet = _RAND_413[0:0];
  _RAND_414 = {1{`RANDOM}};
  data_13_bpuInfo_meta_btbOffset = _RAND_414[1:0];
  _RAND_415 = {1{`RANDOM}};
  data_13_bpuInfo_meta_phtCounter = _RAND_415[1:0];
  _RAND_416 = {1{`RANDOM}};
  data_13_bpuInfo_meta_rasTop = _RAND_416[2:0];
  _RAND_417 = {1{`RANDOM}};
  data_13_bpuInfo_meta_predTaken = _RAND_417[0:0];
  _RAND_418 = {1{`RANDOM}};
  data_13_bpuInfo_meta_predTarget = _RAND_418[31:0];
  _RAND_419 = {1{`RANDOM}};
  data_13_exception_excpTlbRefill = _RAND_419[0:0];
  _RAND_420 = {1{`RANDOM}};
  data_13_exception_excpTlbPif = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  data_13_exception_excpTlbPpi = _RAND_421[0:0];
  _RAND_422 = {1{`RANDOM}};
  data_13_exception_excpAdef = _RAND_422[0:0];
  _RAND_423 = {1{`RANDOM}};
  data_13_exception_excpAle = _RAND_423[0:0];
  _RAND_424 = {1{`RANDOM}};
  data_14_instr = _RAND_424[31:0];
  _RAND_425 = {1{`RANDOM}};
  data_14_pc = _RAND_425[31:0];
  _RAND_426 = {1{`RANDOM}};
  data_14_pdInfo_valid = _RAND_426[0:0];
  _RAND_427 = {1{`RANDOM}};
  data_14_pdInfo_isBr = _RAND_427[0:0];
  _RAND_428 = {1{`RANDOM}};
  data_14_pdInfo_isJal = _RAND_428[0:0];
  _RAND_429 = {1{`RANDOM}};
  data_14_pdInfo_isJalr = _RAND_429[0:0];
  _RAND_430 = {1{`RANDOM}};
  data_14_pdInfo_isCall = _RAND_430[0:0];
  _RAND_431 = {1{`RANDOM}};
  data_14_pdInfo_isRet = _RAND_431[0:0];
  _RAND_432 = {1{`RANDOM}};
  data_14_pdInfo_jumpTarget = _RAND_432[31:0];
  _RAND_433 = {1{`RANDOM}};
  data_14_bpuInfo_pc = _RAND_433[31:0];
  _RAND_434 = {1{`RANDOM}};
  data_14_bpuInfo_fallThrough = _RAND_434[31:0];
  _RAND_435 = {1{`RANDOM}};
  data_14_bpuInfo_taken = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  data_14_bpuInfo_target = _RAND_436[31:0];
  _RAND_437 = {1{`RANDOM}};
  data_14_bpuInfo_takenOffset = _RAND_437[1:0];
  _RAND_438 = {1{`RANDOM}};
  data_14_bpuInfo_meta_valid = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  data_14_bpuInfo_meta_btbHit = _RAND_439[0:0];
  _RAND_440 = {1{`RANDOM}};
  data_14_bpuInfo_meta_btbIsJalr = _RAND_440[0:0];
  _RAND_441 = {1{`RANDOM}};
  data_14_bpuInfo_meta_btbIsJal = _RAND_441[0:0];
  _RAND_442 = {1{`RANDOM}};
  data_14_bpuInfo_meta_btbIsCall = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  data_14_bpuInfo_meta_btbIsRet = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  data_14_bpuInfo_meta_btbOffset = _RAND_444[1:0];
  _RAND_445 = {1{`RANDOM}};
  data_14_bpuInfo_meta_phtCounter = _RAND_445[1:0];
  _RAND_446 = {1{`RANDOM}};
  data_14_bpuInfo_meta_rasTop = _RAND_446[2:0];
  _RAND_447 = {1{`RANDOM}};
  data_14_bpuInfo_meta_predTaken = _RAND_447[0:0];
  _RAND_448 = {1{`RANDOM}};
  data_14_bpuInfo_meta_predTarget = _RAND_448[31:0];
  _RAND_449 = {1{`RANDOM}};
  data_14_exception_excpTlbRefill = _RAND_449[0:0];
  _RAND_450 = {1{`RANDOM}};
  data_14_exception_excpTlbPif = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  data_14_exception_excpTlbPpi = _RAND_451[0:0];
  _RAND_452 = {1{`RANDOM}};
  data_14_exception_excpAdef = _RAND_452[0:0];
  _RAND_453 = {1{`RANDOM}};
  data_14_exception_excpAle = _RAND_453[0:0];
  _RAND_454 = {1{`RANDOM}};
  data_15_instr = _RAND_454[31:0];
  _RAND_455 = {1{`RANDOM}};
  data_15_pc = _RAND_455[31:0];
  _RAND_456 = {1{`RANDOM}};
  data_15_pdInfo_valid = _RAND_456[0:0];
  _RAND_457 = {1{`RANDOM}};
  data_15_pdInfo_isBr = _RAND_457[0:0];
  _RAND_458 = {1{`RANDOM}};
  data_15_pdInfo_isJal = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  data_15_pdInfo_isJalr = _RAND_459[0:0];
  _RAND_460 = {1{`RANDOM}};
  data_15_pdInfo_isCall = _RAND_460[0:0];
  _RAND_461 = {1{`RANDOM}};
  data_15_pdInfo_isRet = _RAND_461[0:0];
  _RAND_462 = {1{`RANDOM}};
  data_15_pdInfo_jumpTarget = _RAND_462[31:0];
  _RAND_463 = {1{`RANDOM}};
  data_15_bpuInfo_pc = _RAND_463[31:0];
  _RAND_464 = {1{`RANDOM}};
  data_15_bpuInfo_fallThrough = _RAND_464[31:0];
  _RAND_465 = {1{`RANDOM}};
  data_15_bpuInfo_taken = _RAND_465[0:0];
  _RAND_466 = {1{`RANDOM}};
  data_15_bpuInfo_target = _RAND_466[31:0];
  _RAND_467 = {1{`RANDOM}};
  data_15_bpuInfo_takenOffset = _RAND_467[1:0];
  _RAND_468 = {1{`RANDOM}};
  data_15_bpuInfo_meta_valid = _RAND_468[0:0];
  _RAND_469 = {1{`RANDOM}};
  data_15_bpuInfo_meta_btbHit = _RAND_469[0:0];
  _RAND_470 = {1{`RANDOM}};
  data_15_bpuInfo_meta_btbIsJalr = _RAND_470[0:0];
  _RAND_471 = {1{`RANDOM}};
  data_15_bpuInfo_meta_btbIsJal = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  data_15_bpuInfo_meta_btbIsCall = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  data_15_bpuInfo_meta_btbIsRet = _RAND_473[0:0];
  _RAND_474 = {1{`RANDOM}};
  data_15_bpuInfo_meta_btbOffset = _RAND_474[1:0];
  _RAND_475 = {1{`RANDOM}};
  data_15_bpuInfo_meta_phtCounter = _RAND_475[1:0];
  _RAND_476 = {1{`RANDOM}};
  data_15_bpuInfo_meta_rasTop = _RAND_476[2:0];
  _RAND_477 = {1{`RANDOM}};
  data_15_bpuInfo_meta_predTaken = _RAND_477[0:0];
  _RAND_478 = {1{`RANDOM}};
  data_15_bpuInfo_meta_predTarget = _RAND_478[31:0];
  _RAND_479 = {1{`RANDOM}};
  data_15_exception_excpTlbRefill = _RAND_479[0:0];
  _RAND_480 = {1{`RANDOM}};
  data_15_exception_excpTlbPif = _RAND_480[0:0];
  _RAND_481 = {1{`RANDOM}};
  data_15_exception_excpTlbPpi = _RAND_481[0:0];
  _RAND_482 = {1{`RANDOM}};
  data_15_exception_excpAdef = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  data_15_exception_excpAle = _RAND_483[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
