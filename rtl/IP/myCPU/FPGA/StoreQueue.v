module StoreQueue(
  input         clock,
  input         reset,
  input         io_redirectInfo_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_redirectInfo_bits_doRedirect, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [5:0]  io_redirectInfo_bits_robIdx_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_redirectInfo_bits_robIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_enq_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [5:0]  io_enq_robIdx_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_enq_robIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_enq_lqIdx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [31:0] io_enq_pc, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [6:0]  io_enq_pdst, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_enq_rfWen, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_enq_lsuOp, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_enq_fuType, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_addrWrite_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_addrWrite_idx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [31:0] io_addrWrite_vaddr, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [31:0] io_addrWrite_paddr, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [16:0] io_addrWrite_excp_excpVec, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_addrWrite_cacheable, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_dataWrite_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_dataWrite_idx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [31:0] io_dataWrite_data, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_robCommit_0_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_robCommit_0_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_robCommit_1_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_robCommit_1_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_robCommit_2_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_robCommit_2_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_dcacheReq_ready, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_dcacheReq_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [3:0]  io_dcacheReq_bits_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [31:0] io_dcacheReq_bits_paddr, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_dcacheReq_bits_cacheable, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [31:0] io_dcacheReq_bits_data, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [3:0]  io_dcacheReq_bits_lsuOp, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_storeAck_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input  [3:0]  io_storeAck_bits_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  input         io_outResult_ready, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_outResult_valid, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [31:0] io_outResult_bits_uop_pc, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [3:0]  io_outResult_bits_uop_ctrl_fuType, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [3:0]  io_outResult_bits_uop_ctrl_lsuOp, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [16:0] io_outResult_bits_uop_excp_excpVec, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [6:0]  io_outResult_bits_uop_pdst, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [5:0]  io_outResult_bits_uop_robIdx_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_outResult_bits_uop_robIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [5:0]  io_outResult_bits_uop_robIdxFull_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_outResult_bits_uop_robIdxFull_flag, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [3:0]  io_outResult_bits_uop_lqIdx_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [3:0]  io_outResult_bits_uop_sqIdx_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [5:0]  io_outResult_bits_redirect_bits_robIdx_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_outResult_bits_redirect_bits_robIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [31:0] io_outResult_bits_memVaddr, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [31:0] io_outResult_bits_memPaddr, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [31:0] io_outResult_bits_memStoreData, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output [5:0]  io_oldestRobIdx_value, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_oldestRobIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_sqEmpty, // @[src/main/scala/memory/StoreQueue.scala 44:14]
  output        io_full // @[src/main/scala/memory/StoreQueue.scala 44:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [5:0] entries_0_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_0_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_0_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_0_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_0_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_0_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_0_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_0_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_1_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_1_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_1_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_1_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_1_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_1_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_1_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_1_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_1_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_1_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_1_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_2_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_2_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_2_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_2_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_2_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_2_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_2_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_2_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_2_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_2_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_2_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_3_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_3_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_3_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_3_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_3_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_3_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_3_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_3_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_3_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_3_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_3_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_4_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_4_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_4_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_4_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_4_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_4_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_4_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_4_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_4_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_4_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_4_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_5_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_5_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_5_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_5_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_5_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_5_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_5_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_5_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_5_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_5_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_5_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_6_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_6_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_6_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_6_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_6_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_6_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_6_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_6_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_6_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_6_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_6_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_7_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_7_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_7_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_7_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_7_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_7_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_7_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_7_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_7_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_7_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_7_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_8_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_8_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_8_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_8_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_8_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_8_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_8_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_8_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_8_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_8_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_8_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_9_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_9_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_9_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_9_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_9_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_9_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_9_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_9_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_9_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_9_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_9_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_10_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_10_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_10_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_10_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_10_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_10_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_10_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_10_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_10_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_10_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_10_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_11_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_11_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_11_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_11_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_11_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_11_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_11_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_11_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_11_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_11_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_11_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_12_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_12_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_12_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_12_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_12_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_12_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_12_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_12_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_12_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_12_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_12_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_13_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_13_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_13_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_13_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_13_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_13_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_13_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_13_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_13_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_13_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_13_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_14_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_14_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_14_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_14_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_14_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_14_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_14_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_14_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_14_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_14_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_14_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [5:0] entries_15_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_15_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_15_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_15_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_15_data; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [16:0] entries_15_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_15_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [31:0] entries_15_pc; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [6:0] entries_15_pdst; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg  entries_15_rfWen; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] entries_15_fuType; // @[src/main/scala/memory/StoreQueue.scala 114:24]
  reg [3:0] enqPtr_value; // @[src/main/scala/memory/StoreQueue.scala 117:23]
  reg  enqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 117:23]
  reg [3:0] deqPtr_value; // @[src/main/scala/memory/StoreQueue.scala 120:23]
  reg  deqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 120:23]
  wire  _empty_T = deqPtr_value == enqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 117:39]
  wire  full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 125:47]
  wire [4:0] _idx_T = {{1'd0}, deqPtr_value}; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire [3:0] idx = _idx_T[3:0]; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_1 = 4'h1 == idx ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_2 = 4'h2 == idx ? entries_2_alreadyFlush : _GEN_1; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_3 = 4'h3 == idx ? entries_3_alreadyFlush : _GEN_2; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_4 = 4'h4 == idx ? entries_4_alreadyFlush : _GEN_3; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_5 = 4'h5 == idx ? entries_5_alreadyFlush : _GEN_4; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_6 = 4'h6 == idx ? entries_6_alreadyFlush : _GEN_5; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_7 = 4'h7 == idx ? entries_7_alreadyFlush : _GEN_6; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_8 = 4'h8 == idx ? entries_8_alreadyFlush : _GEN_7; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_9 = 4'h9 == idx ? entries_9_alreadyFlush : _GEN_8; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_10 = 4'ha == idx ? entries_10_alreadyFlush : _GEN_9; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_11 = 4'hb == idx ? entries_11_alreadyFlush : _GEN_10; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_12 = 4'hc == idx ? entries_12_alreadyFlush : _GEN_11; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_13 = 4'hd == idx ? entries_13_alreadyFlush : _GEN_12; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_14 = 4'he == idx ? entries_14_alreadyFlush : _GEN_13; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_15 = 4'hf == idx ? entries_15_alreadyFlush : _GEN_14; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_0_T = ~_GEN_15; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_17 = 4'h1 == idx ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_18 = 4'h2 == idx ? entries_2_valid : _GEN_17; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_19 = 4'h3 == idx ? entries_3_valid : _GEN_18; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_20 = 4'h4 == idx ? entries_4_valid : _GEN_19; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_21 = 4'h5 == idx ? entries_5_valid : _GEN_20; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_22 = 4'h6 == idx ? entries_6_valid : _GEN_21; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_23 = 4'h7 == idx ? entries_7_valid : _GEN_22; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_24 = 4'h8 == idx ? entries_8_valid : _GEN_23; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_25 = 4'h9 == idx ? entries_9_valid : _GEN_24; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_26 = 4'ha == idx ? entries_10_valid : _GEN_25; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_27 = 4'hb == idx ? entries_11_valid : _GEN_26; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_28 = 4'hc == idx ? entries_12_valid : _GEN_27; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_29 = 4'hd == idx ? entries_13_valid : _GEN_28; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_30 = 4'he == idx ? entries_14_valid : _GEN_29; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_31 = 4'hf == idx ? entries_15_valid : _GEN_30; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_0 = _GEN_31 & ~_GEN_15; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [4:0] _idx_T_2 = deqPtr_value + 4'h1; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire [3:0] idx_1 = deqPtr_value + 4'h1; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_33 = 4'h1 == idx_1 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_34 = 4'h2 == idx_1 ? entries_2_alreadyFlush : _GEN_33; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_35 = 4'h3 == idx_1 ? entries_3_alreadyFlush : _GEN_34; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_36 = 4'h4 == idx_1 ? entries_4_alreadyFlush : _GEN_35; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_37 = 4'h5 == idx_1 ? entries_5_alreadyFlush : _GEN_36; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_38 = 4'h6 == idx_1 ? entries_6_alreadyFlush : _GEN_37; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_39 = 4'h7 == idx_1 ? entries_7_alreadyFlush : _GEN_38; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_40 = 4'h8 == idx_1 ? entries_8_alreadyFlush : _GEN_39; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_41 = 4'h9 == idx_1 ? entries_9_alreadyFlush : _GEN_40; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_42 = 4'ha == idx_1 ? entries_10_alreadyFlush : _GEN_41; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_43 = 4'hb == idx_1 ? entries_11_alreadyFlush : _GEN_42; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_44 = 4'hc == idx_1 ? entries_12_alreadyFlush : _GEN_43; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_45 = 4'hd == idx_1 ? entries_13_alreadyFlush : _GEN_44; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_46 = 4'he == idx_1 ? entries_14_alreadyFlush : _GEN_45; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_47 = 4'hf == idx_1 ? entries_15_alreadyFlush : _GEN_46; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_1_T = ~_GEN_47; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_49 = 4'h1 == idx_1 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_50 = 4'h2 == idx_1 ? entries_2_valid : _GEN_49; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_51 = 4'h3 == idx_1 ? entries_3_valid : _GEN_50; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_52 = 4'h4 == idx_1 ? entries_4_valid : _GEN_51; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_53 = 4'h5 == idx_1 ? entries_5_valid : _GEN_52; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_54 = 4'h6 == idx_1 ? entries_6_valid : _GEN_53; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_55 = 4'h7 == idx_1 ? entries_7_valid : _GEN_54; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_56 = 4'h8 == idx_1 ? entries_8_valid : _GEN_55; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_57 = 4'h9 == idx_1 ? entries_9_valid : _GEN_56; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_58 = 4'ha == idx_1 ? entries_10_valid : _GEN_57; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_59 = 4'hb == idx_1 ? entries_11_valid : _GEN_58; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_60 = 4'hc == idx_1 ? entries_12_valid : _GEN_59; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_61 = 4'hd == idx_1 ? entries_13_valid : _GEN_60; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_62 = 4'he == idx_1 ? entries_14_valid : _GEN_61; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_63 = 4'hf == idx_1 ? entries_15_valid : _GEN_62; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_1 = _GEN_63 & ~_GEN_47; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_2 = deqPtr_value + 4'h2; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_65 = 4'h1 == idx_2 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_66 = 4'h2 == idx_2 ? entries_2_alreadyFlush : _GEN_65; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_67 = 4'h3 == idx_2 ? entries_3_alreadyFlush : _GEN_66; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_68 = 4'h4 == idx_2 ? entries_4_alreadyFlush : _GEN_67; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_69 = 4'h5 == idx_2 ? entries_5_alreadyFlush : _GEN_68; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_70 = 4'h6 == idx_2 ? entries_6_alreadyFlush : _GEN_69; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_71 = 4'h7 == idx_2 ? entries_7_alreadyFlush : _GEN_70; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_72 = 4'h8 == idx_2 ? entries_8_alreadyFlush : _GEN_71; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_73 = 4'h9 == idx_2 ? entries_9_alreadyFlush : _GEN_72; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_74 = 4'ha == idx_2 ? entries_10_alreadyFlush : _GEN_73; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_75 = 4'hb == idx_2 ? entries_11_alreadyFlush : _GEN_74; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_76 = 4'hc == idx_2 ? entries_12_alreadyFlush : _GEN_75; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_77 = 4'hd == idx_2 ? entries_13_alreadyFlush : _GEN_76; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_78 = 4'he == idx_2 ? entries_14_alreadyFlush : _GEN_77; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_79 = 4'hf == idx_2 ? entries_15_alreadyFlush : _GEN_78; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_2_T = ~_GEN_79; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_81 = 4'h1 == idx_2 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_82 = 4'h2 == idx_2 ? entries_2_valid : _GEN_81; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_83 = 4'h3 == idx_2 ? entries_3_valid : _GEN_82; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_84 = 4'h4 == idx_2 ? entries_4_valid : _GEN_83; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_85 = 4'h5 == idx_2 ? entries_5_valid : _GEN_84; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_86 = 4'h6 == idx_2 ? entries_6_valid : _GEN_85; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_87 = 4'h7 == idx_2 ? entries_7_valid : _GEN_86; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_88 = 4'h8 == idx_2 ? entries_8_valid : _GEN_87; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_89 = 4'h9 == idx_2 ? entries_9_valid : _GEN_88; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_90 = 4'ha == idx_2 ? entries_10_valid : _GEN_89; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_91 = 4'hb == idx_2 ? entries_11_valid : _GEN_90; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_92 = 4'hc == idx_2 ? entries_12_valid : _GEN_91; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_93 = 4'hd == idx_2 ? entries_13_valid : _GEN_92; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_94 = 4'he == idx_2 ? entries_14_valid : _GEN_93; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_95 = 4'hf == idx_2 ? entries_15_valid : _GEN_94; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_2 = _GEN_95 & ~_GEN_79; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_3 = deqPtr_value + 4'h3; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_97 = 4'h1 == idx_3 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_98 = 4'h2 == idx_3 ? entries_2_alreadyFlush : _GEN_97; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_99 = 4'h3 == idx_3 ? entries_3_alreadyFlush : _GEN_98; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_100 = 4'h4 == idx_3 ? entries_4_alreadyFlush : _GEN_99; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_101 = 4'h5 == idx_3 ? entries_5_alreadyFlush : _GEN_100; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_102 = 4'h6 == idx_3 ? entries_6_alreadyFlush : _GEN_101; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_103 = 4'h7 == idx_3 ? entries_7_alreadyFlush : _GEN_102; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_104 = 4'h8 == idx_3 ? entries_8_alreadyFlush : _GEN_103; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_105 = 4'h9 == idx_3 ? entries_9_alreadyFlush : _GEN_104; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_106 = 4'ha == idx_3 ? entries_10_alreadyFlush : _GEN_105; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_107 = 4'hb == idx_3 ? entries_11_alreadyFlush : _GEN_106; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_108 = 4'hc == idx_3 ? entries_12_alreadyFlush : _GEN_107; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_109 = 4'hd == idx_3 ? entries_13_alreadyFlush : _GEN_108; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_110 = 4'he == idx_3 ? entries_14_alreadyFlush : _GEN_109; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_111 = 4'hf == idx_3 ? entries_15_alreadyFlush : _GEN_110; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_3_T = ~_GEN_111; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_113 = 4'h1 == idx_3 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_114 = 4'h2 == idx_3 ? entries_2_valid : _GEN_113; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_115 = 4'h3 == idx_3 ? entries_3_valid : _GEN_114; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_116 = 4'h4 == idx_3 ? entries_4_valid : _GEN_115; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_117 = 4'h5 == idx_3 ? entries_5_valid : _GEN_116; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_118 = 4'h6 == idx_3 ? entries_6_valid : _GEN_117; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_119 = 4'h7 == idx_3 ? entries_7_valid : _GEN_118; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_120 = 4'h8 == idx_3 ? entries_8_valid : _GEN_119; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_121 = 4'h9 == idx_3 ? entries_9_valid : _GEN_120; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_122 = 4'ha == idx_3 ? entries_10_valid : _GEN_121; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_123 = 4'hb == idx_3 ? entries_11_valid : _GEN_122; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_124 = 4'hc == idx_3 ? entries_12_valid : _GEN_123; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_125 = 4'hd == idx_3 ? entries_13_valid : _GEN_124; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_126 = 4'he == idx_3 ? entries_14_valid : _GEN_125; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_127 = 4'hf == idx_3 ? entries_15_valid : _GEN_126; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_3 = _GEN_127 & ~_GEN_111; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_4 = deqPtr_value + 4'h4; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_129 = 4'h1 == idx_4 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_130 = 4'h2 == idx_4 ? entries_2_alreadyFlush : _GEN_129; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_131 = 4'h3 == idx_4 ? entries_3_alreadyFlush : _GEN_130; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_132 = 4'h4 == idx_4 ? entries_4_alreadyFlush : _GEN_131; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_133 = 4'h5 == idx_4 ? entries_5_alreadyFlush : _GEN_132; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_134 = 4'h6 == idx_4 ? entries_6_alreadyFlush : _GEN_133; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_135 = 4'h7 == idx_4 ? entries_7_alreadyFlush : _GEN_134; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_136 = 4'h8 == idx_4 ? entries_8_alreadyFlush : _GEN_135; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_137 = 4'h9 == idx_4 ? entries_9_alreadyFlush : _GEN_136; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_138 = 4'ha == idx_4 ? entries_10_alreadyFlush : _GEN_137; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_139 = 4'hb == idx_4 ? entries_11_alreadyFlush : _GEN_138; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_140 = 4'hc == idx_4 ? entries_12_alreadyFlush : _GEN_139; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_141 = 4'hd == idx_4 ? entries_13_alreadyFlush : _GEN_140; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_142 = 4'he == idx_4 ? entries_14_alreadyFlush : _GEN_141; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_143 = 4'hf == idx_4 ? entries_15_alreadyFlush : _GEN_142; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_4_T = ~_GEN_143; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_145 = 4'h1 == idx_4 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_146 = 4'h2 == idx_4 ? entries_2_valid : _GEN_145; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_147 = 4'h3 == idx_4 ? entries_3_valid : _GEN_146; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_148 = 4'h4 == idx_4 ? entries_4_valid : _GEN_147; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_149 = 4'h5 == idx_4 ? entries_5_valid : _GEN_148; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_150 = 4'h6 == idx_4 ? entries_6_valid : _GEN_149; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_151 = 4'h7 == idx_4 ? entries_7_valid : _GEN_150; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_152 = 4'h8 == idx_4 ? entries_8_valid : _GEN_151; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_153 = 4'h9 == idx_4 ? entries_9_valid : _GEN_152; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_154 = 4'ha == idx_4 ? entries_10_valid : _GEN_153; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_155 = 4'hb == idx_4 ? entries_11_valid : _GEN_154; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_156 = 4'hc == idx_4 ? entries_12_valid : _GEN_155; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_157 = 4'hd == idx_4 ? entries_13_valid : _GEN_156; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_158 = 4'he == idx_4 ? entries_14_valid : _GEN_157; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_159 = 4'hf == idx_4 ? entries_15_valid : _GEN_158; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_4 = _GEN_159 & ~_GEN_143; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_5 = deqPtr_value + 4'h5; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_161 = 4'h1 == idx_5 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_162 = 4'h2 == idx_5 ? entries_2_alreadyFlush : _GEN_161; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_163 = 4'h3 == idx_5 ? entries_3_alreadyFlush : _GEN_162; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_164 = 4'h4 == idx_5 ? entries_4_alreadyFlush : _GEN_163; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_165 = 4'h5 == idx_5 ? entries_5_alreadyFlush : _GEN_164; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_166 = 4'h6 == idx_5 ? entries_6_alreadyFlush : _GEN_165; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_167 = 4'h7 == idx_5 ? entries_7_alreadyFlush : _GEN_166; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_168 = 4'h8 == idx_5 ? entries_8_alreadyFlush : _GEN_167; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_169 = 4'h9 == idx_5 ? entries_9_alreadyFlush : _GEN_168; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_170 = 4'ha == idx_5 ? entries_10_alreadyFlush : _GEN_169; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_171 = 4'hb == idx_5 ? entries_11_alreadyFlush : _GEN_170; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_172 = 4'hc == idx_5 ? entries_12_alreadyFlush : _GEN_171; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_173 = 4'hd == idx_5 ? entries_13_alreadyFlush : _GEN_172; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_174 = 4'he == idx_5 ? entries_14_alreadyFlush : _GEN_173; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_175 = 4'hf == idx_5 ? entries_15_alreadyFlush : _GEN_174; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_5_T = ~_GEN_175; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_177 = 4'h1 == idx_5 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_178 = 4'h2 == idx_5 ? entries_2_valid : _GEN_177; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_179 = 4'h3 == idx_5 ? entries_3_valid : _GEN_178; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_180 = 4'h4 == idx_5 ? entries_4_valid : _GEN_179; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_181 = 4'h5 == idx_5 ? entries_5_valid : _GEN_180; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_182 = 4'h6 == idx_5 ? entries_6_valid : _GEN_181; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_183 = 4'h7 == idx_5 ? entries_7_valid : _GEN_182; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_184 = 4'h8 == idx_5 ? entries_8_valid : _GEN_183; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_185 = 4'h9 == idx_5 ? entries_9_valid : _GEN_184; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_186 = 4'ha == idx_5 ? entries_10_valid : _GEN_185; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_187 = 4'hb == idx_5 ? entries_11_valid : _GEN_186; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_188 = 4'hc == idx_5 ? entries_12_valid : _GEN_187; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_189 = 4'hd == idx_5 ? entries_13_valid : _GEN_188; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_190 = 4'he == idx_5 ? entries_14_valid : _GEN_189; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_191 = 4'hf == idx_5 ? entries_15_valid : _GEN_190; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_5 = _GEN_191 & ~_GEN_175; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_6 = deqPtr_value + 4'h6; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_193 = 4'h1 == idx_6 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_194 = 4'h2 == idx_6 ? entries_2_alreadyFlush : _GEN_193; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_195 = 4'h3 == idx_6 ? entries_3_alreadyFlush : _GEN_194; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_196 = 4'h4 == idx_6 ? entries_4_alreadyFlush : _GEN_195; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_197 = 4'h5 == idx_6 ? entries_5_alreadyFlush : _GEN_196; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_198 = 4'h6 == idx_6 ? entries_6_alreadyFlush : _GEN_197; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_199 = 4'h7 == idx_6 ? entries_7_alreadyFlush : _GEN_198; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_200 = 4'h8 == idx_6 ? entries_8_alreadyFlush : _GEN_199; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_201 = 4'h9 == idx_6 ? entries_9_alreadyFlush : _GEN_200; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_202 = 4'ha == idx_6 ? entries_10_alreadyFlush : _GEN_201; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_203 = 4'hb == idx_6 ? entries_11_alreadyFlush : _GEN_202; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_204 = 4'hc == idx_6 ? entries_12_alreadyFlush : _GEN_203; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_205 = 4'hd == idx_6 ? entries_13_alreadyFlush : _GEN_204; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_206 = 4'he == idx_6 ? entries_14_alreadyFlush : _GEN_205; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_207 = 4'hf == idx_6 ? entries_15_alreadyFlush : _GEN_206; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_6_T = ~_GEN_207; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_209 = 4'h1 == idx_6 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_210 = 4'h2 == idx_6 ? entries_2_valid : _GEN_209; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_211 = 4'h3 == idx_6 ? entries_3_valid : _GEN_210; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_212 = 4'h4 == idx_6 ? entries_4_valid : _GEN_211; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_213 = 4'h5 == idx_6 ? entries_5_valid : _GEN_212; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_214 = 4'h6 == idx_6 ? entries_6_valid : _GEN_213; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_215 = 4'h7 == idx_6 ? entries_7_valid : _GEN_214; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_216 = 4'h8 == idx_6 ? entries_8_valid : _GEN_215; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_217 = 4'h9 == idx_6 ? entries_9_valid : _GEN_216; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_218 = 4'ha == idx_6 ? entries_10_valid : _GEN_217; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_219 = 4'hb == idx_6 ? entries_11_valid : _GEN_218; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_220 = 4'hc == idx_6 ? entries_12_valid : _GEN_219; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_221 = 4'hd == idx_6 ? entries_13_valid : _GEN_220; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_222 = 4'he == idx_6 ? entries_14_valid : _GEN_221; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_223 = 4'hf == idx_6 ? entries_15_valid : _GEN_222; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_6 = _GEN_223 & ~_GEN_207; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_7 = deqPtr_value + 4'h7; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_225 = 4'h1 == idx_7 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_226 = 4'h2 == idx_7 ? entries_2_alreadyFlush : _GEN_225; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_227 = 4'h3 == idx_7 ? entries_3_alreadyFlush : _GEN_226; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_228 = 4'h4 == idx_7 ? entries_4_alreadyFlush : _GEN_227; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_229 = 4'h5 == idx_7 ? entries_5_alreadyFlush : _GEN_228; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_230 = 4'h6 == idx_7 ? entries_6_alreadyFlush : _GEN_229; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_231 = 4'h7 == idx_7 ? entries_7_alreadyFlush : _GEN_230; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_232 = 4'h8 == idx_7 ? entries_8_alreadyFlush : _GEN_231; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_233 = 4'h9 == idx_7 ? entries_9_alreadyFlush : _GEN_232; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_234 = 4'ha == idx_7 ? entries_10_alreadyFlush : _GEN_233; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_235 = 4'hb == idx_7 ? entries_11_alreadyFlush : _GEN_234; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_236 = 4'hc == idx_7 ? entries_12_alreadyFlush : _GEN_235; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_237 = 4'hd == idx_7 ? entries_13_alreadyFlush : _GEN_236; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_238 = 4'he == idx_7 ? entries_14_alreadyFlush : _GEN_237; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_239 = 4'hf == idx_7 ? entries_15_alreadyFlush : _GEN_238; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_7_T = ~_GEN_239; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_241 = 4'h1 == idx_7 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_242 = 4'h2 == idx_7 ? entries_2_valid : _GEN_241; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_243 = 4'h3 == idx_7 ? entries_3_valid : _GEN_242; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_244 = 4'h4 == idx_7 ? entries_4_valid : _GEN_243; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_245 = 4'h5 == idx_7 ? entries_5_valid : _GEN_244; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_246 = 4'h6 == idx_7 ? entries_6_valid : _GEN_245; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_247 = 4'h7 == idx_7 ? entries_7_valid : _GEN_246; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_248 = 4'h8 == idx_7 ? entries_8_valid : _GEN_247; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_249 = 4'h9 == idx_7 ? entries_9_valid : _GEN_248; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_250 = 4'ha == idx_7 ? entries_10_valid : _GEN_249; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_251 = 4'hb == idx_7 ? entries_11_valid : _GEN_250; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_252 = 4'hc == idx_7 ? entries_12_valid : _GEN_251; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_253 = 4'hd == idx_7 ? entries_13_valid : _GEN_252; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_254 = 4'he == idx_7 ? entries_14_valid : _GEN_253; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_255 = 4'hf == idx_7 ? entries_15_valid : _GEN_254; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_7 = _GEN_255 & ~_GEN_239; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_8 = deqPtr_value + 4'h8; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_257 = 4'h1 == idx_8 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_258 = 4'h2 == idx_8 ? entries_2_alreadyFlush : _GEN_257; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_259 = 4'h3 == idx_8 ? entries_3_alreadyFlush : _GEN_258; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_260 = 4'h4 == idx_8 ? entries_4_alreadyFlush : _GEN_259; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_261 = 4'h5 == idx_8 ? entries_5_alreadyFlush : _GEN_260; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_262 = 4'h6 == idx_8 ? entries_6_alreadyFlush : _GEN_261; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_263 = 4'h7 == idx_8 ? entries_7_alreadyFlush : _GEN_262; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_264 = 4'h8 == idx_8 ? entries_8_alreadyFlush : _GEN_263; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_265 = 4'h9 == idx_8 ? entries_9_alreadyFlush : _GEN_264; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_266 = 4'ha == idx_8 ? entries_10_alreadyFlush : _GEN_265; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_267 = 4'hb == idx_8 ? entries_11_alreadyFlush : _GEN_266; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_268 = 4'hc == idx_8 ? entries_12_alreadyFlush : _GEN_267; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_269 = 4'hd == idx_8 ? entries_13_alreadyFlush : _GEN_268; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_270 = 4'he == idx_8 ? entries_14_alreadyFlush : _GEN_269; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_271 = 4'hf == idx_8 ? entries_15_alreadyFlush : _GEN_270; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_8_T = ~_GEN_271; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_273 = 4'h1 == idx_8 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_274 = 4'h2 == idx_8 ? entries_2_valid : _GEN_273; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_275 = 4'h3 == idx_8 ? entries_3_valid : _GEN_274; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_276 = 4'h4 == idx_8 ? entries_4_valid : _GEN_275; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_277 = 4'h5 == idx_8 ? entries_5_valid : _GEN_276; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_278 = 4'h6 == idx_8 ? entries_6_valid : _GEN_277; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_279 = 4'h7 == idx_8 ? entries_7_valid : _GEN_278; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_280 = 4'h8 == idx_8 ? entries_8_valid : _GEN_279; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_281 = 4'h9 == idx_8 ? entries_9_valid : _GEN_280; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_282 = 4'ha == idx_8 ? entries_10_valid : _GEN_281; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_283 = 4'hb == idx_8 ? entries_11_valid : _GEN_282; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_284 = 4'hc == idx_8 ? entries_12_valid : _GEN_283; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_285 = 4'hd == idx_8 ? entries_13_valid : _GEN_284; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_286 = 4'he == idx_8 ? entries_14_valid : _GEN_285; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_287 = 4'hf == idx_8 ? entries_15_valid : _GEN_286; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_8 = _GEN_287 & ~_GEN_271; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_9 = deqPtr_value + 4'h9; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_289 = 4'h1 == idx_9 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_290 = 4'h2 == idx_9 ? entries_2_alreadyFlush : _GEN_289; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_291 = 4'h3 == idx_9 ? entries_3_alreadyFlush : _GEN_290; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_292 = 4'h4 == idx_9 ? entries_4_alreadyFlush : _GEN_291; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_293 = 4'h5 == idx_9 ? entries_5_alreadyFlush : _GEN_292; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_294 = 4'h6 == idx_9 ? entries_6_alreadyFlush : _GEN_293; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_295 = 4'h7 == idx_9 ? entries_7_alreadyFlush : _GEN_294; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_296 = 4'h8 == idx_9 ? entries_8_alreadyFlush : _GEN_295; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_297 = 4'h9 == idx_9 ? entries_9_alreadyFlush : _GEN_296; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_298 = 4'ha == idx_9 ? entries_10_alreadyFlush : _GEN_297; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_299 = 4'hb == idx_9 ? entries_11_alreadyFlush : _GEN_298; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_300 = 4'hc == idx_9 ? entries_12_alreadyFlush : _GEN_299; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_301 = 4'hd == idx_9 ? entries_13_alreadyFlush : _GEN_300; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_302 = 4'he == idx_9 ? entries_14_alreadyFlush : _GEN_301; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_303 = 4'hf == idx_9 ? entries_15_alreadyFlush : _GEN_302; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_9_T = ~_GEN_303; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_305 = 4'h1 == idx_9 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_306 = 4'h2 == idx_9 ? entries_2_valid : _GEN_305; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_307 = 4'h3 == idx_9 ? entries_3_valid : _GEN_306; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_308 = 4'h4 == idx_9 ? entries_4_valid : _GEN_307; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_309 = 4'h5 == idx_9 ? entries_5_valid : _GEN_308; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_310 = 4'h6 == idx_9 ? entries_6_valid : _GEN_309; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_311 = 4'h7 == idx_9 ? entries_7_valid : _GEN_310; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_312 = 4'h8 == idx_9 ? entries_8_valid : _GEN_311; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_313 = 4'h9 == idx_9 ? entries_9_valid : _GEN_312; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_314 = 4'ha == idx_9 ? entries_10_valid : _GEN_313; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_315 = 4'hb == idx_9 ? entries_11_valid : _GEN_314; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_316 = 4'hc == idx_9 ? entries_12_valid : _GEN_315; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_317 = 4'hd == idx_9 ? entries_13_valid : _GEN_316; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_318 = 4'he == idx_9 ? entries_14_valid : _GEN_317; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_319 = 4'hf == idx_9 ? entries_15_valid : _GEN_318; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_9 = _GEN_319 & ~_GEN_303; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_10 = deqPtr_value + 4'ha; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_321 = 4'h1 == idx_10 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_322 = 4'h2 == idx_10 ? entries_2_alreadyFlush : _GEN_321; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_323 = 4'h3 == idx_10 ? entries_3_alreadyFlush : _GEN_322; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_324 = 4'h4 == idx_10 ? entries_4_alreadyFlush : _GEN_323; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_325 = 4'h5 == idx_10 ? entries_5_alreadyFlush : _GEN_324; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_326 = 4'h6 == idx_10 ? entries_6_alreadyFlush : _GEN_325; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_327 = 4'h7 == idx_10 ? entries_7_alreadyFlush : _GEN_326; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_328 = 4'h8 == idx_10 ? entries_8_alreadyFlush : _GEN_327; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_329 = 4'h9 == idx_10 ? entries_9_alreadyFlush : _GEN_328; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_330 = 4'ha == idx_10 ? entries_10_alreadyFlush : _GEN_329; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_331 = 4'hb == idx_10 ? entries_11_alreadyFlush : _GEN_330; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_332 = 4'hc == idx_10 ? entries_12_alreadyFlush : _GEN_331; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_333 = 4'hd == idx_10 ? entries_13_alreadyFlush : _GEN_332; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_334 = 4'he == idx_10 ? entries_14_alreadyFlush : _GEN_333; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_335 = 4'hf == idx_10 ? entries_15_alreadyFlush : _GEN_334; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_10_T = ~_GEN_335; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_337 = 4'h1 == idx_10 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_338 = 4'h2 == idx_10 ? entries_2_valid : _GEN_337; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_339 = 4'h3 == idx_10 ? entries_3_valid : _GEN_338; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_340 = 4'h4 == idx_10 ? entries_4_valid : _GEN_339; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_341 = 4'h5 == idx_10 ? entries_5_valid : _GEN_340; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_342 = 4'h6 == idx_10 ? entries_6_valid : _GEN_341; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_343 = 4'h7 == idx_10 ? entries_7_valid : _GEN_342; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_344 = 4'h8 == idx_10 ? entries_8_valid : _GEN_343; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_345 = 4'h9 == idx_10 ? entries_9_valid : _GEN_344; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_346 = 4'ha == idx_10 ? entries_10_valid : _GEN_345; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_347 = 4'hb == idx_10 ? entries_11_valid : _GEN_346; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_348 = 4'hc == idx_10 ? entries_12_valid : _GEN_347; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_349 = 4'hd == idx_10 ? entries_13_valid : _GEN_348; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_350 = 4'he == idx_10 ? entries_14_valid : _GEN_349; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_351 = 4'hf == idx_10 ? entries_15_valid : _GEN_350; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_10 = _GEN_351 & ~_GEN_335; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_11 = deqPtr_value + 4'hb; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_353 = 4'h1 == idx_11 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_354 = 4'h2 == idx_11 ? entries_2_alreadyFlush : _GEN_353; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_355 = 4'h3 == idx_11 ? entries_3_alreadyFlush : _GEN_354; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_356 = 4'h4 == idx_11 ? entries_4_alreadyFlush : _GEN_355; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_357 = 4'h5 == idx_11 ? entries_5_alreadyFlush : _GEN_356; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_358 = 4'h6 == idx_11 ? entries_6_alreadyFlush : _GEN_357; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_359 = 4'h7 == idx_11 ? entries_7_alreadyFlush : _GEN_358; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_360 = 4'h8 == idx_11 ? entries_8_alreadyFlush : _GEN_359; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_361 = 4'h9 == idx_11 ? entries_9_alreadyFlush : _GEN_360; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_362 = 4'ha == idx_11 ? entries_10_alreadyFlush : _GEN_361; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_363 = 4'hb == idx_11 ? entries_11_alreadyFlush : _GEN_362; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_364 = 4'hc == idx_11 ? entries_12_alreadyFlush : _GEN_363; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_365 = 4'hd == idx_11 ? entries_13_alreadyFlush : _GEN_364; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_366 = 4'he == idx_11 ? entries_14_alreadyFlush : _GEN_365; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_367 = 4'hf == idx_11 ? entries_15_alreadyFlush : _GEN_366; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_11_T = ~_GEN_367; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_369 = 4'h1 == idx_11 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_370 = 4'h2 == idx_11 ? entries_2_valid : _GEN_369; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_371 = 4'h3 == idx_11 ? entries_3_valid : _GEN_370; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_372 = 4'h4 == idx_11 ? entries_4_valid : _GEN_371; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_373 = 4'h5 == idx_11 ? entries_5_valid : _GEN_372; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_374 = 4'h6 == idx_11 ? entries_6_valid : _GEN_373; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_375 = 4'h7 == idx_11 ? entries_7_valid : _GEN_374; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_376 = 4'h8 == idx_11 ? entries_8_valid : _GEN_375; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_377 = 4'h9 == idx_11 ? entries_9_valid : _GEN_376; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_378 = 4'ha == idx_11 ? entries_10_valid : _GEN_377; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_379 = 4'hb == idx_11 ? entries_11_valid : _GEN_378; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_380 = 4'hc == idx_11 ? entries_12_valid : _GEN_379; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_381 = 4'hd == idx_11 ? entries_13_valid : _GEN_380; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_382 = 4'he == idx_11 ? entries_14_valid : _GEN_381; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_383 = 4'hf == idx_11 ? entries_15_valid : _GEN_382; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_11 = _GEN_383 & ~_GEN_367; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_12 = deqPtr_value + 4'hc; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_385 = 4'h1 == idx_12 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_386 = 4'h2 == idx_12 ? entries_2_alreadyFlush : _GEN_385; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_387 = 4'h3 == idx_12 ? entries_3_alreadyFlush : _GEN_386; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_388 = 4'h4 == idx_12 ? entries_4_alreadyFlush : _GEN_387; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_389 = 4'h5 == idx_12 ? entries_5_alreadyFlush : _GEN_388; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_390 = 4'h6 == idx_12 ? entries_6_alreadyFlush : _GEN_389; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_391 = 4'h7 == idx_12 ? entries_7_alreadyFlush : _GEN_390; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_392 = 4'h8 == idx_12 ? entries_8_alreadyFlush : _GEN_391; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_393 = 4'h9 == idx_12 ? entries_9_alreadyFlush : _GEN_392; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_394 = 4'ha == idx_12 ? entries_10_alreadyFlush : _GEN_393; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_395 = 4'hb == idx_12 ? entries_11_alreadyFlush : _GEN_394; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_396 = 4'hc == idx_12 ? entries_12_alreadyFlush : _GEN_395; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_397 = 4'hd == idx_12 ? entries_13_alreadyFlush : _GEN_396; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_398 = 4'he == idx_12 ? entries_14_alreadyFlush : _GEN_397; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_399 = 4'hf == idx_12 ? entries_15_alreadyFlush : _GEN_398; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_12_T = ~_GEN_399; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_401 = 4'h1 == idx_12 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_402 = 4'h2 == idx_12 ? entries_2_valid : _GEN_401; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_403 = 4'h3 == idx_12 ? entries_3_valid : _GEN_402; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_404 = 4'h4 == idx_12 ? entries_4_valid : _GEN_403; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_405 = 4'h5 == idx_12 ? entries_5_valid : _GEN_404; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_406 = 4'h6 == idx_12 ? entries_6_valid : _GEN_405; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_407 = 4'h7 == idx_12 ? entries_7_valid : _GEN_406; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_408 = 4'h8 == idx_12 ? entries_8_valid : _GEN_407; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_409 = 4'h9 == idx_12 ? entries_9_valid : _GEN_408; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_410 = 4'ha == idx_12 ? entries_10_valid : _GEN_409; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_411 = 4'hb == idx_12 ? entries_11_valid : _GEN_410; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_412 = 4'hc == idx_12 ? entries_12_valid : _GEN_411; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_413 = 4'hd == idx_12 ? entries_13_valid : _GEN_412; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_414 = 4'he == idx_12 ? entries_14_valid : _GEN_413; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_415 = 4'hf == idx_12 ? entries_15_valid : _GEN_414; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_12 = _GEN_415 & ~_GEN_399; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_13 = deqPtr_value + 4'hd; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_417 = 4'h1 == idx_13 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_418 = 4'h2 == idx_13 ? entries_2_alreadyFlush : _GEN_417; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_419 = 4'h3 == idx_13 ? entries_3_alreadyFlush : _GEN_418; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_420 = 4'h4 == idx_13 ? entries_4_alreadyFlush : _GEN_419; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_421 = 4'h5 == idx_13 ? entries_5_alreadyFlush : _GEN_420; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_422 = 4'h6 == idx_13 ? entries_6_alreadyFlush : _GEN_421; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_423 = 4'h7 == idx_13 ? entries_7_alreadyFlush : _GEN_422; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_424 = 4'h8 == idx_13 ? entries_8_alreadyFlush : _GEN_423; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_425 = 4'h9 == idx_13 ? entries_9_alreadyFlush : _GEN_424; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_426 = 4'ha == idx_13 ? entries_10_alreadyFlush : _GEN_425; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_427 = 4'hb == idx_13 ? entries_11_alreadyFlush : _GEN_426; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_428 = 4'hc == idx_13 ? entries_12_alreadyFlush : _GEN_427; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_429 = 4'hd == idx_13 ? entries_13_alreadyFlush : _GEN_428; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_430 = 4'he == idx_13 ? entries_14_alreadyFlush : _GEN_429; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_431 = 4'hf == idx_13 ? entries_15_alreadyFlush : _GEN_430; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_13_T = ~_GEN_431; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_433 = 4'h1 == idx_13 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_434 = 4'h2 == idx_13 ? entries_2_valid : _GEN_433; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_435 = 4'h3 == idx_13 ? entries_3_valid : _GEN_434; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_436 = 4'h4 == idx_13 ? entries_4_valid : _GEN_435; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_437 = 4'h5 == idx_13 ? entries_5_valid : _GEN_436; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_438 = 4'h6 == idx_13 ? entries_6_valid : _GEN_437; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_439 = 4'h7 == idx_13 ? entries_7_valid : _GEN_438; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_440 = 4'h8 == idx_13 ? entries_8_valid : _GEN_439; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_441 = 4'h9 == idx_13 ? entries_9_valid : _GEN_440; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_442 = 4'ha == idx_13 ? entries_10_valid : _GEN_441; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_443 = 4'hb == idx_13 ? entries_11_valid : _GEN_442; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_444 = 4'hc == idx_13 ? entries_12_valid : _GEN_443; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_445 = 4'hd == idx_13 ? entries_13_valid : _GEN_444; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_446 = 4'he == idx_13 ? entries_14_valid : _GEN_445; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_447 = 4'hf == idx_13 ? entries_15_valid : _GEN_446; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_13 = _GEN_447 & ~_GEN_431; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_14 = deqPtr_value + 4'he; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_449 = 4'h1 == idx_14 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_450 = 4'h2 == idx_14 ? entries_2_alreadyFlush : _GEN_449; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_451 = 4'h3 == idx_14 ? entries_3_alreadyFlush : _GEN_450; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_452 = 4'h4 == idx_14 ? entries_4_alreadyFlush : _GEN_451; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_453 = 4'h5 == idx_14 ? entries_5_alreadyFlush : _GEN_452; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_454 = 4'h6 == idx_14 ? entries_6_alreadyFlush : _GEN_453; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_455 = 4'h7 == idx_14 ? entries_7_alreadyFlush : _GEN_454; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_456 = 4'h8 == idx_14 ? entries_8_alreadyFlush : _GEN_455; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_457 = 4'h9 == idx_14 ? entries_9_alreadyFlush : _GEN_456; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_458 = 4'ha == idx_14 ? entries_10_alreadyFlush : _GEN_457; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_459 = 4'hb == idx_14 ? entries_11_alreadyFlush : _GEN_458; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_460 = 4'hc == idx_14 ? entries_12_alreadyFlush : _GEN_459; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_461 = 4'hd == idx_14 ? entries_13_alreadyFlush : _GEN_460; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_462 = 4'he == idx_14 ? entries_14_alreadyFlush : _GEN_461; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_463 = 4'hf == idx_14 ? entries_15_alreadyFlush : _GEN_462; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_14_T = ~_GEN_463; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_465 = 4'h1 == idx_14 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_466 = 4'h2 == idx_14 ? entries_2_valid : _GEN_465; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_467 = 4'h3 == idx_14 ? entries_3_valid : _GEN_466; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_468 = 4'h4 == idx_14 ? entries_4_valid : _GEN_467; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_469 = 4'h5 == idx_14 ? entries_5_valid : _GEN_468; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_470 = 4'h6 == idx_14 ? entries_6_valid : _GEN_469; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_471 = 4'h7 == idx_14 ? entries_7_valid : _GEN_470; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_472 = 4'h8 == idx_14 ? entries_8_valid : _GEN_471; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_473 = 4'h9 == idx_14 ? entries_9_valid : _GEN_472; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_474 = 4'ha == idx_14 ? entries_10_valid : _GEN_473; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_475 = 4'hb == idx_14 ? entries_11_valid : _GEN_474; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_476 = 4'hc == idx_14 ? entries_12_valid : _GEN_475; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_477 = 4'hd == idx_14 ? entries_13_valid : _GEN_476; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_478 = 4'he == idx_14 ? entries_14_valid : _GEN_477; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_479 = 4'hf == idx_14 ? entries_15_valid : _GEN_478; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_14 = _GEN_479 & ~_GEN_463; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire [3:0] idx_15 = deqPtr_value + 4'hf; // @[src/main/scala/memory/StoreQueue.scala 143:27]
  wire  _GEN_481 = 4'h1 == idx_15 ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_482 = 4'h2 == idx_15 ? entries_2_alreadyFlush : _GEN_481; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_483 = 4'h3 == idx_15 ? entries_3_alreadyFlush : _GEN_482; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_484 = 4'h4 == idx_15 ? entries_4_alreadyFlush : _GEN_483; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_485 = 4'h5 == idx_15 ? entries_5_alreadyFlush : _GEN_484; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_486 = 4'h6 == idx_15 ? entries_6_alreadyFlush : _GEN_485; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_487 = 4'h7 == idx_15 ? entries_7_alreadyFlush : _GEN_486; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_488 = 4'h8 == idx_15 ? entries_8_alreadyFlush : _GEN_487; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_489 = 4'h9 == idx_15 ? entries_9_alreadyFlush : _GEN_488; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_490 = 4'ha == idx_15 ? entries_10_alreadyFlush : _GEN_489; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_491 = 4'hb == idx_15 ? entries_11_alreadyFlush : _GEN_490; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_492 = 4'hc == idx_15 ? entries_12_alreadyFlush : _GEN_491; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_493 = 4'hd == idx_15 ? entries_13_alreadyFlush : _GEN_492; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_494 = 4'he == idx_15 ? entries_14_alreadyFlush : _GEN_493; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _GEN_495 = 4'hf == idx_15 ? entries_15_alreadyFlush : _GEN_494; // @[src/main/scala/memory/StoreQueue.scala 145:{37,37}]
  wire  _activeCandidates_15_T = ~_GEN_495; // @[src/main/scala/memory/StoreQueue.scala 145:37]
  wire  _GEN_497 = 4'h1 == idx_15 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_498 = 4'h2 == idx_15 ? entries_2_valid : _GEN_497; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_499 = 4'h3 == idx_15 ? entries_3_valid : _GEN_498; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_500 = 4'h4 == idx_15 ? entries_4_valid : _GEN_499; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_501 = 4'h5 == idx_15 ? entries_5_valid : _GEN_500; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_502 = 4'h6 == idx_15 ? entries_6_valid : _GEN_501; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_503 = 4'h7 == idx_15 ? entries_7_valid : _GEN_502; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_504 = 4'h8 == idx_15 ? entries_8_valid : _GEN_503; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_505 = 4'h9 == idx_15 ? entries_9_valid : _GEN_504; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_506 = 4'ha == idx_15 ? entries_10_valid : _GEN_505; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_507 = 4'hb == idx_15 ? entries_11_valid : _GEN_506; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_508 = 4'hc == idx_15 ? entries_12_valid : _GEN_507; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_509 = 4'hd == idx_15 ? entries_13_valid : _GEN_508; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_510 = 4'he == idx_15 ? entries_14_valid : _GEN_509; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  _GEN_511 = 4'hf == idx_15 ? entries_15_valid : _GEN_510; // @[src/main/scala/memory/StoreQueue.scala 145:{34,34}]
  wire  activeCandidates_15 = _GEN_511 & ~_GEN_495; // @[src/main/scala/memory/StoreQueue.scala 145:34]
  wire  hasActiveStore = activeCandidates_0 | activeCandidates_1 | activeCandidates_2 | activeCandidates_3 |
    activeCandidates_4 | activeCandidates_5 | activeCandidates_6 | activeCandidates_7 | activeCandidates_8 |
    activeCandidates_9 | activeCandidates_10 | activeCandidates_11 | activeCandidates_12 | activeCandidates_13 |
    activeCandidates_14 | activeCandidates_15; // @[src/main/scala/memory/StoreQueue.scala 148:48]
  wire [3:0] _activeOffset_T = activeCandidates_14 ? 4'he : 4'hf; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_1 = activeCandidates_13 ? 4'hd : _activeOffset_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_2 = activeCandidates_12 ? 4'hc : _activeOffset_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_3 = activeCandidates_11 ? 4'hb : _activeOffset_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_4 = activeCandidates_10 ? 4'ha : _activeOffset_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_5 = activeCandidates_9 ? 4'h9 : _activeOffset_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_6 = activeCandidates_8 ? 4'h8 : _activeOffset_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_7 = activeCandidates_7 ? 4'h7 : _activeOffset_T_6; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_8 = activeCandidates_6 ? 4'h6 : _activeOffset_T_7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_9 = activeCandidates_5 ? 4'h5 : _activeOffset_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_10 = activeCandidates_4 ? 4'h4 : _activeOffset_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_11 = activeCandidates_3 ? 4'h3 : _activeOffset_T_10; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_12 = activeCandidates_2 ? 4'h2 : _activeOffset_T_11; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _activeOffset_T_13 = activeCandidates_1 ? 4'h1 : _activeOffset_T_12; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] activeOffset = activeCandidates_0 ? 4'h0 : _activeOffset_T_13; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] activeIdx = deqPtr_value + activeOffset; // @[src/main/scala/memory/StoreQueue.scala 150:36]
  wire [5:0] _GEN_514 = 4'h1 == activeIdx ? entries_1_robIdxFull_value : entries_0_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_515 = 4'h1 == activeIdx ? entries_1_robIdxFull_flag : entries_0_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_516 = 4'h2 == activeIdx ? entries_2_robIdxFull_value : _GEN_514; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_517 = 4'h2 == activeIdx ? entries_2_robIdxFull_flag : _GEN_515; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_518 = 4'h3 == activeIdx ? entries_3_robIdxFull_value : _GEN_516; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_519 = 4'h3 == activeIdx ? entries_3_robIdxFull_flag : _GEN_517; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_520 = 4'h4 == activeIdx ? entries_4_robIdxFull_value : _GEN_518; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_521 = 4'h4 == activeIdx ? entries_4_robIdxFull_flag : _GEN_519; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_522 = 4'h5 == activeIdx ? entries_5_robIdxFull_value : _GEN_520; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_523 = 4'h5 == activeIdx ? entries_5_robIdxFull_flag : _GEN_521; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_524 = 4'h6 == activeIdx ? entries_6_robIdxFull_value : _GEN_522; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_525 = 4'h6 == activeIdx ? entries_6_robIdxFull_flag : _GEN_523; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_526 = 4'h7 == activeIdx ? entries_7_robIdxFull_value : _GEN_524; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_527 = 4'h7 == activeIdx ? entries_7_robIdxFull_flag : _GEN_525; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_528 = 4'h8 == activeIdx ? entries_8_robIdxFull_value : _GEN_526; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_529 = 4'h8 == activeIdx ? entries_8_robIdxFull_flag : _GEN_527; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_530 = 4'h9 == activeIdx ? entries_9_robIdxFull_value : _GEN_528; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_531 = 4'h9 == activeIdx ? entries_9_robIdxFull_flag : _GEN_529; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_532 = 4'ha == activeIdx ? entries_10_robIdxFull_value : _GEN_530; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_533 = 4'ha == activeIdx ? entries_10_robIdxFull_flag : _GEN_531; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_534 = 4'hb == activeIdx ? entries_11_robIdxFull_value : _GEN_532; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_535 = 4'hb == activeIdx ? entries_11_robIdxFull_flag : _GEN_533; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_536 = 4'hc == activeIdx ? entries_12_robIdxFull_value : _GEN_534; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_537 = 4'hc == activeIdx ? entries_12_robIdxFull_flag : _GEN_535; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_538 = 4'hd == activeIdx ? entries_13_robIdxFull_value : _GEN_536; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_539 = 4'hd == activeIdx ? entries_13_robIdxFull_flag : _GEN_537; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_540 = 4'he == activeIdx ? entries_14_robIdxFull_value : _GEN_538; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_541 = 4'he == activeIdx ? entries_14_robIdxFull_flag : _GEN_539; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire [5:0] _GEN_542 = 4'hf == activeIdx ? entries_15_robIdxFull_value : _GEN_540; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  _GEN_543 = 4'hf == activeIdx ? entries_15_robIdxFull_flag : _GEN_541; // @[src/main/scala/memory/StoreQueue.scala 156:{23,23}]
  wire  enqFire = io_enq_valid & ~full; // @[src/main/scala/memory/StoreQueue.scala 163:30]
  wire  _GEN_592 = 4'h0 == enqPtr_value | entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_593 = 4'h1 == enqPtr_value | entries_1_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_594 = 4'h2 == enqPtr_value | entries_2_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_595 = 4'h3 == enqPtr_value | entries_3_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_596 = 4'h4 == enqPtr_value | entries_4_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_597 = 4'h5 == enqPtr_value | entries_5_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_598 = 4'h6 == enqPtr_value | entries_6_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_599 = 4'h7 == enqPtr_value | entries_7_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_600 = 4'h8 == enqPtr_value | entries_8_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_601 = 4'h9 == enqPtr_value | entries_9_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_602 = 4'ha == enqPtr_value | entries_10_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_603 = 4'hb == enqPtr_value | entries_11_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_604 = 4'hc == enqPtr_value | entries_12_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_605 = 4'hd == enqPtr_value | entries_13_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_606 = 4'he == enqPtr_value | entries_14_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_607 = 4'hf == enqPtr_value | entries_15_valid; // @[src/main/scala/memory/StoreQueue.scala 114:24 169:{31,31}]
  wire  _GEN_608 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_609 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_610 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_611 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_612 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_613 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_614 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_615 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_616 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_617 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_618 = 4'ha == enqPtr_value ? 1'h0 : entries_10_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_619 = 4'hb == enqPtr_value ? 1'h0 : entries_11_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_620 = 4'hc == enqPtr_value ? 1'h0 : entries_12_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_621 = 4'hd == enqPtr_value ? 1'h0 : entries_13_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_622 = 4'he == enqPtr_value ? 1'h0 : entries_14_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_623 = 4'hf == enqPtr_value ? 1'h0 : entries_15_addrValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 170:{31,31}]
  wire  _GEN_624 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_625 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_626 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_627 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_628 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_629 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_630 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_631 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_632 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_633 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_634 = 4'ha == enqPtr_value ? 1'h0 : entries_10_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_635 = 4'hb == enqPtr_value ? 1'h0 : entries_11_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_636 = 4'hc == enqPtr_value ? 1'h0 : entries_12_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_637 = 4'hd == enqPtr_value ? 1'h0 : entries_13_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_638 = 4'he == enqPtr_value ? 1'h0 : entries_14_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_639 = 4'hf == enqPtr_value ? 1'h0 : entries_15_dataValid; // @[src/main/scala/memory/StoreQueue.scala 114:24 171:{31,31}]
  wire  _GEN_640 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_641 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_642 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_643 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_644 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_645 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_646 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_647 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_648 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_649 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_650 = 4'ha == enqPtr_value ? 1'h0 : entries_10_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_651 = 4'hb == enqPtr_value ? 1'h0 : entries_11_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_652 = 4'hc == enqPtr_value ? 1'h0 : entries_12_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_653 = 4'hd == enqPtr_value ? 1'h0 : entries_13_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_654 = 4'he == enqPtr_value ? 1'h0 : entries_14_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_655 = 4'hf == enqPtr_value ? 1'h0 : entries_15_committed; // @[src/main/scala/memory/StoreQueue.scala 114:24 174:{31,31}]
  wire  _GEN_656 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_657 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_658 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_659 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_660 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_661 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_662 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_663 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_664 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_665 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_666 = 4'ha == enqPtr_value ? 1'h0 : entries_10_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_667 = 4'hb == enqPtr_value ? 1'h0 : entries_11_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_668 = 4'hc == enqPtr_value ? 1'h0 : entries_12_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_669 = 4'hd == enqPtr_value ? 1'h0 : entries_13_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_670 = 4'he == enqPtr_value ? 1'h0 : entries_14_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_671 = 4'hf == enqPtr_value ? 1'h0 : entries_15_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 114:24 175:{31,31}]
  wire  _GEN_672 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_673 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_674 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_675 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_676 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_677 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_678 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_679 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_680 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_681 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_682 = 4'ha == enqPtr_value ? 1'h0 : entries_10_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_683 = 4'hb == enqPtr_value ? 1'h0 : entries_11_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_684 = 4'hc == enqPtr_value ? 1'h0 : entries_12_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_685 = 4'hd == enqPtr_value ? 1'h0 : entries_13_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_686 = 4'he == enqPtr_value ? 1'h0 : entries_14_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_687 = 4'hf == enqPtr_value ? 1'h0 : entries_15_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 114:24 176:{31,31}]
  wire  _GEN_688 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_689 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_690 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_691 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_692 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_693 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_694 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_695 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_696 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_697 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_698 = 4'ha == enqPtr_value ? 1'h0 : entries_10_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_699 = 4'hb == enqPtr_value ? 1'h0 : entries_11_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_700 = 4'hc == enqPtr_value ? 1'h0 : entries_12_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_701 = 4'hd == enqPtr_value ? 1'h0 : entries_13_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_702 = 4'he == enqPtr_value ? 1'h0 : entries_14_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_703 = 4'hf == enqPtr_value ? 1'h0 : entries_15_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 114:24 177:{30,30}]
  wire  _GEN_704 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_705 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_706 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_707 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_708 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_709 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_710 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_711 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_712 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_713 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_714 = 4'ha == enqPtr_value ? 1'h0 : entries_10_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_715 = 4'hb == enqPtr_value ? 1'h0 : entries_11_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_716 = 4'hc == enqPtr_value ? 1'h0 : entries_12_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_717 = 4'hd == enqPtr_value ? 1'h0 : entries_13_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_718 = 4'he == enqPtr_value ? 1'h0 : entries_14_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire  _GEN_719 = 4'hf == enqPtr_value ? 1'h0 : entries_15_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 114:24 178:{31,31}]
  wire [31:0] _GEN_720 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_721 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_722 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_723 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_724 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_725 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_726 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_727 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_728 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_729 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_730 = 4'ha == enqPtr_value ? 32'h0 : entries_10_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_731 = 4'hb == enqPtr_value ? 32'h0 : entries_11_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_732 = 4'hc == enqPtr_value ? 32'h0 : entries_12_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_733 = 4'hd == enqPtr_value ? 32'h0 : entries_13_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_734 = 4'he == enqPtr_value ? 32'h0 : entries_14_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_735 = 4'hf == enqPtr_value ? 32'h0 : entries_15_vaddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 179:{31,31}]
  wire [31:0] _GEN_736 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_737 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_738 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_739 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_740 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_741 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_742 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_743 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_744 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_745 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_746 = 4'ha == enqPtr_value ? 32'h0 : entries_10_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_747 = 4'hb == enqPtr_value ? 32'h0 : entries_11_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_748 = 4'hc == enqPtr_value ? 32'h0 : entries_12_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_749 = 4'hd == enqPtr_value ? 32'h0 : entries_13_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_750 = 4'he == enqPtr_value ? 32'h0 : entries_14_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_751 = 4'hf == enqPtr_value ? 32'h0 : entries_15_paddr; // @[src/main/scala/memory/StoreQueue.scala 114:24 180:{31,31}]
  wire [31:0] _GEN_752 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_753 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_754 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_755 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_756 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_757 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_758 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_759 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_760 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_761 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_762 = 4'ha == enqPtr_value ? 32'h0 : entries_10_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_763 = 4'hb == enqPtr_value ? 32'h0 : entries_11_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_764 = 4'hc == enqPtr_value ? 32'h0 : entries_12_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_765 = 4'hd == enqPtr_value ? 32'h0 : entries_13_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_766 = 4'he == enqPtr_value ? 32'h0 : entries_14_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [31:0] _GEN_767 = 4'hf == enqPtr_value ? 32'h0 : entries_15_data; // @[src/main/scala/memory/StoreQueue.scala 114:24 181:{31,31}]
  wire [16:0] _GEN_768 = 4'h0 == enqPtr_value ? 17'h0 : entries_0_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_769 = 4'h1 == enqPtr_value ? 17'h0 : entries_1_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_770 = 4'h2 == enqPtr_value ? 17'h0 : entries_2_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_771 = 4'h3 == enqPtr_value ? 17'h0 : entries_3_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_772 = 4'h4 == enqPtr_value ? 17'h0 : entries_4_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_773 = 4'h5 == enqPtr_value ? 17'h0 : entries_5_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_774 = 4'h6 == enqPtr_value ? 17'h0 : entries_6_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_775 = 4'h7 == enqPtr_value ? 17'h0 : entries_7_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_776 = 4'h8 == enqPtr_value ? 17'h0 : entries_8_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_777 = 4'h9 == enqPtr_value ? 17'h0 : entries_9_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_778 = 4'ha == enqPtr_value ? 17'h0 : entries_10_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_779 = 4'hb == enqPtr_value ? 17'h0 : entries_11_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_780 = 4'hc == enqPtr_value ? 17'h0 : entries_12_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_781 = 4'hd == enqPtr_value ? 17'h0 : entries_13_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_782 = 4'he == enqPtr_value ? 17'h0 : entries_14_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire [16:0] _GEN_783 = 4'hf == enqPtr_value ? 17'h0 : entries_15_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 114:24 182:{28,28}]
  wire  _GEN_784 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_785 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_786 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_787 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_788 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_789 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_790 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_791 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_792 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_793 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_794 = 4'ha == enqPtr_value ? 1'h0 : entries_10_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_795 = 4'hb == enqPtr_value ? 1'h0 : entries_11_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_796 = 4'hc == enqPtr_value ? 1'h0 : entries_12_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_797 = 4'hd == enqPtr_value ? 1'h0 : entries_13_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_798 = 4'he == enqPtr_value ? 1'h0 : entries_14_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire  _GEN_799 = 4'hf == enqPtr_value ? 1'h0 : entries_15_cacheable; // @[src/main/scala/memory/StoreQueue.scala 114:24 183:{31,31}]
  wire [4:0] enqPtr_newIncValue = enqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  enqPtr_wrap = enqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] enqPtr_newPtr_value = enqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  _GEN_928 = enqFire ? _GEN_592 : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_929 = enqFire ? _GEN_593 : entries_1_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_930 = enqFire ? _GEN_594 : entries_2_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_931 = enqFire ? _GEN_595 : entries_3_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_932 = enqFire ? _GEN_596 : entries_4_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_933 = enqFire ? _GEN_597 : entries_5_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_934 = enqFire ? _GEN_598 : entries_6_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_935 = enqFire ? _GEN_599 : entries_7_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_936 = enqFire ? _GEN_600 : entries_8_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_937 = enqFire ? _GEN_601 : entries_9_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_938 = enqFire ? _GEN_602 : entries_10_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_939 = enqFire ? _GEN_603 : entries_11_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_940 = enqFire ? _GEN_604 : entries_12_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_941 = enqFire ? _GEN_605 : entries_13_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_942 = enqFire ? _GEN_606 : entries_14_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_943 = enqFire ? _GEN_607 : entries_15_valid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_944 = enqFire ? _GEN_608 : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_945 = enqFire ? _GEN_609 : entries_1_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_946 = enqFire ? _GEN_610 : entries_2_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_947 = enqFire ? _GEN_611 : entries_3_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_948 = enqFire ? _GEN_612 : entries_4_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_949 = enqFire ? _GEN_613 : entries_5_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_950 = enqFire ? _GEN_614 : entries_6_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_951 = enqFire ? _GEN_615 : entries_7_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_952 = enqFire ? _GEN_616 : entries_8_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_953 = enqFire ? _GEN_617 : entries_9_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_954 = enqFire ? _GEN_618 : entries_10_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_955 = enqFire ? _GEN_619 : entries_11_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_956 = enqFire ? _GEN_620 : entries_12_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_957 = enqFire ? _GEN_621 : entries_13_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_958 = enqFire ? _GEN_622 : entries_14_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_959 = enqFire ? _GEN_623 : entries_15_addrValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_960 = enqFire ? _GEN_624 : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_961 = enqFire ? _GEN_625 : entries_1_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_962 = enqFire ? _GEN_626 : entries_2_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_963 = enqFire ? _GEN_627 : entries_3_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_964 = enqFire ? _GEN_628 : entries_4_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_965 = enqFire ? _GEN_629 : entries_5_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_966 = enqFire ? _GEN_630 : entries_6_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_967 = enqFire ? _GEN_631 : entries_7_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_968 = enqFire ? _GEN_632 : entries_8_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_969 = enqFire ? _GEN_633 : entries_9_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_970 = enqFire ? _GEN_634 : entries_10_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_971 = enqFire ? _GEN_635 : entries_11_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_972 = enqFire ? _GEN_636 : entries_12_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_973 = enqFire ? _GEN_637 : entries_13_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_974 = enqFire ? _GEN_638 : entries_14_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_975 = enqFire ? _GEN_639 : entries_15_dataValid; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_976 = enqFire ? _GEN_640 : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_977 = enqFire ? _GEN_641 : entries_1_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_978 = enqFire ? _GEN_642 : entries_2_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_979 = enqFire ? _GEN_643 : entries_3_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_980 = enqFire ? _GEN_644 : entries_4_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_981 = enqFire ? _GEN_645 : entries_5_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_982 = enqFire ? _GEN_646 : entries_6_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_983 = enqFire ? _GEN_647 : entries_7_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_984 = enqFire ? _GEN_648 : entries_8_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_985 = enqFire ? _GEN_649 : entries_9_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_986 = enqFire ? _GEN_650 : entries_10_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_987 = enqFire ? _GEN_651 : entries_11_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_988 = enqFire ? _GEN_652 : entries_12_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_989 = enqFire ? _GEN_653 : entries_13_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_990 = enqFire ? _GEN_654 : entries_14_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_991 = enqFire ? _GEN_655 : entries_15_committed; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_992 = enqFire ? _GEN_656 : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_993 = enqFire ? _GEN_657 : entries_1_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_994 = enqFire ? _GEN_658 : entries_2_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_995 = enqFire ? _GEN_659 : entries_3_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_996 = enqFire ? _GEN_660 : entries_4_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_997 = enqFire ? _GEN_661 : entries_5_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_998 = enqFire ? _GEN_662 : entries_6_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_999 = enqFire ? _GEN_663 : entries_7_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1000 = enqFire ? _GEN_664 : entries_8_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1001 = enqFire ? _GEN_665 : entries_9_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1002 = enqFire ? _GEN_666 : entries_10_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1003 = enqFire ? _GEN_667 : entries_11_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1004 = enqFire ? _GEN_668 : entries_12_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1005 = enqFire ? _GEN_669 : entries_13_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1006 = enqFire ? _GEN_670 : entries_14_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1007 = enqFire ? _GEN_671 : entries_15_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1008 = enqFire ? _GEN_672 : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1009 = enqFire ? _GEN_673 : entries_1_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1010 = enqFire ? _GEN_674 : entries_2_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1011 = enqFire ? _GEN_675 : entries_3_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1012 = enqFire ? _GEN_676 : entries_4_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1013 = enqFire ? _GEN_677 : entries_5_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1014 = enqFire ? _GEN_678 : entries_6_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1015 = enqFire ? _GEN_679 : entries_7_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1016 = enqFire ? _GEN_680 : entries_8_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1017 = enqFire ? _GEN_681 : entries_9_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1018 = enqFire ? _GEN_682 : entries_10_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1019 = enqFire ? _GEN_683 : entries_11_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1020 = enqFire ? _GEN_684 : entries_12_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1021 = enqFire ? _GEN_685 : entries_13_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1022 = enqFire ? _GEN_686 : entries_14_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1023 = enqFire ? _GEN_687 : entries_15_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1024 = enqFire ? _GEN_688 : entries_0_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1025 = enqFire ? _GEN_689 : entries_1_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1026 = enqFire ? _GEN_690 : entries_2_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1027 = enqFire ? _GEN_691 : entries_3_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1028 = enqFire ? _GEN_692 : entries_4_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1029 = enqFire ? _GEN_693 : entries_5_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1030 = enqFire ? _GEN_694 : entries_6_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1031 = enqFire ? _GEN_695 : entries_7_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1032 = enqFire ? _GEN_696 : entries_8_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1033 = enqFire ? _GEN_697 : entries_9_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1034 = enqFire ? _GEN_698 : entries_10_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1035 = enqFire ? _GEN_699 : entries_11_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1036 = enqFire ? _GEN_700 : entries_12_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1037 = enqFire ? _GEN_701 : entries_13_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1038 = enqFire ? _GEN_702 : entries_14_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1039 = enqFire ? _GEN_703 : entries_15_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1040 = enqFire ? _GEN_704 : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1041 = enqFire ? _GEN_705 : entries_1_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1042 = enqFire ? _GEN_706 : entries_2_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1043 = enqFire ? _GEN_707 : entries_3_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1044 = enqFire ? _GEN_708 : entries_4_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1045 = enqFire ? _GEN_709 : entries_5_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1046 = enqFire ? _GEN_710 : entries_6_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1047 = enqFire ? _GEN_711 : entries_7_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1048 = enqFire ? _GEN_712 : entries_8_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1049 = enqFire ? _GEN_713 : entries_9_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1050 = enqFire ? _GEN_714 : entries_10_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1051 = enqFire ? _GEN_715 : entries_11_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1052 = enqFire ? _GEN_716 : entries_12_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1053 = enqFire ? _GEN_717 : entries_13_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1054 = enqFire ? _GEN_718 : entries_14_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1055 = enqFire ? _GEN_719 : entries_15_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1056 = enqFire ? _GEN_720 : entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1057 = enqFire ? _GEN_721 : entries_1_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1058 = enqFire ? _GEN_722 : entries_2_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1059 = enqFire ? _GEN_723 : entries_3_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1060 = enqFire ? _GEN_724 : entries_4_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1061 = enqFire ? _GEN_725 : entries_5_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1062 = enqFire ? _GEN_726 : entries_6_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1063 = enqFire ? _GEN_727 : entries_7_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1064 = enqFire ? _GEN_728 : entries_8_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1065 = enqFire ? _GEN_729 : entries_9_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1066 = enqFire ? _GEN_730 : entries_10_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1067 = enqFire ? _GEN_731 : entries_11_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1068 = enqFire ? _GEN_732 : entries_12_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1069 = enqFire ? _GEN_733 : entries_13_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1070 = enqFire ? _GEN_734 : entries_14_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1071 = enqFire ? _GEN_735 : entries_15_vaddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1072 = enqFire ? _GEN_736 : entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1073 = enqFire ? _GEN_737 : entries_1_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1074 = enqFire ? _GEN_738 : entries_2_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1075 = enqFire ? _GEN_739 : entries_3_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1076 = enqFire ? _GEN_740 : entries_4_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1077 = enqFire ? _GEN_741 : entries_5_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1078 = enqFire ? _GEN_742 : entries_6_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1079 = enqFire ? _GEN_743 : entries_7_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1080 = enqFire ? _GEN_744 : entries_8_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1081 = enqFire ? _GEN_745 : entries_9_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1082 = enqFire ? _GEN_746 : entries_10_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1083 = enqFire ? _GEN_747 : entries_11_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1084 = enqFire ? _GEN_748 : entries_12_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1085 = enqFire ? _GEN_749 : entries_13_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1086 = enqFire ? _GEN_750 : entries_14_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1087 = enqFire ? _GEN_751 : entries_15_paddr; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1088 = enqFire ? _GEN_752 : entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1089 = enqFire ? _GEN_753 : entries_1_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1090 = enqFire ? _GEN_754 : entries_2_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1091 = enqFire ? _GEN_755 : entries_3_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1092 = enqFire ? _GEN_756 : entries_4_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1093 = enqFire ? _GEN_757 : entries_5_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1094 = enqFire ? _GEN_758 : entries_6_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1095 = enqFire ? _GEN_759 : entries_7_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1096 = enqFire ? _GEN_760 : entries_8_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1097 = enqFire ? _GEN_761 : entries_9_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1098 = enqFire ? _GEN_762 : entries_10_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1099 = enqFire ? _GEN_763 : entries_11_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1100 = enqFire ? _GEN_764 : entries_12_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1101 = enqFire ? _GEN_765 : entries_13_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1102 = enqFire ? _GEN_766 : entries_14_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [31:0] _GEN_1103 = enqFire ? _GEN_767 : entries_15_data; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1104 = enqFire ? _GEN_768 : entries_0_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1105 = enqFire ? _GEN_769 : entries_1_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1106 = enqFire ? _GEN_770 : entries_2_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1107 = enqFire ? _GEN_771 : entries_3_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1108 = enqFire ? _GEN_772 : entries_4_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1109 = enqFire ? _GEN_773 : entries_5_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1110 = enqFire ? _GEN_774 : entries_6_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1111 = enqFire ? _GEN_775 : entries_7_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1112 = enqFire ? _GEN_776 : entries_8_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1113 = enqFire ? _GEN_777 : entries_9_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1114 = enqFire ? _GEN_778 : entries_10_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1115 = enqFire ? _GEN_779 : entries_11_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1116 = enqFire ? _GEN_780 : entries_12_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1117 = enqFire ? _GEN_781 : entries_13_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1118 = enqFire ? _GEN_782 : entries_14_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire [16:0] _GEN_1119 = enqFire ? _GEN_783 : entries_15_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1120 = enqFire ? _GEN_784 : entries_0_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1121 = enqFire ? _GEN_785 : entries_1_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1122 = enqFire ? _GEN_786 : entries_2_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1123 = enqFire ? _GEN_787 : entries_3_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1124 = enqFire ? _GEN_788 : entries_4_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1125 = enqFire ? _GEN_789 : entries_5_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1126 = enqFire ? _GEN_790 : entries_6_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1127 = enqFire ? _GEN_791 : entries_7_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1128 = enqFire ? _GEN_792 : entries_8_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1129 = enqFire ? _GEN_793 : entries_9_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1130 = enqFire ? _GEN_794 : entries_10_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1131 = enqFire ? _GEN_795 : entries_11_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1132 = enqFire ? _GEN_796 : entries_12_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1133 = enqFire ? _GEN_797 : entries_13_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1134 = enqFire ? _GEN_798 : entries_14_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  _GEN_1135 = enqFire ? _GEN_799 : entries_15_cacheable; // @[src/main/scala/memory/StoreQueue.scala 165:17 114:24]
  wire  doRedirect = io_redirectInfo_valid & io_redirectInfo_bits_doRedirect; // @[src/main/scala/memory/StoreQueue.scala 195:40]
  wire  _isNewer_T_1 = entries_0_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_2 = entries_0_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer = entries_0_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_1 : _isNewer_T_2; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1218 = isNewer | _GEN_992; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_4 = entries_1_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_5 = entries_1_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_1 = entries_1_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_4 : _isNewer_T_5; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1220 = isNewer_1 | _GEN_993; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_7 = entries_2_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_8 = entries_2_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_2 = entries_2_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_7 : _isNewer_T_8; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1222 = isNewer_2 | _GEN_994; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_10 = entries_3_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_11 = entries_3_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_3 = entries_3_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_10 : _isNewer_T_11; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1224 = isNewer_3 | _GEN_995; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_13 = entries_4_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_14 = entries_4_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_4 = entries_4_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_13 : _isNewer_T_14; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1226 = isNewer_4 | _GEN_996; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_16 = entries_5_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_17 = entries_5_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_5 = entries_5_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_16 : _isNewer_T_17; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1228 = isNewer_5 | _GEN_997; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_19 = entries_6_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_20 = entries_6_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_6 = entries_6_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_19 : _isNewer_T_20; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1230 = isNewer_6 | _GEN_998; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_22 = entries_7_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_23 = entries_7_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_7 = entries_7_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_22 : _isNewer_T_23; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1232 = isNewer_7 | _GEN_999; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_25 = entries_8_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_26 = entries_8_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_8 = entries_8_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_25 : _isNewer_T_26; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1234 = isNewer_8 | _GEN_1000; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_28 = entries_9_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_29 = entries_9_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_9 = entries_9_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_28 : _isNewer_T_29; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1236 = isNewer_9 | _GEN_1001; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_31 = entries_10_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_32 = entries_10_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_10 = entries_10_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_31 : _isNewer_T_32; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1238 = isNewer_10 | _GEN_1002; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_34 = entries_11_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_35 = entries_11_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_11 = entries_11_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_34 : _isNewer_T_35; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1240 = isNewer_11 | _GEN_1003; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_37 = entries_12_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_38 = entries_12_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_12 = entries_12_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_37 : _isNewer_T_38; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1242 = isNewer_12 | _GEN_1004; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_40 = entries_13_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_41 = entries_13_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_13 = entries_13_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_40 : _isNewer_T_41; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1244 = isNewer_13 | _GEN_1005; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_43 = entries_14_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_44 = entries_14_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_14 = entries_14_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_43 : _isNewer_T_44; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1246 = isNewer_14 | _GEN_1006; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _isNewer_T_46 = entries_15_robIdxFull_value > io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 142:18]
  wire  _isNewer_T_47 = entries_15_robIdxFull_value < io_redirectInfo_bits_robIdx_value; // @[src/main/scala/util/CircularQueuePtr.scala 143:18]
  wire  isNewer_15 = entries_15_robIdxFull_flag == io_redirectInfo_bits_robIdx_flag ? _isNewer_T_46 : _isNewer_T_47; // @[src/main/scala/util/CircularQueuePtr.scala 141:8]
  wire  _GEN_1248 = isNewer_15 | _GEN_1007; // @[src/main/scala/memory/StoreQueue.scala 216:21 217:24]
  wire  _GEN_1266 = 4'h0 == io_addrWrite_idx | _GEN_944; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1267 = 4'h1 == io_addrWrite_idx | _GEN_945; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1268 = 4'h2 == io_addrWrite_idx | _GEN_946; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1269 = 4'h3 == io_addrWrite_idx | _GEN_947; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1270 = 4'h4 == io_addrWrite_idx | _GEN_948; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1271 = 4'h5 == io_addrWrite_idx | _GEN_949; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1272 = 4'h6 == io_addrWrite_idx | _GEN_950; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1273 = 4'h7 == io_addrWrite_idx | _GEN_951; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1274 = 4'h8 == io_addrWrite_idx | _GEN_952; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1275 = 4'h9 == io_addrWrite_idx | _GEN_953; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1276 = 4'ha == io_addrWrite_idx | _GEN_954; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1277 = 4'hb == io_addrWrite_idx | _GEN_955; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1278 = 4'hc == io_addrWrite_idx | _GEN_956; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1279 = 4'hd == io_addrWrite_idx | _GEN_957; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1280 = 4'he == io_addrWrite_idx | _GEN_958; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1281 = 4'hf == io_addrWrite_idx | _GEN_959; // @[src/main/scala/memory/StoreQueue.scala 229:{28,28}]
  wire  _GEN_1426 = 4'h0 == io_dataWrite_idx | _GEN_960; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1427 = 4'h1 == io_dataWrite_idx | _GEN_961; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1428 = 4'h2 == io_dataWrite_idx | _GEN_962; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1429 = 4'h3 == io_dataWrite_idx | _GEN_963; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1430 = 4'h4 == io_dataWrite_idx | _GEN_964; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1431 = 4'h5 == io_dataWrite_idx | _GEN_965; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1432 = 4'h6 == io_dataWrite_idx | _GEN_966; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1433 = 4'h7 == io_dataWrite_idx | _GEN_967; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1434 = 4'h8 == io_dataWrite_idx | _GEN_968; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1435 = 4'h9 == io_dataWrite_idx | _GEN_969; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1436 = 4'ha == io_dataWrite_idx | _GEN_970; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1437 = 4'hb == io_dataWrite_idx | _GEN_971; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1438 = 4'hc == io_dataWrite_idx | _GEN_972; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1439 = 4'hd == io_dataWrite_idx | _GEN_973; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1440 = 4'he == io_dataWrite_idx | _GEN_974; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire  _GEN_1441 = 4'hf == io_dataWrite_idx | _GEN_975; // @[src/main/scala/memory/StoreQueue.scala 241:{28,28}]
  wire [31:0] _entries_data_T_1 = {24'h0,io_dataWrite_data[7:0]}; // @[src/main/scala/memory/StoreQueue.scala 243:25]
  wire [31:0] _entries_data_T_3 = {16'h0,io_dataWrite_data[15:0]}; // @[src/main/scala/memory/StoreQueue.scala 244:25]
  wire [3:0] _GEN_1443 = 4'h1 == io_dataWrite_idx ? entries_1_lsuOp : entries_0_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1444 = 4'h2 == io_dataWrite_idx ? entries_2_lsuOp : _GEN_1443; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1445 = 4'h3 == io_dataWrite_idx ? entries_3_lsuOp : _GEN_1444; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1446 = 4'h4 == io_dataWrite_idx ? entries_4_lsuOp : _GEN_1445; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1447 = 4'h5 == io_dataWrite_idx ? entries_5_lsuOp : _GEN_1446; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1448 = 4'h6 == io_dataWrite_idx ? entries_6_lsuOp : _GEN_1447; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1449 = 4'h7 == io_dataWrite_idx ? entries_7_lsuOp : _GEN_1448; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1450 = 4'h8 == io_dataWrite_idx ? entries_8_lsuOp : _GEN_1449; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1451 = 4'h9 == io_dataWrite_idx ? entries_9_lsuOp : _GEN_1450; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1452 = 4'ha == io_dataWrite_idx ? entries_10_lsuOp : _GEN_1451; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1453 = 4'hb == io_dataWrite_idx ? entries_11_lsuOp : _GEN_1452; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1454 = 4'hc == io_dataWrite_idx ? entries_12_lsuOp : _GEN_1453; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1455 = 4'hd == io_dataWrite_idx ? entries_13_lsuOp : _GEN_1454; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1456 = 4'he == io_dataWrite_idx ? entries_14_lsuOp : _GEN_1455; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [3:0] _GEN_1457 = 4'hf == io_dataWrite_idx ? entries_15_lsuOp : _GEN_1456; // @[src/main/scala/memory/StoreQueue.scala 242:{74,74}]
  wire [31:0] _entries_data_T_5 = 4'h4 == _GEN_1457 ? _entries_data_T_1 : io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 242:74]
  wire [31:0] _entries_data_T_7 = 4'h5 == _GEN_1457 ? _entries_data_T_3 : _entries_data_T_5; // @[src/main/scala/memory/StoreQueue.scala 242:74]
  wire  _GEN_1523 = 4'h1 == idx ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1524 = 4'h2 == idx ? entries_2_addrValid : _GEN_1523; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1525 = 4'h3 == idx ? entries_3_addrValid : _GEN_1524; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1526 = 4'h4 == idx ? entries_4_addrValid : _GEN_1525; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1527 = 4'h5 == idx ? entries_5_addrValid : _GEN_1526; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1528 = 4'h6 == idx ? entries_6_addrValid : _GEN_1527; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1529 = 4'h7 == idx ? entries_7_addrValid : _GEN_1528; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1530 = 4'h8 == idx ? entries_8_addrValid : _GEN_1529; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1531 = 4'h9 == idx ? entries_9_addrValid : _GEN_1530; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1532 = 4'ha == idx ? entries_10_addrValid : _GEN_1531; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1533 = 4'hb == idx ? entries_11_addrValid : _GEN_1532; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1534 = 4'hc == idx ? entries_12_addrValid : _GEN_1533; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1535 = 4'hd == idx ? entries_13_addrValid : _GEN_1534; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1536 = 4'he == idx ? entries_14_addrValid : _GEN_1535; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1537 = 4'hf == idx ? entries_15_addrValid : _GEN_1536; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1539 = 4'h1 == idx ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1540 = 4'h2 == idx ? entries_2_dataValid : _GEN_1539; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1541 = 4'h3 == idx ? entries_3_dataValid : _GEN_1540; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1542 = 4'h4 == idx ? entries_4_dataValid : _GEN_1541; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1543 = 4'h5 == idx ? entries_5_dataValid : _GEN_1542; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1544 = 4'h6 == idx ? entries_6_dataValid : _GEN_1543; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1545 = 4'h7 == idx ? entries_7_dataValid : _GEN_1544; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1546 = 4'h8 == idx ? entries_8_dataValid : _GEN_1545; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1547 = 4'h9 == idx ? entries_9_dataValid : _GEN_1546; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1548 = 4'ha == idx ? entries_10_dataValid : _GEN_1547; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1549 = 4'hb == idx ? entries_11_dataValid : _GEN_1548; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1550 = 4'hc == idx ? entries_12_dataValid : _GEN_1549; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1551 = 4'hd == idx ? entries_13_dataValid : _GEN_1550; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1552 = 4'he == idx ? entries_14_dataValid : _GEN_1551; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1553 = 4'hf == idx ? entries_15_dataValid : _GEN_1552; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1555 = 4'h1 == idx ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1556 = 4'h2 == idx ? entries_2_writtenBack : _GEN_1555; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1557 = 4'h3 == idx ? entries_3_writtenBack : _GEN_1556; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1558 = 4'h4 == idx ? entries_4_writtenBack : _GEN_1557; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1559 = 4'h5 == idx ? entries_5_writtenBack : _GEN_1558; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1560 = 4'h6 == idx ? entries_6_writtenBack : _GEN_1559; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1561 = 4'h7 == idx ? entries_7_writtenBack : _GEN_1560; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1562 = 4'h8 == idx ? entries_8_writtenBack : _GEN_1561; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1563 = 4'h9 == idx ? entries_9_writtenBack : _GEN_1562; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1564 = 4'ha == idx ? entries_10_writtenBack : _GEN_1563; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1565 = 4'hb == idx ? entries_11_writtenBack : _GEN_1564; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1566 = 4'hc == idx ? entries_12_writtenBack : _GEN_1565; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1567 = 4'hd == idx ? entries_13_writtenBack : _GEN_1566; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1568 = 4'he == idx ? entries_14_writtenBack : _GEN_1567; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1569 = 4'hf == idx ? entries_15_writtenBack : _GEN_1568; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_0 = _GEN_31 & _GEN_1537 & _GEN_1553 & ~_GEN_1569; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_1587 = 4'h1 == idx_1 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1588 = 4'h2 == idx_1 ? entries_2_addrValid : _GEN_1587; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1589 = 4'h3 == idx_1 ? entries_3_addrValid : _GEN_1588; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1590 = 4'h4 == idx_1 ? entries_4_addrValid : _GEN_1589; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1591 = 4'h5 == idx_1 ? entries_5_addrValid : _GEN_1590; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1592 = 4'h6 == idx_1 ? entries_6_addrValid : _GEN_1591; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1593 = 4'h7 == idx_1 ? entries_7_addrValid : _GEN_1592; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1594 = 4'h8 == idx_1 ? entries_8_addrValid : _GEN_1593; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1595 = 4'h9 == idx_1 ? entries_9_addrValid : _GEN_1594; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1596 = 4'ha == idx_1 ? entries_10_addrValid : _GEN_1595; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1597 = 4'hb == idx_1 ? entries_11_addrValid : _GEN_1596; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1598 = 4'hc == idx_1 ? entries_12_addrValid : _GEN_1597; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1599 = 4'hd == idx_1 ? entries_13_addrValid : _GEN_1598; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1600 = 4'he == idx_1 ? entries_14_addrValid : _GEN_1599; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1601 = 4'hf == idx_1 ? entries_15_addrValid : _GEN_1600; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1603 = 4'h1 == idx_1 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1604 = 4'h2 == idx_1 ? entries_2_dataValid : _GEN_1603; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1605 = 4'h3 == idx_1 ? entries_3_dataValid : _GEN_1604; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1606 = 4'h4 == idx_1 ? entries_4_dataValid : _GEN_1605; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1607 = 4'h5 == idx_1 ? entries_5_dataValid : _GEN_1606; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1608 = 4'h6 == idx_1 ? entries_6_dataValid : _GEN_1607; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1609 = 4'h7 == idx_1 ? entries_7_dataValid : _GEN_1608; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1610 = 4'h8 == idx_1 ? entries_8_dataValid : _GEN_1609; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1611 = 4'h9 == idx_1 ? entries_9_dataValid : _GEN_1610; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1612 = 4'ha == idx_1 ? entries_10_dataValid : _GEN_1611; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1613 = 4'hb == idx_1 ? entries_11_dataValid : _GEN_1612; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1614 = 4'hc == idx_1 ? entries_12_dataValid : _GEN_1613; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1615 = 4'hd == idx_1 ? entries_13_dataValid : _GEN_1614; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1616 = 4'he == idx_1 ? entries_14_dataValid : _GEN_1615; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1617 = 4'hf == idx_1 ? entries_15_dataValid : _GEN_1616; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1619 = 4'h1 == idx_1 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1620 = 4'h2 == idx_1 ? entries_2_writtenBack : _GEN_1619; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1621 = 4'h3 == idx_1 ? entries_3_writtenBack : _GEN_1620; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1622 = 4'h4 == idx_1 ? entries_4_writtenBack : _GEN_1621; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1623 = 4'h5 == idx_1 ? entries_5_writtenBack : _GEN_1622; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1624 = 4'h6 == idx_1 ? entries_6_writtenBack : _GEN_1623; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1625 = 4'h7 == idx_1 ? entries_7_writtenBack : _GEN_1624; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1626 = 4'h8 == idx_1 ? entries_8_writtenBack : _GEN_1625; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1627 = 4'h9 == idx_1 ? entries_9_writtenBack : _GEN_1626; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1628 = 4'ha == idx_1 ? entries_10_writtenBack : _GEN_1627; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1629 = 4'hb == idx_1 ? entries_11_writtenBack : _GEN_1628; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1630 = 4'hc == idx_1 ? entries_12_writtenBack : _GEN_1629; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1631 = 4'hd == idx_1 ? entries_13_writtenBack : _GEN_1630; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1632 = 4'he == idx_1 ? entries_14_writtenBack : _GEN_1631; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1633 = 4'hf == idx_1 ? entries_15_writtenBack : _GEN_1632; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_1 = _GEN_63 & _GEN_1601 & _GEN_1617 & ~_GEN_1633; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_1651 = 4'h1 == idx_2 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1652 = 4'h2 == idx_2 ? entries_2_addrValid : _GEN_1651; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1653 = 4'h3 == idx_2 ? entries_3_addrValid : _GEN_1652; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1654 = 4'h4 == idx_2 ? entries_4_addrValid : _GEN_1653; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1655 = 4'h5 == idx_2 ? entries_5_addrValid : _GEN_1654; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1656 = 4'h6 == idx_2 ? entries_6_addrValid : _GEN_1655; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1657 = 4'h7 == idx_2 ? entries_7_addrValid : _GEN_1656; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1658 = 4'h8 == idx_2 ? entries_8_addrValid : _GEN_1657; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1659 = 4'h9 == idx_2 ? entries_9_addrValid : _GEN_1658; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1660 = 4'ha == idx_2 ? entries_10_addrValid : _GEN_1659; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1661 = 4'hb == idx_2 ? entries_11_addrValid : _GEN_1660; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1662 = 4'hc == idx_2 ? entries_12_addrValid : _GEN_1661; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1663 = 4'hd == idx_2 ? entries_13_addrValid : _GEN_1662; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1664 = 4'he == idx_2 ? entries_14_addrValid : _GEN_1663; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1665 = 4'hf == idx_2 ? entries_15_addrValid : _GEN_1664; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1667 = 4'h1 == idx_2 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1668 = 4'h2 == idx_2 ? entries_2_dataValid : _GEN_1667; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1669 = 4'h3 == idx_2 ? entries_3_dataValid : _GEN_1668; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1670 = 4'h4 == idx_2 ? entries_4_dataValid : _GEN_1669; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1671 = 4'h5 == idx_2 ? entries_5_dataValid : _GEN_1670; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1672 = 4'h6 == idx_2 ? entries_6_dataValid : _GEN_1671; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1673 = 4'h7 == idx_2 ? entries_7_dataValid : _GEN_1672; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1674 = 4'h8 == idx_2 ? entries_8_dataValid : _GEN_1673; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1675 = 4'h9 == idx_2 ? entries_9_dataValid : _GEN_1674; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1676 = 4'ha == idx_2 ? entries_10_dataValid : _GEN_1675; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1677 = 4'hb == idx_2 ? entries_11_dataValid : _GEN_1676; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1678 = 4'hc == idx_2 ? entries_12_dataValid : _GEN_1677; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1679 = 4'hd == idx_2 ? entries_13_dataValid : _GEN_1678; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1680 = 4'he == idx_2 ? entries_14_dataValid : _GEN_1679; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1681 = 4'hf == idx_2 ? entries_15_dataValid : _GEN_1680; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1683 = 4'h1 == idx_2 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1684 = 4'h2 == idx_2 ? entries_2_writtenBack : _GEN_1683; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1685 = 4'h3 == idx_2 ? entries_3_writtenBack : _GEN_1684; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1686 = 4'h4 == idx_2 ? entries_4_writtenBack : _GEN_1685; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1687 = 4'h5 == idx_2 ? entries_5_writtenBack : _GEN_1686; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1688 = 4'h6 == idx_2 ? entries_6_writtenBack : _GEN_1687; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1689 = 4'h7 == idx_2 ? entries_7_writtenBack : _GEN_1688; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1690 = 4'h8 == idx_2 ? entries_8_writtenBack : _GEN_1689; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1691 = 4'h9 == idx_2 ? entries_9_writtenBack : _GEN_1690; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1692 = 4'ha == idx_2 ? entries_10_writtenBack : _GEN_1691; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1693 = 4'hb == idx_2 ? entries_11_writtenBack : _GEN_1692; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1694 = 4'hc == idx_2 ? entries_12_writtenBack : _GEN_1693; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1695 = 4'hd == idx_2 ? entries_13_writtenBack : _GEN_1694; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1696 = 4'he == idx_2 ? entries_14_writtenBack : _GEN_1695; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1697 = 4'hf == idx_2 ? entries_15_writtenBack : _GEN_1696; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_2 = _GEN_95 & _GEN_1665 & _GEN_1681 & ~_GEN_1697; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_1715 = 4'h1 == idx_3 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1716 = 4'h2 == idx_3 ? entries_2_addrValid : _GEN_1715; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1717 = 4'h3 == idx_3 ? entries_3_addrValid : _GEN_1716; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1718 = 4'h4 == idx_3 ? entries_4_addrValid : _GEN_1717; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1719 = 4'h5 == idx_3 ? entries_5_addrValid : _GEN_1718; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1720 = 4'h6 == idx_3 ? entries_6_addrValid : _GEN_1719; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1721 = 4'h7 == idx_3 ? entries_7_addrValid : _GEN_1720; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1722 = 4'h8 == idx_3 ? entries_8_addrValid : _GEN_1721; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1723 = 4'h9 == idx_3 ? entries_9_addrValid : _GEN_1722; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1724 = 4'ha == idx_3 ? entries_10_addrValid : _GEN_1723; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1725 = 4'hb == idx_3 ? entries_11_addrValid : _GEN_1724; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1726 = 4'hc == idx_3 ? entries_12_addrValid : _GEN_1725; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1727 = 4'hd == idx_3 ? entries_13_addrValid : _GEN_1726; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1728 = 4'he == idx_3 ? entries_14_addrValid : _GEN_1727; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1729 = 4'hf == idx_3 ? entries_15_addrValid : _GEN_1728; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1731 = 4'h1 == idx_3 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1732 = 4'h2 == idx_3 ? entries_2_dataValid : _GEN_1731; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1733 = 4'h3 == idx_3 ? entries_3_dataValid : _GEN_1732; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1734 = 4'h4 == idx_3 ? entries_4_dataValid : _GEN_1733; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1735 = 4'h5 == idx_3 ? entries_5_dataValid : _GEN_1734; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1736 = 4'h6 == idx_3 ? entries_6_dataValid : _GEN_1735; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1737 = 4'h7 == idx_3 ? entries_7_dataValid : _GEN_1736; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1738 = 4'h8 == idx_3 ? entries_8_dataValid : _GEN_1737; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1739 = 4'h9 == idx_3 ? entries_9_dataValid : _GEN_1738; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1740 = 4'ha == idx_3 ? entries_10_dataValid : _GEN_1739; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1741 = 4'hb == idx_3 ? entries_11_dataValid : _GEN_1740; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1742 = 4'hc == idx_3 ? entries_12_dataValid : _GEN_1741; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1743 = 4'hd == idx_3 ? entries_13_dataValid : _GEN_1742; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1744 = 4'he == idx_3 ? entries_14_dataValid : _GEN_1743; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1745 = 4'hf == idx_3 ? entries_15_dataValid : _GEN_1744; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1747 = 4'h1 == idx_3 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1748 = 4'h2 == idx_3 ? entries_2_writtenBack : _GEN_1747; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1749 = 4'h3 == idx_3 ? entries_3_writtenBack : _GEN_1748; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1750 = 4'h4 == idx_3 ? entries_4_writtenBack : _GEN_1749; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1751 = 4'h5 == idx_3 ? entries_5_writtenBack : _GEN_1750; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1752 = 4'h6 == idx_3 ? entries_6_writtenBack : _GEN_1751; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1753 = 4'h7 == idx_3 ? entries_7_writtenBack : _GEN_1752; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1754 = 4'h8 == idx_3 ? entries_8_writtenBack : _GEN_1753; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1755 = 4'h9 == idx_3 ? entries_9_writtenBack : _GEN_1754; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1756 = 4'ha == idx_3 ? entries_10_writtenBack : _GEN_1755; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1757 = 4'hb == idx_3 ? entries_11_writtenBack : _GEN_1756; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1758 = 4'hc == idx_3 ? entries_12_writtenBack : _GEN_1757; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1759 = 4'hd == idx_3 ? entries_13_writtenBack : _GEN_1758; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1760 = 4'he == idx_3 ? entries_14_writtenBack : _GEN_1759; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1761 = 4'hf == idx_3 ? entries_15_writtenBack : _GEN_1760; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_3 = _GEN_127 & _GEN_1729 & _GEN_1745 & ~_GEN_1761; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_1779 = 4'h1 == idx_4 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1780 = 4'h2 == idx_4 ? entries_2_addrValid : _GEN_1779; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1781 = 4'h3 == idx_4 ? entries_3_addrValid : _GEN_1780; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1782 = 4'h4 == idx_4 ? entries_4_addrValid : _GEN_1781; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1783 = 4'h5 == idx_4 ? entries_5_addrValid : _GEN_1782; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1784 = 4'h6 == idx_4 ? entries_6_addrValid : _GEN_1783; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1785 = 4'h7 == idx_4 ? entries_7_addrValid : _GEN_1784; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1786 = 4'h8 == idx_4 ? entries_8_addrValid : _GEN_1785; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1787 = 4'h9 == idx_4 ? entries_9_addrValid : _GEN_1786; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1788 = 4'ha == idx_4 ? entries_10_addrValid : _GEN_1787; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1789 = 4'hb == idx_4 ? entries_11_addrValid : _GEN_1788; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1790 = 4'hc == idx_4 ? entries_12_addrValid : _GEN_1789; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1791 = 4'hd == idx_4 ? entries_13_addrValid : _GEN_1790; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1792 = 4'he == idx_4 ? entries_14_addrValid : _GEN_1791; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1793 = 4'hf == idx_4 ? entries_15_addrValid : _GEN_1792; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1795 = 4'h1 == idx_4 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1796 = 4'h2 == idx_4 ? entries_2_dataValid : _GEN_1795; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1797 = 4'h3 == idx_4 ? entries_3_dataValid : _GEN_1796; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1798 = 4'h4 == idx_4 ? entries_4_dataValid : _GEN_1797; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1799 = 4'h5 == idx_4 ? entries_5_dataValid : _GEN_1798; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1800 = 4'h6 == idx_4 ? entries_6_dataValid : _GEN_1799; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1801 = 4'h7 == idx_4 ? entries_7_dataValid : _GEN_1800; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1802 = 4'h8 == idx_4 ? entries_8_dataValid : _GEN_1801; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1803 = 4'h9 == idx_4 ? entries_9_dataValid : _GEN_1802; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1804 = 4'ha == idx_4 ? entries_10_dataValid : _GEN_1803; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1805 = 4'hb == idx_4 ? entries_11_dataValid : _GEN_1804; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1806 = 4'hc == idx_4 ? entries_12_dataValid : _GEN_1805; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1807 = 4'hd == idx_4 ? entries_13_dataValid : _GEN_1806; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1808 = 4'he == idx_4 ? entries_14_dataValid : _GEN_1807; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1809 = 4'hf == idx_4 ? entries_15_dataValid : _GEN_1808; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1811 = 4'h1 == idx_4 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1812 = 4'h2 == idx_4 ? entries_2_writtenBack : _GEN_1811; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1813 = 4'h3 == idx_4 ? entries_3_writtenBack : _GEN_1812; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1814 = 4'h4 == idx_4 ? entries_4_writtenBack : _GEN_1813; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1815 = 4'h5 == idx_4 ? entries_5_writtenBack : _GEN_1814; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1816 = 4'h6 == idx_4 ? entries_6_writtenBack : _GEN_1815; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1817 = 4'h7 == idx_4 ? entries_7_writtenBack : _GEN_1816; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1818 = 4'h8 == idx_4 ? entries_8_writtenBack : _GEN_1817; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1819 = 4'h9 == idx_4 ? entries_9_writtenBack : _GEN_1818; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1820 = 4'ha == idx_4 ? entries_10_writtenBack : _GEN_1819; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1821 = 4'hb == idx_4 ? entries_11_writtenBack : _GEN_1820; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1822 = 4'hc == idx_4 ? entries_12_writtenBack : _GEN_1821; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1823 = 4'hd == idx_4 ? entries_13_writtenBack : _GEN_1822; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1824 = 4'he == idx_4 ? entries_14_writtenBack : _GEN_1823; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1825 = 4'hf == idx_4 ? entries_15_writtenBack : _GEN_1824; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_4 = _GEN_159 & _GEN_1793 & _GEN_1809 & ~_GEN_1825; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_1843 = 4'h1 == idx_5 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1844 = 4'h2 == idx_5 ? entries_2_addrValid : _GEN_1843; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1845 = 4'h3 == idx_5 ? entries_3_addrValid : _GEN_1844; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1846 = 4'h4 == idx_5 ? entries_4_addrValid : _GEN_1845; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1847 = 4'h5 == idx_5 ? entries_5_addrValid : _GEN_1846; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1848 = 4'h6 == idx_5 ? entries_6_addrValid : _GEN_1847; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1849 = 4'h7 == idx_5 ? entries_7_addrValid : _GEN_1848; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1850 = 4'h8 == idx_5 ? entries_8_addrValid : _GEN_1849; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1851 = 4'h9 == idx_5 ? entries_9_addrValid : _GEN_1850; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1852 = 4'ha == idx_5 ? entries_10_addrValid : _GEN_1851; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1853 = 4'hb == idx_5 ? entries_11_addrValid : _GEN_1852; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1854 = 4'hc == idx_5 ? entries_12_addrValid : _GEN_1853; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1855 = 4'hd == idx_5 ? entries_13_addrValid : _GEN_1854; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1856 = 4'he == idx_5 ? entries_14_addrValid : _GEN_1855; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1857 = 4'hf == idx_5 ? entries_15_addrValid : _GEN_1856; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1859 = 4'h1 == idx_5 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1860 = 4'h2 == idx_5 ? entries_2_dataValid : _GEN_1859; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1861 = 4'h3 == idx_5 ? entries_3_dataValid : _GEN_1860; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1862 = 4'h4 == idx_5 ? entries_4_dataValid : _GEN_1861; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1863 = 4'h5 == idx_5 ? entries_5_dataValid : _GEN_1862; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1864 = 4'h6 == idx_5 ? entries_6_dataValid : _GEN_1863; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1865 = 4'h7 == idx_5 ? entries_7_dataValid : _GEN_1864; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1866 = 4'h8 == idx_5 ? entries_8_dataValid : _GEN_1865; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1867 = 4'h9 == idx_5 ? entries_9_dataValid : _GEN_1866; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1868 = 4'ha == idx_5 ? entries_10_dataValid : _GEN_1867; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1869 = 4'hb == idx_5 ? entries_11_dataValid : _GEN_1868; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1870 = 4'hc == idx_5 ? entries_12_dataValid : _GEN_1869; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1871 = 4'hd == idx_5 ? entries_13_dataValid : _GEN_1870; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1872 = 4'he == idx_5 ? entries_14_dataValid : _GEN_1871; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1873 = 4'hf == idx_5 ? entries_15_dataValid : _GEN_1872; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1875 = 4'h1 == idx_5 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1876 = 4'h2 == idx_5 ? entries_2_writtenBack : _GEN_1875; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1877 = 4'h3 == idx_5 ? entries_3_writtenBack : _GEN_1876; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1878 = 4'h4 == idx_5 ? entries_4_writtenBack : _GEN_1877; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1879 = 4'h5 == idx_5 ? entries_5_writtenBack : _GEN_1878; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1880 = 4'h6 == idx_5 ? entries_6_writtenBack : _GEN_1879; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1881 = 4'h7 == idx_5 ? entries_7_writtenBack : _GEN_1880; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1882 = 4'h8 == idx_5 ? entries_8_writtenBack : _GEN_1881; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1883 = 4'h9 == idx_5 ? entries_9_writtenBack : _GEN_1882; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1884 = 4'ha == idx_5 ? entries_10_writtenBack : _GEN_1883; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1885 = 4'hb == idx_5 ? entries_11_writtenBack : _GEN_1884; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1886 = 4'hc == idx_5 ? entries_12_writtenBack : _GEN_1885; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1887 = 4'hd == idx_5 ? entries_13_writtenBack : _GEN_1886; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1888 = 4'he == idx_5 ? entries_14_writtenBack : _GEN_1887; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1889 = 4'hf == idx_5 ? entries_15_writtenBack : _GEN_1888; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_5 = _GEN_191 & _GEN_1857 & _GEN_1873 & ~_GEN_1889; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_1907 = 4'h1 == idx_6 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1908 = 4'h2 == idx_6 ? entries_2_addrValid : _GEN_1907; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1909 = 4'h3 == idx_6 ? entries_3_addrValid : _GEN_1908; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1910 = 4'h4 == idx_6 ? entries_4_addrValid : _GEN_1909; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1911 = 4'h5 == idx_6 ? entries_5_addrValid : _GEN_1910; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1912 = 4'h6 == idx_6 ? entries_6_addrValid : _GEN_1911; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1913 = 4'h7 == idx_6 ? entries_7_addrValid : _GEN_1912; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1914 = 4'h8 == idx_6 ? entries_8_addrValid : _GEN_1913; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1915 = 4'h9 == idx_6 ? entries_9_addrValid : _GEN_1914; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1916 = 4'ha == idx_6 ? entries_10_addrValid : _GEN_1915; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1917 = 4'hb == idx_6 ? entries_11_addrValid : _GEN_1916; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1918 = 4'hc == idx_6 ? entries_12_addrValid : _GEN_1917; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1919 = 4'hd == idx_6 ? entries_13_addrValid : _GEN_1918; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1920 = 4'he == idx_6 ? entries_14_addrValid : _GEN_1919; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1921 = 4'hf == idx_6 ? entries_15_addrValid : _GEN_1920; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1923 = 4'h1 == idx_6 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1924 = 4'h2 == idx_6 ? entries_2_dataValid : _GEN_1923; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1925 = 4'h3 == idx_6 ? entries_3_dataValid : _GEN_1924; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1926 = 4'h4 == idx_6 ? entries_4_dataValid : _GEN_1925; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1927 = 4'h5 == idx_6 ? entries_5_dataValid : _GEN_1926; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1928 = 4'h6 == idx_6 ? entries_6_dataValid : _GEN_1927; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1929 = 4'h7 == idx_6 ? entries_7_dataValid : _GEN_1928; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1930 = 4'h8 == idx_6 ? entries_8_dataValid : _GEN_1929; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1931 = 4'h9 == idx_6 ? entries_9_dataValid : _GEN_1930; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1932 = 4'ha == idx_6 ? entries_10_dataValid : _GEN_1931; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1933 = 4'hb == idx_6 ? entries_11_dataValid : _GEN_1932; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1934 = 4'hc == idx_6 ? entries_12_dataValid : _GEN_1933; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1935 = 4'hd == idx_6 ? entries_13_dataValid : _GEN_1934; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1936 = 4'he == idx_6 ? entries_14_dataValid : _GEN_1935; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1937 = 4'hf == idx_6 ? entries_15_dataValid : _GEN_1936; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1939 = 4'h1 == idx_6 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1940 = 4'h2 == idx_6 ? entries_2_writtenBack : _GEN_1939; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1941 = 4'h3 == idx_6 ? entries_3_writtenBack : _GEN_1940; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1942 = 4'h4 == idx_6 ? entries_4_writtenBack : _GEN_1941; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1943 = 4'h5 == idx_6 ? entries_5_writtenBack : _GEN_1942; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1944 = 4'h6 == idx_6 ? entries_6_writtenBack : _GEN_1943; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1945 = 4'h7 == idx_6 ? entries_7_writtenBack : _GEN_1944; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1946 = 4'h8 == idx_6 ? entries_8_writtenBack : _GEN_1945; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1947 = 4'h9 == idx_6 ? entries_9_writtenBack : _GEN_1946; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1948 = 4'ha == idx_6 ? entries_10_writtenBack : _GEN_1947; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1949 = 4'hb == idx_6 ? entries_11_writtenBack : _GEN_1948; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1950 = 4'hc == idx_6 ? entries_12_writtenBack : _GEN_1949; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1951 = 4'hd == idx_6 ? entries_13_writtenBack : _GEN_1950; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1952 = 4'he == idx_6 ? entries_14_writtenBack : _GEN_1951; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_1953 = 4'hf == idx_6 ? entries_15_writtenBack : _GEN_1952; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_6 = _GEN_223 & _GEN_1921 & _GEN_1937 & ~_GEN_1953; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_1971 = 4'h1 == idx_7 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1972 = 4'h2 == idx_7 ? entries_2_addrValid : _GEN_1971; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1973 = 4'h3 == idx_7 ? entries_3_addrValid : _GEN_1972; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1974 = 4'h4 == idx_7 ? entries_4_addrValid : _GEN_1973; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1975 = 4'h5 == idx_7 ? entries_5_addrValid : _GEN_1974; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1976 = 4'h6 == idx_7 ? entries_6_addrValid : _GEN_1975; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1977 = 4'h7 == idx_7 ? entries_7_addrValid : _GEN_1976; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1978 = 4'h8 == idx_7 ? entries_8_addrValid : _GEN_1977; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1979 = 4'h9 == idx_7 ? entries_9_addrValid : _GEN_1978; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1980 = 4'ha == idx_7 ? entries_10_addrValid : _GEN_1979; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1981 = 4'hb == idx_7 ? entries_11_addrValid : _GEN_1980; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1982 = 4'hc == idx_7 ? entries_12_addrValid : _GEN_1981; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1983 = 4'hd == idx_7 ? entries_13_addrValid : _GEN_1982; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1984 = 4'he == idx_7 ? entries_14_addrValid : _GEN_1983; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1985 = 4'hf == idx_7 ? entries_15_addrValid : _GEN_1984; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_1987 = 4'h1 == idx_7 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1988 = 4'h2 == idx_7 ? entries_2_dataValid : _GEN_1987; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1989 = 4'h3 == idx_7 ? entries_3_dataValid : _GEN_1988; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1990 = 4'h4 == idx_7 ? entries_4_dataValid : _GEN_1989; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1991 = 4'h5 == idx_7 ? entries_5_dataValid : _GEN_1990; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1992 = 4'h6 == idx_7 ? entries_6_dataValid : _GEN_1991; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1993 = 4'h7 == idx_7 ? entries_7_dataValid : _GEN_1992; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1994 = 4'h8 == idx_7 ? entries_8_dataValid : _GEN_1993; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1995 = 4'h9 == idx_7 ? entries_9_dataValid : _GEN_1994; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1996 = 4'ha == idx_7 ? entries_10_dataValid : _GEN_1995; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1997 = 4'hb == idx_7 ? entries_11_dataValid : _GEN_1996; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1998 = 4'hc == idx_7 ? entries_12_dataValid : _GEN_1997; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_1999 = 4'hd == idx_7 ? entries_13_dataValid : _GEN_1998; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2000 = 4'he == idx_7 ? entries_14_dataValid : _GEN_1999; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2001 = 4'hf == idx_7 ? entries_15_dataValid : _GEN_2000; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2003 = 4'h1 == idx_7 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2004 = 4'h2 == idx_7 ? entries_2_writtenBack : _GEN_2003; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2005 = 4'h3 == idx_7 ? entries_3_writtenBack : _GEN_2004; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2006 = 4'h4 == idx_7 ? entries_4_writtenBack : _GEN_2005; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2007 = 4'h5 == idx_7 ? entries_5_writtenBack : _GEN_2006; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2008 = 4'h6 == idx_7 ? entries_6_writtenBack : _GEN_2007; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2009 = 4'h7 == idx_7 ? entries_7_writtenBack : _GEN_2008; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2010 = 4'h8 == idx_7 ? entries_8_writtenBack : _GEN_2009; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2011 = 4'h9 == idx_7 ? entries_9_writtenBack : _GEN_2010; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2012 = 4'ha == idx_7 ? entries_10_writtenBack : _GEN_2011; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2013 = 4'hb == idx_7 ? entries_11_writtenBack : _GEN_2012; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2014 = 4'hc == idx_7 ? entries_12_writtenBack : _GEN_2013; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2015 = 4'hd == idx_7 ? entries_13_writtenBack : _GEN_2014; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2016 = 4'he == idx_7 ? entries_14_writtenBack : _GEN_2015; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2017 = 4'hf == idx_7 ? entries_15_writtenBack : _GEN_2016; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_7 = _GEN_255 & _GEN_1985 & _GEN_2001 & ~_GEN_2017; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2035 = 4'h1 == idx_8 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2036 = 4'h2 == idx_8 ? entries_2_addrValid : _GEN_2035; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2037 = 4'h3 == idx_8 ? entries_3_addrValid : _GEN_2036; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2038 = 4'h4 == idx_8 ? entries_4_addrValid : _GEN_2037; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2039 = 4'h5 == idx_8 ? entries_5_addrValid : _GEN_2038; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2040 = 4'h6 == idx_8 ? entries_6_addrValid : _GEN_2039; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2041 = 4'h7 == idx_8 ? entries_7_addrValid : _GEN_2040; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2042 = 4'h8 == idx_8 ? entries_8_addrValid : _GEN_2041; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2043 = 4'h9 == idx_8 ? entries_9_addrValid : _GEN_2042; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2044 = 4'ha == idx_8 ? entries_10_addrValid : _GEN_2043; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2045 = 4'hb == idx_8 ? entries_11_addrValid : _GEN_2044; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2046 = 4'hc == idx_8 ? entries_12_addrValid : _GEN_2045; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2047 = 4'hd == idx_8 ? entries_13_addrValid : _GEN_2046; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2048 = 4'he == idx_8 ? entries_14_addrValid : _GEN_2047; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2049 = 4'hf == idx_8 ? entries_15_addrValid : _GEN_2048; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2051 = 4'h1 == idx_8 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2052 = 4'h2 == idx_8 ? entries_2_dataValid : _GEN_2051; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2053 = 4'h3 == idx_8 ? entries_3_dataValid : _GEN_2052; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2054 = 4'h4 == idx_8 ? entries_4_dataValid : _GEN_2053; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2055 = 4'h5 == idx_8 ? entries_5_dataValid : _GEN_2054; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2056 = 4'h6 == idx_8 ? entries_6_dataValid : _GEN_2055; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2057 = 4'h7 == idx_8 ? entries_7_dataValid : _GEN_2056; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2058 = 4'h8 == idx_8 ? entries_8_dataValid : _GEN_2057; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2059 = 4'h9 == idx_8 ? entries_9_dataValid : _GEN_2058; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2060 = 4'ha == idx_8 ? entries_10_dataValid : _GEN_2059; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2061 = 4'hb == idx_8 ? entries_11_dataValid : _GEN_2060; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2062 = 4'hc == idx_8 ? entries_12_dataValid : _GEN_2061; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2063 = 4'hd == idx_8 ? entries_13_dataValid : _GEN_2062; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2064 = 4'he == idx_8 ? entries_14_dataValid : _GEN_2063; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2065 = 4'hf == idx_8 ? entries_15_dataValid : _GEN_2064; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2067 = 4'h1 == idx_8 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2068 = 4'h2 == idx_8 ? entries_2_writtenBack : _GEN_2067; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2069 = 4'h3 == idx_8 ? entries_3_writtenBack : _GEN_2068; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2070 = 4'h4 == idx_8 ? entries_4_writtenBack : _GEN_2069; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2071 = 4'h5 == idx_8 ? entries_5_writtenBack : _GEN_2070; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2072 = 4'h6 == idx_8 ? entries_6_writtenBack : _GEN_2071; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2073 = 4'h7 == idx_8 ? entries_7_writtenBack : _GEN_2072; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2074 = 4'h8 == idx_8 ? entries_8_writtenBack : _GEN_2073; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2075 = 4'h9 == idx_8 ? entries_9_writtenBack : _GEN_2074; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2076 = 4'ha == idx_8 ? entries_10_writtenBack : _GEN_2075; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2077 = 4'hb == idx_8 ? entries_11_writtenBack : _GEN_2076; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2078 = 4'hc == idx_8 ? entries_12_writtenBack : _GEN_2077; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2079 = 4'hd == idx_8 ? entries_13_writtenBack : _GEN_2078; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2080 = 4'he == idx_8 ? entries_14_writtenBack : _GEN_2079; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2081 = 4'hf == idx_8 ? entries_15_writtenBack : _GEN_2080; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_8 = _GEN_287 & _GEN_2049 & _GEN_2065 & ~_GEN_2081; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2099 = 4'h1 == idx_9 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2100 = 4'h2 == idx_9 ? entries_2_addrValid : _GEN_2099; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2101 = 4'h3 == idx_9 ? entries_3_addrValid : _GEN_2100; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2102 = 4'h4 == idx_9 ? entries_4_addrValid : _GEN_2101; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2103 = 4'h5 == idx_9 ? entries_5_addrValid : _GEN_2102; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2104 = 4'h6 == idx_9 ? entries_6_addrValid : _GEN_2103; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2105 = 4'h7 == idx_9 ? entries_7_addrValid : _GEN_2104; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2106 = 4'h8 == idx_9 ? entries_8_addrValid : _GEN_2105; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2107 = 4'h9 == idx_9 ? entries_9_addrValid : _GEN_2106; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2108 = 4'ha == idx_9 ? entries_10_addrValid : _GEN_2107; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2109 = 4'hb == idx_9 ? entries_11_addrValid : _GEN_2108; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2110 = 4'hc == idx_9 ? entries_12_addrValid : _GEN_2109; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2111 = 4'hd == idx_9 ? entries_13_addrValid : _GEN_2110; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2112 = 4'he == idx_9 ? entries_14_addrValid : _GEN_2111; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2113 = 4'hf == idx_9 ? entries_15_addrValid : _GEN_2112; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2115 = 4'h1 == idx_9 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2116 = 4'h2 == idx_9 ? entries_2_dataValid : _GEN_2115; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2117 = 4'h3 == idx_9 ? entries_3_dataValid : _GEN_2116; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2118 = 4'h4 == idx_9 ? entries_4_dataValid : _GEN_2117; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2119 = 4'h5 == idx_9 ? entries_5_dataValid : _GEN_2118; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2120 = 4'h6 == idx_9 ? entries_6_dataValid : _GEN_2119; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2121 = 4'h7 == idx_9 ? entries_7_dataValid : _GEN_2120; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2122 = 4'h8 == idx_9 ? entries_8_dataValid : _GEN_2121; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2123 = 4'h9 == idx_9 ? entries_9_dataValid : _GEN_2122; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2124 = 4'ha == idx_9 ? entries_10_dataValid : _GEN_2123; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2125 = 4'hb == idx_9 ? entries_11_dataValid : _GEN_2124; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2126 = 4'hc == idx_9 ? entries_12_dataValid : _GEN_2125; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2127 = 4'hd == idx_9 ? entries_13_dataValid : _GEN_2126; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2128 = 4'he == idx_9 ? entries_14_dataValid : _GEN_2127; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2129 = 4'hf == idx_9 ? entries_15_dataValid : _GEN_2128; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2131 = 4'h1 == idx_9 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2132 = 4'h2 == idx_9 ? entries_2_writtenBack : _GEN_2131; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2133 = 4'h3 == idx_9 ? entries_3_writtenBack : _GEN_2132; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2134 = 4'h4 == idx_9 ? entries_4_writtenBack : _GEN_2133; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2135 = 4'h5 == idx_9 ? entries_5_writtenBack : _GEN_2134; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2136 = 4'h6 == idx_9 ? entries_6_writtenBack : _GEN_2135; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2137 = 4'h7 == idx_9 ? entries_7_writtenBack : _GEN_2136; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2138 = 4'h8 == idx_9 ? entries_8_writtenBack : _GEN_2137; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2139 = 4'h9 == idx_9 ? entries_9_writtenBack : _GEN_2138; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2140 = 4'ha == idx_9 ? entries_10_writtenBack : _GEN_2139; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2141 = 4'hb == idx_9 ? entries_11_writtenBack : _GEN_2140; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2142 = 4'hc == idx_9 ? entries_12_writtenBack : _GEN_2141; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2143 = 4'hd == idx_9 ? entries_13_writtenBack : _GEN_2142; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2144 = 4'he == idx_9 ? entries_14_writtenBack : _GEN_2143; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2145 = 4'hf == idx_9 ? entries_15_writtenBack : _GEN_2144; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_9 = _GEN_319 & _GEN_2113 & _GEN_2129 & ~_GEN_2145; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2163 = 4'h1 == idx_10 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2164 = 4'h2 == idx_10 ? entries_2_addrValid : _GEN_2163; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2165 = 4'h3 == idx_10 ? entries_3_addrValid : _GEN_2164; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2166 = 4'h4 == idx_10 ? entries_4_addrValid : _GEN_2165; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2167 = 4'h5 == idx_10 ? entries_5_addrValid : _GEN_2166; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2168 = 4'h6 == idx_10 ? entries_6_addrValid : _GEN_2167; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2169 = 4'h7 == idx_10 ? entries_7_addrValid : _GEN_2168; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2170 = 4'h8 == idx_10 ? entries_8_addrValid : _GEN_2169; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2171 = 4'h9 == idx_10 ? entries_9_addrValid : _GEN_2170; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2172 = 4'ha == idx_10 ? entries_10_addrValid : _GEN_2171; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2173 = 4'hb == idx_10 ? entries_11_addrValid : _GEN_2172; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2174 = 4'hc == idx_10 ? entries_12_addrValid : _GEN_2173; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2175 = 4'hd == idx_10 ? entries_13_addrValid : _GEN_2174; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2176 = 4'he == idx_10 ? entries_14_addrValid : _GEN_2175; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2177 = 4'hf == idx_10 ? entries_15_addrValid : _GEN_2176; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2179 = 4'h1 == idx_10 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2180 = 4'h2 == idx_10 ? entries_2_dataValid : _GEN_2179; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2181 = 4'h3 == idx_10 ? entries_3_dataValid : _GEN_2180; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2182 = 4'h4 == idx_10 ? entries_4_dataValid : _GEN_2181; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2183 = 4'h5 == idx_10 ? entries_5_dataValid : _GEN_2182; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2184 = 4'h6 == idx_10 ? entries_6_dataValid : _GEN_2183; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2185 = 4'h7 == idx_10 ? entries_7_dataValid : _GEN_2184; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2186 = 4'h8 == idx_10 ? entries_8_dataValid : _GEN_2185; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2187 = 4'h9 == idx_10 ? entries_9_dataValid : _GEN_2186; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2188 = 4'ha == idx_10 ? entries_10_dataValid : _GEN_2187; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2189 = 4'hb == idx_10 ? entries_11_dataValid : _GEN_2188; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2190 = 4'hc == idx_10 ? entries_12_dataValid : _GEN_2189; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2191 = 4'hd == idx_10 ? entries_13_dataValid : _GEN_2190; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2192 = 4'he == idx_10 ? entries_14_dataValid : _GEN_2191; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2193 = 4'hf == idx_10 ? entries_15_dataValid : _GEN_2192; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2195 = 4'h1 == idx_10 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2196 = 4'h2 == idx_10 ? entries_2_writtenBack : _GEN_2195; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2197 = 4'h3 == idx_10 ? entries_3_writtenBack : _GEN_2196; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2198 = 4'h4 == idx_10 ? entries_4_writtenBack : _GEN_2197; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2199 = 4'h5 == idx_10 ? entries_5_writtenBack : _GEN_2198; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2200 = 4'h6 == idx_10 ? entries_6_writtenBack : _GEN_2199; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2201 = 4'h7 == idx_10 ? entries_7_writtenBack : _GEN_2200; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2202 = 4'h8 == idx_10 ? entries_8_writtenBack : _GEN_2201; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2203 = 4'h9 == idx_10 ? entries_9_writtenBack : _GEN_2202; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2204 = 4'ha == idx_10 ? entries_10_writtenBack : _GEN_2203; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2205 = 4'hb == idx_10 ? entries_11_writtenBack : _GEN_2204; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2206 = 4'hc == idx_10 ? entries_12_writtenBack : _GEN_2205; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2207 = 4'hd == idx_10 ? entries_13_writtenBack : _GEN_2206; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2208 = 4'he == idx_10 ? entries_14_writtenBack : _GEN_2207; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2209 = 4'hf == idx_10 ? entries_15_writtenBack : _GEN_2208; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_10 = _GEN_351 & _GEN_2177 & _GEN_2193 & ~_GEN_2209; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2227 = 4'h1 == idx_11 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2228 = 4'h2 == idx_11 ? entries_2_addrValid : _GEN_2227; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2229 = 4'h3 == idx_11 ? entries_3_addrValid : _GEN_2228; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2230 = 4'h4 == idx_11 ? entries_4_addrValid : _GEN_2229; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2231 = 4'h5 == idx_11 ? entries_5_addrValid : _GEN_2230; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2232 = 4'h6 == idx_11 ? entries_6_addrValid : _GEN_2231; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2233 = 4'h7 == idx_11 ? entries_7_addrValid : _GEN_2232; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2234 = 4'h8 == idx_11 ? entries_8_addrValid : _GEN_2233; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2235 = 4'h9 == idx_11 ? entries_9_addrValid : _GEN_2234; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2236 = 4'ha == idx_11 ? entries_10_addrValid : _GEN_2235; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2237 = 4'hb == idx_11 ? entries_11_addrValid : _GEN_2236; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2238 = 4'hc == idx_11 ? entries_12_addrValid : _GEN_2237; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2239 = 4'hd == idx_11 ? entries_13_addrValid : _GEN_2238; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2240 = 4'he == idx_11 ? entries_14_addrValid : _GEN_2239; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2241 = 4'hf == idx_11 ? entries_15_addrValid : _GEN_2240; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2243 = 4'h1 == idx_11 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2244 = 4'h2 == idx_11 ? entries_2_dataValid : _GEN_2243; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2245 = 4'h3 == idx_11 ? entries_3_dataValid : _GEN_2244; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2246 = 4'h4 == idx_11 ? entries_4_dataValid : _GEN_2245; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2247 = 4'h5 == idx_11 ? entries_5_dataValid : _GEN_2246; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2248 = 4'h6 == idx_11 ? entries_6_dataValid : _GEN_2247; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2249 = 4'h7 == idx_11 ? entries_7_dataValid : _GEN_2248; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2250 = 4'h8 == idx_11 ? entries_8_dataValid : _GEN_2249; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2251 = 4'h9 == idx_11 ? entries_9_dataValid : _GEN_2250; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2252 = 4'ha == idx_11 ? entries_10_dataValid : _GEN_2251; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2253 = 4'hb == idx_11 ? entries_11_dataValid : _GEN_2252; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2254 = 4'hc == idx_11 ? entries_12_dataValid : _GEN_2253; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2255 = 4'hd == idx_11 ? entries_13_dataValid : _GEN_2254; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2256 = 4'he == idx_11 ? entries_14_dataValid : _GEN_2255; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2257 = 4'hf == idx_11 ? entries_15_dataValid : _GEN_2256; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2259 = 4'h1 == idx_11 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2260 = 4'h2 == idx_11 ? entries_2_writtenBack : _GEN_2259; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2261 = 4'h3 == idx_11 ? entries_3_writtenBack : _GEN_2260; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2262 = 4'h4 == idx_11 ? entries_4_writtenBack : _GEN_2261; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2263 = 4'h5 == idx_11 ? entries_5_writtenBack : _GEN_2262; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2264 = 4'h6 == idx_11 ? entries_6_writtenBack : _GEN_2263; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2265 = 4'h7 == idx_11 ? entries_7_writtenBack : _GEN_2264; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2266 = 4'h8 == idx_11 ? entries_8_writtenBack : _GEN_2265; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2267 = 4'h9 == idx_11 ? entries_9_writtenBack : _GEN_2266; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2268 = 4'ha == idx_11 ? entries_10_writtenBack : _GEN_2267; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2269 = 4'hb == idx_11 ? entries_11_writtenBack : _GEN_2268; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2270 = 4'hc == idx_11 ? entries_12_writtenBack : _GEN_2269; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2271 = 4'hd == idx_11 ? entries_13_writtenBack : _GEN_2270; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2272 = 4'he == idx_11 ? entries_14_writtenBack : _GEN_2271; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2273 = 4'hf == idx_11 ? entries_15_writtenBack : _GEN_2272; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_11 = _GEN_383 & _GEN_2241 & _GEN_2257 & ~_GEN_2273; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2291 = 4'h1 == idx_12 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2292 = 4'h2 == idx_12 ? entries_2_addrValid : _GEN_2291; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2293 = 4'h3 == idx_12 ? entries_3_addrValid : _GEN_2292; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2294 = 4'h4 == idx_12 ? entries_4_addrValid : _GEN_2293; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2295 = 4'h5 == idx_12 ? entries_5_addrValid : _GEN_2294; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2296 = 4'h6 == idx_12 ? entries_6_addrValid : _GEN_2295; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2297 = 4'h7 == idx_12 ? entries_7_addrValid : _GEN_2296; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2298 = 4'h8 == idx_12 ? entries_8_addrValid : _GEN_2297; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2299 = 4'h9 == idx_12 ? entries_9_addrValid : _GEN_2298; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2300 = 4'ha == idx_12 ? entries_10_addrValid : _GEN_2299; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2301 = 4'hb == idx_12 ? entries_11_addrValid : _GEN_2300; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2302 = 4'hc == idx_12 ? entries_12_addrValid : _GEN_2301; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2303 = 4'hd == idx_12 ? entries_13_addrValid : _GEN_2302; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2304 = 4'he == idx_12 ? entries_14_addrValid : _GEN_2303; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2305 = 4'hf == idx_12 ? entries_15_addrValid : _GEN_2304; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2307 = 4'h1 == idx_12 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2308 = 4'h2 == idx_12 ? entries_2_dataValid : _GEN_2307; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2309 = 4'h3 == idx_12 ? entries_3_dataValid : _GEN_2308; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2310 = 4'h4 == idx_12 ? entries_4_dataValid : _GEN_2309; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2311 = 4'h5 == idx_12 ? entries_5_dataValid : _GEN_2310; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2312 = 4'h6 == idx_12 ? entries_6_dataValid : _GEN_2311; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2313 = 4'h7 == idx_12 ? entries_7_dataValid : _GEN_2312; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2314 = 4'h8 == idx_12 ? entries_8_dataValid : _GEN_2313; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2315 = 4'h9 == idx_12 ? entries_9_dataValid : _GEN_2314; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2316 = 4'ha == idx_12 ? entries_10_dataValid : _GEN_2315; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2317 = 4'hb == idx_12 ? entries_11_dataValid : _GEN_2316; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2318 = 4'hc == idx_12 ? entries_12_dataValid : _GEN_2317; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2319 = 4'hd == idx_12 ? entries_13_dataValid : _GEN_2318; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2320 = 4'he == idx_12 ? entries_14_dataValid : _GEN_2319; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2321 = 4'hf == idx_12 ? entries_15_dataValid : _GEN_2320; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2323 = 4'h1 == idx_12 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2324 = 4'h2 == idx_12 ? entries_2_writtenBack : _GEN_2323; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2325 = 4'h3 == idx_12 ? entries_3_writtenBack : _GEN_2324; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2326 = 4'h4 == idx_12 ? entries_4_writtenBack : _GEN_2325; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2327 = 4'h5 == idx_12 ? entries_5_writtenBack : _GEN_2326; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2328 = 4'h6 == idx_12 ? entries_6_writtenBack : _GEN_2327; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2329 = 4'h7 == idx_12 ? entries_7_writtenBack : _GEN_2328; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2330 = 4'h8 == idx_12 ? entries_8_writtenBack : _GEN_2329; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2331 = 4'h9 == idx_12 ? entries_9_writtenBack : _GEN_2330; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2332 = 4'ha == idx_12 ? entries_10_writtenBack : _GEN_2331; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2333 = 4'hb == idx_12 ? entries_11_writtenBack : _GEN_2332; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2334 = 4'hc == idx_12 ? entries_12_writtenBack : _GEN_2333; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2335 = 4'hd == idx_12 ? entries_13_writtenBack : _GEN_2334; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2336 = 4'he == idx_12 ? entries_14_writtenBack : _GEN_2335; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2337 = 4'hf == idx_12 ? entries_15_writtenBack : _GEN_2336; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_12 = _GEN_415 & _GEN_2305 & _GEN_2321 & ~_GEN_2337; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2355 = 4'h1 == idx_13 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2356 = 4'h2 == idx_13 ? entries_2_addrValid : _GEN_2355; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2357 = 4'h3 == idx_13 ? entries_3_addrValid : _GEN_2356; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2358 = 4'h4 == idx_13 ? entries_4_addrValid : _GEN_2357; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2359 = 4'h5 == idx_13 ? entries_5_addrValid : _GEN_2358; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2360 = 4'h6 == idx_13 ? entries_6_addrValid : _GEN_2359; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2361 = 4'h7 == idx_13 ? entries_7_addrValid : _GEN_2360; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2362 = 4'h8 == idx_13 ? entries_8_addrValid : _GEN_2361; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2363 = 4'h9 == idx_13 ? entries_9_addrValid : _GEN_2362; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2364 = 4'ha == idx_13 ? entries_10_addrValid : _GEN_2363; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2365 = 4'hb == idx_13 ? entries_11_addrValid : _GEN_2364; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2366 = 4'hc == idx_13 ? entries_12_addrValid : _GEN_2365; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2367 = 4'hd == idx_13 ? entries_13_addrValid : _GEN_2366; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2368 = 4'he == idx_13 ? entries_14_addrValid : _GEN_2367; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2369 = 4'hf == idx_13 ? entries_15_addrValid : _GEN_2368; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2371 = 4'h1 == idx_13 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2372 = 4'h2 == idx_13 ? entries_2_dataValid : _GEN_2371; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2373 = 4'h3 == idx_13 ? entries_3_dataValid : _GEN_2372; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2374 = 4'h4 == idx_13 ? entries_4_dataValid : _GEN_2373; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2375 = 4'h5 == idx_13 ? entries_5_dataValid : _GEN_2374; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2376 = 4'h6 == idx_13 ? entries_6_dataValid : _GEN_2375; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2377 = 4'h7 == idx_13 ? entries_7_dataValid : _GEN_2376; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2378 = 4'h8 == idx_13 ? entries_8_dataValid : _GEN_2377; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2379 = 4'h9 == idx_13 ? entries_9_dataValid : _GEN_2378; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2380 = 4'ha == idx_13 ? entries_10_dataValid : _GEN_2379; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2381 = 4'hb == idx_13 ? entries_11_dataValid : _GEN_2380; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2382 = 4'hc == idx_13 ? entries_12_dataValid : _GEN_2381; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2383 = 4'hd == idx_13 ? entries_13_dataValid : _GEN_2382; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2384 = 4'he == idx_13 ? entries_14_dataValid : _GEN_2383; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2385 = 4'hf == idx_13 ? entries_15_dataValid : _GEN_2384; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2387 = 4'h1 == idx_13 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2388 = 4'h2 == idx_13 ? entries_2_writtenBack : _GEN_2387; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2389 = 4'h3 == idx_13 ? entries_3_writtenBack : _GEN_2388; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2390 = 4'h4 == idx_13 ? entries_4_writtenBack : _GEN_2389; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2391 = 4'h5 == idx_13 ? entries_5_writtenBack : _GEN_2390; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2392 = 4'h6 == idx_13 ? entries_6_writtenBack : _GEN_2391; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2393 = 4'h7 == idx_13 ? entries_7_writtenBack : _GEN_2392; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2394 = 4'h8 == idx_13 ? entries_8_writtenBack : _GEN_2393; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2395 = 4'h9 == idx_13 ? entries_9_writtenBack : _GEN_2394; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2396 = 4'ha == idx_13 ? entries_10_writtenBack : _GEN_2395; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2397 = 4'hb == idx_13 ? entries_11_writtenBack : _GEN_2396; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2398 = 4'hc == idx_13 ? entries_12_writtenBack : _GEN_2397; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2399 = 4'hd == idx_13 ? entries_13_writtenBack : _GEN_2398; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2400 = 4'he == idx_13 ? entries_14_writtenBack : _GEN_2399; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2401 = 4'hf == idx_13 ? entries_15_writtenBack : _GEN_2400; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_13 = _GEN_447 & _GEN_2369 & _GEN_2385 & ~_GEN_2401; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2419 = 4'h1 == idx_14 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2420 = 4'h2 == idx_14 ? entries_2_addrValid : _GEN_2419; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2421 = 4'h3 == idx_14 ? entries_3_addrValid : _GEN_2420; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2422 = 4'h4 == idx_14 ? entries_4_addrValid : _GEN_2421; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2423 = 4'h5 == idx_14 ? entries_5_addrValid : _GEN_2422; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2424 = 4'h6 == idx_14 ? entries_6_addrValid : _GEN_2423; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2425 = 4'h7 == idx_14 ? entries_7_addrValid : _GEN_2424; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2426 = 4'h8 == idx_14 ? entries_8_addrValid : _GEN_2425; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2427 = 4'h9 == idx_14 ? entries_9_addrValid : _GEN_2426; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2428 = 4'ha == idx_14 ? entries_10_addrValid : _GEN_2427; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2429 = 4'hb == idx_14 ? entries_11_addrValid : _GEN_2428; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2430 = 4'hc == idx_14 ? entries_12_addrValid : _GEN_2429; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2431 = 4'hd == idx_14 ? entries_13_addrValid : _GEN_2430; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2432 = 4'he == idx_14 ? entries_14_addrValid : _GEN_2431; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2433 = 4'hf == idx_14 ? entries_15_addrValid : _GEN_2432; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2435 = 4'h1 == idx_14 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2436 = 4'h2 == idx_14 ? entries_2_dataValid : _GEN_2435; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2437 = 4'h3 == idx_14 ? entries_3_dataValid : _GEN_2436; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2438 = 4'h4 == idx_14 ? entries_4_dataValid : _GEN_2437; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2439 = 4'h5 == idx_14 ? entries_5_dataValid : _GEN_2438; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2440 = 4'h6 == idx_14 ? entries_6_dataValid : _GEN_2439; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2441 = 4'h7 == idx_14 ? entries_7_dataValid : _GEN_2440; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2442 = 4'h8 == idx_14 ? entries_8_dataValid : _GEN_2441; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2443 = 4'h9 == idx_14 ? entries_9_dataValid : _GEN_2442; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2444 = 4'ha == idx_14 ? entries_10_dataValid : _GEN_2443; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2445 = 4'hb == idx_14 ? entries_11_dataValid : _GEN_2444; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2446 = 4'hc == idx_14 ? entries_12_dataValid : _GEN_2445; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2447 = 4'hd == idx_14 ? entries_13_dataValid : _GEN_2446; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2448 = 4'he == idx_14 ? entries_14_dataValid : _GEN_2447; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2449 = 4'hf == idx_14 ? entries_15_dataValid : _GEN_2448; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2451 = 4'h1 == idx_14 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2452 = 4'h2 == idx_14 ? entries_2_writtenBack : _GEN_2451; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2453 = 4'h3 == idx_14 ? entries_3_writtenBack : _GEN_2452; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2454 = 4'h4 == idx_14 ? entries_4_writtenBack : _GEN_2453; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2455 = 4'h5 == idx_14 ? entries_5_writtenBack : _GEN_2454; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2456 = 4'h6 == idx_14 ? entries_6_writtenBack : _GEN_2455; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2457 = 4'h7 == idx_14 ? entries_7_writtenBack : _GEN_2456; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2458 = 4'h8 == idx_14 ? entries_8_writtenBack : _GEN_2457; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2459 = 4'h9 == idx_14 ? entries_9_writtenBack : _GEN_2458; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2460 = 4'ha == idx_14 ? entries_10_writtenBack : _GEN_2459; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2461 = 4'hb == idx_14 ? entries_11_writtenBack : _GEN_2460; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2462 = 4'hc == idx_14 ? entries_12_writtenBack : _GEN_2461; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2463 = 4'hd == idx_14 ? entries_13_writtenBack : _GEN_2462; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2464 = 4'he == idx_14 ? entries_14_writtenBack : _GEN_2463; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2465 = 4'hf == idx_14 ? entries_15_writtenBack : _GEN_2464; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_14 = _GEN_479 & _GEN_2433 & _GEN_2449 & ~_GEN_2465; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire  _GEN_2483 = 4'h1 == idx_15 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2484 = 4'h2 == idx_15 ? entries_2_addrValid : _GEN_2483; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2485 = 4'h3 == idx_15 ? entries_3_addrValid : _GEN_2484; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2486 = 4'h4 == idx_15 ? entries_4_addrValid : _GEN_2485; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2487 = 4'h5 == idx_15 ? entries_5_addrValid : _GEN_2486; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2488 = 4'h6 == idx_15 ? entries_6_addrValid : _GEN_2487; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2489 = 4'h7 == idx_15 ? entries_7_addrValid : _GEN_2488; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2490 = 4'h8 == idx_15 ? entries_8_addrValid : _GEN_2489; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2491 = 4'h9 == idx_15 ? entries_9_addrValid : _GEN_2490; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2492 = 4'ha == idx_15 ? entries_10_addrValid : _GEN_2491; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2493 = 4'hb == idx_15 ? entries_11_addrValid : _GEN_2492; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2494 = 4'hc == idx_15 ? entries_12_addrValid : _GEN_2493; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2495 = 4'hd == idx_15 ? entries_13_addrValid : _GEN_2494; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2496 = 4'he == idx_15 ? entries_14_addrValid : _GEN_2495; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2497 = 4'hf == idx_15 ? entries_15_addrValid : _GEN_2496; // @[src/main/scala/memory/StoreQueue.scala 259:{32,32}]
  wire  _GEN_2499 = 4'h1 == idx_15 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2500 = 4'h2 == idx_15 ? entries_2_dataValid : _GEN_2499; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2501 = 4'h3 == idx_15 ? entries_3_dataValid : _GEN_2500; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2502 = 4'h4 == idx_15 ? entries_4_dataValid : _GEN_2501; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2503 = 4'h5 == idx_15 ? entries_5_dataValid : _GEN_2502; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2504 = 4'h6 == idx_15 ? entries_6_dataValid : _GEN_2503; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2505 = 4'h7 == idx_15 ? entries_7_dataValid : _GEN_2504; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2506 = 4'h8 == idx_15 ? entries_8_dataValid : _GEN_2505; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2507 = 4'h9 == idx_15 ? entries_9_dataValid : _GEN_2506; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2508 = 4'ha == idx_15 ? entries_10_dataValid : _GEN_2507; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2509 = 4'hb == idx_15 ? entries_11_dataValid : _GEN_2508; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2510 = 4'hc == idx_15 ? entries_12_dataValid : _GEN_2509; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2511 = 4'hd == idx_15 ? entries_13_dataValid : _GEN_2510; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2512 = 4'he == idx_15 ? entries_14_dataValid : _GEN_2511; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2513 = 4'hf == idx_15 ? entries_15_dataValid : _GEN_2512; // @[src/main/scala/memory/StoreQueue.scala 259:{47,47}]
  wire  _GEN_2515 = 4'h1 == idx_15 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2516 = 4'h2 == idx_15 ? entries_2_writtenBack : _GEN_2515; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2517 = 4'h3 == idx_15 ? entries_3_writtenBack : _GEN_2516; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2518 = 4'h4 == idx_15 ? entries_4_writtenBack : _GEN_2517; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2519 = 4'h5 == idx_15 ? entries_5_writtenBack : _GEN_2518; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2520 = 4'h6 == idx_15 ? entries_6_writtenBack : _GEN_2519; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2521 = 4'h7 == idx_15 ? entries_7_writtenBack : _GEN_2520; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2522 = 4'h8 == idx_15 ? entries_8_writtenBack : _GEN_2521; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2523 = 4'h9 == idx_15 ? entries_9_writtenBack : _GEN_2522; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2524 = 4'ha == idx_15 ? entries_10_writtenBack : _GEN_2523; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2525 = 4'hb == idx_15 ? entries_11_writtenBack : _GEN_2524; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2526 = 4'hc == idx_15 ? entries_12_writtenBack : _GEN_2525; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2527 = 4'hd == idx_15 ? entries_13_writtenBack : _GEN_2526; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2528 = 4'he == idx_15 ? entries_14_writtenBack : _GEN_2527; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  _GEN_2529 = 4'hf == idx_15 ? entries_15_writtenBack : _GEN_2528; // @[src/main/scala/memory/StoreQueue.scala 259:{65,65}]
  wire  wbCandidates_15 = _GEN_511 & _GEN_2497 & _GEN_2513 & ~_GEN_2529; // @[src/main/scala/memory/StoreQueue.scala 259:62]
  wire [3:0] _wbOffset_T = wbCandidates_14 ? 4'he : 4'hf; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_1 = wbCandidates_13 ? 4'hd : _wbOffset_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_2 = wbCandidates_12 ? 4'hc : _wbOffset_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_3 = wbCandidates_11 ? 4'hb : _wbOffset_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_4 = wbCandidates_10 ? 4'ha : _wbOffset_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_5 = wbCandidates_9 ? 4'h9 : _wbOffset_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_6 = wbCandidates_8 ? 4'h8 : _wbOffset_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_7 = wbCandidates_7 ? 4'h7 : _wbOffset_T_6; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_8 = wbCandidates_6 ? 4'h6 : _wbOffset_T_7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_9 = wbCandidates_5 ? 4'h5 : _wbOffset_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_10 = wbCandidates_4 ? 4'h4 : _wbOffset_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_11 = wbCandidates_3 ? 4'h3 : _wbOffset_T_10; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_12 = wbCandidates_2 ? 4'h2 : _wbOffset_T_11; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_13 = wbCandidates_1 ? 4'h1 : _wbOffset_T_12; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] wbOffset = wbCandidates_0 ? 4'h0 : _wbOffset_T_13; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] wbIdx = deqPtr_value + wbOffset; // @[src/main/scala/memory/StoreQueue.scala 264:38]
  wire [31:0] _GEN_2531 = 4'h1 == wbIdx ? entries_1_vaddr : entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2532 = 4'h2 == wbIdx ? entries_2_vaddr : _GEN_2531; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2533 = 4'h3 == wbIdx ? entries_3_vaddr : _GEN_2532; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2534 = 4'h4 == wbIdx ? entries_4_vaddr : _GEN_2533; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2535 = 4'h5 == wbIdx ? entries_5_vaddr : _GEN_2534; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2536 = 4'h6 == wbIdx ? entries_6_vaddr : _GEN_2535; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2537 = 4'h7 == wbIdx ? entries_7_vaddr : _GEN_2536; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2538 = 4'h8 == wbIdx ? entries_8_vaddr : _GEN_2537; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2539 = 4'h9 == wbIdx ? entries_9_vaddr : _GEN_2538; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2540 = 4'ha == wbIdx ? entries_10_vaddr : _GEN_2539; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2541 = 4'hb == wbIdx ? entries_11_vaddr : _GEN_2540; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2542 = 4'hc == wbIdx ? entries_12_vaddr : _GEN_2541; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2543 = 4'hd == wbIdx ? entries_13_vaddr : _GEN_2542; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2544 = 4'he == wbIdx ? entries_14_vaddr : _GEN_2543; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  wire [31:0] _GEN_2547 = 4'h1 == wbIdx ? entries_1_paddr : entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2548 = 4'h2 == wbIdx ? entries_2_paddr : _GEN_2547; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2549 = 4'h3 == wbIdx ? entries_3_paddr : _GEN_2548; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2550 = 4'h4 == wbIdx ? entries_4_paddr : _GEN_2549; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2551 = 4'h5 == wbIdx ? entries_5_paddr : _GEN_2550; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2552 = 4'h6 == wbIdx ? entries_6_paddr : _GEN_2551; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2553 = 4'h7 == wbIdx ? entries_7_paddr : _GEN_2552; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2554 = 4'h8 == wbIdx ? entries_8_paddr : _GEN_2553; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2555 = 4'h9 == wbIdx ? entries_9_paddr : _GEN_2554; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2556 = 4'ha == wbIdx ? entries_10_paddr : _GEN_2555; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2557 = 4'hb == wbIdx ? entries_11_paddr : _GEN_2556; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2558 = 4'hc == wbIdx ? entries_12_paddr : _GEN_2557; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2559 = 4'hd == wbIdx ? entries_13_paddr : _GEN_2558; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2560 = 4'he == wbIdx ? entries_14_paddr : _GEN_2559; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [31:0] _GEN_2561 = 4'hf == wbIdx ? entries_15_paddr : _GEN_2560; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  wire [1:0] storeByteOff = _GEN_2561[1:0]; // @[src/main/scala/memory/StoreQueue.scala 275:35]
  wire [3:0] _GEN_2563 = 4'h1 == wbIdx ? entries_1_lsuOp : entries_0_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2564 = 4'h2 == wbIdx ? entries_2_lsuOp : _GEN_2563; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2565 = 4'h3 == wbIdx ? entries_3_lsuOp : _GEN_2564; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2566 = 4'h4 == wbIdx ? entries_4_lsuOp : _GEN_2565; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2567 = 4'h5 == wbIdx ? entries_5_lsuOp : _GEN_2566; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2568 = 4'h6 == wbIdx ? entries_6_lsuOp : _GEN_2567; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2569 = 4'h7 == wbIdx ? entries_7_lsuOp : _GEN_2568; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2570 = 4'h8 == wbIdx ? entries_8_lsuOp : _GEN_2569; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2571 = 4'h9 == wbIdx ? entries_9_lsuOp : _GEN_2570; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2572 = 4'ha == wbIdx ? entries_10_lsuOp : _GEN_2571; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2573 = 4'hb == wbIdx ? entries_11_lsuOp : _GEN_2572; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2574 = 4'hc == wbIdx ? entries_12_lsuOp : _GEN_2573; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2575 = 4'hd == wbIdx ? entries_13_lsuOp : _GEN_2574; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2576 = 4'he == wbIdx ? entries_14_lsuOp : _GEN_2575; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [3:0] _GEN_2577 = 4'hf == wbIdx ? entries_15_lsuOp : _GEN_2576; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  wire [5:0] _io_outResult_bits_memStoreData_T_1 = storeByteOff * 4'h8; // @[src/main/scala/memory/StoreQueue.scala 278:74]
  wire [31:0] _GEN_2579 = 4'h1 == wbIdx ? entries_1_data : entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2580 = 4'h2 == wbIdx ? entries_2_data : _GEN_2579; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2581 = 4'h3 == wbIdx ? entries_3_data : _GEN_2580; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2582 = 4'h4 == wbIdx ? entries_4_data : _GEN_2581; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2583 = 4'h5 == wbIdx ? entries_5_data : _GEN_2582; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2584 = 4'h6 == wbIdx ? entries_6_data : _GEN_2583; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2585 = 4'h7 == wbIdx ? entries_7_data : _GEN_2584; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2586 = 4'h8 == wbIdx ? entries_8_data : _GEN_2585; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2587 = 4'h9 == wbIdx ? entries_9_data : _GEN_2586; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2588 = 4'ha == wbIdx ? entries_10_data : _GEN_2587; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2589 = 4'hb == wbIdx ? entries_11_data : _GEN_2588; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2590 = 4'hc == wbIdx ? entries_12_data : _GEN_2589; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2591 = 4'hd == wbIdx ? entries_13_data : _GEN_2590; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2592 = 4'he == wbIdx ? entries_14_data : _GEN_2591; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [31:0] _GEN_2593 = 4'hf == wbIdx ? entries_15_data : _GEN_2592; // @[src/main/scala/memory/StoreQueue.scala 278:{57,57}]
  wire [94:0] _GEN_0 = {{63'd0}, _GEN_2593}; // @[src/main/scala/memory/StoreQueue.scala 278:57]
  wire [94:0] _io_outResult_bits_memStoreData_T_2 = _GEN_0 << _io_outResult_bits_memStoreData_T_1; // @[src/main/scala/memory/StoreQueue.scala 278:57]
  wire [5:0] _io_outResult_bits_memStoreData_T_4 = _GEN_2561[1] * 5'h10; // @[src/main/scala/memory/StoreQueue.scala 279:78]
  wire [94:0] _GEN_16 = {{63'd0}, _GEN_2593}; // @[src/main/scala/memory/StoreQueue.scala 279:57]
  wire [94:0] _io_outResult_bits_memStoreData_T_5 = _GEN_16 << _io_outResult_bits_memStoreData_T_4; // @[src/main/scala/memory/StoreQueue.scala 279:57]
  wire [94:0] _io_outResult_bits_memStoreData_T_6 = _GEN_2577 == 4'h4 ? _io_outResult_bits_memStoreData_T_2 :
    _io_outResult_bits_memStoreData_T_5; // @[src/main/scala/memory/StoreQueue.scala 277:43]
  wire [5:0] _GEN_2595 = 4'h1 == wbIdx ? entries_1_robIdxFull_value : entries_0_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2596 = 4'h2 == wbIdx ? entries_2_robIdxFull_value : _GEN_2595; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2597 = 4'h3 == wbIdx ? entries_3_robIdxFull_value : _GEN_2596; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2598 = 4'h4 == wbIdx ? entries_4_robIdxFull_value : _GEN_2597; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2599 = 4'h5 == wbIdx ? entries_5_robIdxFull_value : _GEN_2598; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2600 = 4'h6 == wbIdx ? entries_6_robIdxFull_value : _GEN_2599; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2601 = 4'h7 == wbIdx ? entries_7_robIdxFull_value : _GEN_2600; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2602 = 4'h8 == wbIdx ? entries_8_robIdxFull_value : _GEN_2601; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2603 = 4'h9 == wbIdx ? entries_9_robIdxFull_value : _GEN_2602; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2604 = 4'ha == wbIdx ? entries_10_robIdxFull_value : _GEN_2603; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2605 = 4'hb == wbIdx ? entries_11_robIdxFull_value : _GEN_2604; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2606 = 4'hc == wbIdx ? entries_12_robIdxFull_value : _GEN_2605; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2607 = 4'hd == wbIdx ? entries_13_robIdxFull_value : _GEN_2606; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [5:0] _GEN_2608 = 4'he == wbIdx ? entries_14_robIdxFull_value : _GEN_2607; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2611 = 4'h1 == wbIdx ? entries_1_robIdxFull_flag : entries_0_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2612 = 4'h2 == wbIdx ? entries_2_robIdxFull_flag : _GEN_2611; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2613 = 4'h3 == wbIdx ? entries_3_robIdxFull_flag : _GEN_2612; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2614 = 4'h4 == wbIdx ? entries_4_robIdxFull_flag : _GEN_2613; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2615 = 4'h5 == wbIdx ? entries_5_robIdxFull_flag : _GEN_2614; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2616 = 4'h6 == wbIdx ? entries_6_robIdxFull_flag : _GEN_2615; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2617 = 4'h7 == wbIdx ? entries_7_robIdxFull_flag : _GEN_2616; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2618 = 4'h8 == wbIdx ? entries_8_robIdxFull_flag : _GEN_2617; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2619 = 4'h9 == wbIdx ? entries_9_robIdxFull_flag : _GEN_2618; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2620 = 4'ha == wbIdx ? entries_10_robIdxFull_flag : _GEN_2619; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2621 = 4'hb == wbIdx ? entries_11_robIdxFull_flag : _GEN_2620; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2622 = 4'hc == wbIdx ? entries_12_robIdxFull_flag : _GEN_2621; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2623 = 4'hd == wbIdx ? entries_13_robIdxFull_flag : _GEN_2622; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire  _GEN_2624 = 4'he == wbIdx ? entries_14_robIdxFull_flag : _GEN_2623; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  wire [31:0] _GEN_2627 = 4'h1 == wbIdx ? entries_1_pc : entries_0_pc; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2628 = 4'h2 == wbIdx ? entries_2_pc : _GEN_2627; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2629 = 4'h3 == wbIdx ? entries_3_pc : _GEN_2628; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2630 = 4'h4 == wbIdx ? entries_4_pc : _GEN_2629; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2631 = 4'h5 == wbIdx ? entries_5_pc : _GEN_2630; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2632 = 4'h6 == wbIdx ? entries_6_pc : _GEN_2631; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2633 = 4'h7 == wbIdx ? entries_7_pc : _GEN_2632; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2634 = 4'h8 == wbIdx ? entries_8_pc : _GEN_2633; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2635 = 4'h9 == wbIdx ? entries_9_pc : _GEN_2634; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2636 = 4'ha == wbIdx ? entries_10_pc : _GEN_2635; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2637 = 4'hb == wbIdx ? entries_11_pc : _GEN_2636; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2638 = 4'hc == wbIdx ? entries_12_pc : _GEN_2637; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2639 = 4'hd == wbIdx ? entries_13_pc : _GEN_2638; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [31:0] _GEN_2640 = 4'he == wbIdx ? entries_14_pc : _GEN_2639; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  wire [16:0] _GEN_2643 = 4'h1 == wbIdx ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2644 = 4'h2 == wbIdx ? entries_2_excp_excpVec : _GEN_2643; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2645 = 4'h3 == wbIdx ? entries_3_excp_excpVec : _GEN_2644; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2646 = 4'h4 == wbIdx ? entries_4_excp_excpVec : _GEN_2645; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2647 = 4'h5 == wbIdx ? entries_5_excp_excpVec : _GEN_2646; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2648 = 4'h6 == wbIdx ? entries_6_excp_excpVec : _GEN_2647; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2649 = 4'h7 == wbIdx ? entries_7_excp_excpVec : _GEN_2648; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2650 = 4'h8 == wbIdx ? entries_8_excp_excpVec : _GEN_2649; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2651 = 4'h9 == wbIdx ? entries_9_excp_excpVec : _GEN_2650; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2652 = 4'ha == wbIdx ? entries_10_excp_excpVec : _GEN_2651; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2653 = 4'hb == wbIdx ? entries_11_excp_excpVec : _GEN_2652; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2654 = 4'hc == wbIdx ? entries_12_excp_excpVec : _GEN_2653; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2655 = 4'hd == wbIdx ? entries_13_excp_excpVec : _GEN_2654; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [16:0] _GEN_2656 = 4'he == wbIdx ? entries_14_excp_excpVec : _GEN_2655; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  wire [6:0] _GEN_2659 = 4'h1 == wbIdx ? entries_1_pdst : entries_0_pdst; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2660 = 4'h2 == wbIdx ? entries_2_pdst : _GEN_2659; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2661 = 4'h3 == wbIdx ? entries_3_pdst : _GEN_2660; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2662 = 4'h4 == wbIdx ? entries_4_pdst : _GEN_2661; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2663 = 4'h5 == wbIdx ? entries_5_pdst : _GEN_2662; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2664 = 4'h6 == wbIdx ? entries_6_pdst : _GEN_2663; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2665 = 4'h7 == wbIdx ? entries_7_pdst : _GEN_2664; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2666 = 4'h8 == wbIdx ? entries_8_pdst : _GEN_2665; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2667 = 4'h9 == wbIdx ? entries_9_pdst : _GEN_2666; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2668 = 4'ha == wbIdx ? entries_10_pdst : _GEN_2667; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2669 = 4'hb == wbIdx ? entries_11_pdst : _GEN_2668; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2670 = 4'hc == wbIdx ? entries_12_pdst : _GEN_2669; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2671 = 4'hd == wbIdx ? entries_13_pdst : _GEN_2670; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [6:0] _GEN_2672 = 4'he == wbIdx ? entries_14_pdst : _GEN_2671; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  wire [3:0] _GEN_2675 = 4'h1 == wbIdx ? entries_1_lqIdx : entries_0_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2676 = 4'h2 == wbIdx ? entries_2_lqIdx : _GEN_2675; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2677 = 4'h3 == wbIdx ? entries_3_lqIdx : _GEN_2676; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2678 = 4'h4 == wbIdx ? entries_4_lqIdx : _GEN_2677; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2679 = 4'h5 == wbIdx ? entries_5_lqIdx : _GEN_2678; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2680 = 4'h6 == wbIdx ? entries_6_lqIdx : _GEN_2679; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2681 = 4'h7 == wbIdx ? entries_7_lqIdx : _GEN_2680; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2682 = 4'h8 == wbIdx ? entries_8_lqIdx : _GEN_2681; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2683 = 4'h9 == wbIdx ? entries_9_lqIdx : _GEN_2682; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2684 = 4'ha == wbIdx ? entries_10_lqIdx : _GEN_2683; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2685 = 4'hb == wbIdx ? entries_11_lqIdx : _GEN_2684; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2686 = 4'hc == wbIdx ? entries_12_lqIdx : _GEN_2685; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2687 = 4'hd == wbIdx ? entries_13_lqIdx : _GEN_2686; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2688 = 4'he == wbIdx ? entries_14_lqIdx : _GEN_2687; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  wire [3:0] _GEN_2691 = 4'h1 == wbIdx ? entries_1_fuType : entries_0_fuType; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2692 = 4'h2 == wbIdx ? entries_2_fuType : _GEN_2691; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2693 = 4'h3 == wbIdx ? entries_3_fuType : _GEN_2692; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2694 = 4'h4 == wbIdx ? entries_4_fuType : _GEN_2693; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2695 = 4'h5 == wbIdx ? entries_5_fuType : _GEN_2694; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2696 = 4'h6 == wbIdx ? entries_6_fuType : _GEN_2695; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2697 = 4'h7 == wbIdx ? entries_7_fuType : _GEN_2696; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2698 = 4'h8 == wbIdx ? entries_8_fuType : _GEN_2697; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2699 = 4'h9 == wbIdx ? entries_9_fuType : _GEN_2698; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2700 = 4'ha == wbIdx ? entries_10_fuType : _GEN_2699; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2701 = 4'hb == wbIdx ? entries_11_fuType : _GEN_2700; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2702 = 4'hc == wbIdx ? entries_12_fuType : _GEN_2701; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2703 = 4'hd == wbIdx ? entries_13_fuType : _GEN_2702; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire [3:0] _GEN_2704 = 4'he == wbIdx ? entries_14_fuType : _GEN_2703; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  wire  _T_32 = io_outResult_ready & io_outResult_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_2706 = 4'h0 == wbIdx | _GEN_1008; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2707 = 4'h1 == wbIdx | _GEN_1009; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2708 = 4'h2 == wbIdx | _GEN_1010; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2709 = 4'h3 == wbIdx | _GEN_1011; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2710 = 4'h4 == wbIdx | _GEN_1012; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2711 = 4'h5 == wbIdx | _GEN_1013; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2712 = 4'h6 == wbIdx | _GEN_1014; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2713 = 4'h7 == wbIdx | _GEN_1015; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2714 = 4'h8 == wbIdx | _GEN_1016; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2715 = 4'h9 == wbIdx | _GEN_1017; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2716 = 4'ha == wbIdx | _GEN_1018; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2717 = 4'hb == wbIdx | _GEN_1019; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2718 = 4'hc == wbIdx | _GEN_1020; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2719 = 4'hd == wbIdx | _GEN_1021; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2720 = 4'he == wbIdx | _GEN_1022; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2721 = 4'hf == wbIdx | _GEN_1023; // @[src/main/scala/memory/StoreQueue.scala 350:{32,32}]
  wire  _GEN_2738 = 4'h0 == io_robCommit_0_sqIdx | _GEN_976; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2739 = 4'h1 == io_robCommit_0_sqIdx | _GEN_977; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2740 = 4'h2 == io_robCommit_0_sqIdx | _GEN_978; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2741 = 4'h3 == io_robCommit_0_sqIdx | _GEN_979; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2742 = 4'h4 == io_robCommit_0_sqIdx | _GEN_980; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2743 = 4'h5 == io_robCommit_0_sqIdx | _GEN_981; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2744 = 4'h6 == io_robCommit_0_sqIdx | _GEN_982; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2745 = 4'h7 == io_robCommit_0_sqIdx | _GEN_983; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2746 = 4'h8 == io_robCommit_0_sqIdx | _GEN_984; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2747 = 4'h9 == io_robCommit_0_sqIdx | _GEN_985; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2748 = 4'ha == io_robCommit_0_sqIdx | _GEN_986; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2749 = 4'hb == io_robCommit_0_sqIdx | _GEN_987; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2750 = 4'hc == io_robCommit_0_sqIdx | _GEN_988; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2751 = 4'hd == io_robCommit_0_sqIdx | _GEN_989; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2752 = 4'he == io_robCommit_0_sqIdx | _GEN_990; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2753 = 4'hf == io_robCommit_0_sqIdx | _GEN_991; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2754 = io_robCommit_0_valid ? _GEN_2738 : _GEN_976; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2755 = io_robCommit_0_valid ? _GEN_2739 : _GEN_977; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2756 = io_robCommit_0_valid ? _GEN_2740 : _GEN_978; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2757 = io_robCommit_0_valid ? _GEN_2741 : _GEN_979; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2758 = io_robCommit_0_valid ? _GEN_2742 : _GEN_980; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2759 = io_robCommit_0_valid ? _GEN_2743 : _GEN_981; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2760 = io_robCommit_0_valid ? _GEN_2744 : _GEN_982; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2761 = io_robCommit_0_valid ? _GEN_2745 : _GEN_983; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2762 = io_robCommit_0_valid ? _GEN_2746 : _GEN_984; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2763 = io_robCommit_0_valid ? _GEN_2747 : _GEN_985; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2764 = io_robCommit_0_valid ? _GEN_2748 : _GEN_986; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2765 = io_robCommit_0_valid ? _GEN_2749 : _GEN_987; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2766 = io_robCommit_0_valid ? _GEN_2750 : _GEN_988; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2767 = io_robCommit_0_valid ? _GEN_2751 : _GEN_989; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2768 = io_robCommit_0_valid ? _GEN_2752 : _GEN_990; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2769 = io_robCommit_0_valid ? _GEN_2753 : _GEN_991; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2770 = 4'h0 == io_robCommit_1_sqIdx | _GEN_2754; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2771 = 4'h1 == io_robCommit_1_sqIdx | _GEN_2755; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2772 = 4'h2 == io_robCommit_1_sqIdx | _GEN_2756; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2773 = 4'h3 == io_robCommit_1_sqIdx | _GEN_2757; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2774 = 4'h4 == io_robCommit_1_sqIdx | _GEN_2758; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2775 = 4'h5 == io_robCommit_1_sqIdx | _GEN_2759; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2776 = 4'h6 == io_robCommit_1_sqIdx | _GEN_2760; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2777 = 4'h7 == io_robCommit_1_sqIdx | _GEN_2761; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2778 = 4'h8 == io_robCommit_1_sqIdx | _GEN_2762; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2779 = 4'h9 == io_robCommit_1_sqIdx | _GEN_2763; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2780 = 4'ha == io_robCommit_1_sqIdx | _GEN_2764; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2781 = 4'hb == io_robCommit_1_sqIdx | _GEN_2765; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2782 = 4'hc == io_robCommit_1_sqIdx | _GEN_2766; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2783 = 4'hd == io_robCommit_1_sqIdx | _GEN_2767; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2784 = 4'he == io_robCommit_1_sqIdx | _GEN_2768; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2785 = 4'hf == io_robCommit_1_sqIdx | _GEN_2769; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2786 = io_robCommit_1_valid ? _GEN_2770 : _GEN_2754; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2787 = io_robCommit_1_valid ? _GEN_2771 : _GEN_2755; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2788 = io_robCommit_1_valid ? _GEN_2772 : _GEN_2756; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2789 = io_robCommit_1_valid ? _GEN_2773 : _GEN_2757; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2790 = io_robCommit_1_valid ? _GEN_2774 : _GEN_2758; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2791 = io_robCommit_1_valid ? _GEN_2775 : _GEN_2759; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2792 = io_robCommit_1_valid ? _GEN_2776 : _GEN_2760; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2793 = io_robCommit_1_valid ? _GEN_2777 : _GEN_2761; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2794 = io_robCommit_1_valid ? _GEN_2778 : _GEN_2762; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2795 = io_robCommit_1_valid ? _GEN_2779 : _GEN_2763; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2796 = io_robCommit_1_valid ? _GEN_2780 : _GEN_2764; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2797 = io_robCommit_1_valid ? _GEN_2781 : _GEN_2765; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2798 = io_robCommit_1_valid ? _GEN_2782 : _GEN_2766; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2799 = io_robCommit_1_valid ? _GEN_2783 : _GEN_2767; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2800 = io_robCommit_1_valid ? _GEN_2784 : _GEN_2768; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2801 = io_robCommit_1_valid ? _GEN_2785 : _GEN_2769; // @[src/main/scala/memory/StoreQueue.scala 358:33]
  wire  _GEN_2802 = 4'h0 == io_robCommit_2_sqIdx | _GEN_2786; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2803 = 4'h1 == io_robCommit_2_sqIdx | _GEN_2787; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2804 = 4'h2 == io_robCommit_2_sqIdx | _GEN_2788; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2805 = 4'h3 == io_robCommit_2_sqIdx | _GEN_2789; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2806 = 4'h4 == io_robCommit_2_sqIdx | _GEN_2790; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2807 = 4'h5 == io_robCommit_2_sqIdx | _GEN_2791; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2808 = 4'h6 == io_robCommit_2_sqIdx | _GEN_2792; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2809 = 4'h7 == io_robCommit_2_sqIdx | _GEN_2793; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2810 = 4'h8 == io_robCommit_2_sqIdx | _GEN_2794; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2811 = 4'h9 == io_robCommit_2_sqIdx | _GEN_2795; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2812 = 4'ha == io_robCommit_2_sqIdx | _GEN_2796; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2813 = 4'hb == io_robCommit_2_sqIdx | _GEN_2797; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2814 = 4'hc == io_robCommit_2_sqIdx | _GEN_2798; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2815 = 4'hd == io_robCommit_2_sqIdx | _GEN_2799; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2816 = 4'he == io_robCommit_2_sqIdx | _GEN_2800; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2817 = 4'hf == io_robCommit_2_sqIdx | _GEN_2801; // @[src/main/scala/memory/StoreQueue.scala 360:{30,30}]
  wire  _GEN_2851 = 4'h1 == idx ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2852 = 4'h2 == idx ? entries_2_committed : _GEN_2851; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2853 = 4'h3 == idx ? entries_3_committed : _GEN_2852; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2854 = 4'h4 == idx ? entries_4_committed : _GEN_2853; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2855 = 4'h5 == idx ? entries_5_committed : _GEN_2854; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2856 = 4'h6 == idx ? entries_6_committed : _GEN_2855; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2857 = 4'h7 == idx ? entries_7_committed : _GEN_2856; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2858 = 4'h8 == idx ? entries_8_committed : _GEN_2857; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2859 = 4'h9 == idx ? entries_9_committed : _GEN_2858; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2860 = 4'ha == idx ? entries_10_committed : _GEN_2859; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2861 = 4'hb == idx ? entries_11_committed : _GEN_2860; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2862 = 4'hc == idx ? entries_12_committed : _GEN_2861; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2863 = 4'hd == idx ? entries_13_committed : _GEN_2862; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2864 = 4'he == idx ? entries_14_committed : _GEN_2863; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2865 = 4'hf == idx ? entries_15_committed : _GEN_2864; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_2867 = 4'h1 == idx ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2868 = 4'h2 == idx ? entries_2_excp_excpVec : _GEN_2867; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2869 = 4'h3 == idx ? entries_3_excp_excpVec : _GEN_2868; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2870 = 4'h4 == idx ? entries_4_excp_excpVec : _GEN_2869; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2871 = 4'h5 == idx ? entries_5_excp_excpVec : _GEN_2870; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2872 = 4'h6 == idx ? entries_6_excp_excpVec : _GEN_2871; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2873 = 4'h7 == idx ? entries_7_excp_excpVec : _GEN_2872; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2874 = 4'h8 == idx ? entries_8_excp_excpVec : _GEN_2873; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2875 = 4'h9 == idx ? entries_9_excp_excpVec : _GEN_2874; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2876 = 4'ha == idx ? entries_10_excp_excpVec : _GEN_2875; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2877 = 4'hb == idx ? entries_11_excp_excpVec : _GEN_2876; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2878 = 4'hc == idx ? entries_12_excp_excpVec : _GEN_2877; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2879 = 4'hd == idx ? entries_13_excp_excpVec : _GEN_2878; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2880 = 4'he == idx ? entries_14_excp_excpVec : _GEN_2879; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2881 = 4'hf == idx ? entries_15_excp_excpVec : _GEN_2880; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_0_T_1 = _GEN_2881 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_2883 = 4'h1 == idx ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2884 = 4'h2 == idx ? entries_2_dcacheIssued : _GEN_2883; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2885 = 4'h3 == idx ? entries_3_dcacheIssued : _GEN_2884; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2886 = 4'h4 == idx ? entries_4_dcacheIssued : _GEN_2885; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2887 = 4'h5 == idx ? entries_5_dcacheIssued : _GEN_2886; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2888 = 4'h6 == idx ? entries_6_dcacheIssued : _GEN_2887; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2889 = 4'h7 == idx ? entries_7_dcacheIssued : _GEN_2888; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2890 = 4'h8 == idx ? entries_8_dcacheIssued : _GEN_2889; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2891 = 4'h9 == idx ? entries_9_dcacheIssued : _GEN_2890; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2892 = 4'ha == idx ? entries_10_dcacheIssued : _GEN_2891; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2893 = 4'hb == idx ? entries_11_dcacheIssued : _GEN_2892; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2894 = 4'hc == idx ? entries_12_dcacheIssued : _GEN_2893; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2895 = 4'hd == idx ? entries_13_dcacheIssued : _GEN_2894; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2896 = 4'he == idx ? entries_14_dcacheIssued : _GEN_2895; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2897 = 4'hf == idx ? entries_15_dcacheIssued : _GEN_2896; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_0 = _GEN_31 & _GEN_2865 & ~_dcacheCandidates_0_T_1 & ~_GEN_2897 & _activeCandidates_0_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_2931 = 4'h1 == idx_1 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2932 = 4'h2 == idx_1 ? entries_2_committed : _GEN_2931; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2933 = 4'h3 == idx_1 ? entries_3_committed : _GEN_2932; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2934 = 4'h4 == idx_1 ? entries_4_committed : _GEN_2933; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2935 = 4'h5 == idx_1 ? entries_5_committed : _GEN_2934; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2936 = 4'h6 == idx_1 ? entries_6_committed : _GEN_2935; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2937 = 4'h7 == idx_1 ? entries_7_committed : _GEN_2936; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2938 = 4'h8 == idx_1 ? entries_8_committed : _GEN_2937; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2939 = 4'h9 == idx_1 ? entries_9_committed : _GEN_2938; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2940 = 4'ha == idx_1 ? entries_10_committed : _GEN_2939; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2941 = 4'hb == idx_1 ? entries_11_committed : _GEN_2940; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2942 = 4'hc == idx_1 ? entries_12_committed : _GEN_2941; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2943 = 4'hd == idx_1 ? entries_13_committed : _GEN_2942; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2944 = 4'he == idx_1 ? entries_14_committed : _GEN_2943; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_2945 = 4'hf == idx_1 ? entries_15_committed : _GEN_2944; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_2947 = 4'h1 == idx_1 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2948 = 4'h2 == idx_1 ? entries_2_excp_excpVec : _GEN_2947; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2949 = 4'h3 == idx_1 ? entries_3_excp_excpVec : _GEN_2948; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2950 = 4'h4 == idx_1 ? entries_4_excp_excpVec : _GEN_2949; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2951 = 4'h5 == idx_1 ? entries_5_excp_excpVec : _GEN_2950; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2952 = 4'h6 == idx_1 ? entries_6_excp_excpVec : _GEN_2951; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2953 = 4'h7 == idx_1 ? entries_7_excp_excpVec : _GEN_2952; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2954 = 4'h8 == idx_1 ? entries_8_excp_excpVec : _GEN_2953; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2955 = 4'h9 == idx_1 ? entries_9_excp_excpVec : _GEN_2954; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2956 = 4'ha == idx_1 ? entries_10_excp_excpVec : _GEN_2955; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2957 = 4'hb == idx_1 ? entries_11_excp_excpVec : _GEN_2956; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2958 = 4'hc == idx_1 ? entries_12_excp_excpVec : _GEN_2957; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2959 = 4'hd == idx_1 ? entries_13_excp_excpVec : _GEN_2958; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2960 = 4'he == idx_1 ? entries_14_excp_excpVec : _GEN_2959; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_2961 = 4'hf == idx_1 ? entries_15_excp_excpVec : _GEN_2960; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_1_T_1 = _GEN_2961 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_2963 = 4'h1 == idx_1 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2964 = 4'h2 == idx_1 ? entries_2_dcacheIssued : _GEN_2963; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2965 = 4'h3 == idx_1 ? entries_3_dcacheIssued : _GEN_2964; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2966 = 4'h4 == idx_1 ? entries_4_dcacheIssued : _GEN_2965; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2967 = 4'h5 == idx_1 ? entries_5_dcacheIssued : _GEN_2966; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2968 = 4'h6 == idx_1 ? entries_6_dcacheIssued : _GEN_2967; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2969 = 4'h7 == idx_1 ? entries_7_dcacheIssued : _GEN_2968; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2970 = 4'h8 == idx_1 ? entries_8_dcacheIssued : _GEN_2969; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2971 = 4'h9 == idx_1 ? entries_9_dcacheIssued : _GEN_2970; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2972 = 4'ha == idx_1 ? entries_10_dcacheIssued : _GEN_2971; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2973 = 4'hb == idx_1 ? entries_11_dcacheIssued : _GEN_2972; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2974 = 4'hc == idx_1 ? entries_12_dcacheIssued : _GEN_2973; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2975 = 4'hd == idx_1 ? entries_13_dcacheIssued : _GEN_2974; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2976 = 4'he == idx_1 ? entries_14_dcacheIssued : _GEN_2975; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_2977 = 4'hf == idx_1 ? entries_15_dcacheIssued : _GEN_2976; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_1 = _GEN_63 & _GEN_2945 & ~_dcacheCandidates_1_T_1 & ~_GEN_2977 & _activeCandidates_1_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3011 = 4'h1 == idx_2 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3012 = 4'h2 == idx_2 ? entries_2_committed : _GEN_3011; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3013 = 4'h3 == idx_2 ? entries_3_committed : _GEN_3012; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3014 = 4'h4 == idx_2 ? entries_4_committed : _GEN_3013; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3015 = 4'h5 == idx_2 ? entries_5_committed : _GEN_3014; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3016 = 4'h6 == idx_2 ? entries_6_committed : _GEN_3015; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3017 = 4'h7 == idx_2 ? entries_7_committed : _GEN_3016; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3018 = 4'h8 == idx_2 ? entries_8_committed : _GEN_3017; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3019 = 4'h9 == idx_2 ? entries_9_committed : _GEN_3018; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3020 = 4'ha == idx_2 ? entries_10_committed : _GEN_3019; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3021 = 4'hb == idx_2 ? entries_11_committed : _GEN_3020; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3022 = 4'hc == idx_2 ? entries_12_committed : _GEN_3021; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3023 = 4'hd == idx_2 ? entries_13_committed : _GEN_3022; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3024 = 4'he == idx_2 ? entries_14_committed : _GEN_3023; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3025 = 4'hf == idx_2 ? entries_15_committed : _GEN_3024; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3027 = 4'h1 == idx_2 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3028 = 4'h2 == idx_2 ? entries_2_excp_excpVec : _GEN_3027; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3029 = 4'h3 == idx_2 ? entries_3_excp_excpVec : _GEN_3028; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3030 = 4'h4 == idx_2 ? entries_4_excp_excpVec : _GEN_3029; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3031 = 4'h5 == idx_2 ? entries_5_excp_excpVec : _GEN_3030; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3032 = 4'h6 == idx_2 ? entries_6_excp_excpVec : _GEN_3031; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3033 = 4'h7 == idx_2 ? entries_7_excp_excpVec : _GEN_3032; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3034 = 4'h8 == idx_2 ? entries_8_excp_excpVec : _GEN_3033; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3035 = 4'h9 == idx_2 ? entries_9_excp_excpVec : _GEN_3034; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3036 = 4'ha == idx_2 ? entries_10_excp_excpVec : _GEN_3035; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3037 = 4'hb == idx_2 ? entries_11_excp_excpVec : _GEN_3036; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3038 = 4'hc == idx_2 ? entries_12_excp_excpVec : _GEN_3037; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3039 = 4'hd == idx_2 ? entries_13_excp_excpVec : _GEN_3038; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3040 = 4'he == idx_2 ? entries_14_excp_excpVec : _GEN_3039; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3041 = 4'hf == idx_2 ? entries_15_excp_excpVec : _GEN_3040; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_2_T_1 = _GEN_3041 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3043 = 4'h1 == idx_2 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3044 = 4'h2 == idx_2 ? entries_2_dcacheIssued : _GEN_3043; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3045 = 4'h3 == idx_2 ? entries_3_dcacheIssued : _GEN_3044; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3046 = 4'h4 == idx_2 ? entries_4_dcacheIssued : _GEN_3045; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3047 = 4'h5 == idx_2 ? entries_5_dcacheIssued : _GEN_3046; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3048 = 4'h6 == idx_2 ? entries_6_dcacheIssued : _GEN_3047; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3049 = 4'h7 == idx_2 ? entries_7_dcacheIssued : _GEN_3048; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3050 = 4'h8 == idx_2 ? entries_8_dcacheIssued : _GEN_3049; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3051 = 4'h9 == idx_2 ? entries_9_dcacheIssued : _GEN_3050; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3052 = 4'ha == idx_2 ? entries_10_dcacheIssued : _GEN_3051; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3053 = 4'hb == idx_2 ? entries_11_dcacheIssued : _GEN_3052; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3054 = 4'hc == idx_2 ? entries_12_dcacheIssued : _GEN_3053; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3055 = 4'hd == idx_2 ? entries_13_dcacheIssued : _GEN_3054; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3056 = 4'he == idx_2 ? entries_14_dcacheIssued : _GEN_3055; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3057 = 4'hf == idx_2 ? entries_15_dcacheIssued : _GEN_3056; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_2 = _GEN_95 & _GEN_3025 & ~_dcacheCandidates_2_T_1 & ~_GEN_3057 & _activeCandidates_2_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3091 = 4'h1 == idx_3 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3092 = 4'h2 == idx_3 ? entries_2_committed : _GEN_3091; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3093 = 4'h3 == idx_3 ? entries_3_committed : _GEN_3092; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3094 = 4'h4 == idx_3 ? entries_4_committed : _GEN_3093; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3095 = 4'h5 == idx_3 ? entries_5_committed : _GEN_3094; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3096 = 4'h6 == idx_3 ? entries_6_committed : _GEN_3095; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3097 = 4'h7 == idx_3 ? entries_7_committed : _GEN_3096; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3098 = 4'h8 == idx_3 ? entries_8_committed : _GEN_3097; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3099 = 4'h9 == idx_3 ? entries_9_committed : _GEN_3098; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3100 = 4'ha == idx_3 ? entries_10_committed : _GEN_3099; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3101 = 4'hb == idx_3 ? entries_11_committed : _GEN_3100; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3102 = 4'hc == idx_3 ? entries_12_committed : _GEN_3101; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3103 = 4'hd == idx_3 ? entries_13_committed : _GEN_3102; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3104 = 4'he == idx_3 ? entries_14_committed : _GEN_3103; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3105 = 4'hf == idx_3 ? entries_15_committed : _GEN_3104; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3107 = 4'h1 == idx_3 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3108 = 4'h2 == idx_3 ? entries_2_excp_excpVec : _GEN_3107; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3109 = 4'h3 == idx_3 ? entries_3_excp_excpVec : _GEN_3108; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3110 = 4'h4 == idx_3 ? entries_4_excp_excpVec : _GEN_3109; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3111 = 4'h5 == idx_3 ? entries_5_excp_excpVec : _GEN_3110; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3112 = 4'h6 == idx_3 ? entries_6_excp_excpVec : _GEN_3111; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3113 = 4'h7 == idx_3 ? entries_7_excp_excpVec : _GEN_3112; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3114 = 4'h8 == idx_3 ? entries_8_excp_excpVec : _GEN_3113; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3115 = 4'h9 == idx_3 ? entries_9_excp_excpVec : _GEN_3114; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3116 = 4'ha == idx_3 ? entries_10_excp_excpVec : _GEN_3115; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3117 = 4'hb == idx_3 ? entries_11_excp_excpVec : _GEN_3116; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3118 = 4'hc == idx_3 ? entries_12_excp_excpVec : _GEN_3117; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3119 = 4'hd == idx_3 ? entries_13_excp_excpVec : _GEN_3118; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3120 = 4'he == idx_3 ? entries_14_excp_excpVec : _GEN_3119; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3121 = 4'hf == idx_3 ? entries_15_excp_excpVec : _GEN_3120; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_3_T_1 = _GEN_3121 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3123 = 4'h1 == idx_3 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3124 = 4'h2 == idx_3 ? entries_2_dcacheIssued : _GEN_3123; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3125 = 4'h3 == idx_3 ? entries_3_dcacheIssued : _GEN_3124; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3126 = 4'h4 == idx_3 ? entries_4_dcacheIssued : _GEN_3125; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3127 = 4'h5 == idx_3 ? entries_5_dcacheIssued : _GEN_3126; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3128 = 4'h6 == idx_3 ? entries_6_dcacheIssued : _GEN_3127; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3129 = 4'h7 == idx_3 ? entries_7_dcacheIssued : _GEN_3128; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3130 = 4'h8 == idx_3 ? entries_8_dcacheIssued : _GEN_3129; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3131 = 4'h9 == idx_3 ? entries_9_dcacheIssued : _GEN_3130; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3132 = 4'ha == idx_3 ? entries_10_dcacheIssued : _GEN_3131; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3133 = 4'hb == idx_3 ? entries_11_dcacheIssued : _GEN_3132; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3134 = 4'hc == idx_3 ? entries_12_dcacheIssued : _GEN_3133; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3135 = 4'hd == idx_3 ? entries_13_dcacheIssued : _GEN_3134; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3136 = 4'he == idx_3 ? entries_14_dcacheIssued : _GEN_3135; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3137 = 4'hf == idx_3 ? entries_15_dcacheIssued : _GEN_3136; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_3 = _GEN_127 & _GEN_3105 & ~_dcacheCandidates_3_T_1 & ~_GEN_3137 & _activeCandidates_3_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3171 = 4'h1 == idx_4 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3172 = 4'h2 == idx_4 ? entries_2_committed : _GEN_3171; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3173 = 4'h3 == idx_4 ? entries_3_committed : _GEN_3172; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3174 = 4'h4 == idx_4 ? entries_4_committed : _GEN_3173; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3175 = 4'h5 == idx_4 ? entries_5_committed : _GEN_3174; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3176 = 4'h6 == idx_4 ? entries_6_committed : _GEN_3175; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3177 = 4'h7 == idx_4 ? entries_7_committed : _GEN_3176; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3178 = 4'h8 == idx_4 ? entries_8_committed : _GEN_3177; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3179 = 4'h9 == idx_4 ? entries_9_committed : _GEN_3178; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3180 = 4'ha == idx_4 ? entries_10_committed : _GEN_3179; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3181 = 4'hb == idx_4 ? entries_11_committed : _GEN_3180; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3182 = 4'hc == idx_4 ? entries_12_committed : _GEN_3181; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3183 = 4'hd == idx_4 ? entries_13_committed : _GEN_3182; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3184 = 4'he == idx_4 ? entries_14_committed : _GEN_3183; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3185 = 4'hf == idx_4 ? entries_15_committed : _GEN_3184; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3187 = 4'h1 == idx_4 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3188 = 4'h2 == idx_4 ? entries_2_excp_excpVec : _GEN_3187; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3189 = 4'h3 == idx_4 ? entries_3_excp_excpVec : _GEN_3188; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3190 = 4'h4 == idx_4 ? entries_4_excp_excpVec : _GEN_3189; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3191 = 4'h5 == idx_4 ? entries_5_excp_excpVec : _GEN_3190; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3192 = 4'h6 == idx_4 ? entries_6_excp_excpVec : _GEN_3191; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3193 = 4'h7 == idx_4 ? entries_7_excp_excpVec : _GEN_3192; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3194 = 4'h8 == idx_4 ? entries_8_excp_excpVec : _GEN_3193; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3195 = 4'h9 == idx_4 ? entries_9_excp_excpVec : _GEN_3194; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3196 = 4'ha == idx_4 ? entries_10_excp_excpVec : _GEN_3195; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3197 = 4'hb == idx_4 ? entries_11_excp_excpVec : _GEN_3196; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3198 = 4'hc == idx_4 ? entries_12_excp_excpVec : _GEN_3197; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3199 = 4'hd == idx_4 ? entries_13_excp_excpVec : _GEN_3198; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3200 = 4'he == idx_4 ? entries_14_excp_excpVec : _GEN_3199; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3201 = 4'hf == idx_4 ? entries_15_excp_excpVec : _GEN_3200; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_4_T_1 = _GEN_3201 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3203 = 4'h1 == idx_4 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3204 = 4'h2 == idx_4 ? entries_2_dcacheIssued : _GEN_3203; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3205 = 4'h3 == idx_4 ? entries_3_dcacheIssued : _GEN_3204; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3206 = 4'h4 == idx_4 ? entries_4_dcacheIssued : _GEN_3205; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3207 = 4'h5 == idx_4 ? entries_5_dcacheIssued : _GEN_3206; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3208 = 4'h6 == idx_4 ? entries_6_dcacheIssued : _GEN_3207; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3209 = 4'h7 == idx_4 ? entries_7_dcacheIssued : _GEN_3208; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3210 = 4'h8 == idx_4 ? entries_8_dcacheIssued : _GEN_3209; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3211 = 4'h9 == idx_4 ? entries_9_dcacheIssued : _GEN_3210; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3212 = 4'ha == idx_4 ? entries_10_dcacheIssued : _GEN_3211; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3213 = 4'hb == idx_4 ? entries_11_dcacheIssued : _GEN_3212; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3214 = 4'hc == idx_4 ? entries_12_dcacheIssued : _GEN_3213; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3215 = 4'hd == idx_4 ? entries_13_dcacheIssued : _GEN_3214; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3216 = 4'he == idx_4 ? entries_14_dcacheIssued : _GEN_3215; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3217 = 4'hf == idx_4 ? entries_15_dcacheIssued : _GEN_3216; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_4 = _GEN_159 & _GEN_3185 & ~_dcacheCandidates_4_T_1 & ~_GEN_3217 & _activeCandidates_4_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3251 = 4'h1 == idx_5 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3252 = 4'h2 == idx_5 ? entries_2_committed : _GEN_3251; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3253 = 4'h3 == idx_5 ? entries_3_committed : _GEN_3252; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3254 = 4'h4 == idx_5 ? entries_4_committed : _GEN_3253; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3255 = 4'h5 == idx_5 ? entries_5_committed : _GEN_3254; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3256 = 4'h6 == idx_5 ? entries_6_committed : _GEN_3255; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3257 = 4'h7 == idx_5 ? entries_7_committed : _GEN_3256; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3258 = 4'h8 == idx_5 ? entries_8_committed : _GEN_3257; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3259 = 4'h9 == idx_5 ? entries_9_committed : _GEN_3258; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3260 = 4'ha == idx_5 ? entries_10_committed : _GEN_3259; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3261 = 4'hb == idx_5 ? entries_11_committed : _GEN_3260; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3262 = 4'hc == idx_5 ? entries_12_committed : _GEN_3261; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3263 = 4'hd == idx_5 ? entries_13_committed : _GEN_3262; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3264 = 4'he == idx_5 ? entries_14_committed : _GEN_3263; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3265 = 4'hf == idx_5 ? entries_15_committed : _GEN_3264; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3267 = 4'h1 == idx_5 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3268 = 4'h2 == idx_5 ? entries_2_excp_excpVec : _GEN_3267; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3269 = 4'h3 == idx_5 ? entries_3_excp_excpVec : _GEN_3268; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3270 = 4'h4 == idx_5 ? entries_4_excp_excpVec : _GEN_3269; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3271 = 4'h5 == idx_5 ? entries_5_excp_excpVec : _GEN_3270; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3272 = 4'h6 == idx_5 ? entries_6_excp_excpVec : _GEN_3271; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3273 = 4'h7 == idx_5 ? entries_7_excp_excpVec : _GEN_3272; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3274 = 4'h8 == idx_5 ? entries_8_excp_excpVec : _GEN_3273; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3275 = 4'h9 == idx_5 ? entries_9_excp_excpVec : _GEN_3274; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3276 = 4'ha == idx_5 ? entries_10_excp_excpVec : _GEN_3275; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3277 = 4'hb == idx_5 ? entries_11_excp_excpVec : _GEN_3276; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3278 = 4'hc == idx_5 ? entries_12_excp_excpVec : _GEN_3277; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3279 = 4'hd == idx_5 ? entries_13_excp_excpVec : _GEN_3278; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3280 = 4'he == idx_5 ? entries_14_excp_excpVec : _GEN_3279; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3281 = 4'hf == idx_5 ? entries_15_excp_excpVec : _GEN_3280; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_5_T_1 = _GEN_3281 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3283 = 4'h1 == idx_5 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3284 = 4'h2 == idx_5 ? entries_2_dcacheIssued : _GEN_3283; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3285 = 4'h3 == idx_5 ? entries_3_dcacheIssued : _GEN_3284; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3286 = 4'h4 == idx_5 ? entries_4_dcacheIssued : _GEN_3285; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3287 = 4'h5 == idx_5 ? entries_5_dcacheIssued : _GEN_3286; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3288 = 4'h6 == idx_5 ? entries_6_dcacheIssued : _GEN_3287; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3289 = 4'h7 == idx_5 ? entries_7_dcacheIssued : _GEN_3288; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3290 = 4'h8 == idx_5 ? entries_8_dcacheIssued : _GEN_3289; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3291 = 4'h9 == idx_5 ? entries_9_dcacheIssued : _GEN_3290; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3292 = 4'ha == idx_5 ? entries_10_dcacheIssued : _GEN_3291; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3293 = 4'hb == idx_5 ? entries_11_dcacheIssued : _GEN_3292; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3294 = 4'hc == idx_5 ? entries_12_dcacheIssued : _GEN_3293; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3295 = 4'hd == idx_5 ? entries_13_dcacheIssued : _GEN_3294; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3296 = 4'he == idx_5 ? entries_14_dcacheIssued : _GEN_3295; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3297 = 4'hf == idx_5 ? entries_15_dcacheIssued : _GEN_3296; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_5 = _GEN_191 & _GEN_3265 & ~_dcacheCandidates_5_T_1 & ~_GEN_3297 & _activeCandidates_5_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3331 = 4'h1 == idx_6 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3332 = 4'h2 == idx_6 ? entries_2_committed : _GEN_3331; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3333 = 4'h3 == idx_6 ? entries_3_committed : _GEN_3332; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3334 = 4'h4 == idx_6 ? entries_4_committed : _GEN_3333; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3335 = 4'h5 == idx_6 ? entries_5_committed : _GEN_3334; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3336 = 4'h6 == idx_6 ? entries_6_committed : _GEN_3335; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3337 = 4'h7 == idx_6 ? entries_7_committed : _GEN_3336; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3338 = 4'h8 == idx_6 ? entries_8_committed : _GEN_3337; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3339 = 4'h9 == idx_6 ? entries_9_committed : _GEN_3338; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3340 = 4'ha == idx_6 ? entries_10_committed : _GEN_3339; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3341 = 4'hb == idx_6 ? entries_11_committed : _GEN_3340; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3342 = 4'hc == idx_6 ? entries_12_committed : _GEN_3341; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3343 = 4'hd == idx_6 ? entries_13_committed : _GEN_3342; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3344 = 4'he == idx_6 ? entries_14_committed : _GEN_3343; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3345 = 4'hf == idx_6 ? entries_15_committed : _GEN_3344; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3347 = 4'h1 == idx_6 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3348 = 4'h2 == idx_6 ? entries_2_excp_excpVec : _GEN_3347; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3349 = 4'h3 == idx_6 ? entries_3_excp_excpVec : _GEN_3348; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3350 = 4'h4 == idx_6 ? entries_4_excp_excpVec : _GEN_3349; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3351 = 4'h5 == idx_6 ? entries_5_excp_excpVec : _GEN_3350; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3352 = 4'h6 == idx_6 ? entries_6_excp_excpVec : _GEN_3351; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3353 = 4'h7 == idx_6 ? entries_7_excp_excpVec : _GEN_3352; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3354 = 4'h8 == idx_6 ? entries_8_excp_excpVec : _GEN_3353; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3355 = 4'h9 == idx_6 ? entries_9_excp_excpVec : _GEN_3354; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3356 = 4'ha == idx_6 ? entries_10_excp_excpVec : _GEN_3355; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3357 = 4'hb == idx_6 ? entries_11_excp_excpVec : _GEN_3356; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3358 = 4'hc == idx_6 ? entries_12_excp_excpVec : _GEN_3357; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3359 = 4'hd == idx_6 ? entries_13_excp_excpVec : _GEN_3358; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3360 = 4'he == idx_6 ? entries_14_excp_excpVec : _GEN_3359; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3361 = 4'hf == idx_6 ? entries_15_excp_excpVec : _GEN_3360; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_6_T_1 = _GEN_3361 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3363 = 4'h1 == idx_6 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3364 = 4'h2 == idx_6 ? entries_2_dcacheIssued : _GEN_3363; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3365 = 4'h3 == idx_6 ? entries_3_dcacheIssued : _GEN_3364; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3366 = 4'h4 == idx_6 ? entries_4_dcacheIssued : _GEN_3365; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3367 = 4'h5 == idx_6 ? entries_5_dcacheIssued : _GEN_3366; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3368 = 4'h6 == idx_6 ? entries_6_dcacheIssued : _GEN_3367; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3369 = 4'h7 == idx_6 ? entries_7_dcacheIssued : _GEN_3368; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3370 = 4'h8 == idx_6 ? entries_8_dcacheIssued : _GEN_3369; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3371 = 4'h9 == idx_6 ? entries_9_dcacheIssued : _GEN_3370; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3372 = 4'ha == idx_6 ? entries_10_dcacheIssued : _GEN_3371; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3373 = 4'hb == idx_6 ? entries_11_dcacheIssued : _GEN_3372; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3374 = 4'hc == idx_6 ? entries_12_dcacheIssued : _GEN_3373; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3375 = 4'hd == idx_6 ? entries_13_dcacheIssued : _GEN_3374; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3376 = 4'he == idx_6 ? entries_14_dcacheIssued : _GEN_3375; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3377 = 4'hf == idx_6 ? entries_15_dcacheIssued : _GEN_3376; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_6 = _GEN_223 & _GEN_3345 & ~_dcacheCandidates_6_T_1 & ~_GEN_3377 & _activeCandidates_6_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3411 = 4'h1 == idx_7 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3412 = 4'h2 == idx_7 ? entries_2_committed : _GEN_3411; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3413 = 4'h3 == idx_7 ? entries_3_committed : _GEN_3412; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3414 = 4'h4 == idx_7 ? entries_4_committed : _GEN_3413; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3415 = 4'h5 == idx_7 ? entries_5_committed : _GEN_3414; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3416 = 4'h6 == idx_7 ? entries_6_committed : _GEN_3415; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3417 = 4'h7 == idx_7 ? entries_7_committed : _GEN_3416; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3418 = 4'h8 == idx_7 ? entries_8_committed : _GEN_3417; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3419 = 4'h9 == idx_7 ? entries_9_committed : _GEN_3418; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3420 = 4'ha == idx_7 ? entries_10_committed : _GEN_3419; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3421 = 4'hb == idx_7 ? entries_11_committed : _GEN_3420; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3422 = 4'hc == idx_7 ? entries_12_committed : _GEN_3421; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3423 = 4'hd == idx_7 ? entries_13_committed : _GEN_3422; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3424 = 4'he == idx_7 ? entries_14_committed : _GEN_3423; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3425 = 4'hf == idx_7 ? entries_15_committed : _GEN_3424; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3427 = 4'h1 == idx_7 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3428 = 4'h2 == idx_7 ? entries_2_excp_excpVec : _GEN_3427; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3429 = 4'h3 == idx_7 ? entries_3_excp_excpVec : _GEN_3428; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3430 = 4'h4 == idx_7 ? entries_4_excp_excpVec : _GEN_3429; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3431 = 4'h5 == idx_7 ? entries_5_excp_excpVec : _GEN_3430; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3432 = 4'h6 == idx_7 ? entries_6_excp_excpVec : _GEN_3431; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3433 = 4'h7 == idx_7 ? entries_7_excp_excpVec : _GEN_3432; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3434 = 4'h8 == idx_7 ? entries_8_excp_excpVec : _GEN_3433; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3435 = 4'h9 == idx_7 ? entries_9_excp_excpVec : _GEN_3434; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3436 = 4'ha == idx_7 ? entries_10_excp_excpVec : _GEN_3435; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3437 = 4'hb == idx_7 ? entries_11_excp_excpVec : _GEN_3436; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3438 = 4'hc == idx_7 ? entries_12_excp_excpVec : _GEN_3437; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3439 = 4'hd == idx_7 ? entries_13_excp_excpVec : _GEN_3438; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3440 = 4'he == idx_7 ? entries_14_excp_excpVec : _GEN_3439; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3441 = 4'hf == idx_7 ? entries_15_excp_excpVec : _GEN_3440; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_7_T_1 = _GEN_3441 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3443 = 4'h1 == idx_7 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3444 = 4'h2 == idx_7 ? entries_2_dcacheIssued : _GEN_3443; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3445 = 4'h3 == idx_7 ? entries_3_dcacheIssued : _GEN_3444; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3446 = 4'h4 == idx_7 ? entries_4_dcacheIssued : _GEN_3445; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3447 = 4'h5 == idx_7 ? entries_5_dcacheIssued : _GEN_3446; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3448 = 4'h6 == idx_7 ? entries_6_dcacheIssued : _GEN_3447; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3449 = 4'h7 == idx_7 ? entries_7_dcacheIssued : _GEN_3448; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3450 = 4'h8 == idx_7 ? entries_8_dcacheIssued : _GEN_3449; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3451 = 4'h9 == idx_7 ? entries_9_dcacheIssued : _GEN_3450; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3452 = 4'ha == idx_7 ? entries_10_dcacheIssued : _GEN_3451; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3453 = 4'hb == idx_7 ? entries_11_dcacheIssued : _GEN_3452; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3454 = 4'hc == idx_7 ? entries_12_dcacheIssued : _GEN_3453; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3455 = 4'hd == idx_7 ? entries_13_dcacheIssued : _GEN_3454; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3456 = 4'he == idx_7 ? entries_14_dcacheIssued : _GEN_3455; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3457 = 4'hf == idx_7 ? entries_15_dcacheIssued : _GEN_3456; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_7 = _GEN_255 & _GEN_3425 & ~_dcacheCandidates_7_T_1 & ~_GEN_3457 & _activeCandidates_7_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3491 = 4'h1 == idx_8 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3492 = 4'h2 == idx_8 ? entries_2_committed : _GEN_3491; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3493 = 4'h3 == idx_8 ? entries_3_committed : _GEN_3492; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3494 = 4'h4 == idx_8 ? entries_4_committed : _GEN_3493; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3495 = 4'h5 == idx_8 ? entries_5_committed : _GEN_3494; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3496 = 4'h6 == idx_8 ? entries_6_committed : _GEN_3495; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3497 = 4'h7 == idx_8 ? entries_7_committed : _GEN_3496; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3498 = 4'h8 == idx_8 ? entries_8_committed : _GEN_3497; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3499 = 4'h9 == idx_8 ? entries_9_committed : _GEN_3498; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3500 = 4'ha == idx_8 ? entries_10_committed : _GEN_3499; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3501 = 4'hb == idx_8 ? entries_11_committed : _GEN_3500; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3502 = 4'hc == idx_8 ? entries_12_committed : _GEN_3501; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3503 = 4'hd == idx_8 ? entries_13_committed : _GEN_3502; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3504 = 4'he == idx_8 ? entries_14_committed : _GEN_3503; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3505 = 4'hf == idx_8 ? entries_15_committed : _GEN_3504; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3507 = 4'h1 == idx_8 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3508 = 4'h2 == idx_8 ? entries_2_excp_excpVec : _GEN_3507; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3509 = 4'h3 == idx_8 ? entries_3_excp_excpVec : _GEN_3508; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3510 = 4'h4 == idx_8 ? entries_4_excp_excpVec : _GEN_3509; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3511 = 4'h5 == idx_8 ? entries_5_excp_excpVec : _GEN_3510; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3512 = 4'h6 == idx_8 ? entries_6_excp_excpVec : _GEN_3511; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3513 = 4'h7 == idx_8 ? entries_7_excp_excpVec : _GEN_3512; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3514 = 4'h8 == idx_8 ? entries_8_excp_excpVec : _GEN_3513; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3515 = 4'h9 == idx_8 ? entries_9_excp_excpVec : _GEN_3514; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3516 = 4'ha == idx_8 ? entries_10_excp_excpVec : _GEN_3515; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3517 = 4'hb == idx_8 ? entries_11_excp_excpVec : _GEN_3516; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3518 = 4'hc == idx_8 ? entries_12_excp_excpVec : _GEN_3517; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3519 = 4'hd == idx_8 ? entries_13_excp_excpVec : _GEN_3518; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3520 = 4'he == idx_8 ? entries_14_excp_excpVec : _GEN_3519; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3521 = 4'hf == idx_8 ? entries_15_excp_excpVec : _GEN_3520; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_8_T_1 = _GEN_3521 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3523 = 4'h1 == idx_8 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3524 = 4'h2 == idx_8 ? entries_2_dcacheIssued : _GEN_3523; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3525 = 4'h3 == idx_8 ? entries_3_dcacheIssued : _GEN_3524; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3526 = 4'h4 == idx_8 ? entries_4_dcacheIssued : _GEN_3525; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3527 = 4'h5 == idx_8 ? entries_5_dcacheIssued : _GEN_3526; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3528 = 4'h6 == idx_8 ? entries_6_dcacheIssued : _GEN_3527; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3529 = 4'h7 == idx_8 ? entries_7_dcacheIssued : _GEN_3528; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3530 = 4'h8 == idx_8 ? entries_8_dcacheIssued : _GEN_3529; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3531 = 4'h9 == idx_8 ? entries_9_dcacheIssued : _GEN_3530; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3532 = 4'ha == idx_8 ? entries_10_dcacheIssued : _GEN_3531; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3533 = 4'hb == idx_8 ? entries_11_dcacheIssued : _GEN_3532; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3534 = 4'hc == idx_8 ? entries_12_dcacheIssued : _GEN_3533; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3535 = 4'hd == idx_8 ? entries_13_dcacheIssued : _GEN_3534; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3536 = 4'he == idx_8 ? entries_14_dcacheIssued : _GEN_3535; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3537 = 4'hf == idx_8 ? entries_15_dcacheIssued : _GEN_3536; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_8 = _GEN_287 & _GEN_3505 & ~_dcacheCandidates_8_T_1 & ~_GEN_3537 & _activeCandidates_8_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3571 = 4'h1 == idx_9 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3572 = 4'h2 == idx_9 ? entries_2_committed : _GEN_3571; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3573 = 4'h3 == idx_9 ? entries_3_committed : _GEN_3572; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3574 = 4'h4 == idx_9 ? entries_4_committed : _GEN_3573; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3575 = 4'h5 == idx_9 ? entries_5_committed : _GEN_3574; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3576 = 4'h6 == idx_9 ? entries_6_committed : _GEN_3575; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3577 = 4'h7 == idx_9 ? entries_7_committed : _GEN_3576; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3578 = 4'h8 == idx_9 ? entries_8_committed : _GEN_3577; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3579 = 4'h9 == idx_9 ? entries_9_committed : _GEN_3578; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3580 = 4'ha == idx_9 ? entries_10_committed : _GEN_3579; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3581 = 4'hb == idx_9 ? entries_11_committed : _GEN_3580; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3582 = 4'hc == idx_9 ? entries_12_committed : _GEN_3581; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3583 = 4'hd == idx_9 ? entries_13_committed : _GEN_3582; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3584 = 4'he == idx_9 ? entries_14_committed : _GEN_3583; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3585 = 4'hf == idx_9 ? entries_15_committed : _GEN_3584; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3587 = 4'h1 == idx_9 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3588 = 4'h2 == idx_9 ? entries_2_excp_excpVec : _GEN_3587; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3589 = 4'h3 == idx_9 ? entries_3_excp_excpVec : _GEN_3588; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3590 = 4'h4 == idx_9 ? entries_4_excp_excpVec : _GEN_3589; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3591 = 4'h5 == idx_9 ? entries_5_excp_excpVec : _GEN_3590; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3592 = 4'h6 == idx_9 ? entries_6_excp_excpVec : _GEN_3591; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3593 = 4'h7 == idx_9 ? entries_7_excp_excpVec : _GEN_3592; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3594 = 4'h8 == idx_9 ? entries_8_excp_excpVec : _GEN_3593; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3595 = 4'h9 == idx_9 ? entries_9_excp_excpVec : _GEN_3594; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3596 = 4'ha == idx_9 ? entries_10_excp_excpVec : _GEN_3595; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3597 = 4'hb == idx_9 ? entries_11_excp_excpVec : _GEN_3596; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3598 = 4'hc == idx_9 ? entries_12_excp_excpVec : _GEN_3597; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3599 = 4'hd == idx_9 ? entries_13_excp_excpVec : _GEN_3598; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3600 = 4'he == idx_9 ? entries_14_excp_excpVec : _GEN_3599; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3601 = 4'hf == idx_9 ? entries_15_excp_excpVec : _GEN_3600; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_9_T_1 = _GEN_3601 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3603 = 4'h1 == idx_9 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3604 = 4'h2 == idx_9 ? entries_2_dcacheIssued : _GEN_3603; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3605 = 4'h3 == idx_9 ? entries_3_dcacheIssued : _GEN_3604; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3606 = 4'h4 == idx_9 ? entries_4_dcacheIssued : _GEN_3605; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3607 = 4'h5 == idx_9 ? entries_5_dcacheIssued : _GEN_3606; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3608 = 4'h6 == idx_9 ? entries_6_dcacheIssued : _GEN_3607; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3609 = 4'h7 == idx_9 ? entries_7_dcacheIssued : _GEN_3608; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3610 = 4'h8 == idx_9 ? entries_8_dcacheIssued : _GEN_3609; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3611 = 4'h9 == idx_9 ? entries_9_dcacheIssued : _GEN_3610; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3612 = 4'ha == idx_9 ? entries_10_dcacheIssued : _GEN_3611; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3613 = 4'hb == idx_9 ? entries_11_dcacheIssued : _GEN_3612; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3614 = 4'hc == idx_9 ? entries_12_dcacheIssued : _GEN_3613; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3615 = 4'hd == idx_9 ? entries_13_dcacheIssued : _GEN_3614; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3616 = 4'he == idx_9 ? entries_14_dcacheIssued : _GEN_3615; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3617 = 4'hf == idx_9 ? entries_15_dcacheIssued : _GEN_3616; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_9 = _GEN_319 & _GEN_3585 & ~_dcacheCandidates_9_T_1 & ~_GEN_3617 & _activeCandidates_9_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3651 = 4'h1 == idx_10 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3652 = 4'h2 == idx_10 ? entries_2_committed : _GEN_3651; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3653 = 4'h3 == idx_10 ? entries_3_committed : _GEN_3652; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3654 = 4'h4 == idx_10 ? entries_4_committed : _GEN_3653; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3655 = 4'h5 == idx_10 ? entries_5_committed : _GEN_3654; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3656 = 4'h6 == idx_10 ? entries_6_committed : _GEN_3655; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3657 = 4'h7 == idx_10 ? entries_7_committed : _GEN_3656; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3658 = 4'h8 == idx_10 ? entries_8_committed : _GEN_3657; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3659 = 4'h9 == idx_10 ? entries_9_committed : _GEN_3658; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3660 = 4'ha == idx_10 ? entries_10_committed : _GEN_3659; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3661 = 4'hb == idx_10 ? entries_11_committed : _GEN_3660; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3662 = 4'hc == idx_10 ? entries_12_committed : _GEN_3661; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3663 = 4'hd == idx_10 ? entries_13_committed : _GEN_3662; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3664 = 4'he == idx_10 ? entries_14_committed : _GEN_3663; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3665 = 4'hf == idx_10 ? entries_15_committed : _GEN_3664; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3667 = 4'h1 == idx_10 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3668 = 4'h2 == idx_10 ? entries_2_excp_excpVec : _GEN_3667; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3669 = 4'h3 == idx_10 ? entries_3_excp_excpVec : _GEN_3668; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3670 = 4'h4 == idx_10 ? entries_4_excp_excpVec : _GEN_3669; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3671 = 4'h5 == idx_10 ? entries_5_excp_excpVec : _GEN_3670; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3672 = 4'h6 == idx_10 ? entries_6_excp_excpVec : _GEN_3671; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3673 = 4'h7 == idx_10 ? entries_7_excp_excpVec : _GEN_3672; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3674 = 4'h8 == idx_10 ? entries_8_excp_excpVec : _GEN_3673; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3675 = 4'h9 == idx_10 ? entries_9_excp_excpVec : _GEN_3674; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3676 = 4'ha == idx_10 ? entries_10_excp_excpVec : _GEN_3675; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3677 = 4'hb == idx_10 ? entries_11_excp_excpVec : _GEN_3676; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3678 = 4'hc == idx_10 ? entries_12_excp_excpVec : _GEN_3677; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3679 = 4'hd == idx_10 ? entries_13_excp_excpVec : _GEN_3678; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3680 = 4'he == idx_10 ? entries_14_excp_excpVec : _GEN_3679; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3681 = 4'hf == idx_10 ? entries_15_excp_excpVec : _GEN_3680; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_10_T_1 = _GEN_3681 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3683 = 4'h1 == idx_10 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3684 = 4'h2 == idx_10 ? entries_2_dcacheIssued : _GEN_3683; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3685 = 4'h3 == idx_10 ? entries_3_dcacheIssued : _GEN_3684; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3686 = 4'h4 == idx_10 ? entries_4_dcacheIssued : _GEN_3685; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3687 = 4'h5 == idx_10 ? entries_5_dcacheIssued : _GEN_3686; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3688 = 4'h6 == idx_10 ? entries_6_dcacheIssued : _GEN_3687; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3689 = 4'h7 == idx_10 ? entries_7_dcacheIssued : _GEN_3688; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3690 = 4'h8 == idx_10 ? entries_8_dcacheIssued : _GEN_3689; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3691 = 4'h9 == idx_10 ? entries_9_dcacheIssued : _GEN_3690; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3692 = 4'ha == idx_10 ? entries_10_dcacheIssued : _GEN_3691; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3693 = 4'hb == idx_10 ? entries_11_dcacheIssued : _GEN_3692; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3694 = 4'hc == idx_10 ? entries_12_dcacheIssued : _GEN_3693; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3695 = 4'hd == idx_10 ? entries_13_dcacheIssued : _GEN_3694; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3696 = 4'he == idx_10 ? entries_14_dcacheIssued : _GEN_3695; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3697 = 4'hf == idx_10 ? entries_15_dcacheIssued : _GEN_3696; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_10 = _GEN_351 & _GEN_3665 & ~_dcacheCandidates_10_T_1 & ~_GEN_3697 & _activeCandidates_10_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3731 = 4'h1 == idx_11 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3732 = 4'h2 == idx_11 ? entries_2_committed : _GEN_3731; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3733 = 4'h3 == idx_11 ? entries_3_committed : _GEN_3732; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3734 = 4'h4 == idx_11 ? entries_4_committed : _GEN_3733; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3735 = 4'h5 == idx_11 ? entries_5_committed : _GEN_3734; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3736 = 4'h6 == idx_11 ? entries_6_committed : _GEN_3735; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3737 = 4'h7 == idx_11 ? entries_7_committed : _GEN_3736; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3738 = 4'h8 == idx_11 ? entries_8_committed : _GEN_3737; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3739 = 4'h9 == idx_11 ? entries_9_committed : _GEN_3738; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3740 = 4'ha == idx_11 ? entries_10_committed : _GEN_3739; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3741 = 4'hb == idx_11 ? entries_11_committed : _GEN_3740; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3742 = 4'hc == idx_11 ? entries_12_committed : _GEN_3741; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3743 = 4'hd == idx_11 ? entries_13_committed : _GEN_3742; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3744 = 4'he == idx_11 ? entries_14_committed : _GEN_3743; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3745 = 4'hf == idx_11 ? entries_15_committed : _GEN_3744; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3747 = 4'h1 == idx_11 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3748 = 4'h2 == idx_11 ? entries_2_excp_excpVec : _GEN_3747; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3749 = 4'h3 == idx_11 ? entries_3_excp_excpVec : _GEN_3748; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3750 = 4'h4 == idx_11 ? entries_4_excp_excpVec : _GEN_3749; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3751 = 4'h5 == idx_11 ? entries_5_excp_excpVec : _GEN_3750; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3752 = 4'h6 == idx_11 ? entries_6_excp_excpVec : _GEN_3751; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3753 = 4'h7 == idx_11 ? entries_7_excp_excpVec : _GEN_3752; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3754 = 4'h8 == idx_11 ? entries_8_excp_excpVec : _GEN_3753; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3755 = 4'h9 == idx_11 ? entries_9_excp_excpVec : _GEN_3754; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3756 = 4'ha == idx_11 ? entries_10_excp_excpVec : _GEN_3755; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3757 = 4'hb == idx_11 ? entries_11_excp_excpVec : _GEN_3756; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3758 = 4'hc == idx_11 ? entries_12_excp_excpVec : _GEN_3757; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3759 = 4'hd == idx_11 ? entries_13_excp_excpVec : _GEN_3758; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3760 = 4'he == idx_11 ? entries_14_excp_excpVec : _GEN_3759; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3761 = 4'hf == idx_11 ? entries_15_excp_excpVec : _GEN_3760; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_11_T_1 = _GEN_3761 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3763 = 4'h1 == idx_11 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3764 = 4'h2 == idx_11 ? entries_2_dcacheIssued : _GEN_3763; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3765 = 4'h3 == idx_11 ? entries_3_dcacheIssued : _GEN_3764; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3766 = 4'h4 == idx_11 ? entries_4_dcacheIssued : _GEN_3765; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3767 = 4'h5 == idx_11 ? entries_5_dcacheIssued : _GEN_3766; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3768 = 4'h6 == idx_11 ? entries_6_dcacheIssued : _GEN_3767; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3769 = 4'h7 == idx_11 ? entries_7_dcacheIssued : _GEN_3768; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3770 = 4'h8 == idx_11 ? entries_8_dcacheIssued : _GEN_3769; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3771 = 4'h9 == idx_11 ? entries_9_dcacheIssued : _GEN_3770; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3772 = 4'ha == idx_11 ? entries_10_dcacheIssued : _GEN_3771; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3773 = 4'hb == idx_11 ? entries_11_dcacheIssued : _GEN_3772; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3774 = 4'hc == idx_11 ? entries_12_dcacheIssued : _GEN_3773; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3775 = 4'hd == idx_11 ? entries_13_dcacheIssued : _GEN_3774; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3776 = 4'he == idx_11 ? entries_14_dcacheIssued : _GEN_3775; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3777 = 4'hf == idx_11 ? entries_15_dcacheIssued : _GEN_3776; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_11 = _GEN_383 & _GEN_3745 & ~_dcacheCandidates_11_T_1 & ~_GEN_3777 & _activeCandidates_11_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3811 = 4'h1 == idx_12 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3812 = 4'h2 == idx_12 ? entries_2_committed : _GEN_3811; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3813 = 4'h3 == idx_12 ? entries_3_committed : _GEN_3812; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3814 = 4'h4 == idx_12 ? entries_4_committed : _GEN_3813; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3815 = 4'h5 == idx_12 ? entries_5_committed : _GEN_3814; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3816 = 4'h6 == idx_12 ? entries_6_committed : _GEN_3815; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3817 = 4'h7 == idx_12 ? entries_7_committed : _GEN_3816; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3818 = 4'h8 == idx_12 ? entries_8_committed : _GEN_3817; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3819 = 4'h9 == idx_12 ? entries_9_committed : _GEN_3818; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3820 = 4'ha == idx_12 ? entries_10_committed : _GEN_3819; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3821 = 4'hb == idx_12 ? entries_11_committed : _GEN_3820; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3822 = 4'hc == idx_12 ? entries_12_committed : _GEN_3821; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3823 = 4'hd == idx_12 ? entries_13_committed : _GEN_3822; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3824 = 4'he == idx_12 ? entries_14_committed : _GEN_3823; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3825 = 4'hf == idx_12 ? entries_15_committed : _GEN_3824; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3827 = 4'h1 == idx_12 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3828 = 4'h2 == idx_12 ? entries_2_excp_excpVec : _GEN_3827; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3829 = 4'h3 == idx_12 ? entries_3_excp_excpVec : _GEN_3828; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3830 = 4'h4 == idx_12 ? entries_4_excp_excpVec : _GEN_3829; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3831 = 4'h5 == idx_12 ? entries_5_excp_excpVec : _GEN_3830; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3832 = 4'h6 == idx_12 ? entries_6_excp_excpVec : _GEN_3831; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3833 = 4'h7 == idx_12 ? entries_7_excp_excpVec : _GEN_3832; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3834 = 4'h8 == idx_12 ? entries_8_excp_excpVec : _GEN_3833; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3835 = 4'h9 == idx_12 ? entries_9_excp_excpVec : _GEN_3834; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3836 = 4'ha == idx_12 ? entries_10_excp_excpVec : _GEN_3835; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3837 = 4'hb == idx_12 ? entries_11_excp_excpVec : _GEN_3836; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3838 = 4'hc == idx_12 ? entries_12_excp_excpVec : _GEN_3837; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3839 = 4'hd == idx_12 ? entries_13_excp_excpVec : _GEN_3838; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3840 = 4'he == idx_12 ? entries_14_excp_excpVec : _GEN_3839; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3841 = 4'hf == idx_12 ? entries_15_excp_excpVec : _GEN_3840; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_12_T_1 = _GEN_3841 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3843 = 4'h1 == idx_12 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3844 = 4'h2 == idx_12 ? entries_2_dcacheIssued : _GEN_3843; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3845 = 4'h3 == idx_12 ? entries_3_dcacheIssued : _GEN_3844; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3846 = 4'h4 == idx_12 ? entries_4_dcacheIssued : _GEN_3845; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3847 = 4'h5 == idx_12 ? entries_5_dcacheIssued : _GEN_3846; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3848 = 4'h6 == idx_12 ? entries_6_dcacheIssued : _GEN_3847; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3849 = 4'h7 == idx_12 ? entries_7_dcacheIssued : _GEN_3848; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3850 = 4'h8 == idx_12 ? entries_8_dcacheIssued : _GEN_3849; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3851 = 4'h9 == idx_12 ? entries_9_dcacheIssued : _GEN_3850; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3852 = 4'ha == idx_12 ? entries_10_dcacheIssued : _GEN_3851; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3853 = 4'hb == idx_12 ? entries_11_dcacheIssued : _GEN_3852; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3854 = 4'hc == idx_12 ? entries_12_dcacheIssued : _GEN_3853; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3855 = 4'hd == idx_12 ? entries_13_dcacheIssued : _GEN_3854; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3856 = 4'he == idx_12 ? entries_14_dcacheIssued : _GEN_3855; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3857 = 4'hf == idx_12 ? entries_15_dcacheIssued : _GEN_3856; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_12 = _GEN_415 & _GEN_3825 & ~_dcacheCandidates_12_T_1 & ~_GEN_3857 & _activeCandidates_12_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3891 = 4'h1 == idx_13 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3892 = 4'h2 == idx_13 ? entries_2_committed : _GEN_3891; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3893 = 4'h3 == idx_13 ? entries_3_committed : _GEN_3892; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3894 = 4'h4 == idx_13 ? entries_4_committed : _GEN_3893; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3895 = 4'h5 == idx_13 ? entries_5_committed : _GEN_3894; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3896 = 4'h6 == idx_13 ? entries_6_committed : _GEN_3895; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3897 = 4'h7 == idx_13 ? entries_7_committed : _GEN_3896; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3898 = 4'h8 == idx_13 ? entries_8_committed : _GEN_3897; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3899 = 4'h9 == idx_13 ? entries_9_committed : _GEN_3898; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3900 = 4'ha == idx_13 ? entries_10_committed : _GEN_3899; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3901 = 4'hb == idx_13 ? entries_11_committed : _GEN_3900; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3902 = 4'hc == idx_13 ? entries_12_committed : _GEN_3901; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3903 = 4'hd == idx_13 ? entries_13_committed : _GEN_3902; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3904 = 4'he == idx_13 ? entries_14_committed : _GEN_3903; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3905 = 4'hf == idx_13 ? entries_15_committed : _GEN_3904; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3907 = 4'h1 == idx_13 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3908 = 4'h2 == idx_13 ? entries_2_excp_excpVec : _GEN_3907; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3909 = 4'h3 == idx_13 ? entries_3_excp_excpVec : _GEN_3908; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3910 = 4'h4 == idx_13 ? entries_4_excp_excpVec : _GEN_3909; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3911 = 4'h5 == idx_13 ? entries_5_excp_excpVec : _GEN_3910; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3912 = 4'h6 == idx_13 ? entries_6_excp_excpVec : _GEN_3911; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3913 = 4'h7 == idx_13 ? entries_7_excp_excpVec : _GEN_3912; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3914 = 4'h8 == idx_13 ? entries_8_excp_excpVec : _GEN_3913; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3915 = 4'h9 == idx_13 ? entries_9_excp_excpVec : _GEN_3914; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3916 = 4'ha == idx_13 ? entries_10_excp_excpVec : _GEN_3915; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3917 = 4'hb == idx_13 ? entries_11_excp_excpVec : _GEN_3916; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3918 = 4'hc == idx_13 ? entries_12_excp_excpVec : _GEN_3917; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3919 = 4'hd == idx_13 ? entries_13_excp_excpVec : _GEN_3918; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3920 = 4'he == idx_13 ? entries_14_excp_excpVec : _GEN_3919; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3921 = 4'hf == idx_13 ? entries_15_excp_excpVec : _GEN_3920; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_13_T_1 = _GEN_3921 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_3923 = 4'h1 == idx_13 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3924 = 4'h2 == idx_13 ? entries_2_dcacheIssued : _GEN_3923; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3925 = 4'h3 == idx_13 ? entries_3_dcacheIssued : _GEN_3924; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3926 = 4'h4 == idx_13 ? entries_4_dcacheIssued : _GEN_3925; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3927 = 4'h5 == idx_13 ? entries_5_dcacheIssued : _GEN_3926; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3928 = 4'h6 == idx_13 ? entries_6_dcacheIssued : _GEN_3927; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3929 = 4'h7 == idx_13 ? entries_7_dcacheIssued : _GEN_3928; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3930 = 4'h8 == idx_13 ? entries_8_dcacheIssued : _GEN_3929; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3931 = 4'h9 == idx_13 ? entries_9_dcacheIssued : _GEN_3930; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3932 = 4'ha == idx_13 ? entries_10_dcacheIssued : _GEN_3931; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3933 = 4'hb == idx_13 ? entries_11_dcacheIssued : _GEN_3932; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3934 = 4'hc == idx_13 ? entries_12_dcacheIssued : _GEN_3933; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3935 = 4'hd == idx_13 ? entries_13_dcacheIssued : _GEN_3934; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3936 = 4'he == idx_13 ? entries_14_dcacheIssued : _GEN_3935; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_3937 = 4'hf == idx_13 ? entries_15_dcacheIssued : _GEN_3936; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_13 = _GEN_447 & _GEN_3905 & ~_dcacheCandidates_13_T_1 & ~_GEN_3937 & _activeCandidates_13_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_3971 = 4'h1 == idx_14 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3972 = 4'h2 == idx_14 ? entries_2_committed : _GEN_3971; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3973 = 4'h3 == idx_14 ? entries_3_committed : _GEN_3972; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3974 = 4'h4 == idx_14 ? entries_4_committed : _GEN_3973; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3975 = 4'h5 == idx_14 ? entries_5_committed : _GEN_3974; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3976 = 4'h6 == idx_14 ? entries_6_committed : _GEN_3975; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3977 = 4'h7 == idx_14 ? entries_7_committed : _GEN_3976; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3978 = 4'h8 == idx_14 ? entries_8_committed : _GEN_3977; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3979 = 4'h9 == idx_14 ? entries_9_committed : _GEN_3978; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3980 = 4'ha == idx_14 ? entries_10_committed : _GEN_3979; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3981 = 4'hb == idx_14 ? entries_11_committed : _GEN_3980; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3982 = 4'hc == idx_14 ? entries_12_committed : _GEN_3981; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3983 = 4'hd == idx_14 ? entries_13_committed : _GEN_3982; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3984 = 4'he == idx_14 ? entries_14_committed : _GEN_3983; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_3985 = 4'hf == idx_14 ? entries_15_committed : _GEN_3984; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_3987 = 4'h1 == idx_14 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3988 = 4'h2 == idx_14 ? entries_2_excp_excpVec : _GEN_3987; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3989 = 4'h3 == idx_14 ? entries_3_excp_excpVec : _GEN_3988; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3990 = 4'h4 == idx_14 ? entries_4_excp_excpVec : _GEN_3989; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3991 = 4'h5 == idx_14 ? entries_5_excp_excpVec : _GEN_3990; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3992 = 4'h6 == idx_14 ? entries_6_excp_excpVec : _GEN_3991; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3993 = 4'h7 == idx_14 ? entries_7_excp_excpVec : _GEN_3992; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3994 = 4'h8 == idx_14 ? entries_8_excp_excpVec : _GEN_3993; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3995 = 4'h9 == idx_14 ? entries_9_excp_excpVec : _GEN_3994; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3996 = 4'ha == idx_14 ? entries_10_excp_excpVec : _GEN_3995; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3997 = 4'hb == idx_14 ? entries_11_excp_excpVec : _GEN_3996; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3998 = 4'hc == idx_14 ? entries_12_excp_excpVec : _GEN_3997; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_3999 = 4'hd == idx_14 ? entries_13_excp_excpVec : _GEN_3998; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4000 = 4'he == idx_14 ? entries_14_excp_excpVec : _GEN_3999; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4001 = 4'hf == idx_14 ? entries_15_excp_excpVec : _GEN_4000; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_14_T_1 = _GEN_4001 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_4003 = 4'h1 == idx_14 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4004 = 4'h2 == idx_14 ? entries_2_dcacheIssued : _GEN_4003; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4005 = 4'h3 == idx_14 ? entries_3_dcacheIssued : _GEN_4004; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4006 = 4'h4 == idx_14 ? entries_4_dcacheIssued : _GEN_4005; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4007 = 4'h5 == idx_14 ? entries_5_dcacheIssued : _GEN_4006; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4008 = 4'h6 == idx_14 ? entries_6_dcacheIssued : _GEN_4007; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4009 = 4'h7 == idx_14 ? entries_7_dcacheIssued : _GEN_4008; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4010 = 4'h8 == idx_14 ? entries_8_dcacheIssued : _GEN_4009; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4011 = 4'h9 == idx_14 ? entries_9_dcacheIssued : _GEN_4010; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4012 = 4'ha == idx_14 ? entries_10_dcacheIssued : _GEN_4011; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4013 = 4'hb == idx_14 ? entries_11_dcacheIssued : _GEN_4012; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4014 = 4'hc == idx_14 ? entries_12_dcacheIssued : _GEN_4013; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4015 = 4'hd == idx_14 ? entries_13_dcacheIssued : _GEN_4014; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4016 = 4'he == idx_14 ? entries_14_dcacheIssued : _GEN_4015; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4017 = 4'hf == idx_14 ? entries_15_dcacheIssued : _GEN_4016; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_14 = _GEN_479 & _GEN_3985 & ~_dcacheCandidates_14_T_1 & ~_GEN_4017 & _activeCandidates_14_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire  _GEN_4051 = 4'h1 == idx_15 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4052 = 4'h2 == idx_15 ? entries_2_committed : _GEN_4051; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4053 = 4'h3 == idx_15 ? entries_3_committed : _GEN_4052; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4054 = 4'h4 == idx_15 ? entries_4_committed : _GEN_4053; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4055 = 4'h5 == idx_15 ? entries_5_committed : _GEN_4054; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4056 = 4'h6 == idx_15 ? entries_6_committed : _GEN_4055; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4057 = 4'h7 == idx_15 ? entries_7_committed : _GEN_4056; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4058 = 4'h8 == idx_15 ? entries_8_committed : _GEN_4057; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4059 = 4'h9 == idx_15 ? entries_9_committed : _GEN_4058; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4060 = 4'ha == idx_15 ? entries_10_committed : _GEN_4059; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4061 = 4'hb == idx_15 ? entries_11_committed : _GEN_4060; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4062 = 4'hc == idx_15 ? entries_12_committed : _GEN_4061; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4063 = 4'hd == idx_15 ? entries_13_committed : _GEN_4062; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4064 = 4'he == idx_15 ? entries_14_committed : _GEN_4063; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire  _GEN_4065 = 4'hf == idx_15 ? entries_15_committed : _GEN_4064; // @[src/main/scala/memory/StoreQueue.scala 374:{36,36}]
  wire [16:0] _GEN_4067 = 4'h1 == idx_15 ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4068 = 4'h2 == idx_15 ? entries_2_excp_excpVec : _GEN_4067; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4069 = 4'h3 == idx_15 ? entries_3_excp_excpVec : _GEN_4068; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4070 = 4'h4 == idx_15 ? entries_4_excp_excpVec : _GEN_4069; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4071 = 4'h5 == idx_15 ? entries_5_excp_excpVec : _GEN_4070; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4072 = 4'h6 == idx_15 ? entries_6_excp_excpVec : _GEN_4071; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4073 = 4'h7 == idx_15 ? entries_7_excp_excpVec : _GEN_4072; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4074 = 4'h8 == idx_15 ? entries_8_excp_excpVec : _GEN_4073; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4075 = 4'h9 == idx_15 ? entries_9_excp_excpVec : _GEN_4074; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4076 = 4'ha == idx_15 ? entries_10_excp_excpVec : _GEN_4075; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4077 = 4'hb == idx_15 ? entries_11_excp_excpVec : _GEN_4076; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4078 = 4'hc == idx_15 ? entries_12_excp_excpVec : _GEN_4077; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4079 = 4'hd == idx_15 ? entries_13_excp_excpVec : _GEN_4078; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4080 = 4'he == idx_15 ? entries_14_excp_excpVec : _GEN_4079; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4081 = 4'hf == idx_15 ? entries_15_excp_excpVec : _GEN_4080; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _dcacheCandidates_15_T_1 = _GEN_4081 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  _GEN_4083 = 4'h1 == idx_15 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4084 = 4'h2 == idx_15 ? entries_2_dcacheIssued : _GEN_4083; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4085 = 4'h3 == idx_15 ? entries_3_dcacheIssued : _GEN_4084; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4086 = 4'h4 == idx_15 ? entries_4_dcacheIssued : _GEN_4085; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4087 = 4'h5 == idx_15 ? entries_5_dcacheIssued : _GEN_4086; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4088 = 4'h6 == idx_15 ? entries_6_dcacheIssued : _GEN_4087; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4089 = 4'h7 == idx_15 ? entries_7_dcacheIssued : _GEN_4088; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4090 = 4'h8 == idx_15 ? entries_8_dcacheIssued : _GEN_4089; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4091 = 4'h9 == idx_15 ? entries_9_dcacheIssued : _GEN_4090; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4092 = 4'ha == idx_15 ? entries_10_dcacheIssued : _GEN_4091; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4093 = 4'hb == idx_15 ? entries_11_dcacheIssued : _GEN_4092; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4094 = 4'hc == idx_15 ? entries_12_dcacheIssued : _GEN_4093; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4095 = 4'hd == idx_15 ? entries_13_dcacheIssued : _GEN_4094; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4096 = 4'he == idx_15 ? entries_14_dcacheIssued : _GEN_4095; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  _GEN_4097 = 4'hf == idx_15 ? entries_15_dcacheIssued : _GEN_4096; // @[src/main/scala/memory/StoreQueue.scala 374:{78,78}]
  wire  dcacheCandidates_15 = _GEN_511 & _GEN_4065 & ~_dcacheCandidates_15_T_1 & ~_GEN_4097 & _activeCandidates_15_T; // @[src/main/scala/memory/StoreQueue.scala 374:94]
  wire [3:0] _dcacheOffset_T = dcacheCandidates_14 ? 4'he : 4'hf; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_1 = dcacheCandidates_13 ? 4'hd : _dcacheOffset_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_2 = dcacheCandidates_12 ? 4'hc : _dcacheOffset_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_3 = dcacheCandidates_11 ? 4'hb : _dcacheOffset_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_4 = dcacheCandidates_10 ? 4'ha : _dcacheOffset_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_5 = dcacheCandidates_9 ? 4'h9 : _dcacheOffset_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_6 = dcacheCandidates_8 ? 4'h8 : _dcacheOffset_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_7 = dcacheCandidates_7 ? 4'h7 : _dcacheOffset_T_6; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_8 = dcacheCandidates_6 ? 4'h6 : _dcacheOffset_T_7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_9 = dcacheCandidates_5 ? 4'h5 : _dcacheOffset_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_10 = dcacheCandidates_4 ? 4'h4 : _dcacheOffset_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_11 = dcacheCandidates_3 ? 4'h3 : _dcacheOffset_T_10; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_12 = dcacheCandidates_2 ? 4'h2 : _dcacheOffset_T_11; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_13 = dcacheCandidates_1 ? 4'h1 : _dcacheOffset_T_12; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] dcacheOffset = dcacheCandidates_0 ? 4'h0 : _dcacheOffset_T_13; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] dcacheIdx = deqPtr_value + dcacheOffset; // @[src/main/scala/memory/StoreQueue.scala 379:42]
  wire [31:0] _GEN_4115 = 4'h1 == dcacheIdx ? entries_1_paddr : entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4116 = 4'h2 == dcacheIdx ? entries_2_paddr : _GEN_4115; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4117 = 4'h3 == dcacheIdx ? entries_3_paddr : _GEN_4116; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4118 = 4'h4 == dcacheIdx ? entries_4_paddr : _GEN_4117; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4119 = 4'h5 == dcacheIdx ? entries_5_paddr : _GEN_4118; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4120 = 4'h6 == dcacheIdx ? entries_6_paddr : _GEN_4119; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4121 = 4'h7 == dcacheIdx ? entries_7_paddr : _GEN_4120; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4122 = 4'h8 == dcacheIdx ? entries_8_paddr : _GEN_4121; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4123 = 4'h9 == dcacheIdx ? entries_9_paddr : _GEN_4122; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4124 = 4'ha == dcacheIdx ? entries_10_paddr : _GEN_4123; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4125 = 4'hb == dcacheIdx ? entries_11_paddr : _GEN_4124; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4126 = 4'hc == dcacheIdx ? entries_12_paddr : _GEN_4125; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4127 = 4'hd == dcacheIdx ? entries_13_paddr : _GEN_4126; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4128 = 4'he == dcacheIdx ? entries_14_paddr : _GEN_4127; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  wire [31:0] _GEN_4131 = 4'h1 == dcacheIdx ? entries_1_data : entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4132 = 4'h2 == dcacheIdx ? entries_2_data : _GEN_4131; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4133 = 4'h3 == dcacheIdx ? entries_3_data : _GEN_4132; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4134 = 4'h4 == dcacheIdx ? entries_4_data : _GEN_4133; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4135 = 4'h5 == dcacheIdx ? entries_5_data : _GEN_4134; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4136 = 4'h6 == dcacheIdx ? entries_6_data : _GEN_4135; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4137 = 4'h7 == dcacheIdx ? entries_7_data : _GEN_4136; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4138 = 4'h8 == dcacheIdx ? entries_8_data : _GEN_4137; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4139 = 4'h9 == dcacheIdx ? entries_9_data : _GEN_4138; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4140 = 4'ha == dcacheIdx ? entries_10_data : _GEN_4139; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4141 = 4'hb == dcacheIdx ? entries_11_data : _GEN_4140; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4142 = 4'hc == dcacheIdx ? entries_12_data : _GEN_4141; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4143 = 4'hd == dcacheIdx ? entries_13_data : _GEN_4142; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [31:0] _GEN_4144 = 4'he == dcacheIdx ? entries_14_data : _GEN_4143; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  wire [3:0] _GEN_4147 = 4'h1 == dcacheIdx ? entries_1_lsuOp : entries_0_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4148 = 4'h2 == dcacheIdx ? entries_2_lsuOp : _GEN_4147; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4149 = 4'h3 == dcacheIdx ? entries_3_lsuOp : _GEN_4148; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4150 = 4'h4 == dcacheIdx ? entries_4_lsuOp : _GEN_4149; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4151 = 4'h5 == dcacheIdx ? entries_5_lsuOp : _GEN_4150; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4152 = 4'h6 == dcacheIdx ? entries_6_lsuOp : _GEN_4151; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4153 = 4'h7 == dcacheIdx ? entries_7_lsuOp : _GEN_4152; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4154 = 4'h8 == dcacheIdx ? entries_8_lsuOp : _GEN_4153; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4155 = 4'h9 == dcacheIdx ? entries_9_lsuOp : _GEN_4154; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4156 = 4'ha == dcacheIdx ? entries_10_lsuOp : _GEN_4155; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4157 = 4'hb == dcacheIdx ? entries_11_lsuOp : _GEN_4156; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4158 = 4'hc == dcacheIdx ? entries_12_lsuOp : _GEN_4157; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4159 = 4'hd == dcacheIdx ? entries_13_lsuOp : _GEN_4158; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire [3:0] _GEN_4160 = 4'he == dcacheIdx ? entries_14_lsuOp : _GEN_4159; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  wire  _GEN_4163 = 4'h1 == dcacheIdx ? entries_1_cacheable : entries_0_cacheable; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4164 = 4'h2 == dcacheIdx ? entries_2_cacheable : _GEN_4163; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4165 = 4'h3 == dcacheIdx ? entries_3_cacheable : _GEN_4164; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4166 = 4'h4 == dcacheIdx ? entries_4_cacheable : _GEN_4165; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4167 = 4'h5 == dcacheIdx ? entries_5_cacheable : _GEN_4166; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4168 = 4'h6 == dcacheIdx ? entries_6_cacheable : _GEN_4167; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4169 = 4'h7 == dcacheIdx ? entries_7_cacheable : _GEN_4168; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4170 = 4'h8 == dcacheIdx ? entries_8_cacheable : _GEN_4169; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4171 = 4'h9 == dcacheIdx ? entries_9_cacheable : _GEN_4170; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4172 = 4'ha == dcacheIdx ? entries_10_cacheable : _GEN_4171; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4173 = 4'hb == dcacheIdx ? entries_11_cacheable : _GEN_4172; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4174 = 4'hc == dcacheIdx ? entries_12_cacheable : _GEN_4173; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4175 = 4'hd == dcacheIdx ? entries_13_cacheable : _GEN_4174; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _GEN_4176 = 4'he == dcacheIdx ? entries_14_cacheable : _GEN_4175; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  wire  _T_33 = io_dcacheReq_ready & io_dcacheReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_4178 = 4'h0 == dcacheIdx | _GEN_1040; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4179 = 4'h1 == dcacheIdx | _GEN_1041; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4180 = 4'h2 == dcacheIdx | _GEN_1042; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4181 = 4'h3 == dcacheIdx | _GEN_1043; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4182 = 4'h4 == dcacheIdx | _GEN_1044; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4183 = 4'h5 == dcacheIdx | _GEN_1045; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4184 = 4'h6 == dcacheIdx | _GEN_1046; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4185 = 4'h7 == dcacheIdx | _GEN_1047; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4186 = 4'h8 == dcacheIdx | _GEN_1048; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4187 = 4'h9 == dcacheIdx | _GEN_1049; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4188 = 4'ha == dcacheIdx | _GEN_1050; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4189 = 4'hb == dcacheIdx | _GEN_1051; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4190 = 4'hc == dcacheIdx | _GEN_1052; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4191 = 4'hd == dcacheIdx | _GEN_1053; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4192 = 4'he == dcacheIdx | _GEN_1054; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4193 = 4'hf == dcacheIdx | _GEN_1055; // @[src/main/scala/memory/StoreQueue.scala 396:{37,37}]
  wire  _GEN_4210 = 4'h0 == io_storeAck_bits_sqIdx | _GEN_1024; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4211 = 4'h1 == io_storeAck_bits_sqIdx | _GEN_1025; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4212 = 4'h2 == io_storeAck_bits_sqIdx | _GEN_1026; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4213 = 4'h3 == io_storeAck_bits_sqIdx | _GEN_1027; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4214 = 4'h4 == io_storeAck_bits_sqIdx | _GEN_1028; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4215 = 4'h5 == io_storeAck_bits_sqIdx | _GEN_1029; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4216 = 4'h6 == io_storeAck_bits_sqIdx | _GEN_1030; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4217 = 4'h7 == io_storeAck_bits_sqIdx | _GEN_1031; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4218 = 4'h8 == io_storeAck_bits_sqIdx | _GEN_1032; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4219 = 4'h9 == io_storeAck_bits_sqIdx | _GEN_1033; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4220 = 4'ha == io_storeAck_bits_sqIdx | _GEN_1034; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4221 = 4'hb == io_storeAck_bits_sqIdx | _GEN_1035; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4222 = 4'hc == io_storeAck_bits_sqIdx | _GEN_1036; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4223 = 4'hd == io_storeAck_bits_sqIdx | _GEN_1037; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4224 = 4'he == io_storeAck_bits_sqIdx | _GEN_1038; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4225 = 4'hf == io_storeAck_bits_sqIdx | _GEN_1039; // @[src/main/scala/memory/StoreQueue.scala 401:{31,31}]
  wire  _GEN_4243 = 4'h1 == deqPtr_value ? entries_1_Memwritten : entries_0_Memwritten; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4244 = 4'h2 == deqPtr_value ? entries_2_Memwritten : _GEN_4243; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4245 = 4'h3 == deqPtr_value ? entries_3_Memwritten : _GEN_4244; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4246 = 4'h4 == deqPtr_value ? entries_4_Memwritten : _GEN_4245; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4247 = 4'h5 == deqPtr_value ? entries_5_Memwritten : _GEN_4246; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4248 = 4'h6 == deqPtr_value ? entries_6_Memwritten : _GEN_4247; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4249 = 4'h7 == deqPtr_value ? entries_7_Memwritten : _GEN_4248; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4250 = 4'h8 == deqPtr_value ? entries_8_Memwritten : _GEN_4249; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4251 = 4'h9 == deqPtr_value ? entries_9_Memwritten : _GEN_4250; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4252 = 4'ha == deqPtr_value ? entries_10_Memwritten : _GEN_4251; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4253 = 4'hb == deqPtr_value ? entries_11_Memwritten : _GEN_4252; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4254 = 4'hc == deqPtr_value ? entries_12_Memwritten : _GEN_4253; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4255 = 4'hd == deqPtr_value ? entries_13_Memwritten : _GEN_4254; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4256 = 4'he == deqPtr_value ? entries_14_Memwritten : _GEN_4255; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4257 = 4'hf == deqPtr_value ? entries_15_Memwritten : _GEN_4256; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4259 = 4'h1 == deqPtr_value ? entries_1_alreadyFlush : entries_0_alreadyFlush; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4260 = 4'h2 == deqPtr_value ? entries_2_alreadyFlush : _GEN_4259; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4261 = 4'h3 == deqPtr_value ? entries_3_alreadyFlush : _GEN_4260; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4262 = 4'h4 == deqPtr_value ? entries_4_alreadyFlush : _GEN_4261; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4263 = 4'h5 == deqPtr_value ? entries_5_alreadyFlush : _GEN_4262; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4264 = 4'h6 == deqPtr_value ? entries_6_alreadyFlush : _GEN_4263; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4265 = 4'h7 == deqPtr_value ? entries_7_alreadyFlush : _GEN_4264; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4266 = 4'h8 == deqPtr_value ? entries_8_alreadyFlush : _GEN_4265; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4267 = 4'h9 == deqPtr_value ? entries_9_alreadyFlush : _GEN_4266; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4268 = 4'ha == deqPtr_value ? entries_10_alreadyFlush : _GEN_4267; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4269 = 4'hb == deqPtr_value ? entries_11_alreadyFlush : _GEN_4268; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4270 = 4'hc == deqPtr_value ? entries_12_alreadyFlush : _GEN_4269; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4271 = 4'hd == deqPtr_value ? entries_13_alreadyFlush : _GEN_4270; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4272 = 4'he == deqPtr_value ? entries_14_alreadyFlush : _GEN_4271; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4273 = 4'hf == deqPtr_value ? entries_15_alreadyFlush : _GEN_4272; // @[src/main/scala/memory/StoreQueue.scala 407:{88,88}]
  wire  _GEN_4275 = 4'h1 == deqPtr_value ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4276 = 4'h2 == deqPtr_value ? entries_2_valid : _GEN_4275; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4277 = 4'h3 == deqPtr_value ? entries_3_valid : _GEN_4276; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4278 = 4'h4 == deqPtr_value ? entries_4_valid : _GEN_4277; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4279 = 4'h5 == deqPtr_value ? entries_5_valid : _GEN_4278; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4280 = 4'h6 == deqPtr_value ? entries_6_valid : _GEN_4279; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4281 = 4'h7 == deqPtr_value ? entries_7_valid : _GEN_4280; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4282 = 4'h8 == deqPtr_value ? entries_8_valid : _GEN_4281; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4283 = 4'h9 == deqPtr_value ? entries_9_valid : _GEN_4282; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4284 = 4'ha == deqPtr_value ? entries_10_valid : _GEN_4283; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4285 = 4'hb == deqPtr_value ? entries_11_valid : _GEN_4284; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4286 = 4'hc == deqPtr_value ? entries_12_valid : _GEN_4285; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4287 = 4'hd == deqPtr_value ? entries_13_valid : _GEN_4286; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4288 = 4'he == deqPtr_value ? entries_14_valid : _GEN_4287; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  _GEN_4289 = 4'hf == deqPtr_value ? entries_15_valid : _GEN_4288; // @[src/main/scala/memory/StoreQueue.scala 407:{50,50}]
  wire  canDeqNormal = _GEN_4289 & (_GEN_4257 | _GEN_4273); // @[src/main/scala/memory/StoreQueue.scala 407:50]
  wire  _GEN_4291 = 4'h1 == deqPtr_value ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4292 = 4'h2 == deqPtr_value ? entries_2_writtenBack : _GEN_4291; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4293 = 4'h3 == deqPtr_value ? entries_3_writtenBack : _GEN_4292; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4294 = 4'h4 == deqPtr_value ? entries_4_writtenBack : _GEN_4293; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4295 = 4'h5 == deqPtr_value ? entries_5_writtenBack : _GEN_4294; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4296 = 4'h6 == deqPtr_value ? entries_6_writtenBack : _GEN_4295; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4297 = 4'h7 == deqPtr_value ? entries_7_writtenBack : _GEN_4296; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4298 = 4'h8 == deqPtr_value ? entries_8_writtenBack : _GEN_4297; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4299 = 4'h9 == deqPtr_value ? entries_9_writtenBack : _GEN_4298; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4300 = 4'ha == deqPtr_value ? entries_10_writtenBack : _GEN_4299; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4301 = 4'hb == deqPtr_value ? entries_11_writtenBack : _GEN_4300; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4302 = 4'hc == deqPtr_value ? entries_12_writtenBack : _GEN_4301; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4303 = 4'hd == deqPtr_value ? entries_13_writtenBack : _GEN_4302; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4304 = 4'he == deqPtr_value ? entries_14_writtenBack : _GEN_4303; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire  _GEN_4305 = 4'hf == deqPtr_value ? entries_15_writtenBack : _GEN_4304; // @[src/main/scala/memory/StoreQueue.scala 408:{50,50}]
  wire [16:0] _GEN_4307 = 4'h1 == deqPtr_value ? entries_1_excp_excpVec : entries_0_excp_excpVec; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4308 = 4'h2 == deqPtr_value ? entries_2_excp_excpVec : _GEN_4307; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4309 = 4'h3 == deqPtr_value ? entries_3_excp_excpVec : _GEN_4308; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4310 = 4'h4 == deqPtr_value ? entries_4_excp_excpVec : _GEN_4309; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4311 = 4'h5 == deqPtr_value ? entries_5_excp_excpVec : _GEN_4310; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4312 = 4'h6 == deqPtr_value ? entries_6_excp_excpVec : _GEN_4311; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4313 = 4'h7 == deqPtr_value ? entries_7_excp_excpVec : _GEN_4312; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4314 = 4'h8 == deqPtr_value ? entries_8_excp_excpVec : _GEN_4313; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4315 = 4'h9 == deqPtr_value ? entries_9_excp_excpVec : _GEN_4314; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4316 = 4'ha == deqPtr_value ? entries_10_excp_excpVec : _GEN_4315; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4317 = 4'hb == deqPtr_value ? entries_11_excp_excpVec : _GEN_4316; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4318 = 4'hc == deqPtr_value ? entries_12_excp_excpVec : _GEN_4317; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4319 = 4'hd == deqPtr_value ? entries_13_excp_excpVec : _GEN_4318; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4320 = 4'he == deqPtr_value ? entries_14_excp_excpVec : _GEN_4319; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire [16:0] _GEN_4321 = 4'hf == deqPtr_value ? entries_15_excp_excpVec : _GEN_4320; // @[src/main/scala/config/ExceptionDef.scala 95:{36,36}]
  wire  _canDeqExcp_T_1 = _GEN_4321 != 17'h0; // @[src/main/scala/config/ExceptionDef.scala 95:36]
  wire  canDeqExcp = _GEN_4289 & _GEN_4305 & _canDeqExcp_T_1; // @[src/main/scala/memory/StoreQueue.scala 408:87]
  wire  canDeq = canDeqNormal | canDeqExcp; // @[src/main/scala/memory/StoreQueue.scala 410:29]
  wire  deqPtr_wrap = _idx_T_2 >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] deqPtr_newPtr_value = _idx_T_2[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_dcacheReq_valid = dcacheCandidates_0 | dcacheCandidates_1 | dcacheCandidates_2 | dcacheCandidates_3 |
    dcacheCandidates_4 | dcacheCandidates_5 | dcacheCandidates_6 | dcacheCandidates_7 | dcacheCandidates_8 |
    dcacheCandidates_9 | dcacheCandidates_10 | dcacheCandidates_11 | dcacheCandidates_12 | dcacheCandidates_13 |
    dcacheCandidates_14 | dcacheCandidates_15; // @[src/main/scala/memory/StoreQueue.scala 377:54]
  assign io_dcacheReq_bits_sqIdx = deqPtr_value + dcacheOffset; // @[src/main/scala/memory/StoreQueue.scala 379:42]
  assign io_dcacheReq_bits_paddr = 4'hf == dcacheIdx ? entries_15_paddr : _GEN_4128; // @[src/main/scala/memory/StoreQueue.scala 389:{27,27}]
  assign io_dcacheReq_bits_cacheable = 4'hf == dcacheIdx ? entries_15_cacheable : _GEN_4176; // @[src/main/scala/memory/StoreQueue.scala 392:{32,32}]
  assign io_dcacheReq_bits_data = 4'hf == dcacheIdx ? entries_15_data : _GEN_4144; // @[src/main/scala/memory/StoreQueue.scala 390:{27,27}]
  assign io_dcacheReq_bits_lsuOp = 4'hf == dcacheIdx ? entries_15_lsuOp : _GEN_4160; // @[src/main/scala/memory/StoreQueue.scala 391:{28,28}]
  assign io_outResult_valid = wbCandidates_0 | wbCandidates_1 | wbCandidates_2 | wbCandidates_3 | wbCandidates_4 |
    wbCandidates_5 | wbCandidates_6 | wbCandidates_7 | wbCandidates_8 | wbCandidates_9 | wbCandidates_10 |
    wbCandidates_11 | wbCandidates_12 | wbCandidates_13 | wbCandidates_14 | wbCandidates_15; // @[src/main/scala/memory/StoreQueue.scala 262:46]
  assign io_outResult_bits_uop_pc = 4'hf == wbIdx ? entries_15_pc : _GEN_2640; // @[src/main/scala/memory/StoreQueue.scala 295:{20,20}]
  assign io_outResult_bits_uop_ctrl_fuType = 4'hf == wbIdx ? entries_15_fuType : _GEN_2704; // @[src/main/scala/memory/StoreQueue.scala 328:{23,23}]
  assign io_outResult_bits_uop_ctrl_lsuOp = 4'hf == wbIdx ? entries_15_lsuOp : _GEN_2576; // @[src/main/scala/memory/StoreQueue.scala 277:{59,59}]
  assign io_outResult_bits_uop_excp_excpVec = 4'hf == wbIdx ? entries_15_excp_excpVec : _GEN_2656; // @[src/main/scala/memory/StoreQueue.scala 297:{17,17}]
  assign io_outResult_bits_uop_pdst = 4'hf == wbIdx ? entries_15_pdst : _GEN_2672; // @[src/main/scala/memory/StoreQueue.scala 303:{20,20}]
  assign io_outResult_bits_uop_robIdx_value = 4'hf == wbIdx ? entries_15_robIdxFull_value : _GEN_2608; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  assign io_outResult_bits_uop_robIdx_flag = 4'hf == wbIdx ? entries_15_robIdxFull_flag : _GEN_2624; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  assign io_outResult_bits_uop_robIdxFull_value = 4'hf == wbIdx ? entries_15_robIdxFull_value : _GEN_2608; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  assign io_outResult_bits_uop_robIdxFull_flag = 4'hf == wbIdx ? entries_15_robIdxFull_flag : _GEN_2624; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  assign io_outResult_bits_uop_lqIdx_value = 4'hf == wbIdx ? entries_15_lqIdx : _GEN_2688; // @[src/main/scala/memory/StoreQueue.scala 319:{17,17}]
  assign io_outResult_bits_uop_sqIdx_value = deqPtr_value + wbOffset; // @[src/main/scala/memory/StoreQueue.scala 264:38]
  assign io_outResult_bits_redirect_bits_robIdx_value = 4'hf == wbIdx ? entries_15_robIdxFull_value : _GEN_2608; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  assign io_outResult_bits_redirect_bits_robIdx_flag = 4'hf == wbIdx ? entries_15_robIdxFull_flag : _GEN_2624; // @[src/main/scala/memory/StoreQueue.scala 284:{45,45}]
  assign io_outResult_bits_memVaddr = 4'hf == wbIdx ? entries_15_vaddr : _GEN_2544; // @[src/main/scala/memory/StoreQueue.scala 272:{37,37}]
  assign io_outResult_bits_memPaddr = 4'hf == wbIdx ? entries_15_paddr : _GEN_2560; // @[src/main/scala/memory/StoreQueue.scala 273:{37,37}]
  assign io_outResult_bits_memStoreData = _io_outResult_bits_memStoreData_T_6[31:0]; // @[src/main/scala/memory/StoreQueue.scala 277:37]
  assign io_oldestRobIdx_value = hasActiveStore ? _GEN_542 : 6'h0; // @[src/main/scala/memory/StoreQueue.scala 156:23]
  assign io_oldestRobIdx_flag = hasActiveStore & _GEN_543; // @[src/main/scala/memory/StoreQueue.scala 156:23]
  assign io_sqEmpty = ~hasActiveStore; // @[src/main/scala/memory/StoreQueue.scala 157:20]
  assign io_full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 125:47]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_0_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_0_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_0_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h0 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_0_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_0_valid <= _GEN_928;
      end
    end else begin
      entries_0_valid <= _GEN_928;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_0_addrValid <= _GEN_1266;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_0_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_0_dataValid <= _GEN_1426;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_0_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_0_committed <= _GEN_2802;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_0_committed <= _GEN_2770;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_0_committed <= _GEN_2738;
    end else begin
      entries_0_committed <= _GEN_976;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_0_writtenBack <= _GEN_2706;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_0_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_0_Memwritten <= _GEN_4210;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_0_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_0_valid & ~entries_0_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_0_alreadyFlush <= _GEN_1218;
      end else begin
        entries_0_alreadyFlush <= _GEN_992;
      end
    end else begin
      entries_0_alreadyFlush <= _GEN_992;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_0_dcacheIssued <= _GEN_4178;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_0_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h0 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_0_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_0_vaddr <= _GEN_1056;
      end
    end else begin
      entries_0_vaddr <= _GEN_1056;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h0 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_0_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_0_paddr <= _GEN_1072;
      end
    end else begin
      entries_0_paddr <= _GEN_1072;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h0 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_0_data <= io_dataWrite_data;
        end else begin
          entries_0_data <= _entries_data_T_7;
        end
      end else begin
        entries_0_data <= _GEN_1088;
      end
    end else begin
      entries_0_data <= _GEN_1088;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h0 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_0_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_0_excp_excpVec <= _GEN_1104;
      end
    end else begin
      entries_0_excp_excpVec <= _GEN_1104;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h0 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_0_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_0_cacheable <= _GEN_1120;
      end
    end else begin
      entries_0_cacheable <= _GEN_1120;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_0_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_0_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_0_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_0_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_0_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_0_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_1_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_1_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_1_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h1 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_1_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_1_valid <= _GEN_929;
      end
    end else begin
      entries_1_valid <= _GEN_929;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_1_addrValid <= _GEN_1267;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_1_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_1_dataValid <= _GEN_1427;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_1_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_1_committed <= _GEN_2803;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_1_committed <= _GEN_2771;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_1_committed <= _GEN_2739;
    end else begin
      entries_1_committed <= _GEN_977;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_1_writtenBack <= _GEN_2707;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_1_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_1_Memwritten <= _GEN_4211;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_1_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_1_valid & ~entries_1_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_1_alreadyFlush <= _GEN_1220;
      end else begin
        entries_1_alreadyFlush <= _GEN_993;
      end
    end else begin
      entries_1_alreadyFlush <= _GEN_993;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_1_dcacheIssued <= _GEN_4179;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_1_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h1 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_1_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_1_vaddr <= _GEN_1057;
      end
    end else begin
      entries_1_vaddr <= _GEN_1057;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h1 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_1_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_1_paddr <= _GEN_1073;
      end
    end else begin
      entries_1_paddr <= _GEN_1073;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h1 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_1_data <= io_dataWrite_data;
        end else begin
          entries_1_data <= _entries_data_T_7;
        end
      end else begin
        entries_1_data <= _GEN_1089;
      end
    end else begin
      entries_1_data <= _GEN_1089;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h1 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_1_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_1_excp_excpVec <= _GEN_1105;
      end
    end else begin
      entries_1_excp_excpVec <= _GEN_1105;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h1 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_1_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_1_cacheable <= _GEN_1121;
      end
    end else begin
      entries_1_cacheable <= _GEN_1121;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_1_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_1_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_1_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_1_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_1_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_1_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_2_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_2_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_2_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h2 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_2_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_2_valid <= _GEN_930;
      end
    end else begin
      entries_2_valid <= _GEN_930;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_2_addrValid <= _GEN_1268;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_2_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_2_dataValid <= _GEN_1428;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_2_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_2_committed <= _GEN_2804;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_2_committed <= _GEN_2772;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_2_committed <= _GEN_2740;
    end else begin
      entries_2_committed <= _GEN_978;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_2_writtenBack <= _GEN_2708;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_2_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_2_Memwritten <= _GEN_4212;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_2_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_2_valid & ~entries_2_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_2_alreadyFlush <= _GEN_1222;
      end else begin
        entries_2_alreadyFlush <= _GEN_994;
      end
    end else begin
      entries_2_alreadyFlush <= _GEN_994;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_2_dcacheIssued <= _GEN_4180;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_2_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h2 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_2_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_2_vaddr <= _GEN_1058;
      end
    end else begin
      entries_2_vaddr <= _GEN_1058;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h2 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_2_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_2_paddr <= _GEN_1074;
      end
    end else begin
      entries_2_paddr <= _GEN_1074;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h2 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_2_data <= io_dataWrite_data;
        end else begin
          entries_2_data <= _entries_data_T_7;
        end
      end else begin
        entries_2_data <= _GEN_1090;
      end
    end else begin
      entries_2_data <= _GEN_1090;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h2 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_2_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_2_excp_excpVec <= _GEN_1106;
      end
    end else begin
      entries_2_excp_excpVec <= _GEN_1106;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h2 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_2_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_2_cacheable <= _GEN_1122;
      end
    end else begin
      entries_2_cacheable <= _GEN_1122;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_2_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_2_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_2_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_2_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_2_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_2_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_3_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_3_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_3_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h3 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_3_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_3_valid <= _GEN_931;
      end
    end else begin
      entries_3_valid <= _GEN_931;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_3_addrValid <= _GEN_1269;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_3_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_3_dataValid <= _GEN_1429;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_3_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_3_committed <= _GEN_2805;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_3_committed <= _GEN_2773;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_3_committed <= _GEN_2741;
    end else begin
      entries_3_committed <= _GEN_979;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_3_writtenBack <= _GEN_2709;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_3_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_3_Memwritten <= _GEN_4213;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_3_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_3_valid & ~entries_3_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_3_alreadyFlush <= _GEN_1224;
      end else begin
        entries_3_alreadyFlush <= _GEN_995;
      end
    end else begin
      entries_3_alreadyFlush <= _GEN_995;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_3_dcacheIssued <= _GEN_4181;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_3_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h3 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_3_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_3_vaddr <= _GEN_1059;
      end
    end else begin
      entries_3_vaddr <= _GEN_1059;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h3 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_3_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_3_paddr <= _GEN_1075;
      end
    end else begin
      entries_3_paddr <= _GEN_1075;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h3 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_3_data <= io_dataWrite_data;
        end else begin
          entries_3_data <= _entries_data_T_7;
        end
      end else begin
        entries_3_data <= _GEN_1091;
      end
    end else begin
      entries_3_data <= _GEN_1091;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h3 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_3_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_3_excp_excpVec <= _GEN_1107;
      end
    end else begin
      entries_3_excp_excpVec <= _GEN_1107;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h3 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_3_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_3_cacheable <= _GEN_1123;
      end
    end else begin
      entries_3_cacheable <= _GEN_1123;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_3_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_3_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_3_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_3_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_3_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_3_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_4_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_4_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_4_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h4 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_4_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_4_valid <= _GEN_932;
      end
    end else begin
      entries_4_valid <= _GEN_932;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_4_addrValid <= _GEN_1270;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_4_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_4_dataValid <= _GEN_1430;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_4_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_4_committed <= _GEN_2806;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_4_committed <= _GEN_2774;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_4_committed <= _GEN_2742;
    end else begin
      entries_4_committed <= _GEN_980;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_4_writtenBack <= _GEN_2710;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_4_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_4_Memwritten <= _GEN_4214;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_4_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_4_valid & ~entries_4_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_4_alreadyFlush <= _GEN_1226;
      end else begin
        entries_4_alreadyFlush <= _GEN_996;
      end
    end else begin
      entries_4_alreadyFlush <= _GEN_996;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_4_dcacheIssued <= _GEN_4182;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_4_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h4 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_4_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_4_vaddr <= _GEN_1060;
      end
    end else begin
      entries_4_vaddr <= _GEN_1060;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h4 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_4_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_4_paddr <= _GEN_1076;
      end
    end else begin
      entries_4_paddr <= _GEN_1076;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h4 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_4_data <= io_dataWrite_data;
        end else begin
          entries_4_data <= _entries_data_T_7;
        end
      end else begin
        entries_4_data <= _GEN_1092;
      end
    end else begin
      entries_4_data <= _GEN_1092;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h4 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_4_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_4_excp_excpVec <= _GEN_1108;
      end
    end else begin
      entries_4_excp_excpVec <= _GEN_1108;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h4 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_4_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_4_cacheable <= _GEN_1124;
      end
    end else begin
      entries_4_cacheable <= _GEN_1124;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_4_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_4_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_4_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_4_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_4_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_4_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_5_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_5_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_5_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h5 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_5_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_5_valid <= _GEN_933;
      end
    end else begin
      entries_5_valid <= _GEN_933;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_5_addrValid <= _GEN_1271;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_5_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_5_dataValid <= _GEN_1431;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_5_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_5_committed <= _GEN_2807;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_5_committed <= _GEN_2775;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_5_committed <= _GEN_2743;
    end else begin
      entries_5_committed <= _GEN_981;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_5_writtenBack <= _GEN_2711;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_5_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_5_Memwritten <= _GEN_4215;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_5_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_5_valid & ~entries_5_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_5_alreadyFlush <= _GEN_1228;
      end else begin
        entries_5_alreadyFlush <= _GEN_997;
      end
    end else begin
      entries_5_alreadyFlush <= _GEN_997;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_5_dcacheIssued <= _GEN_4183;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_5_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h5 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_5_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_5_vaddr <= _GEN_1061;
      end
    end else begin
      entries_5_vaddr <= _GEN_1061;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h5 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_5_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_5_paddr <= _GEN_1077;
      end
    end else begin
      entries_5_paddr <= _GEN_1077;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h5 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_5_data <= io_dataWrite_data;
        end else begin
          entries_5_data <= _entries_data_T_7;
        end
      end else begin
        entries_5_data <= _GEN_1093;
      end
    end else begin
      entries_5_data <= _GEN_1093;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h5 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_5_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_5_excp_excpVec <= _GEN_1109;
      end
    end else begin
      entries_5_excp_excpVec <= _GEN_1109;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h5 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_5_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_5_cacheable <= _GEN_1125;
      end
    end else begin
      entries_5_cacheable <= _GEN_1125;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_5_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_5_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_5_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_5_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_5_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_5_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_6_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_6_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_6_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h6 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_6_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_6_valid <= _GEN_934;
      end
    end else begin
      entries_6_valid <= _GEN_934;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_6_addrValid <= _GEN_1272;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_6_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_6_dataValid <= _GEN_1432;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_6_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_6_committed <= _GEN_2808;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_6_committed <= _GEN_2776;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_6_committed <= _GEN_2744;
    end else begin
      entries_6_committed <= _GEN_982;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_6_writtenBack <= _GEN_2712;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_6_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_6_Memwritten <= _GEN_4216;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_6_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_6_valid & ~entries_6_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_6_alreadyFlush <= _GEN_1230;
      end else begin
        entries_6_alreadyFlush <= _GEN_998;
      end
    end else begin
      entries_6_alreadyFlush <= _GEN_998;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_6_dcacheIssued <= _GEN_4184;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_6_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h6 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_6_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_6_vaddr <= _GEN_1062;
      end
    end else begin
      entries_6_vaddr <= _GEN_1062;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h6 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_6_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_6_paddr <= _GEN_1078;
      end
    end else begin
      entries_6_paddr <= _GEN_1078;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h6 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_6_data <= io_dataWrite_data;
        end else begin
          entries_6_data <= _entries_data_T_7;
        end
      end else begin
        entries_6_data <= _GEN_1094;
      end
    end else begin
      entries_6_data <= _GEN_1094;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h6 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_6_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_6_excp_excpVec <= _GEN_1110;
      end
    end else begin
      entries_6_excp_excpVec <= _GEN_1110;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h6 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_6_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_6_cacheable <= _GEN_1126;
      end
    end else begin
      entries_6_cacheable <= _GEN_1126;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_6_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_6_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_6_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_6_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_6_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_6_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_7_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_7_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_7_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h7 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_7_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_7_valid <= _GEN_935;
      end
    end else begin
      entries_7_valid <= _GEN_935;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_7_addrValid <= _GEN_1273;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_7_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_7_dataValid <= _GEN_1433;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_7_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_7_committed <= _GEN_2809;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_7_committed <= _GEN_2777;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_7_committed <= _GEN_2745;
    end else begin
      entries_7_committed <= _GEN_983;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_7_writtenBack <= _GEN_2713;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_7_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_7_Memwritten <= _GEN_4217;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_7_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_7_valid & ~entries_7_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_7_alreadyFlush <= _GEN_1232;
      end else begin
        entries_7_alreadyFlush <= _GEN_999;
      end
    end else begin
      entries_7_alreadyFlush <= _GEN_999;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_7_dcacheIssued <= _GEN_4185;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_7_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h7 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_7_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_7_vaddr <= _GEN_1063;
      end
    end else begin
      entries_7_vaddr <= _GEN_1063;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h7 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_7_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_7_paddr <= _GEN_1079;
      end
    end else begin
      entries_7_paddr <= _GEN_1079;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h7 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_7_data <= io_dataWrite_data;
        end else begin
          entries_7_data <= _entries_data_T_7;
        end
      end else begin
        entries_7_data <= _GEN_1095;
      end
    end else begin
      entries_7_data <= _GEN_1095;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h7 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_7_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_7_excp_excpVec <= _GEN_1111;
      end
    end else begin
      entries_7_excp_excpVec <= _GEN_1111;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h7 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_7_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_7_cacheable <= _GEN_1127;
      end
    end else begin
      entries_7_cacheable <= _GEN_1127;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_7_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_7_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_7_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_7_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_7_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_7_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_8_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_8_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_8_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h8 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_8_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_8_valid <= _GEN_936;
      end
    end else begin
      entries_8_valid <= _GEN_936;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_8_addrValid <= _GEN_1274;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_8_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_8_dataValid <= _GEN_1434;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_8_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_8_committed <= _GEN_2810;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_8_committed <= _GEN_2778;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_8_committed <= _GEN_2746;
    end else begin
      entries_8_committed <= _GEN_984;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_8_writtenBack <= _GEN_2714;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_8_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_8_Memwritten <= _GEN_4218;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_8_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_8_valid & ~entries_8_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_8_alreadyFlush <= _GEN_1234;
      end else begin
        entries_8_alreadyFlush <= _GEN_1000;
      end
    end else begin
      entries_8_alreadyFlush <= _GEN_1000;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_8_dcacheIssued <= _GEN_4186;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_8_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h8 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_8_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_8_vaddr <= _GEN_1064;
      end
    end else begin
      entries_8_vaddr <= _GEN_1064;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h8 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_8_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_8_paddr <= _GEN_1080;
      end
    end else begin
      entries_8_paddr <= _GEN_1080;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h8 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_8_data <= io_dataWrite_data;
        end else begin
          entries_8_data <= _entries_data_T_7;
        end
      end else begin
        entries_8_data <= _GEN_1096;
      end
    end else begin
      entries_8_data <= _GEN_1096;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h8 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_8_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_8_excp_excpVec <= _GEN_1112;
      end
    end else begin
      entries_8_excp_excpVec <= _GEN_1112;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h8 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_8_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_8_cacheable <= _GEN_1128;
      end
    end else begin
      entries_8_cacheable <= _GEN_1128;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_8_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_8_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_8_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_8_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_8_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_8_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_9_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_9_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_9_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'h9 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_9_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_9_valid <= _GEN_937;
      end
    end else begin
      entries_9_valid <= _GEN_937;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_9_addrValid <= _GEN_1275;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_9_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_9_dataValid <= _GEN_1435;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_9_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_9_committed <= _GEN_2811;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_9_committed <= _GEN_2779;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_9_committed <= _GEN_2747;
    end else begin
      entries_9_committed <= _GEN_985;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_9_writtenBack <= _GEN_2715;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_9_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_9_Memwritten <= _GEN_4219;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_9_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_9_valid & ~entries_9_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_9_alreadyFlush <= _GEN_1236;
      end else begin
        entries_9_alreadyFlush <= _GEN_1001;
      end
    end else begin
      entries_9_alreadyFlush <= _GEN_1001;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_9_dcacheIssued <= _GEN_4187;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_9_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h9 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_9_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_9_vaddr <= _GEN_1065;
      end
    end else begin
      entries_9_vaddr <= _GEN_1065;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h9 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_9_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_9_paddr <= _GEN_1081;
      end
    end else begin
      entries_9_paddr <= _GEN_1081;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'h9 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_9_data <= io_dataWrite_data;
        end else begin
          entries_9_data <= _entries_data_T_7;
        end
      end else begin
        entries_9_data <= _GEN_1097;
      end
    end else begin
      entries_9_data <= _GEN_1097;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h9 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_9_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_9_excp_excpVec <= _GEN_1113;
      end
    end else begin
      entries_9_excp_excpVec <= _GEN_1113;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'h9 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_9_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_9_cacheable <= _GEN_1129;
      end
    end else begin
      entries_9_cacheable <= _GEN_1129;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_9_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_9_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_9_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_9_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_9_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_9_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_10_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_10_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_10_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'ha == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_10_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_10_valid <= _GEN_938;
      end
    end else begin
      entries_10_valid <= _GEN_938;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_10_addrValid <= _GEN_1276;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_10_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_10_dataValid <= _GEN_1436;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_10_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_10_committed <= _GEN_2812;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_10_committed <= _GEN_2780;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_10_committed <= _GEN_2748;
    end else begin
      entries_10_committed <= _GEN_986;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_10_writtenBack <= _GEN_2716;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_10_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_10_Memwritten <= _GEN_4220;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_10_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_10_valid & ~entries_10_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_10_alreadyFlush <= _GEN_1238;
      end else begin
        entries_10_alreadyFlush <= _GEN_1002;
      end
    end else begin
      entries_10_alreadyFlush <= _GEN_1002;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_10_dcacheIssued <= _GEN_4188;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_10_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'ha == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_10_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_10_vaddr <= _GEN_1066;
      end
    end else begin
      entries_10_vaddr <= _GEN_1066;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'ha == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_10_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_10_paddr <= _GEN_1082;
      end
    end else begin
      entries_10_paddr <= _GEN_1082;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'ha == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_10_data <= io_dataWrite_data;
        end else begin
          entries_10_data <= _entries_data_T_7;
        end
      end else begin
        entries_10_data <= _GEN_1098;
      end
    end else begin
      entries_10_data <= _GEN_1098;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'ha == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_10_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_10_excp_excpVec <= _GEN_1114;
      end
    end else begin
      entries_10_excp_excpVec <= _GEN_1114;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'ha == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_10_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_10_cacheable <= _GEN_1130;
      end
    end else begin
      entries_10_cacheable <= _GEN_1130;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_10_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_10_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_10_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_10_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_10_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_10_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_11_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_11_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_11_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'hb == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_11_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_11_valid <= _GEN_939;
      end
    end else begin
      entries_11_valid <= _GEN_939;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_11_addrValid <= _GEN_1277;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_11_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_11_dataValid <= _GEN_1437;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_11_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_11_committed <= _GEN_2813;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_11_committed <= _GEN_2781;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_11_committed <= _GEN_2749;
    end else begin
      entries_11_committed <= _GEN_987;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_11_writtenBack <= _GEN_2717;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_11_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_11_Memwritten <= _GEN_4221;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_11_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_11_valid & ~entries_11_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_11_alreadyFlush <= _GEN_1240;
      end else begin
        entries_11_alreadyFlush <= _GEN_1003;
      end
    end else begin
      entries_11_alreadyFlush <= _GEN_1003;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_11_dcacheIssued <= _GEN_4189;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_11_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hb == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_11_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_11_vaddr <= _GEN_1067;
      end
    end else begin
      entries_11_vaddr <= _GEN_1067;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hb == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_11_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_11_paddr <= _GEN_1083;
      end
    end else begin
      entries_11_paddr <= _GEN_1083;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'hb == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_11_data <= io_dataWrite_data;
        end else begin
          entries_11_data <= _entries_data_T_7;
        end
      end else begin
        entries_11_data <= _GEN_1099;
      end
    end else begin
      entries_11_data <= _GEN_1099;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hb == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_11_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_11_excp_excpVec <= _GEN_1115;
      end
    end else begin
      entries_11_excp_excpVec <= _GEN_1115;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hb == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_11_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_11_cacheable <= _GEN_1131;
      end
    end else begin
      entries_11_cacheable <= _GEN_1131;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_11_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_11_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_11_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_11_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_11_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_11_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_12_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_12_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_12_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'hc == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_12_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_12_valid <= _GEN_940;
      end
    end else begin
      entries_12_valid <= _GEN_940;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_12_addrValid <= _GEN_1278;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_12_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_12_dataValid <= _GEN_1438;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_12_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_12_committed <= _GEN_2814;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_12_committed <= _GEN_2782;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_12_committed <= _GEN_2750;
    end else begin
      entries_12_committed <= _GEN_988;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_12_writtenBack <= _GEN_2718;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_12_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_12_Memwritten <= _GEN_4222;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_12_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_12_valid & ~entries_12_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_12_alreadyFlush <= _GEN_1242;
      end else begin
        entries_12_alreadyFlush <= _GEN_1004;
      end
    end else begin
      entries_12_alreadyFlush <= _GEN_1004;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_12_dcacheIssued <= _GEN_4190;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_12_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hc == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_12_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_12_vaddr <= _GEN_1068;
      end
    end else begin
      entries_12_vaddr <= _GEN_1068;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hc == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_12_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_12_paddr <= _GEN_1084;
      end
    end else begin
      entries_12_paddr <= _GEN_1084;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'hc == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_12_data <= io_dataWrite_data;
        end else begin
          entries_12_data <= _entries_data_T_7;
        end
      end else begin
        entries_12_data <= _GEN_1100;
      end
    end else begin
      entries_12_data <= _GEN_1100;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hc == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_12_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_12_excp_excpVec <= _GEN_1116;
      end
    end else begin
      entries_12_excp_excpVec <= _GEN_1116;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hc == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_12_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_12_cacheable <= _GEN_1132;
      end
    end else begin
      entries_12_cacheable <= _GEN_1132;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_12_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_12_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_12_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_12_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_12_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_12_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_13_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_13_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_13_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'hd == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_13_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_13_valid <= _GEN_941;
      end
    end else begin
      entries_13_valid <= _GEN_941;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_13_addrValid <= _GEN_1279;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_13_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_13_dataValid <= _GEN_1439;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_13_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_13_committed <= _GEN_2815;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_13_committed <= _GEN_2783;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_13_committed <= _GEN_2751;
    end else begin
      entries_13_committed <= _GEN_989;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_13_writtenBack <= _GEN_2719;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_13_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_13_Memwritten <= _GEN_4223;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_13_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_13_valid & ~entries_13_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_13_alreadyFlush <= _GEN_1244;
      end else begin
        entries_13_alreadyFlush <= _GEN_1005;
      end
    end else begin
      entries_13_alreadyFlush <= _GEN_1005;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_13_dcacheIssued <= _GEN_4191;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_13_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hd == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_13_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_13_vaddr <= _GEN_1069;
      end
    end else begin
      entries_13_vaddr <= _GEN_1069;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hd == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_13_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_13_paddr <= _GEN_1085;
      end
    end else begin
      entries_13_paddr <= _GEN_1085;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'hd == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_13_data <= io_dataWrite_data;
        end else begin
          entries_13_data <= _entries_data_T_7;
        end
      end else begin
        entries_13_data <= _GEN_1101;
      end
    end else begin
      entries_13_data <= _GEN_1101;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hd == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_13_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_13_excp_excpVec <= _GEN_1117;
      end
    end else begin
      entries_13_excp_excpVec <= _GEN_1117;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hd == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_13_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_13_cacheable <= _GEN_1133;
      end
    end else begin
      entries_13_cacheable <= _GEN_1133;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_13_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_13_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_13_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_13_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_13_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_13_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_14_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_14_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_14_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'he == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_14_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_14_valid <= _GEN_942;
      end
    end else begin
      entries_14_valid <= _GEN_942;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_14_addrValid <= _GEN_1280;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_14_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_14_dataValid <= _GEN_1440;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_14_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_14_committed <= _GEN_2816;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_14_committed <= _GEN_2784;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_14_committed <= _GEN_2752;
    end else begin
      entries_14_committed <= _GEN_990;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_14_writtenBack <= _GEN_2720;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_14_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_14_Memwritten <= _GEN_4224;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_14_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_14_valid & ~entries_14_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_14_alreadyFlush <= _GEN_1246;
      end else begin
        entries_14_alreadyFlush <= _GEN_1006;
      end
    end else begin
      entries_14_alreadyFlush <= _GEN_1006;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_14_dcacheIssued <= _GEN_4192;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_14_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'he == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_14_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_14_vaddr <= _GEN_1070;
      end
    end else begin
      entries_14_vaddr <= _GEN_1070;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'he == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_14_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_14_paddr <= _GEN_1086;
      end
    end else begin
      entries_14_paddr <= _GEN_1086;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'he == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_14_data <= io_dataWrite_data;
        end else begin
          entries_14_data <= _entries_data_T_7;
        end
      end else begin
        entries_14_data <= _GEN_1102;
      end
    end else begin
      entries_14_data <= _GEN_1102;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'he == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_14_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_14_excp_excpVec <= _GEN_1118;
      end
    end else begin
      entries_14_excp_excpVec <= _GEN_1118;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'he == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_14_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_14_cacheable <= _GEN_1134;
      end
    end else begin
      entries_14_cacheable <= _GEN_1134;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_14_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_14_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_14_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_14_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_14_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_14_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_robIdxFull_value <= 6'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_15_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_robIdxFull_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 167:31]
        entries_15_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 167:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_lqIdx <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 168:31]
        entries_15_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 168:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (4'hf == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 413:33]
        entries_15_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 413:33]
      end else begin
        entries_15_valid <= _GEN_943;
      end
    end else begin
      entries_15_valid <= _GEN_943;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      entries_15_addrValid <= _GEN_1281;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 170:31]
        entries_15_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 170:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      entries_15_dataValid <= _GEN_1441;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 171:31]
        entries_15_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 171:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_committed <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_15_committed <= _GEN_2817;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_15_committed <= _GEN_2785;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 358:33]
      entries_15_committed <= _GEN_2753;
    end else begin
      entries_15_committed <= _GEN_991;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_32) begin // @[src/main/scala/memory/StoreQueue.scala 349:27]
      entries_15_writtenBack <= _GEN_2721;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 176:31]
        entries_15_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 176:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_storeAck_valid) begin // @[src/main/scala/memory/StoreQueue.scala 399:27]
      entries_15_Memwritten <= _GEN_4225;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 177:30]
        entries_15_Memwritten <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 177:30]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_alreadyFlush <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (doRedirect) begin // @[src/main/scala/memory/StoreQueue.scala 197:18]
      if (entries_15_valid & ~entries_15_committed) begin // @[src/main/scala/memory/StoreQueue.scala 200:35]
        entries_15_alreadyFlush <= _GEN_1248;
      end else begin
        entries_15_alreadyFlush <= _GEN_1007;
      end
    end else begin
      entries_15_alreadyFlush <= _GEN_1007;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (_T_33) begin // @[src/main/scala/memory/StoreQueue.scala 395:27]
      entries_15_dcacheIssued <= _GEN_4193;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 178:31]
        entries_15_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 178:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_vaddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hf == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 230:28]
        entries_15_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 230:28]
      end else begin
        entries_15_vaddr <= _GEN_1071;
      end
    end else begin
      entries_15_vaddr <= _GEN_1071;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_paddr <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hf == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 231:28]
        entries_15_paddr <= io_addrWrite_paddr; // @[src/main/scala/memory/StoreQueue.scala 231:28]
      end else begin
        entries_15_paddr <= _GEN_1087;
      end
    end else begin
      entries_15_paddr <= _GEN_1087;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_data <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 239:28]
      if (4'hf == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 242:23]
        if (4'h6 == _GEN_1457) begin // @[src/main/scala/memory/StoreQueue.scala 242:74]
          entries_15_data <= io_dataWrite_data;
        end else begin
          entries_15_data <= _entries_data_T_7;
        end
      end else begin
        entries_15_data <= _GEN_1103;
      end
    end else begin
      entries_15_data <= _GEN_1103;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_excp_excpVec <= 17'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hf == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 232:27]
        entries_15_excp_excpVec <= io_addrWrite_excp_excpVec; // @[src/main/scala/memory/StoreQueue.scala 232:27]
      end else begin
        entries_15_excp_excpVec <= _GEN_1119;
      end
    end else begin
      entries_15_excp_excpVec <= _GEN_1119;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 227:28]
      if (4'hf == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 233:32]
        entries_15_cacheable <= io_addrWrite_cacheable; // @[src/main/scala/memory/StoreQueue.scala 233:32]
      end else begin
        entries_15_cacheable <= _GEN_1135;
      end
    end else begin
      entries_15_cacheable <= _GEN_1135;
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_lsuOp <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 184:31]
        entries_15_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 184:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_pc <= 32'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 185:31]
        entries_15_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 185:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_pdst <= 7'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 186:31]
        entries_15_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 186:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_rfWen <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 187:31]
        entries_15_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 187:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 114:24]
      entries_15_fuType <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 114:24]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 188:31]
        entries_15_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 188:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 117:23]
      enqPtr_value <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 117:23]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      enqPtr_value <= enqPtr_newPtr_value; // @[src/main/scala/memory/StoreQueue.scala 189:12]
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 117:23]
      enqPtr_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 117:23]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 165:17]
      if (enqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        enqPtr_flag <= ~enqPtr_flag;
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 120:23]
      deqPtr_value <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 120:23]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      deqPtr_value <= deqPtr_newPtr_value; // @[src/main/scala/memory/StoreQueue.scala 414:12]
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 120:23]
      deqPtr_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 120:23]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 412:16]
      if (deqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        deqPtr_flag <= ~deqPtr_flag;
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
  entries_0_robIdxFull_value = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  entries_0_robIdxFull_flag = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  entries_0_lqIdx = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  entries_0_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entries_0_addrValid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entries_0_dataValid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entries_0_committed = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_writtenBack = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_Memwritten = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_alreadyFlush = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  entries_0_dcacheIssued = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  entries_0_vaddr = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  entries_0_paddr = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  entries_0_data = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  entries_0_excp_excpVec = _RAND_14[16:0];
  _RAND_15 = {1{`RANDOM}};
  entries_0_cacheable = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  entries_0_lsuOp = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  entries_0_pc = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  entries_0_pdst = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  entries_0_rfWen = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  entries_0_fuType = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  entries_1_robIdxFull_value = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  entries_1_robIdxFull_flag = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entries_1_lqIdx = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  entries_1_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entries_1_addrValid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entries_1_dataValid = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  entries_1_committed = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  entries_1_writtenBack = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  entries_1_Memwritten = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  entries_1_alreadyFlush = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entries_1_dcacheIssued = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  entries_1_vaddr = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  entries_1_paddr = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  entries_1_data = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  entries_1_excp_excpVec = _RAND_35[16:0];
  _RAND_36 = {1{`RANDOM}};
  entries_1_cacheable = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  entries_1_lsuOp = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  entries_1_pc = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  entries_1_pdst = _RAND_39[6:0];
  _RAND_40 = {1{`RANDOM}};
  entries_1_rfWen = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  entries_1_fuType = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  entries_2_robIdxFull_value = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  entries_2_robIdxFull_flag = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  entries_2_lqIdx = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  entries_2_valid = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  entries_2_addrValid = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  entries_2_dataValid = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  entries_2_committed = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  entries_2_writtenBack = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  entries_2_Memwritten = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  entries_2_alreadyFlush = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  entries_2_dcacheIssued = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  entries_2_vaddr = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  entries_2_paddr = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  entries_2_data = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  entries_2_excp_excpVec = _RAND_56[16:0];
  _RAND_57 = {1{`RANDOM}};
  entries_2_cacheable = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  entries_2_lsuOp = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  entries_2_pc = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  entries_2_pdst = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  entries_2_rfWen = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  entries_2_fuType = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  entries_3_robIdxFull_value = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  entries_3_robIdxFull_flag = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  entries_3_lqIdx = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  entries_3_valid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  entries_3_addrValid = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  entries_3_dataValid = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  entries_3_committed = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  entries_3_writtenBack = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  entries_3_Memwritten = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  entries_3_alreadyFlush = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  entries_3_dcacheIssued = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  entries_3_vaddr = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  entries_3_paddr = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  entries_3_data = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  entries_3_excp_excpVec = _RAND_77[16:0];
  _RAND_78 = {1{`RANDOM}};
  entries_3_cacheable = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  entries_3_lsuOp = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  entries_3_pc = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  entries_3_pdst = _RAND_81[6:0];
  _RAND_82 = {1{`RANDOM}};
  entries_3_rfWen = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  entries_3_fuType = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  entries_4_robIdxFull_value = _RAND_84[5:0];
  _RAND_85 = {1{`RANDOM}};
  entries_4_robIdxFull_flag = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  entries_4_lqIdx = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  entries_4_valid = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  entries_4_addrValid = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  entries_4_dataValid = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  entries_4_committed = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  entries_4_writtenBack = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  entries_4_Memwritten = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  entries_4_alreadyFlush = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  entries_4_dcacheIssued = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  entries_4_vaddr = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  entries_4_paddr = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  entries_4_data = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  entries_4_excp_excpVec = _RAND_98[16:0];
  _RAND_99 = {1{`RANDOM}};
  entries_4_cacheable = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  entries_4_lsuOp = _RAND_100[3:0];
  _RAND_101 = {1{`RANDOM}};
  entries_4_pc = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  entries_4_pdst = _RAND_102[6:0];
  _RAND_103 = {1{`RANDOM}};
  entries_4_rfWen = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  entries_4_fuType = _RAND_104[3:0];
  _RAND_105 = {1{`RANDOM}};
  entries_5_robIdxFull_value = _RAND_105[5:0];
  _RAND_106 = {1{`RANDOM}};
  entries_5_robIdxFull_flag = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  entries_5_lqIdx = _RAND_107[3:0];
  _RAND_108 = {1{`RANDOM}};
  entries_5_valid = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  entries_5_addrValid = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  entries_5_dataValid = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  entries_5_committed = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  entries_5_writtenBack = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  entries_5_Memwritten = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  entries_5_alreadyFlush = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  entries_5_dcacheIssued = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  entries_5_vaddr = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  entries_5_paddr = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  entries_5_data = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  entries_5_excp_excpVec = _RAND_119[16:0];
  _RAND_120 = {1{`RANDOM}};
  entries_5_cacheable = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  entries_5_lsuOp = _RAND_121[3:0];
  _RAND_122 = {1{`RANDOM}};
  entries_5_pc = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  entries_5_pdst = _RAND_123[6:0];
  _RAND_124 = {1{`RANDOM}};
  entries_5_rfWen = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  entries_5_fuType = _RAND_125[3:0];
  _RAND_126 = {1{`RANDOM}};
  entries_6_robIdxFull_value = _RAND_126[5:0];
  _RAND_127 = {1{`RANDOM}};
  entries_6_robIdxFull_flag = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  entries_6_lqIdx = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  entries_6_valid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  entries_6_addrValid = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entries_6_dataValid = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  entries_6_committed = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  entries_6_writtenBack = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  entries_6_Memwritten = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  entries_6_alreadyFlush = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  entries_6_dcacheIssued = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  entries_6_vaddr = _RAND_137[31:0];
  _RAND_138 = {1{`RANDOM}};
  entries_6_paddr = _RAND_138[31:0];
  _RAND_139 = {1{`RANDOM}};
  entries_6_data = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  entries_6_excp_excpVec = _RAND_140[16:0];
  _RAND_141 = {1{`RANDOM}};
  entries_6_cacheable = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  entries_6_lsuOp = _RAND_142[3:0];
  _RAND_143 = {1{`RANDOM}};
  entries_6_pc = _RAND_143[31:0];
  _RAND_144 = {1{`RANDOM}};
  entries_6_pdst = _RAND_144[6:0];
  _RAND_145 = {1{`RANDOM}};
  entries_6_rfWen = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  entries_6_fuType = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  entries_7_robIdxFull_value = _RAND_147[5:0];
  _RAND_148 = {1{`RANDOM}};
  entries_7_robIdxFull_flag = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  entries_7_lqIdx = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  entries_7_valid = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  entries_7_addrValid = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  entries_7_dataValid = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  entries_7_committed = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  entries_7_writtenBack = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  entries_7_Memwritten = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  entries_7_alreadyFlush = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  entries_7_dcacheIssued = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  entries_7_vaddr = _RAND_158[31:0];
  _RAND_159 = {1{`RANDOM}};
  entries_7_paddr = _RAND_159[31:0];
  _RAND_160 = {1{`RANDOM}};
  entries_7_data = _RAND_160[31:0];
  _RAND_161 = {1{`RANDOM}};
  entries_7_excp_excpVec = _RAND_161[16:0];
  _RAND_162 = {1{`RANDOM}};
  entries_7_cacheable = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  entries_7_lsuOp = _RAND_163[3:0];
  _RAND_164 = {1{`RANDOM}};
  entries_7_pc = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  entries_7_pdst = _RAND_165[6:0];
  _RAND_166 = {1{`RANDOM}};
  entries_7_rfWen = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  entries_7_fuType = _RAND_167[3:0];
  _RAND_168 = {1{`RANDOM}};
  entries_8_robIdxFull_value = _RAND_168[5:0];
  _RAND_169 = {1{`RANDOM}};
  entries_8_robIdxFull_flag = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  entries_8_lqIdx = _RAND_170[3:0];
  _RAND_171 = {1{`RANDOM}};
  entries_8_valid = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  entries_8_addrValid = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  entries_8_dataValid = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  entries_8_committed = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  entries_8_writtenBack = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  entries_8_Memwritten = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  entries_8_alreadyFlush = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  entries_8_dcacheIssued = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  entries_8_vaddr = _RAND_179[31:0];
  _RAND_180 = {1{`RANDOM}};
  entries_8_paddr = _RAND_180[31:0];
  _RAND_181 = {1{`RANDOM}};
  entries_8_data = _RAND_181[31:0];
  _RAND_182 = {1{`RANDOM}};
  entries_8_excp_excpVec = _RAND_182[16:0];
  _RAND_183 = {1{`RANDOM}};
  entries_8_cacheable = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  entries_8_lsuOp = _RAND_184[3:0];
  _RAND_185 = {1{`RANDOM}};
  entries_8_pc = _RAND_185[31:0];
  _RAND_186 = {1{`RANDOM}};
  entries_8_pdst = _RAND_186[6:0];
  _RAND_187 = {1{`RANDOM}};
  entries_8_rfWen = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  entries_8_fuType = _RAND_188[3:0];
  _RAND_189 = {1{`RANDOM}};
  entries_9_robIdxFull_value = _RAND_189[5:0];
  _RAND_190 = {1{`RANDOM}};
  entries_9_robIdxFull_flag = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  entries_9_lqIdx = _RAND_191[3:0];
  _RAND_192 = {1{`RANDOM}};
  entries_9_valid = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  entries_9_addrValid = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  entries_9_dataValid = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  entries_9_committed = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  entries_9_writtenBack = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  entries_9_Memwritten = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  entries_9_alreadyFlush = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  entries_9_dcacheIssued = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  entries_9_vaddr = _RAND_200[31:0];
  _RAND_201 = {1{`RANDOM}};
  entries_9_paddr = _RAND_201[31:0];
  _RAND_202 = {1{`RANDOM}};
  entries_9_data = _RAND_202[31:0];
  _RAND_203 = {1{`RANDOM}};
  entries_9_excp_excpVec = _RAND_203[16:0];
  _RAND_204 = {1{`RANDOM}};
  entries_9_cacheable = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  entries_9_lsuOp = _RAND_205[3:0];
  _RAND_206 = {1{`RANDOM}};
  entries_9_pc = _RAND_206[31:0];
  _RAND_207 = {1{`RANDOM}};
  entries_9_pdst = _RAND_207[6:0];
  _RAND_208 = {1{`RANDOM}};
  entries_9_rfWen = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  entries_9_fuType = _RAND_209[3:0];
  _RAND_210 = {1{`RANDOM}};
  entries_10_robIdxFull_value = _RAND_210[5:0];
  _RAND_211 = {1{`RANDOM}};
  entries_10_robIdxFull_flag = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  entries_10_lqIdx = _RAND_212[3:0];
  _RAND_213 = {1{`RANDOM}};
  entries_10_valid = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  entries_10_addrValid = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  entries_10_dataValid = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  entries_10_committed = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  entries_10_writtenBack = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  entries_10_Memwritten = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  entries_10_alreadyFlush = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  entries_10_dcacheIssued = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  entries_10_vaddr = _RAND_221[31:0];
  _RAND_222 = {1{`RANDOM}};
  entries_10_paddr = _RAND_222[31:0];
  _RAND_223 = {1{`RANDOM}};
  entries_10_data = _RAND_223[31:0];
  _RAND_224 = {1{`RANDOM}};
  entries_10_excp_excpVec = _RAND_224[16:0];
  _RAND_225 = {1{`RANDOM}};
  entries_10_cacheable = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  entries_10_lsuOp = _RAND_226[3:0];
  _RAND_227 = {1{`RANDOM}};
  entries_10_pc = _RAND_227[31:0];
  _RAND_228 = {1{`RANDOM}};
  entries_10_pdst = _RAND_228[6:0];
  _RAND_229 = {1{`RANDOM}};
  entries_10_rfWen = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  entries_10_fuType = _RAND_230[3:0];
  _RAND_231 = {1{`RANDOM}};
  entries_11_robIdxFull_value = _RAND_231[5:0];
  _RAND_232 = {1{`RANDOM}};
  entries_11_robIdxFull_flag = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  entries_11_lqIdx = _RAND_233[3:0];
  _RAND_234 = {1{`RANDOM}};
  entries_11_valid = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  entries_11_addrValid = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  entries_11_dataValid = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  entries_11_committed = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  entries_11_writtenBack = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  entries_11_Memwritten = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  entries_11_alreadyFlush = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  entries_11_dcacheIssued = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  entries_11_vaddr = _RAND_242[31:0];
  _RAND_243 = {1{`RANDOM}};
  entries_11_paddr = _RAND_243[31:0];
  _RAND_244 = {1{`RANDOM}};
  entries_11_data = _RAND_244[31:0];
  _RAND_245 = {1{`RANDOM}};
  entries_11_excp_excpVec = _RAND_245[16:0];
  _RAND_246 = {1{`RANDOM}};
  entries_11_cacheable = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  entries_11_lsuOp = _RAND_247[3:0];
  _RAND_248 = {1{`RANDOM}};
  entries_11_pc = _RAND_248[31:0];
  _RAND_249 = {1{`RANDOM}};
  entries_11_pdst = _RAND_249[6:0];
  _RAND_250 = {1{`RANDOM}};
  entries_11_rfWen = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  entries_11_fuType = _RAND_251[3:0];
  _RAND_252 = {1{`RANDOM}};
  entries_12_robIdxFull_value = _RAND_252[5:0];
  _RAND_253 = {1{`RANDOM}};
  entries_12_robIdxFull_flag = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  entries_12_lqIdx = _RAND_254[3:0];
  _RAND_255 = {1{`RANDOM}};
  entries_12_valid = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  entries_12_addrValid = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  entries_12_dataValid = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  entries_12_committed = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  entries_12_writtenBack = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  entries_12_Memwritten = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  entries_12_alreadyFlush = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  entries_12_dcacheIssued = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  entries_12_vaddr = _RAND_263[31:0];
  _RAND_264 = {1{`RANDOM}};
  entries_12_paddr = _RAND_264[31:0];
  _RAND_265 = {1{`RANDOM}};
  entries_12_data = _RAND_265[31:0];
  _RAND_266 = {1{`RANDOM}};
  entries_12_excp_excpVec = _RAND_266[16:0];
  _RAND_267 = {1{`RANDOM}};
  entries_12_cacheable = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  entries_12_lsuOp = _RAND_268[3:0];
  _RAND_269 = {1{`RANDOM}};
  entries_12_pc = _RAND_269[31:0];
  _RAND_270 = {1{`RANDOM}};
  entries_12_pdst = _RAND_270[6:0];
  _RAND_271 = {1{`RANDOM}};
  entries_12_rfWen = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  entries_12_fuType = _RAND_272[3:0];
  _RAND_273 = {1{`RANDOM}};
  entries_13_robIdxFull_value = _RAND_273[5:0];
  _RAND_274 = {1{`RANDOM}};
  entries_13_robIdxFull_flag = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  entries_13_lqIdx = _RAND_275[3:0];
  _RAND_276 = {1{`RANDOM}};
  entries_13_valid = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  entries_13_addrValid = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  entries_13_dataValid = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  entries_13_committed = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  entries_13_writtenBack = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  entries_13_Memwritten = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  entries_13_alreadyFlush = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  entries_13_dcacheIssued = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  entries_13_vaddr = _RAND_284[31:0];
  _RAND_285 = {1{`RANDOM}};
  entries_13_paddr = _RAND_285[31:0];
  _RAND_286 = {1{`RANDOM}};
  entries_13_data = _RAND_286[31:0];
  _RAND_287 = {1{`RANDOM}};
  entries_13_excp_excpVec = _RAND_287[16:0];
  _RAND_288 = {1{`RANDOM}};
  entries_13_cacheable = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  entries_13_lsuOp = _RAND_289[3:0];
  _RAND_290 = {1{`RANDOM}};
  entries_13_pc = _RAND_290[31:0];
  _RAND_291 = {1{`RANDOM}};
  entries_13_pdst = _RAND_291[6:0];
  _RAND_292 = {1{`RANDOM}};
  entries_13_rfWen = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  entries_13_fuType = _RAND_293[3:0];
  _RAND_294 = {1{`RANDOM}};
  entries_14_robIdxFull_value = _RAND_294[5:0];
  _RAND_295 = {1{`RANDOM}};
  entries_14_robIdxFull_flag = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  entries_14_lqIdx = _RAND_296[3:0];
  _RAND_297 = {1{`RANDOM}};
  entries_14_valid = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  entries_14_addrValid = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  entries_14_dataValid = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  entries_14_committed = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  entries_14_writtenBack = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  entries_14_Memwritten = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  entries_14_alreadyFlush = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  entries_14_dcacheIssued = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  entries_14_vaddr = _RAND_305[31:0];
  _RAND_306 = {1{`RANDOM}};
  entries_14_paddr = _RAND_306[31:0];
  _RAND_307 = {1{`RANDOM}};
  entries_14_data = _RAND_307[31:0];
  _RAND_308 = {1{`RANDOM}};
  entries_14_excp_excpVec = _RAND_308[16:0];
  _RAND_309 = {1{`RANDOM}};
  entries_14_cacheable = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  entries_14_lsuOp = _RAND_310[3:0];
  _RAND_311 = {1{`RANDOM}};
  entries_14_pc = _RAND_311[31:0];
  _RAND_312 = {1{`RANDOM}};
  entries_14_pdst = _RAND_312[6:0];
  _RAND_313 = {1{`RANDOM}};
  entries_14_rfWen = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  entries_14_fuType = _RAND_314[3:0];
  _RAND_315 = {1{`RANDOM}};
  entries_15_robIdxFull_value = _RAND_315[5:0];
  _RAND_316 = {1{`RANDOM}};
  entries_15_robIdxFull_flag = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  entries_15_lqIdx = _RAND_317[3:0];
  _RAND_318 = {1{`RANDOM}};
  entries_15_valid = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  entries_15_addrValid = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  entries_15_dataValid = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  entries_15_committed = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  entries_15_writtenBack = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  entries_15_Memwritten = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  entries_15_alreadyFlush = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  entries_15_dcacheIssued = _RAND_325[0:0];
  _RAND_326 = {1{`RANDOM}};
  entries_15_vaddr = _RAND_326[31:0];
  _RAND_327 = {1{`RANDOM}};
  entries_15_paddr = _RAND_327[31:0];
  _RAND_328 = {1{`RANDOM}};
  entries_15_data = _RAND_328[31:0];
  _RAND_329 = {1{`RANDOM}};
  entries_15_excp_excpVec = _RAND_329[16:0];
  _RAND_330 = {1{`RANDOM}};
  entries_15_cacheable = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  entries_15_lsuOp = _RAND_331[3:0];
  _RAND_332 = {1{`RANDOM}};
  entries_15_pc = _RAND_332[31:0];
  _RAND_333 = {1{`RANDOM}};
  entries_15_pdst = _RAND_333[6:0];
  _RAND_334 = {1{`RANDOM}};
  entries_15_rfWen = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  entries_15_fuType = _RAND_335[3:0];
  _RAND_336 = {1{`RANDOM}};
  enqPtr_value = _RAND_336[3:0];
  _RAND_337 = {1{`RANDOM}};
  enqPtr_flag = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  deqPtr_value = _RAND_338[3:0];
  _RAND_339 = {1{`RANDOM}};
  deqPtr_flag = _RAND_339[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
