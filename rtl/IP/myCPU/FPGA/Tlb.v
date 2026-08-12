module Tlb(
  input         clock,
  input         reset,
  output        io_search_0_req_ready, // @[src/main/scala/mmu/Tlb.scala 9:14]
  input         io_search_0_req_valid, // @[src/main/scala/mmu/Tlb.scala 9:14]
  input  [21:0] io_search_0_req_bits_offset, // @[src/main/scala/mmu/Tlb.scala 9:14]
  input         io_search_0_resp_ready, // @[src/main/scala/mmu/Tlb.scala 9:14]
  output        io_search_0_resp_valid, // @[src/main/scala/mmu/Tlb.scala 9:14]
  output [21:0] io_search_0_resp_bits_offset, // @[src/main/scala/mmu/Tlb.scala 9:14]
  output [5:0]  io_search_0_resp_bits_ps, // @[src/main/scala/mmu/Tlb.scala 9:14]
  output        io_search_1_req_ready, // @[src/main/scala/mmu/Tlb.scala 9:14]
  input         io_search_1_req_valid, // @[src/main/scala/mmu/Tlb.scala 9:14]
  input  [21:0] io_search_1_req_bits_offset, // @[src/main/scala/mmu/Tlb.scala 9:14]
  input         io_search_1_resp_ready, // @[src/main/scala/mmu/Tlb.scala 9:14]
  output        io_search_1_resp_valid, // @[src/main/scala/mmu/Tlb.scala 9:14]
  output [21:0] io_search_1_resp_bits_offset, // @[src/main/scala/mmu/Tlb.scala 9:14]
  output [5:0]  io_search_1_resp_bits_ps // @[src/main/scala/mmu/Tlb.scala 9:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  s1Valid_1; // @[src/main/scala/mmu/Tlb.scala 40:26]
  reg  s2Valid_1; // @[src/main/scala/mmu/Tlb.scala 45:26]
  reg  s1Valid; // @[src/main/scala/mmu/Tlb.scala 40:26]
  reg  s2Valid; // @[src/main/scala/mmu/Tlb.scala 45:26]
  reg [21:0] s1Req_offset; // @[src/main/scala/mmu/Tlb.scala 41:26]
  reg [21:0] s2Resp_offset; // @[src/main/scala/mmu/Tlb.scala 46:26]
  reg [5:0] s2Resp_ps; // @[src/main/scala/mmu/Tlb.scala 46:26]
  wire  s2Ready = ~s2Valid | io_search_0_resp_ready; // @[src/main/scala/mmu/Tlb.scala 48:28]
  wire  s1Ready = ~s1Valid | s2Ready; // @[src/main/scala/mmu/Tlb.scala 49:28]
  wire  _s1Valid_T = io_search_0_req_ready & io_search_0_req_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  reg [21:0] s1Req_1_offset; // @[src/main/scala/mmu/Tlb.scala 41:26]
  reg [21:0] s2Resp_1_offset; // @[src/main/scala/mmu/Tlb.scala 46:26]
  reg [5:0] s2Resp_1_ps; // @[src/main/scala/mmu/Tlb.scala 46:26]
  wire  s2Ready_1 = ~s2Valid_1 | io_search_1_resp_ready; // @[src/main/scala/mmu/Tlb.scala 48:28]
  wire  s1Ready_1 = ~s1Valid_1 | s2Ready_1; // @[src/main/scala/mmu/Tlb.scala 49:28]
  wire  _s1Valid_T_1 = io_search_1_req_ready & io_search_1_req_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  assign io_search_0_req_ready = ~s1Valid | s2Ready; // @[src/main/scala/mmu/Tlb.scala 49:28]
  assign io_search_0_resp_valid = s2Valid; // @[src/main/scala/mmu/Tlb.scala 100:16]
  assign io_search_0_resp_bits_offset = s2Resp_offset; // @[src/main/scala/mmu/Tlb.scala 101:16]
  assign io_search_0_resp_bits_ps = s2Resp_ps; // @[src/main/scala/mmu/Tlb.scala 101:16]
  assign io_search_1_req_ready = ~s1Valid_1 | s2Ready_1; // @[src/main/scala/mmu/Tlb.scala 49:28]
  assign io_search_1_resp_valid = s2Valid_1; // @[src/main/scala/mmu/Tlb.scala 100:16]
  assign io_search_1_resp_bits_offset = s2Resp_1_offset; // @[src/main/scala/mmu/Tlb.scala 101:16]
  assign io_search_1_resp_bits_ps = s2Resp_1_ps; // @[src/main/scala/mmu/Tlb.scala 101:16]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 40:26]
      s1Valid_1 <= 1'h0; // @[src/main/scala/mmu/Tlb.scala 40:26]
    end else if (s1Ready_1) begin // @[src/main/scala/mmu/Tlb.scala 70:22]
      s1Valid_1 <= _s1Valid_T_1; // @[src/main/scala/mmu/Tlb.scala 71:17]
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 45:26]
      s2Valid_1 <= 1'h0; // @[src/main/scala/mmu/Tlb.scala 45:26]
    end else if (s2Ready_1) begin // @[src/main/scala/mmu/Tlb.scala 80:22]
      s2Valid_1 <= s1Valid_1; // @[src/main/scala/mmu/Tlb.scala 81:17]
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 40:26]
      s1Valid <= 1'h0; // @[src/main/scala/mmu/Tlb.scala 40:26]
    end else if (s1Ready) begin // @[src/main/scala/mmu/Tlb.scala 70:22]
      s1Valid <= _s1Valid_T; // @[src/main/scala/mmu/Tlb.scala 71:17]
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 45:26]
      s2Valid <= 1'h0; // @[src/main/scala/mmu/Tlb.scala 45:26]
    end else if (s2Ready) begin // @[src/main/scala/mmu/Tlb.scala 80:22]
      s2Valid <= s1Valid; // @[src/main/scala/mmu/Tlb.scala 81:17]
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 41:26]
      s1Req_offset <= 22'h0; // @[src/main/scala/mmu/Tlb.scala 41:26]
    end else if (s1Ready) begin // @[src/main/scala/mmu/Tlb.scala 70:22]
      if (_s1Valid_T) begin // @[src/main/scala/mmu/Tlb.scala 72:25]
        s1Req_offset <= io_search_0_req_bits_offset; // @[src/main/scala/mmu/Tlb.scala 73:19]
      end
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 46:26]
      s2Resp_offset <= 22'h0; // @[src/main/scala/mmu/Tlb.scala 46:26]
    end else if (s2Ready) begin // @[src/main/scala/mmu/Tlb.scala 80:22]
      if (s1Valid) begin // @[src/main/scala/mmu/Tlb.scala 82:24]
        s2Resp_offset <= s1Req_offset; // @[src/main/scala/mmu/Tlb.scala 87:25]
      end
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 46:26]
      s2Resp_ps <= 6'h0; // @[src/main/scala/mmu/Tlb.scala 46:26]
    end else if (s2Ready) begin // @[src/main/scala/mmu/Tlb.scala 80:22]
      if (s1Valid) begin // @[src/main/scala/mmu/Tlb.scala 82:24]
        s2Resp_ps <= 6'hc; // @[src/main/scala/mmu/Tlb.scala 90:25]
      end
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 41:26]
      s1Req_1_offset <= 22'h0; // @[src/main/scala/mmu/Tlb.scala 41:26]
    end else if (s1Ready_1) begin // @[src/main/scala/mmu/Tlb.scala 70:22]
      if (_s1Valid_T_1) begin // @[src/main/scala/mmu/Tlb.scala 72:25]
        s1Req_1_offset <= io_search_1_req_bits_offset; // @[src/main/scala/mmu/Tlb.scala 73:19]
      end
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 46:26]
      s2Resp_1_offset <= 22'h0; // @[src/main/scala/mmu/Tlb.scala 46:26]
    end else if (s2Ready_1) begin // @[src/main/scala/mmu/Tlb.scala 80:22]
      if (s1Valid_1) begin // @[src/main/scala/mmu/Tlb.scala 82:24]
        s2Resp_1_offset <= s1Req_1_offset; // @[src/main/scala/mmu/Tlb.scala 87:25]
      end
    end
    if (reset) begin // @[src/main/scala/mmu/Tlb.scala 46:26]
      s2Resp_1_ps <= 6'h0; // @[src/main/scala/mmu/Tlb.scala 46:26]
    end else if (s2Ready_1) begin // @[src/main/scala/mmu/Tlb.scala 80:22]
      if (s1Valid_1) begin // @[src/main/scala/mmu/Tlb.scala 82:24]
        s2Resp_1_ps <= 6'hc; // @[src/main/scala/mmu/Tlb.scala 90:25]
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
  s1Valid_1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s2Valid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1Valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s2Valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1Req_offset = _RAND_4[21:0];
  _RAND_5 = {1{`RANDOM}};
  s2Resp_offset = _RAND_5[21:0];
  _RAND_6 = {1{`RANDOM}};
  s2Resp_ps = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  s1Req_1_offset = _RAND_7[21:0];
  _RAND_8 = {1{`RANDOM}};
  s2Resp_1_offset = _RAND_8[21:0];
  _RAND_9 = {1{`RANDOM}};
  s2Resp_1_ps = _RAND_9[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
