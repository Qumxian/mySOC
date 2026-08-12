module SimpleBlockRAM_12(
  input         clock,
  input         reset,
  input         io_wr_en, // @[src/main/scala/util/BlockRAM.scala 63:14]
  input  [7:0]  io_wr_addr, // @[src/main/scala/util/BlockRAM.scala 63:14]
  input  [19:0] io_wr_data, // @[src/main/scala/util/BlockRAM.scala 63:14]
  input         io_rd_en, // @[src/main/scala/util/BlockRAM.scala 63:14]
  input  [7:0]  io_rd_addr, // @[src/main/scala/util/BlockRAM.scala 63:14]
  output [19:0] io_rd_data // @[src/main/scala/util/BlockRAM.scala 63:14]
);
  wire  blackbox_clka; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire  blackbox_wea; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire [7:0] blackbox_addra; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire [19:0] blackbox_dina; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire  blackbox_clkb; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire  blackbox_rstb; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire  blackbox_enb; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire [7:0] blackbox_addrb; // @[src/main/scala/util/BlockRAM.scala 106:26]
  wire [19:0] blackbox_doutb; // @[src/main/scala/util/BlockRAM.scala 106:26]
  BlockRAM_256x20 blackbox ( // @[src/main/scala/util/BlockRAM.scala 106:26]
    .clka(blackbox_clka),
    .wea(blackbox_wea),
    .addra(blackbox_addra),
    .dina(blackbox_dina),
    .clkb(blackbox_clkb),
    .rstb(blackbox_rstb),
    .enb(blackbox_enb),
    .addrb(blackbox_addrb),
    .doutb(blackbox_doutb)
  );
  assign io_rd_data = blackbox_doutb; // @[src/main/scala/util/BlockRAM.scala 116:21]
  assign blackbox_clka = clock; // @[src/main/scala/util/BlockRAM.scala 108:25]
  assign blackbox_wea = io_wr_en; // @[src/main/scala/util/BlockRAM.scala 109:25]
  assign blackbox_addra = io_wr_addr; // @[src/main/scala/util/BlockRAM.scala 110:25]
  assign blackbox_dina = io_wr_data; // @[src/main/scala/util/BlockRAM.scala 111:25]
  assign blackbox_clkb = clock; // @[src/main/scala/util/BlockRAM.scala 112:25]
  assign blackbox_rstb = reset; // @[src/main/scala/util/BlockRAM.scala 113:34]
  assign blackbox_enb = io_rd_en; // @[src/main/scala/util/BlockRAM.scala 114:25]
  assign blackbox_addrb = io_rd_addr; // @[src/main/scala/util/BlockRAM.scala 115:25]
endmodule
