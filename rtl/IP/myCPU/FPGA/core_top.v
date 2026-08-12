module core_top(
  input         aclk, // @[src/main/scala/myCPU_top.scala 22:19]
  input         aresetn, // @[src/main/scala/myCPU_top.scala 23:19]
  input  [7:0]  intrpt, // @[src/main/scala/myCPU_top.scala 26:18]
  output [3:0]  arid, // @[src/main/scala/myCPU_top.scala 29:19]
  output [31:0] araddr, // @[src/main/scala/myCPU_top.scala 30:19]
  output [7:0]  arlen, // @[src/main/scala/myCPU_top.scala 31:19]
  output [2:0]  arsize, // @[src/main/scala/myCPU_top.scala 32:19]
  output [1:0]  arburst, // @[src/main/scala/myCPU_top.scala 33:19]
  output [1:0]  arlock, // @[src/main/scala/myCPU_top.scala 34:19]
  output [3:0]  arcache, // @[src/main/scala/myCPU_top.scala 35:19]
  output [2:0]  arprot, // @[src/main/scala/myCPU_top.scala 36:19]
  output        arvalid, // @[src/main/scala/myCPU_top.scala 37:19]
  input         arready, // @[src/main/scala/myCPU_top.scala 38:19]
  input  [3:0]  rid, // @[src/main/scala/myCPU_top.scala 41:18]
  input  [31:0] rdata, // @[src/main/scala/myCPU_top.scala 42:18]
  input  [1:0]  rresp, // @[src/main/scala/myCPU_top.scala 43:18]
  input         rlast, // @[src/main/scala/myCPU_top.scala 44:18]
  input         rvalid, // @[src/main/scala/myCPU_top.scala 45:18]
  output        rready, // @[src/main/scala/myCPU_top.scala 46:18]
  output [3:0]  awid, // @[src/main/scala/myCPU_top.scala 49:19]
  output [31:0] awaddr, // @[src/main/scala/myCPU_top.scala 50:19]
  output [7:0]  awlen, // @[src/main/scala/myCPU_top.scala 51:19]
  output [2:0]  awsize, // @[src/main/scala/myCPU_top.scala 52:19]
  output [1:0]  awburst, // @[src/main/scala/myCPU_top.scala 53:19]
  output [1:0]  awlock, // @[src/main/scala/myCPU_top.scala 54:19]
  output [3:0]  awcache, // @[src/main/scala/myCPU_top.scala 55:19]
  output [2:0]  awprot, // @[src/main/scala/myCPU_top.scala 56:19]
  output        awvalid, // @[src/main/scala/myCPU_top.scala 57:19]
  input         awready, // @[src/main/scala/myCPU_top.scala 58:19]
  output [3:0]  wid, // @[src/main/scala/myCPU_top.scala 61:18]
  output [31:0] wdata, // @[src/main/scala/myCPU_top.scala 62:18]
  output [3:0]  wstrb, // @[src/main/scala/myCPU_top.scala 63:18]
  output        wlast, // @[src/main/scala/myCPU_top.scala 64:18]
  output        wvalid, // @[src/main/scala/myCPU_top.scala 65:18]
  input         wready, // @[src/main/scala/myCPU_top.scala 66:18]
  input  [3:0]  bid, // @[src/main/scala/myCPU_top.scala 69:18]
  input  [1:0]  bresp, // @[src/main/scala/myCPU_top.scala 70:18]
  input         bvalid, // @[src/main/scala/myCPU_top.scala 71:18]
  output        bready, // @[src/main/scala/myCPU_top.scala 72:18]
  input         break_point, // @[src/main/scala/myCPU_top.scala 75:29]
  input         infor_flag, // @[src/main/scala/myCPU_top.scala 76:29]
  input  [4:0]  reg_num, // @[src/main/scala/myCPU_top.scala 77:29]
  output        ws_valid, // @[src/main/scala/myCPU_top.scala 78:29]
  output [31:0] rf_rdata, // @[src/main/scala/myCPU_top.scala 79:29]
  output [31:0] debug0_wb_pc, // @[src/main/scala/myCPU_top.scala 80:29]
  output        debug0_wb_rf_wen, // @[src/main/scala/myCPU_top.scala 81:29]
  output [4:0]  debug0_wb_rf_wnum, // @[src/main/scala/myCPU_top.scala 82:29]
  output [31:0] debug0_wb_rf_wdata, // @[src/main/scala/myCPU_top.scala 83:29]
  output [31:0] debug0_wb_inst // @[src/main/scala/myCPU_top.scala 84:29]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  frontend_clock; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_reset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_ready; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_0_bits_instr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_0_bits_pc; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_0_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [2:0] frontend_io_out_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_0_bits_exception_excpAle; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_ready; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_1_bits_instr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_1_bits_pc; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_1_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [2:0] frontend_io_out_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_1_bits_exception_excpAle; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_ready; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_2_bits_instr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_2_bits_pc; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_2_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_out_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [2:0] frontend_io_out_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_out_2_bits_exception_excpAle; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_bpuUpdateBr_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_bpuUpdateBr_pc; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_bpuUpdateBr_taken; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_bpuUpdateBr_target; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_bpuUpdateBr_oldPhtCounter; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_bpuUpdateBr_isJalr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_bpuUpdateBr_isJal; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [1:0] frontend_io_bpuUpdateBr_offset; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_redirectInfo_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_redirectInfo_bits_doRedirect; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_redirectInfo_bits_target; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_toMmu_ready; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_toMmu_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_mmu_toMmu_bits_vaddr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_fromMmu_valid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_mmu_fromMmu_bits_paddr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_fromMmu_bits_cacheable; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpTlbPif; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpAdef; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpAle; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [3:0] frontend_io_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [7:0] frontend_io_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [2:0] frontend_io_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_axi_master_ar_arready; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [3:0] frontend_io_axi_master_r_data_rid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire [31:0] frontend_io_axi_master_r_data_rdata; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_axi_master_r_data_rlast; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_axi_master_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  frontend_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 105:24]
  wire  backend_clock; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_reset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_ready; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_0_bits_instr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_0_bits_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_0_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_0_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_in_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_0_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_ready; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_1_bits_instr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_1_bits_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_1_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_1_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_in_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_1_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_ready; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_2_bits_instr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_2_bits_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_2_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_2_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_in_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_in_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_in_2_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_redirectInfo_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_redirectInfo_bits_doRedirect; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_redirectInfo_bits_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [13:0] backend_io_csrReq_addr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_csrResp_data; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_extInt; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_req_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_req_bits_isLoad; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_req_bits_isStore; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_req_bits_sqIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_req_bits_lqIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_inst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_lsEnq_toLsqData_ctrl_aluOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_bruOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_csrOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_mulOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_divOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_src1Type; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_src2Type; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_immType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_memWrite; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_csrWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_isBranch; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_isJump; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_isPriv; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [16:0] backend_io_lsEnq_toLsqData_excp_excpVec; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_imm; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [13:0] backend_io_lsEnq_toLsqData_csrAddress; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_lsEnq_toLsqData_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_lsEnq_toLsqData_ldst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_lsEnq_toLsqData_lrs1; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_lsEnq_toLsqData_lrs2; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_lsEnq_toLsqData_pdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_lsEnq_toLsqData_prs1; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_lsEnq_toLsqData_prs2; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_lsEnq_toLsqData_oldPdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_snptId_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_lsEnq_toLsqData_snptId_bits; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_rs1Valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_rs2Valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_rdValid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_lsEnq_toLsqData_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_toLsqData_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_lqFull; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_lsEnq_sqFull; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_ready; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_inst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_ctrl_aluOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_bruOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_csrOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_mulOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_divOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_src1Type; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_src2Type; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_immType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_memWrite; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_csrWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_isBranch; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_isJump; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_isPriv; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [16:0] backend_io_toMemResult_0_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_imm; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [13:0] backend_io_toMemResult_0_bits_uop_csrAddress; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_toMemResult_0_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_ldst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_lrs1; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_lrs2; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_prs1; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_prs2; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_oldPdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_rs1Valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_rs2Valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_rdValid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_snptId_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_snptId_bits; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_toMemResult_0_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_toMemResult_0_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_lqIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_sqIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_issueQueue; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_prs1Busy; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_prs2Busy; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_isSta; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_uop_isStd; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_data; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_redirect_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_redirect_bits_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_toMemResult_0_bits_redirect_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_redirect_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_memValid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_memRead; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_memWrite; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_memStoreData; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_0_bits_csrWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [13:0] backend_io_toMemResult_0_bits_csrWaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_0_bits_csrWdata; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [63:0] backend_io_toMemResult_0_bits_csrTimer; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_ready; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_inst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_ctrl_aluOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_bruOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_csrOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_mulOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_divOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_src1Type; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_src2Type; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_immType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_memWrite; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_csrWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_isBranch; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_isJump; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_isPriv; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [16:0] backend_io_toMemResult_1_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_imm; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [13:0] backend_io_toMemResult_1_bits_uop_csrAddress; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_toMemResult_1_bits_uop_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_ldst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_lrs1; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_lrs2; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_prs1; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_prs2; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_oldPdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_rs1Valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_rs2Valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_rdValid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_snptId_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_snptId_bits; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_toMemResult_1_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_toMemResult_1_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_lqIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_sqIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_issueQueue; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_prs1Busy; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_prs2Busy; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_isSta; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_uop_isStd; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_data; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_redirect_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_redirect_bits_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_toMemResult_1_bits_redirect_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_redirect_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_memValid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_memRead; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_memWrite; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_memStoreData; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_toMemResult_1_bits_csrWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [13:0] backend_io_toMemResult_1_bits_csrWaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_toMemResult_1_bits_csrWdata; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [63:0] backend_io_toMemResult_1_bits_csrTimer; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_0_ready; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_0_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_0_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_0_bits_uop_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [16:0] backend_io_fromMemResult_0_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_fromMemResult_0_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_0_bits_uop_rdValid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_fromMemResult_0_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_0_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_fromMemResult_0_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_0_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_0_bits_data; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_0_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_0_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_1_ready; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_1_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_1_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [16:0] backend_io_fromMemResult_1_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [6:0] backend_io_fromMemResult_1_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_fromMemResult_1_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_1_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_fromMemResult_1_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_1_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_fromMemResult_1_bits_redirect_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_fromMemResult_1_bits_redirect_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_1_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_1_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_fromMemResult_1_bits_memStoreData; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_commitToSq_valid_0; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_commitToSq_valid_1; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_commitToSq_valid_2; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_commitToSq_bits_0_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_commitToSq_bits_1_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [3:0] backend_io_commitToSq_bits_2_sqIdx_value; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_commitToCsr_csrWen; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [13:0] backend_io_commitToCsr_csrWaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_commitToCsr_csrWdata; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_excpEvent_excp; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_excpEvent_ertn; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_excpInfo_vaddrError; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_excpInfo_era; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [5:0] backend_io_excpInfo_ecode; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_excpInfo_badVaddr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_redirectAddrFromCsr_eentry; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_redirectAddrFromCsr_era; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_timerInfo_tid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [63:0] backend_io_timerInfo_timer; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_bpuUpdate_valid; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_bpuUpdate_pc; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_bpuUpdate_taken; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [31:0] backend_io_bpuUpdate_target; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_bpuUpdate_oldPhtCounter; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_bpuUpdate_isJalr; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  backend_io_bpuUpdate_isJal; // @[src/main/scala/myCPU_top.scala 106:23]
  wire [1:0] backend_io_bpuUpdate_offset; // @[src/main/scala/myCPU_top.scala 106:23]
  wire  memory_clock; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_reset; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_lsEnq_req_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [5:0] memory_io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_lsEnq_req_bits_isLoad; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_lsEnq_req_bits_isStore; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_lsEnq_toLsqData_pc; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [6:0] memory_io_lsEnq_toLsqData_pdst; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_lsEnq_lqFull; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_lsEnq_sqFull; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_ready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [16:0] memory_io_fromExeMmuResult_bits_exeRes_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_bits_exeRes_uop_isSta; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_fromExeMmuResult_bits_exeRes_data; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_fromExeMmuResult_bits_mmuRes_paddr; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_bits_mmuRes_cacheable; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_bits_mmuRes_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_bits_mmuRes_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeMmuResult_bits_mmuRes_error_excpAle; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeResult_ready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeResult_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_fromExeResult_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_fromExeResult_bits_uop_isStd; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_fromExeResult_bits_data; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_0_ready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_0_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_0_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_0_bits_uop_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [16:0] memory_io_toWbResult_0_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [6:0] memory_io_toWbResult_0_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_0_bits_uop_rdValid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [5:0] memory_io_toWbResult_0_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_0_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [5:0] memory_io_toWbResult_0_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_0_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_0_bits_data; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_0_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_0_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_1_ready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_1_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_1_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [16:0] memory_io_toWbResult_1_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [6:0] memory_io_toWbResult_1_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [5:0] memory_io_toWbResult_1_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_1_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [5:0] memory_io_toWbResult_1_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_1_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [5:0] memory_io_toWbResult_1_bits_redirect_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_toWbResult_1_bits_redirect_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_1_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_1_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_toWbResult_1_bits_memStoreData; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_robCommit_0_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_robCommit_0_sqIdx; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_robCommit_1_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_robCommit_1_sqIdx; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_robCommit_2_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_robCommit_2_sqIdx; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_axi_ar_data_arid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_axi_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [7:0] memory_io_axi_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [2:0] memory_io_axi_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_ar_arready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_axi_aw_data_awid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_axi_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [7:0] memory_io_axi_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [2:0] memory_io_axi_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_aw_awready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_axi_w_data_wid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_axi_w_data_wdata; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_axi_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_w_data_wlast; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_w_wready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_axi_r_data_rid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [31:0] memory_io_axi_r_data_rdata; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_r_data_rlast; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_r_rready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [3:0] memory_io_axi_b_data_bid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_axi_b_bready; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_redirectInfo_valid; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_redirectInfo_bits_doRedirect; // @[src/main/scala/myCPU_top.scala 107:22]
  wire [5:0] memory_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  memory_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 107:22]
  wire  mmu_clock; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_reset; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [1:0] mmu_io_fromCsr_plv; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [1:0] mmu_io_fromCsr_pgda; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [31:0] mmu_io_fromCsr_dmw0; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [31:0] mmu_io_fromCsr_dmw1; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [1:0] mmu_io_fromCsr_datm; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [1:0] mmu_io_fromCsr_datf; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_fromIcache_ready; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_fromIcache_valid; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [31:0] mmu_io_fromIcache_bits_vaddr; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_ready; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_valid; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [31:0] mmu_io_toIcache_bits_paddr; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_bits_cacheable; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_bits_hasError; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_bits_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_bits_error_excpTlbPif; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_bits_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_bits_error_excpAdef; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toIcache_bits_error_excpAle; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_fromMem_ready; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_fromMem_valid; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [31:0] mmu_io_fromMem_bits_vaddr; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [3:0] mmu_io_fromMem_bits_lsuOp; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_ready; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_valid; // @[src/main/scala/myCPU_top.scala 108:19]
  wire [31:0] mmu_io_toMem_bits_paddr; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_bits_cacheable; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_bits_hasError; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_bits_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_bits_error_excpTlbPif; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_bits_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_bits_error_excpAdef; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  mmu_io_toMem_bits_error_excpAle; // @[src/main/scala/myCPU_top.scala 108:19]
  wire  memaddrtrans_clock; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_reset; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_ready; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_valid; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_in_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_bits_uop_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [16:0] memaddrtrans_io_in_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_in_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_in_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_bits_uop_isSta; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_in_bits_data; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_valid; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_exeRes_uop_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [16:0] memaddrtrans_io_out_bits_exeRes_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_out_bits_exeRes_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_out_bits_exeRes_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_exeRes_uop_isSta; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_out_bits_exeRes_data; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_out_bits_mmuRes_paddr; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_mmuRes_cacheable; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_mmuRes_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_mmuRes_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_mmuRes_error_excpAle; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuReq_ready; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuReq_valid; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_mmuReq_bits_vaddr; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_mmuReq_bits_lsuOp; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuResp_valid; // @[src/main/scala/myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_mmuResp_bits_paddr; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuResp_bits_cacheable; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuResp_bits_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuResp_bits_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuResp_bits_error_excpAle; // @[src/main/scala/myCPU_top.scala 124:28]
  wire  csr_clock; // @[src/main/scala/myCPU_top.scala 169:19]
  wire  csr_reset; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [7:0] csr_io_irqBus; // @[src/main/scala/myCPU_top.scala 169:19]
  wire  csr_io_hasIrq; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [13:0] csr_io_rReq_addr; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_rResp_data; // @[src/main/scala/myCPU_top.scala 169:19]
  wire  csr_io_wReq_wen; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [13:0] csr_io_wReq_addr; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_wReq_data; // @[src/main/scala/myCPU_top.scala 169:19]
  wire  csr_io_excpEvent_excp; // @[src/main/scala/myCPU_top.scala 169:19]
  wire  csr_io_excpEvent_ertn; // @[src/main/scala/myCPU_top.scala 169:19]
  wire  csr_io_excpInfo_vaddrError; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_excpInfo_era; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [5:0] csr_io_excpInfo_ecode; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_excpInfo_badVaddr; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_redirectAddr_eentry; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_redirectAddr_era; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_timerInfo_tid; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [63:0] csr_io_timerInfo_timer; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [1:0] csr_io_priv_plv; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [1:0] csr_io_tlbCtrl_pgda; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_tlbCtrl_dmw0; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [31:0] csr_io_tlbCtrl_dmw1; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [1:0] csr_io_cacheCtrl_datm; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [1:0] csr_io_cacheCtrl_datf; // @[src/main/scala/myCPU_top.scala 169:19]
  wire [3:0] axi_crossbar_io_in_icache_ar_data_arid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_in_icache_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [7:0] axi_crossbar_io_in_icache_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_icache_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_in_icache_r_data_rid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_in_icache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_icache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_icache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_icache_r_rready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_data_arid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_in_dcache_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [7:0] axi_crossbar_io_in_dcache_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_data_awid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_in_dcache_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [7:0] axi_crossbar_io_in_dcache_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_in_dcache_w_data_wdata; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_w_data_wlast; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_in_dcache_r_data_rid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_in_dcache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_r_rready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_in_dcache_b_data_bid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_in_dcache_b_bready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_out_ar_data_arid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_out_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [7:0] axi_crossbar_io_out_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [2:0] axi_crossbar_io_out_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_ar_arready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_out_aw_data_awid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_out_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [7:0] axi_crossbar_io_out_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [2:0] axi_crossbar_io_out_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_aw_awready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_out_w_data_wid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_out_w_data_wdata; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_out_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_w_data_wlast; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_w_wready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_out_r_data_rid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [31:0] axi_crossbar_io_out_r_data_rdata; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_r_data_rlast; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 204:28]
  wire [3:0] axi_crossbar_io_out_b_data_bid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 204:28]
  wire  axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 204:28]
  reg  rst_d1; // @[src/main/scala/myCPU_top.scala 97:25]
  Frontend frontend ( // @[src/main/scala/myCPU_top.scala 105:24]
    .clock(frontend_clock),
    .reset(frontend_reset),
    .io_out_0_ready(frontend_io_out_0_ready),
    .io_out_0_valid(frontend_io_out_0_valid),
    .io_out_0_bits_instr(frontend_io_out_0_bits_instr),
    .io_out_0_bits_pc(frontend_io_out_0_bits_pc),
    .io_out_0_bits_pdInfo_valid(frontend_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(frontend_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(frontend_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(frontend_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(frontend_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(frontend_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(frontend_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_0_bits_bpuInfo_pc(frontend_io_out_0_bits_bpuInfo_pc),
    .io_out_0_bits_bpuInfo_fallThrough(frontend_io_out_0_bits_bpuInfo_fallThrough),
    .io_out_0_bits_bpuInfo_taken(frontend_io_out_0_bits_bpuInfo_taken),
    .io_out_0_bits_bpuInfo_target(frontend_io_out_0_bits_bpuInfo_target),
    .io_out_0_bits_bpuInfo_takenOffset(frontend_io_out_0_bits_bpuInfo_takenOffset),
    .io_out_0_bits_bpuInfo_meta_valid(frontend_io_out_0_bits_bpuInfo_meta_valid),
    .io_out_0_bits_bpuInfo_meta_btbHit(frontend_io_out_0_bits_bpuInfo_meta_btbHit),
    .io_out_0_bits_bpuInfo_meta_btbIsJalr(frontend_io_out_0_bits_bpuInfo_meta_btbIsJalr),
    .io_out_0_bits_bpuInfo_meta_btbIsJal(frontend_io_out_0_bits_bpuInfo_meta_btbIsJal),
    .io_out_0_bits_bpuInfo_meta_btbIsCall(frontend_io_out_0_bits_bpuInfo_meta_btbIsCall),
    .io_out_0_bits_bpuInfo_meta_btbIsRet(frontend_io_out_0_bits_bpuInfo_meta_btbIsRet),
    .io_out_0_bits_bpuInfo_meta_btbOffset(frontend_io_out_0_bits_bpuInfo_meta_btbOffset),
    .io_out_0_bits_bpuInfo_meta_phtCounter(frontend_io_out_0_bits_bpuInfo_meta_phtCounter),
    .io_out_0_bits_bpuInfo_meta_rasTop(frontend_io_out_0_bits_bpuInfo_meta_rasTop),
    .io_out_0_bits_bpuInfo_meta_predTaken(frontend_io_out_0_bits_bpuInfo_meta_predTaken),
    .io_out_0_bits_bpuInfo_meta_predTarget(frontend_io_out_0_bits_bpuInfo_meta_predTarget),
    .io_out_0_bits_exception_excpTlbRefill(frontend_io_out_0_bits_exception_excpTlbRefill),
    .io_out_0_bits_exception_excpTlbPif(frontend_io_out_0_bits_exception_excpTlbPif),
    .io_out_0_bits_exception_excpTlbPpi(frontend_io_out_0_bits_exception_excpTlbPpi),
    .io_out_0_bits_exception_excpAdef(frontend_io_out_0_bits_exception_excpAdef),
    .io_out_0_bits_exception_excpAle(frontend_io_out_0_bits_exception_excpAle),
    .io_out_1_ready(frontend_io_out_1_ready),
    .io_out_1_valid(frontend_io_out_1_valid),
    .io_out_1_bits_instr(frontend_io_out_1_bits_instr),
    .io_out_1_bits_pc(frontend_io_out_1_bits_pc),
    .io_out_1_bits_pdInfo_valid(frontend_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(frontend_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(frontend_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(frontend_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(frontend_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(frontend_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(frontend_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_1_bits_bpuInfo_pc(frontend_io_out_1_bits_bpuInfo_pc),
    .io_out_1_bits_bpuInfo_fallThrough(frontend_io_out_1_bits_bpuInfo_fallThrough),
    .io_out_1_bits_bpuInfo_taken(frontend_io_out_1_bits_bpuInfo_taken),
    .io_out_1_bits_bpuInfo_target(frontend_io_out_1_bits_bpuInfo_target),
    .io_out_1_bits_bpuInfo_takenOffset(frontend_io_out_1_bits_bpuInfo_takenOffset),
    .io_out_1_bits_bpuInfo_meta_valid(frontend_io_out_1_bits_bpuInfo_meta_valid),
    .io_out_1_bits_bpuInfo_meta_btbHit(frontend_io_out_1_bits_bpuInfo_meta_btbHit),
    .io_out_1_bits_bpuInfo_meta_btbIsJalr(frontend_io_out_1_bits_bpuInfo_meta_btbIsJalr),
    .io_out_1_bits_bpuInfo_meta_btbIsJal(frontend_io_out_1_bits_bpuInfo_meta_btbIsJal),
    .io_out_1_bits_bpuInfo_meta_btbIsCall(frontend_io_out_1_bits_bpuInfo_meta_btbIsCall),
    .io_out_1_bits_bpuInfo_meta_btbIsRet(frontend_io_out_1_bits_bpuInfo_meta_btbIsRet),
    .io_out_1_bits_bpuInfo_meta_btbOffset(frontend_io_out_1_bits_bpuInfo_meta_btbOffset),
    .io_out_1_bits_bpuInfo_meta_phtCounter(frontend_io_out_1_bits_bpuInfo_meta_phtCounter),
    .io_out_1_bits_bpuInfo_meta_rasTop(frontend_io_out_1_bits_bpuInfo_meta_rasTop),
    .io_out_1_bits_bpuInfo_meta_predTaken(frontend_io_out_1_bits_bpuInfo_meta_predTaken),
    .io_out_1_bits_bpuInfo_meta_predTarget(frontend_io_out_1_bits_bpuInfo_meta_predTarget),
    .io_out_1_bits_exception_excpTlbRefill(frontend_io_out_1_bits_exception_excpTlbRefill),
    .io_out_1_bits_exception_excpTlbPif(frontend_io_out_1_bits_exception_excpTlbPif),
    .io_out_1_bits_exception_excpTlbPpi(frontend_io_out_1_bits_exception_excpTlbPpi),
    .io_out_1_bits_exception_excpAdef(frontend_io_out_1_bits_exception_excpAdef),
    .io_out_1_bits_exception_excpAle(frontend_io_out_1_bits_exception_excpAle),
    .io_out_2_ready(frontend_io_out_2_ready),
    .io_out_2_valid(frontend_io_out_2_valid),
    .io_out_2_bits_instr(frontend_io_out_2_bits_instr),
    .io_out_2_bits_pc(frontend_io_out_2_bits_pc),
    .io_out_2_bits_pdInfo_valid(frontend_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(frontend_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(frontend_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(frontend_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(frontend_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(frontend_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(frontend_io_out_2_bits_pdInfo_jumpTarget),
    .io_out_2_bits_bpuInfo_pc(frontend_io_out_2_bits_bpuInfo_pc),
    .io_out_2_bits_bpuInfo_fallThrough(frontend_io_out_2_bits_bpuInfo_fallThrough),
    .io_out_2_bits_bpuInfo_taken(frontend_io_out_2_bits_bpuInfo_taken),
    .io_out_2_bits_bpuInfo_target(frontend_io_out_2_bits_bpuInfo_target),
    .io_out_2_bits_bpuInfo_takenOffset(frontend_io_out_2_bits_bpuInfo_takenOffset),
    .io_out_2_bits_bpuInfo_meta_valid(frontend_io_out_2_bits_bpuInfo_meta_valid),
    .io_out_2_bits_bpuInfo_meta_btbHit(frontend_io_out_2_bits_bpuInfo_meta_btbHit),
    .io_out_2_bits_bpuInfo_meta_btbIsJalr(frontend_io_out_2_bits_bpuInfo_meta_btbIsJalr),
    .io_out_2_bits_bpuInfo_meta_btbIsJal(frontend_io_out_2_bits_bpuInfo_meta_btbIsJal),
    .io_out_2_bits_bpuInfo_meta_btbIsCall(frontend_io_out_2_bits_bpuInfo_meta_btbIsCall),
    .io_out_2_bits_bpuInfo_meta_btbIsRet(frontend_io_out_2_bits_bpuInfo_meta_btbIsRet),
    .io_out_2_bits_bpuInfo_meta_btbOffset(frontend_io_out_2_bits_bpuInfo_meta_btbOffset),
    .io_out_2_bits_bpuInfo_meta_phtCounter(frontend_io_out_2_bits_bpuInfo_meta_phtCounter),
    .io_out_2_bits_bpuInfo_meta_rasTop(frontend_io_out_2_bits_bpuInfo_meta_rasTop),
    .io_out_2_bits_bpuInfo_meta_predTaken(frontend_io_out_2_bits_bpuInfo_meta_predTaken),
    .io_out_2_bits_bpuInfo_meta_predTarget(frontend_io_out_2_bits_bpuInfo_meta_predTarget),
    .io_out_2_bits_exception_excpTlbRefill(frontend_io_out_2_bits_exception_excpTlbRefill),
    .io_out_2_bits_exception_excpTlbPif(frontend_io_out_2_bits_exception_excpTlbPif),
    .io_out_2_bits_exception_excpTlbPpi(frontend_io_out_2_bits_exception_excpTlbPpi),
    .io_out_2_bits_exception_excpAdef(frontend_io_out_2_bits_exception_excpAdef),
    .io_out_2_bits_exception_excpAle(frontend_io_out_2_bits_exception_excpAle),
    .io_bpuUpdateBr_valid(frontend_io_bpuUpdateBr_valid),
    .io_bpuUpdateBr_pc(frontend_io_bpuUpdateBr_pc),
    .io_bpuUpdateBr_taken(frontend_io_bpuUpdateBr_taken),
    .io_bpuUpdateBr_target(frontend_io_bpuUpdateBr_target),
    .io_bpuUpdateBr_oldPhtCounter(frontend_io_bpuUpdateBr_oldPhtCounter),
    .io_bpuUpdateBr_isJalr(frontend_io_bpuUpdateBr_isJalr),
    .io_bpuUpdateBr_isJal(frontend_io_bpuUpdateBr_isJal),
    .io_bpuUpdateBr_offset(frontend_io_bpuUpdateBr_offset),
    .io_redirectInfo_valid(frontend_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(frontend_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_target(frontend_io_redirectInfo_bits_target),
    .io_mmu_toMmu_ready(frontend_io_mmu_toMmu_ready),
    .io_mmu_toMmu_valid(frontend_io_mmu_toMmu_valid),
    .io_mmu_toMmu_bits_vaddr(frontend_io_mmu_toMmu_bits_vaddr),
    .io_mmu_fromMmu_valid(frontend_io_mmu_fromMmu_valid),
    .io_mmu_fromMmu_bits_paddr(frontend_io_mmu_fromMmu_bits_paddr),
    .io_mmu_fromMmu_bits_cacheable(frontend_io_mmu_fromMmu_bits_cacheable),
    .io_mmu_fromMmu_bits_error_excpTlbRefill(frontend_io_mmu_fromMmu_bits_error_excpTlbRefill),
    .io_mmu_fromMmu_bits_error_excpTlbPif(frontend_io_mmu_fromMmu_bits_error_excpTlbPif),
    .io_mmu_fromMmu_bits_error_excpTlbPpi(frontend_io_mmu_fromMmu_bits_error_excpTlbPpi),
    .io_mmu_fromMmu_bits_error_excpAdef(frontend_io_mmu_fromMmu_bits_error_excpAdef),
    .io_mmu_fromMmu_bits_error_excpAle(frontend_io_mmu_fromMmu_bits_error_excpAle),
    .io_axi_master_ar_data_arid(frontend_io_axi_master_ar_data_arid),
    .io_axi_master_ar_data_araddr(frontend_io_axi_master_ar_data_araddr),
    .io_axi_master_ar_data_arlen(frontend_io_axi_master_ar_data_arlen),
    .io_axi_master_ar_data_arsize(frontend_io_axi_master_ar_data_arsize),
    .io_axi_master_ar_data_arvalid(frontend_io_axi_master_ar_data_arvalid),
    .io_axi_master_ar_arready(frontend_io_axi_master_ar_arready),
    .io_axi_master_r_data_rid(frontend_io_axi_master_r_data_rid),
    .io_axi_master_r_data_rdata(frontend_io_axi_master_r_data_rdata),
    .io_axi_master_r_data_rlast(frontend_io_axi_master_r_data_rlast),
    .io_axi_master_r_data_rvalid(frontend_io_axi_master_r_data_rvalid),
    .io_axi_master_r_rready(frontend_io_axi_master_r_rready)
  );
  Backend backend ( // @[src/main/scala/myCPU_top.scala 106:23]
    .clock(backend_clock),
    .reset(backend_reset),
    .io_in_0_ready(backend_io_in_0_ready),
    .io_in_0_valid(backend_io_in_0_valid),
    .io_in_0_bits_instr(backend_io_in_0_bits_instr),
    .io_in_0_bits_pc(backend_io_in_0_bits_pc),
    .io_in_0_bits_pdInfo_valid(backend_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(backend_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(backend_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(backend_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(backend_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(backend_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(backend_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_bpuInfo_pc(backend_io_in_0_bits_bpuInfo_pc),
    .io_in_0_bits_bpuInfo_fallThrough(backend_io_in_0_bits_bpuInfo_fallThrough),
    .io_in_0_bits_bpuInfo_taken(backend_io_in_0_bits_bpuInfo_taken),
    .io_in_0_bits_bpuInfo_target(backend_io_in_0_bits_bpuInfo_target),
    .io_in_0_bits_bpuInfo_takenOffset(backend_io_in_0_bits_bpuInfo_takenOffset),
    .io_in_0_bits_bpuInfo_meta_valid(backend_io_in_0_bits_bpuInfo_meta_valid),
    .io_in_0_bits_bpuInfo_meta_btbHit(backend_io_in_0_bits_bpuInfo_meta_btbHit),
    .io_in_0_bits_bpuInfo_meta_btbIsJalr(backend_io_in_0_bits_bpuInfo_meta_btbIsJalr),
    .io_in_0_bits_bpuInfo_meta_btbIsJal(backend_io_in_0_bits_bpuInfo_meta_btbIsJal),
    .io_in_0_bits_bpuInfo_meta_btbIsCall(backend_io_in_0_bits_bpuInfo_meta_btbIsCall),
    .io_in_0_bits_bpuInfo_meta_btbIsRet(backend_io_in_0_bits_bpuInfo_meta_btbIsRet),
    .io_in_0_bits_bpuInfo_meta_btbOffset(backend_io_in_0_bits_bpuInfo_meta_btbOffset),
    .io_in_0_bits_bpuInfo_meta_phtCounter(backend_io_in_0_bits_bpuInfo_meta_phtCounter),
    .io_in_0_bits_bpuInfo_meta_rasTop(backend_io_in_0_bits_bpuInfo_meta_rasTop),
    .io_in_0_bits_bpuInfo_meta_predTaken(backend_io_in_0_bits_bpuInfo_meta_predTaken),
    .io_in_0_bits_bpuInfo_meta_predTarget(backend_io_in_0_bits_bpuInfo_meta_predTarget),
    .io_in_0_bits_exception_excpTlbRefill(backend_io_in_0_bits_exception_excpTlbRefill),
    .io_in_0_bits_exception_excpTlbPif(backend_io_in_0_bits_exception_excpTlbPif),
    .io_in_0_bits_exception_excpTlbPpi(backend_io_in_0_bits_exception_excpTlbPpi),
    .io_in_0_bits_exception_excpAdef(backend_io_in_0_bits_exception_excpAdef),
    .io_in_1_ready(backend_io_in_1_ready),
    .io_in_1_valid(backend_io_in_1_valid),
    .io_in_1_bits_instr(backend_io_in_1_bits_instr),
    .io_in_1_bits_pc(backend_io_in_1_bits_pc),
    .io_in_1_bits_pdInfo_valid(backend_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(backend_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(backend_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(backend_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(backend_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(backend_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(backend_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_bpuInfo_pc(backend_io_in_1_bits_bpuInfo_pc),
    .io_in_1_bits_bpuInfo_fallThrough(backend_io_in_1_bits_bpuInfo_fallThrough),
    .io_in_1_bits_bpuInfo_taken(backend_io_in_1_bits_bpuInfo_taken),
    .io_in_1_bits_bpuInfo_target(backend_io_in_1_bits_bpuInfo_target),
    .io_in_1_bits_bpuInfo_takenOffset(backend_io_in_1_bits_bpuInfo_takenOffset),
    .io_in_1_bits_bpuInfo_meta_valid(backend_io_in_1_bits_bpuInfo_meta_valid),
    .io_in_1_bits_bpuInfo_meta_btbHit(backend_io_in_1_bits_bpuInfo_meta_btbHit),
    .io_in_1_bits_bpuInfo_meta_btbIsJalr(backend_io_in_1_bits_bpuInfo_meta_btbIsJalr),
    .io_in_1_bits_bpuInfo_meta_btbIsJal(backend_io_in_1_bits_bpuInfo_meta_btbIsJal),
    .io_in_1_bits_bpuInfo_meta_btbIsCall(backend_io_in_1_bits_bpuInfo_meta_btbIsCall),
    .io_in_1_bits_bpuInfo_meta_btbIsRet(backend_io_in_1_bits_bpuInfo_meta_btbIsRet),
    .io_in_1_bits_bpuInfo_meta_btbOffset(backend_io_in_1_bits_bpuInfo_meta_btbOffset),
    .io_in_1_bits_bpuInfo_meta_phtCounter(backend_io_in_1_bits_bpuInfo_meta_phtCounter),
    .io_in_1_bits_bpuInfo_meta_rasTop(backend_io_in_1_bits_bpuInfo_meta_rasTop),
    .io_in_1_bits_bpuInfo_meta_predTaken(backend_io_in_1_bits_bpuInfo_meta_predTaken),
    .io_in_1_bits_bpuInfo_meta_predTarget(backend_io_in_1_bits_bpuInfo_meta_predTarget),
    .io_in_1_bits_exception_excpTlbRefill(backend_io_in_1_bits_exception_excpTlbRefill),
    .io_in_1_bits_exception_excpTlbPif(backend_io_in_1_bits_exception_excpTlbPif),
    .io_in_1_bits_exception_excpTlbPpi(backend_io_in_1_bits_exception_excpTlbPpi),
    .io_in_1_bits_exception_excpAdef(backend_io_in_1_bits_exception_excpAdef),
    .io_in_2_ready(backend_io_in_2_ready),
    .io_in_2_valid(backend_io_in_2_valid),
    .io_in_2_bits_instr(backend_io_in_2_bits_instr),
    .io_in_2_bits_pc(backend_io_in_2_bits_pc),
    .io_in_2_bits_pdInfo_valid(backend_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(backend_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(backend_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(backend_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(backend_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(backend_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(backend_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_bpuInfo_pc(backend_io_in_2_bits_bpuInfo_pc),
    .io_in_2_bits_bpuInfo_fallThrough(backend_io_in_2_bits_bpuInfo_fallThrough),
    .io_in_2_bits_bpuInfo_taken(backend_io_in_2_bits_bpuInfo_taken),
    .io_in_2_bits_bpuInfo_target(backend_io_in_2_bits_bpuInfo_target),
    .io_in_2_bits_bpuInfo_takenOffset(backend_io_in_2_bits_bpuInfo_takenOffset),
    .io_in_2_bits_bpuInfo_meta_valid(backend_io_in_2_bits_bpuInfo_meta_valid),
    .io_in_2_bits_bpuInfo_meta_btbHit(backend_io_in_2_bits_bpuInfo_meta_btbHit),
    .io_in_2_bits_bpuInfo_meta_btbIsJalr(backend_io_in_2_bits_bpuInfo_meta_btbIsJalr),
    .io_in_2_bits_bpuInfo_meta_btbIsJal(backend_io_in_2_bits_bpuInfo_meta_btbIsJal),
    .io_in_2_bits_bpuInfo_meta_btbIsCall(backend_io_in_2_bits_bpuInfo_meta_btbIsCall),
    .io_in_2_bits_bpuInfo_meta_btbIsRet(backend_io_in_2_bits_bpuInfo_meta_btbIsRet),
    .io_in_2_bits_bpuInfo_meta_btbOffset(backend_io_in_2_bits_bpuInfo_meta_btbOffset),
    .io_in_2_bits_bpuInfo_meta_phtCounter(backend_io_in_2_bits_bpuInfo_meta_phtCounter),
    .io_in_2_bits_bpuInfo_meta_rasTop(backend_io_in_2_bits_bpuInfo_meta_rasTop),
    .io_in_2_bits_bpuInfo_meta_predTaken(backend_io_in_2_bits_bpuInfo_meta_predTaken),
    .io_in_2_bits_bpuInfo_meta_predTarget(backend_io_in_2_bits_bpuInfo_meta_predTarget),
    .io_in_2_bits_exception_excpTlbRefill(backend_io_in_2_bits_exception_excpTlbRefill),
    .io_in_2_bits_exception_excpTlbPif(backend_io_in_2_bits_exception_excpTlbPif),
    .io_in_2_bits_exception_excpTlbPpi(backend_io_in_2_bits_exception_excpTlbPpi),
    .io_in_2_bits_exception_excpAdef(backend_io_in_2_bits_exception_excpAdef),
    .io_redirectInfo_valid(backend_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(backend_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(backend_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(backend_io_redirectInfo_bits_robIdx_flag),
    .io_redirectInfo_bits_target(backend_io_redirectInfo_bits_target),
    .io_csrReq_addr(backend_io_csrReq_addr),
    .io_csrResp_data(backend_io_csrResp_data),
    .io_extInt(backend_io_extInt),
    .io_lsEnq_req_valid(backend_io_lsEnq_req_valid),
    .io_lsEnq_req_bits_robIdx_value(backend_io_lsEnq_req_bits_robIdx_value),
    .io_lsEnq_req_bits_robIdx_flag(backend_io_lsEnq_req_bits_robIdx_flag),
    .io_lsEnq_req_bits_isLoad(backend_io_lsEnq_req_bits_isLoad),
    .io_lsEnq_req_bits_isStore(backend_io_lsEnq_req_bits_isStore),
    .io_lsEnq_req_bits_sqIdx_value(backend_io_lsEnq_req_bits_sqIdx_value),
    .io_lsEnq_req_bits_sqIdx_flag(backend_io_lsEnq_req_bits_sqIdx_flag),
    .io_lsEnq_req_bits_lqIdx_value(backend_io_lsEnq_req_bits_lqIdx_value),
    .io_lsEnq_req_bits_lqIdx_flag(backend_io_lsEnq_req_bits_lqIdx_flag),
    .io_lsEnq_toLsqData_pc(backend_io_lsEnq_toLsqData_pc),
    .io_lsEnq_toLsqData_inst(backend_io_lsEnq_toLsqData_inst),
    .io_lsEnq_toLsqData_ctrl_fuType(backend_io_lsEnq_toLsqData_ctrl_fuType),
    .io_lsEnq_toLsqData_ctrl_aluOp(backend_io_lsEnq_toLsqData_ctrl_aluOp),
    .io_lsEnq_toLsqData_ctrl_bruOp(backend_io_lsEnq_toLsqData_ctrl_bruOp),
    .io_lsEnq_toLsqData_ctrl_lsuOp(backend_io_lsEnq_toLsqData_ctrl_lsuOp),
    .io_lsEnq_toLsqData_ctrl_csrOp(backend_io_lsEnq_toLsqData_ctrl_csrOp),
    .io_lsEnq_toLsqData_ctrl_mulOp(backend_io_lsEnq_toLsqData_ctrl_mulOp),
    .io_lsEnq_toLsqData_ctrl_divOp(backend_io_lsEnq_toLsqData_ctrl_divOp),
    .io_lsEnq_toLsqData_ctrl_src1Type(backend_io_lsEnq_toLsqData_ctrl_src1Type),
    .io_lsEnq_toLsqData_ctrl_src2Type(backend_io_lsEnq_toLsqData_ctrl_src2Type),
    .io_lsEnq_toLsqData_ctrl_immType(backend_io_lsEnq_toLsqData_ctrl_immType),
    .io_lsEnq_toLsqData_ctrl_rfWen(backend_io_lsEnq_toLsqData_ctrl_rfWen),
    .io_lsEnq_toLsqData_ctrl_memRead(backend_io_lsEnq_toLsqData_ctrl_memRead),
    .io_lsEnq_toLsqData_ctrl_memWrite(backend_io_lsEnq_toLsqData_ctrl_memWrite),
    .io_lsEnq_toLsqData_ctrl_csrWen(backend_io_lsEnq_toLsqData_ctrl_csrWen),
    .io_lsEnq_toLsqData_ctrl_isBranch(backend_io_lsEnq_toLsqData_ctrl_isBranch),
    .io_lsEnq_toLsqData_ctrl_isJump(backend_io_lsEnq_toLsqData_ctrl_isJump),
    .io_lsEnq_toLsqData_ctrl_isPriv(backend_io_lsEnq_toLsqData_ctrl_isPriv),
    .io_lsEnq_toLsqData_excp_excpVec(backend_io_lsEnq_toLsqData_excp_excpVec),
    .io_lsEnq_toLsqData_imm(backend_io_lsEnq_toLsqData_imm),
    .io_lsEnq_toLsqData_csrAddress(backend_io_lsEnq_toLsqData_csrAddress),
    .io_lsEnq_toLsqData_pdInfo_valid(backend_io_lsEnq_toLsqData_pdInfo_valid),
    .io_lsEnq_toLsqData_pdInfo_isBr(backend_io_lsEnq_toLsqData_pdInfo_isBr),
    .io_lsEnq_toLsqData_pdInfo_isJal(backend_io_lsEnq_toLsqData_pdInfo_isJal),
    .io_lsEnq_toLsqData_pdInfo_isJalr(backend_io_lsEnq_toLsqData_pdInfo_isJalr),
    .io_lsEnq_toLsqData_pdInfo_isCall(backend_io_lsEnq_toLsqData_pdInfo_isCall),
    .io_lsEnq_toLsqData_pdInfo_isRet(backend_io_lsEnq_toLsqData_pdInfo_isRet),
    .io_lsEnq_toLsqData_pdInfo_jumpTarget(backend_io_lsEnq_toLsqData_pdInfo_jumpTarget),
    .io_lsEnq_toLsqData_bpuInfo_pc(backend_io_lsEnq_toLsqData_bpuInfo_pc),
    .io_lsEnq_toLsqData_bpuInfo_fallThrough(backend_io_lsEnq_toLsqData_bpuInfo_fallThrough),
    .io_lsEnq_toLsqData_bpuInfo_taken(backend_io_lsEnq_toLsqData_bpuInfo_taken),
    .io_lsEnq_toLsqData_bpuInfo_target(backend_io_lsEnq_toLsqData_bpuInfo_target),
    .io_lsEnq_toLsqData_bpuInfo_takenOffset(backend_io_lsEnq_toLsqData_bpuInfo_takenOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_valid(backend_io_lsEnq_toLsqData_bpuInfo_meta_valid),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbHit(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbHit),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbOffset(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_phtCounter(backend_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter),
    .io_lsEnq_toLsqData_bpuInfo_meta_rasTop(backend_io_lsEnq_toLsqData_bpuInfo_meta_rasTop),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTaken(backend_io_lsEnq_toLsqData_bpuInfo_meta_predTaken),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTarget(backend_io_lsEnq_toLsqData_bpuInfo_meta_predTarget),
    .io_lsEnq_toLsqData_ldst(backend_io_lsEnq_toLsqData_ldst),
    .io_lsEnq_toLsqData_lrs1(backend_io_lsEnq_toLsqData_lrs1),
    .io_lsEnq_toLsqData_lrs2(backend_io_lsEnq_toLsqData_lrs2),
    .io_lsEnq_toLsqData_pdst(backend_io_lsEnq_toLsqData_pdst),
    .io_lsEnq_toLsqData_prs1(backend_io_lsEnq_toLsqData_prs1),
    .io_lsEnq_toLsqData_prs2(backend_io_lsEnq_toLsqData_prs2),
    .io_lsEnq_toLsqData_oldPdst(backend_io_lsEnq_toLsqData_oldPdst),
    .io_lsEnq_toLsqData_snptId_valid(backend_io_lsEnq_toLsqData_snptId_valid),
    .io_lsEnq_toLsqData_snptId_bits(backend_io_lsEnq_toLsqData_snptId_bits),
    .io_lsEnq_toLsqData_rs1Valid(backend_io_lsEnq_toLsqData_rs1Valid),
    .io_lsEnq_toLsqData_rs2Valid(backend_io_lsEnq_toLsqData_rs2Valid),
    .io_lsEnq_toLsqData_rdValid(backend_io_lsEnq_toLsqData_rdValid),
    .io_lsEnq_toLsqData_robIdx_value(backend_io_lsEnq_toLsqData_robIdx_value),
    .io_lsEnq_toLsqData_robIdx_flag(backend_io_lsEnq_toLsqData_robIdx_flag),
    .io_lsEnq_lqFull(backend_io_lsEnq_lqFull),
    .io_lsEnq_sqFull(backend_io_lsEnq_sqFull),
    .io_toMemResult_0_ready(backend_io_toMemResult_0_ready),
    .io_toMemResult_0_valid(backend_io_toMemResult_0_valid),
    .io_toMemResult_0_bits_uop_pc(backend_io_toMemResult_0_bits_uop_pc),
    .io_toMemResult_0_bits_uop_inst(backend_io_toMemResult_0_bits_uop_inst),
    .io_toMemResult_0_bits_uop_ctrl_fuType(backend_io_toMemResult_0_bits_uop_ctrl_fuType),
    .io_toMemResult_0_bits_uop_ctrl_aluOp(backend_io_toMemResult_0_bits_uop_ctrl_aluOp),
    .io_toMemResult_0_bits_uop_ctrl_bruOp(backend_io_toMemResult_0_bits_uop_ctrl_bruOp),
    .io_toMemResult_0_bits_uop_ctrl_lsuOp(backend_io_toMemResult_0_bits_uop_ctrl_lsuOp),
    .io_toMemResult_0_bits_uop_ctrl_csrOp(backend_io_toMemResult_0_bits_uop_ctrl_csrOp),
    .io_toMemResult_0_bits_uop_ctrl_mulOp(backend_io_toMemResult_0_bits_uop_ctrl_mulOp),
    .io_toMemResult_0_bits_uop_ctrl_divOp(backend_io_toMemResult_0_bits_uop_ctrl_divOp),
    .io_toMemResult_0_bits_uop_ctrl_src1Type(backend_io_toMemResult_0_bits_uop_ctrl_src1Type),
    .io_toMemResult_0_bits_uop_ctrl_src2Type(backend_io_toMemResult_0_bits_uop_ctrl_src2Type),
    .io_toMemResult_0_bits_uop_ctrl_immType(backend_io_toMemResult_0_bits_uop_ctrl_immType),
    .io_toMemResult_0_bits_uop_ctrl_rfWen(backend_io_toMemResult_0_bits_uop_ctrl_rfWen),
    .io_toMemResult_0_bits_uop_ctrl_memRead(backend_io_toMemResult_0_bits_uop_ctrl_memRead),
    .io_toMemResult_0_bits_uop_ctrl_memWrite(backend_io_toMemResult_0_bits_uop_ctrl_memWrite),
    .io_toMemResult_0_bits_uop_ctrl_csrWen(backend_io_toMemResult_0_bits_uop_ctrl_csrWen),
    .io_toMemResult_0_bits_uop_ctrl_isBranch(backend_io_toMemResult_0_bits_uop_ctrl_isBranch),
    .io_toMemResult_0_bits_uop_ctrl_isJump(backend_io_toMemResult_0_bits_uop_ctrl_isJump),
    .io_toMemResult_0_bits_uop_ctrl_isPriv(backend_io_toMemResult_0_bits_uop_ctrl_isPriv),
    .io_toMemResult_0_bits_uop_excp_excpVec(backend_io_toMemResult_0_bits_uop_excp_excpVec),
    .io_toMemResult_0_bits_uop_imm(backend_io_toMemResult_0_bits_uop_imm),
    .io_toMemResult_0_bits_uop_csrAddress(backend_io_toMemResult_0_bits_uop_csrAddress),
    .io_toMemResult_0_bits_uop_pdInfo_valid(backend_io_toMemResult_0_bits_uop_pdInfo_valid),
    .io_toMemResult_0_bits_uop_pdInfo_isBr(backend_io_toMemResult_0_bits_uop_pdInfo_isBr),
    .io_toMemResult_0_bits_uop_pdInfo_isJal(backend_io_toMemResult_0_bits_uop_pdInfo_isJal),
    .io_toMemResult_0_bits_uop_pdInfo_isJalr(backend_io_toMemResult_0_bits_uop_pdInfo_isJalr),
    .io_toMemResult_0_bits_uop_pdInfo_isCall(backend_io_toMemResult_0_bits_uop_pdInfo_isCall),
    .io_toMemResult_0_bits_uop_pdInfo_isRet(backend_io_toMemResult_0_bits_uop_pdInfo_isRet),
    .io_toMemResult_0_bits_uop_pdInfo_jumpTarget(backend_io_toMemResult_0_bits_uop_pdInfo_jumpTarget),
    .io_toMemResult_0_bits_uop_bpuInfo_pc(backend_io_toMemResult_0_bits_uop_bpuInfo_pc),
    .io_toMemResult_0_bits_uop_bpuInfo_fallThrough(backend_io_toMemResult_0_bits_uop_bpuInfo_fallThrough),
    .io_toMemResult_0_bits_uop_bpuInfo_taken(backend_io_toMemResult_0_bits_uop_bpuInfo_taken),
    .io_toMemResult_0_bits_uop_bpuInfo_target(backend_io_toMemResult_0_bits_uop_bpuInfo_target),
    .io_toMemResult_0_bits_uop_bpuInfo_takenOffset(backend_io_toMemResult_0_bits_uop_bpuInfo_takenOffset),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_valid(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_valid),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget),
    .io_toMemResult_0_bits_uop_ldst(backend_io_toMemResult_0_bits_uop_ldst),
    .io_toMemResult_0_bits_uop_lrs1(backend_io_toMemResult_0_bits_uop_lrs1),
    .io_toMemResult_0_bits_uop_lrs2(backend_io_toMemResult_0_bits_uop_lrs2),
    .io_toMemResult_0_bits_uop_pdst(backend_io_toMemResult_0_bits_uop_pdst),
    .io_toMemResult_0_bits_uop_prs1(backend_io_toMemResult_0_bits_uop_prs1),
    .io_toMemResult_0_bits_uop_prs2(backend_io_toMemResult_0_bits_uop_prs2),
    .io_toMemResult_0_bits_uop_oldPdst(backend_io_toMemResult_0_bits_uop_oldPdst),
    .io_toMemResult_0_bits_uop_rs1Valid(backend_io_toMemResult_0_bits_uop_rs1Valid),
    .io_toMemResult_0_bits_uop_rs2Valid(backend_io_toMemResult_0_bits_uop_rs2Valid),
    .io_toMemResult_0_bits_uop_rdValid(backend_io_toMemResult_0_bits_uop_rdValid),
    .io_toMemResult_0_bits_uop_snptId_valid(backend_io_toMemResult_0_bits_uop_snptId_valid),
    .io_toMemResult_0_bits_uop_snptId_bits(backend_io_toMemResult_0_bits_uop_snptId_bits),
    .io_toMemResult_0_bits_uop_robIdx_value(backend_io_toMemResult_0_bits_uop_robIdx_value),
    .io_toMemResult_0_bits_uop_robIdx_flag(backend_io_toMemResult_0_bits_uop_robIdx_flag),
    .io_toMemResult_0_bits_uop_robIdxFull_value(backend_io_toMemResult_0_bits_uop_robIdxFull_value),
    .io_toMemResult_0_bits_uop_robIdxFull_flag(backend_io_toMemResult_0_bits_uop_robIdxFull_flag),
    .io_toMemResult_0_bits_uop_lqIdx_value(backend_io_toMemResult_0_bits_uop_lqIdx_value),
    .io_toMemResult_0_bits_uop_lqIdx_flag(backend_io_toMemResult_0_bits_uop_lqIdx_flag),
    .io_toMemResult_0_bits_uop_sqIdx_value(backend_io_toMemResult_0_bits_uop_sqIdx_value),
    .io_toMemResult_0_bits_uop_sqIdx_flag(backend_io_toMemResult_0_bits_uop_sqIdx_flag),
    .io_toMemResult_0_bits_uop_issueQueue(backend_io_toMemResult_0_bits_uop_issueQueue),
    .io_toMemResult_0_bits_uop_prs1Busy(backend_io_toMemResult_0_bits_uop_prs1Busy),
    .io_toMemResult_0_bits_uop_prs2Busy(backend_io_toMemResult_0_bits_uop_prs2Busy),
    .io_toMemResult_0_bits_uop_isSta(backend_io_toMemResult_0_bits_uop_isSta),
    .io_toMemResult_0_bits_uop_isStd(backend_io_toMemResult_0_bits_uop_isStd),
    .io_toMemResult_0_bits_data(backend_io_toMemResult_0_bits_data),
    .io_toMemResult_0_bits_redirect_valid(backend_io_toMemResult_0_bits_redirect_valid),
    .io_toMemResult_0_bits_redirect_bits_valid(backend_io_toMemResult_0_bits_redirect_bits_valid),
    .io_toMemResult_0_bits_redirect_bits_robIdx_value(backend_io_toMemResult_0_bits_redirect_bits_robIdx_value),
    .io_toMemResult_0_bits_redirect_bits_robIdx_flag(backend_io_toMemResult_0_bits_redirect_bits_robIdx_flag),
    .io_toMemResult_0_bits_memValid(backend_io_toMemResult_0_bits_memValid),
    .io_toMemResult_0_bits_memRead(backend_io_toMemResult_0_bits_memRead),
    .io_toMemResult_0_bits_memWrite(backend_io_toMemResult_0_bits_memWrite),
    .io_toMemResult_0_bits_memVaddr(backend_io_toMemResult_0_bits_memVaddr),
    .io_toMemResult_0_bits_memPaddr(backend_io_toMemResult_0_bits_memPaddr),
    .io_toMemResult_0_bits_memStoreData(backend_io_toMemResult_0_bits_memStoreData),
    .io_toMemResult_0_bits_csrWen(backend_io_toMemResult_0_bits_csrWen),
    .io_toMemResult_0_bits_csrWaddr(backend_io_toMemResult_0_bits_csrWaddr),
    .io_toMemResult_0_bits_csrWdata(backend_io_toMemResult_0_bits_csrWdata),
    .io_toMemResult_0_bits_csrTimer(backend_io_toMemResult_0_bits_csrTimer),
    .io_toMemResult_1_ready(backend_io_toMemResult_1_ready),
    .io_toMemResult_1_valid(backend_io_toMemResult_1_valid),
    .io_toMemResult_1_bits_uop_pc(backend_io_toMemResult_1_bits_uop_pc),
    .io_toMemResult_1_bits_uop_inst(backend_io_toMemResult_1_bits_uop_inst),
    .io_toMemResult_1_bits_uop_ctrl_fuType(backend_io_toMemResult_1_bits_uop_ctrl_fuType),
    .io_toMemResult_1_bits_uop_ctrl_aluOp(backend_io_toMemResult_1_bits_uop_ctrl_aluOp),
    .io_toMemResult_1_bits_uop_ctrl_bruOp(backend_io_toMemResult_1_bits_uop_ctrl_bruOp),
    .io_toMemResult_1_bits_uop_ctrl_lsuOp(backend_io_toMemResult_1_bits_uop_ctrl_lsuOp),
    .io_toMemResult_1_bits_uop_ctrl_csrOp(backend_io_toMemResult_1_bits_uop_ctrl_csrOp),
    .io_toMemResult_1_bits_uop_ctrl_mulOp(backend_io_toMemResult_1_bits_uop_ctrl_mulOp),
    .io_toMemResult_1_bits_uop_ctrl_divOp(backend_io_toMemResult_1_bits_uop_ctrl_divOp),
    .io_toMemResult_1_bits_uop_ctrl_src1Type(backend_io_toMemResult_1_bits_uop_ctrl_src1Type),
    .io_toMemResult_1_bits_uop_ctrl_src2Type(backend_io_toMemResult_1_bits_uop_ctrl_src2Type),
    .io_toMemResult_1_bits_uop_ctrl_immType(backend_io_toMemResult_1_bits_uop_ctrl_immType),
    .io_toMemResult_1_bits_uop_ctrl_rfWen(backend_io_toMemResult_1_bits_uop_ctrl_rfWen),
    .io_toMemResult_1_bits_uop_ctrl_memRead(backend_io_toMemResult_1_bits_uop_ctrl_memRead),
    .io_toMemResult_1_bits_uop_ctrl_memWrite(backend_io_toMemResult_1_bits_uop_ctrl_memWrite),
    .io_toMemResult_1_bits_uop_ctrl_csrWen(backend_io_toMemResult_1_bits_uop_ctrl_csrWen),
    .io_toMemResult_1_bits_uop_ctrl_isBranch(backend_io_toMemResult_1_bits_uop_ctrl_isBranch),
    .io_toMemResult_1_bits_uop_ctrl_isJump(backend_io_toMemResult_1_bits_uop_ctrl_isJump),
    .io_toMemResult_1_bits_uop_ctrl_isPriv(backend_io_toMemResult_1_bits_uop_ctrl_isPriv),
    .io_toMemResult_1_bits_uop_excp_excpVec(backend_io_toMemResult_1_bits_uop_excp_excpVec),
    .io_toMemResult_1_bits_uop_imm(backend_io_toMemResult_1_bits_uop_imm),
    .io_toMemResult_1_bits_uop_csrAddress(backend_io_toMemResult_1_bits_uop_csrAddress),
    .io_toMemResult_1_bits_uop_pdInfo_valid(backend_io_toMemResult_1_bits_uop_pdInfo_valid),
    .io_toMemResult_1_bits_uop_pdInfo_isBr(backend_io_toMemResult_1_bits_uop_pdInfo_isBr),
    .io_toMemResult_1_bits_uop_pdInfo_isJal(backend_io_toMemResult_1_bits_uop_pdInfo_isJal),
    .io_toMemResult_1_bits_uop_pdInfo_isJalr(backend_io_toMemResult_1_bits_uop_pdInfo_isJalr),
    .io_toMemResult_1_bits_uop_pdInfo_isCall(backend_io_toMemResult_1_bits_uop_pdInfo_isCall),
    .io_toMemResult_1_bits_uop_pdInfo_isRet(backend_io_toMemResult_1_bits_uop_pdInfo_isRet),
    .io_toMemResult_1_bits_uop_pdInfo_jumpTarget(backend_io_toMemResult_1_bits_uop_pdInfo_jumpTarget),
    .io_toMemResult_1_bits_uop_bpuInfo_pc(backend_io_toMemResult_1_bits_uop_bpuInfo_pc),
    .io_toMemResult_1_bits_uop_bpuInfo_fallThrough(backend_io_toMemResult_1_bits_uop_bpuInfo_fallThrough),
    .io_toMemResult_1_bits_uop_bpuInfo_taken(backend_io_toMemResult_1_bits_uop_bpuInfo_taken),
    .io_toMemResult_1_bits_uop_bpuInfo_target(backend_io_toMemResult_1_bits_uop_bpuInfo_target),
    .io_toMemResult_1_bits_uop_bpuInfo_takenOffset(backend_io_toMemResult_1_bits_uop_bpuInfo_takenOffset),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_valid(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_valid),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget),
    .io_toMemResult_1_bits_uop_ldst(backend_io_toMemResult_1_bits_uop_ldst),
    .io_toMemResult_1_bits_uop_lrs1(backend_io_toMemResult_1_bits_uop_lrs1),
    .io_toMemResult_1_bits_uop_lrs2(backend_io_toMemResult_1_bits_uop_lrs2),
    .io_toMemResult_1_bits_uop_pdst(backend_io_toMemResult_1_bits_uop_pdst),
    .io_toMemResult_1_bits_uop_prs1(backend_io_toMemResult_1_bits_uop_prs1),
    .io_toMemResult_1_bits_uop_prs2(backend_io_toMemResult_1_bits_uop_prs2),
    .io_toMemResult_1_bits_uop_oldPdst(backend_io_toMemResult_1_bits_uop_oldPdst),
    .io_toMemResult_1_bits_uop_rs1Valid(backend_io_toMemResult_1_bits_uop_rs1Valid),
    .io_toMemResult_1_bits_uop_rs2Valid(backend_io_toMemResult_1_bits_uop_rs2Valid),
    .io_toMemResult_1_bits_uop_rdValid(backend_io_toMemResult_1_bits_uop_rdValid),
    .io_toMemResult_1_bits_uop_snptId_valid(backend_io_toMemResult_1_bits_uop_snptId_valid),
    .io_toMemResult_1_bits_uop_snptId_bits(backend_io_toMemResult_1_bits_uop_snptId_bits),
    .io_toMemResult_1_bits_uop_robIdx_value(backend_io_toMemResult_1_bits_uop_robIdx_value),
    .io_toMemResult_1_bits_uop_robIdx_flag(backend_io_toMemResult_1_bits_uop_robIdx_flag),
    .io_toMemResult_1_bits_uop_robIdxFull_value(backend_io_toMemResult_1_bits_uop_robIdxFull_value),
    .io_toMemResult_1_bits_uop_robIdxFull_flag(backend_io_toMemResult_1_bits_uop_robIdxFull_flag),
    .io_toMemResult_1_bits_uop_lqIdx_value(backend_io_toMemResult_1_bits_uop_lqIdx_value),
    .io_toMemResult_1_bits_uop_lqIdx_flag(backend_io_toMemResult_1_bits_uop_lqIdx_flag),
    .io_toMemResult_1_bits_uop_sqIdx_value(backend_io_toMemResult_1_bits_uop_sqIdx_value),
    .io_toMemResult_1_bits_uop_sqIdx_flag(backend_io_toMemResult_1_bits_uop_sqIdx_flag),
    .io_toMemResult_1_bits_uop_issueQueue(backend_io_toMemResult_1_bits_uop_issueQueue),
    .io_toMemResult_1_bits_uop_prs1Busy(backend_io_toMemResult_1_bits_uop_prs1Busy),
    .io_toMemResult_1_bits_uop_prs2Busy(backend_io_toMemResult_1_bits_uop_prs2Busy),
    .io_toMemResult_1_bits_uop_isSta(backend_io_toMemResult_1_bits_uop_isSta),
    .io_toMemResult_1_bits_uop_isStd(backend_io_toMemResult_1_bits_uop_isStd),
    .io_toMemResult_1_bits_data(backend_io_toMemResult_1_bits_data),
    .io_toMemResult_1_bits_redirect_valid(backend_io_toMemResult_1_bits_redirect_valid),
    .io_toMemResult_1_bits_redirect_bits_valid(backend_io_toMemResult_1_bits_redirect_bits_valid),
    .io_toMemResult_1_bits_redirect_bits_robIdx_value(backend_io_toMemResult_1_bits_redirect_bits_robIdx_value),
    .io_toMemResult_1_bits_redirect_bits_robIdx_flag(backend_io_toMemResult_1_bits_redirect_bits_robIdx_flag),
    .io_toMemResult_1_bits_memValid(backend_io_toMemResult_1_bits_memValid),
    .io_toMemResult_1_bits_memRead(backend_io_toMemResult_1_bits_memRead),
    .io_toMemResult_1_bits_memWrite(backend_io_toMemResult_1_bits_memWrite),
    .io_toMemResult_1_bits_memVaddr(backend_io_toMemResult_1_bits_memVaddr),
    .io_toMemResult_1_bits_memPaddr(backend_io_toMemResult_1_bits_memPaddr),
    .io_toMemResult_1_bits_memStoreData(backend_io_toMemResult_1_bits_memStoreData),
    .io_toMemResult_1_bits_csrWen(backend_io_toMemResult_1_bits_csrWen),
    .io_toMemResult_1_bits_csrWaddr(backend_io_toMemResult_1_bits_csrWaddr),
    .io_toMemResult_1_bits_csrWdata(backend_io_toMemResult_1_bits_csrWdata),
    .io_toMemResult_1_bits_csrTimer(backend_io_toMemResult_1_bits_csrTimer),
    .io_fromMemResult_0_ready(backend_io_fromMemResult_0_ready),
    .io_fromMemResult_0_valid(backend_io_fromMemResult_0_valid),
    .io_fromMemResult_0_bits_uop_pc(backend_io_fromMemResult_0_bits_uop_pc),
    .io_fromMemResult_0_bits_uop_ctrl_fuType(backend_io_fromMemResult_0_bits_uop_ctrl_fuType),
    .io_fromMemResult_0_bits_uop_ctrl_lsuOp(backend_io_fromMemResult_0_bits_uop_ctrl_lsuOp),
    .io_fromMemResult_0_bits_uop_ctrl_rfWen(backend_io_fromMemResult_0_bits_uop_ctrl_rfWen),
    .io_fromMemResult_0_bits_uop_excp_excpVec(backend_io_fromMemResult_0_bits_uop_excp_excpVec),
    .io_fromMemResult_0_bits_uop_pdst(backend_io_fromMemResult_0_bits_uop_pdst),
    .io_fromMemResult_0_bits_uop_rdValid(backend_io_fromMemResult_0_bits_uop_rdValid),
    .io_fromMemResult_0_bits_uop_robIdx_value(backend_io_fromMemResult_0_bits_uop_robIdx_value),
    .io_fromMemResult_0_bits_uop_robIdx_flag(backend_io_fromMemResult_0_bits_uop_robIdx_flag),
    .io_fromMemResult_0_bits_uop_robIdxFull_value(backend_io_fromMemResult_0_bits_uop_robIdxFull_value),
    .io_fromMemResult_0_bits_uop_robIdxFull_flag(backend_io_fromMemResult_0_bits_uop_robIdxFull_flag),
    .io_fromMemResult_0_bits_uop_lqIdx_value(backend_io_fromMemResult_0_bits_uop_lqIdx_value),
    .io_fromMemResult_0_bits_uop_sqIdx_value(backend_io_fromMemResult_0_bits_uop_sqIdx_value),
    .io_fromMemResult_0_bits_data(backend_io_fromMemResult_0_bits_data),
    .io_fromMemResult_0_bits_memVaddr(backend_io_fromMemResult_0_bits_memVaddr),
    .io_fromMemResult_0_bits_memPaddr(backend_io_fromMemResult_0_bits_memPaddr),
    .io_fromMemResult_1_ready(backend_io_fromMemResult_1_ready),
    .io_fromMemResult_1_valid(backend_io_fromMemResult_1_valid),
    .io_fromMemResult_1_bits_uop_pc(backend_io_fromMemResult_1_bits_uop_pc),
    .io_fromMemResult_1_bits_uop_ctrl_fuType(backend_io_fromMemResult_1_bits_uop_ctrl_fuType),
    .io_fromMemResult_1_bits_uop_ctrl_lsuOp(backend_io_fromMemResult_1_bits_uop_ctrl_lsuOp),
    .io_fromMemResult_1_bits_uop_excp_excpVec(backend_io_fromMemResult_1_bits_uop_excp_excpVec),
    .io_fromMemResult_1_bits_uop_pdst(backend_io_fromMemResult_1_bits_uop_pdst),
    .io_fromMemResult_1_bits_uop_robIdx_value(backend_io_fromMemResult_1_bits_uop_robIdx_value),
    .io_fromMemResult_1_bits_uop_robIdx_flag(backend_io_fromMemResult_1_bits_uop_robIdx_flag),
    .io_fromMemResult_1_bits_uop_robIdxFull_value(backend_io_fromMemResult_1_bits_uop_robIdxFull_value),
    .io_fromMemResult_1_bits_uop_robIdxFull_flag(backend_io_fromMemResult_1_bits_uop_robIdxFull_flag),
    .io_fromMemResult_1_bits_uop_lqIdx_value(backend_io_fromMemResult_1_bits_uop_lqIdx_value),
    .io_fromMemResult_1_bits_uop_sqIdx_value(backend_io_fromMemResult_1_bits_uop_sqIdx_value),
    .io_fromMemResult_1_bits_redirect_bits_robIdx_value(backend_io_fromMemResult_1_bits_redirect_bits_robIdx_value),
    .io_fromMemResult_1_bits_redirect_bits_robIdx_flag(backend_io_fromMemResult_1_bits_redirect_bits_robIdx_flag),
    .io_fromMemResult_1_bits_memVaddr(backend_io_fromMemResult_1_bits_memVaddr),
    .io_fromMemResult_1_bits_memPaddr(backend_io_fromMemResult_1_bits_memPaddr),
    .io_fromMemResult_1_bits_memStoreData(backend_io_fromMemResult_1_bits_memStoreData),
    .io_commitToSq_valid_0(backend_io_commitToSq_valid_0),
    .io_commitToSq_valid_1(backend_io_commitToSq_valid_1),
    .io_commitToSq_valid_2(backend_io_commitToSq_valid_2),
    .io_commitToSq_bits_0_sqIdx_value(backend_io_commitToSq_bits_0_sqIdx_value),
    .io_commitToSq_bits_1_sqIdx_value(backend_io_commitToSq_bits_1_sqIdx_value),
    .io_commitToSq_bits_2_sqIdx_value(backend_io_commitToSq_bits_2_sqIdx_value),
    .io_commitToCsr_csrWen(backend_io_commitToCsr_csrWen),
    .io_commitToCsr_csrWaddr(backend_io_commitToCsr_csrWaddr),
    .io_commitToCsr_csrWdata(backend_io_commitToCsr_csrWdata),
    .io_excpEvent_excp(backend_io_excpEvent_excp),
    .io_excpEvent_ertn(backend_io_excpEvent_ertn),
    .io_excpInfo_vaddrError(backend_io_excpInfo_vaddrError),
    .io_excpInfo_era(backend_io_excpInfo_era),
    .io_excpInfo_ecode(backend_io_excpInfo_ecode),
    .io_excpInfo_badVaddr(backend_io_excpInfo_badVaddr),
    .io_redirectAddrFromCsr_eentry(backend_io_redirectAddrFromCsr_eentry),
    .io_redirectAddrFromCsr_era(backend_io_redirectAddrFromCsr_era),
    .io_timerInfo_tid(backend_io_timerInfo_tid),
    .io_timerInfo_timer(backend_io_timerInfo_timer),
    .io_bpuUpdate_valid(backend_io_bpuUpdate_valid),
    .io_bpuUpdate_pc(backend_io_bpuUpdate_pc),
    .io_bpuUpdate_taken(backend_io_bpuUpdate_taken),
    .io_bpuUpdate_target(backend_io_bpuUpdate_target),
    .io_bpuUpdate_oldPhtCounter(backend_io_bpuUpdate_oldPhtCounter),
    .io_bpuUpdate_isJalr(backend_io_bpuUpdate_isJalr),
    .io_bpuUpdate_isJal(backend_io_bpuUpdate_isJal),
    .io_bpuUpdate_offset(backend_io_bpuUpdate_offset)
  );
  MemoryBlock memory ( // @[src/main/scala/myCPU_top.scala 107:22]
    .clock(memory_clock),
    .reset(memory_reset),
    .io_lsEnq_req_valid(memory_io_lsEnq_req_valid),
    .io_lsEnq_req_bits_robIdx_value(memory_io_lsEnq_req_bits_robIdx_value),
    .io_lsEnq_req_bits_robIdx_flag(memory_io_lsEnq_req_bits_robIdx_flag),
    .io_lsEnq_req_bits_isLoad(memory_io_lsEnq_req_bits_isLoad),
    .io_lsEnq_req_bits_isStore(memory_io_lsEnq_req_bits_isStore),
    .io_lsEnq_req_bits_sqIdx_value(memory_io_lsEnq_req_bits_sqIdx_value),
    .io_lsEnq_req_bits_lqIdx_value(memory_io_lsEnq_req_bits_lqIdx_value),
    .io_lsEnq_toLsqData_pc(memory_io_lsEnq_toLsqData_pc),
    .io_lsEnq_toLsqData_ctrl_fuType(memory_io_lsEnq_toLsqData_ctrl_fuType),
    .io_lsEnq_toLsqData_ctrl_lsuOp(memory_io_lsEnq_toLsqData_ctrl_lsuOp),
    .io_lsEnq_toLsqData_ctrl_rfWen(memory_io_lsEnq_toLsqData_ctrl_rfWen),
    .io_lsEnq_toLsqData_pdst(memory_io_lsEnq_toLsqData_pdst),
    .io_lsEnq_lqFull(memory_io_lsEnq_lqFull),
    .io_lsEnq_sqFull(memory_io_lsEnq_sqFull),
    .io_fromExeMmuResult_ready(memory_io_fromExeMmuResult_ready),
    .io_fromExeMmuResult_valid(memory_io_fromExeMmuResult_valid),
    .io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead(memory_io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead),
    .io_fromExeMmuResult_bits_exeRes_uop_excp_excpVec(memory_io_fromExeMmuResult_bits_exeRes_uop_excp_excpVec),
    .io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value(memory_io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value),
    .io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value(memory_io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value),
    .io_fromExeMmuResult_bits_exeRes_uop_isSta(memory_io_fromExeMmuResult_bits_exeRes_uop_isSta),
    .io_fromExeMmuResult_bits_exeRes_data(memory_io_fromExeMmuResult_bits_exeRes_data),
    .io_fromExeMmuResult_bits_mmuRes_paddr(memory_io_fromExeMmuResult_bits_mmuRes_paddr),
    .io_fromExeMmuResult_bits_mmuRes_cacheable(memory_io_fromExeMmuResult_bits_mmuRes_cacheable),
    .io_fromExeMmuResult_bits_mmuRes_error_excpTlbRefill(memory_io_fromExeMmuResult_bits_mmuRes_error_excpTlbRefill),
    .io_fromExeMmuResult_bits_mmuRes_error_excpTlbPpi(memory_io_fromExeMmuResult_bits_mmuRes_error_excpTlbPpi),
    .io_fromExeMmuResult_bits_mmuRes_error_excpAle(memory_io_fromExeMmuResult_bits_mmuRes_error_excpAle),
    .io_fromExeResult_ready(memory_io_fromExeResult_ready),
    .io_fromExeResult_valid(memory_io_fromExeResult_valid),
    .io_fromExeResult_bits_uop_sqIdx_value(memory_io_fromExeResult_bits_uop_sqIdx_value),
    .io_fromExeResult_bits_uop_isStd(memory_io_fromExeResult_bits_uop_isStd),
    .io_fromExeResult_bits_data(memory_io_fromExeResult_bits_data),
    .io_toWbResult_0_ready(memory_io_toWbResult_0_ready),
    .io_toWbResult_0_valid(memory_io_toWbResult_0_valid),
    .io_toWbResult_0_bits_uop_pc(memory_io_toWbResult_0_bits_uop_pc),
    .io_toWbResult_0_bits_uop_ctrl_fuType(memory_io_toWbResult_0_bits_uop_ctrl_fuType),
    .io_toWbResult_0_bits_uop_ctrl_lsuOp(memory_io_toWbResult_0_bits_uop_ctrl_lsuOp),
    .io_toWbResult_0_bits_uop_ctrl_rfWen(memory_io_toWbResult_0_bits_uop_ctrl_rfWen),
    .io_toWbResult_0_bits_uop_excp_excpVec(memory_io_toWbResult_0_bits_uop_excp_excpVec),
    .io_toWbResult_0_bits_uop_pdst(memory_io_toWbResult_0_bits_uop_pdst),
    .io_toWbResult_0_bits_uop_rdValid(memory_io_toWbResult_0_bits_uop_rdValid),
    .io_toWbResult_0_bits_uop_robIdx_value(memory_io_toWbResult_0_bits_uop_robIdx_value),
    .io_toWbResult_0_bits_uop_robIdx_flag(memory_io_toWbResult_0_bits_uop_robIdx_flag),
    .io_toWbResult_0_bits_uop_robIdxFull_value(memory_io_toWbResult_0_bits_uop_robIdxFull_value),
    .io_toWbResult_0_bits_uop_robIdxFull_flag(memory_io_toWbResult_0_bits_uop_robIdxFull_flag),
    .io_toWbResult_0_bits_uop_lqIdx_value(memory_io_toWbResult_0_bits_uop_lqIdx_value),
    .io_toWbResult_0_bits_uop_sqIdx_value(memory_io_toWbResult_0_bits_uop_sqIdx_value),
    .io_toWbResult_0_bits_data(memory_io_toWbResult_0_bits_data),
    .io_toWbResult_0_bits_memVaddr(memory_io_toWbResult_0_bits_memVaddr),
    .io_toWbResult_0_bits_memPaddr(memory_io_toWbResult_0_bits_memPaddr),
    .io_toWbResult_1_ready(memory_io_toWbResult_1_ready),
    .io_toWbResult_1_valid(memory_io_toWbResult_1_valid),
    .io_toWbResult_1_bits_uop_pc(memory_io_toWbResult_1_bits_uop_pc),
    .io_toWbResult_1_bits_uop_ctrl_fuType(memory_io_toWbResult_1_bits_uop_ctrl_fuType),
    .io_toWbResult_1_bits_uop_ctrl_lsuOp(memory_io_toWbResult_1_bits_uop_ctrl_lsuOp),
    .io_toWbResult_1_bits_uop_excp_excpVec(memory_io_toWbResult_1_bits_uop_excp_excpVec),
    .io_toWbResult_1_bits_uop_pdst(memory_io_toWbResult_1_bits_uop_pdst),
    .io_toWbResult_1_bits_uop_robIdx_value(memory_io_toWbResult_1_bits_uop_robIdx_value),
    .io_toWbResult_1_bits_uop_robIdx_flag(memory_io_toWbResult_1_bits_uop_robIdx_flag),
    .io_toWbResult_1_bits_uop_robIdxFull_value(memory_io_toWbResult_1_bits_uop_robIdxFull_value),
    .io_toWbResult_1_bits_uop_robIdxFull_flag(memory_io_toWbResult_1_bits_uop_robIdxFull_flag),
    .io_toWbResult_1_bits_uop_lqIdx_value(memory_io_toWbResult_1_bits_uop_lqIdx_value),
    .io_toWbResult_1_bits_uop_sqIdx_value(memory_io_toWbResult_1_bits_uop_sqIdx_value),
    .io_toWbResult_1_bits_redirect_bits_robIdx_value(memory_io_toWbResult_1_bits_redirect_bits_robIdx_value),
    .io_toWbResult_1_bits_redirect_bits_robIdx_flag(memory_io_toWbResult_1_bits_redirect_bits_robIdx_flag),
    .io_toWbResult_1_bits_memVaddr(memory_io_toWbResult_1_bits_memVaddr),
    .io_toWbResult_1_bits_memPaddr(memory_io_toWbResult_1_bits_memPaddr),
    .io_toWbResult_1_bits_memStoreData(memory_io_toWbResult_1_bits_memStoreData),
    .io_robCommit_0_valid(memory_io_robCommit_0_valid),
    .io_robCommit_0_sqIdx(memory_io_robCommit_0_sqIdx),
    .io_robCommit_1_valid(memory_io_robCommit_1_valid),
    .io_robCommit_1_sqIdx(memory_io_robCommit_1_sqIdx),
    .io_robCommit_2_valid(memory_io_robCommit_2_valid),
    .io_robCommit_2_sqIdx(memory_io_robCommit_2_sqIdx),
    .io_axi_ar_data_arid(memory_io_axi_ar_data_arid),
    .io_axi_ar_data_araddr(memory_io_axi_ar_data_araddr),
    .io_axi_ar_data_arlen(memory_io_axi_ar_data_arlen),
    .io_axi_ar_data_arsize(memory_io_axi_ar_data_arsize),
    .io_axi_ar_data_arvalid(memory_io_axi_ar_data_arvalid),
    .io_axi_ar_arready(memory_io_axi_ar_arready),
    .io_axi_aw_data_awid(memory_io_axi_aw_data_awid),
    .io_axi_aw_data_awaddr(memory_io_axi_aw_data_awaddr),
    .io_axi_aw_data_awlen(memory_io_axi_aw_data_awlen),
    .io_axi_aw_data_awsize(memory_io_axi_aw_data_awsize),
    .io_axi_aw_data_awvalid(memory_io_axi_aw_data_awvalid),
    .io_axi_aw_awready(memory_io_axi_aw_awready),
    .io_axi_w_data_wid(memory_io_axi_w_data_wid),
    .io_axi_w_data_wdata(memory_io_axi_w_data_wdata),
    .io_axi_w_data_wstrb(memory_io_axi_w_data_wstrb),
    .io_axi_w_data_wlast(memory_io_axi_w_data_wlast),
    .io_axi_w_data_wvalid(memory_io_axi_w_data_wvalid),
    .io_axi_w_wready(memory_io_axi_w_wready),
    .io_axi_r_data_rid(memory_io_axi_r_data_rid),
    .io_axi_r_data_rdata(memory_io_axi_r_data_rdata),
    .io_axi_r_data_rlast(memory_io_axi_r_data_rlast),
    .io_axi_r_data_rvalid(memory_io_axi_r_data_rvalid),
    .io_axi_r_rready(memory_io_axi_r_rready),
    .io_axi_b_data_bid(memory_io_axi_b_data_bid),
    .io_axi_b_data_bvalid(memory_io_axi_b_data_bvalid),
    .io_axi_b_bready(memory_io_axi_b_bready),
    .io_redirectInfo_valid(memory_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(memory_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(memory_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(memory_io_redirectInfo_bits_robIdx_flag)
  );
  Mmu mmu ( // @[src/main/scala/myCPU_top.scala 108:19]
    .clock(mmu_clock),
    .reset(mmu_reset),
    .io_fromCsr_plv(mmu_io_fromCsr_plv),
    .io_fromCsr_pgda(mmu_io_fromCsr_pgda),
    .io_fromCsr_dmw0(mmu_io_fromCsr_dmw0),
    .io_fromCsr_dmw1(mmu_io_fromCsr_dmw1),
    .io_fromCsr_datm(mmu_io_fromCsr_datm),
    .io_fromCsr_datf(mmu_io_fromCsr_datf),
    .io_fromIcache_ready(mmu_io_fromIcache_ready),
    .io_fromIcache_valid(mmu_io_fromIcache_valid),
    .io_fromIcache_bits_vaddr(mmu_io_fromIcache_bits_vaddr),
    .io_toIcache_ready(mmu_io_toIcache_ready),
    .io_toIcache_valid(mmu_io_toIcache_valid),
    .io_toIcache_bits_paddr(mmu_io_toIcache_bits_paddr),
    .io_toIcache_bits_cacheable(mmu_io_toIcache_bits_cacheable),
    .io_toIcache_bits_hasError(mmu_io_toIcache_bits_hasError),
    .io_toIcache_bits_error_excpTlbRefill(mmu_io_toIcache_bits_error_excpTlbRefill),
    .io_toIcache_bits_error_excpTlbPif(mmu_io_toIcache_bits_error_excpTlbPif),
    .io_toIcache_bits_error_excpTlbPpi(mmu_io_toIcache_bits_error_excpTlbPpi),
    .io_toIcache_bits_error_excpAdef(mmu_io_toIcache_bits_error_excpAdef),
    .io_toIcache_bits_error_excpAle(mmu_io_toIcache_bits_error_excpAle),
    .io_fromMem_ready(mmu_io_fromMem_ready),
    .io_fromMem_valid(mmu_io_fromMem_valid),
    .io_fromMem_bits_vaddr(mmu_io_fromMem_bits_vaddr),
    .io_fromMem_bits_lsuOp(mmu_io_fromMem_bits_lsuOp),
    .io_toMem_ready(mmu_io_toMem_ready),
    .io_toMem_valid(mmu_io_toMem_valid),
    .io_toMem_bits_paddr(mmu_io_toMem_bits_paddr),
    .io_toMem_bits_cacheable(mmu_io_toMem_bits_cacheable),
    .io_toMem_bits_hasError(mmu_io_toMem_bits_hasError),
    .io_toMem_bits_error_excpTlbRefill(mmu_io_toMem_bits_error_excpTlbRefill),
    .io_toMem_bits_error_excpTlbPif(mmu_io_toMem_bits_error_excpTlbPif),
    .io_toMem_bits_error_excpTlbPpi(mmu_io_toMem_bits_error_excpTlbPpi),
    .io_toMem_bits_error_excpAdef(mmu_io_toMem_bits_error_excpAdef),
    .io_toMem_bits_error_excpAle(mmu_io_toMem_bits_error_excpAle)
  );
  MemAddrTrans memaddrtrans ( // @[src/main/scala/myCPU_top.scala 124:28]
    .clock(memaddrtrans_clock),
    .reset(memaddrtrans_reset),
    .io_in_ready(memaddrtrans_io_in_ready),
    .io_in_valid(memaddrtrans_io_in_valid),
    .io_in_bits_uop_ctrl_lsuOp(memaddrtrans_io_in_bits_uop_ctrl_lsuOp),
    .io_in_bits_uop_ctrl_memRead(memaddrtrans_io_in_bits_uop_ctrl_memRead),
    .io_in_bits_uop_excp_excpVec(memaddrtrans_io_in_bits_uop_excp_excpVec),
    .io_in_bits_uop_lqIdx_value(memaddrtrans_io_in_bits_uop_lqIdx_value),
    .io_in_bits_uop_sqIdx_value(memaddrtrans_io_in_bits_uop_sqIdx_value),
    .io_in_bits_uop_isSta(memaddrtrans_io_in_bits_uop_isSta),
    .io_in_bits_data(memaddrtrans_io_in_bits_data),
    .io_out_valid(memaddrtrans_io_out_valid),
    .io_out_bits_exeRes_uop_ctrl_memRead(memaddrtrans_io_out_bits_exeRes_uop_ctrl_memRead),
    .io_out_bits_exeRes_uop_excp_excpVec(memaddrtrans_io_out_bits_exeRes_uop_excp_excpVec),
    .io_out_bits_exeRes_uop_lqIdx_value(memaddrtrans_io_out_bits_exeRes_uop_lqIdx_value),
    .io_out_bits_exeRes_uop_sqIdx_value(memaddrtrans_io_out_bits_exeRes_uop_sqIdx_value),
    .io_out_bits_exeRes_uop_isSta(memaddrtrans_io_out_bits_exeRes_uop_isSta),
    .io_out_bits_exeRes_data(memaddrtrans_io_out_bits_exeRes_data),
    .io_out_bits_mmuRes_paddr(memaddrtrans_io_out_bits_mmuRes_paddr),
    .io_out_bits_mmuRes_cacheable(memaddrtrans_io_out_bits_mmuRes_cacheable),
    .io_out_bits_mmuRes_error_excpTlbRefill(memaddrtrans_io_out_bits_mmuRes_error_excpTlbRefill),
    .io_out_bits_mmuRes_error_excpTlbPpi(memaddrtrans_io_out_bits_mmuRes_error_excpTlbPpi),
    .io_out_bits_mmuRes_error_excpAle(memaddrtrans_io_out_bits_mmuRes_error_excpAle),
    .io_mmuReq_ready(memaddrtrans_io_mmuReq_ready),
    .io_mmuReq_valid(memaddrtrans_io_mmuReq_valid),
    .io_mmuReq_bits_vaddr(memaddrtrans_io_mmuReq_bits_vaddr),
    .io_mmuReq_bits_lsuOp(memaddrtrans_io_mmuReq_bits_lsuOp),
    .io_mmuResp_valid(memaddrtrans_io_mmuResp_valid),
    .io_mmuResp_bits_paddr(memaddrtrans_io_mmuResp_bits_paddr),
    .io_mmuResp_bits_cacheable(memaddrtrans_io_mmuResp_bits_cacheable),
    .io_mmuResp_bits_error_excpTlbRefill(memaddrtrans_io_mmuResp_bits_error_excpTlbRefill),
    .io_mmuResp_bits_error_excpTlbPpi(memaddrtrans_io_mmuResp_bits_error_excpTlbPpi),
    .io_mmuResp_bits_error_excpAle(memaddrtrans_io_mmuResp_bits_error_excpAle)
  );
  CsrFile csr ( // @[src/main/scala/myCPU_top.scala 169:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_irqBus(csr_io_irqBus),
    .io_hasIrq(csr_io_hasIrq),
    .io_rReq_addr(csr_io_rReq_addr),
    .io_rResp_data(csr_io_rResp_data),
    .io_wReq_wen(csr_io_wReq_wen),
    .io_wReq_addr(csr_io_wReq_addr),
    .io_wReq_data(csr_io_wReq_data),
    .io_excpEvent_excp(csr_io_excpEvent_excp),
    .io_excpEvent_ertn(csr_io_excpEvent_ertn),
    .io_excpInfo_vaddrError(csr_io_excpInfo_vaddrError),
    .io_excpInfo_era(csr_io_excpInfo_era),
    .io_excpInfo_ecode(csr_io_excpInfo_ecode),
    .io_excpInfo_badVaddr(csr_io_excpInfo_badVaddr),
    .io_redirectAddr_eentry(csr_io_redirectAddr_eentry),
    .io_redirectAddr_era(csr_io_redirectAddr_era),
    .io_timerInfo_tid(csr_io_timerInfo_tid),
    .io_timerInfo_timer(csr_io_timerInfo_timer),
    .io_priv_plv(csr_io_priv_plv),
    .io_tlbCtrl_pgda(csr_io_tlbCtrl_pgda),
    .io_tlbCtrl_dmw0(csr_io_tlbCtrl_dmw0),
    .io_tlbCtrl_dmw1(csr_io_tlbCtrl_dmw1),
    .io_cacheCtrl_datm(csr_io_cacheCtrl_datm),
    .io_cacheCtrl_datf(csr_io_cacheCtrl_datf)
  );
  AXI3Crossbar2to1 axi_crossbar ( // @[src/main/scala/myCPU_top.scala 204:28]
    .io_in_icache_ar_data_arid(axi_crossbar_io_in_icache_ar_data_arid),
    .io_in_icache_ar_data_araddr(axi_crossbar_io_in_icache_ar_data_araddr),
    .io_in_icache_ar_data_arlen(axi_crossbar_io_in_icache_ar_data_arlen),
    .io_in_icache_ar_data_arsize(axi_crossbar_io_in_icache_ar_data_arsize),
    .io_in_icache_ar_data_arvalid(axi_crossbar_io_in_icache_ar_data_arvalid),
    .io_in_icache_ar_arready(axi_crossbar_io_in_icache_ar_arready),
    .io_in_icache_r_data_rid(axi_crossbar_io_in_icache_r_data_rid),
    .io_in_icache_r_data_rdata(axi_crossbar_io_in_icache_r_data_rdata),
    .io_in_icache_r_data_rlast(axi_crossbar_io_in_icache_r_data_rlast),
    .io_in_icache_r_data_rvalid(axi_crossbar_io_in_icache_r_data_rvalid),
    .io_in_icache_r_rready(axi_crossbar_io_in_icache_r_rready),
    .io_in_dcache_ar_data_arid(axi_crossbar_io_in_dcache_ar_data_arid),
    .io_in_dcache_ar_data_araddr(axi_crossbar_io_in_dcache_ar_data_araddr),
    .io_in_dcache_ar_data_arlen(axi_crossbar_io_in_dcache_ar_data_arlen),
    .io_in_dcache_ar_data_arsize(axi_crossbar_io_in_dcache_ar_data_arsize),
    .io_in_dcache_ar_data_arvalid(axi_crossbar_io_in_dcache_ar_data_arvalid),
    .io_in_dcache_ar_arready(axi_crossbar_io_in_dcache_ar_arready),
    .io_in_dcache_aw_data_awid(axi_crossbar_io_in_dcache_aw_data_awid),
    .io_in_dcache_aw_data_awaddr(axi_crossbar_io_in_dcache_aw_data_awaddr),
    .io_in_dcache_aw_data_awlen(axi_crossbar_io_in_dcache_aw_data_awlen),
    .io_in_dcache_aw_data_awsize(axi_crossbar_io_in_dcache_aw_data_awsize),
    .io_in_dcache_aw_data_awvalid(axi_crossbar_io_in_dcache_aw_data_awvalid),
    .io_in_dcache_aw_awready(axi_crossbar_io_in_dcache_aw_awready),
    .io_in_dcache_w_data_wid(axi_crossbar_io_in_dcache_w_data_wid),
    .io_in_dcache_w_data_wdata(axi_crossbar_io_in_dcache_w_data_wdata),
    .io_in_dcache_w_data_wstrb(axi_crossbar_io_in_dcache_w_data_wstrb),
    .io_in_dcache_w_data_wlast(axi_crossbar_io_in_dcache_w_data_wlast),
    .io_in_dcache_w_data_wvalid(axi_crossbar_io_in_dcache_w_data_wvalid),
    .io_in_dcache_w_wready(axi_crossbar_io_in_dcache_w_wready),
    .io_in_dcache_r_data_rid(axi_crossbar_io_in_dcache_r_data_rid),
    .io_in_dcache_r_data_rdata(axi_crossbar_io_in_dcache_r_data_rdata),
    .io_in_dcache_r_data_rlast(axi_crossbar_io_in_dcache_r_data_rlast),
    .io_in_dcache_r_data_rvalid(axi_crossbar_io_in_dcache_r_data_rvalid),
    .io_in_dcache_r_rready(axi_crossbar_io_in_dcache_r_rready),
    .io_in_dcache_b_data_bid(axi_crossbar_io_in_dcache_b_data_bid),
    .io_in_dcache_b_data_bvalid(axi_crossbar_io_in_dcache_b_data_bvalid),
    .io_in_dcache_b_bready(axi_crossbar_io_in_dcache_b_bready),
    .io_out_ar_data_arid(axi_crossbar_io_out_ar_data_arid),
    .io_out_ar_data_araddr(axi_crossbar_io_out_ar_data_araddr),
    .io_out_ar_data_arlen(axi_crossbar_io_out_ar_data_arlen),
    .io_out_ar_data_arsize(axi_crossbar_io_out_ar_data_arsize),
    .io_out_ar_data_arvalid(axi_crossbar_io_out_ar_data_arvalid),
    .io_out_ar_arready(axi_crossbar_io_out_ar_arready),
    .io_out_aw_data_awid(axi_crossbar_io_out_aw_data_awid),
    .io_out_aw_data_awaddr(axi_crossbar_io_out_aw_data_awaddr),
    .io_out_aw_data_awlen(axi_crossbar_io_out_aw_data_awlen),
    .io_out_aw_data_awsize(axi_crossbar_io_out_aw_data_awsize),
    .io_out_aw_data_awvalid(axi_crossbar_io_out_aw_data_awvalid),
    .io_out_aw_awready(axi_crossbar_io_out_aw_awready),
    .io_out_w_data_wid(axi_crossbar_io_out_w_data_wid),
    .io_out_w_data_wdata(axi_crossbar_io_out_w_data_wdata),
    .io_out_w_data_wstrb(axi_crossbar_io_out_w_data_wstrb),
    .io_out_w_data_wlast(axi_crossbar_io_out_w_data_wlast),
    .io_out_w_data_wvalid(axi_crossbar_io_out_w_data_wvalid),
    .io_out_w_wready(axi_crossbar_io_out_w_wready),
    .io_out_r_data_rid(axi_crossbar_io_out_r_data_rid),
    .io_out_r_data_rdata(axi_crossbar_io_out_r_data_rdata),
    .io_out_r_data_rlast(axi_crossbar_io_out_r_data_rlast),
    .io_out_r_data_rvalid(axi_crossbar_io_out_r_data_rvalid),
    .io_out_r_rready(axi_crossbar_io_out_r_rready),
    .io_out_b_data_bid(axi_crossbar_io_out_b_data_bid),
    .io_out_b_data_bvalid(axi_crossbar_io_out_b_data_bvalid),
    .io_out_b_bready(axi_crossbar_io_out_b_bready)
  );
  assign arid = axi_crossbar_io_out_ar_data_arid; // @[src/main/scala/myCPU_top.scala 214:11]
  assign araddr = axi_crossbar_io_out_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 215:11]
  assign arlen = axi_crossbar_io_out_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 216:11]
  assign arsize = axi_crossbar_io_out_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 217:11]
  assign arburst = 2'h1; // @[src/main/scala/myCPU_top.scala 218:11]
  assign arlock = 2'h0; // @[src/main/scala/myCPU_top.scala 219:11]
  assign arcache = 4'h0; // @[src/main/scala/myCPU_top.scala 220:11]
  assign arprot = 3'h0; // @[src/main/scala/myCPU_top.scala 221:11]
  assign arvalid = axi_crossbar_io_out_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 222:11]
  assign rready = axi_crossbar_io_out_r_rready; // @[src/main/scala/myCPU_top.scala 233:10]
  assign awid = axi_crossbar_io_out_aw_data_awid; // @[src/main/scala/myCPU_top.scala 236:11]
  assign awaddr = axi_crossbar_io_out_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 237:11]
  assign awlen = axi_crossbar_io_out_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 238:11]
  assign awsize = axi_crossbar_io_out_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 239:11]
  assign awburst = 2'h1; // @[src/main/scala/myCPU_top.scala 240:11]
  assign awlock = 2'h0; // @[src/main/scala/myCPU_top.scala 241:11]
  assign awcache = 4'h0; // @[src/main/scala/myCPU_top.scala 242:11]
  assign awprot = 3'h0; // @[src/main/scala/myCPU_top.scala 243:11]
  assign awvalid = axi_crossbar_io_out_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 244:11]
  assign wid = axi_crossbar_io_out_w_data_wid; // @[src/main/scala/myCPU_top.scala 248:11]
  assign wdata = axi_crossbar_io_out_w_data_wdata; // @[src/main/scala/myCPU_top.scala 249:11]
  assign wstrb = axi_crossbar_io_out_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 250:11]
  assign wlast = axi_crossbar_io_out_w_data_wlast; // @[src/main/scala/myCPU_top.scala 251:11]
  assign wvalid = axi_crossbar_io_out_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 252:11]
  assign bready = axi_crossbar_io_out_b_bready; // @[src/main/scala/myCPU_top.scala 261:10]
  assign ws_valid = 1'h0; // @[src/main/scala/myCPU_top.scala 92:22]
  assign rf_rdata = 32'h0; // @[src/main/scala/myCPU_top.scala 93:22]
  assign debug0_wb_pc = 32'h0; // @[src/main/scala/myCPU_top.scala 87:22]
  assign debug0_wb_rf_wen = 1'h0; // @[src/main/scala/myCPU_top.scala 88:22]
  assign debug0_wb_rf_wnum = 5'h0; // @[src/main/scala/myCPU_top.scala 89:22]
  assign debug0_wb_rf_wdata = 32'h0; // @[src/main/scala/myCPU_top.scala 90:22]
  assign debug0_wb_inst = 32'h0; // @[src/main/scala/myCPU_top.scala 91:22]
  assign frontend_clock = aclk;
  assign frontend_reset = rst_d1; // @[src/main/scala/myCPU_top.scala 95:24 99:16]
  assign frontend_io_out_0_ready = backend_io_in_0_ready; // @[src/main/scala/myCPU_top.scala 112:19]
  assign frontend_io_out_1_ready = backend_io_in_1_ready; // @[src/main/scala/myCPU_top.scala 112:19]
  assign frontend_io_out_2_ready = backend_io_in_2_ready; // @[src/main/scala/myCPU_top.scala 112:19]
  assign frontend_io_bpuUpdateBr_valid = backend_io_bpuUpdate_valid; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_bpuUpdateBr_pc = backend_io_bpuUpdate_pc; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_bpuUpdateBr_taken = backend_io_bpuUpdate_taken; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_bpuUpdateBr_target = backend_io_bpuUpdate_target; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_bpuUpdateBr_oldPhtCounter = backend_io_bpuUpdate_oldPhtCounter; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_bpuUpdateBr_isJalr = backend_io_bpuUpdate_isJalr; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_bpuUpdateBr_isJal = backend_io_bpuUpdate_isJal; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_bpuUpdateBr_offset = backend_io_bpuUpdate_offset; // @[src/main/scala/myCPU_top.scala 154:34]
  assign frontend_io_redirectInfo_valid = backend_io_redirectInfo_valid; // @[src/main/scala/myCPU_top.scala 113:28]
  assign frontend_io_redirectInfo_bits_doRedirect = backend_io_redirectInfo_bits_doRedirect; // @[src/main/scala/myCPU_top.scala 113:28]
  assign frontend_io_redirectInfo_bits_target = backend_io_redirectInfo_bits_target; // @[src/main/scala/myCPU_top.scala 113:28]
  assign frontend_io_mmu_toMmu_ready = mmu_io_fromIcache_ready; // @[src/main/scala/myCPU_top.scala 160:25]
  assign frontend_io_mmu_fromMmu_valid = mmu_io_toIcache_valid; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_mmu_fromMmu_bits_paddr = mmu_io_toIcache_bits_paddr; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_mmu_fromMmu_bits_cacheable = mmu_io_toIcache_bits_cacheable; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpTlbRefill = mmu_io_toIcache_bits_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpTlbPif = mmu_io_toIcache_bits_error_excpTlbPif; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpTlbPpi = mmu_io_toIcache_bits_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpAdef = mmu_io_toIcache_bits_error_excpAdef; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpAle = mmu_io_toIcache_bits_error_excpAle; // @[src/main/scala/myCPU_top.scala 161:27]
  assign frontend_io_axi_master_ar_arready = axi_crossbar_io_in_icache_ar_arready; // @[src/main/scala/myCPU_top.scala 209:31]
  assign frontend_io_axi_master_r_data_rid = axi_crossbar_io_in_icache_r_data_rid; // @[src/main/scala/myCPU_top.scala 209:31]
  assign frontend_io_axi_master_r_data_rdata = axi_crossbar_io_in_icache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 209:31]
  assign frontend_io_axi_master_r_data_rlast = axi_crossbar_io_in_icache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 209:31]
  assign frontend_io_axi_master_r_data_rvalid = axi_crossbar_io_in_icache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 209:31]
  assign backend_clock = aclk;
  assign backend_reset = rst_d1; // @[src/main/scala/myCPU_top.scala 95:24 99:16]
  assign backend_io_in_0_valid = frontend_io_out_0_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_instr = frontend_io_out_0_bits_instr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pc = frontend_io_out_0_bits_pc; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pdInfo_valid = frontend_io_out_0_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pdInfo_isBr = frontend_io_out_0_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pdInfo_isJal = frontend_io_out_0_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pdInfo_isJalr = frontend_io_out_0_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pdInfo_isCall = frontend_io_out_0_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pdInfo_isRet = frontend_io_out_0_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_pdInfo_jumpTarget = frontend_io_out_0_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_pc = frontend_io_out_0_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_fallThrough = frontend_io_out_0_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_taken = frontend_io_out_0_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_target = frontend_io_out_0_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_takenOffset = frontend_io_out_0_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_valid = frontend_io_out_0_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbHit = frontend_io_out_0_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsJalr = frontend_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsJal = frontend_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsCall = frontend_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsRet = frontend_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbOffset = frontend_io_out_0_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_phtCounter = frontend_io_out_0_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_rasTop = frontend_io_out_0_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_predTaken = frontend_io_out_0_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_bpuInfo_meta_predTarget = frontend_io_out_0_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_exception_excpTlbRefill = frontend_io_out_0_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_exception_excpTlbPif = frontend_io_out_0_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_exception_excpTlbPpi = frontend_io_out_0_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_0_bits_exception_excpAdef = frontend_io_out_0_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_valid = frontend_io_out_1_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_instr = frontend_io_out_1_bits_instr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pc = frontend_io_out_1_bits_pc; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pdInfo_valid = frontend_io_out_1_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pdInfo_isBr = frontend_io_out_1_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pdInfo_isJal = frontend_io_out_1_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pdInfo_isJalr = frontend_io_out_1_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pdInfo_isCall = frontend_io_out_1_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pdInfo_isRet = frontend_io_out_1_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_pdInfo_jumpTarget = frontend_io_out_1_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_pc = frontend_io_out_1_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_fallThrough = frontend_io_out_1_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_taken = frontend_io_out_1_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_target = frontend_io_out_1_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_takenOffset = frontend_io_out_1_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_valid = frontend_io_out_1_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbHit = frontend_io_out_1_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsJalr = frontend_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsJal = frontend_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsCall = frontend_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsRet = frontend_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbOffset = frontend_io_out_1_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_phtCounter = frontend_io_out_1_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_rasTop = frontend_io_out_1_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_predTaken = frontend_io_out_1_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_bpuInfo_meta_predTarget = frontend_io_out_1_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_exception_excpTlbRefill = frontend_io_out_1_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_exception_excpTlbPif = frontend_io_out_1_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_exception_excpTlbPpi = frontend_io_out_1_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_1_bits_exception_excpAdef = frontend_io_out_1_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_valid = frontend_io_out_2_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_instr = frontend_io_out_2_bits_instr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pc = frontend_io_out_2_bits_pc; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pdInfo_valid = frontend_io_out_2_bits_pdInfo_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pdInfo_isBr = frontend_io_out_2_bits_pdInfo_isBr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pdInfo_isJal = frontend_io_out_2_bits_pdInfo_isJal; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pdInfo_isJalr = frontend_io_out_2_bits_pdInfo_isJalr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pdInfo_isCall = frontend_io_out_2_bits_pdInfo_isCall; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pdInfo_isRet = frontend_io_out_2_bits_pdInfo_isRet; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_pdInfo_jumpTarget = frontend_io_out_2_bits_pdInfo_jumpTarget; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_pc = frontend_io_out_2_bits_bpuInfo_pc; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_fallThrough = frontend_io_out_2_bits_bpuInfo_fallThrough; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_taken = frontend_io_out_2_bits_bpuInfo_taken; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_target = frontend_io_out_2_bits_bpuInfo_target; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_takenOffset = frontend_io_out_2_bits_bpuInfo_takenOffset; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_valid = frontend_io_out_2_bits_bpuInfo_meta_valid; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbHit = frontend_io_out_2_bits_bpuInfo_meta_btbHit; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsJalr = frontend_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsJal = frontend_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsCall = frontend_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsRet = frontend_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbOffset = frontend_io_out_2_bits_bpuInfo_meta_btbOffset; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_phtCounter = frontend_io_out_2_bits_bpuInfo_meta_phtCounter; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_rasTop = frontend_io_out_2_bits_bpuInfo_meta_rasTop; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_predTaken = frontend_io_out_2_bits_bpuInfo_meta_predTaken; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_bpuInfo_meta_predTarget = frontend_io_out_2_bits_bpuInfo_meta_predTarget; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_exception_excpTlbRefill = frontend_io_out_2_bits_exception_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_exception_excpTlbPif = frontend_io_out_2_bits_exception_excpTlbPif; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_exception_excpTlbPpi = frontend_io_out_2_bits_exception_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_in_2_bits_exception_excpAdef = frontend_io_out_2_bits_exception_excpAdef; // @[src/main/scala/myCPU_top.scala 112:19]
  assign backend_io_csrResp_data = csr_io_rResp_data; // @[src/main/scala/myCPU_top.scala 173:16]
  assign backend_io_extInt = csr_io_hasIrq; // @[src/main/scala/myCPU_top.scala 175:21]
  assign backend_io_lsEnq_lqFull = memory_io_lsEnq_lqFull; // @[src/main/scala/myCPU_top.scala 117:20]
  assign backend_io_lsEnq_sqFull = memory_io_lsEnq_sqFull; // @[src/main/scala/myCPU_top.scala 117:20]
  assign backend_io_toMemResult_0_ready = memaddrtrans_io_in_ready; // @[src/main/scala/myCPU_top.scala 126:22]
  assign backend_io_toMemResult_1_ready = 1'h1; // @[src/main/scala/myCPU_top.scala 122:29]
  assign backend_io_fromMemResult_0_valid = memory_io_toWbResult_0_valid; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_pc = memory_io_toWbResult_0_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_ctrl_fuType = memory_io_toWbResult_0_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_ctrl_lsuOp = memory_io_toWbResult_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_ctrl_rfWen = memory_io_toWbResult_0_bits_uop_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_excp_excpVec = memory_io_toWbResult_0_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_pdst = memory_io_toWbResult_0_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_rdValid = memory_io_toWbResult_0_bits_uop_rdValid; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdx_value = memory_io_toWbResult_0_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdx_flag = memory_io_toWbResult_0_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdxFull_value = memory_io_toWbResult_0_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdxFull_flag = memory_io_toWbResult_0_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_lqIdx_value = memory_io_toWbResult_0_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_uop_sqIdx_value = memory_io_toWbResult_0_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_data = memory_io_toWbResult_0_bits_data; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_memVaddr = memory_io_toWbResult_0_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_0_bits_memPaddr = memory_io_toWbResult_0_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_valid = memory_io_toWbResult_1_valid; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_pc = memory_io_toWbResult_1_bits_uop_pc; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_ctrl_fuType = memory_io_toWbResult_1_bits_uop_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_ctrl_lsuOp = memory_io_toWbResult_1_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_excp_excpVec = memory_io_toWbResult_1_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_pdst = memory_io_toWbResult_1_bits_uop_pdst; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdx_value = memory_io_toWbResult_1_bits_uop_robIdx_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdx_flag = memory_io_toWbResult_1_bits_uop_robIdx_flag; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdxFull_value = memory_io_toWbResult_1_bits_uop_robIdxFull_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdxFull_flag = memory_io_toWbResult_1_bits_uop_robIdxFull_flag; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_lqIdx_value = memory_io_toWbResult_1_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_uop_sqIdx_value = memory_io_toWbResult_1_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_redirect_bits_robIdx_value =
    memory_io_toWbResult_1_bits_redirect_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_redirect_bits_robIdx_flag =
    memory_io_toWbResult_1_bits_redirect_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_memVaddr = memory_io_toWbResult_1_bits_memVaddr; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_memPaddr = memory_io_toWbResult_1_bits_memPaddr; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_fromMemResult_1_bits_memStoreData = memory_io_toWbResult_1_bits_memStoreData; // @[src/main/scala/myCPU_top.scala 132:24]
  assign backend_io_redirectAddrFromCsr_eentry = csr_io_redirectAddr_eentry; // @[src/main/scala/myCPU_top.scala 183:23]
  assign backend_io_redirectAddrFromCsr_era = csr_io_redirectAddr_era; // @[src/main/scala/myCPU_top.scala 183:23]
  assign backend_io_timerInfo_tid = csr_io_timerInfo_tid; // @[src/main/scala/myCPU_top.scala 170:20]
  assign backend_io_timerInfo_timer = csr_io_timerInfo_timer; // @[src/main/scala/myCPU_top.scala 170:20]
  assign memory_clock = aclk;
  assign memory_reset = rst_d1; // @[src/main/scala/myCPU_top.scala 95:24 99:16]
  assign memory_io_lsEnq_req_valid = backend_io_lsEnq_req_valid; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_req_bits_robIdx_value = backend_io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_req_bits_robIdx_flag = backend_io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_req_bits_isLoad = backend_io_lsEnq_req_bits_isLoad; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_req_bits_isStore = backend_io_lsEnq_req_bits_isStore; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_req_bits_sqIdx_value = backend_io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_req_bits_lqIdx_value = backend_io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_toLsqData_pc = backend_io_lsEnq_toLsqData_pc; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_toLsqData_ctrl_fuType = backend_io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_toLsqData_ctrl_lsuOp = backend_io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_toLsqData_ctrl_rfWen = backend_io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_lsEnq_toLsqData_pdst = backend_io_lsEnq_toLsqData_pdst; // @[src/main/scala/myCPU_top.scala 117:20]
  assign memory_io_fromExeMmuResult_valid = memaddrtrans_io_out_valid; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead = memaddrtrans_io_out_bits_exeRes_uop_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_excp_excpVec = memaddrtrans_io_out_bits_exeRes_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value = memaddrtrans_io_out_bits_exeRes_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value = memaddrtrans_io_out_bits_exeRes_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_isSta = memaddrtrans_io_out_bits_exeRes_uop_isSta; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_data = memaddrtrans_io_out_bits_exeRes_data; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_mmuRes_paddr = memaddrtrans_io_out_bits_mmuRes_paddr; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_mmuRes_cacheable = memaddrtrans_io_out_bits_mmuRes_cacheable; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_mmuRes_error_excpTlbRefill =
    memaddrtrans_io_out_bits_mmuRes_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_mmuRes_error_excpTlbPpi = memaddrtrans_io_out_bits_mmuRes_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_mmuRes_error_excpAle = memaddrtrans_io_out_bits_mmuRes_error_excpAle; // @[src/main/scala/myCPU_top.scala 127:30]
  assign memory_io_fromExeResult_valid = backend_io_toMemResult_1_valid; // @[src/main/scala/myCPU_top.scala 122:29]
  assign memory_io_fromExeResult_bits_uop_sqIdx_value = backend_io_toMemResult_1_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 122:29]
  assign memory_io_fromExeResult_bits_uop_isStd = backend_io_toMemResult_1_bits_uop_isStd; // @[src/main/scala/myCPU_top.scala 122:29]
  assign memory_io_fromExeResult_bits_data = backend_io_toMemResult_1_bits_data; // @[src/main/scala/myCPU_top.scala 122:29]
  assign memory_io_toWbResult_0_ready = backend_io_fromMemResult_0_ready; // @[src/main/scala/myCPU_top.scala 132:24]
  assign memory_io_toWbResult_1_ready = backend_io_fromMemResult_1_ready; // @[src/main/scala/myCPU_top.scala 132:24]
  assign memory_io_robCommit_0_valid = backend_io_commitToSq_valid_0; // @[src/main/scala/myCPU_top.scala 136:34]
  assign memory_io_robCommit_0_sqIdx = backend_io_commitToSq_bits_0_sqIdx_value; // @[src/main/scala/myCPU_top.scala 137:34]
  assign memory_io_robCommit_1_valid = backend_io_commitToSq_valid_1; // @[src/main/scala/myCPU_top.scala 136:34]
  assign memory_io_robCommit_1_sqIdx = backend_io_commitToSq_bits_1_sqIdx_value; // @[src/main/scala/myCPU_top.scala 137:34]
  assign memory_io_robCommit_2_valid = backend_io_commitToSq_valid_2; // @[src/main/scala/myCPU_top.scala 136:34]
  assign memory_io_robCommit_2_sqIdx = backend_io_commitToSq_bits_2_sqIdx_value; // @[src/main/scala/myCPU_top.scala 137:34]
  assign memory_io_axi_ar_arready = axi_crossbar_io_in_dcache_ar_arready; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_aw_awready = axi_crossbar_io_in_dcache_aw_awready; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_w_wready = axi_crossbar_io_in_dcache_w_wready; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_r_data_rid = axi_crossbar_io_in_dcache_r_data_rid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_r_data_rdata = axi_crossbar_io_in_dcache_r_data_rdata; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_r_data_rlast = axi_crossbar_io_in_dcache_r_data_rlast; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_r_data_rvalid = axi_crossbar_io_in_dcache_r_data_rvalid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_b_data_bid = axi_crossbar_io_in_dcache_b_data_bid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_axi_b_data_bvalid = axi_crossbar_io_in_dcache_b_data_bvalid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign memory_io_redirectInfo_valid = backend_io_redirectInfo_valid; // @[src/main/scala/myCPU_top.scala 110:26]
  assign memory_io_redirectInfo_bits_doRedirect = backend_io_redirectInfo_bits_doRedirect; // @[src/main/scala/myCPU_top.scala 110:26]
  assign memory_io_redirectInfo_bits_robIdx_value = backend_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/myCPU_top.scala 110:26]
  assign memory_io_redirectInfo_bits_robIdx_flag = backend_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/myCPU_top.scala 110:26]
  assign mmu_clock = aclk;
  assign mmu_reset = rst_d1; // @[src/main/scala/myCPU_top.scala 95:24 99:16]
  assign mmu_io_fromCsr_plv = csr_io_priv_plv; // @[src/main/scala/myCPU_top.scala 188:22]
  assign mmu_io_fromCsr_pgda = csr_io_tlbCtrl_pgda; // @[src/main/scala/myCPU_top.scala 189:23]
  assign mmu_io_fromCsr_dmw0 = csr_io_tlbCtrl_dmw0; // @[src/main/scala/myCPU_top.scala 190:23]
  assign mmu_io_fromCsr_dmw1 = csr_io_tlbCtrl_dmw1; // @[src/main/scala/myCPU_top.scala 191:23]
  assign mmu_io_fromCsr_datm = csr_io_cacheCtrl_datm; // @[src/main/scala/myCPU_top.scala 193:23]
  assign mmu_io_fromCsr_datf = csr_io_cacheCtrl_datf; // @[src/main/scala/myCPU_top.scala 194:23]
  assign mmu_io_fromIcache_valid = frontend_io_mmu_toMmu_valid; // @[src/main/scala/myCPU_top.scala 160:25]
  assign mmu_io_fromIcache_bits_vaddr = frontend_io_mmu_toMmu_bits_vaddr; // @[src/main/scala/myCPU_top.scala 160:25]
  assign mmu_io_toIcache_ready = 1'h1; // @[src/main/scala/myCPU_top.scala 161:27]
  assign mmu_io_fromMem_valid = memaddrtrans_io_mmuReq_valid; // @[src/main/scala/myCPU_top.scala 128:26]
  assign mmu_io_fromMem_bits_vaddr = memaddrtrans_io_mmuReq_bits_vaddr; // @[src/main/scala/myCPU_top.scala 128:26]
  assign mmu_io_fromMem_bits_lsuOp = memaddrtrans_io_mmuReq_bits_lsuOp; // @[src/main/scala/myCPU_top.scala 128:26]
  assign mmu_io_toMem_ready = 1'h1; // @[src/main/scala/myCPU_top.scala 129:27]
  assign memaddrtrans_clock = aclk;
  assign memaddrtrans_reset = rst_d1; // @[src/main/scala/myCPU_top.scala 95:24 99:16]
  assign memaddrtrans_io_in_valid = backend_io_toMemResult_0_valid; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_ctrl_lsuOp = backend_io_toMemResult_0_bits_uop_ctrl_lsuOp; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_ctrl_memRead = backend_io_toMemResult_0_bits_uop_ctrl_memRead; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_excp_excpVec = backend_io_toMemResult_0_bits_uop_excp_excpVec; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_lqIdx_value = backend_io_toMemResult_0_bits_uop_lqIdx_value; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_sqIdx_value = backend_io_toMemResult_0_bits_uop_sqIdx_value; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_isSta = backend_io_toMemResult_0_bits_uop_isSta; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_data = backend_io_toMemResult_0_bits_data; // @[src/main/scala/myCPU_top.scala 126:22]
  assign memaddrtrans_io_mmuReq_ready = mmu_io_fromMem_ready; // @[src/main/scala/myCPU_top.scala 128:26]
  assign memaddrtrans_io_mmuResp_valid = mmu_io_toMem_valid; // @[src/main/scala/myCPU_top.scala 129:27]
  assign memaddrtrans_io_mmuResp_bits_paddr = mmu_io_toMem_bits_paddr; // @[src/main/scala/myCPU_top.scala 129:27]
  assign memaddrtrans_io_mmuResp_bits_cacheable = mmu_io_toMem_bits_cacheable; // @[src/main/scala/myCPU_top.scala 129:27]
  assign memaddrtrans_io_mmuResp_bits_error_excpTlbRefill = mmu_io_toMem_bits_error_excpTlbRefill; // @[src/main/scala/myCPU_top.scala 129:27]
  assign memaddrtrans_io_mmuResp_bits_error_excpTlbPpi = mmu_io_toMem_bits_error_excpTlbPpi; // @[src/main/scala/myCPU_top.scala 129:27]
  assign memaddrtrans_io_mmuResp_bits_error_excpAle = mmu_io_toMem_bits_error_excpAle; // @[src/main/scala/myCPU_top.scala 129:27]
  assign csr_clock = aclk;
  assign csr_reset = rst_d1; // @[src/main/scala/myCPU_top.scala 95:24 99:16]
  assign csr_io_irqBus = intrpt; // @[src/main/scala/myCPU_top.scala 171:17]
  assign csr_io_rReq_addr = backend_io_csrReq_addr; // @[src/main/scala/myCPU_top.scala 172:15]
  assign csr_io_wReq_wen = backend_io_commitToCsr_csrWen; // @[src/main/scala/myCPU_top.scala 177:19]
  assign csr_io_wReq_addr = backend_io_commitToCsr_csrWaddr; // @[src/main/scala/myCPU_top.scala 178:20]
  assign csr_io_wReq_data = backend_io_commitToCsr_csrWdata; // @[src/main/scala/myCPU_top.scala 179:20]
  assign csr_io_excpEvent_excp = backend_io_excpEvent_excp; // @[src/main/scala/myCPU_top.scala 181:20]
  assign csr_io_excpEvent_ertn = backend_io_excpEvent_ertn; // @[src/main/scala/myCPU_top.scala 181:20]
  assign csr_io_excpInfo_vaddrError = backend_io_excpInfo_vaddrError; // @[src/main/scala/myCPU_top.scala 182:19]
  assign csr_io_excpInfo_era = backend_io_excpInfo_era; // @[src/main/scala/myCPU_top.scala 182:19]
  assign csr_io_excpInfo_ecode = backend_io_excpInfo_ecode; // @[src/main/scala/myCPU_top.scala 182:19]
  assign csr_io_excpInfo_badVaddr = backend_io_excpInfo_badVaddr; // @[src/main/scala/myCPU_top.scala 182:19]
  assign axi_crossbar_io_in_icache_ar_data_arid = frontend_io_axi_master_ar_data_arid; // @[src/main/scala/myCPU_top.scala 209:31]
  assign axi_crossbar_io_in_icache_ar_data_araddr = frontend_io_axi_master_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 209:31]
  assign axi_crossbar_io_in_icache_ar_data_arlen = frontend_io_axi_master_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 209:31]
  assign axi_crossbar_io_in_icache_ar_data_arsize = frontend_io_axi_master_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 209:31]
  assign axi_crossbar_io_in_icache_ar_data_arvalid = frontend_io_axi_master_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 209:31]
  assign axi_crossbar_io_in_icache_r_rready = frontend_io_axi_master_r_rready; // @[src/main/scala/myCPU_top.scala 209:31]
  assign axi_crossbar_io_in_dcache_ar_data_arid = memory_io_axi_ar_data_arid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_ar_data_araddr = memory_io_axi_ar_data_araddr; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_ar_data_arlen = memory_io_axi_ar_data_arlen; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_ar_data_arsize = memory_io_axi_ar_data_arsize; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_ar_data_arvalid = memory_io_axi_ar_data_arvalid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_aw_data_awid = memory_io_axi_aw_data_awid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_aw_data_awaddr = memory_io_axi_aw_data_awaddr; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_aw_data_awlen = memory_io_axi_aw_data_awlen; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_aw_data_awsize = memory_io_axi_aw_data_awsize; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_aw_data_awvalid = memory_io_axi_aw_data_awvalid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_w_data_wid = memory_io_axi_w_data_wid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_w_data_wdata = memory_io_axi_w_data_wdata; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_w_data_wstrb = memory_io_axi_w_data_wstrb; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_w_data_wlast = memory_io_axi_w_data_wlast; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_w_data_wvalid = memory_io_axi_w_data_wvalid; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_r_rready = memory_io_axi_r_rready; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_in_dcache_b_bready = memory_io_axi_b_bready; // @[src/main/scala/myCPU_top.scala 210:31]
  assign axi_crossbar_io_out_ar_arready = arready; // @[src/main/scala/myCPU_top.scala 223:34]
  assign axi_crossbar_io_out_aw_awready = awready; // @[src/main/scala/myCPU_top.scala 245:34]
  assign axi_crossbar_io_out_w_wready = wready; // @[src/main/scala/myCPU_top.scala 253:32]
  assign axi_crossbar_io_out_r_data_rid = rid; // @[src/main/scala/myCPU_top.scala 226:20 227:17]
  assign axi_crossbar_io_out_r_data_rdata = rdata; // @[src/main/scala/myCPU_top.scala 226:20 228:17]
  assign axi_crossbar_io_out_r_data_rlast = rlast; // @[src/main/scala/myCPU_top.scala 226:20 230:17]
  assign axi_crossbar_io_out_r_data_rvalid = rvalid; // @[src/main/scala/myCPU_top.scala 226:20 231:17]
  assign axi_crossbar_io_out_b_data_bid = bid; // @[src/main/scala/myCPU_top.scala 256:20 257:17]
  assign axi_crossbar_io_out_b_data_bvalid = bvalid; // @[src/main/scala/myCPU_top.scala 256:20 259:17]
  always @(posedge aclk) begin
    rst_d1 <= ~aresetn; // @[src/main/scala/myCPU_top.scala 96:27]
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
  rst_d1 = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
