module ICacheArray(
  input          clock,
  input          reset,
  input          io_read_req_valid, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  input  [7:0]   io_read_req_idx, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output         io_read_resp_valid, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output         io_read_resp_data_cacheLine_0_has, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [17:0]  io_read_resp_data_cacheLine_0_tag, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [511:0] io_read_resp_data_cacheLine_0_data, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output         io_read_resp_data_cacheLine_1_has, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [17:0]  io_read_resp_data_cacheLine_1_tag, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [511:0] io_read_resp_data_cacheLine_1_data, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output         io_read_resp_data_cacheLine_2_has, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [17:0]  io_read_resp_data_cacheLine_2_tag, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [511:0] io_read_resp_data_cacheLine_2_data, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output         io_read_resp_data_cacheLine_3_has, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [17:0]  io_read_resp_data_cacheLine_3_tag, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  output [511:0] io_read_resp_data_cacheLine_3_data, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  input          io_write_valid, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  input  [7:0]   io_write_idx, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  input  [1:0]   io_write_way, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  input  [17:0]  io_write_tag, // @[src/main/scala/icache/ICacheArray.scala 31:14]
  input  [511:0] io_write_data // @[src/main/scala/icache/ICacheArray.scala 31:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  SimpleBlockRAM_clock; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_reset; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_1_clock; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_1_reset; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_1_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_1_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_1_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_1_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_1_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_1_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_2_clock; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_2_reset; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_2_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_2_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_2_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_2_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_2_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_2_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_3_clock; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_3_reset; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_3_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_3_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_3_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_3_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [7:0] SimpleBlockRAM_3_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire [18:0] SimpleBlockRAM_3_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 48:11]
  wire  SimpleBlockRAM_4_clock; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_4_reset; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_4_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_4_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_4_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_4_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_4_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_4_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_5_clock; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_5_reset; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_5_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_5_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_5_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_5_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_5_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_5_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_6_clock; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_6_reset; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_6_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_6_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_6_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_6_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_6_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_6_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_7_clock; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_7_reset; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_7_io_wr_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_7_io_wr_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_7_io_wr_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire  SimpleBlockRAM_7_io_rd_en; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [7:0] SimpleBlockRAM_7_io_rd_addr; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [511:0] SimpleBlockRAM_7_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 56:11]
  wire [18:0] metaBRAMs_0_rd_data = SimpleBlockRAM_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 47:{26,26}]
  wire [18:0] metaBRAMs_1_rd_data = SimpleBlockRAM_1_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 47:{26,26}]
  wire [18:0] metaBRAMs_2_rd_data = SimpleBlockRAM_2_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 47:{26,26}]
  wire [18:0] metaBRAMs_3_rd_data = SimpleBlockRAM_3_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 47:{26,26}]
  reg  anyRdValid; // @[src/main/scala/icache/ICacheArray.scala 90:28]
  wire [3:0] writeWayOneHot = 4'h1 << io_write_way; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire  waySel = writeWayOneHot[0]; // @[src/main/scala/icache/ICacheArray.scala 101:32]
  wire  waySel_1 = writeWayOneHot[1]; // @[src/main/scala/icache/ICacheArray.scala 101:32]
  wire  waySel_2 = writeWayOneHot[2]; // @[src/main/scala/icache/ICacheArray.scala 101:32]
  wire  waySel_3 = writeWayOneHot[3]; // @[src/main/scala/icache/ICacheArray.scala 101:32]
  SimpleBlockRAM_4 SimpleBlockRAM ( // @[src/main/scala/icache/ICacheArray.scala 48:11]
    .clock(SimpleBlockRAM_clock),
    .reset(SimpleBlockRAM_reset),
    .io_wr_en(SimpleBlockRAM_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_io_wr_data),
    .io_rd_en(SimpleBlockRAM_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_io_rd_data)
  );
  SimpleBlockRAM_4 SimpleBlockRAM_1 ( // @[src/main/scala/icache/ICacheArray.scala 48:11]
    .clock(SimpleBlockRAM_1_clock),
    .reset(SimpleBlockRAM_1_reset),
    .io_wr_en(SimpleBlockRAM_1_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_1_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_1_io_wr_data),
    .io_rd_en(SimpleBlockRAM_1_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_1_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_1_io_rd_data)
  );
  SimpleBlockRAM_4 SimpleBlockRAM_2 ( // @[src/main/scala/icache/ICacheArray.scala 48:11]
    .clock(SimpleBlockRAM_2_clock),
    .reset(SimpleBlockRAM_2_reset),
    .io_wr_en(SimpleBlockRAM_2_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_2_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_2_io_wr_data),
    .io_rd_en(SimpleBlockRAM_2_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_2_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_2_io_rd_data)
  );
  SimpleBlockRAM_4 SimpleBlockRAM_3 ( // @[src/main/scala/icache/ICacheArray.scala 48:11]
    .clock(SimpleBlockRAM_3_clock),
    .reset(SimpleBlockRAM_3_reset),
    .io_wr_en(SimpleBlockRAM_3_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_3_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_3_io_wr_data),
    .io_rd_en(SimpleBlockRAM_3_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_3_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_3_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_4 ( // @[src/main/scala/icache/ICacheArray.scala 56:11]
    .clock(SimpleBlockRAM_4_clock),
    .reset(SimpleBlockRAM_4_reset),
    .io_wr_en(SimpleBlockRAM_4_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_4_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_4_io_wr_data),
    .io_rd_en(SimpleBlockRAM_4_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_4_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_4_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_5 ( // @[src/main/scala/icache/ICacheArray.scala 56:11]
    .clock(SimpleBlockRAM_5_clock),
    .reset(SimpleBlockRAM_5_reset),
    .io_wr_en(SimpleBlockRAM_5_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_5_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_5_io_wr_data),
    .io_rd_en(SimpleBlockRAM_5_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_5_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_5_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_6 ( // @[src/main/scala/icache/ICacheArray.scala 56:11]
    .clock(SimpleBlockRAM_6_clock),
    .reset(SimpleBlockRAM_6_reset),
    .io_wr_en(SimpleBlockRAM_6_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_6_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_6_io_wr_data),
    .io_rd_en(SimpleBlockRAM_6_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_6_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_6_io_rd_data)
  );
  SimpleBlockRAM_8 SimpleBlockRAM_7 ( // @[src/main/scala/icache/ICacheArray.scala 56:11]
    .clock(SimpleBlockRAM_7_clock),
    .reset(SimpleBlockRAM_7_reset),
    .io_wr_en(SimpleBlockRAM_7_io_wr_en),
    .io_wr_addr(SimpleBlockRAM_7_io_wr_addr),
    .io_wr_data(SimpleBlockRAM_7_io_wr_data),
    .io_rd_en(SimpleBlockRAM_7_io_rd_en),
    .io_rd_addr(SimpleBlockRAM_7_io_rd_addr),
    .io_rd_data(SimpleBlockRAM_7_io_rd_data)
  );
  assign io_read_resp_valid = anyRdValid; // @[src/main/scala/icache/ICacheArray.scala 92:22]
  assign io_read_resp_data_cacheLine_0_has = metaBRAMs_0_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 83:49]
  assign io_read_resp_data_cacheLine_0_tag = metaBRAMs_0_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 84:49]
  assign io_read_resp_data_cacheLine_0_data = SimpleBlockRAM_4_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 55:{26,26}]
  assign io_read_resp_data_cacheLine_1_has = metaBRAMs_1_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 83:49]
  assign io_read_resp_data_cacheLine_1_tag = metaBRAMs_1_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 84:49]
  assign io_read_resp_data_cacheLine_1_data = SimpleBlockRAM_5_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 55:{26,26}]
  assign io_read_resp_data_cacheLine_2_has = metaBRAMs_2_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 83:49]
  assign io_read_resp_data_cacheLine_2_tag = metaBRAMs_2_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 84:49]
  assign io_read_resp_data_cacheLine_2_data = SimpleBlockRAM_6_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 55:{26,26}]
  assign io_read_resp_data_cacheLine_3_has = metaBRAMs_3_rd_data[18]; // @[src/main/scala/icache/ICacheArray.scala 83:49]
  assign io_read_resp_data_cacheLine_3_tag = metaBRAMs_3_rd_data[17:0]; // @[src/main/scala/icache/ICacheArray.scala 84:49]
  assign io_read_resp_data_cacheLine_3_data = SimpleBlockRAM_7_io_rd_data; // @[src/main/scala/icache/ICacheArray.scala 55:{26,26}]
  assign SimpleBlockRAM_clock = clock;
  assign SimpleBlockRAM_reset = reset;
  assign SimpleBlockRAM_io_wr_en = io_write_valid & waySel; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 105:28]
  assign SimpleBlockRAM_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 47:26 66:28]
  assign SimpleBlockRAM_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 47:26 67:28]
  assign SimpleBlockRAM_1_clock = clock;
  assign SimpleBlockRAM_1_reset = reset;
  assign SimpleBlockRAM_1_io_wr_en = io_write_valid & waySel_1; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_1_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_1_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 105:28]
  assign SimpleBlockRAM_1_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 47:26 66:28]
  assign SimpleBlockRAM_1_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 47:26 67:28]
  assign SimpleBlockRAM_2_clock = clock;
  assign SimpleBlockRAM_2_reset = reset;
  assign SimpleBlockRAM_2_io_wr_en = io_write_valid & waySel_2; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_2_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_2_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 105:28]
  assign SimpleBlockRAM_2_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 47:26 66:28]
  assign SimpleBlockRAM_2_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 47:26 67:28]
  assign SimpleBlockRAM_3_clock = clock;
  assign SimpleBlockRAM_3_reset = reset;
  assign SimpleBlockRAM_3_io_wr_en = io_write_valid & waySel_3; // @[src/main/scala/icache/ICacheArray.scala 107:46]
  assign SimpleBlockRAM_3_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_3_io_wr_data = {1'h1,io_write_tag}; // @[src/main/scala/icache/ICacheArray.scala 105:28]
  assign SimpleBlockRAM_3_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 47:26 66:28]
  assign SimpleBlockRAM_3_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 47:26 67:28]
  assign SimpleBlockRAM_4_clock = clock;
  assign SimpleBlockRAM_4_reset = reset;
  assign SimpleBlockRAM_4_io_wr_en = io_write_valid & waySel; // @[src/main/scala/icache/ICacheArray.scala 112:46]
  assign SimpleBlockRAM_4_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_4_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 128:25 114:28 136:30]
  assign SimpleBlockRAM_4_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 55:26 68:28]
  assign SimpleBlockRAM_4_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 55:26 69:28]
  assign SimpleBlockRAM_5_clock = clock;
  assign SimpleBlockRAM_5_reset = reset;
  assign SimpleBlockRAM_5_io_wr_en = io_write_valid & waySel_1; // @[src/main/scala/icache/ICacheArray.scala 112:46]
  assign SimpleBlockRAM_5_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_5_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 128:25 114:28 136:30]
  assign SimpleBlockRAM_5_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 55:26 68:28]
  assign SimpleBlockRAM_5_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 55:26 69:28]
  assign SimpleBlockRAM_6_clock = clock;
  assign SimpleBlockRAM_6_reset = reset;
  assign SimpleBlockRAM_6_io_wr_en = io_write_valid & waySel_2; // @[src/main/scala/icache/ICacheArray.scala 112:46]
  assign SimpleBlockRAM_6_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_6_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 128:25 114:28 136:30]
  assign SimpleBlockRAM_6_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 55:26 68:28]
  assign SimpleBlockRAM_6_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 55:26 69:28]
  assign SimpleBlockRAM_7_clock = clock;
  assign SimpleBlockRAM_7_reset = reset;
  assign SimpleBlockRAM_7_io_wr_en = io_write_valid & waySel_3; // @[src/main/scala/icache/ICacheArray.scala 112:46]
  assign SimpleBlockRAM_7_io_wr_addr = io_write_idx; // @[src/main/scala/icache/ICacheArray.scala 128:25 108:28 130:30]
  assign SimpleBlockRAM_7_io_wr_data = io_write_data; // @[src/main/scala/icache/ICacheArray.scala 128:25 114:28 136:30]
  assign SimpleBlockRAM_7_io_rd_en = io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 55:26 68:28]
  assign SimpleBlockRAM_7_io_rd_addr = io_read_req_idx; // @[src/main/scala/icache/ICacheArray.scala 55:26 69:28]
  always @(posedge clock) begin
    anyRdValid <= io_read_req_valid; // @[src/main/scala/icache/ICacheArray.scala 90:28]
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
  anyRdValid = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
