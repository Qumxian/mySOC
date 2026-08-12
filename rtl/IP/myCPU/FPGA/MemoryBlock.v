module MemoryBlock(
  input         clock,
  input         reset,
  input         io_lsEnq_req_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [5:0]  io_lsEnq_req_bits_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_lsEnq_req_bits_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_lsEnq_req_bits_isLoad, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_lsEnq_req_bits_isStore, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_lsEnq_req_bits_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_lsEnq_req_bits_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [31:0] io_lsEnq_toLsqData_pc, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_lsEnq_toLsqData_ctrl_fuType, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_lsEnq_toLsqData_ctrl_lsuOp, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_lsEnq_toLsqData_ctrl_rfWen, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [6:0]  io_lsEnq_toLsqData_pdst, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_lsEnq_lqFull, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_lsEnq_sqFull, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_fromExeMmuResult_ready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeMmuResult_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [16:0] io_fromExeMmuResult_bits_exeRes_uop_excp_excpVec, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeMmuResult_bits_exeRes_uop_isSta, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [31:0] io_fromExeMmuResult_bits_exeRes_data, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [31:0] io_fromExeMmuResult_bits_mmuRes_paddr, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeMmuResult_bits_mmuRes_cacheable, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeMmuResult_bits_mmuRes_error_excpTlbRefill, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeMmuResult_bits_mmuRes_error_excpTlbPpi, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeMmuResult_bits_mmuRes_error_excpAle, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_fromExeResult_ready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeResult_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_fromExeResult_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_fromExeResult_bits_uop_isStd, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [31:0] io_fromExeResult_bits_data, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_toWbResult_0_ready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_0_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_0_bits_uop_pc, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_0_bits_uop_ctrl_fuType, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_0_bits_uop_ctrl_lsuOp, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_0_bits_uop_ctrl_rfWen, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [16:0] io_toWbResult_0_bits_uop_excp_excpVec, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [6:0]  io_toWbResult_0_bits_uop_pdst, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_0_bits_uop_rdValid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [5:0]  io_toWbResult_0_bits_uop_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_0_bits_uop_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [5:0]  io_toWbResult_0_bits_uop_robIdxFull_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_0_bits_uop_robIdxFull_flag, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_0_bits_uop_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_0_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_0_bits_data, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_0_bits_memVaddr, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_0_bits_memPaddr, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_toWbResult_1_ready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_1_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_1_bits_uop_pc, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_1_bits_uop_ctrl_fuType, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_1_bits_uop_ctrl_lsuOp, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [16:0] io_toWbResult_1_bits_uop_excp_excpVec, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [6:0]  io_toWbResult_1_bits_uop_pdst, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [5:0]  io_toWbResult_1_bits_uop_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_1_bits_uop_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [5:0]  io_toWbResult_1_bits_uop_robIdxFull_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_1_bits_uop_robIdxFull_flag, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_1_bits_uop_lqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_toWbResult_1_bits_uop_sqIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [5:0]  io_toWbResult_1_bits_redirect_bits_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_toWbResult_1_bits_redirect_bits_robIdx_flag, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_1_bits_memVaddr, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_1_bits_memPaddr, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_toWbResult_1_bits_memStoreData, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_robCommit_0_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_robCommit_0_sqIdx, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_robCommit_1_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_robCommit_1_sqIdx, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_robCommit_2_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_robCommit_2_sqIdx, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_axi_ar_data_arid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_axi_ar_data_araddr, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [7:0]  io_axi_ar_data_arlen, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [2:0]  io_axi_ar_data_arsize, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_axi_ar_data_arvalid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_axi_ar_arready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_axi_aw_data_awid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_axi_aw_data_awaddr, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [7:0]  io_axi_aw_data_awlen, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [2:0]  io_axi_aw_data_awsize, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_axi_aw_data_awvalid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_axi_aw_awready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_axi_w_data_wid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [31:0] io_axi_w_data_wdata, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output [3:0]  io_axi_w_data_wstrb, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_axi_w_data_wlast, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_axi_w_data_wvalid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_axi_w_wready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_axi_r_data_rid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [31:0] io_axi_r_data_rdata, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_axi_r_data_rlast, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_axi_r_data_rvalid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_axi_r_rready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [3:0]  io_axi_b_data_bid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_axi_b_data_bvalid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  output        io_axi_b_bready, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_redirectInfo_valid, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/memory/MemoryBlock.scala 22:14]
  input         io_redirectInfo_bits_robIdx_flag // @[src/main/scala/memory/MemoryBlock.scala 22:14]
);
  wire  loadQueue_clock; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_reset; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_redirectInfo_valid; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [5:0] loadQueue_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_enq_valid; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [5:0] loadQueue_io_enq_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_enq_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_enq_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_enq_pc; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [6:0] loadQueue_io_enq_pdst; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_enq_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_enq_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_enq_fuType; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_addrWrite_valid; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_addrWrite_idx; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_addrWrite_vaddr; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_addrWrite_paddr; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_addrWrite_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [16:0] loadQueue_io_addrWrite_excp_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [5:0] loadQueue_io_sqOldestRobIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_sqOldestRobIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_sqEmpty; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_dcacheReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_dcacheReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_dcacheReq_bits_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [5:0] loadQueue_io_dcacheReq_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_dcacheReq_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_dcacheReq_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_dcacheReq_bits_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_dcacheReq_bits_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_dcacheResp_ready; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_dcacheResp_valid; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_dcacheResp_bits_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_dcacheResp_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_outResult_ready; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [16:0] loadQueue_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [6:0] loadQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_outResult_bits_uop_rdValid; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [5:0] loadQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [5:0] loadQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [3:0] loadQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_outResult_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_outResult_bits_memVaddr; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire [31:0] loadQueue_io_outResult_bits_memPaddr; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  loadQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 75:26]
  wire  storeQueue_clock; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_reset; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_redirectInfo_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [5:0] storeQueue_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_enq_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [5:0] storeQueue_io_enq_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_enq_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_enq_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_enq_pc; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [6:0] storeQueue_io_enq_pdst; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_enq_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_enq_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_enq_fuType; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_addrWrite_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_addrWrite_idx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_addrWrite_vaddr; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_addrWrite_paddr; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [16:0] storeQueue_io_addrWrite_excp_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_addrWrite_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_dataWrite_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_dataWrite_idx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_dataWrite_data; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_robCommit_0_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_robCommit_0_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_robCommit_1_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_robCommit_1_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_robCommit_2_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_robCommit_2_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_dcacheReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_dcacheReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_dcacheReq_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_dcacheReq_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_dcacheReq_bits_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_dcacheReq_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_dcacheReq_bits_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_storeAck_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_storeAck_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_outResult_ready; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [16:0] storeQueue_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [6:0] storeQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [5:0] storeQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [5:0] storeQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [3:0] storeQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [5:0] storeQueue_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_outResult_bits_memVaddr; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_outResult_bits_memPaddr; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [31:0] storeQueue_io_outResult_bits_memStoreData; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire [5:0] storeQueue_io_oldestRobIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_oldestRobIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_sqEmpty; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  storeQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 76:26]
  wire  dcache_clock; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_reset; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_loadReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_loadReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_loadReq_bits_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [5:0] dcache_io_loadReq_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_loadReq_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_loadReq_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_loadReq_bits_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_loadReq_bits_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_loadResp_valid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_loadResp_bits_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_loadResp_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_storeReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_storeReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_storeReq_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_storeReq_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_storeReq_bits_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_storeReq_bits_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_storeReq_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_storeAck_valid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_storeAck_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_axi_ar_data_arid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_axi_ar_data_araddr; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [7:0] dcache_io_axi_ar_data_arlen; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [2:0] dcache_io_axi_ar_data_arsize; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_ar_data_arvalid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_ar_arready; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_axi_aw_data_awid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_axi_aw_data_awaddr; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [7:0] dcache_io_axi_aw_data_awlen; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [2:0] dcache_io_axi_aw_data_awsize; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_aw_data_awvalid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_aw_awready; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_axi_w_data_wid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_axi_w_data_wdata; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_axi_w_data_wstrb; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_w_data_wlast; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_w_data_wvalid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_w_wready; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_axi_r_data_rid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [31:0] dcache_io_axi_r_data_rdata; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_r_data_rlast; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_r_data_rvalid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_r_rready; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [3:0] dcache_io_axi_b_data_bid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_b_data_bvalid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_axi_b_bready; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_redirectInfo_valid; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire [5:0] dcache_io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  dcache_io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 161:22]
  wire  addrFire = io_fromExeMmuResult_ready & io_fromExeMmuResult_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  dataFire = io_fromExeResult_ready & io_fromExeResult_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [15:0] _excp_excpVec_T_1 = io_fromExeMmuResult_bits_mmuRes_error_excpAle ? 16'h200 : 16'h0; // @[src/main/scala/config/ExceptionDef.scala 105:16]
  wire [16:0] _GEN_0 = {{1'd0}, _excp_excpVec_T_1}; // @[src/main/scala/config/ExceptionDef.scala 105:11]
  wire [16:0] _excp_excpVec_T_2 = io_fromExeMmuResult_bits_exeRes_uop_excp_excpVec | _GEN_0; // @[src/main/scala/config/ExceptionDef.scala 105:11]
  wire [15:0] _excp_excpVec_T_4 = io_fromExeMmuResult_bits_mmuRes_error_excpTlbPpi ? 16'h2000 : 16'h0; // @[src/main/scala/config/ExceptionDef.scala 105:16]
  wire [16:0] _GEN_1 = {{1'd0}, _excp_excpVec_T_4}; // @[src/main/scala/config/ExceptionDef.scala 105:11]
  wire [16:0] _excp_excpVec_T_5 = _excp_excpVec_T_2 | _GEN_1; // @[src/main/scala/config/ExceptionDef.scala 105:11]
  wire [15:0] _excp_excpVec_T_7 = io_fromExeMmuResult_bits_mmuRes_error_excpTlbRefill ? 16'h800 : 16'h0; // @[src/main/scala/config/ExceptionDef.scala 105:16]
  wire [16:0] _GEN_2 = {{1'd0}, _excp_excpVec_T_7}; // @[src/main/scala/config/ExceptionDef.scala 105:11]
  LoadQueue loadQueue ( // @[src/main/scala/memory/MemoryBlock.scala 75:26]
    .clock(loadQueue_clock),
    .reset(loadQueue_reset),
    .io_redirectInfo_valid(loadQueue_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(loadQueue_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(loadQueue_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(loadQueue_io_redirectInfo_bits_robIdx_flag),
    .io_enq_valid(loadQueue_io_enq_valid),
    .io_enq_robIdx_value(loadQueue_io_enq_robIdx_value),
    .io_enq_robIdx_flag(loadQueue_io_enq_robIdx_flag),
    .io_enq_sqIdx(loadQueue_io_enq_sqIdx),
    .io_enq_pc(loadQueue_io_enq_pc),
    .io_enq_pdst(loadQueue_io_enq_pdst),
    .io_enq_rfWen(loadQueue_io_enq_rfWen),
    .io_enq_lsuOp(loadQueue_io_enq_lsuOp),
    .io_enq_fuType(loadQueue_io_enq_fuType),
    .io_addrWrite_valid(loadQueue_io_addrWrite_valid),
    .io_addrWrite_idx(loadQueue_io_addrWrite_idx),
    .io_addrWrite_vaddr(loadQueue_io_addrWrite_vaddr),
    .io_addrWrite_paddr(loadQueue_io_addrWrite_paddr),
    .io_addrWrite_cacheable(loadQueue_io_addrWrite_cacheable),
    .io_addrWrite_excp_excpVec(loadQueue_io_addrWrite_excp_excpVec),
    .io_sqOldestRobIdx_value(loadQueue_io_sqOldestRobIdx_value),
    .io_sqOldestRobIdx_flag(loadQueue_io_sqOldestRobIdx_flag),
    .io_sqEmpty(loadQueue_io_sqEmpty),
    .io_dcacheReq_ready(loadQueue_io_dcacheReq_ready),
    .io_dcacheReq_valid(loadQueue_io_dcacheReq_valid),
    .io_dcacheReq_bits_lqIdx(loadQueue_io_dcacheReq_bits_lqIdx),
    .io_dcacheReq_bits_robIdx_value(loadQueue_io_dcacheReq_bits_robIdx_value),
    .io_dcacheReq_bits_robIdx_flag(loadQueue_io_dcacheReq_bits_robIdx_flag),
    .io_dcacheReq_bits_paddr(loadQueue_io_dcacheReq_bits_paddr),
    .io_dcacheReq_bits_cacheable(loadQueue_io_dcacheReq_bits_cacheable),
    .io_dcacheReq_bits_lsuOp(loadQueue_io_dcacheReq_bits_lsuOp),
    .io_dcacheResp_ready(loadQueue_io_dcacheResp_ready),
    .io_dcacheResp_valid(loadQueue_io_dcacheResp_valid),
    .io_dcacheResp_bits_lqIdx(loadQueue_io_dcacheResp_bits_lqIdx),
    .io_dcacheResp_bits_data(loadQueue_io_dcacheResp_bits_data),
    .io_outResult_ready(loadQueue_io_outResult_ready),
    .io_outResult_valid(loadQueue_io_outResult_valid),
    .io_outResult_bits_uop_pc(loadQueue_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_ctrl_fuType(loadQueue_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_lsuOp(loadQueue_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_ctrl_rfWen(loadQueue_io_outResult_bits_uop_ctrl_rfWen),
    .io_outResult_bits_uop_excp_excpVec(loadQueue_io_outResult_bits_uop_excp_excpVec),
    .io_outResult_bits_uop_pdst(loadQueue_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_rdValid(loadQueue_io_outResult_bits_uop_rdValid),
    .io_outResult_bits_uop_robIdx_value(loadQueue_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(loadQueue_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(loadQueue_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(loadQueue_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(loadQueue_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_sqIdx_value(loadQueue_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_data(loadQueue_io_outResult_bits_data),
    .io_outResult_bits_memVaddr(loadQueue_io_outResult_bits_memVaddr),
    .io_outResult_bits_memPaddr(loadQueue_io_outResult_bits_memPaddr),
    .io_full(loadQueue_io_full)
  );
  StoreQueue storeQueue ( // @[src/main/scala/memory/MemoryBlock.scala 76:26]
    .clock(storeQueue_clock),
    .reset(storeQueue_reset),
    .io_redirectInfo_valid(storeQueue_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(storeQueue_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(storeQueue_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(storeQueue_io_redirectInfo_bits_robIdx_flag),
    .io_enq_valid(storeQueue_io_enq_valid),
    .io_enq_robIdx_value(storeQueue_io_enq_robIdx_value),
    .io_enq_robIdx_flag(storeQueue_io_enq_robIdx_flag),
    .io_enq_lqIdx(storeQueue_io_enq_lqIdx),
    .io_enq_pc(storeQueue_io_enq_pc),
    .io_enq_pdst(storeQueue_io_enq_pdst),
    .io_enq_rfWen(storeQueue_io_enq_rfWen),
    .io_enq_lsuOp(storeQueue_io_enq_lsuOp),
    .io_enq_fuType(storeQueue_io_enq_fuType),
    .io_addrWrite_valid(storeQueue_io_addrWrite_valid),
    .io_addrWrite_idx(storeQueue_io_addrWrite_idx),
    .io_addrWrite_vaddr(storeQueue_io_addrWrite_vaddr),
    .io_addrWrite_paddr(storeQueue_io_addrWrite_paddr),
    .io_addrWrite_excp_excpVec(storeQueue_io_addrWrite_excp_excpVec),
    .io_addrWrite_cacheable(storeQueue_io_addrWrite_cacheable),
    .io_dataWrite_valid(storeQueue_io_dataWrite_valid),
    .io_dataWrite_idx(storeQueue_io_dataWrite_idx),
    .io_dataWrite_data(storeQueue_io_dataWrite_data),
    .io_robCommit_0_valid(storeQueue_io_robCommit_0_valid),
    .io_robCommit_0_sqIdx(storeQueue_io_robCommit_0_sqIdx),
    .io_robCommit_1_valid(storeQueue_io_robCommit_1_valid),
    .io_robCommit_1_sqIdx(storeQueue_io_robCommit_1_sqIdx),
    .io_robCommit_2_valid(storeQueue_io_robCommit_2_valid),
    .io_robCommit_2_sqIdx(storeQueue_io_robCommit_2_sqIdx),
    .io_dcacheReq_ready(storeQueue_io_dcacheReq_ready),
    .io_dcacheReq_valid(storeQueue_io_dcacheReq_valid),
    .io_dcacheReq_bits_sqIdx(storeQueue_io_dcacheReq_bits_sqIdx),
    .io_dcacheReq_bits_paddr(storeQueue_io_dcacheReq_bits_paddr),
    .io_dcacheReq_bits_cacheable(storeQueue_io_dcacheReq_bits_cacheable),
    .io_dcacheReq_bits_data(storeQueue_io_dcacheReq_bits_data),
    .io_dcacheReq_bits_lsuOp(storeQueue_io_dcacheReq_bits_lsuOp),
    .io_storeAck_valid(storeQueue_io_storeAck_valid),
    .io_storeAck_bits_sqIdx(storeQueue_io_storeAck_bits_sqIdx),
    .io_outResult_ready(storeQueue_io_outResult_ready),
    .io_outResult_valid(storeQueue_io_outResult_valid),
    .io_outResult_bits_uop_pc(storeQueue_io_outResult_bits_uop_pc),
    .io_outResult_bits_uop_ctrl_fuType(storeQueue_io_outResult_bits_uop_ctrl_fuType),
    .io_outResult_bits_uop_ctrl_lsuOp(storeQueue_io_outResult_bits_uop_ctrl_lsuOp),
    .io_outResult_bits_uop_excp_excpVec(storeQueue_io_outResult_bits_uop_excp_excpVec),
    .io_outResult_bits_uop_pdst(storeQueue_io_outResult_bits_uop_pdst),
    .io_outResult_bits_uop_robIdx_value(storeQueue_io_outResult_bits_uop_robIdx_value),
    .io_outResult_bits_uop_robIdx_flag(storeQueue_io_outResult_bits_uop_robIdx_flag),
    .io_outResult_bits_uop_robIdxFull_value(storeQueue_io_outResult_bits_uop_robIdxFull_value),
    .io_outResult_bits_uop_robIdxFull_flag(storeQueue_io_outResult_bits_uop_robIdxFull_flag),
    .io_outResult_bits_uop_lqIdx_value(storeQueue_io_outResult_bits_uop_lqIdx_value),
    .io_outResult_bits_uop_sqIdx_value(storeQueue_io_outResult_bits_uop_sqIdx_value),
    .io_outResult_bits_redirect_bits_robIdx_value(storeQueue_io_outResult_bits_redirect_bits_robIdx_value),
    .io_outResult_bits_redirect_bits_robIdx_flag(storeQueue_io_outResult_bits_redirect_bits_robIdx_flag),
    .io_outResult_bits_memVaddr(storeQueue_io_outResult_bits_memVaddr),
    .io_outResult_bits_memPaddr(storeQueue_io_outResult_bits_memPaddr),
    .io_outResult_bits_memStoreData(storeQueue_io_outResult_bits_memStoreData),
    .io_oldestRobIdx_value(storeQueue_io_oldestRobIdx_value),
    .io_oldestRobIdx_flag(storeQueue_io_oldestRobIdx_flag),
    .io_sqEmpty(storeQueue_io_sqEmpty),
    .io_full(storeQueue_io_full)
  );
  DCache dcache ( // @[src/main/scala/memory/MemoryBlock.scala 161:22]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_loadReq_ready(dcache_io_loadReq_ready),
    .io_loadReq_valid(dcache_io_loadReq_valid),
    .io_loadReq_bits_lqIdx(dcache_io_loadReq_bits_lqIdx),
    .io_loadReq_bits_robIdx_value(dcache_io_loadReq_bits_robIdx_value),
    .io_loadReq_bits_robIdx_flag(dcache_io_loadReq_bits_robIdx_flag),
    .io_loadReq_bits_paddr(dcache_io_loadReq_bits_paddr),
    .io_loadReq_bits_cacheable(dcache_io_loadReq_bits_cacheable),
    .io_loadReq_bits_lsuOp(dcache_io_loadReq_bits_lsuOp),
    .io_loadResp_valid(dcache_io_loadResp_valid),
    .io_loadResp_bits_lqIdx(dcache_io_loadResp_bits_lqIdx),
    .io_loadResp_bits_data(dcache_io_loadResp_bits_data),
    .io_storeReq_ready(dcache_io_storeReq_ready),
    .io_storeReq_valid(dcache_io_storeReq_valid),
    .io_storeReq_bits_paddr(dcache_io_storeReq_bits_paddr),
    .io_storeReq_bits_data(dcache_io_storeReq_bits_data),
    .io_storeReq_bits_lsuOp(dcache_io_storeReq_bits_lsuOp),
    .io_storeReq_bits_cacheable(dcache_io_storeReq_bits_cacheable),
    .io_storeReq_bits_sqIdx(dcache_io_storeReq_bits_sqIdx),
    .io_storeAck_valid(dcache_io_storeAck_valid),
    .io_storeAck_bits_sqIdx(dcache_io_storeAck_bits_sqIdx),
    .io_axi_ar_data_arid(dcache_io_axi_ar_data_arid),
    .io_axi_ar_data_araddr(dcache_io_axi_ar_data_araddr),
    .io_axi_ar_data_arlen(dcache_io_axi_ar_data_arlen),
    .io_axi_ar_data_arsize(dcache_io_axi_ar_data_arsize),
    .io_axi_ar_data_arvalid(dcache_io_axi_ar_data_arvalid),
    .io_axi_ar_arready(dcache_io_axi_ar_arready),
    .io_axi_aw_data_awid(dcache_io_axi_aw_data_awid),
    .io_axi_aw_data_awaddr(dcache_io_axi_aw_data_awaddr),
    .io_axi_aw_data_awlen(dcache_io_axi_aw_data_awlen),
    .io_axi_aw_data_awsize(dcache_io_axi_aw_data_awsize),
    .io_axi_aw_data_awvalid(dcache_io_axi_aw_data_awvalid),
    .io_axi_aw_awready(dcache_io_axi_aw_awready),
    .io_axi_w_data_wid(dcache_io_axi_w_data_wid),
    .io_axi_w_data_wdata(dcache_io_axi_w_data_wdata),
    .io_axi_w_data_wstrb(dcache_io_axi_w_data_wstrb),
    .io_axi_w_data_wlast(dcache_io_axi_w_data_wlast),
    .io_axi_w_data_wvalid(dcache_io_axi_w_data_wvalid),
    .io_axi_w_wready(dcache_io_axi_w_wready),
    .io_axi_r_data_rid(dcache_io_axi_r_data_rid),
    .io_axi_r_data_rdata(dcache_io_axi_r_data_rdata),
    .io_axi_r_data_rlast(dcache_io_axi_r_data_rlast),
    .io_axi_r_data_rvalid(dcache_io_axi_r_data_rvalid),
    .io_axi_r_rready(dcache_io_axi_r_rready),
    .io_axi_b_data_bid(dcache_io_axi_b_data_bid),
    .io_axi_b_data_bvalid(dcache_io_axi_b_data_bvalid),
    .io_axi_b_bready(dcache_io_axi_b_bready),
    .io_redirectInfo_valid(dcache_io_redirectInfo_valid),
    .io_redirectInfo_bits_doRedirect(dcache_io_redirectInfo_bits_doRedirect),
    .io_redirectInfo_bits_robIdx_value(dcache_io_redirectInfo_bits_robIdx_value),
    .io_redirectInfo_bits_robIdx_flag(dcache_io_redirectInfo_bits_robIdx_flag)
  );
  assign io_lsEnq_lqFull = loadQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 101:19]
  assign io_lsEnq_sqFull = storeQueue_io_full; // @[src/main/scala/memory/MemoryBlock.scala 102:19]
  assign io_fromExeMmuResult_ready = 1'h1; // @[src/main/scala/memory/MemoryBlock.scala 156:29]
  assign io_fromExeResult_ready = 1'h1; // @[src/main/scala/memory/MemoryBlock.scala 155:26]
  assign io_toWbResult_0_valid = loadQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_pc = loadQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_ctrl_fuType = loadQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_ctrl_lsuOp = loadQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_ctrl_rfWen = loadQueue_io_outResult_bits_uop_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_excp_excpVec = loadQueue_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_pdst = loadQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_rdValid = loadQueue_io_outResult_bits_uop_rdValid; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_robIdx_value = loadQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_robIdx_flag = loadQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_robIdxFull_value = loadQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_robIdxFull_flag = loadQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_lqIdx_value = loadQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_uop_sqIdx_value = loadQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_data = loadQueue_io_outResult_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_memVaddr = loadQueue_io_outResult_bits_memVaddr; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_0_bits_memPaddr = loadQueue_io_outResult_bits_memPaddr; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign io_toWbResult_1_valid = storeQueue_io_outResult_valid; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_pc = storeQueue_io_outResult_bits_uop_pc; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_ctrl_fuType = storeQueue_io_outResult_bits_uop_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_ctrl_lsuOp = storeQueue_io_outResult_bits_uop_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_excp_excpVec = storeQueue_io_outResult_bits_uop_excp_excpVec; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_pdst = storeQueue_io_outResult_bits_uop_pdst; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_robIdx_value = storeQueue_io_outResult_bits_uop_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_robIdx_flag = storeQueue_io_outResult_bits_uop_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_robIdxFull_value = storeQueue_io_outResult_bits_uop_robIdxFull_value; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_robIdxFull_flag = storeQueue_io_outResult_bits_uop_robIdxFull_flag; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_lqIdx_value = storeQueue_io_outResult_bits_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_uop_sqIdx_value = storeQueue_io_outResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_redirect_bits_robIdx_value = storeQueue_io_outResult_bits_redirect_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_redirect_bits_robIdx_flag = storeQueue_io_outResult_bits_redirect_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_memVaddr = storeQueue_io_outResult_bits_memVaddr; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_memPaddr = storeQueue_io_outResult_bits_memPaddr; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_toWbResult_1_bits_memStoreData = storeQueue_io_outResult_bits_memStoreData; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign io_axi_ar_data_arid = dcache_io_axi_ar_data_arid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_ar_data_araddr = dcache_io_axi_ar_data_araddr; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_ar_data_arlen = dcache_io_axi_ar_data_arlen; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_ar_data_arsize = dcache_io_axi_ar_data_arsize; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_ar_data_arvalid = dcache_io_axi_ar_data_arvalid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_aw_data_awid = dcache_io_axi_aw_data_awid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_aw_data_awaddr = dcache_io_axi_aw_data_awaddr; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_aw_data_awlen = dcache_io_axi_aw_data_awlen; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_aw_data_awsize = dcache_io_axi_aw_data_awsize; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_aw_data_awvalid = dcache_io_axi_aw_data_awvalid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_w_data_wid = dcache_io_axi_w_data_wid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_w_data_wdata = dcache_io_axi_w_data_wdata; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_w_data_wstrb = dcache_io_axi_w_data_wstrb; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_w_data_wlast = dcache_io_axi_w_data_wlast; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_w_data_wvalid = dcache_io_axi_w_data_wvalid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_r_rready = dcache_io_axi_r_rready; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign io_axi_b_bready = dcache_io_axi_b_bready; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign loadQueue_clock = clock;
  assign loadQueue_reset = reset;
  assign loadQueue_io_redirectInfo_valid = io_redirectInfo_valid; // @[src/main/scala/memory/MemoryBlock.scala 78:29]
  assign loadQueue_io_redirectInfo_bits_doRedirect = io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/MemoryBlock.scala 78:29]
  assign loadQueue_io_redirectInfo_bits_robIdx_value = io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 78:29]
  assign loadQueue_io_redirectInfo_bits_robIdx_flag = io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 78:29]
  assign loadQueue_io_enq_valid = io_lsEnq_req_valid & io_lsEnq_req_bits_isLoad; // @[src/main/scala/memory/MemoryBlock.scala 83:49]
  assign loadQueue_io_enq_robIdx_value = io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 84:27]
  assign loadQueue_io_enq_robIdx_flag = io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 84:27]
  assign loadQueue_io_enq_sqIdx = io_lsEnq_req_bits_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 85:27]
  assign loadQueue_io_enq_pc = io_lsEnq_toLsqData_pc; // @[src/main/scala/memory/MemoryBlock.scala 86:27]
  assign loadQueue_io_enq_pdst = io_lsEnq_toLsqData_pdst; // @[src/main/scala/memory/MemoryBlock.scala 87:27]
  assign loadQueue_io_enq_rfWen = io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 88:27]
  assign loadQueue_io_enq_lsuOp = io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 89:27]
  assign loadQueue_io_enq_fuType = io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 90:27]
  assign loadQueue_io_addrWrite_valid = addrFire & io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead; // @[src/main/scala/memory/MemoryBlock.scala 135:44]
  assign loadQueue_io_addrWrite_idx = io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 136:32]
  assign loadQueue_io_addrWrite_vaddr = io_fromExeMmuResult_bits_exeRes_data; // @[src/main/scala/memory/MemoryBlock.scala 137:32]
  assign loadQueue_io_addrWrite_paddr = io_fromExeMmuResult_bits_mmuRes_paddr; // @[src/main/scala/memory/MemoryBlock.scala 138:32]
  assign loadQueue_io_addrWrite_cacheable = io_fromExeMmuResult_bits_mmuRes_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 139:36]
  assign loadQueue_io_addrWrite_excp_excpVec = _excp_excpVec_T_5 | _GEN_2; // @[src/main/scala/config/ExceptionDef.scala 105:11]
  assign loadQueue_io_sqOldestRobIdx_value = storeQueue_io_oldestRobIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 109:31]
  assign loadQueue_io_sqOldestRobIdx_flag = storeQueue_io_oldestRobIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 109:31]
  assign loadQueue_io_sqEmpty = storeQueue_io_sqEmpty; // @[src/main/scala/memory/MemoryBlock.scala 110:31]
  assign loadQueue_io_dcacheReq_ready = dcache_io_loadReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign loadQueue_io_dcacheResp_valid = dcache_io_loadResp_valid; // @[src/main/scala/memory/MemoryBlock.scala 164:22]
  assign loadQueue_io_dcacheResp_bits_lqIdx = dcache_io_loadResp_bits_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 164:22]
  assign loadQueue_io_dcacheResp_bits_data = dcache_io_loadResp_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 164:22]
  assign loadQueue_io_outResult_ready = io_toWbResult_0_ready; // @[src/main/scala/memory/MemoryBlock.scala 185:20]
  assign storeQueue_clock = clock;
  assign storeQueue_reset = reset;
  assign storeQueue_io_redirectInfo_valid = io_redirectInfo_valid; // @[src/main/scala/memory/MemoryBlock.scala 77:30]
  assign storeQueue_io_redirectInfo_bits_doRedirect = io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/MemoryBlock.scala 77:30]
  assign storeQueue_io_redirectInfo_bits_robIdx_value = io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 77:30]
  assign storeQueue_io_redirectInfo_bits_robIdx_flag = io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 77:30]
  assign storeQueue_io_enq_valid = io_lsEnq_req_valid & io_lsEnq_req_bits_isStore; // @[src/main/scala/memory/MemoryBlock.scala 92:50]
  assign storeQueue_io_enq_robIdx_value = io_lsEnq_req_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 93:28]
  assign storeQueue_io_enq_robIdx_flag = io_lsEnq_req_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 93:28]
  assign storeQueue_io_enq_lqIdx = io_lsEnq_req_bits_lqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 94:28]
  assign storeQueue_io_enq_pc = io_lsEnq_toLsqData_pc; // @[src/main/scala/memory/MemoryBlock.scala 95:28]
  assign storeQueue_io_enq_pdst = io_lsEnq_toLsqData_pdst; // @[src/main/scala/memory/MemoryBlock.scala 96:28]
  assign storeQueue_io_enq_rfWen = io_lsEnq_toLsqData_ctrl_rfWen; // @[src/main/scala/memory/MemoryBlock.scala 97:28]
  assign storeQueue_io_enq_lsuOp = io_lsEnq_toLsqData_ctrl_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 98:28]
  assign storeQueue_io_enq_fuType = io_lsEnq_toLsqData_ctrl_fuType; // @[src/main/scala/memory/MemoryBlock.scala 99:28]
  assign storeQueue_io_addrWrite_valid = addrFire & io_fromExeMmuResult_bits_exeRes_uop_isSta; // @[src/main/scala/memory/MemoryBlock.scala 143:45]
  assign storeQueue_io_addrWrite_idx = io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 144:33]
  assign storeQueue_io_addrWrite_vaddr = io_fromExeMmuResult_bits_exeRes_data; // @[src/main/scala/memory/MemoryBlock.scala 145:33]
  assign storeQueue_io_addrWrite_paddr = io_fromExeMmuResult_bits_mmuRes_paddr; // @[src/main/scala/memory/MemoryBlock.scala 146:33]
  assign storeQueue_io_addrWrite_excp_excpVec = _excp_excpVec_T_5 | _GEN_2; // @[src/main/scala/config/ExceptionDef.scala 105:11]
  assign storeQueue_io_addrWrite_cacheable = io_fromExeMmuResult_bits_mmuRes_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 147:37]
  assign storeQueue_io_dataWrite_valid = dataFire & io_fromExeResult_bits_uop_isStd; // @[src/main/scala/memory/MemoryBlock.scala 151:45]
  assign storeQueue_io_dataWrite_idx = io_fromExeResult_bits_uop_sqIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 152:33]
  assign storeQueue_io_dataWrite_data = io_fromExeResult_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 153:33]
  assign storeQueue_io_robCommit_0_valid = io_robCommit_0_valid; // @[src/main/scala/memory/MemoryBlock.scala 180:27]
  assign storeQueue_io_robCommit_0_sqIdx = io_robCommit_0_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 180:27]
  assign storeQueue_io_robCommit_1_valid = io_robCommit_1_valid; // @[src/main/scala/memory/MemoryBlock.scala 180:27]
  assign storeQueue_io_robCommit_1_sqIdx = io_robCommit_1_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 180:27]
  assign storeQueue_io_robCommit_2_valid = io_robCommit_2_valid; // @[src/main/scala/memory/MemoryBlock.scala 180:27]
  assign storeQueue_io_robCommit_2_sqIdx = io_robCommit_2_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 180:27]
  assign storeQueue_io_dcacheReq_ready = dcache_io_storeReq_ready; // @[src/main/scala/memory/MemoryBlock.scala 166:22]
  assign storeQueue_io_storeAck_valid = dcache_io_storeAck_valid; // @[src/main/scala/memory/MemoryBlock.scala 167:22]
  assign storeQueue_io_storeAck_bits_sqIdx = dcache_io_storeAck_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 167:22]
  assign storeQueue_io_outResult_ready = io_toWbResult_1_ready; // @[src/main/scala/memory/MemoryBlock.scala 186:20]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_loadReq_valid = loadQueue_io_dcacheReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign dcache_io_loadReq_bits_lqIdx = loadQueue_io_dcacheReq_bits_lqIdx; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign dcache_io_loadReq_bits_robIdx_value = loadQueue_io_dcacheReq_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign dcache_io_loadReq_bits_robIdx_flag = loadQueue_io_dcacheReq_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign dcache_io_loadReq_bits_paddr = loadQueue_io_dcacheReq_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign dcache_io_loadReq_bits_cacheable = loadQueue_io_dcacheReq_bits_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign dcache_io_loadReq_bits_lsuOp = loadQueue_io_dcacheReq_bits_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 163:21]
  assign dcache_io_storeReq_valid = storeQueue_io_dcacheReq_valid; // @[src/main/scala/memory/MemoryBlock.scala 166:22]
  assign dcache_io_storeReq_bits_paddr = storeQueue_io_dcacheReq_bits_paddr; // @[src/main/scala/memory/MemoryBlock.scala 166:22]
  assign dcache_io_storeReq_bits_data = storeQueue_io_dcacheReq_bits_data; // @[src/main/scala/memory/MemoryBlock.scala 166:22]
  assign dcache_io_storeReq_bits_lsuOp = storeQueue_io_dcacheReq_bits_lsuOp; // @[src/main/scala/memory/MemoryBlock.scala 166:22]
  assign dcache_io_storeReq_bits_cacheable = storeQueue_io_dcacheReq_bits_cacheable; // @[src/main/scala/memory/MemoryBlock.scala 166:22]
  assign dcache_io_storeReq_bits_sqIdx = storeQueue_io_dcacheReq_bits_sqIdx; // @[src/main/scala/memory/MemoryBlock.scala 166:22]
  assign dcache_io_axi_ar_arready = io_axi_ar_arready; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_aw_awready = io_axi_aw_awready; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_w_wready = io_axi_w_wready; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_r_data_rid = io_axi_r_data_rid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_r_data_rdata = io_axi_r_data_rdata; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_r_data_rlast = io_axi_r_data_rlast; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_r_data_rvalid = io_axi_r_data_rvalid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_b_data_bid = io_axi_b_data_bid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_axi_b_data_bvalid = io_axi_b_data_bvalid; // @[src/main/scala/memory/MemoryBlock.scala 168:17]
  assign dcache_io_redirectInfo_valid = io_redirectInfo_valid; // @[src/main/scala/memory/MemoryBlock.scala 169:26]
  assign dcache_io_redirectInfo_bits_doRedirect = io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/MemoryBlock.scala 169:26]
  assign dcache_io_redirectInfo_bits_robIdx_value = io_redirectInfo_bits_robIdx_value; // @[src/main/scala/memory/MemoryBlock.scala 169:26]
  assign dcache_io_redirectInfo_bits_robIdx_flag = io_redirectInfo_bits_robIdx_flag; // @[src/main/scala/memory/MemoryBlock.scala 169:26]
endmodule
