module CpuCfg(
  input  [31:0] io_addr, // @[src/main/scala/backend/execute/CpuCfg.scala 8:14]
  output [31:0] io_rdata // @[src/main/scala/backend/execute/CpuCfg.scala 8:14]
);
  wire [31:0] _io_rdata_T_1 = 32'h1 == io_addr ? 32'h1f1f2 : 32'h0; // @[src/main/scala/backend/execute/CpuCfg.scala 46:44]
  wire [31:0] _io_rdata_T_3 = 32'h2 == io_addr ? 32'h0 : _io_rdata_T_1; // @[src/main/scala/backend/execute/CpuCfg.scala 46:44]
  wire [31:0] _io_rdata_T_5 = 32'h10 == io_addr ? 32'h0 : _io_rdata_T_3; // @[src/main/scala/backend/execute/CpuCfg.scala 46:44]
  wire [31:0] _io_rdata_T_7 = 32'h11 == io_addr ? 32'h0 : _io_rdata_T_5; // @[src/main/scala/backend/execute/CpuCfg.scala 46:44]
  wire [31:0] _io_rdata_T_9 = 32'h12 == io_addr ? 32'h0 : _io_rdata_T_7; // @[src/main/scala/backend/execute/CpuCfg.scala 46:44]
  assign io_rdata = 32'h13 == io_addr ? 32'h0 : _io_rdata_T_9; // @[src/main/scala/backend/execute/CpuCfg.scala 46:44]
endmodule
