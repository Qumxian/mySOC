module DCacheArray(
  input          clock,
  input          reset,
  input          io_read_valid, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input  [7:0]   io_read_idx, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_0_valid, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_0_dirty, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [17:0]  io_read_resp_ways_0_tag, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [511:0] io_read_resp_ways_0_data, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_1_valid, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_1_dirty, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [17:0]  io_read_resp_ways_1_tag, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [511:0] io_read_resp_ways_1_data, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_2_valid, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_2_dirty, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [17:0]  io_read_resp_ways_2_tag, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [511:0] io_read_resp_ways_2_data, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_3_valid, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output         io_read_resp_ways_3_dirty, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [17:0]  io_read_resp_ways_3_tag, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  output [511:0] io_read_resp_ways_3_data, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input          io_write_valid, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input  [7:0]   io_write_idx, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input  [1:0]   io_write_way, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input  [17:0]  io_write_tag, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input          io_write_dirty, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input  [511:0] io_write_data, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input          io_metaWrite_valid, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input  [7:0]   io_metaWrite_idx, // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
  input  [1:0]   io_metaWrite_way // @[src/main/scala/memory/dcache/DCacheArray.scala 12:14]
);
  wire  SimpleBlockRAM_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_1_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_1_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_1_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_1_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_1_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_1_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_1_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_1_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_2_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_2_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_2_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_2_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_2_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_2_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_2_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_2_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_3_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_3_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_3_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_3_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_3_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_3_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [7:0] SimpleBlockRAM_3_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire [19:0] SimpleBlockRAM_3_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
  wire  SimpleBlockRAM_4_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_4_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_4_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_4_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_4_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_4_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_4_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_4_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_5_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_5_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_5_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_5_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_5_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_5_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_5_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_5_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_6_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_6_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_6_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_6_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_6_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_6_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_6_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_6_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_7_clock; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_7_reset; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_7_io_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_7_io_wr_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_7_io_wr_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire  SimpleBlockRAM_7_io_rd_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [7:0] SimpleBlockRAM_7_io_rd_addr; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [511:0] SimpleBlockRAM_7_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
  wire [19:0] metaBRAMs_0_rd_data = SimpleBlockRAM_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:{26,26}]
  wire [19:0] metaBRAMs_1_rd_data = SimpleBlockRAM_1_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:{26,26}]
  wire [19:0] metaBRAMs_2_rd_data = SimpleBlockRAM_2_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:{26,26}]
  wire [19:0] metaBRAMs_3_rd_data = SimpleBlockRAM_3_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:{26,26}]
  wire [3:0] writeWayOneHot = 4'h1 << io_write_way; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire  waySel = writeWayOneHot[0]; // @[src/main/scala/memory/dcache/DCacheArray.scala 66:32]
  wire [19:0] metaWriteData = {1'h1,io_write_dirty,io_write_tag}; // @[src/main/scala/memory/dcache/DCacheArray.scala 67:28]
  wire  dataBRAMs_0_wr_en = io_write_valid & waySel; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  wire [7:0] _GEN_4 = dataBRAMs_0_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 69:28 74:36 76:30]
  wire [19:0] _GEN_5 = dataBRAMs_0_wr_en ? metaWriteData : 20'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 70:28 74:36 77:30]
  wire [3:0] _mwSel_T = 4'h1 << io_metaWrite_way; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire  mwSel = _mwSel_T[0]; // @[src/main/scala/memory/dcache/DCacheArray.scala 84:43]
  wire  waySel_1 = writeWayOneHot[1]; // @[src/main/scala/memory/dcache/DCacheArray.scala 66:32]
  wire  dataBRAMs_1_wr_en = io_write_valid & waySel_1; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  wire [7:0] _GEN_13 = dataBRAMs_1_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 69:28 74:36 76:30]
  wire [19:0] _GEN_14 = dataBRAMs_1_wr_en ? metaWriteData : 20'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 70:28 74:36 77:30]
  wire  mwSel_1 = _mwSel_T[1]; // @[src/main/scala/memory/dcache/DCacheArray.scala 84:43]
  wire  waySel_2 = writeWayOneHot[2]; // @[src/main/scala/memory/dcache/DCacheArray.scala 66:32]
  wire  dataBRAMs_2_wr_en = io_write_valid & waySel_2; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  wire [7:0] _GEN_22 = dataBRAMs_2_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 69:28 74:36 76:30]
  wire [19:0] _GEN_23 = dataBRAMs_2_wr_en ? metaWriteData : 20'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 70:28 74:36 77:30]
  wire  mwSel_2 = _mwSel_T[2]; // @[src/main/scala/memory/dcache/DCacheArray.scala 84:43]
  wire  waySel_3 = writeWayOneHot[3]; // @[src/main/scala/memory/dcache/DCacheArray.scala 66:32]
  wire  dataBRAMs_3_wr_en = io_write_valid & waySel_3; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  wire [7:0] _GEN_31 = dataBRAMs_3_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 69:28 74:36 76:30]
  wire [19:0] _GEN_32 = dataBRAMs_3_wr_en ? metaWriteData : 20'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 70:28 74:36 77:30]
  wire  mwSel_3 = _mwSel_T[3]; // @[src/main/scala/memory/dcache/DCacheArray.scala 84:43]
  SimpleBlockRAM_12 SimpleBlockRAM ( // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
    .clock(SimpleBlockRAM_clock),
    .reset(SimpleBlockRAM_reset),
    .io_wr_en(SimpleBlockRAM_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_io_wr_data),
    .io_rd_en(SimpleBlockRAM_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_io_rd_data)
  );
  SimpleBlockRAM_12 SimpleBlockRAM_1 ( // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
    .clock(SimpleBlockRAM_1_clock),
    .reset(SimpleBlockRAM_1_reset),
    .io_wr_en(SimpleBlockRAM_1_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_1_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_1_io_wr_data),
    .io_rd_en(SimpleBlockRAM_1_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_1_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_1_io_rd_data)
  );
  SimpleBlockRAM_12 SimpleBlockRAM_2 ( // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
    .clock(SimpleBlockRAM_2_clock),
    .reset(SimpleBlockRAM_2_reset),
    .io_wr_en(SimpleBlockRAM_2_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_2_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_2_io_wr_data),
    .io_rd_en(SimpleBlockRAM_2_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_2_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_2_io_rd_data)
  );
  SimpleBlockRAM_12 SimpleBlockRAM_3 ( // @[src/main/scala/memory/dcache/DCacheArray.scala 39:11]
    .clock(SimpleBlockRAM_3_clock),
    .reset(SimpleBlockRAM_3_reset),
    .io_wr_en(SimpleBlockRAM_3_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_3_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_3_io_wr_data),
    .io_rd_en(SimpleBlockRAM_3_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_3_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_3_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_4 ( // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
    .clock(SimpleBlockRAM_4_clock),
    .reset(SimpleBlockRAM_4_reset),
    .io_wr_en(SimpleBlockRAM_4_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_4_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_4_io_wr_data),
    .io_rd_en(SimpleBlockRAM_4_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_4_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_4_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_5 ( // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
    .clock(SimpleBlockRAM_5_clock),
    .reset(SimpleBlockRAM_5_reset),
    .io_wr_en(SimpleBlockRAM_5_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_5_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_5_io_wr_data),
    .io_rd_en(SimpleBlockRAM_5_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_5_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_5_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_6 ( // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
    .clock(SimpleBlockRAM_6_clock),
    .reset(SimpleBlockRAM_6_reset),
    .io_wr_en(SimpleBlockRAM_6_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_6_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_6_io_wr_data),
    .io_rd_en(SimpleBlockRAM_6_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_6_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_6_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_7 ( // @[src/main/scala/memory/dcache/DCacheArray.scala 42:11]
    .clock(SimpleBlockRAM_7_clock),
    .reset(SimpleBlockRAM_7_reset),
    .io_wr_en(SimpleBlockRAM_7_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_7_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_7_io_wr_data),
    .io_rd_en(SimpleBlockRAM_7_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_7_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_7_io_rd_data)
  );
  assign io_read_resp_ways_0_valid = metaBRAMs_0_rd_data[19]; // @[src/main/scala/memory/dcache/DCacheArray.scala 55:45]
  assign io_read_resp_ways_0_dirty = metaBRAMs_0_rd_data[18]; // @[src/main/scala/memory/dcache/DCacheArray.scala 56:45]
  assign io_read_resp_ways_0_tag = metaBRAMs_0_rd_data[17:0]; // @[src/main/scala/memory/dcache/DCacheArray.scala 57:45]
  assign io_read_resp_ways_0_data = SimpleBlockRAM_4_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:{26,26}]
  assign io_read_resp_ways_1_valid = metaBRAMs_1_rd_data[19]; // @[src/main/scala/memory/dcache/DCacheArray.scala 55:45]
  assign io_read_resp_ways_1_dirty = metaBRAMs_1_rd_data[18]; // @[src/main/scala/memory/dcache/DCacheArray.scala 56:45]
  assign io_read_resp_ways_1_tag = metaBRAMs_1_rd_data[17:0]; // @[src/main/scala/memory/dcache/DCacheArray.scala 57:45]
  assign io_read_resp_ways_1_data = SimpleBlockRAM_5_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:{26,26}]
  assign io_read_resp_ways_2_valid = metaBRAMs_2_rd_data[19]; // @[src/main/scala/memory/dcache/DCacheArray.scala 55:45]
  assign io_read_resp_ways_2_dirty = metaBRAMs_2_rd_data[18]; // @[src/main/scala/memory/dcache/DCacheArray.scala 56:45]
  assign io_read_resp_ways_2_tag = metaBRAMs_2_rd_data[17:0]; // @[src/main/scala/memory/dcache/DCacheArray.scala 57:45]
  assign io_read_resp_ways_2_data = SimpleBlockRAM_6_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:{26,26}]
  assign io_read_resp_ways_3_valid = metaBRAMs_3_rd_data[19]; // @[src/main/scala/memory/dcache/DCacheArray.scala 55:45]
  assign io_read_resp_ways_3_dirty = metaBRAMs_3_rd_data[18]; // @[src/main/scala/memory/dcache/DCacheArray.scala 56:45]
  assign io_read_resp_ways_3_tag = metaBRAMs_3_rd_data[17:0]; // @[src/main/scala/memory/dcache/DCacheArray.scala 57:45]
  assign io_read_resp_ways_3_data = SimpleBlockRAM_7_io_rd_data; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:{26,26}]
  assign SimpleBlockRAM_clock = clock;
  assign SimpleBlockRAM_reset = reset;
  assign SimpleBlockRAM_io_wr_en = io_metaWrite_valid & mwSel & ~dataBRAMs_0_wr_en | dataBRAMs_0_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 87:30]
  assign SimpleBlockRAM_io_wr_addr = io_metaWrite_valid & mwSel & ~dataBRAMs_0_wr_en ? io_metaWrite_idx : _GEN_4; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 88:30]
  assign SimpleBlockRAM_io_wr_data = io_metaWrite_valid & mwSel & ~dataBRAMs_0_wr_en ? 20'h0 : _GEN_5; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 89:30]
  assign SimpleBlockRAM_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 46:28]
  assign SimpleBlockRAM_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 47:28]
  assign SimpleBlockRAM_1_clock = clock;
  assign SimpleBlockRAM_1_reset = reset;
  assign SimpleBlockRAM_1_io_wr_en = io_metaWrite_valid & mwSel_1 & ~dataBRAMs_1_wr_en | dataBRAMs_1_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 87:30]
  assign SimpleBlockRAM_1_io_wr_addr = io_metaWrite_valid & mwSel_1 & ~dataBRAMs_1_wr_en ? io_metaWrite_idx : _GEN_13; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 88:30]
  assign SimpleBlockRAM_1_io_wr_data = io_metaWrite_valid & mwSel_1 & ~dataBRAMs_1_wr_en ? 20'h0 : _GEN_14; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 89:30]
  assign SimpleBlockRAM_1_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 46:28]
  assign SimpleBlockRAM_1_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 47:28]
  assign SimpleBlockRAM_2_clock = clock;
  assign SimpleBlockRAM_2_reset = reset;
  assign SimpleBlockRAM_2_io_wr_en = io_metaWrite_valid & mwSel_2 & ~dataBRAMs_2_wr_en | dataBRAMs_2_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 87:30]
  assign SimpleBlockRAM_2_io_wr_addr = io_metaWrite_valid & mwSel_2 & ~dataBRAMs_2_wr_en ? io_metaWrite_idx : _GEN_22; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 88:30]
  assign SimpleBlockRAM_2_io_wr_data = io_metaWrite_valid & mwSel_2 & ~dataBRAMs_2_wr_en ? 20'h0 : _GEN_23; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 89:30]
  assign SimpleBlockRAM_2_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 46:28]
  assign SimpleBlockRAM_2_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 47:28]
  assign SimpleBlockRAM_3_clock = clock;
  assign SimpleBlockRAM_3_reset = reset;
  assign SimpleBlockRAM_3_io_wr_en = io_metaWrite_valid & mwSel_3 & ~dataBRAMs_3_wr_en | dataBRAMs_3_wr_en; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 87:30]
  assign SimpleBlockRAM_3_io_wr_addr = io_metaWrite_valid & mwSel_3 & ~dataBRAMs_3_wr_en ? io_metaWrite_idx : _GEN_31; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 88:30]
  assign SimpleBlockRAM_3_io_wr_data = io_metaWrite_valid & mwSel_3 & ~dataBRAMs_3_wr_en ? 20'h0 : _GEN_32; // @[src/main/scala/memory/dcache/DCacheArray.scala 85:70 89:30]
  assign SimpleBlockRAM_3_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 46:28]
  assign SimpleBlockRAM_3_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 38:26 47:28]
  assign SimpleBlockRAM_4_clock = clock;
  assign SimpleBlockRAM_4_reset = reset;
  assign SimpleBlockRAM_4_io_wr_en = io_write_valid & waySel; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  assign SimpleBlockRAM_4_io_wr_addr = dataBRAMs_0_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 72:28 74:36]
  assign SimpleBlockRAM_4_io_wr_data = dataBRAMs_0_wr_en ? io_write_data : 512'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 73:28 74:36]
  assign SimpleBlockRAM_4_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 48:28]
  assign SimpleBlockRAM_4_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 49:28]
  assign SimpleBlockRAM_5_clock = clock;
  assign SimpleBlockRAM_5_reset = reset;
  assign SimpleBlockRAM_5_io_wr_en = io_write_valid & waySel_1; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  assign SimpleBlockRAM_5_io_wr_addr = dataBRAMs_1_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 72:28 74:36]
  assign SimpleBlockRAM_5_io_wr_data = dataBRAMs_1_wr_en ? io_write_data : 512'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 73:28 74:36]
  assign SimpleBlockRAM_5_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 48:28]
  assign SimpleBlockRAM_5_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 49:28]
  assign SimpleBlockRAM_6_clock = clock;
  assign SimpleBlockRAM_6_reset = reset;
  assign SimpleBlockRAM_6_io_wr_en = io_write_valid & waySel_2; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  assign SimpleBlockRAM_6_io_wr_addr = dataBRAMs_2_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 72:28 74:36]
  assign SimpleBlockRAM_6_io_wr_data = dataBRAMs_2_wr_en ? io_write_data : 512'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 73:28 74:36]
  assign SimpleBlockRAM_6_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 48:28]
  assign SimpleBlockRAM_6_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 49:28]
  assign SimpleBlockRAM_7_clock = clock;
  assign SimpleBlockRAM_7_reset = reset;
  assign SimpleBlockRAM_7_io_wr_en = io_write_valid & waySel_3; // @[src/main/scala/memory/dcache/DCacheArray.scala 74:25]
  assign SimpleBlockRAM_7_io_wr_addr = dataBRAMs_3_wr_en ? io_write_idx : 8'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 72:28 74:36]
  assign SimpleBlockRAM_7_io_wr_data = dataBRAMs_3_wr_en ? io_write_data : 512'h0; // @[src/main/scala/memory/dcache/DCacheArray.scala 73:28 74:36]
  assign SimpleBlockRAM_7_io_rd_en = io_read_valid; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 48:28]
  assign SimpleBlockRAM_7_io_rd_addr = io_read_idx; // @[src/main/scala/memory/dcache/DCacheArray.scala 41:26 49:28]
endmodule
