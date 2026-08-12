module ICacheMainPipe(
  input          clock,
  input          reset,
  input          io_redirect, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_cpu_req_ready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_cpu_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [31:0]  io_cpu_req_bits_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_icache_resp_ready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_0, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_1, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_2, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_instrs_3, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_0, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_1, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_2, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_instvalids_3, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_icache_resp_bits_addr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_uncached, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpTlbRefill, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpTlbPif, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpTlbPpi, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpAdef, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_icache_resp_bits_mmu_error_excpAle, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [3:0]   io_axi_ar_data_arid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_axi_ar_data_araddr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_axi_ar_data_arlen, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [2:0]   io_axi_ar_data_arsize, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_axi_ar_data_arvalid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_axi_ar_arready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [3:0]   io_axi_r_data_rid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [31:0]  io_axi_r_data_rdata, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_axi_r_data_rlast, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_axi_r_data_rvalid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_axi_r_rready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_arrays_read_req_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_arrays_read_req_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_0_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_0_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_0_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_1_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_1_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_1_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_2_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_2_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_2_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_arrays_read_resp_data_cacheLine_3_has, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [17:0]  io_arrays_read_resp_data_cacheLine_3_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [511:0] io_arrays_read_resp_data_cacheLine_3_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_array_write_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_array_write_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [1:0]   io_array_write_way, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [17:0]  io_array_write_tag, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [511:0] io_array_write_data, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_victim_read_req, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_victim_read_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [1:0]   io_victim_read_resp, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_replacer_touch_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [7:0]   io_replacer_touch_idx, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [1:0]   io_replacer_touch_way, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_toMmu_ready, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output         io_mmu_toMmu_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  output [31:0]  io_mmu_toMmu_bits_vaddr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_valid, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input  [31:0]  io_mmu_fromMmu_bits_paddr, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_cacheable, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpTlbRefill, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpTlbPif, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpTlbPpi, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpAdef, // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
  input          io_mmu_fromMmu_bits_error_excpAle // @[src/main/scala/icache/ICacheMainPipe.scala 12:14]
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
  reg [511:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [511:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [511:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [511:0] _RAND_23;
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
  reg [511:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [511:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [511:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [511:0] _RAND_52;
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
  reg [511:0] _RAND_63;
  reg [511:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [511:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
`endif // RANDOMIZE_REG_INIT
  reg  s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 56:25]
  reg  s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 98:25]
  reg  s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 150:25]
  reg [3:0] state; // @[src/main/scala/icache/ICacheMainPipe.scala 245:22]
  reg  s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 177:25]
  reg  s3_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 182:33]
  wire  _s3_ready_T_8 = state == 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 547:116]
  wire  _s3_ready_T_9 = state == 4'h7 & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 547:127]
  wire  s3_ready = state == 4'h0 & s3_valid & s3_hit & io_icache_resp_ready | state == 4'h0 & ~s3_valid | state == 4'h7
     & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 547:106]
  wire  s2_fire = s2_valid & s3_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 162:28]
  wire  s2_ready = s2_fire | ~s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 164:23]
  reg  s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 129:34]
  reg  s1_mmu_received; // @[src/main/scala/icache/ICacheMainPipe.scala 128:32]
  wire  _s1_cango_T_1 = s1_mmu_received | io_mmu_fromMmu_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 131:32]
  wire  s1_cango = (s1_array_received | io_arrays_read_resp_valid) & _s1_cango_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 130:54]
  wire  s1_fire = s1_valid & s2_ready & s1_cango; // @[src/main/scala/icache/ICacheMainPipe.scala 107:41]
  wire  s1_ready = s1_fire | ~s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 108:23]
  wire  s0_fire = s0_valid & s1_ready & io_mmu_toMmu_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 59:43]
  wire  s0_ready = s0_fire | ~s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 60:26]
  wire [7:0] curr_vidx = io_cpu_req_bits_addr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 63:39]
  reg [31:0] s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 68:25]
  reg [7:0] s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 69:25]
  wire  io_fire = s0_ready & io_cpu_req_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 72:26]
  wire  _T = ~io_redirect; // @[src/main/scala/icache/ICacheMainPipe.scala 77:25]
  wire  _io_arrays_read_req_valid_T_1 = s0_fire & _T; // @[src/main/scala/icache/ICacheMainPipe.scala 89:40]
  reg [31:0] s1_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 99:25]
  reg [7:0] s1_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 100:25]
  wire  _GEN_9 = s1_fire ? 1'h0 : s1_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 118:22 119:15 98:25]
  wire  _GEN_10 = _io_arrays_read_req_valid_T_1 | _GEN_9; // @[src/main/scala/icache/ICacheMainPipe.scala 113:35 114:14]
  reg  s1_array_received_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [17:0] s1_array_received_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [511:0] s1_array_received_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg  s1_array_received_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [17:0] s1_array_received_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [511:0] s1_array_received_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg  s1_array_received_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [17:0] s1_array_received_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [511:0] s1_array_received_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg  s1_array_received_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [17:0] s1_array_received_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [511:0] s1_array_received_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
  reg [31:0] s1_mmu_received_data_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
  reg  s1_mmu_received_data_cacheable; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
  reg  s1_mmu_received_data_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
  reg  s1_mmu_received_data_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
  reg  s1_mmu_received_data_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
  reg  s1_mmu_received_data_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
  reg  s1_mmu_received_data_error_excpAle; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
  wire  _T_4 = s1_fire | io_redirect; // @[src/main/scala/icache/ICacheMainPipe.scala 136:16]
  wire  _GEN_18 = io_arrays_read_resp_valid | s1_array_received; // @[src/main/scala/icache/ICacheMainPipe.scala 138:31 139:23 129:34]
  wire  _GEN_44 = io_mmu_fromMmu_valid | s1_mmu_received; // @[src/main/scala/icache/ICacheMainPipe.scala 145:29 146:21 128:32]
  reg [31:0] s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 151:29]
  reg [31:0] s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 152:29]
  reg  s2_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 153:29]
  reg  s2_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
  reg  s2_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
  reg  s2_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
  reg  s2_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
  reg  s2_mmu_error_excpAle; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
  reg [7:0] s2_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 155:29]
  reg [17:0] s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 158:29]
  reg  s2_array_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [17:0] s2_array_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [511:0] s2_array_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg  s2_array_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [17:0] s2_array_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [511:0] s2_array_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg  s2_array_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [17:0] s2_array_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [511:0] s2_array_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg  s2_array_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [17:0] s2_array_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  reg [511:0] s2_array_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
  wire  _s2_is_uncached_access_T_3 = s2_mmu_error_excpTlbRefill | s2_mmu_error_excpTlbPif | s2_mmu_error_excpTlbPpi |
    s2_mmu_error_excpAdef | s2_mmu_error_excpAle; // @[src/main/scala/mmu/Bundles.scala 105:81]
  wire  s2_is_uncached_access = _s2_is_uncached_access_T_3 | s2_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 163:56]
  wire [17:0] s1_ptag = s1_mmu_received ? s1_mmu_received_data_paddr[31:14] : io_mmu_fromMmu_bits_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 167:20]
  reg  miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 176:32]
  reg [31:0] s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 178:33]
  reg [31:0] s3_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 179:33]
  reg  s3_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 180:33]
  reg  s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
  reg  s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
  reg  s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
  reg  s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
  reg  s3_mmu_error_excpAle; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
  reg  s3_miss; // @[src/main/scala/icache/ICacheMainPipe.scala 183:33]
  reg [511:0] miss_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 185:33]
  wire [17:0] s3_ptag = s3_paddr[31:14]; // @[src/main/scala/icache/ICacheMainPipe.scala 281:22]
  wire [7:0] s3_pidx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 282:22]
  wire  _s1_can_bypass_T_6 = ~s3_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 187:112]
  wire  _s1_can_bypass_T_11 = s3_mmu_error_excpTlbRefill | s3_mmu_error_excpTlbPif | s3_mmu_error_excpTlbPpi |
    s3_mmu_error_excpAdef | s3_mmu_error_excpAle; // @[src/main/scala/mmu/Bundles.scala 105:81]
  wire  _s1_can_bypass_T_12 = ~_s1_can_bypass_T_11; // @[src/main/scala/icache/ICacheMainPipe.scala 187:128]
  wire  s1_can_bypass = s1_ptag == s3_ptag & s1_vidx == s3_pidx & miss_data_valid & s3_valid & s3_miss & ~s3_uncached &
    ~_s1_can_bypass_T_11; // @[src/main/scala/icache/ICacheMainPipe.scala 187:125]
  reg [511:0] s2_bypass_data_from_s1; // @[src/main/scala/icache/ICacheMainPipe.scala 190:39]
  reg  s2_can_bypass_from_s1; // @[src/main/scala/icache/ICacheMainPipe.scala 191:39]
  wire  _s2_uncached_T_2 = s1_mmu_received ? ~s1_mmu_received_data_cacheable : ~io_mmu_fromMmu_bits_cacheable; // @[src/main/scala/icache/ICacheMainPipe.scala 209:23]
  wire  _GEN_62 = s2_fire ? 1'h0 : s2_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 216:23 217:14 150:25]
  wire  _GEN_63 = s1_fire & _T | _GEN_62; // @[src/main/scala/icache/ICacheMainPipe.scala 198:36 199:14]
  wire  _tag_hits_0_T = s2_array_data_cacheLine_0_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 224:54]
  wire  tag_hits_0 = s2_array_data_cacheLine_0_has & _tag_hits_0_T; // @[src/main/scala/icache/ICacheMainPipe.scala 223:51]
  wire  _tag_hits_1_T = s2_array_data_cacheLine_1_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 224:54]
  wire  tag_hits_1 = s2_array_data_cacheLine_1_has & _tag_hits_1_T; // @[src/main/scala/icache/ICacheMainPipe.scala 223:51]
  wire  _tag_hits_2_T = s2_array_data_cacheLine_2_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 224:54]
  wire  tag_hits_2 = s2_array_data_cacheLine_2_has & _tag_hits_2_T; // @[src/main/scala/icache/ICacheMainPipe.scala 223:51]
  wire  _tag_hits_3_T = s2_array_data_cacheLine_3_tag == s2_ptag; // @[src/main/scala/icache/ICacheMainPipe.scala 224:54]
  wire  tag_hits_3 = s2_array_data_cacheLine_3_has & _tag_hits_3_T; // @[src/main/scala/icache/ICacheMainPipe.scala 223:51]
  wire [3:0] _s2_hit_T = {tag_hits_3,tag_hits_2,tag_hits_1,tag_hits_0}; // @[src/main/scala/icache/ICacheMainPipe.scala 227:37]
  wire  s2_hit = s2_valid & |_s2_hit_T; // @[src/main/scala/icache/ICacheMainPipe.scala 227:25]
  wire [1:0] s2_hit_way_hi_1 = _s2_hit_T[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] s2_hit_way_lo_1 = _s2_hit_T[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _s2_hit_way_T_2 = s2_hit_way_hi_1 | s2_hit_way_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] s2_hit_way = {|s2_hit_way_hi_1,_s2_hit_way_T_2[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire  s2_cache_miss = s2_valid & ~s2_is_uncached_access & ~s2_hit; // @[src/main/scala/icache/ICacheMainPipe.scala 230:58]
  reg [511:0] s3_cacheLine_data; // @[src/main/scala/icache/ICacheMainPipe.scala 235:34]
  wire  s3_fire = (s3_valid & s3_hit | _s3_ready_T_8) & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 249:59]
  wire  s2_can_bypass = s2_ptag == s3_ptag & s2_vidx == s3_pidx & miss_data_valid & s3_valid & s3_miss &
    _s1_can_bypass_T_6 & ~s2_uncached & _s1_can_bypass_T_12; // @[src/main/scala/icache/ICacheMainPipe.scala 252:141]
  wire [511:0] _GEN_118 = 2'h1 == s2_hit_way ? s2_array_data_cacheLine_1_data : s2_array_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 274:{10,10}]
  wire [511:0] _GEN_119 = 2'h2 == s2_hit_way ? s2_array_data_cacheLine_2_data : _GEN_118; // @[src/main/scala/icache/ICacheMainPipe.scala 274:{10,10}]
  wire [511:0] _GEN_120 = 2'h3 == s2_hit_way ? s2_array_data_cacheLine_3_data : _GEN_119; // @[src/main/scala/icache/ICacheMainPipe.scala 274:{10,10}]
  wire [511:0] _s3_cacheLine_data_T = s2_can_bypass ? miss_data_buffer : _GEN_120; // @[src/main/scala/icache/ICacheMainPipe.scala 274:10]
  wire  _GEN_121 = s3_fire ? 1'h0 : s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 278:23 279:14 177:25]
  wire  _GEN_122 = s2_fire & _T | _GEN_121; // @[src/main/scala/icache/ICacheMainPipe.scala 256:36 257:14]
  wire  _T_10 = 4'h0 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire [3:0] _GEN_148 = s3_hit ? 4'h1 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 296:28 297:22 300:22]
  wire [3:0] _GEN_149 = s3_miss ? 4'h2 : _GEN_148; // @[src/main/scala/icache/ICacheMainPipe.scala 294:29 295:22]
  wire [3:0] _GEN_150 = s3_uncached ? 4'h5 : _GEN_149; // @[src/main/scala/icache/ICacheMainPipe.scala 292:33 293:22]
  wire [3:0] _GEN_151 = _s1_can_bypass_T_11 ? 4'h8 : _GEN_150; // @[src/main/scala/icache/ICacheMainPipe.scala 290:40 291:22]
  wire [3:0] _GEN_153 = io_axi_ar_arready ? 4'h3 : 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 314:31 315:20 317:20]
  wire  _T_22 = io_axi_r_data_rvalid & io_axi_r_data_rlast; // @[src/main/scala/icache/ICacheMainPipe.scala 323:33]
  wire  _T_23 = io_axi_r_data_rid == 4'h4; // @[src/main/scala/icache/ICacheMainPipe.scala 323:77]
  wire  _T_24 = io_axi_r_data_rvalid & io_axi_r_data_rlast & io_axi_r_data_rid == 4'h4; // @[src/main/scala/icache/ICacheMainPipe.scala 323:56]
  wire [3:0] _GEN_154 = io_axi_r_data_rvalid & io_axi_r_data_rlast & io_axi_r_data_rid == 4'h4 ? 4'h4 : 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 323:100 324:20 326:20]
  wire [3:0] _GEN_155 = io_axi_ar_arready ? 4'h6 : 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 337:31 338:20 340:20]
  wire  _T_29 = io_axi_r_data_rid == 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 346:77]
  wire  _T_30 = _T_22 & io_axi_r_data_rid == 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 346:56]
  wire [3:0] _GEN_156 = _T_22 & io_axi_r_data_rid == 4'h5 ? 4'h7 : 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 346:103 347:20 349:20]
  wire  _T_31 = 4'h8 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire  _T_32 = 4'h7 == state; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire [3:0] _GEN_157 = io_icache_resp_ready ? 4'h0 : 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 360:23 361:20 363:20]
  wire [3:0] _GEN_158 = _T_24 ? 4'h0 : 4'h9; // @[src/main/scala/icache/ICacheMainPipe.scala 370:100 371:20 373:20]
  wire [3:0] _GEN_159 = _T_30 ? 4'h0 : 4'ha; // @[src/main/scala/icache/ICacheMainPipe.scala 379:103 380:20 382:20]
  wire [3:0] _GEN_160 = 4'ha == state ? _GEN_159 : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17 246:28]
  wire [3:0] _GEN_161 = 4'h9 == state ? _GEN_158 : _GEN_160; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire [3:0] _GEN_162 = 4'h7 == state ? _GEN_157 : _GEN_161; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire [3:0] _GEN_163 = 4'h8 == state ? 4'h7 : _GEN_162; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17 355:18]
  wire [3:0] _GEN_164 = 4'h6 == state ? _GEN_156 : _GEN_163; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire [3:0] _GEN_165 = 4'h5 == state ? _GEN_155 : _GEN_164; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire [3:0] _GEN_166 = 4'h4 == state ? 4'h7 : _GEN_165; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17 332:18]
  wire [3:0] _GEN_167 = 4'h3 == state ? _GEN_154 : _GEN_166; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire [3:0] _GEN_168 = 4'h2 == state ? _GEN_153 : _GEN_167; // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
  wire  readAxiFire = io_axi_r_data_rvalid & io_axi_r_rready & (_T_23 | _T_29) & io_axi_r_data_rlast; // @[src/main/scala/icache/ICacheMainPipe.scala 391:152]
  wire  _T_41 = state == 4'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 394:18]
  wire  _T_42 = ~readAxiFire; // @[src/main/scala/icache/ICacheMainPipe.scala 394:37]
  wire  _T_44 = state == 4'h9; // @[src/main/scala/icache/ICacheMainPipe.scala 394:62]
  wire  _T_48 = state == 4'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 394:106]
  wire  _T_52 = state == 4'h6; // @[src/main/scala/icache/ICacheMainPipe.scala 396:24]
  wire  _T_55 = state == 4'ha; // @[src/main/scala/icache/ICacheMainPipe.scala 396:72]
  wire  _T_59 = state == 4'h5; // @[src/main/scala/icache/ICacheMainPipe.scala 396:119]
  wire [4:0] word_offset = {{1'd0}, s3_vaddr[5:2]}; // @[src/main/scala/icache/ICacheMainPipe.scala 408:25 410:15]
  wire [5:0] _word_offset_i_T = {{1'd0}, word_offset}; // @[src/main/scala/icache/ICacheMainPipe.scala 413:38]
  wire [4:0] word_offset_i = _word_offset_i_T[4:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 413:38]
  wire [10:0] bit_offset = word_offset_i * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 414:36]
  wire [511:0] _hit_instrs_0_T = s3_cacheLine_data >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 415:41]
  wire [31:0] hit_instrs_0 = _hit_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 415:55]
  wire  hit_valids_0 = word_offset_i < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 416:41]
  wire [4:0] word_offset_i_1 = word_offset + 5'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 413:38]
  wire [10:0] bit_offset_1 = word_offset_i_1 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 414:36]
  wire [511:0] _hit_instrs_1_T = s3_cacheLine_data >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 415:41]
  wire [31:0] hit_instrs_1 = _hit_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 415:55]
  wire  hit_valids_1 = word_offset_i_1 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 416:41]
  wire [4:0] word_offset_i_2 = word_offset + 5'h2; // @[src/main/scala/icache/ICacheMainPipe.scala 413:38]
  wire [10:0] bit_offset_2 = word_offset_i_2 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 414:36]
  wire [511:0] _hit_instrs_2_T = s3_cacheLine_data >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 415:41]
  wire [31:0] hit_instrs_2 = _hit_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 415:55]
  wire  hit_valids_2 = word_offset_i_2 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 416:41]
  wire [4:0] word_offset_i_3 = word_offset + 5'h3; // @[src/main/scala/icache/ICacheMainPipe.scala 413:38]
  wire [10:0] bit_offset_3 = word_offset_i_3 * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 414:36]
  wire [511:0] _hit_instrs_3_T = s3_cacheLine_data >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 415:41]
  wire [31:0] hit_instrs_3 = _hit_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 415:55]
  wire  hit_valids_3 = word_offset_i_3 < 5'h10; // @[src/main/scala/icache/ICacheMainPipe.scala 416:41]
  wire [511:0] _miss_instrs_0_T = miss_data_buffer >> bit_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] miss_instrs_0 = _miss_instrs_0_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire [511:0] _miss_instrs_1_T = miss_data_buffer >> bit_offset_1; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] miss_instrs_1 = _miss_instrs_1_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire [511:0] _miss_instrs_2_T = miss_data_buffer >> bit_offset_2; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] miss_instrs_2 = _miss_instrs_2_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  wire [511:0] _miss_instrs_3_T = miss_data_buffer >> bit_offset_3; // @[src/main/scala/icache/ICacheMainPipe.scala 430:41]
  wire [31:0] miss_instrs_3 = _miss_instrs_3_T[31:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 430:55]
  reg [31:0] uncache_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 435:36]
  reg  uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 436:35]
  wire  _T_64 = s3_hit & s3_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 471:19]
  wire [31:0] _GEN_174 = s3_hit & s3_valid ? hit_instrs_0 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 451:17 471:32 472:23]
  wire [31:0] _GEN_175 = s3_hit & s3_valid ? hit_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 451:17 471:32 472:23]
  wire [31:0] _GEN_176 = s3_hit & s3_valid ? hit_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 451:17 471:32 472:23]
  wire [31:0] _GEN_177 = s3_hit & s3_valid ? hit_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 451:17 471:32 472:23]
  wire  _GEN_178 = s3_hit & s3_valid & hit_valids_0; // @[src/main/scala/icache/ICacheMainPipe.scala 452:21 471:32 473:27]
  wire  _GEN_179 = s3_hit & s3_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 452:21 471:32 473:27]
  wire  _GEN_180 = s3_hit & s3_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 452:21 471:32 473:27]
  wire  _GEN_181 = s3_hit & s3_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 452:21 471:32 473:27]
  wire  _GEN_195 = _s1_can_bypass_T_11 & s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 498:44 503:26 509:26]
  wire  _GEN_196 = _s1_can_bypass_T_11 & s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 498:44 503:26 509:26]
  wire  _GEN_197 = _s1_can_bypass_T_11 & s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 498:44 503:26 509:26]
  wire  _GEN_198 = _s1_can_bypass_T_11 & s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 498:44 503:26 509:26]
  wire  _GEN_199 = _s1_can_bypass_T_11 & s3_mmu_error_excpAle; // @[src/main/scala/icache/ICacheMainPipe.scala 498:44 503:26 509:26]
  wire [31:0] _GEN_200 = uncache_data_valid ? uncache_data_buffer : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 488:38 489:23]
  wire  _GEN_208 = uncache_data_valid | _s1_can_bypass_T_11; // @[src/main/scala/icache/ICacheMainPipe.scala 488:38 494:22]
  wire  _GEN_211 = uncache_data_valid ? 1'h0 : _GEN_195; // @[src/main/scala/icache/ICacheMainPipe.scala 488:38 497:26]
  wire  _GEN_212 = uncache_data_valid ? 1'h0 : _GEN_196; // @[src/main/scala/icache/ICacheMainPipe.scala 488:38 497:26]
  wire  _GEN_213 = uncache_data_valid ? 1'h0 : _GEN_197; // @[src/main/scala/icache/ICacheMainPipe.scala 488:38 497:26]
  wire  _GEN_214 = uncache_data_valid ? 1'h0 : _GEN_198; // @[src/main/scala/icache/ICacheMainPipe.scala 488:38 497:26]
  wire  _GEN_215 = uncache_data_valid ? 1'h0 : _GEN_199; // @[src/main/scala/icache/ICacheMainPipe.scala 488:38 497:26]
  wire [31:0] _GEN_216 = miss_data_valid ? miss_instrs_0 : _GEN_200; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 482:23]
  wire [31:0] _GEN_217 = miss_data_valid ? miss_instrs_1 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 482:23]
  wire [31:0] _GEN_218 = miss_data_valid ? miss_instrs_2 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 482:23]
  wire [31:0] _GEN_219 = miss_data_valid ? miss_instrs_3 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 482:23]
  wire  _GEN_220 = miss_data_valid ? hit_valids_0 : uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 483:27]
  wire  _GEN_221 = miss_data_valid & hit_valids_1; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 483:27]
  wire  _GEN_222 = miss_data_valid & hit_valids_2; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 483:27]
  wire  _GEN_223 = miss_data_valid & hit_valids_3; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 483:27]
  wire  _GEN_224 = miss_data_valid | _GEN_208; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 484:22]
  wire  _GEN_226 = miss_data_valid ? 1'h0 : uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 486:25]
  wire  _GEN_227 = miss_data_valid ? 1'h0 : _GEN_211; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 487:26]
  wire  _GEN_228 = miss_data_valid ? 1'h0 : _GEN_212; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 487:26]
  wire  _GEN_229 = miss_data_valid ? 1'h0 : _GEN_213; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 487:26]
  wire  _GEN_230 = miss_data_valid ? 1'h0 : _GEN_214; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 487:26]
  wire  _GEN_231 = miss_data_valid ? 1'h0 : _GEN_215; // @[src/main/scala/icache/ICacheMainPipe.scala 481:29 487:26]
  wire  _GEN_242 = _T_31 & s3_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17 456:20 523:24]
  wire  _GEN_243 = _T_31 & s3_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17 456:20 523:24]
  wire  _GEN_244 = _T_31 & s3_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17 456:20 523:24]
  wire  _GEN_245 = _T_31 & s3_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17 456:20 523:24]
  wire  _GEN_246 = _T_31 & s3_mmu_error_excpAle; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17 456:20 523:24]
  wire [31:0] _GEN_247 = _T_32 ? _GEN_216 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire [31:0] _GEN_248 = _T_32 ? _GEN_217 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire [31:0] _GEN_249 = _T_32 ? _GEN_218 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire [31:0] _GEN_250 = _T_32 ? _GEN_219 : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire  _GEN_251 = _T_32 ? _GEN_220 : _T_31; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire  _GEN_255 = _T_32 ? _GEN_224 : _T_31; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire  _GEN_258 = _T_32 ? _GEN_227 : _GEN_242; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire  _GEN_259 = _T_32 ? _GEN_228 : _GEN_243; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire  _GEN_260 = _T_32 ? _GEN_229 : _GEN_244; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire  _GEN_261 = _T_32 ? _GEN_230 : _GEN_245; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire  _GEN_262 = _T_32 ? _GEN_231 : _GEN_246; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  wire [31:0] _io_axi_ar_data_araddr_T = {s3_ptag,s3_pidx,6'h0}; // @[src/main/scala/icache/ICacheMainPipe.scala 577:34]
  wire [2:0] _GEN_282 = _T_59 ? 3'h5 : 3'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 582:39 584:28 592:28]
  wire [31:0] _GEN_283 = _T_59 ? s3_paddr : 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 582:39 585:28 594:28]
  wire [1:0] _GEN_285 = _T_59 ? 2'h2 : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 582:39 587:28 596:28]
  wire [2:0] _GEN_287 = _T_48 ? 3'h4 : _GEN_282; // @[src/main/scala/icache/ICacheMainPipe.scala 574:30 576:28]
  wire [3:0] _GEN_289 = _T_48 ? 4'hf : 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 574:30 578:28]
  wire [1:0] _GEN_290 = _T_48 ? 2'h2 : _GEN_285; // @[src/main/scala/icache/ICacheMainPipe.scala 574:30 579:28]
  reg [3:0] beat_counter; // @[src/main/scala/icache/ICacheMainPipe.scala 608:29]
  wire [9:0] data_offset = beat_counter * 6'h20; // @[src/main/scala/icache/ICacheMainPipe.scala 616:30]
  wire [1054:0] _GEN_4 = {{1023'd0}, io_axi_r_data_rdata}; // @[src/main/scala/icache/ICacheMainPipe.scala 617:67]
  wire [1054:0] _miss_data_buffer_T = _GEN_4 << data_offset; // @[src/main/scala/icache/ICacheMainPipe.scala 617:67]
  wire [1054:0] _GEN_321 = {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 617:44]
  wire [1054:0] _miss_data_buffer_T_1 = _GEN_321 | _miss_data_buffer_T; // @[src/main/scala/icache/ICacheMainPipe.scala 617:44]
  wire [3:0] _beat_counter_T_1 = beat_counter + 4'h1; // @[src/main/scala/icache/ICacheMainPipe.scala 618:36]
  wire  _GEN_292 = io_axi_r_data_rlast | miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 620:33 621:25 176:32]
  wire [3:0] _GEN_293 = io_axi_r_data_rlast ? 4'h0 : _beat_counter_T_1; // @[src/main/scala/icache/ICacheMainPipe.scala 618:20 620:33 622:22]
  wire [1054:0] _GEN_294 = io_axi_r_data_rvalid ? _miss_data_buffer_T_1 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 613:32 617:24 185:33]
  wire [3:0] _GEN_295 = io_axi_r_data_rvalid ? _GEN_293 : beat_counter; // @[src/main/scala/icache/ICacheMainPipe.scala 608:29 613:32]
  wire  _GEN_296 = io_axi_r_data_rvalid ? _GEN_292 : miss_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 176:32 613:32]
  wire [1054:0] _GEN_297 = _T_41 & io_axi_r_data_rvalid & _T_23 ? _GEN_294 : {{543'd0}, miss_data_buffer}; // @[src/main/scala/icache/ICacheMainPipe.scala 185:33 611:98]
  wire [1054:0] _GEN_301 = s3_fire ? 1055'h0 : _GEN_297; // @[src/main/scala/icache/ICacheMainPipe.scala 632:17 633:22]
  wire  _GEN_310 = _T_52 & io_axi_r_data_rvalid & _T_29 | uncache_data_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 671:104 673:24 436:35]
  wire [1054:0] _GEN_315 = io_redirect ? 1055'h0 : _GEN_301; // @[src/main/scala/icache/ICacheMainPipe.scala 694:18 697:23]
  wire [1054:0] _GEN_322 = reset ? 1055'h0 : _GEN_315; // @[src/main/scala/icache/ICacheMainPipe.scala 185:{33,33}]
  assign io_cpu_req_ready = s0_fire | ~s0_valid; // @[src/main/scala/icache/ICacheMainPipe.scala 60:26]
  assign io_icache_resp_valid = _T_10 ? _T_64 : _GEN_255; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instrs_0 = _T_10 ? _GEN_174 : _GEN_247; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instrs_1 = _T_10 ? _GEN_175 : _GEN_248; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instrs_2 = _T_10 ? _GEN_176 : _GEN_249; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instrs_3 = _T_10 ? _GEN_177 : _GEN_250; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instvalids_0 = _T_10 ? _GEN_178 : _GEN_251; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instvalids_1 = _T_10 ? _GEN_179 : _T_32 & _GEN_221; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instvalids_2 = _T_10 ? _GEN_180 : _T_32 & _GEN_222; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_instvalids_3 = _T_10 ? _GEN_181 : _T_32 & _GEN_223; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_addr = s3_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 462:28]
  assign io_icache_resp_bits_uncached = _T_10 ? 1'h0 : _T_32 & _GEN_226; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_mmu_error_excpTlbRefill = _T_10 ? 1'h0 : _GEN_258; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_mmu_error_excpTlbPif = _T_10 ? 1'h0 : _GEN_259; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_mmu_error_excpTlbPpi = _T_10 ? 1'h0 : _GEN_260; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_mmu_error_excpAdef = _T_10 ? 1'h0 : _GEN_261; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_icache_resp_bits_mmu_error_excpAle = _T_10 ? 1'h0 : _GEN_262; // @[src/main/scala/icache/ICacheMainPipe.scala 469:17]
  assign io_axi_ar_data_arid = {{1'd0}, _GEN_287};
  assign io_axi_ar_data_araddr = _T_48 ? _io_axi_ar_data_araddr_T : _GEN_283; // @[src/main/scala/icache/ICacheMainPipe.scala 574:30 577:28]
  assign io_axi_ar_data_arlen = {{4'd0}, _GEN_289};
  assign io_axi_ar_data_arsize = {{1'd0}, _GEN_290};
  assign io_axi_ar_data_arvalid = _T_48 | _T_59; // @[src/main/scala/icache/ICacheMainPipe.scala 574:30 580:28]
  assign io_axi_r_rready = _T_41 | _T_52 | _T_44 | _T_55; // @[src/main/scala/icache/ICacheMainPipe.scala 604:106]
  assign io_arrays_read_req_valid = s0_fire & _T; // @[src/main/scala/icache/ICacheMainPipe.scala 89:40]
  assign io_arrays_read_req_idx = s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 90:29]
  assign io_array_write_valid = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 637:50]
  assign io_array_write_idx = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? s3_pidx : 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 639:26 654:26]
  assign io_array_write_way = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? io_victim_read_resp : 2'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 645:26 657:26]
  assign io_array_write_tag = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? s3_ptag : 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 640:26 655:26]
  assign io_array_write_data = state == 4'h4 & miss_data_valid & io_icache_resp_ready ? miss_data_buffer : 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 641:26 656:26]
  assign io_victim_read_req = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 637:50]
  assign io_victim_read_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 282:22]
  assign io_replacer_touch_valid = state == 4'h4 & miss_data_valid & io_icache_resp_ready; // @[src/main/scala/icache/ICacheMainPipe.scala 637:50]
  assign io_replacer_touch_idx = s3_paddr[13:6]; // @[src/main/scala/icache/ICacheMainPipe.scala 282:22]
  assign io_replacer_touch_way = io_victim_read_resp; // @[src/main/scala/icache/ICacheMainPipe.scala 637:64 649:27 664:27]
  assign io_mmu_toMmu_valid = s0_fire & _T; // @[src/main/scala/icache/ICacheMainPipe.scala 92:33]
  assign io_mmu_toMmu_bits_vaddr = s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 93:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 56:25]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 56:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 74:18]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 75:15]
    end else if (io_fire & ~io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 77:35]
      s0_valid <= io_cpu_req_bits_addr != 32'h1bfffffc; // @[src/main/scala/icache/ICacheMainPipe.scala 78:14]
    end else if (s0_fire) begin // @[src/main/scala/icache/ICacheMainPipe.scala 82:22]
      s0_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 83:15]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 98:25]
      s1_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 98:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 111:18]
      s1_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 112:15]
    end else begin
      s1_valid <= _GEN_10;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 150:25]
      s2_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 150:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      s2_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 197:14]
    end else begin
      s2_valid <= _GEN_63;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 245:22]
      state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 245:22]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 393:18]
      if (state == 4'h3 & ~readAxiFire | state == 4'h9 & ~readAxiFire | state == 4'h2 & io_axi_ar_data_arvalid &
        io_axi_ar_arready) begin // @[src/main/scala/icache/ICacheMainPipe.scala 394:170]
        state <= 4'h9; // @[src/main/scala/icache/ICacheMainPipe.scala 395:13]
      end else if (state == 4'h6 & _T_42 | state == 4'ha & _T_42 | state == 4'h5 & io_axi_ar_data_arvalid &
        io_axi_ar_arready) begin // @[src/main/scala/icache/ICacheMainPipe.scala 396:186]
        state <= 4'ha; // @[src/main/scala/icache/ICacheMainPipe.scala 397:13]
      end else begin
        state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 399:13]
      end
    end else if (4'h0 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
      if (s3_valid & _T & ~s3_hit) begin // @[src/main/scala/icache/ICacheMainPipe.scala 288:46]
        state <= _GEN_151;
      end else begin
        state <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 303:20]
      end
    end else if (4'h1 == state) begin // @[src/main/scala/icache/ICacheMainPipe.scala 286:17]
      state <= 4'h7; // @[src/main/scala/icache/ICacheMainPipe.scala 309:18]
    end else begin
      state <= _GEN_168;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 177:25]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 177:25]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      s3_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 255:14]
    end else begin
      s3_valid <= _GEN_122;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 182:33]
      s3_hit <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 182:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_hit <= s2_hit | s2_can_bypass_from_s1 | s2_can_bypass; // @[src/main/scala/icache/ICacheMainPipe.scala 264:12]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 129:34]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 129:34]
    end else if (s1_fire | io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      s1_array_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 137:23]
    end else begin
      s1_array_received <= _GEN_18;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 128:32]
      s1_mmu_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 128:32]
    end else if (_T_4) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      s1_mmu_received <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 144:21]
    end else begin
      s1_mmu_received <= _GEN_44;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 68:25]
      s0_vaddr <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 68:25]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 74:18]
      if (io_fire & ~io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 77:35]
        s0_vaddr <= io_cpu_req_bits_addr; // @[src/main/scala/icache/ICacheMainPipe.scala 79:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 69:25]
      s0_vidx <= 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 69:25]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 74:18]
      if (io_fire & ~io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 77:35]
        s0_vidx <= curr_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 80:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 99:25]
      s1_vaddr <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 99:25]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 111:18]
      if (_io_arrays_read_req_valid_T_1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 113:35]
        s1_vaddr <= s0_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 115:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 100:25]
      s1_vidx <= 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 100:25]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 111:18]
      if (_io_arrays_read_req_valid_T_1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 113:35]
        s1_vidx <= s0_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 116:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_0_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_0_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_0_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_1_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_1_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_1_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_2_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_2_has <= io_arrays_read_resp_data_cacheLine_2_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_2_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_2_tag <= io_arrays_read_resp_data_cacheLine_2_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_2_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_2_data <= io_arrays_read_resp_data_cacheLine_2_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_3_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_3_has <= io_arrays_read_resp_data_cacheLine_3_has; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_3_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_3_tag <= io_arrays_read_resp_data_cacheLine_3_tag; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
      s1_array_received_data_cacheLine_3_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 133:39]
    end else if (!(s1_fire | io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 136:29]
      if (io_arrays_read_resp_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 138:31]
        s1_array_received_data_cacheLine_3_data <= io_arrays_read_resp_data_cacheLine_3_data; // @[src/main/scala/icache/ICacheMainPipe.scala 140:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
      s1_mmu_received_data_paddr <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
    end else if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_paddr <= io_mmu_fromMmu_bits_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
      s1_mmu_received_data_cacheable <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
    end else if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_cacheable <= io_mmu_fromMmu_bits_cacheable; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
      s1_mmu_received_data_error_excpTlbRefill <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
    end else if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpTlbRefill <= io_mmu_fromMmu_bits_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
      s1_mmu_received_data_error_excpTlbPif <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
    end else if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpTlbPif <= io_mmu_fromMmu_bits_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
      s1_mmu_received_data_error_excpTlbPpi <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
    end else if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpTlbPpi <= io_mmu_fromMmu_bits_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
      s1_mmu_received_data_error_excpAdef <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
    end else if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpAdef <= io_mmu_fromMmu_bits_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
      s1_mmu_received_data_error_excpAle <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 134:39]
    end else if (!(_T_4)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 143:29]
      if (io_mmu_fromMmu_valid) begin // @[src/main/scala/icache/ICacheMainPipe.scala 145:29]
        s1_mmu_received_data_error_excpAle <= io_mmu_fromMmu_bits_error_excpAle; // @[src/main/scala/icache/ICacheMainPipe.scala 147:26]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 151:29]
      s2_vaddr <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 151:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        s2_vaddr <= s1_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 204:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 152:29]
      s2_paddr <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 152:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 169:21]
          s2_paddr <= s1_mmu_received_data_paddr;
        end else begin
          s2_paddr <= io_mmu_fromMmu_bits_paddr;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 153:29]
      s2_uncached <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 153:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 209:23]
          s2_uncached <= ~s1_mmu_received_data_cacheable;
        end else begin
          s2_uncached <= ~io_mmu_fromMmu_bits_cacheable;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
      s2_mmu_error_excpTlbRefill <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 210:24]
          s2_mmu_error_excpTlbRefill <= s1_mmu_received_data_error_excpTlbRefill;
        end else begin
          s2_mmu_error_excpTlbRefill <= io_mmu_fromMmu_bits_error_excpTlbRefill;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
      s2_mmu_error_excpTlbPif <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 210:24]
          s2_mmu_error_excpTlbPif <= s1_mmu_received_data_error_excpTlbPif;
        end else begin
          s2_mmu_error_excpTlbPif <= io_mmu_fromMmu_bits_error_excpTlbPif;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
      s2_mmu_error_excpTlbPpi <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 210:24]
          s2_mmu_error_excpTlbPpi <= s1_mmu_received_data_error_excpTlbPpi;
        end else begin
          s2_mmu_error_excpTlbPpi <= io_mmu_fromMmu_bits_error_excpTlbPpi;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
      s2_mmu_error_excpAdef <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 210:24]
          s2_mmu_error_excpAdef <= s1_mmu_received_data_error_excpAdef;
        end else begin
          s2_mmu_error_excpAdef <= io_mmu_fromMmu_bits_error_excpAdef;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
      s2_mmu_error_excpAle <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 154:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 210:24]
          s2_mmu_error_excpAle <= s1_mmu_received_data_error_excpAle;
        end else begin
          s2_mmu_error_excpAle <= io_mmu_fromMmu_bits_error_excpAle;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 155:29]
      s2_vidx <= 8'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 155:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        s2_vidx <= s1_vidx; // @[src/main/scala/icache/ICacheMainPipe.scala 205:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 158:29]
      s2_ptag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 158:29]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_mmu_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 167:20]
          s2_ptag <= s1_mmu_received_data_paddr[31:14];
        end else begin
          s2_ptag <= io_mmu_fromMmu_bits_paddr[31:14];
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_0_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_0_has <= s1_array_received_data_cacheLine_0_has;
        end else begin
          s2_array_data_cacheLine_0_has <= io_arrays_read_resp_data_cacheLine_0_has;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_0_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_0_tag <= s1_array_received_data_cacheLine_0_tag;
        end else begin
          s2_array_data_cacheLine_0_tag <= io_arrays_read_resp_data_cacheLine_0_tag;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_0_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_0_data <= s1_array_received_data_cacheLine_0_data;
        end else begin
          s2_array_data_cacheLine_0_data <= io_arrays_read_resp_data_cacheLine_0_data;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_1_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_1_has <= s1_array_received_data_cacheLine_1_has;
        end else begin
          s2_array_data_cacheLine_1_has <= io_arrays_read_resp_data_cacheLine_1_has;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_1_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_1_tag <= s1_array_received_data_cacheLine_1_tag;
        end else begin
          s2_array_data_cacheLine_1_tag <= io_arrays_read_resp_data_cacheLine_1_tag;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_1_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_1_data <= s1_array_received_data_cacheLine_1_data;
        end else begin
          s2_array_data_cacheLine_1_data <= io_arrays_read_resp_data_cacheLine_1_data;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_2_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_2_has <= s1_array_received_data_cacheLine_2_has;
        end else begin
          s2_array_data_cacheLine_2_has <= io_arrays_read_resp_data_cacheLine_2_has;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_2_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_2_tag <= s1_array_received_data_cacheLine_2_tag;
        end else begin
          s2_array_data_cacheLine_2_tag <= io_arrays_read_resp_data_cacheLine_2_tag;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_2_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_2_data <= s1_array_received_data_cacheLine_2_data;
        end else begin
          s2_array_data_cacheLine_2_data <= io_arrays_read_resp_data_cacheLine_2_data;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_3_has <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_3_has <= s1_array_received_data_cacheLine_3_has;
        end else begin
          s2_array_data_cacheLine_3_has <= io_arrays_read_resp_data_cacheLine_3_has;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_3_tag <= 18'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_3_tag <= s1_array_received_data_cacheLine_3_tag;
        end else begin
          s2_array_data_cacheLine_3_tag <= io_arrays_read_resp_data_cacheLine_3_tag;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
      s2_array_data_cacheLine_3_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 159:30]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        if (s1_array_received) begin // @[src/main/scala/icache/ICacheMainPipe.scala 168:31]
          s2_array_data_cacheLine_3_data <= s1_array_received_data_cacheLine_3_data;
        end else begin
          s2_array_data_cacheLine_3_data <= io_arrays_read_resp_data_cacheLine_3_data;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 176:32]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 176:32]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 694:18]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 695:23]
    end else if (_s3_ready_T_9) begin // @[src/main/scala/icache/ICacheMainPipe.scala 683:38]
      miss_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 685:21]
    end else if (_T_41 & io_axi_r_data_rvalid & _T_23) begin // @[src/main/scala/icache/ICacheMainPipe.scala 611:98]
      miss_data_valid <= _GEN_296;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 178:33]
      s3_vaddr <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 178:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_vaddr <= s2_vaddr; // @[src/main/scala/icache/ICacheMainPipe.scala 258:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 179:33]
      s3_paddr <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 179:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_paddr <= s2_paddr; // @[src/main/scala/icache/ICacheMainPipe.scala 259:14]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 180:33]
      s3_uncached <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 180:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_uncached <= s2_uncached; // @[src/main/scala/icache/ICacheMainPipe.scala 261:17]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
      s3_mmu_error_excpTlbRefill <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_mmu_error_excpTlbRefill <= s2_mmu_error_excpTlbRefill; // @[src/main/scala/icache/ICacheMainPipe.scala 262:18]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
      s3_mmu_error_excpTlbPif <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_mmu_error_excpTlbPif <= s2_mmu_error_excpTlbPif; // @[src/main/scala/icache/ICacheMainPipe.scala 262:18]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
      s3_mmu_error_excpTlbPpi <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_mmu_error_excpTlbPpi <= s2_mmu_error_excpTlbPpi; // @[src/main/scala/icache/ICacheMainPipe.scala 262:18]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
      s3_mmu_error_excpAdef <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_mmu_error_excpAdef <= s2_mmu_error_excpAdef; // @[src/main/scala/icache/ICacheMainPipe.scala 262:18]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
      s3_mmu_error_excpAle <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 181:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_mmu_error_excpAle <= s2_mmu_error_excpAle; // @[src/main/scala/icache/ICacheMainPipe.scala 262:18]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 183:33]
      s3_miss <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 183:33]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        s3_miss <= s2_cache_miss & (~s2_can_bypass_from_s1 & ~s2_can_bypass); // @[src/main/scala/icache/ICacheMainPipe.scala 271:13]
      end
    end
    miss_data_buffer <= _GEN_322[511:0]; // @[src/main/scala/icache/ICacheMainPipe.scala 185:{33,33}]
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 190:39]
      s2_bypass_data_from_s1 <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 190:39]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        s2_bypass_data_from_s1 <= miss_data_buffer; // @[src/main/scala/icache/ICacheMainPipe.scala 212:28]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 191:39]
      s2_can_bypass_from_s1 <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 191:39]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 196:18]
      if (s1_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 198:36]
        s2_can_bypass_from_s1 <= s1_can_bypass & ~_s2_uncached_T_2; // @[src/main/scala/icache/ICacheMainPipe.scala 213:27]
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 235:34]
      s3_cacheLine_data <= 512'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 235:34]
    end else if (!(io_redirect)) begin // @[src/main/scala/icache/ICacheMainPipe.scala 254:18]
      if (s2_fire & _T) begin // @[src/main/scala/icache/ICacheMainPipe.scala 256:36]
        if (s2_can_bypass_from_s1) begin // @[src/main/scala/icache/ICacheMainPipe.scala 272:29]
          s3_cacheLine_data <= s2_bypass_data_from_s1;
        end else begin
          s3_cacheLine_data <= _s3_cacheLine_data_T;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 435:36]
      uncache_data_buffer <= 32'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 435:36]
    end else if (_T_52 & io_axi_r_data_rvalid & _T_29) begin // @[src/main/scala/icache/ICacheMainPipe.scala 671:104]
      uncache_data_buffer <= io_axi_r_data_rdata; // @[src/main/scala/icache/ICacheMainPipe.scala 672:25]
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 436:35]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 436:35]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 694:18]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 696:24]
    end else if (_s3_ready_T_9) begin // @[src/main/scala/icache/ICacheMainPipe.scala 683:38]
      uncache_data_valid <= 1'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 687:24]
    end else begin
      uncache_data_valid <= _GEN_310;
    end
    if (reset) begin // @[src/main/scala/icache/ICacheMainPipe.scala 608:29]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 608:29]
    end else if (io_redirect) begin // @[src/main/scala/icache/ICacheMainPipe.scala 694:18]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 698:23]
    end else if (_T_44 & io_axi_r_data_rvalid & _T_23 & io_axi_r_data_rlast) begin // @[src/main/scala/icache/ICacheMainPipe.scala 628:122]
      beat_counter <= 4'h0; // @[src/main/scala/icache/ICacheMainPipe.scala 629:18]
    end else if (_T_41 & io_axi_r_data_rvalid & _T_23) begin // @[src/main/scala/icache/ICacheMainPipe.scala 611:98]
      beat_counter <= _GEN_295;
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
  s0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s2_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s3_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s3_hit = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_array_received = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_mmu_received = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s0_vaddr = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s0_vidx = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  s1_vaddr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s1_vidx = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_0_has = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_0_tag = _RAND_13[17:0];
  _RAND_14 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_0_data = _RAND_14[511:0];
  _RAND_15 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_1_has = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_1_tag = _RAND_16[17:0];
  _RAND_17 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_1_data = _RAND_17[511:0];
  _RAND_18 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_2_has = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_2_tag = _RAND_19[17:0];
  _RAND_20 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_2_data = _RAND_20[511:0];
  _RAND_21 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_3_has = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s1_array_received_data_cacheLine_3_tag = _RAND_22[17:0];
  _RAND_23 = {16{`RANDOM}};
  s1_array_received_data_cacheLine_3_data = _RAND_23[511:0];
  _RAND_24 = {1{`RANDOM}};
  s1_mmu_received_data_paddr = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_mmu_received_data_cacheable = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpTlbRefill = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpTlbPif = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpTlbPpi = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpAdef = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s1_mmu_received_data_error_excpAle = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  s2_vaddr = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s2_paddr = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  s2_uncached = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  s2_mmu_error_excpTlbRefill = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  s2_mmu_error_excpTlbPif = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  s2_mmu_error_excpTlbPpi = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  s2_mmu_error_excpAdef = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  s2_mmu_error_excpAle = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  s2_vidx = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  s2_ptag = _RAND_40[17:0];
  _RAND_41 = {1{`RANDOM}};
  s2_array_data_cacheLine_0_has = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  s2_array_data_cacheLine_0_tag = _RAND_42[17:0];
  _RAND_43 = {16{`RANDOM}};
  s2_array_data_cacheLine_0_data = _RAND_43[511:0];
  _RAND_44 = {1{`RANDOM}};
  s2_array_data_cacheLine_1_has = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  s2_array_data_cacheLine_1_tag = _RAND_45[17:0];
  _RAND_46 = {16{`RANDOM}};
  s2_array_data_cacheLine_1_data = _RAND_46[511:0];
  _RAND_47 = {1{`RANDOM}};
  s2_array_data_cacheLine_2_has = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  s2_array_data_cacheLine_2_tag = _RAND_48[17:0];
  _RAND_49 = {16{`RANDOM}};
  s2_array_data_cacheLine_2_data = _RAND_49[511:0];
  _RAND_50 = {1{`RANDOM}};
  s2_array_data_cacheLine_3_has = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  s2_array_data_cacheLine_3_tag = _RAND_51[17:0];
  _RAND_52 = {16{`RANDOM}};
  s2_array_data_cacheLine_3_data = _RAND_52[511:0];
  _RAND_53 = {1{`RANDOM}};
  miss_data_valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  s3_vaddr = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  s3_paddr = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  s3_uncached = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  s3_mmu_error_excpTlbRefill = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  s3_mmu_error_excpTlbPif = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  s3_mmu_error_excpTlbPpi = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  s3_mmu_error_excpAdef = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  s3_mmu_error_excpAle = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  s3_miss = _RAND_62[0:0];
  _RAND_63 = {16{`RANDOM}};
  miss_data_buffer = _RAND_63[511:0];
  _RAND_64 = {16{`RANDOM}};
  s2_bypass_data_from_s1 = _RAND_64[511:0];
  _RAND_65 = {1{`RANDOM}};
  s2_can_bypass_from_s1 = _RAND_65[0:0];
  _RAND_66 = {16{`RANDOM}};
  s3_cacheLine_data = _RAND_66[511:0];
  _RAND_67 = {1{`RANDOM}};
  uncache_data_buffer = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  uncache_data_valid = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  beat_counter = _RAND_69[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
