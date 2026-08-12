module ICacheReplacer_1(
  input        clock,
  input        reset,
  input        io_touch_valid, // @[src/main/scala/icache/ICacheReplacer.scala 9:14]
  input  [7:0] io_touch_idx, // @[src/main/scala/icache/ICacheReplacer.scala 9:14]
  input  [1:0] io_touch_way, // @[src/main/scala/icache/ICacheReplacer.scala 9:14]
  input        io_victim_req, // @[src/main/scala/icache/ICacheReplacer.scala 9:14]
  input  [7:0] io_victim_idx, // @[src/main/scala/icache/ICacheReplacer.scala 9:14]
  output [1:0] io_victim_resp // @[src/main/scala/icache/ICacheReplacer.scala 9:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] plruTree_0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_1; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_2; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_3; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_4; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_5; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_6; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_7; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_8; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_9; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_10; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_11; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_12; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_13; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_14; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_15; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_16; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_17; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_18; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_19; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_20; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_21; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_22; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_23; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_24; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_25; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_26; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_27; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_28; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_29; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_30; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_31; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_32; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_33; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_34; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_35; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_36; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_37; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_38; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_39; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_40; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_41; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_42; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_43; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_44; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_45; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_46; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_47; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_48; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_49; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_50; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_51; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_52; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_53; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_54; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_55; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_56; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_57; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_58; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_59; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_60; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_61; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_62; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_63; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_64; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_65; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_66; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_67; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_68; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_69; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_70; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_71; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_72; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_73; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_74; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_75; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_76; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_77; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_78; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_79; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_80; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_81; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_82; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_83; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_84; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_85; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_86; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_87; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_88; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_89; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_90; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_91; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_92; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_93; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_94; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_95; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_96; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_97; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_98; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_99; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_100; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_101; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_102; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_103; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_104; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_105; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_106; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_107; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_108; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_109; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_110; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_111; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_112; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_113; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_114; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_115; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_116; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_117; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_118; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_119; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_120; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_121; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_122; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_123; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_124; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_125; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_126; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_127; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_128; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_129; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_130; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_131; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_132; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_133; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_134; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_135; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_136; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_137; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_138; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_139; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_140; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_141; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_142; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_143; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_144; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_145; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_146; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_147; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_148; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_149; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_150; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_151; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_152; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_153; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_154; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_155; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_156; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_157; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_158; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_159; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_160; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_161; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_162; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_163; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_164; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_165; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_166; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_167; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_168; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_169; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_170; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_171; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_172; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_173; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_174; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_175; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_176; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_177; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_178; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_179; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_180; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_181; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_182; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_183; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_184; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_185; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_186; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_187; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_188; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_189; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_190; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_191; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_192; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_193; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_194; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_195; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_196; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_197; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_198; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_199; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_200; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_201; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_202; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_203; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_204; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_205; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_206; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_207; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_208; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_209; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_210; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_211; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_212; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_213; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_214; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_215; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_216; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_217; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_218; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_219; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_220; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_221; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_222; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_223; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_224; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_225; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_226; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_227; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_228; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_229; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_230; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_231; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_232; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_233; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_234; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_235; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_236; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_237; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_238; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_239; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_240; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_241; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_242; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_243; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_244; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_245; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_246; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_247; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_248; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_249; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_250; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_251; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_252; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_253; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_254; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  reg [2:0] plruTree_255; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
  wire [2:0] _GEN_1 = 8'h1 == io_touch_idx ? plruTree_1 : plruTree_0; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_2 = 8'h2 == io_touch_idx ? plruTree_2 : _GEN_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_3 = 8'h3 == io_touch_idx ? plruTree_3 : _GEN_2; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_4 = 8'h4 == io_touch_idx ? plruTree_4 : _GEN_3; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_5 = 8'h5 == io_touch_idx ? plruTree_5 : _GEN_4; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_6 = 8'h6 == io_touch_idx ? plruTree_6 : _GEN_5; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_7 = 8'h7 == io_touch_idx ? plruTree_7 : _GEN_6; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_8 = 8'h8 == io_touch_idx ? plruTree_8 : _GEN_7; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_9 = 8'h9 == io_touch_idx ? plruTree_9 : _GEN_8; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_10 = 8'ha == io_touch_idx ? plruTree_10 : _GEN_9; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_11 = 8'hb == io_touch_idx ? plruTree_11 : _GEN_10; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_12 = 8'hc == io_touch_idx ? plruTree_12 : _GEN_11; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_13 = 8'hd == io_touch_idx ? plruTree_13 : _GEN_12; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_14 = 8'he == io_touch_idx ? plruTree_14 : _GEN_13; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_15 = 8'hf == io_touch_idx ? plruTree_15 : _GEN_14; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_16 = 8'h10 == io_touch_idx ? plruTree_16 : _GEN_15; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_17 = 8'h11 == io_touch_idx ? plruTree_17 : _GEN_16; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_18 = 8'h12 == io_touch_idx ? plruTree_18 : _GEN_17; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_19 = 8'h13 == io_touch_idx ? plruTree_19 : _GEN_18; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_20 = 8'h14 == io_touch_idx ? plruTree_20 : _GEN_19; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_21 = 8'h15 == io_touch_idx ? plruTree_21 : _GEN_20; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_22 = 8'h16 == io_touch_idx ? plruTree_22 : _GEN_21; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_23 = 8'h17 == io_touch_idx ? plruTree_23 : _GEN_22; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_24 = 8'h18 == io_touch_idx ? plruTree_24 : _GEN_23; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_25 = 8'h19 == io_touch_idx ? plruTree_25 : _GEN_24; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_26 = 8'h1a == io_touch_idx ? plruTree_26 : _GEN_25; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_27 = 8'h1b == io_touch_idx ? plruTree_27 : _GEN_26; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_28 = 8'h1c == io_touch_idx ? plruTree_28 : _GEN_27; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_29 = 8'h1d == io_touch_idx ? plruTree_29 : _GEN_28; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_30 = 8'h1e == io_touch_idx ? plruTree_30 : _GEN_29; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_31 = 8'h1f == io_touch_idx ? plruTree_31 : _GEN_30; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_32 = 8'h20 == io_touch_idx ? plruTree_32 : _GEN_31; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_33 = 8'h21 == io_touch_idx ? plruTree_33 : _GEN_32; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_34 = 8'h22 == io_touch_idx ? plruTree_34 : _GEN_33; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_35 = 8'h23 == io_touch_idx ? plruTree_35 : _GEN_34; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_36 = 8'h24 == io_touch_idx ? plruTree_36 : _GEN_35; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_37 = 8'h25 == io_touch_idx ? plruTree_37 : _GEN_36; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_38 = 8'h26 == io_touch_idx ? plruTree_38 : _GEN_37; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_39 = 8'h27 == io_touch_idx ? plruTree_39 : _GEN_38; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_40 = 8'h28 == io_touch_idx ? plruTree_40 : _GEN_39; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_41 = 8'h29 == io_touch_idx ? plruTree_41 : _GEN_40; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_42 = 8'h2a == io_touch_idx ? plruTree_42 : _GEN_41; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_43 = 8'h2b == io_touch_idx ? plruTree_43 : _GEN_42; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_44 = 8'h2c == io_touch_idx ? plruTree_44 : _GEN_43; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_45 = 8'h2d == io_touch_idx ? plruTree_45 : _GEN_44; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_46 = 8'h2e == io_touch_idx ? plruTree_46 : _GEN_45; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_47 = 8'h2f == io_touch_idx ? plruTree_47 : _GEN_46; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_48 = 8'h30 == io_touch_idx ? plruTree_48 : _GEN_47; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_49 = 8'h31 == io_touch_idx ? plruTree_49 : _GEN_48; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_50 = 8'h32 == io_touch_idx ? plruTree_50 : _GEN_49; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_51 = 8'h33 == io_touch_idx ? plruTree_51 : _GEN_50; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_52 = 8'h34 == io_touch_idx ? plruTree_52 : _GEN_51; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_53 = 8'h35 == io_touch_idx ? plruTree_53 : _GEN_52; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_54 = 8'h36 == io_touch_idx ? plruTree_54 : _GEN_53; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_55 = 8'h37 == io_touch_idx ? plruTree_55 : _GEN_54; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_56 = 8'h38 == io_touch_idx ? plruTree_56 : _GEN_55; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_57 = 8'h39 == io_touch_idx ? plruTree_57 : _GEN_56; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_58 = 8'h3a == io_touch_idx ? plruTree_58 : _GEN_57; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_59 = 8'h3b == io_touch_idx ? plruTree_59 : _GEN_58; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_60 = 8'h3c == io_touch_idx ? plruTree_60 : _GEN_59; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_61 = 8'h3d == io_touch_idx ? plruTree_61 : _GEN_60; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_62 = 8'h3e == io_touch_idx ? plruTree_62 : _GEN_61; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_63 = 8'h3f == io_touch_idx ? plruTree_63 : _GEN_62; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_64 = 8'h40 == io_touch_idx ? plruTree_64 : _GEN_63; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_65 = 8'h41 == io_touch_idx ? plruTree_65 : _GEN_64; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_66 = 8'h42 == io_touch_idx ? plruTree_66 : _GEN_65; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_67 = 8'h43 == io_touch_idx ? plruTree_67 : _GEN_66; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_68 = 8'h44 == io_touch_idx ? plruTree_68 : _GEN_67; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_69 = 8'h45 == io_touch_idx ? plruTree_69 : _GEN_68; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_70 = 8'h46 == io_touch_idx ? plruTree_70 : _GEN_69; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_71 = 8'h47 == io_touch_idx ? plruTree_71 : _GEN_70; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_72 = 8'h48 == io_touch_idx ? plruTree_72 : _GEN_71; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_73 = 8'h49 == io_touch_idx ? plruTree_73 : _GEN_72; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_74 = 8'h4a == io_touch_idx ? plruTree_74 : _GEN_73; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_75 = 8'h4b == io_touch_idx ? plruTree_75 : _GEN_74; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_76 = 8'h4c == io_touch_idx ? plruTree_76 : _GEN_75; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_77 = 8'h4d == io_touch_idx ? plruTree_77 : _GEN_76; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_78 = 8'h4e == io_touch_idx ? plruTree_78 : _GEN_77; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_79 = 8'h4f == io_touch_idx ? plruTree_79 : _GEN_78; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_80 = 8'h50 == io_touch_idx ? plruTree_80 : _GEN_79; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_81 = 8'h51 == io_touch_idx ? plruTree_81 : _GEN_80; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_82 = 8'h52 == io_touch_idx ? plruTree_82 : _GEN_81; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_83 = 8'h53 == io_touch_idx ? plruTree_83 : _GEN_82; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_84 = 8'h54 == io_touch_idx ? plruTree_84 : _GEN_83; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_85 = 8'h55 == io_touch_idx ? plruTree_85 : _GEN_84; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_86 = 8'h56 == io_touch_idx ? plruTree_86 : _GEN_85; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_87 = 8'h57 == io_touch_idx ? plruTree_87 : _GEN_86; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_88 = 8'h58 == io_touch_idx ? plruTree_88 : _GEN_87; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_89 = 8'h59 == io_touch_idx ? plruTree_89 : _GEN_88; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_90 = 8'h5a == io_touch_idx ? plruTree_90 : _GEN_89; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_91 = 8'h5b == io_touch_idx ? plruTree_91 : _GEN_90; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_92 = 8'h5c == io_touch_idx ? plruTree_92 : _GEN_91; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_93 = 8'h5d == io_touch_idx ? plruTree_93 : _GEN_92; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_94 = 8'h5e == io_touch_idx ? plruTree_94 : _GEN_93; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_95 = 8'h5f == io_touch_idx ? plruTree_95 : _GEN_94; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_96 = 8'h60 == io_touch_idx ? plruTree_96 : _GEN_95; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_97 = 8'h61 == io_touch_idx ? plruTree_97 : _GEN_96; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_98 = 8'h62 == io_touch_idx ? plruTree_98 : _GEN_97; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_99 = 8'h63 == io_touch_idx ? plruTree_99 : _GEN_98; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_100 = 8'h64 == io_touch_idx ? plruTree_100 : _GEN_99; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_101 = 8'h65 == io_touch_idx ? plruTree_101 : _GEN_100; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_102 = 8'h66 == io_touch_idx ? plruTree_102 : _GEN_101; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_103 = 8'h67 == io_touch_idx ? plruTree_103 : _GEN_102; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_104 = 8'h68 == io_touch_idx ? plruTree_104 : _GEN_103; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_105 = 8'h69 == io_touch_idx ? plruTree_105 : _GEN_104; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_106 = 8'h6a == io_touch_idx ? plruTree_106 : _GEN_105; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_107 = 8'h6b == io_touch_idx ? plruTree_107 : _GEN_106; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_108 = 8'h6c == io_touch_idx ? plruTree_108 : _GEN_107; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_109 = 8'h6d == io_touch_idx ? plruTree_109 : _GEN_108; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_110 = 8'h6e == io_touch_idx ? plruTree_110 : _GEN_109; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_111 = 8'h6f == io_touch_idx ? plruTree_111 : _GEN_110; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_112 = 8'h70 == io_touch_idx ? plruTree_112 : _GEN_111; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_113 = 8'h71 == io_touch_idx ? plruTree_113 : _GEN_112; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_114 = 8'h72 == io_touch_idx ? plruTree_114 : _GEN_113; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_115 = 8'h73 == io_touch_idx ? plruTree_115 : _GEN_114; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_116 = 8'h74 == io_touch_idx ? plruTree_116 : _GEN_115; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_117 = 8'h75 == io_touch_idx ? plruTree_117 : _GEN_116; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_118 = 8'h76 == io_touch_idx ? plruTree_118 : _GEN_117; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_119 = 8'h77 == io_touch_idx ? plruTree_119 : _GEN_118; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_120 = 8'h78 == io_touch_idx ? plruTree_120 : _GEN_119; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_121 = 8'h79 == io_touch_idx ? plruTree_121 : _GEN_120; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_122 = 8'h7a == io_touch_idx ? plruTree_122 : _GEN_121; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_123 = 8'h7b == io_touch_idx ? plruTree_123 : _GEN_122; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_124 = 8'h7c == io_touch_idx ? plruTree_124 : _GEN_123; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_125 = 8'h7d == io_touch_idx ? plruTree_125 : _GEN_124; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_126 = 8'h7e == io_touch_idx ? plruTree_126 : _GEN_125; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_127 = 8'h7f == io_touch_idx ? plruTree_127 : _GEN_126; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_128 = 8'h80 == io_touch_idx ? plruTree_128 : _GEN_127; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_129 = 8'h81 == io_touch_idx ? plruTree_129 : _GEN_128; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_130 = 8'h82 == io_touch_idx ? plruTree_130 : _GEN_129; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_131 = 8'h83 == io_touch_idx ? plruTree_131 : _GEN_130; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_132 = 8'h84 == io_touch_idx ? plruTree_132 : _GEN_131; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_133 = 8'h85 == io_touch_idx ? plruTree_133 : _GEN_132; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_134 = 8'h86 == io_touch_idx ? plruTree_134 : _GEN_133; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_135 = 8'h87 == io_touch_idx ? plruTree_135 : _GEN_134; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_136 = 8'h88 == io_touch_idx ? plruTree_136 : _GEN_135; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_137 = 8'h89 == io_touch_idx ? plruTree_137 : _GEN_136; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_138 = 8'h8a == io_touch_idx ? plruTree_138 : _GEN_137; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_139 = 8'h8b == io_touch_idx ? plruTree_139 : _GEN_138; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_140 = 8'h8c == io_touch_idx ? plruTree_140 : _GEN_139; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_141 = 8'h8d == io_touch_idx ? plruTree_141 : _GEN_140; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_142 = 8'h8e == io_touch_idx ? plruTree_142 : _GEN_141; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_143 = 8'h8f == io_touch_idx ? plruTree_143 : _GEN_142; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_144 = 8'h90 == io_touch_idx ? plruTree_144 : _GEN_143; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_145 = 8'h91 == io_touch_idx ? plruTree_145 : _GEN_144; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_146 = 8'h92 == io_touch_idx ? plruTree_146 : _GEN_145; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_147 = 8'h93 == io_touch_idx ? plruTree_147 : _GEN_146; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_148 = 8'h94 == io_touch_idx ? plruTree_148 : _GEN_147; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_149 = 8'h95 == io_touch_idx ? plruTree_149 : _GEN_148; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_150 = 8'h96 == io_touch_idx ? plruTree_150 : _GEN_149; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_151 = 8'h97 == io_touch_idx ? plruTree_151 : _GEN_150; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_152 = 8'h98 == io_touch_idx ? plruTree_152 : _GEN_151; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_153 = 8'h99 == io_touch_idx ? plruTree_153 : _GEN_152; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_154 = 8'h9a == io_touch_idx ? plruTree_154 : _GEN_153; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_155 = 8'h9b == io_touch_idx ? plruTree_155 : _GEN_154; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_156 = 8'h9c == io_touch_idx ? plruTree_156 : _GEN_155; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_157 = 8'h9d == io_touch_idx ? plruTree_157 : _GEN_156; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_158 = 8'h9e == io_touch_idx ? plruTree_158 : _GEN_157; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_159 = 8'h9f == io_touch_idx ? plruTree_159 : _GEN_158; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_160 = 8'ha0 == io_touch_idx ? plruTree_160 : _GEN_159; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_161 = 8'ha1 == io_touch_idx ? plruTree_161 : _GEN_160; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_162 = 8'ha2 == io_touch_idx ? plruTree_162 : _GEN_161; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_163 = 8'ha3 == io_touch_idx ? plruTree_163 : _GEN_162; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_164 = 8'ha4 == io_touch_idx ? plruTree_164 : _GEN_163; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_165 = 8'ha5 == io_touch_idx ? plruTree_165 : _GEN_164; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_166 = 8'ha6 == io_touch_idx ? plruTree_166 : _GEN_165; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_167 = 8'ha7 == io_touch_idx ? plruTree_167 : _GEN_166; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_168 = 8'ha8 == io_touch_idx ? plruTree_168 : _GEN_167; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_169 = 8'ha9 == io_touch_idx ? plruTree_169 : _GEN_168; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_170 = 8'haa == io_touch_idx ? plruTree_170 : _GEN_169; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_171 = 8'hab == io_touch_idx ? plruTree_171 : _GEN_170; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_172 = 8'hac == io_touch_idx ? plruTree_172 : _GEN_171; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_173 = 8'had == io_touch_idx ? plruTree_173 : _GEN_172; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_174 = 8'hae == io_touch_idx ? plruTree_174 : _GEN_173; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_175 = 8'haf == io_touch_idx ? plruTree_175 : _GEN_174; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_176 = 8'hb0 == io_touch_idx ? plruTree_176 : _GEN_175; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_177 = 8'hb1 == io_touch_idx ? plruTree_177 : _GEN_176; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_178 = 8'hb2 == io_touch_idx ? plruTree_178 : _GEN_177; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_179 = 8'hb3 == io_touch_idx ? plruTree_179 : _GEN_178; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_180 = 8'hb4 == io_touch_idx ? plruTree_180 : _GEN_179; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_181 = 8'hb5 == io_touch_idx ? plruTree_181 : _GEN_180; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_182 = 8'hb6 == io_touch_idx ? plruTree_182 : _GEN_181; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_183 = 8'hb7 == io_touch_idx ? plruTree_183 : _GEN_182; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_184 = 8'hb8 == io_touch_idx ? plruTree_184 : _GEN_183; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_185 = 8'hb9 == io_touch_idx ? plruTree_185 : _GEN_184; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_186 = 8'hba == io_touch_idx ? plruTree_186 : _GEN_185; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_187 = 8'hbb == io_touch_idx ? plruTree_187 : _GEN_186; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_188 = 8'hbc == io_touch_idx ? plruTree_188 : _GEN_187; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_189 = 8'hbd == io_touch_idx ? plruTree_189 : _GEN_188; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_190 = 8'hbe == io_touch_idx ? plruTree_190 : _GEN_189; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_191 = 8'hbf == io_touch_idx ? plruTree_191 : _GEN_190; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_192 = 8'hc0 == io_touch_idx ? plruTree_192 : _GEN_191; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_193 = 8'hc1 == io_touch_idx ? plruTree_193 : _GEN_192; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_194 = 8'hc2 == io_touch_idx ? plruTree_194 : _GEN_193; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_195 = 8'hc3 == io_touch_idx ? plruTree_195 : _GEN_194; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_196 = 8'hc4 == io_touch_idx ? plruTree_196 : _GEN_195; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_197 = 8'hc5 == io_touch_idx ? plruTree_197 : _GEN_196; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_198 = 8'hc6 == io_touch_idx ? plruTree_198 : _GEN_197; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_199 = 8'hc7 == io_touch_idx ? plruTree_199 : _GEN_198; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_200 = 8'hc8 == io_touch_idx ? plruTree_200 : _GEN_199; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_201 = 8'hc9 == io_touch_idx ? plruTree_201 : _GEN_200; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_202 = 8'hca == io_touch_idx ? plruTree_202 : _GEN_201; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_203 = 8'hcb == io_touch_idx ? plruTree_203 : _GEN_202; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_204 = 8'hcc == io_touch_idx ? plruTree_204 : _GEN_203; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_205 = 8'hcd == io_touch_idx ? plruTree_205 : _GEN_204; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_206 = 8'hce == io_touch_idx ? plruTree_206 : _GEN_205; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_207 = 8'hcf == io_touch_idx ? plruTree_207 : _GEN_206; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_208 = 8'hd0 == io_touch_idx ? plruTree_208 : _GEN_207; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_209 = 8'hd1 == io_touch_idx ? plruTree_209 : _GEN_208; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_210 = 8'hd2 == io_touch_idx ? plruTree_210 : _GEN_209; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_211 = 8'hd3 == io_touch_idx ? plruTree_211 : _GEN_210; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_212 = 8'hd4 == io_touch_idx ? plruTree_212 : _GEN_211; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_213 = 8'hd5 == io_touch_idx ? plruTree_213 : _GEN_212; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_214 = 8'hd6 == io_touch_idx ? plruTree_214 : _GEN_213; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_215 = 8'hd7 == io_touch_idx ? plruTree_215 : _GEN_214; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_216 = 8'hd8 == io_touch_idx ? plruTree_216 : _GEN_215; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_217 = 8'hd9 == io_touch_idx ? plruTree_217 : _GEN_216; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_218 = 8'hda == io_touch_idx ? plruTree_218 : _GEN_217; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_219 = 8'hdb == io_touch_idx ? plruTree_219 : _GEN_218; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_220 = 8'hdc == io_touch_idx ? plruTree_220 : _GEN_219; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_221 = 8'hdd == io_touch_idx ? plruTree_221 : _GEN_220; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_222 = 8'hde == io_touch_idx ? plruTree_222 : _GEN_221; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_223 = 8'hdf == io_touch_idx ? plruTree_223 : _GEN_222; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_224 = 8'he0 == io_touch_idx ? plruTree_224 : _GEN_223; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_225 = 8'he1 == io_touch_idx ? plruTree_225 : _GEN_224; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_226 = 8'he2 == io_touch_idx ? plruTree_226 : _GEN_225; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_227 = 8'he3 == io_touch_idx ? plruTree_227 : _GEN_226; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_228 = 8'he4 == io_touch_idx ? plruTree_228 : _GEN_227; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_229 = 8'he5 == io_touch_idx ? plruTree_229 : _GEN_228; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_230 = 8'he6 == io_touch_idx ? plruTree_230 : _GEN_229; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_231 = 8'he7 == io_touch_idx ? plruTree_231 : _GEN_230; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_232 = 8'he8 == io_touch_idx ? plruTree_232 : _GEN_231; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_233 = 8'he9 == io_touch_idx ? plruTree_233 : _GEN_232; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_234 = 8'hea == io_touch_idx ? plruTree_234 : _GEN_233; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_235 = 8'heb == io_touch_idx ? plruTree_235 : _GEN_234; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_236 = 8'hec == io_touch_idx ? plruTree_236 : _GEN_235; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_237 = 8'hed == io_touch_idx ? plruTree_237 : _GEN_236; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_238 = 8'hee == io_touch_idx ? plruTree_238 : _GEN_237; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_239 = 8'hef == io_touch_idx ? plruTree_239 : _GEN_238; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_240 = 8'hf0 == io_touch_idx ? plruTree_240 : _GEN_239; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_241 = 8'hf1 == io_touch_idx ? plruTree_241 : _GEN_240; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_242 = 8'hf2 == io_touch_idx ? plruTree_242 : _GEN_241; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_243 = 8'hf3 == io_touch_idx ? plruTree_243 : _GEN_242; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_244 = 8'hf4 == io_touch_idx ? plruTree_244 : _GEN_243; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_245 = 8'hf5 == io_touch_idx ? plruTree_245 : _GEN_244; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_246 = 8'hf6 == io_touch_idx ? plruTree_246 : _GEN_245; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_247 = 8'hf7 == io_touch_idx ? plruTree_247 : _GEN_246; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_248 = 8'hf8 == io_touch_idx ? plruTree_248 : _GEN_247; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_249 = 8'hf9 == io_touch_idx ? plruTree_249 : _GEN_248; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_250 = 8'hfa == io_touch_idx ? plruTree_250 : _GEN_249; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_251 = 8'hfb == io_touch_idx ? plruTree_251 : _GEN_250; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_252 = 8'hfc == io_touch_idx ? plruTree_252 : _GEN_251; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_253 = 8'hfd == io_touch_idx ? plruTree_253 : _GEN_252; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_254 = 8'hfe == io_touch_idx ? plruTree_254 : _GEN_253; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _GEN_255 = 8'hff == io_touch_idx ? plruTree_255 : _GEN_254; // @[src/main/scala/icache/ICacheReplacer.scala 26:{39,39}]
  wire [2:0] _plruTree_newPLRU_T_1 = {_GEN_255[2],1'h1,1'h1}; // @[src/main/scala/icache/ICacheReplacer.scala 26:31]
  wire [2:0] _plruTree_newPLRU_T_3 = {_GEN_255[2],1'h0,1'h1}; // @[src/main/scala/icache/ICacheReplacer.scala 27:31]
  wire [2:0] _plruTree_newPLRU_T_5 = {1'h1,_GEN_255[1],1'h0}; // @[src/main/scala/icache/ICacheReplacer.scala 28:31]
  wire [2:0] _plruTree_newPLRU_T_7 = {1'h0,_GEN_255[1],1'h0}; // @[src/main/scala/icache/ICacheReplacer.scala 29:31]
  wire [2:0] _GEN_256 = 2'h3 == io_touch_way ? _plruTree_newPLRU_T_7 : 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 24:13 25:17 29:25]
  wire [2:0] _GEN_257 = 2'h2 == io_touch_way ? _plruTree_newPLRU_T_5 : _GEN_256; // @[src/main/scala/icache/ICacheReplacer.scala 25:17 28:25]
  wire [2:0] _GEN_258 = 2'h1 == io_touch_way ? _plruTree_newPLRU_T_3 : _GEN_257; // @[src/main/scala/icache/ICacheReplacer.scala 25:17 27:25]
  reg [1:0] victimRespReg; // @[src/main/scala/icache/ICacheReplacer.scala 48:30]
  wire [2:0] _GEN_773 = 8'h1 == io_victim_idx ? plruTree_1 : plruTree_0; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_774 = 8'h2 == io_victim_idx ? plruTree_2 : _GEN_773; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_775 = 8'h3 == io_victim_idx ? plruTree_3 : _GEN_774; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_776 = 8'h4 == io_victim_idx ? plruTree_4 : _GEN_775; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_777 = 8'h5 == io_victim_idx ? plruTree_5 : _GEN_776; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_778 = 8'h6 == io_victim_idx ? plruTree_6 : _GEN_777; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_779 = 8'h7 == io_victim_idx ? plruTree_7 : _GEN_778; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_780 = 8'h8 == io_victim_idx ? plruTree_8 : _GEN_779; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_781 = 8'h9 == io_victim_idx ? plruTree_9 : _GEN_780; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_782 = 8'ha == io_victim_idx ? plruTree_10 : _GEN_781; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_783 = 8'hb == io_victim_idx ? plruTree_11 : _GEN_782; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_784 = 8'hc == io_victim_idx ? plruTree_12 : _GEN_783; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_785 = 8'hd == io_victim_idx ? plruTree_13 : _GEN_784; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_786 = 8'he == io_victim_idx ? plruTree_14 : _GEN_785; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_787 = 8'hf == io_victim_idx ? plruTree_15 : _GEN_786; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_788 = 8'h10 == io_victim_idx ? plruTree_16 : _GEN_787; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_789 = 8'h11 == io_victim_idx ? plruTree_17 : _GEN_788; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_790 = 8'h12 == io_victim_idx ? plruTree_18 : _GEN_789; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_791 = 8'h13 == io_victim_idx ? plruTree_19 : _GEN_790; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_792 = 8'h14 == io_victim_idx ? plruTree_20 : _GEN_791; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_793 = 8'h15 == io_victim_idx ? plruTree_21 : _GEN_792; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_794 = 8'h16 == io_victim_idx ? plruTree_22 : _GEN_793; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_795 = 8'h17 == io_victim_idx ? plruTree_23 : _GEN_794; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_796 = 8'h18 == io_victim_idx ? plruTree_24 : _GEN_795; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_797 = 8'h19 == io_victim_idx ? plruTree_25 : _GEN_796; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_798 = 8'h1a == io_victim_idx ? plruTree_26 : _GEN_797; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_799 = 8'h1b == io_victim_idx ? plruTree_27 : _GEN_798; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_800 = 8'h1c == io_victim_idx ? plruTree_28 : _GEN_799; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_801 = 8'h1d == io_victim_idx ? plruTree_29 : _GEN_800; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_802 = 8'h1e == io_victim_idx ? plruTree_30 : _GEN_801; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_803 = 8'h1f == io_victim_idx ? plruTree_31 : _GEN_802; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_804 = 8'h20 == io_victim_idx ? plruTree_32 : _GEN_803; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_805 = 8'h21 == io_victim_idx ? plruTree_33 : _GEN_804; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_806 = 8'h22 == io_victim_idx ? plruTree_34 : _GEN_805; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_807 = 8'h23 == io_victim_idx ? plruTree_35 : _GEN_806; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_808 = 8'h24 == io_victim_idx ? plruTree_36 : _GEN_807; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_809 = 8'h25 == io_victim_idx ? plruTree_37 : _GEN_808; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_810 = 8'h26 == io_victim_idx ? plruTree_38 : _GEN_809; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_811 = 8'h27 == io_victim_idx ? plruTree_39 : _GEN_810; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_812 = 8'h28 == io_victim_idx ? plruTree_40 : _GEN_811; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_813 = 8'h29 == io_victim_idx ? plruTree_41 : _GEN_812; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_814 = 8'h2a == io_victim_idx ? plruTree_42 : _GEN_813; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_815 = 8'h2b == io_victim_idx ? plruTree_43 : _GEN_814; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_816 = 8'h2c == io_victim_idx ? plruTree_44 : _GEN_815; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_817 = 8'h2d == io_victim_idx ? plruTree_45 : _GEN_816; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_818 = 8'h2e == io_victim_idx ? plruTree_46 : _GEN_817; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_819 = 8'h2f == io_victim_idx ? plruTree_47 : _GEN_818; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_820 = 8'h30 == io_victim_idx ? plruTree_48 : _GEN_819; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_821 = 8'h31 == io_victim_idx ? plruTree_49 : _GEN_820; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_822 = 8'h32 == io_victim_idx ? plruTree_50 : _GEN_821; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_823 = 8'h33 == io_victim_idx ? plruTree_51 : _GEN_822; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_824 = 8'h34 == io_victim_idx ? plruTree_52 : _GEN_823; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_825 = 8'h35 == io_victim_idx ? plruTree_53 : _GEN_824; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_826 = 8'h36 == io_victim_idx ? plruTree_54 : _GEN_825; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_827 = 8'h37 == io_victim_idx ? plruTree_55 : _GEN_826; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_828 = 8'h38 == io_victim_idx ? plruTree_56 : _GEN_827; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_829 = 8'h39 == io_victim_idx ? plruTree_57 : _GEN_828; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_830 = 8'h3a == io_victim_idx ? plruTree_58 : _GEN_829; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_831 = 8'h3b == io_victim_idx ? plruTree_59 : _GEN_830; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_832 = 8'h3c == io_victim_idx ? plruTree_60 : _GEN_831; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_833 = 8'h3d == io_victim_idx ? plruTree_61 : _GEN_832; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_834 = 8'h3e == io_victim_idx ? plruTree_62 : _GEN_833; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_835 = 8'h3f == io_victim_idx ? plruTree_63 : _GEN_834; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_836 = 8'h40 == io_victim_idx ? plruTree_64 : _GEN_835; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_837 = 8'h41 == io_victim_idx ? plruTree_65 : _GEN_836; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_838 = 8'h42 == io_victim_idx ? plruTree_66 : _GEN_837; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_839 = 8'h43 == io_victim_idx ? plruTree_67 : _GEN_838; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_840 = 8'h44 == io_victim_idx ? plruTree_68 : _GEN_839; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_841 = 8'h45 == io_victim_idx ? plruTree_69 : _GEN_840; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_842 = 8'h46 == io_victim_idx ? plruTree_70 : _GEN_841; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_843 = 8'h47 == io_victim_idx ? plruTree_71 : _GEN_842; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_844 = 8'h48 == io_victim_idx ? plruTree_72 : _GEN_843; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_845 = 8'h49 == io_victim_idx ? plruTree_73 : _GEN_844; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_846 = 8'h4a == io_victim_idx ? plruTree_74 : _GEN_845; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_847 = 8'h4b == io_victim_idx ? plruTree_75 : _GEN_846; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_848 = 8'h4c == io_victim_idx ? plruTree_76 : _GEN_847; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_849 = 8'h4d == io_victim_idx ? plruTree_77 : _GEN_848; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_850 = 8'h4e == io_victim_idx ? plruTree_78 : _GEN_849; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_851 = 8'h4f == io_victim_idx ? plruTree_79 : _GEN_850; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_852 = 8'h50 == io_victim_idx ? plruTree_80 : _GEN_851; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_853 = 8'h51 == io_victim_idx ? plruTree_81 : _GEN_852; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_854 = 8'h52 == io_victim_idx ? plruTree_82 : _GEN_853; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_855 = 8'h53 == io_victim_idx ? plruTree_83 : _GEN_854; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_856 = 8'h54 == io_victim_idx ? plruTree_84 : _GEN_855; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_857 = 8'h55 == io_victim_idx ? plruTree_85 : _GEN_856; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_858 = 8'h56 == io_victim_idx ? plruTree_86 : _GEN_857; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_859 = 8'h57 == io_victim_idx ? plruTree_87 : _GEN_858; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_860 = 8'h58 == io_victim_idx ? plruTree_88 : _GEN_859; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_861 = 8'h59 == io_victim_idx ? plruTree_89 : _GEN_860; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_862 = 8'h5a == io_victim_idx ? plruTree_90 : _GEN_861; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_863 = 8'h5b == io_victim_idx ? plruTree_91 : _GEN_862; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_864 = 8'h5c == io_victim_idx ? plruTree_92 : _GEN_863; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_865 = 8'h5d == io_victim_idx ? plruTree_93 : _GEN_864; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_866 = 8'h5e == io_victim_idx ? plruTree_94 : _GEN_865; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_867 = 8'h5f == io_victim_idx ? plruTree_95 : _GEN_866; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_868 = 8'h60 == io_victim_idx ? plruTree_96 : _GEN_867; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_869 = 8'h61 == io_victim_idx ? plruTree_97 : _GEN_868; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_870 = 8'h62 == io_victim_idx ? plruTree_98 : _GEN_869; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_871 = 8'h63 == io_victim_idx ? plruTree_99 : _GEN_870; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_872 = 8'h64 == io_victim_idx ? plruTree_100 : _GEN_871; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_873 = 8'h65 == io_victim_idx ? plruTree_101 : _GEN_872; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_874 = 8'h66 == io_victim_idx ? plruTree_102 : _GEN_873; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_875 = 8'h67 == io_victim_idx ? plruTree_103 : _GEN_874; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_876 = 8'h68 == io_victim_idx ? plruTree_104 : _GEN_875; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_877 = 8'h69 == io_victim_idx ? plruTree_105 : _GEN_876; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_878 = 8'h6a == io_victim_idx ? plruTree_106 : _GEN_877; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_879 = 8'h6b == io_victim_idx ? plruTree_107 : _GEN_878; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_880 = 8'h6c == io_victim_idx ? plruTree_108 : _GEN_879; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_881 = 8'h6d == io_victim_idx ? plruTree_109 : _GEN_880; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_882 = 8'h6e == io_victim_idx ? plruTree_110 : _GEN_881; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_883 = 8'h6f == io_victim_idx ? plruTree_111 : _GEN_882; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_884 = 8'h70 == io_victim_idx ? plruTree_112 : _GEN_883; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_885 = 8'h71 == io_victim_idx ? plruTree_113 : _GEN_884; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_886 = 8'h72 == io_victim_idx ? plruTree_114 : _GEN_885; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_887 = 8'h73 == io_victim_idx ? plruTree_115 : _GEN_886; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_888 = 8'h74 == io_victim_idx ? plruTree_116 : _GEN_887; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_889 = 8'h75 == io_victim_idx ? plruTree_117 : _GEN_888; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_890 = 8'h76 == io_victim_idx ? plruTree_118 : _GEN_889; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_891 = 8'h77 == io_victim_idx ? plruTree_119 : _GEN_890; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_892 = 8'h78 == io_victim_idx ? plruTree_120 : _GEN_891; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_893 = 8'h79 == io_victim_idx ? plruTree_121 : _GEN_892; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_894 = 8'h7a == io_victim_idx ? plruTree_122 : _GEN_893; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_895 = 8'h7b == io_victim_idx ? plruTree_123 : _GEN_894; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_896 = 8'h7c == io_victim_idx ? plruTree_124 : _GEN_895; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_897 = 8'h7d == io_victim_idx ? plruTree_125 : _GEN_896; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_898 = 8'h7e == io_victim_idx ? plruTree_126 : _GEN_897; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_899 = 8'h7f == io_victim_idx ? plruTree_127 : _GEN_898; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_900 = 8'h80 == io_victim_idx ? plruTree_128 : _GEN_899; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_901 = 8'h81 == io_victim_idx ? plruTree_129 : _GEN_900; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_902 = 8'h82 == io_victim_idx ? plruTree_130 : _GEN_901; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_903 = 8'h83 == io_victim_idx ? plruTree_131 : _GEN_902; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_904 = 8'h84 == io_victim_idx ? plruTree_132 : _GEN_903; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_905 = 8'h85 == io_victim_idx ? plruTree_133 : _GEN_904; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_906 = 8'h86 == io_victim_idx ? plruTree_134 : _GEN_905; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_907 = 8'h87 == io_victim_idx ? plruTree_135 : _GEN_906; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_908 = 8'h88 == io_victim_idx ? plruTree_136 : _GEN_907; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_909 = 8'h89 == io_victim_idx ? plruTree_137 : _GEN_908; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_910 = 8'h8a == io_victim_idx ? plruTree_138 : _GEN_909; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_911 = 8'h8b == io_victim_idx ? plruTree_139 : _GEN_910; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_912 = 8'h8c == io_victim_idx ? plruTree_140 : _GEN_911; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_913 = 8'h8d == io_victim_idx ? plruTree_141 : _GEN_912; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_914 = 8'h8e == io_victim_idx ? plruTree_142 : _GEN_913; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_915 = 8'h8f == io_victim_idx ? plruTree_143 : _GEN_914; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_916 = 8'h90 == io_victim_idx ? plruTree_144 : _GEN_915; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_917 = 8'h91 == io_victim_idx ? plruTree_145 : _GEN_916; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_918 = 8'h92 == io_victim_idx ? plruTree_146 : _GEN_917; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_919 = 8'h93 == io_victim_idx ? plruTree_147 : _GEN_918; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_920 = 8'h94 == io_victim_idx ? plruTree_148 : _GEN_919; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_921 = 8'h95 == io_victim_idx ? plruTree_149 : _GEN_920; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_922 = 8'h96 == io_victim_idx ? plruTree_150 : _GEN_921; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_923 = 8'h97 == io_victim_idx ? plruTree_151 : _GEN_922; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_924 = 8'h98 == io_victim_idx ? plruTree_152 : _GEN_923; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_925 = 8'h99 == io_victim_idx ? plruTree_153 : _GEN_924; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_926 = 8'h9a == io_victim_idx ? plruTree_154 : _GEN_925; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_927 = 8'h9b == io_victim_idx ? plruTree_155 : _GEN_926; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_928 = 8'h9c == io_victim_idx ? plruTree_156 : _GEN_927; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_929 = 8'h9d == io_victim_idx ? plruTree_157 : _GEN_928; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_930 = 8'h9e == io_victim_idx ? plruTree_158 : _GEN_929; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_931 = 8'h9f == io_victim_idx ? plruTree_159 : _GEN_930; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_932 = 8'ha0 == io_victim_idx ? plruTree_160 : _GEN_931; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_933 = 8'ha1 == io_victim_idx ? plruTree_161 : _GEN_932; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_934 = 8'ha2 == io_victim_idx ? plruTree_162 : _GEN_933; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_935 = 8'ha3 == io_victim_idx ? plruTree_163 : _GEN_934; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_936 = 8'ha4 == io_victim_idx ? plruTree_164 : _GEN_935; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_937 = 8'ha5 == io_victim_idx ? plruTree_165 : _GEN_936; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_938 = 8'ha6 == io_victim_idx ? plruTree_166 : _GEN_937; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_939 = 8'ha7 == io_victim_idx ? plruTree_167 : _GEN_938; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_940 = 8'ha8 == io_victim_idx ? plruTree_168 : _GEN_939; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_941 = 8'ha9 == io_victim_idx ? plruTree_169 : _GEN_940; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_942 = 8'haa == io_victim_idx ? plruTree_170 : _GEN_941; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_943 = 8'hab == io_victim_idx ? plruTree_171 : _GEN_942; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_944 = 8'hac == io_victim_idx ? plruTree_172 : _GEN_943; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_945 = 8'had == io_victim_idx ? plruTree_173 : _GEN_944; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_946 = 8'hae == io_victim_idx ? plruTree_174 : _GEN_945; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_947 = 8'haf == io_victim_idx ? plruTree_175 : _GEN_946; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_948 = 8'hb0 == io_victim_idx ? plruTree_176 : _GEN_947; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_949 = 8'hb1 == io_victim_idx ? plruTree_177 : _GEN_948; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_950 = 8'hb2 == io_victim_idx ? plruTree_178 : _GEN_949; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_951 = 8'hb3 == io_victim_idx ? plruTree_179 : _GEN_950; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_952 = 8'hb4 == io_victim_idx ? plruTree_180 : _GEN_951; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_953 = 8'hb5 == io_victim_idx ? plruTree_181 : _GEN_952; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_954 = 8'hb6 == io_victim_idx ? plruTree_182 : _GEN_953; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_955 = 8'hb7 == io_victim_idx ? plruTree_183 : _GEN_954; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_956 = 8'hb8 == io_victim_idx ? plruTree_184 : _GEN_955; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_957 = 8'hb9 == io_victim_idx ? plruTree_185 : _GEN_956; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_958 = 8'hba == io_victim_idx ? plruTree_186 : _GEN_957; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_959 = 8'hbb == io_victim_idx ? plruTree_187 : _GEN_958; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_960 = 8'hbc == io_victim_idx ? plruTree_188 : _GEN_959; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_961 = 8'hbd == io_victim_idx ? plruTree_189 : _GEN_960; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_962 = 8'hbe == io_victim_idx ? plruTree_190 : _GEN_961; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_963 = 8'hbf == io_victim_idx ? plruTree_191 : _GEN_962; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_964 = 8'hc0 == io_victim_idx ? plruTree_192 : _GEN_963; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_965 = 8'hc1 == io_victim_idx ? plruTree_193 : _GEN_964; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_966 = 8'hc2 == io_victim_idx ? plruTree_194 : _GEN_965; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_967 = 8'hc3 == io_victim_idx ? plruTree_195 : _GEN_966; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_968 = 8'hc4 == io_victim_idx ? plruTree_196 : _GEN_967; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_969 = 8'hc5 == io_victim_idx ? plruTree_197 : _GEN_968; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_970 = 8'hc6 == io_victim_idx ? plruTree_198 : _GEN_969; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_971 = 8'hc7 == io_victim_idx ? plruTree_199 : _GEN_970; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_972 = 8'hc8 == io_victim_idx ? plruTree_200 : _GEN_971; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_973 = 8'hc9 == io_victim_idx ? plruTree_201 : _GEN_972; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_974 = 8'hca == io_victim_idx ? plruTree_202 : _GEN_973; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_975 = 8'hcb == io_victim_idx ? plruTree_203 : _GEN_974; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_976 = 8'hcc == io_victim_idx ? plruTree_204 : _GEN_975; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_977 = 8'hcd == io_victim_idx ? plruTree_205 : _GEN_976; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_978 = 8'hce == io_victim_idx ? plruTree_206 : _GEN_977; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_979 = 8'hcf == io_victim_idx ? plruTree_207 : _GEN_978; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_980 = 8'hd0 == io_victim_idx ? plruTree_208 : _GEN_979; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_981 = 8'hd1 == io_victim_idx ? plruTree_209 : _GEN_980; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_982 = 8'hd2 == io_victim_idx ? plruTree_210 : _GEN_981; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_983 = 8'hd3 == io_victim_idx ? plruTree_211 : _GEN_982; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_984 = 8'hd4 == io_victim_idx ? plruTree_212 : _GEN_983; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_985 = 8'hd5 == io_victim_idx ? plruTree_213 : _GEN_984; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_986 = 8'hd6 == io_victim_idx ? plruTree_214 : _GEN_985; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_987 = 8'hd7 == io_victim_idx ? plruTree_215 : _GEN_986; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_988 = 8'hd8 == io_victim_idx ? plruTree_216 : _GEN_987; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_989 = 8'hd9 == io_victim_idx ? plruTree_217 : _GEN_988; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_990 = 8'hda == io_victim_idx ? plruTree_218 : _GEN_989; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_991 = 8'hdb == io_victim_idx ? plruTree_219 : _GEN_990; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_992 = 8'hdc == io_victim_idx ? plruTree_220 : _GEN_991; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_993 = 8'hdd == io_victim_idx ? plruTree_221 : _GEN_992; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_994 = 8'hde == io_victim_idx ? plruTree_222 : _GEN_993; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_995 = 8'hdf == io_victim_idx ? plruTree_223 : _GEN_994; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_996 = 8'he0 == io_victim_idx ? plruTree_224 : _GEN_995; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_997 = 8'he1 == io_victim_idx ? plruTree_225 : _GEN_996; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_998 = 8'he2 == io_victim_idx ? plruTree_226 : _GEN_997; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_999 = 8'he3 == io_victim_idx ? plruTree_227 : _GEN_998; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1000 = 8'he4 == io_victim_idx ? plruTree_228 : _GEN_999; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1001 = 8'he5 == io_victim_idx ? plruTree_229 : _GEN_1000; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1002 = 8'he6 == io_victim_idx ? plruTree_230 : _GEN_1001; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1003 = 8'he7 == io_victim_idx ? plruTree_231 : _GEN_1002; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1004 = 8'he8 == io_victim_idx ? plruTree_232 : _GEN_1003; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1005 = 8'he9 == io_victim_idx ? plruTree_233 : _GEN_1004; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1006 = 8'hea == io_victim_idx ? plruTree_234 : _GEN_1005; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1007 = 8'heb == io_victim_idx ? plruTree_235 : _GEN_1006; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1008 = 8'hec == io_victim_idx ? plruTree_236 : _GEN_1007; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1009 = 8'hed == io_victim_idx ? plruTree_237 : _GEN_1008; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1010 = 8'hee == io_victim_idx ? plruTree_238 : _GEN_1009; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1011 = 8'hef == io_victim_idx ? plruTree_239 : _GEN_1010; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1012 = 8'hf0 == io_victim_idx ? plruTree_240 : _GEN_1011; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1013 = 8'hf1 == io_victim_idx ? plruTree_241 : _GEN_1012; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1014 = 8'hf2 == io_victim_idx ? plruTree_242 : _GEN_1013; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1015 = 8'hf3 == io_victim_idx ? plruTree_243 : _GEN_1014; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1016 = 8'hf4 == io_victim_idx ? plruTree_244 : _GEN_1015; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1017 = 8'hf5 == io_victim_idx ? plruTree_245 : _GEN_1016; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1018 = 8'hf6 == io_victim_idx ? plruTree_246 : _GEN_1017; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1019 = 8'hf7 == io_victim_idx ? plruTree_247 : _GEN_1018; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1020 = 8'hf8 == io_victim_idx ? plruTree_248 : _GEN_1019; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1021 = 8'hf9 == io_victim_idx ? plruTree_249 : _GEN_1020; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1022 = 8'hfa == io_victim_idx ? plruTree_250 : _GEN_1021; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1023 = 8'hfb == io_victim_idx ? plruTree_251 : _GEN_1022; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1024 = 8'hfc == io_victim_idx ? plruTree_252 : _GEN_1023; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1025 = 8'hfd == io_victim_idx ? plruTree_253 : _GEN_1024; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1026 = 8'hfe == io_victim_idx ? plruTree_254 : _GEN_1025; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire [2:0] _GEN_1027 = 8'hff == io_victim_idx ? plruTree_255 : _GEN_1026; // @[src/main/scala/icache/ICacheReplacer.scala 36:{21,21}]
  wire  victimRespReg_plru0 = _GEN_1027[0]; // @[src/main/scala/icache/ICacheReplacer.scala 36:21]
  wire  victimRespReg_plru1 = _GEN_1027[1]; // @[src/main/scala/icache/ICacheReplacer.scala 37:21]
  wire  victimRespReg_plru2 = _GEN_1027[2]; // @[src/main/scala/icache/ICacheReplacer.scala 38:21]
  wire  _victimRespReg_T_2 = ~victimRespReg_plru1 ? 1'h0 : 1'h1; // @[src/main/scala/icache/ICacheReplacer.scala 39:20]
  assign io_victim_resp = victimRespReg; // @[src/main/scala/icache/ICacheReplacer.scala 52:18]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_0 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h0 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_0 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_0 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_1 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h1 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_1 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_1 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_2 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h2 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_2 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_2 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_3 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h3 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_3 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_3 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_4 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h4 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_4 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_4 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_5 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h5 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_5 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_5 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_6 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h6 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_6 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_6 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_7 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h7 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_7 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_7 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_8 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h8 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_8 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_8 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_9 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h9 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_9 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_9 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_10 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_10 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_10 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_11 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_11 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_11 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_12 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_12 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_12 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_13 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_13 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_13 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_14 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_14 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_14 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_15 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_15 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_15 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_16 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h10 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_16 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_16 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_17 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h11 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_17 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_17 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_18 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h12 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_18 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_18 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_19 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h13 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_19 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_19 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_20 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h14 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_20 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_20 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_21 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h15 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_21 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_21 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_22 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h16 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_22 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_22 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_23 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h17 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_23 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_23 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_24 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h18 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_24 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_24 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_25 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h19 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_25 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_25 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_26 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h1a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_26 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_26 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_27 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h1b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_27 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_27 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_28 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h1c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_28 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_28 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_29 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h1d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_29 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_29 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_30 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h1e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_30 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_30 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_31 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h1f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_31 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_31 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_32 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h20 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_32 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_32 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_33 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h21 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_33 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_33 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_34 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h22 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_34 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_34 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_35 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h23 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_35 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_35 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_36 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h24 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_36 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_36 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_37 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h25 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_37 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_37 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_38 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h26 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_38 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_38 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_39 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h27 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_39 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_39 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_40 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h28 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_40 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_40 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_41 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h29 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_41 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_41 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_42 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h2a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_42 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_42 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_43 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h2b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_43 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_43 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_44 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h2c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_44 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_44 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_45 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h2d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_45 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_45 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_46 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h2e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_46 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_46 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_47 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h2f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_47 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_47 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_48 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h30 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_48 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_48 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_49 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h31 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_49 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_49 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_50 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h32 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_50 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_50 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_51 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h33 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_51 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_51 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_52 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h34 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_52 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_52 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_53 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h35 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_53 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_53 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_54 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h36 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_54 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_54 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_55 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h37 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_55 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_55 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_56 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h38 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_56 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_56 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_57 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h39 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_57 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_57 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_58 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h3a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_58 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_58 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_59 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h3b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_59 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_59 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_60 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h3c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_60 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_60 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_61 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h3d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_61 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_61 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_62 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h3e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_62 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_62 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_63 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h3f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_63 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_63 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_64 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h40 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_64 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_64 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_65 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h41 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_65 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_65 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_66 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h42 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_66 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_66 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_67 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h43 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_67 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_67 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_68 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h44 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_68 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_68 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_69 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h45 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_69 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_69 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_70 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h46 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_70 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_70 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_71 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h47 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_71 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_71 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_72 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h48 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_72 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_72 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_73 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h49 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_73 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_73 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_74 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h4a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_74 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_74 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_75 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h4b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_75 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_75 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_76 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h4c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_76 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_76 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_77 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h4d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_77 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_77 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_78 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h4e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_78 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_78 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_79 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h4f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_79 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_79 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_80 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h50 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_80 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_80 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_81 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h51 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_81 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_81 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_82 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h52 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_82 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_82 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_83 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h53 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_83 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_83 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_84 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h54 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_84 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_84 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_85 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h55 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_85 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_85 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_86 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h56 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_86 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_86 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_87 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h57 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_87 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_87 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_88 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h58 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_88 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_88 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_89 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h59 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_89 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_89 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_90 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h5a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_90 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_90 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_91 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h5b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_91 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_91 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_92 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h5c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_92 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_92 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_93 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h5d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_93 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_93 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_94 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h5e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_94 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_94 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_95 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h5f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_95 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_95 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_96 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h60 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_96 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_96 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_97 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h61 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_97 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_97 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_98 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h62 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_98 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_98 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_99 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h63 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_99 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_99 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_100 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h64 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_100 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_100 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_101 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h65 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_101 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_101 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_102 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h66 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_102 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_102 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_103 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h67 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_103 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_103 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_104 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h68 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_104 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_104 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_105 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h69 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_105 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_105 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_106 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h6a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_106 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_106 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_107 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h6b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_107 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_107 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_108 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h6c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_108 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_108 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_109 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h6d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_109 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_109 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_110 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h6e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_110 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_110 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_111 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h6f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_111 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_111 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_112 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h70 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_112 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_112 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_113 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h71 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_113 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_113 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_114 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h72 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_114 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_114 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_115 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h73 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_115 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_115 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_116 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h74 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_116 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_116 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_117 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h75 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_117 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_117 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_118 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h76 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_118 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_118 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_119 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h77 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_119 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_119 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_120 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h78 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_120 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_120 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_121 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h79 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_121 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_121 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_122 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h7a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_122 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_122 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_123 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h7b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_123 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_123 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_124 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h7c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_124 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_124 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_125 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h7d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_125 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_125 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_126 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h7e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_126 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_126 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_127 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h7f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_127 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_127 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_128 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h80 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_128 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_128 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_129 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h81 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_129 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_129 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_130 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h82 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_130 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_130 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_131 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h83 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_131 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_131 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_132 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h84 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_132 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_132 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_133 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h85 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_133 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_133 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_134 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h86 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_134 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_134 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_135 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h87 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_135 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_135 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_136 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h88 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_136 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_136 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_137 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h89 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_137 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_137 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_138 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h8a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_138 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_138 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_139 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h8b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_139 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_139 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_140 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h8c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_140 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_140 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_141 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h8d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_141 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_141 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_142 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h8e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_142 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_142 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_143 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h8f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_143 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_143 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_144 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h90 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_144 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_144 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_145 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h91 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_145 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_145 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_146 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h92 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_146 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_146 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_147 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h93 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_147 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_147 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_148 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h94 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_148 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_148 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_149 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h95 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_149 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_149 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_150 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h96 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_150 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_150 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_151 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h97 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_151 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_151 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_152 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h98 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_152 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_152 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_153 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h99 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_153 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_153 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_154 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h9a == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_154 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_154 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_155 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h9b == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_155 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_155 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_156 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h9c == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_156 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_156 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_157 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h9d == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_157 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_157 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_158 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h9e == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_158 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_158 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_159 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'h9f == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_159 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_159 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_160 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha0 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_160 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_160 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_161 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha1 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_161 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_161 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_162 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha2 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_162 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_162 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_163 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha3 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_163 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_163 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_164 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha4 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_164 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_164 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_165 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha5 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_165 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_165 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_166 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha6 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_166 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_166 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_167 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha7 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_167 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_167 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_168 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha8 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_168 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_168 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_169 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'ha9 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_169 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_169 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_170 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'haa == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_170 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_170 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_171 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hab == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_171 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_171 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_172 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hac == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_172 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_172 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_173 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'had == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_173 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_173 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_174 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hae == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_174 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_174 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_175 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'haf == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_175 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_175 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_176 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb0 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_176 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_176 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_177 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb1 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_177 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_177 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_178 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb2 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_178 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_178 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_179 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb3 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_179 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_179 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_180 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb4 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_180 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_180 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_181 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb5 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_181 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_181 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_182 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb6 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_182 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_182 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_183 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb7 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_183 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_183 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_184 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb8 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_184 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_184 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_185 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hb9 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_185 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_185 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_186 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hba == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_186 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_186 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_187 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hbb == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_187 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_187 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_188 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hbc == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_188 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_188 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_189 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hbd == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_189 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_189 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_190 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hbe == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_190 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_190 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_191 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hbf == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_191 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_191 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_192 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc0 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_192 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_192 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_193 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc1 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_193 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_193 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_194 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc2 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_194 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_194 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_195 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc3 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_195 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_195 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_196 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc4 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_196 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_196 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_197 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc5 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_197 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_197 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_198 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc6 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_198 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_198 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_199 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc7 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_199 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_199 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_200 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc8 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_200 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_200 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_201 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hc9 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_201 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_201 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_202 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hca == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_202 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_202 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_203 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hcb == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_203 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_203 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_204 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hcc == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_204 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_204 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_205 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hcd == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_205 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_205 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_206 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hce == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_206 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_206 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_207 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hcf == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_207 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_207 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_208 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd0 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_208 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_208 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_209 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd1 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_209 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_209 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_210 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd2 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_210 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_210 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_211 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd3 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_211 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_211 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_212 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd4 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_212 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_212 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_213 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd5 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_213 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_213 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_214 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd6 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_214 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_214 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_215 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd7 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_215 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_215 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_216 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd8 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_216 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_216 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_217 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hd9 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_217 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_217 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_218 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hda == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_218 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_218 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_219 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hdb == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_219 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_219 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_220 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hdc == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_220 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_220 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_221 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hdd == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_221 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_221 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_222 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hde == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_222 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_222 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_223 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hdf == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_223 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_223 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_224 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he0 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_224 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_224 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_225 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he1 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_225 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_225 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_226 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he2 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_226 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_226 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_227 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he3 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_227 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_227 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_228 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he4 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_228 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_228 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_229 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he5 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_229 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_229 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_230 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he6 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_230 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_230 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_231 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he7 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_231 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_231 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_232 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he8 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_232 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_232 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_233 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'he9 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_233 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_233 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_234 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hea == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_234 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_234 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_235 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'heb == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_235 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_235 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_236 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hec == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_236 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_236 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_237 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hed == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_237 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_237 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_238 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hee == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_238 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_238 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_239 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hef == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_239 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_239 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_240 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf0 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_240 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_240 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_241 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf1 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_241 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_241 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_242 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf2 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_242 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_242 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_243 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf3 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_243 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_243 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_244 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf4 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_244 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_244 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_245 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf5 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_245 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_245 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_246 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf6 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_246 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_246 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_247 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf7 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_247 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_247 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_248 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf8 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_248 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_248 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_249 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hf9 == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_249 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_249 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_250 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hfa == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_250 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_250 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_251 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hfb == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_251 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_251 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_252 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hfc == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_252 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_252 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_253 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hfd == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_253 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_253 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_254 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hfe == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_254 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_254 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
      plruTree_255 <= 3'h0; // @[src/main/scala/icache/ICacheReplacer.scala 19:25]
    end else if (io_touch_valid) begin // @[src/main/scala/icache/ICacheReplacer.scala 43:24]
      if (8'hff == io_touch_idx) begin // @[src/main/scala/icache/ICacheReplacer.scala 44:28]
        if (2'h0 == io_touch_way) begin // @[src/main/scala/icache/ICacheReplacer.scala 25:17]
          plruTree_255 <= _plruTree_newPLRU_T_1; // @[src/main/scala/icache/ICacheReplacer.scala 26:25]
        end else begin
          plruTree_255 <= _GEN_258;
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache/ICacheReplacer.scala 48:30]
      victimRespReg <= 2'h0; // @[src/main/scala/icache/ICacheReplacer.scala 48:30]
    end else if (io_victim_req) begin // @[src/main/scala/icache/ICacheReplacer.scala 49:23]
      if (~victimRespReg_plru0) begin // @[src/main/scala/icache/ICacheReplacer.scala 39:8]
        victimRespReg <= {{1'd0}, _victimRespReg_T_2};
      end else if (~victimRespReg_plru2) begin // @[src/main/scala/icache/ICacheReplacer.scala 39:43]
        victimRespReg <= 2'h2;
      end else begin
        victimRespReg <= 2'h3;
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
  plruTree_0 = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  plruTree_1 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  plruTree_2 = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  plruTree_3 = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  plruTree_4 = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  plruTree_5 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  plruTree_6 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  plruTree_7 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  plruTree_8 = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  plruTree_9 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  plruTree_10 = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  plruTree_11 = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  plruTree_12 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  plruTree_13 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  plruTree_14 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  plruTree_15 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  plruTree_16 = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  plruTree_17 = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  plruTree_18 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  plruTree_19 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  plruTree_20 = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  plruTree_21 = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  plruTree_22 = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  plruTree_23 = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  plruTree_24 = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  plruTree_25 = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  plruTree_26 = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  plruTree_27 = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  plruTree_28 = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  plruTree_29 = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  plruTree_30 = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  plruTree_31 = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  plruTree_32 = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  plruTree_33 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  plruTree_34 = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  plruTree_35 = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  plruTree_36 = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  plruTree_37 = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  plruTree_38 = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  plruTree_39 = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  plruTree_40 = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  plruTree_41 = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  plruTree_42 = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  plruTree_43 = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  plruTree_44 = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  plruTree_45 = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  plruTree_46 = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  plruTree_47 = _RAND_47[2:0];
  _RAND_48 = {1{`RANDOM}};
  plruTree_48 = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  plruTree_49 = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  plruTree_50 = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  plruTree_51 = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  plruTree_52 = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  plruTree_53 = _RAND_53[2:0];
  _RAND_54 = {1{`RANDOM}};
  plruTree_54 = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  plruTree_55 = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  plruTree_56 = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  plruTree_57 = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  plruTree_58 = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  plruTree_59 = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  plruTree_60 = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  plruTree_61 = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  plruTree_62 = _RAND_62[2:0];
  _RAND_63 = {1{`RANDOM}};
  plruTree_63 = _RAND_63[2:0];
  _RAND_64 = {1{`RANDOM}};
  plruTree_64 = _RAND_64[2:0];
  _RAND_65 = {1{`RANDOM}};
  plruTree_65 = _RAND_65[2:0];
  _RAND_66 = {1{`RANDOM}};
  plruTree_66 = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  plruTree_67 = _RAND_67[2:0];
  _RAND_68 = {1{`RANDOM}};
  plruTree_68 = _RAND_68[2:0];
  _RAND_69 = {1{`RANDOM}};
  plruTree_69 = _RAND_69[2:0];
  _RAND_70 = {1{`RANDOM}};
  plruTree_70 = _RAND_70[2:0];
  _RAND_71 = {1{`RANDOM}};
  plruTree_71 = _RAND_71[2:0];
  _RAND_72 = {1{`RANDOM}};
  plruTree_72 = _RAND_72[2:0];
  _RAND_73 = {1{`RANDOM}};
  plruTree_73 = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  plruTree_74 = _RAND_74[2:0];
  _RAND_75 = {1{`RANDOM}};
  plruTree_75 = _RAND_75[2:0];
  _RAND_76 = {1{`RANDOM}};
  plruTree_76 = _RAND_76[2:0];
  _RAND_77 = {1{`RANDOM}};
  plruTree_77 = _RAND_77[2:0];
  _RAND_78 = {1{`RANDOM}};
  plruTree_78 = _RAND_78[2:0];
  _RAND_79 = {1{`RANDOM}};
  plruTree_79 = _RAND_79[2:0];
  _RAND_80 = {1{`RANDOM}};
  plruTree_80 = _RAND_80[2:0];
  _RAND_81 = {1{`RANDOM}};
  plruTree_81 = _RAND_81[2:0];
  _RAND_82 = {1{`RANDOM}};
  plruTree_82 = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  plruTree_83 = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  plruTree_84 = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  plruTree_85 = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  plruTree_86 = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  plruTree_87 = _RAND_87[2:0];
  _RAND_88 = {1{`RANDOM}};
  plruTree_88 = _RAND_88[2:0];
  _RAND_89 = {1{`RANDOM}};
  plruTree_89 = _RAND_89[2:0];
  _RAND_90 = {1{`RANDOM}};
  plruTree_90 = _RAND_90[2:0];
  _RAND_91 = {1{`RANDOM}};
  plruTree_91 = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  plruTree_92 = _RAND_92[2:0];
  _RAND_93 = {1{`RANDOM}};
  plruTree_93 = _RAND_93[2:0];
  _RAND_94 = {1{`RANDOM}};
  plruTree_94 = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  plruTree_95 = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  plruTree_96 = _RAND_96[2:0];
  _RAND_97 = {1{`RANDOM}};
  plruTree_97 = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  plruTree_98 = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  plruTree_99 = _RAND_99[2:0];
  _RAND_100 = {1{`RANDOM}};
  plruTree_100 = _RAND_100[2:0];
  _RAND_101 = {1{`RANDOM}};
  plruTree_101 = _RAND_101[2:0];
  _RAND_102 = {1{`RANDOM}};
  plruTree_102 = _RAND_102[2:0];
  _RAND_103 = {1{`RANDOM}};
  plruTree_103 = _RAND_103[2:0];
  _RAND_104 = {1{`RANDOM}};
  plruTree_104 = _RAND_104[2:0];
  _RAND_105 = {1{`RANDOM}};
  plruTree_105 = _RAND_105[2:0];
  _RAND_106 = {1{`RANDOM}};
  plruTree_106 = _RAND_106[2:0];
  _RAND_107 = {1{`RANDOM}};
  plruTree_107 = _RAND_107[2:0];
  _RAND_108 = {1{`RANDOM}};
  plruTree_108 = _RAND_108[2:0];
  _RAND_109 = {1{`RANDOM}};
  plruTree_109 = _RAND_109[2:0];
  _RAND_110 = {1{`RANDOM}};
  plruTree_110 = _RAND_110[2:0];
  _RAND_111 = {1{`RANDOM}};
  plruTree_111 = _RAND_111[2:0];
  _RAND_112 = {1{`RANDOM}};
  plruTree_112 = _RAND_112[2:0];
  _RAND_113 = {1{`RANDOM}};
  plruTree_113 = _RAND_113[2:0];
  _RAND_114 = {1{`RANDOM}};
  plruTree_114 = _RAND_114[2:0];
  _RAND_115 = {1{`RANDOM}};
  plruTree_115 = _RAND_115[2:0];
  _RAND_116 = {1{`RANDOM}};
  plruTree_116 = _RAND_116[2:0];
  _RAND_117 = {1{`RANDOM}};
  plruTree_117 = _RAND_117[2:0];
  _RAND_118 = {1{`RANDOM}};
  plruTree_118 = _RAND_118[2:0];
  _RAND_119 = {1{`RANDOM}};
  plruTree_119 = _RAND_119[2:0];
  _RAND_120 = {1{`RANDOM}};
  plruTree_120 = _RAND_120[2:0];
  _RAND_121 = {1{`RANDOM}};
  plruTree_121 = _RAND_121[2:0];
  _RAND_122 = {1{`RANDOM}};
  plruTree_122 = _RAND_122[2:0];
  _RAND_123 = {1{`RANDOM}};
  plruTree_123 = _RAND_123[2:0];
  _RAND_124 = {1{`RANDOM}};
  plruTree_124 = _RAND_124[2:0];
  _RAND_125 = {1{`RANDOM}};
  plruTree_125 = _RAND_125[2:0];
  _RAND_126 = {1{`RANDOM}};
  plruTree_126 = _RAND_126[2:0];
  _RAND_127 = {1{`RANDOM}};
  plruTree_127 = _RAND_127[2:0];
  _RAND_128 = {1{`RANDOM}};
  plruTree_128 = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  plruTree_129 = _RAND_129[2:0];
  _RAND_130 = {1{`RANDOM}};
  plruTree_130 = _RAND_130[2:0];
  _RAND_131 = {1{`RANDOM}};
  plruTree_131 = _RAND_131[2:0];
  _RAND_132 = {1{`RANDOM}};
  plruTree_132 = _RAND_132[2:0];
  _RAND_133 = {1{`RANDOM}};
  plruTree_133 = _RAND_133[2:0];
  _RAND_134 = {1{`RANDOM}};
  plruTree_134 = _RAND_134[2:0];
  _RAND_135 = {1{`RANDOM}};
  plruTree_135 = _RAND_135[2:0];
  _RAND_136 = {1{`RANDOM}};
  plruTree_136 = _RAND_136[2:0];
  _RAND_137 = {1{`RANDOM}};
  plruTree_137 = _RAND_137[2:0];
  _RAND_138 = {1{`RANDOM}};
  plruTree_138 = _RAND_138[2:0];
  _RAND_139 = {1{`RANDOM}};
  plruTree_139 = _RAND_139[2:0];
  _RAND_140 = {1{`RANDOM}};
  plruTree_140 = _RAND_140[2:0];
  _RAND_141 = {1{`RANDOM}};
  plruTree_141 = _RAND_141[2:0];
  _RAND_142 = {1{`RANDOM}};
  plruTree_142 = _RAND_142[2:0];
  _RAND_143 = {1{`RANDOM}};
  plruTree_143 = _RAND_143[2:0];
  _RAND_144 = {1{`RANDOM}};
  plruTree_144 = _RAND_144[2:0];
  _RAND_145 = {1{`RANDOM}};
  plruTree_145 = _RAND_145[2:0];
  _RAND_146 = {1{`RANDOM}};
  plruTree_146 = _RAND_146[2:0];
  _RAND_147 = {1{`RANDOM}};
  plruTree_147 = _RAND_147[2:0];
  _RAND_148 = {1{`RANDOM}};
  plruTree_148 = _RAND_148[2:0];
  _RAND_149 = {1{`RANDOM}};
  plruTree_149 = _RAND_149[2:0];
  _RAND_150 = {1{`RANDOM}};
  plruTree_150 = _RAND_150[2:0];
  _RAND_151 = {1{`RANDOM}};
  plruTree_151 = _RAND_151[2:0];
  _RAND_152 = {1{`RANDOM}};
  plruTree_152 = _RAND_152[2:0];
  _RAND_153 = {1{`RANDOM}};
  plruTree_153 = _RAND_153[2:0];
  _RAND_154 = {1{`RANDOM}};
  plruTree_154 = _RAND_154[2:0];
  _RAND_155 = {1{`RANDOM}};
  plruTree_155 = _RAND_155[2:0];
  _RAND_156 = {1{`RANDOM}};
  plruTree_156 = _RAND_156[2:0];
  _RAND_157 = {1{`RANDOM}};
  plruTree_157 = _RAND_157[2:0];
  _RAND_158 = {1{`RANDOM}};
  plruTree_158 = _RAND_158[2:0];
  _RAND_159 = {1{`RANDOM}};
  plruTree_159 = _RAND_159[2:0];
  _RAND_160 = {1{`RANDOM}};
  plruTree_160 = _RAND_160[2:0];
  _RAND_161 = {1{`RANDOM}};
  plruTree_161 = _RAND_161[2:0];
  _RAND_162 = {1{`RANDOM}};
  plruTree_162 = _RAND_162[2:0];
  _RAND_163 = {1{`RANDOM}};
  plruTree_163 = _RAND_163[2:0];
  _RAND_164 = {1{`RANDOM}};
  plruTree_164 = _RAND_164[2:0];
  _RAND_165 = {1{`RANDOM}};
  plruTree_165 = _RAND_165[2:0];
  _RAND_166 = {1{`RANDOM}};
  plruTree_166 = _RAND_166[2:0];
  _RAND_167 = {1{`RANDOM}};
  plruTree_167 = _RAND_167[2:0];
  _RAND_168 = {1{`RANDOM}};
  plruTree_168 = _RAND_168[2:0];
  _RAND_169 = {1{`RANDOM}};
  plruTree_169 = _RAND_169[2:0];
  _RAND_170 = {1{`RANDOM}};
  plruTree_170 = _RAND_170[2:0];
  _RAND_171 = {1{`RANDOM}};
  plruTree_171 = _RAND_171[2:0];
  _RAND_172 = {1{`RANDOM}};
  plruTree_172 = _RAND_172[2:0];
  _RAND_173 = {1{`RANDOM}};
  plruTree_173 = _RAND_173[2:0];
  _RAND_174 = {1{`RANDOM}};
  plruTree_174 = _RAND_174[2:0];
  _RAND_175 = {1{`RANDOM}};
  plruTree_175 = _RAND_175[2:0];
  _RAND_176 = {1{`RANDOM}};
  plruTree_176 = _RAND_176[2:0];
  _RAND_177 = {1{`RANDOM}};
  plruTree_177 = _RAND_177[2:0];
  _RAND_178 = {1{`RANDOM}};
  plruTree_178 = _RAND_178[2:0];
  _RAND_179 = {1{`RANDOM}};
  plruTree_179 = _RAND_179[2:0];
  _RAND_180 = {1{`RANDOM}};
  plruTree_180 = _RAND_180[2:0];
  _RAND_181 = {1{`RANDOM}};
  plruTree_181 = _RAND_181[2:0];
  _RAND_182 = {1{`RANDOM}};
  plruTree_182 = _RAND_182[2:0];
  _RAND_183 = {1{`RANDOM}};
  plruTree_183 = _RAND_183[2:0];
  _RAND_184 = {1{`RANDOM}};
  plruTree_184 = _RAND_184[2:0];
  _RAND_185 = {1{`RANDOM}};
  plruTree_185 = _RAND_185[2:0];
  _RAND_186 = {1{`RANDOM}};
  plruTree_186 = _RAND_186[2:0];
  _RAND_187 = {1{`RANDOM}};
  plruTree_187 = _RAND_187[2:0];
  _RAND_188 = {1{`RANDOM}};
  plruTree_188 = _RAND_188[2:0];
  _RAND_189 = {1{`RANDOM}};
  plruTree_189 = _RAND_189[2:0];
  _RAND_190 = {1{`RANDOM}};
  plruTree_190 = _RAND_190[2:0];
  _RAND_191 = {1{`RANDOM}};
  plruTree_191 = _RAND_191[2:0];
  _RAND_192 = {1{`RANDOM}};
  plruTree_192 = _RAND_192[2:0];
  _RAND_193 = {1{`RANDOM}};
  plruTree_193 = _RAND_193[2:0];
  _RAND_194 = {1{`RANDOM}};
  plruTree_194 = _RAND_194[2:0];
  _RAND_195 = {1{`RANDOM}};
  plruTree_195 = _RAND_195[2:0];
  _RAND_196 = {1{`RANDOM}};
  plruTree_196 = _RAND_196[2:0];
  _RAND_197 = {1{`RANDOM}};
  plruTree_197 = _RAND_197[2:0];
  _RAND_198 = {1{`RANDOM}};
  plruTree_198 = _RAND_198[2:0];
  _RAND_199 = {1{`RANDOM}};
  plruTree_199 = _RAND_199[2:0];
  _RAND_200 = {1{`RANDOM}};
  plruTree_200 = _RAND_200[2:0];
  _RAND_201 = {1{`RANDOM}};
  plruTree_201 = _RAND_201[2:0];
  _RAND_202 = {1{`RANDOM}};
  plruTree_202 = _RAND_202[2:0];
  _RAND_203 = {1{`RANDOM}};
  plruTree_203 = _RAND_203[2:0];
  _RAND_204 = {1{`RANDOM}};
  plruTree_204 = _RAND_204[2:0];
  _RAND_205 = {1{`RANDOM}};
  plruTree_205 = _RAND_205[2:0];
  _RAND_206 = {1{`RANDOM}};
  plruTree_206 = _RAND_206[2:0];
  _RAND_207 = {1{`RANDOM}};
  plruTree_207 = _RAND_207[2:0];
  _RAND_208 = {1{`RANDOM}};
  plruTree_208 = _RAND_208[2:0];
  _RAND_209 = {1{`RANDOM}};
  plruTree_209 = _RAND_209[2:0];
  _RAND_210 = {1{`RANDOM}};
  plruTree_210 = _RAND_210[2:0];
  _RAND_211 = {1{`RANDOM}};
  plruTree_211 = _RAND_211[2:0];
  _RAND_212 = {1{`RANDOM}};
  plruTree_212 = _RAND_212[2:0];
  _RAND_213 = {1{`RANDOM}};
  plruTree_213 = _RAND_213[2:0];
  _RAND_214 = {1{`RANDOM}};
  plruTree_214 = _RAND_214[2:0];
  _RAND_215 = {1{`RANDOM}};
  plruTree_215 = _RAND_215[2:0];
  _RAND_216 = {1{`RANDOM}};
  plruTree_216 = _RAND_216[2:0];
  _RAND_217 = {1{`RANDOM}};
  plruTree_217 = _RAND_217[2:0];
  _RAND_218 = {1{`RANDOM}};
  plruTree_218 = _RAND_218[2:0];
  _RAND_219 = {1{`RANDOM}};
  plruTree_219 = _RAND_219[2:0];
  _RAND_220 = {1{`RANDOM}};
  plruTree_220 = _RAND_220[2:0];
  _RAND_221 = {1{`RANDOM}};
  plruTree_221 = _RAND_221[2:0];
  _RAND_222 = {1{`RANDOM}};
  plruTree_222 = _RAND_222[2:0];
  _RAND_223 = {1{`RANDOM}};
  plruTree_223 = _RAND_223[2:0];
  _RAND_224 = {1{`RANDOM}};
  plruTree_224 = _RAND_224[2:0];
  _RAND_225 = {1{`RANDOM}};
  plruTree_225 = _RAND_225[2:0];
  _RAND_226 = {1{`RANDOM}};
  plruTree_226 = _RAND_226[2:0];
  _RAND_227 = {1{`RANDOM}};
  plruTree_227 = _RAND_227[2:0];
  _RAND_228 = {1{`RANDOM}};
  plruTree_228 = _RAND_228[2:0];
  _RAND_229 = {1{`RANDOM}};
  plruTree_229 = _RAND_229[2:0];
  _RAND_230 = {1{`RANDOM}};
  plruTree_230 = _RAND_230[2:0];
  _RAND_231 = {1{`RANDOM}};
  plruTree_231 = _RAND_231[2:0];
  _RAND_232 = {1{`RANDOM}};
  plruTree_232 = _RAND_232[2:0];
  _RAND_233 = {1{`RANDOM}};
  plruTree_233 = _RAND_233[2:0];
  _RAND_234 = {1{`RANDOM}};
  plruTree_234 = _RAND_234[2:0];
  _RAND_235 = {1{`RANDOM}};
  plruTree_235 = _RAND_235[2:0];
  _RAND_236 = {1{`RANDOM}};
  plruTree_236 = _RAND_236[2:0];
  _RAND_237 = {1{`RANDOM}};
  plruTree_237 = _RAND_237[2:0];
  _RAND_238 = {1{`RANDOM}};
  plruTree_238 = _RAND_238[2:0];
  _RAND_239 = {1{`RANDOM}};
  plruTree_239 = _RAND_239[2:0];
  _RAND_240 = {1{`RANDOM}};
  plruTree_240 = _RAND_240[2:0];
  _RAND_241 = {1{`RANDOM}};
  plruTree_241 = _RAND_241[2:0];
  _RAND_242 = {1{`RANDOM}};
  plruTree_242 = _RAND_242[2:0];
  _RAND_243 = {1{`RANDOM}};
  plruTree_243 = _RAND_243[2:0];
  _RAND_244 = {1{`RANDOM}};
  plruTree_244 = _RAND_244[2:0];
  _RAND_245 = {1{`RANDOM}};
  plruTree_245 = _RAND_245[2:0];
  _RAND_246 = {1{`RANDOM}};
  plruTree_246 = _RAND_246[2:0];
  _RAND_247 = {1{`RANDOM}};
  plruTree_247 = _RAND_247[2:0];
  _RAND_248 = {1{`RANDOM}};
  plruTree_248 = _RAND_248[2:0];
  _RAND_249 = {1{`RANDOM}};
  plruTree_249 = _RAND_249[2:0];
  _RAND_250 = {1{`RANDOM}};
  plruTree_250 = _RAND_250[2:0];
  _RAND_251 = {1{`RANDOM}};
  plruTree_251 = _RAND_251[2:0];
  _RAND_252 = {1{`RANDOM}};
  plruTree_252 = _RAND_252[2:0];
  _RAND_253 = {1{`RANDOM}};
  plruTree_253 = _RAND_253[2:0];
  _RAND_254 = {1{`RANDOM}};
  plruTree_254 = _RAND_254[2:0];
  _RAND_255 = {1{`RANDOM}};
  plruTree_255 = _RAND_255[2:0];
  _RAND_256 = {1{`RANDOM}};
  victimRespReg = _RAND_256[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
