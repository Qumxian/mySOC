module Mmu(
  input         clock,
  input         reset,
  input  [1:0]  io_fromCsr_plv, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [1:0]  io_fromCsr_pgda, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [31:0] io_fromCsr_dmw0, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [31:0] io_fromCsr_dmw1, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [1:0]  io_fromCsr_datm, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [1:0]  io_fromCsr_datf, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_fromIcache_ready, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input         io_fromIcache_valid, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [31:0] io_fromIcache_bits_vaddr, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input         io_toIcache_ready, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_valid, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output [31:0] io_toIcache_bits_paddr, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_bits_cacheable, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_bits_hasError, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_bits_error_excpTlbRefill, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_bits_error_excpTlbPif, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_bits_error_excpTlbPpi, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_bits_error_excpAdef, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toIcache_bits_error_excpAle, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_fromMem_ready, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input         io_fromMem_valid, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [31:0] io_fromMem_bits_vaddr, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input  [3:0]  io_fromMem_bits_lsuOp, // @[src/main/scala/mmu/Mmu.scala 10:14]
  input         io_toMem_ready, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_valid, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output [31:0] io_toMem_bits_paddr, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_bits_cacheable, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_bits_hasError, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_bits_error_excpTlbRefill, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_bits_error_excpTlbPif, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_bits_error_excpTlbPpi, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_bits_error_excpAdef, // @[src/main/scala/mmu/Mmu.scala 10:14]
  output        io_toMem_bits_error_excpAle // @[src/main/scala/mmu/Mmu.scala 10:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  tlb_clock; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_reset; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_0_req_ready; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_0_req_valid; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire [21:0] tlb_io_search_0_req_bits_offset; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_0_resp_ready; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_0_resp_valid; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire [21:0] tlb_io_search_0_resp_bits_offset; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire [5:0] tlb_io_search_0_resp_bits_ps; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_1_req_ready; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_1_req_valid; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire [21:0] tlb_io_search_1_req_bits_offset; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_1_resp_ready; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  tlb_io_search_1_resp_valid; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire [21:0] tlb_io_search_1_resp_bits_offset; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire [5:0] tlb_io_search_1_resp_bits_ps; // @[src/main/scala/mmu/Mmu.scala 12:19]
  wire  isPaging = io_fromCsr_pgda == 2'h2; // @[src/main/scala/mmu/Mmu.scala 35:34]
  wire  isDirect = io_fromCsr_pgda == 2'h1; // @[src/main/scala/mmu/Mmu.scala 36:34]
  reg  ifetchPort_state; // @[src/main/scala/mmu/Mmu.scala 44:24]
  wire  ifetchPort_isIdle = ~ifetchPort_state; // @[src/main/scala/mmu/Mmu.scala 46:24]
  reg [31:0] ifetchPort_reqBuffer_vaddr; // @[src/main/scala/mmu/Mmu.scala 49:28]
  wire  _ifetchPort_T = io_fromIcache_ready & io_fromIcache_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _ifetchPort_T_1 = io_toIcache_ready & io_toIcache_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_1 = _ifetchPort_T_1 ? 1'h0 : ifetchPort_state; // @[src/main/scala/mmu/Mmu.scala 59:36 61:15 44:24]
  wire  _GEN_4 = _ifetchPort_T | _GEN_1; // @[src/main/scala/mmu/Mmu.scala 55:33 58:15]
  wire  ifetchPort_dmw0Hit_plvHit = io_fromCsr_plv == 2'h0 & io_fromCsr_dmw0[0] | io_fromCsr_plv == 2'h3 &
    io_fromCsr_dmw0[3]; // @[src/main/scala/mmu/Mmu.scala 17:42]
  wire  ifetchPort_dmw0Hit_segHit = io_fromCsr_dmw0[31:29] == ifetchPort_reqBuffer_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _ifetchPort_dmw0Hit_T = ifetchPort_dmw0Hit_plvHit & ifetchPort_dmw0Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  ifetchPort_dmw0Hit = isPaging & _ifetchPort_dmw0Hit_T; // @[src/main/scala/mmu/Mmu.scala 69:28]
  wire  ifetchPort_dmw1Hit_plvHit = io_fromCsr_plv == 2'h0 & io_fromCsr_dmw1[0] | io_fromCsr_plv == 2'h3 &
    io_fromCsr_dmw1[3]; // @[src/main/scala/mmu/Mmu.scala 17:42]
  wire  ifetchPort_dmw1Hit_segHit = io_fromCsr_dmw1[31:29] == ifetchPort_reqBuffer_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _ifetchPort_dmw1Hit_T = ifetchPort_dmw1Hit_plvHit & ifetchPort_dmw1Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  ifetchPort_dmw1Hit = isPaging & _ifetchPort_dmw1Hit_T; // @[src/main/scala/mmu/Mmu.scala 70:28]
  wire  ifetchPort_dmwHit = ifetchPort_dmw0Hit | ifetchPort_dmw1Hit; // @[src/main/scala/mmu/Mmu.scala 71:27]
  wire  ifetchPort_addrMisaligned = ifetchPort_reqBuffer_vaddr[1:0] != 2'h0; // @[src/main/scala/mmu/Mmu.scala 73:41]
  wire  ifetchPort_nextDmw0Hit_segHit = io_fromCsr_dmw0[31:29] == io_fromIcache_bits_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _ifetchPort_nextDmw0Hit_T = ifetchPort_dmw0Hit_plvHit & ifetchPort_nextDmw0Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  ifetchPort_nextDmw0Hit = isPaging & _ifetchPort_nextDmw0Hit_T; // @[src/main/scala/mmu/Mmu.scala 75:32]
  wire  ifetchPort_nextDmw1Hit_segHit = io_fromCsr_dmw1[31:29] == io_fromIcache_bits_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _ifetchPort_nextDmw1Hit_T = ifetchPort_dmw1Hit_plvHit & ifetchPort_nextDmw1Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  ifetchPort_nextDmw1Hit = isPaging & _ifetchPort_nextDmw1Hit_T; // @[src/main/scala/mmu/Mmu.scala 76:32]
  wire  ifetchPort_nextNeedTlb = isPaging & ~(ifetchPort_nextDmw0Hit | ifetchPort_nextDmw1Hit); // @[src/main/scala/mmu/Mmu.scala 77:32]
  wire  ifetchPort_nextAddrMisaligned = io_fromIcache_bits_vaddr[1:0] != 2'h0; // @[src/main/scala/mmu/Mmu.scala 78:46]
  wire  ifetchPort_nextNeedSearch = ifetchPort_nextNeedTlb & ~ifetchPort_nextAddrMisaligned; // @[src/main/scala/mmu/Mmu.scala 79:38]
  wire  _ifetchPort_directResp_cacheable_T = io_fromCsr_datf == 2'h1; // @[src/main/scala/mmu/Mmu.scala 26:50]
  wire  ifetchPort_directResp_error_excpAdef = ifetchPort_addrMisaligned; // @[src/main/scala/mmu/Mmu.scala 73:41]
  wire  _ifetchPort_directResp_error_WIRE_excpAle = 1'h0; // @[src/main/scala/mmu/Mmu.scala 14:{57,57}]
  wire  ifetchPort_directResp_error_excpAle = 1'h0; // @[src/main/scala/mmu/Mmu.scala 14:{57,57}]
  wire  ifetchPort_directResp_error_excpTlbRefill = 1'h0; // @[src/main/scala/mmu/Mmu.scala 14:{57,57}]
  wire  ifetchPort_directResp_error_excpTlbPif = 1'h0; // @[src/main/scala/mmu/Mmu.scala 14:{57,57}]
  wire  ifetchPort_directResp_error_excpTlbPpi = 1'h0; // @[src/main/scala/mmu/Mmu.scala 14:{57,57}]
  wire [4:0] _ifetchPort_directResp_hasError_T = {_ifetchPort_directResp_error_WIRE_excpAle,
    _ifetchPort_directResp_error_WIRE_excpAle,_ifetchPort_directResp_error_WIRE_excpAle,
    ifetchPort_directResp_error_excpAdef,_ifetchPort_directResp_error_WIRE_excpAle}; // @[src/main/scala/mmu/Mmu.scala 89:46]
  wire [31:0] _ifetchPort_dmwResp_paddr_T_2 = {io_fromCsr_dmw0[27:25],ifetchPort_reqBuffer_vaddr[28:0]}; // @[src/main/scala/mmu/Mmu.scala 23:8]
  wire [31:0] _ifetchPort_dmwResp_paddr_T_5 = {io_fromCsr_dmw1[27:25],ifetchPort_reqBuffer_vaddr[28:0]}; // @[src/main/scala/mmu/Mmu.scala 23:8]
  wire [31:0] _ifetchPort_dmwResp_paddr_T_6 = ifetchPort_dmw1Hit ? _ifetchPort_dmwResp_paddr_T_5 : 32'h0; // @[src/main/scala/mmu/Mmu.scala 93:26]
  wire [31:0] ifetchPort_dmwResp_paddr = ifetchPort_dmw0Hit ? _ifetchPort_dmwResp_paddr_T_2 :
    _ifetchPort_dmwResp_paddr_T_6; // @[src/main/scala/mmu/Mmu.scala 92:26]
  wire  _ifetchPort_dmwResp_cacheable_T_1 = io_fromCsr_dmw0[5:4] == 2'h1; // @[src/main/scala/mmu/Mmu.scala 26:50]
  wire  _ifetchPort_dmwResp_cacheable_T_4 = io_fromCsr_dmw1[5:4] == 2'h1; // @[src/main/scala/mmu/Mmu.scala 26:50]
  wire  ifetchPort_dmwResp_cacheable = ifetchPort_dmw0Hit & _ifetchPort_dmwResp_cacheable_T_1 | ifetchPort_dmw1Hit &
    _ifetchPort_dmwResp_cacheable_T_4; // @[src/main/scala/mmu/Mmu.scala 96:74]
  wire [4:0] _ifetchPort_dmwResp_hasError_T = {3'h0,ifetchPort_addrMisaligned,1'h0}; // @[src/main/scala/mmu/Mmu.scala 100:40]
  wire  ifetchPort_dmwResp_hasError = |_ifetchPort_dmwResp_hasError_T; // @[src/main/scala/mmu/Mmu.scala 100:47]
  wire  ifetchPort_canAcceptReq = ifetchPort_isIdle | _ifetchPort_T_1; // @[src/main/scala/mmu/Mmu.scala 107:32]
  wire [31:0] _ifetchPort_tlbOut_paddr_T_2 = {20'h0,tlb_io_search_0_resp_bits_offset[11:0]}; // @[src/main/scala/mmu/Mmu.scala 30:10]
  wire [31:0] _ifetchPort_tlbOut_paddr_T_4 = {10'h0,tlb_io_search_0_resp_bits_offset}; // @[src/main/scala/mmu/Mmu.scala 31:10]
  wire [31:0] ifetchPort_tlbOut_paddr = tlb_io_search_0_resp_bits_ps == 6'hc ? _ifetchPort_tlbOut_paddr_T_2 :
    _ifetchPort_tlbOut_paddr_T_4; // @[src/main/scala/mmu/Mmu.scala 29:8]
  wire [4:0] _ifetchPort_tlbOut_hasError_T = {3'h4,ifetchPort_addrMisaligned,1'h0}; // @[src/main/scala/mmu/Mmu.scala 137:37]
  wire  ifetchPort_tlbOut_hasError = |_ifetchPort_tlbOut_hasError_T; // @[src/main/scala/mmu/Mmu.scala 137:44]
  wire [31:0] _ifetchPort_io_toIcache_bits_T_paddr = ifetchPort_dmwHit ? ifetchPort_dmwResp_paddr :
    ifetchPort_tlbOut_paddr; // @[src/main/scala/mmu/Mmu.scala 140:29]
  wire  _ifetchPort_io_toIcache_bits_T_cacheable = ifetchPort_dmwHit ? ifetchPort_dmwResp_cacheable : 1'h1; // @[src/main/scala/mmu/Mmu.scala 140:29]
  wire  _ifetchPort_io_toIcache_bits_T_hasError = ifetchPort_dmwHit ? ifetchPort_dmwResp_hasError :
    ifetchPort_tlbOut_hasError; // @[src/main/scala/mmu/Mmu.scala 140:29]
  wire  _ifetchPort_io_toIcache_bits_T_error_excpTlbRefill = ifetchPort_dmwHit ? 1'h0 : 1'h1; // @[src/main/scala/mmu/Mmu.scala 140:29]
  wire [31:0] ifetchPort_directResp_paddr = ifetchPort_reqBuffer_vaddr; // @[src/main/scala/mmu/Mmu.scala 81:33 82:22]
  wire  ifetchPort_directResp_cacheable = isDirect & _ifetchPort_directResp_cacheable_T; // @[src/main/scala/mmu/Mmu.scala 85:38]
  wire  ifetchPort_directResp_hasError = |_ifetchPort_directResp_hasError_T; // @[src/main/scala/mmu/Mmu.scala 89:53]
  reg  memPort_state; // @[src/main/scala/mmu/Mmu.scala 154:24]
  wire  memPort_isIdle = ~memPort_state; // @[src/main/scala/mmu/Mmu.scala 155:24]
  reg [31:0] memPort_reqBuffer_vaddr; // @[src/main/scala/mmu/Mmu.scala 158:28]
  reg [3:0] memPort_reqBuffer_lsuOp; // @[src/main/scala/mmu/Mmu.scala 158:28]
  wire  _memPort_T = io_fromMem_ready & io_fromMem_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _memPort_T_1 = io_toMem_ready & io_toMem_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_9 = _memPort_T_1 ? 1'h0 : memPort_state; // @[src/main/scala/mmu/Mmu.scala 168:33 170:15 154:24]
  wire  _GEN_13 = _memPort_T | _GEN_9; // @[src/main/scala/mmu/Mmu.scala 164:30 167:15]
  wire  memPort_dmw0Hit_segHit = io_fromCsr_dmw0[31:29] == memPort_reqBuffer_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _memPort_dmw0Hit_T = ifetchPort_dmw0Hit_plvHit & memPort_dmw0Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  memPort_dmw0Hit = isPaging & _memPort_dmw0Hit_T; // @[src/main/scala/mmu/Mmu.scala 185:28]
  wire  memPort_dmw1Hit_segHit = io_fromCsr_dmw1[31:29] == memPort_reqBuffer_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _memPort_dmw1Hit_T = ifetchPort_dmw1Hit_plvHit & memPort_dmw1Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  memPort_dmw1Hit = isPaging & _memPort_dmw1Hit_T; // @[src/main/scala/mmu/Mmu.scala 186:28]
  wire  memPort_dmwHit = memPort_dmw0Hit | memPort_dmw1Hit; // @[src/main/scala/mmu/Mmu.scala 187:27]
  wire  memPort_addrMisaligned_halfAccess = memPort_reqBuffer_lsuOp == 4'h2 | memPort_reqBuffer_lsuOp == 4'h8 |
    memPort_reqBuffer_lsuOp == 4'h5; // @[src/main/scala/mmu/Mmu.scala 175:68]
  wire  memPort_addrMisaligned_wordAccess = memPort_reqBuffer_lsuOp == 4'h3 | memPort_reqBuffer_lsuOp == 4'h6; // @[src/main/scala/mmu/Mmu.scala 176:44]
  wire  memPort_addrMisaligned = memPort_addrMisaligned_halfAccess & memPort_reqBuffer_vaddr[0] |
    memPort_addrMisaligned_wordAccess & memPort_reqBuffer_vaddr[1:0] != 2'h0; // @[src/main/scala/mmu/Mmu.scala 177:32]
  wire  memPort_nextDmw0Hit_segHit = io_fromCsr_dmw0[31:29] == io_fromMem_bits_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _memPort_nextDmw0Hit_T = ifetchPort_dmw0Hit_plvHit & memPort_nextDmw0Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  memPort_nextDmw0Hit = isPaging & _memPort_nextDmw0Hit_T; // @[src/main/scala/mmu/Mmu.scala 191:32]
  wire  memPort_nextDmw1Hit_segHit = io_fromCsr_dmw1[31:29] == io_fromMem_bits_vaddr[31:29]; // @[src/main/scala/mmu/Mmu.scala 18:30]
  wire  _memPort_nextDmw1Hit_T = ifetchPort_dmw1Hit_plvHit & memPort_nextDmw1Hit_segHit; // @[src/main/scala/mmu/Mmu.scala 19:12]
  wire  memPort_nextDmw1Hit = isPaging & _memPort_nextDmw1Hit_T; // @[src/main/scala/mmu/Mmu.scala 192:32]
  wire  memPort_nextNeedTlb = isPaging & ~(memPort_nextDmw0Hit | memPort_nextDmw1Hit); // @[src/main/scala/mmu/Mmu.scala 193:32]
  wire  memPort_nextAddrMisaligned_halfAccess = io_fromMem_bits_lsuOp == 4'h2 | io_fromMem_bits_lsuOp == 4'h8 |
    io_fromMem_bits_lsuOp == 4'h5; // @[src/main/scala/mmu/Mmu.scala 175:68]
  wire  memPort_nextAddrMisaligned_wordAccess = io_fromMem_bits_lsuOp == 4'h3 | io_fromMem_bits_lsuOp == 4'h6; // @[src/main/scala/mmu/Mmu.scala 176:44]
  wire  memPort_nextAddrMisaligned = memPort_nextAddrMisaligned_halfAccess & io_fromMem_bits_vaddr[0] |
    memPort_nextAddrMisaligned_wordAccess & io_fromMem_bits_vaddr[1:0] != 2'h0; // @[src/main/scala/mmu/Mmu.scala 177:32]
  wire  memPort_nextNeedSearch = memPort_nextNeedTlb & ~memPort_nextAddrMisaligned; // @[src/main/scala/mmu/Mmu.scala 195:38]
  wire  _memPort_directResp_cacheable_T = io_fromCsr_datm == 2'h1; // @[src/main/scala/mmu/Mmu.scala 26:50]
  wire  memPort_directResp_cacheable = isDirect & _memPort_directResp_cacheable_T; // @[src/main/scala/mmu/Mmu.scala 201:38]
  wire [4:0] _memPort_directResp_hasError_T = {3'h0,1'h0,memPort_addrMisaligned}; // @[src/main/scala/mmu/Mmu.scala 205:46]
  wire  memPort_directResp_hasError = |_memPort_directResp_hasError_T; // @[src/main/scala/mmu/Mmu.scala 205:53]
  wire [31:0] _memPort_dmwResp_paddr_T_2 = {io_fromCsr_dmw0[27:25],memPort_reqBuffer_vaddr[28:0]}; // @[src/main/scala/mmu/Mmu.scala 23:8]
  wire [31:0] _memPort_dmwResp_paddr_T_5 = {io_fromCsr_dmw1[27:25],memPort_reqBuffer_vaddr[28:0]}; // @[src/main/scala/mmu/Mmu.scala 23:8]
  wire [31:0] _memPort_dmwResp_paddr_T_6 = memPort_dmw1Hit ? _memPort_dmwResp_paddr_T_5 : 32'h0; // @[src/main/scala/mmu/Mmu.scala 209:24]
  wire [31:0] memPort_dmwResp_paddr = memPort_dmw0Hit ? _memPort_dmwResp_paddr_T_2 : _memPort_dmwResp_paddr_T_6; // @[src/main/scala/mmu/Mmu.scala 208:25]
  wire  memPort_dmwResp_cacheable = memPort_dmw0Hit & _ifetchPort_dmwResp_cacheable_T_1 | memPort_dmw1Hit &
    _ifetchPort_dmwResp_cacheable_T_4; // @[src/main/scala/mmu/Mmu.scala 211:74]
  wire  memPort_canAcceptReq = memPort_isIdle | _memPort_T_1; // @[src/main/scala/mmu/Mmu.scala 221:32]
  wire [31:0] _memPort_tlbOut_paddr_T_2 = {20'h0,tlb_io_search_1_resp_bits_offset[11:0]}; // @[src/main/scala/mmu/Mmu.scala 30:10]
  wire [31:0] _memPort_tlbOut_paddr_T_4 = {10'h0,tlb_io_search_1_resp_bits_offset}; // @[src/main/scala/mmu/Mmu.scala 31:10]
  wire [31:0] memPort_tlbOut_paddr = tlb_io_search_1_resp_bits_ps == 6'hc ? _memPort_tlbOut_paddr_T_2 :
    _memPort_tlbOut_paddr_T_4; // @[src/main/scala/mmu/Mmu.scala 29:8]
  wire [4:0] _memPort_tlbOut_hasError_T = {3'h4,1'h0,memPort_addrMisaligned}; // @[src/main/scala/mmu/Mmu.scala 250:34]
  wire  memPort_tlbOut_hasError = |_memPort_tlbOut_hasError_T; // @[src/main/scala/mmu/Mmu.scala 250:41]
  wire [31:0] _memPort_io_toMem_bits_T_paddr = memPort_dmwHit ? memPort_dmwResp_paddr : memPort_tlbOut_paddr; // @[src/main/scala/mmu/Mmu.scala 253:25]
  wire  _memPort_io_toMem_bits_T_cacheable = memPort_dmwHit ? memPort_dmwResp_cacheable : 1'h1; // @[src/main/scala/mmu/Mmu.scala 253:25]
  wire  _memPort_io_toMem_bits_T_hasError = memPort_dmwHit ? memPort_directResp_hasError : memPort_tlbOut_hasError; // @[src/main/scala/mmu/Mmu.scala 253:25]
  wire  _memPort_io_toMem_bits_T_error_excpTlbRefill = memPort_dmwHit ? 1'h0 : 1'h1; // @[src/main/scala/mmu/Mmu.scala 253:25]
  Tlb tlb ( // @[src/main/scala/mmu/Mmu.scala 12:19]
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_search_0_req_ready(tlb_io_search_0_req_ready),
    .io_search_0_req_valid(tlb_io_search_0_req_valid),
    .io_search_0_req_bits_offset(tlb_io_search_0_req_bits_offset),
    .io_search_0_resp_ready(tlb_io_search_0_resp_ready),
    .io_search_0_resp_valid(tlb_io_search_0_resp_valid),
    .io_search_0_resp_bits_offset(tlb_io_search_0_resp_bits_offset),
    .io_search_0_resp_bits_ps(tlb_io_search_0_resp_bits_ps),
    .io_search_1_req_ready(tlb_io_search_1_req_ready),
    .io_search_1_req_valid(tlb_io_search_1_req_valid),
    .io_search_1_req_bits_offset(tlb_io_search_1_req_bits_offset),
    .io_search_1_resp_ready(tlb_io_search_1_resp_ready),
    .io_search_1_resp_valid(tlb_io_search_1_resp_valid),
    .io_search_1_resp_bits_offset(tlb_io_search_1_resp_bits_offset),
    .io_search_1_resp_bits_ps(tlb_io_search_1_resp_bits_ps)
  );
  assign io_fromIcache_ready = ifetchPort_canAcceptReq & (~ifetchPort_nextNeedSearch | tlb_io_search_0_req_ready); // @[src/main/scala/mmu/Mmu.scala 115:41]
  assign io_toIcache_valid = ifetchPort_state & (ifetchPort_addrMisaligned | isDirect | tlb_io_search_0_resp_valid |
    ifetchPort_dmwHit); // @[src/main/scala/mmu/Mmu.scala 122:33]
  assign io_toIcache_bits_paddr = isDirect ? ifetchPort_directResp_paddr : _ifetchPort_io_toIcache_bits_T_paddr; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_toIcache_bits_cacheable = isDirect ? ifetchPort_directResp_cacheable :
    _ifetchPort_io_toIcache_bits_T_cacheable; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_toIcache_bits_hasError = isDirect ? ifetchPort_directResp_hasError : _ifetchPort_io_toIcache_bits_T_hasError
    ; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_toIcache_bits_error_excpTlbRefill = isDirect ? _ifetchPort_directResp_error_WIRE_excpAle :
    _ifetchPort_io_toIcache_bits_T_error_excpTlbRefill; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_toIcache_bits_error_excpTlbPif = isDirect & _ifetchPort_directResp_error_WIRE_excpAle; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_toIcache_bits_error_excpTlbPpi = isDirect & _ifetchPort_directResp_error_WIRE_excpAle; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_toIcache_bits_error_excpAdef = isDirect ? ifetchPort_directResp_error_excpAdef : ifetchPort_addrMisaligned; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_toIcache_bits_error_excpAle = isDirect & _ifetchPort_directResp_error_WIRE_excpAle; // @[src/main/scala/mmu/Mmu.scala 139:29]
  assign io_fromMem_ready = memPort_canAcceptReq & (~memPort_nextNeedSearch | tlb_io_search_1_req_ready); // @[src/main/scala/mmu/Mmu.scala 229:38]
  assign io_toMem_valid = memPort_state & (memPort_addrMisaligned | isDirect | tlb_io_search_1_resp_valid |
    memPort_dmwHit); // @[src/main/scala/mmu/Mmu.scala 234:30]
  assign io_toMem_bits_paddr = isDirect ? memPort_reqBuffer_vaddr : _memPort_io_toMem_bits_T_paddr; // @[src/main/scala/mmu/Mmu.scala 252:25]
  assign io_toMem_bits_cacheable = isDirect ? memPort_directResp_cacheable : _memPort_io_toMem_bits_T_cacheable; // @[src/main/scala/mmu/Mmu.scala 252:25]
  assign io_toMem_bits_hasError = isDirect ? memPort_directResp_hasError : _memPort_io_toMem_bits_T_hasError; // @[src/main/scala/mmu/Mmu.scala 252:25]
  assign io_toMem_bits_error_excpTlbRefill = isDirect ? 1'h0 : _memPort_io_toMem_bits_T_error_excpTlbRefill; // @[src/main/scala/mmu/Mmu.scala 252:25]
  assign io_toMem_bits_error_excpTlbPif = 1'h0; // @[src/main/scala/mmu/Mmu.scala 252:25]
  assign io_toMem_bits_error_excpTlbPpi = 1'h0; // @[src/main/scala/mmu/Mmu.scala 252:25]
  assign io_toMem_bits_error_excpAdef = 1'h0; // @[src/main/scala/mmu/Mmu.scala 252:25]
  assign io_toMem_bits_error_excpAle = memPort_addrMisaligned_halfAccess & memPort_reqBuffer_vaddr[0] |
    memPort_addrMisaligned_wordAccess & memPort_reqBuffer_vaddr[1:0] != 2'h0; // @[src/main/scala/mmu/Mmu.scala 177:32]
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_search_0_req_valid = ifetchPort_canAcceptReq & io_fromIcache_valid & ifetchPort_nextNeedSearch; // @[src/main/scala/mmu/Mmu.scala 109:64]
  assign tlb_io_search_0_req_bits_offset = io_fromIcache_bits_vaddr[21:0]; // @[src/main/scala/mmu/Mmu.scala 112:37]
  assign tlb_io_search_0_resp_ready = ifetchPort_state & io_toIcache_ready; // @[src/main/scala/mmu/Mmu.scala 117:29]
  assign tlb_io_search_1_req_valid = memPort_canAcceptReq & io_fromMem_valid & memPort_nextNeedSearch; // @[src/main/scala/mmu/Mmu.scala 223:61]
  assign tlb_io_search_1_req_bits_offset = io_fromMem_bits_vaddr[21:0]; // @[src/main/scala/mmu/Mmu.scala 226:37]
  assign tlb_io_search_1_resp_ready = memPort_state & io_toMem_ready; // @[src/main/scala/mmu/Mmu.scala 231:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 44:24]
      ifetchPort_state <= 1'h0; // @[src/main/scala/mmu/Mmu.scala 44:24]
    end else begin
      ifetchPort_state <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 49:28]
      ifetchPort_reqBuffer_vaddr <= 32'h0; // @[src/main/scala/mmu/Mmu.scala 49:28]
    end else if (_ifetchPort_T) begin // @[src/main/scala/mmu/Mmu.scala 55:33]
      ifetchPort_reqBuffer_vaddr <= io_fromIcache_bits_vaddr; // @[src/main/scala/mmu/Mmu.scala 56:19]
    end
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 154:24]
      memPort_state <= 1'h0; // @[src/main/scala/mmu/Mmu.scala 154:24]
    end else begin
      memPort_state <= _GEN_13;
    end
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 158:28]
      memPort_reqBuffer_vaddr <= 32'h0; // @[src/main/scala/mmu/Mmu.scala 158:28]
    end else if (_memPort_T) begin // @[src/main/scala/mmu/Mmu.scala 164:30]
      memPort_reqBuffer_vaddr <= io_fromMem_bits_vaddr; // @[src/main/scala/mmu/Mmu.scala 165:19]
    end
    if (reset) begin // @[src/main/scala/mmu/Mmu.scala 158:28]
      memPort_reqBuffer_lsuOp <= 4'h0; // @[src/main/scala/mmu/Mmu.scala 158:28]
    end else if (_memPort_T) begin // @[src/main/scala/mmu/Mmu.scala 164:30]
      memPort_reqBuffer_lsuOp <= io_fromMem_bits_lsuOp; // @[src/main/scala/mmu/Mmu.scala 165:19]
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
  ifetchPort_state = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  ifetchPort_reqBuffer_vaddr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  memPort_state = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  memPort_reqBuffer_vaddr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  memPort_reqBuffer_lsuOp = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
