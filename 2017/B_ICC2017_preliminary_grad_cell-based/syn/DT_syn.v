/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Mar 31 21:25:00 2025
/////////////////////////////////////////////////////////////


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, C1_Z_6, C1_Z_5, C1_Z_4, C1_Z_3, C1_Z_2, C1_Z_1, C1_Z_0,
         DP_OP_17J1_122_7031_n6, DP_OP_17J1_122_7031_n5,
         DP_OP_17J1_122_7031_n4, DP_OP_17J1_122_7031_n3,
         DP_OP_17J1_122_7031_n2, DP_OP_17J1_122_7031_n1, n433, n436, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n988, n989,
         n990, n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000,
         n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010,
         n1011;
  wire   [13:0] index;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   [7:0] c;
  wire   [6:0] d;
  wire   [6:1] forwardresult;
  wire   [7:0] e;
  wire   [2:0] cur_state;
  wire   [2:0] nxt_state;
  wire   [2:0] counter;
  wire   [7:0] e_reg;

  DFFRX1 counter_reg_0_ ( .D(n424), .CK(clk), .RN(n1011), .Q(counter[0]), .QN(
        n957) );
  DFFRX1 counter_reg_2_ ( .D(n423), .CK(clk), .RN(n1011), .Q(counter[2]), .QN(
        n955) );
  DFFRX1 e_reg_7_ ( .D(n360), .CK(clk), .RN(n1011), .Q(e[7]), .QN(n962) );
  DFFRX1 cur_state_reg_0_ ( .D(nxt_state[0]), .CK(clk), .RN(n1011), .Q(
        cur_state[0]), .QN(n958) );
  DFFRX1 cur_state_reg_1_ ( .D(nxt_state[1]), .CK(clk), .RN(n1011), .Q(
        cur_state[1]), .QN(n940) );
  DFFRX1 index_reg_13_ ( .D(n407), .CK(clk), .RN(n1011), .Q(index[13]), .QN(
        n952) );
  DFFRX1 cur_state_reg_2_ ( .D(nxt_state[2]), .CK(clk), .RN(n1011), .Q(
        cur_state[2]), .QN(n954) );
  DFFRX1 index_reg_4_ ( .D(n416), .CK(clk), .RN(n1010), .Q(index[4]), .QN(n980) );
  DFFRX1 index_reg_5_ ( .D(n415), .CK(clk), .RN(n1010), .Q(index[5]), .QN(n987) );
  DFFRX1 index_reg_6_ ( .D(n414), .CK(clk), .RN(n1010), .Q(index[6]), .QN(n981) );
  DFFRX1 index_reg_7_ ( .D(n413), .CK(clk), .RN(n1010), .Q(index[7]), .QN(n983) );
  DFFRX1 index_reg_8_ ( .D(n412), .CK(clk), .RN(n1010), .Q(index[8]), .QN(n985) );
  DFFRX1 index_reg_10_ ( .D(n410), .CK(clk), .RN(n1010), .Q(index[10]), .QN(
        n1001) );
  DFFRX1 index_reg_11_ ( .D(n409), .CK(clk), .RN(n1010), .Q(index[11]), .QN(
        n988) );
  DFFRX1 e_reg_reg_0_ ( .D(n375), .CK(clk), .RN(n1009), .Q(e_reg[0]), .QN(n989) );
  DFFRX1 e_reg_0_ ( .D(n367), .CK(clk), .RN(n1009), .Q(e[0]), .QN(n959) );
  DFFRX1 e_reg_reg_1_ ( .D(n374), .CK(clk), .RN(n1009), .Q(e_reg[1]), .QN(n990) );
  DFFRX1 e_reg_1_ ( .D(n366), .CK(clk), .RN(n1009), .Q(e[1]), .QN(n938) );
  DFFRX1 e_reg_reg_2_ ( .D(n373), .CK(clk), .RN(n1009), .Q(e_reg[2]), .QN(n991) );
  DFFRX1 e_reg_2_ ( .D(n365), .CK(clk), .RN(n1009), .Q(e[2]), .QN(n956) );
  DFFRX1 e_reg_reg_3_ ( .D(n372), .CK(clk), .RN(n1009), .Q(e_reg[3]), .QN(n995) );
  DFFRX1 e_reg_3_ ( .D(n364), .CK(clk), .RN(n1009), .Q(e[3]), .QN(n963) );
  DFFRX1 e_reg_reg_4_ ( .D(n371), .CK(clk), .RN(n1009), .Q(e_reg[4]), .QN(n992) );
  DFFRX1 e_reg_4_ ( .D(n363), .CK(clk), .RN(n1009), .Q(e[4]), .QN(n960) );
  DFFRX1 e_reg_reg_5_ ( .D(n370), .CK(clk), .RN(n1009), .Q(e_reg[5]), .QN(n993) );
  DFFRX1 e_reg_5_ ( .D(n362), .CK(clk), .RN(n1009), .Q(e[5]), .QN(n964) );
  DFFRX1 e_reg_reg_6_ ( .D(n369), .CK(clk), .RN(n1008), .Q(e_reg[6]), .QN(n996) );
  DFFRX1 e_reg_6_ ( .D(n361), .CK(clk), .RN(n1008), .Q(e[6]), .QN(n961) );
  DFFRX1 e_reg_reg_7_ ( .D(n368), .CK(clk), .RN(n1008), .Q(e_reg[7]), .QN(n994) );
  DFFRX1 counter_reg_1_ ( .D(n422), .CK(clk), .RN(n1007), .Q(counter[1]), .QN(
        n986) );
  DFFRX1 c_reg_4_ ( .D(n387), .CK(clk), .RN(n1006), .Q(c[4]), .QN(n441) );
  DFFRX1 b_reg_7_ ( .D(n421), .CK(clk), .RN(n1006), .Q(b[7]), .QN(n942) );
  DFFRX1 b_reg_0_ ( .D(n406), .CK(clk), .RN(n1006), .Q(b[0]), .QN(n1000) );
  DFFRX1 a_reg_4_ ( .D(n388), .CK(clk), .RN(reset), .Q(a[4]), .QN(n442) );
  DFFRX1 d_reg_0_ ( .D(n405), .CK(clk), .RN(n1009), .Q(d[0]), .QN(n1002) );
  DFFRX1 d_reg_7_ ( .D(n378), .CK(clk), .RN(n1010), .QN(n943) );
  DFFRX2 res_do_reg_1_ ( .D(n358), .CK(clk), .RN(n1008), .Q(res_do[1]) );
  DFFRX2 res_do_reg_2_ ( .D(n357), .CK(clk), .RN(n1008), .Q(res_do[2]) );
  DFFRX2 res_do_reg_3_ ( .D(n356), .CK(clk), .RN(n1008), .Q(res_do[3]) );
  DFFRX2 res_do_reg_4_ ( .D(n355), .CK(clk), .RN(n1008), .Q(res_do[4]) );
  DFFRX2 res_do_reg_5_ ( .D(n354), .CK(clk), .RN(n1008), .Q(res_do[5]) );
  DFFRX2 res_do_reg_0_ ( .D(n359), .CK(clk), .RN(n1008), .Q(res_do[0]) );
  DFFRX1 a_reg_6_ ( .D(n380), .CK(clk), .RN(reset), .Q(a[6]), .QN(n969) );
  DFFRX1 d_reg_6_ ( .D(n381), .CK(clk), .RN(n1007), .Q(d[6]), .QN(n966) );
  DFFRX1 c_reg_6_ ( .D(n379), .CK(clk), .RN(n1006), .Q(c[6]), .QN(n968) );
  DFFRX1 c_reg_7_ ( .D(n376), .CK(clk), .RN(n1006), .Q(c[7]), .QN(n982) );
  DFFRX1 a_reg_7_ ( .D(n377), .CK(clk), .RN(reset), .Q(a[7]), .QN(n997) );
  DFFRX1 c_reg_5_ ( .D(n383), .CK(clk), .RN(n1006), .Q(c[5]), .QN(n945) );
  DFFRX1 a_reg_5_ ( .D(n384), .CK(clk), .RN(reset), .Q(a[5]), .QN(n944) );
  ADDHX2 DP_OP_17J1_122_7031_U2 ( .A(C1_Z_6), .B(DP_OP_17J1_122_7031_n2), .CO(
        DP_OP_17J1_122_7031_n1), .S(forwardresult[6]) );
  DFFRX2 res_do_reg_7_ ( .D(n352), .CK(clk), .RN(n1008), .Q(res_do[7]), .QN(
        n1005) );
  DFFRX2 res_addr_reg_13_ ( .D(n326), .CK(clk), .RN(reset), .Q(res_addr[13])
         );
  DFFRX1 a_reg_1_ ( .D(n400), .CK(clk), .RN(reset), .QN(n950) );
  DFFRX1 b_reg_2_ ( .D(n398), .CK(clk), .RN(n1006), .Q(b[2]), .QN(n975) );
  DFFRX1 d_reg_3_ ( .D(n393), .CK(clk), .RN(n1008), .Q(d[3]), .QN(n947) );
  DFFRX1 b_reg_4_ ( .D(n390), .CK(clk), .RN(reset), .Q(b[4]), .QN(n971) );
  DFFRX2 index_reg_2_ ( .D(n418), .CK(clk), .RN(n1010), .Q(index[2]), .QN(n941) );
  DFFRX2 sti_rd_reg ( .D(n324), .CK(clk), .RN(n1010), .Q(sti_rd) );
  DFFRX2 res_addr_reg_12_ ( .D(n327), .CK(clk), .RN(reset), .Q(res_addr[12])
         );
  DFFRX2 res_addr_reg_11_ ( .D(n328), .CK(clk), .RN(n1008), .Q(res_addr[11])
         );
  DFFRX2 res_addr_reg_10_ ( .D(n329), .CK(clk), .RN(n1009), .Q(res_addr[10])
         );
  DFFRX2 res_addr_reg_9_ ( .D(n330), .CK(clk), .RN(n1009), .Q(res_addr[9]) );
  DFFRX2 res_addr_reg_8_ ( .D(n331), .CK(clk), .RN(n1010), .Q(res_addr[8]) );
  DFFRX2 res_addr_reg_6_ ( .D(n333), .CK(clk), .RN(reset), .Q(res_addr[6]) );
  DFFRX2 res_addr_reg_5_ ( .D(n334), .CK(clk), .RN(n1009), .Q(res_addr[5]) );
  DFFRX2 res_addr_reg_3_ ( .D(n336), .CK(clk), .RN(n1010), .Q(res_addr[3]) );
  DFFRX2 res_addr_reg_2_ ( .D(n337), .CK(clk), .RN(n1007), .Q(res_addr[2]) );
  DFFRX2 res_rd_reg ( .D(n351), .CK(clk), .RN(reset), .Q(res_rd) );
  DFFRX2 res_addr_reg_0_ ( .D(n339), .CK(clk), .RN(reset), .Q(res_addr[0]) );
  DFFRX2 res_addr_reg_7_ ( .D(n332), .CK(clk), .RN(reset), .Q(res_addr[7]) );
  DFFRX2 res_addr_reg_4_ ( .D(n335), .CK(clk), .RN(n1010), .Q(res_addr[4]) );
  DFFRX2 res_addr_reg_1_ ( .D(n338), .CK(clk), .RN(reset), .Q(res_addr[1]) );
  DFFRX2 done_reg ( .D(n325), .CK(clk), .RN(n1007), .Q(done) );
  DFFRX2 sti_addr_reg_1_ ( .D(n341), .CK(clk), .RN(n1007), .Q(sti_addr[1]) );
  DFFRX2 sti_addr_reg_2_ ( .D(n342), .CK(clk), .RN(n1007), .Q(sti_addr[2]) );
  DFFRX2 sti_addr_reg_3_ ( .D(n343), .CK(clk), .RN(n1007), .Q(sti_addr[3]) );
  DFFRX2 sti_addr_reg_4_ ( .D(n344), .CK(clk), .RN(n1007), .Q(sti_addr[4]) );
  DFFRX2 sti_addr_reg_5_ ( .D(n345), .CK(clk), .RN(n1007), .Q(sti_addr[5]) );
  DFFRX2 sti_addr_reg_6_ ( .D(n346), .CK(clk), .RN(n1007), .Q(sti_addr[6]) );
  DFFRX2 sti_addr_reg_7_ ( .D(n347), .CK(clk), .RN(n1007), .Q(sti_addr[7]) );
  DFFRX2 sti_addr_reg_8_ ( .D(n348), .CK(clk), .RN(n1007), .Q(sti_addr[8]) );
  DFFRX2 sti_addr_reg_9_ ( .D(n349), .CK(clk), .RN(n1007), .Q(sti_addr[9]) );
  DFFRX2 sti_addr_reg_0_ ( .D(n350), .CK(clk), .RN(n1008), .Q(sti_addr[0]) );
  DFFRX2 index_reg_1_ ( .D(n419), .CK(clk), .RN(n1010), .Q(index[1]), .QN(n965) );
  DFFRX2 res_do_reg_6_ ( .D(n353), .CK(clk), .RN(n1008), .Q(res_do[6]), .QN(
        n1004) );
  DFFRX2 index_reg_0_ ( .D(n420), .CK(clk), .RN(n1011), .Q(index[0]), .QN(n953) );
  DFFRX2 res_wr_reg ( .D(n340), .CK(clk), .RN(n1007), .Q(res_wr) );
  DFFRX2 index_reg_3_ ( .D(n417), .CK(clk), .RN(n1010), .Q(index[3]), .QN(n979) );
  ADDHX1 DP_OP_17J1_122_7031_U6 ( .A(C1_Z_2), .B(DP_OP_17J1_122_7031_n6), .CO(
        DP_OP_17J1_122_7031_n5), .S(forwardresult[2]) );
  ADDHX1 DP_OP_17J1_122_7031_U5 ( .A(C1_Z_3), .B(DP_OP_17J1_122_7031_n5), .CO(
        DP_OP_17J1_122_7031_n4), .S(forwardresult[3]) );
  ADDHX1 DP_OP_17J1_122_7031_U4 ( .A(C1_Z_4), .B(DP_OP_17J1_122_7031_n4), .CO(
        DP_OP_17J1_122_7031_n3), .S(forwardresult[4]) );
  ADDHX1 DP_OP_17J1_122_7031_U3 ( .A(C1_Z_5), .B(DP_OP_17J1_122_7031_n3), .CO(
        DP_OP_17J1_122_7031_n2), .S(forwardresult[5]) );
  ADDHX1 DP_OP_17J1_122_7031_U7 ( .A(C1_Z_1), .B(C1_Z_0), .CO(
        DP_OP_17J1_122_7031_n6), .S(forwardresult[1]) );
  DFFRX2 index_reg_12_ ( .D(n408), .CK(clk), .RN(n1010), .Q(index[12]), .QN(
        n939) );
  DFFRX2 index_reg_9_ ( .D(n411), .CK(clk), .RN(n1010), .Q(index[9]), .QN(n984) );
  DFFRX1 c_reg_0_ ( .D(n403), .CK(clk), .RN(n1007), .Q(c[0]), .QN(n949) );
  DFFRX1 c_reg_1_ ( .D(n399), .CK(clk), .RN(n1011), .Q(c[1]), .QN(n972) );
  DFFRX1 c_reg_2_ ( .D(n395), .CK(clk), .RN(n1011), .Q(c[2]), .QN(n974) );
  DFFRX1 c_reg_3_ ( .D(n391), .CK(clk), .RN(n1006), .Q(c[3]), .QN(n946) );
  DFFRX1 b_reg_1_ ( .D(n402), .CK(clk), .RN(n1006), .Q(b[1]), .QN(n978) );
  DFFRX1 a_reg_3_ ( .D(n392), .CK(clk), .RN(reset), .Q(a[3]), .QN(n951) );
  DFFRX1 d_reg_2_ ( .D(n397), .CK(clk), .RN(n1008), .Q(d[2]), .QN(n977) );
  DFFRX1 d_reg_1_ ( .D(n401), .CK(clk), .RN(n1009), .Q(d[1]), .QN(n1003) );
  DFFRX1 b_reg_3_ ( .D(n394), .CK(clk), .RN(n1006), .Q(b[3]), .QN(n948) );
  DFFRX1 d_reg_4_ ( .D(n389), .CK(clk), .RN(reset), .Q(d[4]), .QN(n970) );
  DFFRX1 b_reg_6_ ( .D(n382), .CK(clk), .RN(reset), .Q(b[6]), .QN(n967) );
  DFFRX1 d_reg_5_ ( .D(n385), .CK(clk), .RN(n1006), .Q(d[5]), .QN(n999) );
  DFFRX1 b_reg_5_ ( .D(n386), .CK(clk), .RN(reset), .Q(b[5]), .QN(n998) );
  DFFRX1 a_reg_2_ ( .D(n396), .CK(clk), .RN(reset), .Q(a[2]), .QN(n976) );
  DFFRX1 a_reg_0_ ( .D(n404), .CK(clk), .RN(reset), .Q(a[0]), .QN(n973) );
  AOI222XL U456 ( .A0(n908), .A1(forwardresult[4]), .B0(n907), .B1(res_do[4]), 
        .C0(e[4]), .C1(n438), .Y(n905) );
  AOI222XL U457 ( .A0(n908), .A1(forwardresult[3]), .B0(n907), .B1(res_do[3]), 
        .C0(e[3]), .C1(n438), .Y(n904) );
  AOI222XL U458 ( .A0(n908), .A1(forwardresult[5]), .B0(n907), .B1(res_do[5]), 
        .C0(e[5]), .C1(n438), .Y(n906) );
  INVX1 U459 ( .A(n908), .Y(n912) );
  AOI222XL U460 ( .A0(n908), .A1(n900), .B0(res_do[0]), .B1(n907), .C0(e[0]), 
        .C1(n438), .Y(n901) );
  BUFX2 U461 ( .A(n841), .Y(n855) );
  BUFX2 U462 ( .A(n845), .Y(n853) );
  BUFX2 U463 ( .A(n837), .Y(n858) );
  OAI21XL U464 ( .A0(n918), .A1(n801), .B0(n800), .Y(n806) );
  OAI2BB2X4 U465 ( .B0(n897), .B1(n896), .A0N(n899), .A1N(n898), .Y(n908) );
  AOI21X1 U467 ( .A0(n574), .A1(counter[2]), .B0(n638), .Y(n842) );
  INVXL U468 ( .A(n844), .Y(n574) );
  OR2X1 U469 ( .A(n512), .B(n932), .Y(n789) );
  NAND2X1 U471 ( .A(n533), .B(n695), .Y(n492) );
  NOR2X1 U472 ( .A(n761), .B(n433), .Y(n494) );
  NOR2X1 U473 ( .A(n495), .B(index[3]), .Y(n708) );
  NOR2X1 U474 ( .A(n505), .B(n933), .Y(n787) );
  NAND2X1 U475 ( .A(n495), .B(index[3]), .Y(n746) );
  NAND2X1 U476 ( .A(n495), .B(index[5]), .Y(n762) );
  BUFX8 U477 ( .A(n487), .Y(n495) );
  INVX4 U478 ( .A(n490), .Y(n512) );
  CLKINVX1 U479 ( .A(n517), .Y(n830) );
  INVX4 U480 ( .A(n631), .Y(n484) );
  NOR2X1 U481 ( .A(n606), .B(n480), .Y(n517) );
  NAND2X2 U482 ( .A(n463), .B(n965), .Y(n478) );
  NOR2X1 U483 ( .A(n586), .B(n981), .Y(n611) );
  NAND2X1 U484 ( .A(sti_di[9]), .B(n470), .Y(n471) );
  NAND2X1 U485 ( .A(sti_di[11]), .B(n470), .Y(n458) );
  NAND2X1 U486 ( .A(sti_di[10]), .B(n470), .Y(n455) );
  AOI22X2 U487 ( .A0(n468), .A1(sti_di[5]), .B0(sti_di[13]), .B1(n467), .Y(
        n473) );
  NOR2X1 U488 ( .A(index[3]), .B(index[2]), .Y(n467) );
  NOR2X1 U489 ( .A(n941), .B(n979), .Y(n469) );
  NOR2X1 U490 ( .A(n979), .B(index[2]), .Y(n468) );
  OAI22XL U491 ( .A0(n662), .A1(n661), .B0(b[4]), .B1(n442), .Y(n665) );
  OAI21XL U492 ( .A0(b[1]), .A1(n973), .B0(n950), .Y(n660) );
  NOR2XL U493 ( .A(n975), .B(a[2]), .Y(n656) );
  OAI22XL U494 ( .A0(b[3]), .A1(n951), .B0(n976), .B1(b[2]), .Y(n658) );
  OAI22XL U495 ( .A0(a[3]), .A1(n948), .B0(n971), .B1(a[4]), .Y(n661) );
  NAND2XL U497 ( .A(n931), .B(n930), .Y(n445) );
  INVXL U498 ( .A(n708), .Y(n748) );
  NAND2XL U499 ( .A(index[9]), .B(n932), .Y(n521) );
  INVX6 U500 ( .A(n490), .Y(n511) );
  INVXL U501 ( .A(n920), .Y(n737) );
  AOI21X1 U502 ( .A0(n507), .A1(n789), .B0(n506), .Y(n800) );
  INVXL U503 ( .A(n775), .Y(n510) );
  NAND2XL U504 ( .A(n562), .B(n988), .Y(n564) );
  OAI21XL U505 ( .A0(n918), .A1(n787), .B0(n915), .Y(n791) );
  INVXL U506 ( .A(n792), .Y(n549) );
  NAND2XL U507 ( .A(n561), .B(n930), .Y(n563) );
  NAND2X1 U508 ( .A(n585), .B(n981), .Y(n604) );
  NAND2XL U509 ( .A(n755), .B(n929), .Y(n759) );
  NAND2XL U510 ( .A(n766), .B(n929), .Y(n773) );
  AOI222XL U511 ( .A0(n908), .A1(forwardresult[2]), .B0(n907), .B1(res_do[2]), 
        .C0(e[2]), .C1(n438), .Y(n903) );
  OAI211XL U512 ( .A0(n920), .A1(n862), .B0(n702), .C0(n701), .Y(n338) );
  OAI211X1 U514 ( .A0(n920), .A1(n716), .B0(n715), .C0(n714), .Y(n336) );
  NAND2X1 U515 ( .A(n710), .B(n929), .Y(n715) );
  NAND2X1 U516 ( .A(n699), .B(n929), .Y(n702) );
  INVX1 U518 ( .A(n788), .Y(n506) );
  NAND2X1 U519 ( .A(n512), .B(index[0]), .Y(n545) );
  NAND2X1 U520 ( .A(n511), .B(index[12]), .Y(n815) );
  NAND2X1 U521 ( .A(n512), .B(n930), .Y(n775) );
  NAND2X1 U522 ( .A(n511), .B(n932), .Y(n788) );
  NAND2X1 U523 ( .A(n512), .B(index[9]), .Y(n803) );
  CLKINVX1 U524 ( .A(n591), .Y(n559) );
  CLKINVX1 U525 ( .A(n681), .Y(n704) );
  INVX6 U526 ( .A(n833), .Y(n674) );
  NAND2X1 U527 ( .A(n945), .B(d[5]), .Y(n652) );
  INVX4 U528 ( .A(n436), .Y(n438) );
  NAND2X1 U529 ( .A(n887), .B(n886), .Y(n889) );
  OAI211X1 U530 ( .A0(n920), .A1(n760), .B0(n759), .C0(n758), .Y(n335) );
  OAI211X1 U531 ( .A0(n920), .A1(n774), .B0(n773), .C0(n772), .Y(n334) );
  NAND2X1 U532 ( .A(n916), .B(n789), .Y(n801) );
  NOR2X1 U533 ( .A(n512), .B(index[12]), .Y(n814) );
  NAND2X1 U534 ( .A(n511), .B(n931), .Y(n718) );
  INVX3 U535 ( .A(n549), .Y(n922) );
  NAND3X4 U536 ( .A(n485), .B(n633), .C(n502), .Y(n488) );
  OAI21X1 U537 ( .A0(n897), .A1(n632), .B0(n523), .Y(n642) );
  MXI2X1 U538 ( .A(a[0]), .B(b[0]), .S0(n675), .Y(n834) );
  INVX1 U539 ( .A(n673), .Y(n745) );
  INVX3 U540 ( .A(n668), .Y(n675) );
  NAND2X2 U541 ( .A(n462), .B(n461), .Y(n463) );
  NAND2X2 U542 ( .A(n475), .B(n474), .Y(n476) );
  NAND3X2 U543 ( .A(n460), .B(n459), .C(n458), .Y(n461) );
  NAND3X2 U544 ( .A(n466), .B(n465), .C(n464), .Y(n475) );
  NAND3X2 U545 ( .A(n457), .B(n456), .C(n455), .Y(n462) );
  NAND3X2 U546 ( .A(n473), .B(n472), .C(n471), .Y(n474) );
  NOR2X1 U547 ( .A(index[9]), .B(n932), .Y(n448) );
  AOI22X2 U548 ( .A0(n468), .A1(sti_di[7]), .B0(sti_di[15]), .B1(n467), .Y(
        n460) );
  INVX1 U549 ( .A(n904), .Y(n356) );
  INVX1 U552 ( .A(forwardresult[6]), .Y(n910) );
  AO21X1 U553 ( .A0(n826), .A1(n929), .B0(n825), .Y(n327) );
  AO21X1 U554 ( .A0(n813), .A1(n929), .B0(n812), .Y(n330) );
  AO21X1 U555 ( .A0(n743), .A1(n929), .B0(n742), .Y(n333) );
  AO21X1 U556 ( .A0(n785), .A1(n929), .B0(n784), .Y(n328) );
  AO21X1 U557 ( .A0(n799), .A1(n929), .B0(n798), .Y(n331) );
  OAI2BB1X1 U558 ( .A0N(n929), .A1N(n928), .B0(n927), .Y(n332) );
  AO21X1 U559 ( .A0(n728), .A1(n929), .B0(n727), .Y(n329) );
  AOI21X2 U560 ( .A0(n493), .A1(n531), .B0(n492), .Y(n707) );
  INVXL U561 ( .A(C1_Z_0), .Y(n900) );
  BUFX8 U562 ( .A(n440), .Y(n439) );
  BUFX2 U563 ( .A(n731), .Y(n433) );
  NAND2X1 U564 ( .A(n495), .B(index[1]), .Y(n695) );
  NOR2X1 U565 ( .A(n511), .B(index[0]), .Y(n544) );
  NOR2X1 U566 ( .A(n512), .B(n931), .Y(n717) );
  OAI21X2 U567 ( .A0(n689), .A1(n891), .B0(n688), .Y(n440) );
  AOI211X1 U568 ( .A0(n703), .A1(n681), .B0(n680), .C0(n679), .Y(n683) );
  NAND2X1 U569 ( .A(n570), .B(n520), .Y(n792) );
  NAND2X2 U570 ( .A(n484), .B(n499), .Y(n502) );
  AOI211X1 U571 ( .A0(n744), .A1(n673), .B0(n672), .C0(n671), .Y(n677) );
  NAND2X1 U572 ( .A(n642), .B(n875), .Y(n524) );
  NOR2X1 U573 ( .A(n639), .B(n935), .Y(n518) );
  AOI211X1 U575 ( .A0(n878), .A1(n877), .B0(n876), .C0(n875), .Y(n899) );
  NAND2X1 U576 ( .A(n559), .B(n931), .Y(n558) );
  INVX1 U577 ( .A(n703), .Y(n684) );
  INVX2 U578 ( .A(n866), .Y(n829) );
  INVX1 U579 ( .A(n744), .Y(n678) );
  NAND2X1 U580 ( .A(n593), .B(n984), .Y(n560) );
  AOI2BB2X2 U581 ( .B0(a[7]), .B1(n942), .A0N(n667), .A1N(n666), .Y(n668) );
  NAND2X1 U582 ( .A(n619), .B(n603), .Y(n624) );
  INVX1 U583 ( .A(n603), .Y(n452) );
  NAND2X1 U584 ( .A(n582), .B(index[5]), .Y(n586) );
  NAND2X1 U585 ( .A(n579), .B(n980), .Y(n583) );
  INVX1 U586 ( .A(n896), .Y(n619) );
  INVX1 U587 ( .A(n626), .Y(n606) );
  NAND2X1 U588 ( .A(n449), .B(n448), .Y(n450) );
  INVX1 U589 ( .A(n936), .Y(n638) );
  INVX2 U590 ( .A(n633), .Y(n935) );
  NOR2X1 U591 ( .A(n521), .B(n445), .Y(n447) );
  NAND2X1 U592 ( .A(n626), .B(n955), .Y(n838) );
  NAND3X1 U593 ( .A(n443), .B(n956), .C(n938), .Y(n454) );
  NOR2X1 U594 ( .A(n931), .B(n930), .Y(n449) );
  INVX1 U595 ( .A(n499), .Y(n840) );
  INVX1 U596 ( .A(n570), .Y(n843) );
  INVX2 U597 ( .A(n616), .Y(n934) );
  NAND2X1 U598 ( .A(n965), .B(n444), .Y(n537) );
  OR2X1 U599 ( .A(n933), .B(n932), .Y(n482) );
  AOI21X2 U600 ( .A0(sti_di[2]), .A1(n469), .B0(n953), .Y(n456) );
  AOI21X2 U601 ( .A0(sti_di[0]), .A1(n469), .B0(n953), .Y(n465) );
  INVX1 U602 ( .A(n685), .Y(n891) );
  AOI22X2 U603 ( .A0(n468), .A1(sti_di[6]), .B0(sti_di[14]), .B1(n467), .Y(
        n457) );
  AOI21X2 U604 ( .A0(sti_di[3]), .A1(n469), .B0(index[0]), .Y(n459) );
  INVX1 U605 ( .A(n890), .Y(n689) );
  NOR2X1 U606 ( .A(n957), .B(counter[1]), .Y(n486) );
  NAND2X1 U607 ( .A(counter[1]), .B(counter[0]), .Y(n836) );
  NAND2XL U608 ( .A(n944), .B(b[5]), .Y(n664) );
  NOR4X1 U609 ( .A(e[0]), .B(e[6]), .C(e[5]), .D(e[3]), .Y(n443) );
  NOR2X1 U610 ( .A(n940), .B(cur_state[0]), .Y(n479) );
  NOR2X1 U611 ( .A(counter[1]), .B(counter[0]), .Y(n499) );
  NOR2X1 U612 ( .A(n943), .B(n982), .Y(n685) );
  NAND2X1 U613 ( .A(b[7]), .B(a[7]), .Y(n890) );
  NAND2X1 U614 ( .A(cur_state[2]), .B(cur_state[0]), .Y(n625) );
  NOR2X1 U615 ( .A(index[0]), .B(index[2]), .Y(n444) );
  OAI21X1 U617 ( .A0(n439), .A1(n874), .B0(n873), .Y(C1_Z_1) );
  NOR2X1 U618 ( .A(n495), .B(index[2]), .Y(n532) );
  INVX3 U619 ( .A(n547), .Y(n491) );
  NOR2X1 U620 ( .A(n729), .B(n496), .Y(n497) );
  NAND2X1 U621 ( .A(n751), .B(n746), .Y(n729) );
  NOR2X1 U622 ( .A(n495), .B(index[4]), .Y(n750) );
  AOI2BB1X2 U623 ( .A0N(n872), .A1N(n874), .B0(n834), .Y(n670) );
  AOI2BB2X4 U624 ( .B0(c[7]), .B1(n943), .A0N(n655), .A1N(n654), .Y(n833) );
  INVXL U625 ( .A(n531), .Y(n697) );
  NAND3X4 U626 ( .A(n478), .B(n477), .C(n634), .Y(n522) );
  BUFX2 U628 ( .A(index[8]), .Y(n932) );
  BUFX2 U629 ( .A(index[10]), .Y(n931) );
  BUFX2 U630 ( .A(index[11]), .Y(n930) );
  CLKBUFX3 U632 ( .A(n522), .Y(n897) );
  NAND2XL U633 ( .A(n696), .B(n695), .Y(n698) );
  INVXL U634 ( .A(n694), .Y(n696) );
  NAND2XL U635 ( .A(n752), .B(n751), .Y(n753) );
  INVXL U636 ( .A(n750), .Y(n752) );
  NAND2XL U637 ( .A(n916), .B(n915), .Y(n917) );
  BUFX2 U638 ( .A(index[7]), .Y(n933) );
  NAND2XL U639 ( .A(n546), .B(n545), .Y(n548) );
  INVXL U640 ( .A(n544), .Y(n546) );
  OAI21XL U641 ( .A0(n697), .A1(n694), .B0(n695), .Y(n536) );
  NAND2XL U642 ( .A(n534), .B(n533), .Y(n535) );
  INVXL U643 ( .A(n532), .Y(n534) );
  NAND2XL U644 ( .A(n748), .B(n746), .Y(n709) );
  NAND2XL U645 ( .A(n763), .B(n762), .Y(n764) );
  INVXL U646 ( .A(n761), .Y(n763) );
  OAI21XL U647 ( .A0(n765), .A1(n761), .B0(n762), .Y(n735) );
  INVXL U648 ( .A(n433), .Y(n733) );
  NOR2XL U649 ( .A(n738), .B(n922), .Y(n739) );
  NAND2XL U650 ( .A(n789), .B(n788), .Y(n790) );
  NOR2XL U651 ( .A(n793), .B(n792), .Y(n794) );
  NAND2XL U652 ( .A(n804), .B(n803), .Y(n805) );
  INVXL U653 ( .A(n802), .Y(n804) );
  NOR2XL U654 ( .A(n807), .B(n922), .Y(n808) );
  NAND2XL U655 ( .A(n719), .B(n718), .Y(n720) );
  INVXL U656 ( .A(n717), .Y(n719) );
  NOR2XL U657 ( .A(n722), .B(n792), .Y(n723) );
  NAND2XL U658 ( .A(n776), .B(n775), .Y(n777) );
  NAND2XL U659 ( .A(n816), .B(n815), .Y(n817) );
  INVXL U660 ( .A(n814), .Y(n816) );
  NOR2XL U661 ( .A(n819), .B(n922), .Y(n821) );
  NOR2XL U662 ( .A(n631), .B(n843), .Y(n481) );
  AOI21X2 U663 ( .A0(sti_di[1]), .A1(n469), .B0(index[0]), .Y(n472) );
  AOI22X2 U664 ( .A0(n468), .A1(sti_di[4]), .B0(sti_di[12]), .B1(n467), .Y(
        n466) );
  NAND2X1 U665 ( .A(sti_di[8]), .B(n470), .Y(n464) );
  OAI22XL U666 ( .A0(d[3]), .A1(n946), .B0(n974), .B1(d[2]), .Y(n646) );
  NOR2XL U667 ( .A(n645), .B(n644), .Y(n648) );
  NOR2XL U668 ( .A(c[1]), .B(c[0]), .Y(n644) );
  NOR2XL U669 ( .A(n977), .B(c[2]), .Y(n645) );
  NAND2XL U670 ( .A(forwardresult[2]), .B(n956), .Y(n880) );
  XOR2X1 U671 ( .A(n512), .B(n504), .Y(n505) );
  INVXL U672 ( .A(n500), .Y(n501) );
  INVXL U673 ( .A(n520), .Y(n503) );
  NAND2XL U674 ( .A(n732), .B(n762), .Y(n496) );
  NOR2X1 U675 ( .A(n708), .B(n750), .Y(n730) );
  OAI22XL U676 ( .A0(n650), .A1(n649), .B0(d[4]), .B1(n441), .Y(n653) );
  OAI22XL U677 ( .A0(c[3]), .A1(n947), .B0(n970), .B1(c[4]), .Y(n649) );
  AOI21XL U678 ( .A0(n648), .A1(n647), .B0(n646), .Y(n650) );
  OAI21XL U679 ( .A0(n972), .A1(n949), .B0(d[1]), .Y(n647) );
  OAI22XL U680 ( .A0(d[5]), .A1(n945), .B0(n968), .B1(d[6]), .Y(n651) );
  MX2X1 U681 ( .A(d[5]), .B(c[5]), .S0(n833), .Y(n681) );
  MX2X1 U682 ( .A(d[3]), .B(c[3]), .S0(n833), .Y(n673) );
  INVXL U683 ( .A(n746), .Y(n747) );
  NOR2XL U684 ( .A(n495), .B(index[6]), .Y(n731) );
  OAI22XL U685 ( .A0(n966), .A1(c[6]), .B0(n943), .B1(c[7]), .Y(n654) );
  AOI21X1 U686 ( .A0(n653), .A1(n652), .B0(n651), .Y(n655) );
  MXI2X1 U687 ( .A(a[4]), .B(b[4]), .S0(n675), .Y(n705) );
  MXI2X1 U688 ( .A(c[4]), .B(d[4]), .S0(n674), .Y(n706) );
  MXI2X2 U689 ( .A(a[2]), .B(b[2]), .S0(n675), .Y(n870) );
  MXI2X1 U690 ( .A(c[2]), .B(d[2]), .S0(n674), .Y(n871) );
  MXI2X1 U691 ( .A(n978), .B(n950), .S0(n668), .Y(n872) );
  MXI2X1 U692 ( .A(d[1]), .B(c[1]), .S0(n833), .Y(n874) );
  NOR4XL U693 ( .A(e_reg[4]), .B(e_reg[5]), .C(e_reg[7]), .D(e_reg[6]), .Y(
        n877) );
  NOR4XL U694 ( .A(e_reg[1]), .B(e_reg[0]), .C(e_reg[2]), .D(e_reg[3]), .Y(
        n878) );
  NOR2XL U695 ( .A(n590), .B(n985), .Y(n592) );
  INVXL U696 ( .A(n862), .Y(n864) );
  INVXL U697 ( .A(n820), .Y(n768) );
  NOR2XL U698 ( .A(n577), .B(n538), .Y(n602) );
  INVXL U699 ( .A(n861), .Y(n827) );
  BUFX2 U700 ( .A(n525), .Y(n820) );
  NOR2XL U701 ( .A(n603), .B(n896), .Y(n525) );
  NAND2XL U702 ( .A(n514), .B(n513), .Y(n515) );
  OAI21X2 U703 ( .A0(n818), .A1(n814), .B0(n815), .Y(n516) );
  INVX3 U704 ( .A(n893), .Y(n913) );
  INVXL U705 ( .A(n907), .Y(n914) );
  NOR2BX2 U706 ( .AN(n899), .B(n898), .Y(n909) );
  BUFX2 U707 ( .A(n576), .Y(n595) );
  BUFX2 U708 ( .A(n594), .Y(n875) );
  NOR2XL U709 ( .A(n555), .B(n593), .Y(n797) );
  NOR2XL U710 ( .A(n587), .B(index[6]), .Y(n738) );
  NOR2XL U711 ( .A(n585), .B(n584), .Y(n774) );
  AND2X1 U712 ( .A(n583), .B(index[5]), .Y(n584) );
  NAND2XL U713 ( .A(n936), .B(n624), .Y(n556) );
  BUFX2 U714 ( .A(n554), .Y(n863) );
  INVXL U715 ( .A(n557), .Y(n554) );
  BUFX2 U716 ( .A(n624), .Y(n861) );
  NOR2XL U717 ( .A(n635), .B(n896), .Y(n637) );
  AND3X1 U718 ( .A(n611), .B(n610), .C(n609), .Y(n636) );
  NAND2XL U719 ( .A(n626), .B(n632), .Y(n615) );
  NAND2XL U720 ( .A(n631), .B(n838), .Y(n869) );
  NAND3XL U721 ( .A(n875), .B(n624), .C(n623), .Y(n340) );
  OAI2BB1XL U722 ( .A0N(index[1]), .A1N(n866), .B0(n865), .Y(n419) );
  AOI211XL U723 ( .A0(n926), .A1(index[4]), .B0(n820), .C0(n757), .Y(n758) );
  AOI211XL U724 ( .A0(n933), .A1(n926), .B0(n925), .C0(n924), .Y(n927) );
  NOR2XL U725 ( .A(n920), .B(n919), .Y(n925) );
  OAI211XL U726 ( .A0(n767), .A1(n953), .B0(n551), .C0(n550), .Y(n552) );
  AOI211XL U727 ( .A0(n628), .A1(res_rd), .B0(n627), .C0(n626), .Y(n629) );
  OAI211XL U728 ( .A0(n920), .A1(n602), .B0(n541), .C0(n540), .Y(n542) );
  NAND2XL U729 ( .A(n926), .B(index[2]), .Y(n540) );
  AOI211XL U730 ( .A0(n921), .A1(res_addr[3]), .B0(n713), .C0(n712), .Y(n714)
         );
  NOR2XL U731 ( .A(n767), .B(n979), .Y(n713) );
  AOI211XL U732 ( .A0(n921), .A1(res_addr[5]), .B0(n771), .C0(n770), .Y(n772)
         );
  NOR2XL U733 ( .A(n767), .B(n987), .Y(n771) );
  OAI211XL U734 ( .A0(n767), .A1(n981), .B0(n741), .C0(n740), .Y(n742) );
  NAND2XL U735 ( .A(n737), .B(n736), .Y(n741) );
  OAI211XL U736 ( .A0(n920), .A1(n797), .B0(n796), .C0(n795), .Y(n798) );
  NAND2XL U737 ( .A(n926), .B(n932), .Y(n795) );
  NAND2XL U738 ( .A(n926), .B(index[9]), .Y(n809) );
  OAI211XL U739 ( .A0(n920), .A1(n726), .B0(n725), .C0(n724), .Y(n727) );
  OAI211XL U740 ( .A0(n920), .A1(n783), .B0(n782), .C0(n781), .Y(n784) );
  NAND2XL U741 ( .A(n926), .B(n930), .Y(n781) );
  OAI211XL U742 ( .A0(n920), .A1(n824), .B0(n823), .C0(n822), .Y(n825) );
  NAND2XL U743 ( .A(n926), .B(index[12]), .Y(n822) );
  NAND2XL U744 ( .A(n618), .B(n633), .Y(n324) );
  NAND2XL U745 ( .A(n897), .B(n619), .Y(n617) );
  OAI211XL U746 ( .A0(index[2]), .A1(n599), .B0(n827), .C0(n598), .Y(n601) );
  OAI222XL U747 ( .A0(n1005), .A1(n914), .B0(n913), .B1(n912), .C0(n962), .C1(
        n436), .Y(n352) );
  INVXL U748 ( .A(n635), .Y(n608) );
  INVXL U749 ( .A(n565), .Y(n566) );
  AOI211XL U750 ( .A0(n635), .A1(n613), .B0(n636), .C0(n612), .Y(n614) );
  INVXL U751 ( .A(n639), .Y(n640) );
  AOI211XL U752 ( .A0(n638), .A1(n1011), .B0(n637), .C0(n636), .Y(n641) );
  BUFX2 U753 ( .A(n1006), .Y(n1011) );
  XNOR2X1 U754 ( .A(n593), .B(index[9]), .Y(n811) );
  XOR2X1 U755 ( .A(n564), .B(index[12]), .Y(n824) );
  AOI22XL U756 ( .A0(n879), .A1(n938), .B0(forwardresult[1]), .B1(n959), .Y(
        n881) );
  AOI222XL U757 ( .A0(n908), .A1(forwardresult[1]), .B0(n907), .B1(res_do[1]), 
        .C0(n438), .C1(e[1]), .Y(n902) );
  NOR2X1 U758 ( .A(n954), .B(cur_state[0]), .Y(n605) );
  NAND2X2 U759 ( .A(n616), .B(cur_state[0]), .Y(n633) );
  NOR2X1 U760 ( .A(n495), .B(index[5]), .Y(n761) );
  NAND4XL U761 ( .A(n907), .B(res_wr), .C(n633), .D(n831), .Y(n621) );
  NOR2X1 U762 ( .A(cur_state[2]), .B(cur_state[1]), .Y(n616) );
  NAND4XL U763 ( .A(n614), .B(n615), .C(n839), .D(n633), .Y(nxt_state[1]) );
  NAND2XL U764 ( .A(n839), .B(n830), .Y(n569) );
  INVXL U765 ( .A(n839), .Y(n523) );
  NOR2X4 U766 ( .A(n522), .B(n839), .Y(n622) );
  CLKINVX2 U767 ( .A(n573), .Y(n596) );
  NAND2X1 U768 ( .A(index[0]), .B(index[1]), .Y(n693) );
  NAND2X2 U769 ( .A(n476), .B(index[1]), .Y(n477) );
  NOR2X1 U770 ( .A(n495), .B(index[1]), .Y(n694) );
  AOI211XL U771 ( .A0(n926), .A1(index[1]), .B0(n700), .C0(n820), .Y(n701) );
  AOI21XL U772 ( .A0(n921), .A1(res_addr[0]), .B0(n820), .Y(n550) );
  OAI211XL U773 ( .A0(n631), .A1(n630), .B0(n629), .C0(n768), .Y(n351) );
  AOI211XL U774 ( .A0(n937), .A1(res_addr[2]), .B0(n820), .C0(n539), .Y(n541)
         );
  AOI211XL U775 ( .A0(n937), .A1(res_addr[6]), .B0(n739), .C0(n820), .Y(n740)
         );
  AOI211XL U776 ( .A0(n921), .A1(res_addr[8]), .B0(n794), .C0(n820), .Y(n796)
         );
  AOI211XL U777 ( .A0(n921), .A1(res_addr[9]), .B0(n808), .C0(n820), .Y(n810)
         );
  AOI211XL U778 ( .A0(n921), .A1(res_addr[10]), .B0(n723), .C0(n820), .Y(n725)
         );
  AOI211XL U779 ( .A0(n921), .A1(res_addr[11]), .B0(n780), .C0(n820), .Y(n782)
         );
  AOI211XL U780 ( .A0(n921), .A1(res_addr[12]), .B0(n821), .C0(n820), .Y(n823)
         );
  NAND4XL U781 ( .A(n617), .B(sti_rd), .C(n839), .D(n934), .Y(n618) );
  NOR2X2 U782 ( .A(n620), .B(n619), .Y(n907) );
  NAND2X2 U783 ( .A(n936), .B(n875), .Y(n620) );
  OAI22X2 U784 ( .A0(n830), .A1(n955), .B0(cur_state[1]), .B1(cur_state[0]), 
        .Y(n832) );
  OAI22XL U785 ( .A0(b[5]), .A1(n944), .B0(n969), .B1(b[6]), .Y(n663) );
  NAND2XL U786 ( .A(forwardresult[4]), .B(n960), .Y(n884) );
  OAI22XL U787 ( .A0(n967), .A1(a[6]), .B0(n942), .B1(a[7]), .Y(n666) );
  NAND2XL U788 ( .A(n512), .B(index[13]), .Y(n513) );
  MXI2X1 U789 ( .A(b[3]), .B(a[3]), .S0(n668), .Y(n744) );
  NAND2XL U790 ( .A(n495), .B(index[4]), .Y(n751) );
  OR2X2 U791 ( .A(n573), .B(n500), .Y(n489) );
  NOR2XL U792 ( .A(n779), .B(n922), .Y(n780) );
  NAND2XL U793 ( .A(n495), .B(index[2]), .Y(n533) );
  NOR2XL U794 ( .A(n767), .B(n952), .Y(n528) );
  NAND2XL U795 ( .A(n926), .B(n931), .Y(n724) );
  NAND2XL U796 ( .A(n733), .B(n732), .Y(n734) );
  NOR2X1 U797 ( .A(n941), .B(n693), .Y(n597) );
  AOI211XL U798 ( .A0(n549), .A1(n565), .B0(n528), .C0(n527), .Y(n529) );
  OAI211XL U799 ( .A0(n920), .A1(n811), .B0(n810), .C0(n809), .Y(n812) );
  NAND2X4 U800 ( .A(n622), .B(n955), .Y(n631) );
  AOI21XL U801 ( .A0(n931), .A1(n560), .B0(n562), .Y(n726) );
  NOR2XL U802 ( .A(n578), .B(n579), .Y(n716) );
  XNOR2X1 U803 ( .A(n483), .B(index[13]), .Y(n567) );
  OAI222XL U804 ( .A0(n1004), .A1(n914), .B0(n910), .B1(n912), .C0(n961), .C1(
        n436), .Y(n353) );
  OAI211XL U805 ( .A0(n602), .A1(n863), .B0(n601), .C0(n600), .Y(n418) );
  NOR2X1 U806 ( .A(n625), .B(cur_state[1]), .Y(n626) );
  NOR2X1 U807 ( .A(n537), .B(index[3]), .Y(n579) );
  NOR2X1 U808 ( .A(n583), .B(index[5]), .Y(n585) );
  NAND2X1 U809 ( .A(index[3]), .B(n597), .Y(n580) );
  NOR2X1 U810 ( .A(n580), .B(n980), .Y(n582) );
  NAND2X1 U811 ( .A(n447), .B(n446), .Y(n603) );
  OR3X2 U812 ( .A(index[13]), .B(index[12]), .C(n933), .Y(n451) );
  NOR2X1 U813 ( .A(n451), .B(n450), .Y(n610) );
  NOR3X1 U814 ( .A(n611), .B(n452), .C(n610), .Y(n453) );
  OAI31X1 U816 ( .A0(e[7]), .A1(n454), .A2(e[4]), .B0(n634), .Y(n480) );
  NOR2X1 U817 ( .A(n836), .B(counter[2]), .Y(n632) );
  NOR2X1 U818 ( .A(n941), .B(index[3]), .Y(n470) );
  NAND2X1 U819 ( .A(n954), .B(n479), .Y(n839) );
  NOR2X1 U820 ( .A(n986), .B(counter[0]), .Y(n570) );
  NAND2X2 U821 ( .A(n605), .B(n940), .Y(n831) );
  OAI2BB2XL U822 ( .B0(n634), .B1(n831), .A0N(n626), .A1N(n480), .Y(n612) );
  AOI211X4 U823 ( .A0(n517), .A1(n632), .B0(n481), .C0(n612), .Y(n920) );
  NOR2X1 U824 ( .A(n604), .B(n482), .Y(n593) );
  NOR2X1 U825 ( .A(n560), .B(n931), .Y(n562) );
  NOR2XL U826 ( .A(n564), .B(index[12]), .Y(n483) );
  CLKINVX1 U827 ( .A(n486), .Y(n575) );
  NOR2X6 U828 ( .A(n631), .B(n575), .Y(n568) );
  NOR2X1 U829 ( .A(counter[2]), .B(n830), .Y(n520) );
  AO21X2 U830 ( .A0(n486), .A1(n520), .B0(n568), .Y(n573) );
  XOR2X1 U831 ( .A(n488), .B(n573), .Y(n487) );
  NOR2X1 U832 ( .A(n694), .B(n532), .Y(n493) );
  CLKINVX1 U833 ( .A(n634), .Y(n876) );
  NOR2X1 U834 ( .A(n876), .B(n831), .Y(n639) );
  AO21X1 U835 ( .A0(n935), .A1(n634), .B0(n639), .Y(n500) );
  INVX4 U836 ( .A(n488), .Y(n490) );
  XOR2X1 U837 ( .A(n489), .B(n511), .Y(n547) );
  OAI21X1 U838 ( .A0(n491), .A1(n544), .B0(n545), .Y(n531) );
  NAND2X1 U839 ( .A(n730), .B(n494), .Y(n498) );
  OAI21X2 U841 ( .A0(n707), .A1(n498), .B0(n497), .Y(n786) );
  OAI211XL U842 ( .A0(n840), .A1(n503), .B0(n502), .C0(n501), .Y(n504) );
  NOR2X1 U843 ( .A(n511), .B(index[9]), .Y(n802) );
  NOR2X1 U844 ( .A(n801), .B(n802), .Y(n509) );
  NAND2X2 U845 ( .A(n505), .B(n933), .Y(n915) );
  INVX1 U846 ( .A(n915), .Y(n507) );
  OAI21X1 U847 ( .A0(n800), .A1(n802), .B0(n803), .Y(n508) );
  AOI21X4 U848 ( .A0(n786), .A1(n509), .B0(n508), .Y(n721) );
  OAI21X4 U849 ( .A0(n721), .A1(n717), .B0(n718), .Y(n778) );
  AOI21X4 U851 ( .A0(n778), .A1(n776), .B0(n510), .Y(n818) );
  XNOR2X1 U852 ( .A(n516), .B(n515), .Y(n519) );
  OAI31X4 U853 ( .A0(n844), .A1(counter[2]), .A2(counter[1]), .B0(n518), .Y(
        n929) );
  NAND2X1 U854 ( .A(n519), .B(n929), .Y(n530) );
  NAND2X1 U855 ( .A(n611), .B(n933), .Y(n590) );
  OAI21XL U856 ( .A0(n563), .A1(n939), .B0(n952), .Y(n565) );
  NAND2X1 U857 ( .A(n605), .B(cur_state[1]), .Y(n594) );
  CLKINVX1 U858 ( .A(n926), .Y(n767) );
  NOR2X1 U859 ( .A(n958), .B(n940), .Y(n937) );
  NAND2X1 U860 ( .A(n937), .B(n954), .Y(n896) );
  INVXL U861 ( .A(n937), .Y(n526) );
  NOR2X2 U862 ( .A(n820), .B(n526), .Y(n921) );
  AO21X1 U863 ( .A0(n921), .A1(res_addr[13]), .B0(n820), .Y(n527) );
  OAI211X1 U864 ( .A0(n920), .A1(n567), .B0(n530), .C0(n529), .Y(n326) );
  XNOR2X1 U865 ( .A(n536), .B(n535), .Y(n543) );
  INVXL U866 ( .A(n537), .Y(n577) );
  NOR2XL U867 ( .A(index[0]), .B(index[1]), .Y(n692) );
  NOR2XL U868 ( .A(n941), .B(n692), .Y(n538) );
  AOI211XL U869 ( .A0(n941), .A1(n693), .B0(n597), .C0(n922), .Y(n539) );
  AO21X1 U870 ( .A0(n543), .A1(n929), .B0(n542), .Y(n337) );
  XNOR2X1 U871 ( .A(n548), .B(n547), .Y(n553) );
  OAI21XL U872 ( .A0(n737), .A1(n549), .B0(n953), .Y(n551) );
  AO21X1 U873 ( .A0(n553), .A1(n929), .B0(n552), .Y(n339) );
  XOR2X1 U874 ( .A(n590), .B(n932), .Y(n793) );
  NOR2X1 U875 ( .A(n610), .B(n875), .Y(n557) );
  OA21XL U876 ( .A0(n604), .A1(n933), .B0(n932), .Y(n555) );
  NAND2X1 U877 ( .A(n616), .B(n958), .Y(n936) );
  NOR2X1 U878 ( .A(n557), .B(n556), .Y(n866) );
  OAI222XL U879 ( .A0(n861), .A1(n793), .B0(n863), .B1(n797), .C0(n985), .C1(
        n829), .Y(n412) );
  OAI21XL U880 ( .A0(n559), .A1(n931), .B0(n558), .Y(n722) );
  OAI222XL U881 ( .A0(n861), .A1(n722), .B0(n863), .B1(n726), .C0(n1001), .C1(
        n829), .Y(n410) );
  OAI21XL U882 ( .A0(n561), .A1(n930), .B0(n563), .Y(n779) );
  XNOR2X1 U883 ( .A(n562), .B(n930), .Y(n783) );
  OAI222XL U884 ( .A0(n861), .A1(n779), .B0(n829), .B1(n988), .C0(n863), .C1(
        n783), .Y(n409) );
  XOR2X1 U885 ( .A(n563), .B(index[12]), .Y(n819) );
  OAI222XL U886 ( .A0(n861), .A1(n819), .B0(n829), .B1(n939), .C0(n863), .C1(
        n824), .Y(n408) );
  OAI222XL U887 ( .A0(n863), .A1(n567), .B0(n861), .B1(n566), .C0(n952), .C1(
        n829), .Y(n407) );
  AOI2BB1X1 U888 ( .A0N(n575), .A1N(n838), .B0(n568), .Y(n572) );
  NOR2X1 U889 ( .A(n620), .B(n569), .Y(n867) );
  AOI22XL U890 ( .A0(n869), .A1(n570), .B0(counter[1]), .B1(n867), .Y(n571) );
  OAI21XL U891 ( .A0(n572), .A1(n867), .B0(n571), .Y(n422) );
  CLKINVX1 U892 ( .A(res_di[7]), .Y(n859) );
  OAI21XL U893 ( .A0(n844), .A1(n575), .B0(n842), .Y(n576) );
  OAI22XL U894 ( .A0(n596), .A1(n859), .B0(n595), .B1(n942), .Y(n421) );
  CLKBUFX3 U895 ( .A(reset), .Y(n1006) );
  CLKBUFX3 U896 ( .A(n1006), .Y(n1010) );
  CLKBUFX3 U897 ( .A(n1006), .Y(n1007) );
  CLKBUFX3 U898 ( .A(n1006), .Y(n1008) );
  CLKBUFX3 U899 ( .A(n1006), .Y(n1009) );
  OAI21XL U900 ( .A0(index[3]), .A1(n597), .B0(n580), .Y(n711) );
  NOR2XL U901 ( .A(n577), .B(n979), .Y(n578) );
  OAI222XL U902 ( .A0(n861), .A1(n711), .B0(n863), .B1(n716), .C0(n979), .C1(
        n829), .Y(n417) );
  OA21XL U903 ( .A0(n579), .A1(n980), .B0(n583), .Y(n760) );
  AO21X1 U904 ( .A0(n980), .A1(n580), .B0(n582), .Y(n756) );
  AOI2BB2X1 U905 ( .B0(index[4]), .B1(n866), .A0N(n861), .A1N(n756), .Y(n581)
         );
  OAI21XL U906 ( .A0(n760), .A1(n863), .B0(n581), .Y(n416) );
  OAI21XL U907 ( .A0(n582), .A1(index[5]), .B0(n586), .Y(n769) );
  OAI222XL U908 ( .A0(n861), .A1(n769), .B0(n863), .B1(n774), .C0(n987), .C1(
        n829), .Y(n415) );
  OAI21XL U909 ( .A0(n585), .A1(n981), .B0(n604), .Y(n736) );
  INVXL U910 ( .A(n586), .Y(n587) );
  NAND2XL U911 ( .A(n866), .B(index[6]), .Y(n588) );
  OAI31XL U912 ( .A0(n861), .A1(n611), .A2(n738), .B0(n588), .Y(n589) );
  AO21X1 U913 ( .A0(n557), .A1(n736), .B0(n589), .Y(n414) );
  OAI21XL U914 ( .A0(n611), .A1(n933), .B0(n590), .Y(n923) );
  XOR2X1 U915 ( .A(n604), .B(n933), .Y(n919) );
  OAI222XL U916 ( .A0(n861), .A1(n923), .B0(n829), .B1(n983), .C0(n863), .C1(
        n919), .Y(n413) );
  OAI21XL U917 ( .A0(n592), .A1(index[9]), .B0(n591), .Y(n807) );
  OAI222XL U918 ( .A0(n861), .A1(n807), .B0(n829), .B1(n984), .C0(n863), .C1(
        n811), .Y(n411) );
  OAI22XL U920 ( .A0(n856), .A1(n594), .B0(n993), .B1(n620), .Y(n370) );
  CLKINVX1 U921 ( .A(res_di[3]), .Y(n847) );
  OAI22XL U922 ( .A0(n847), .A1(n594), .B0(n995), .B1(n620), .Y(n372) );
  CLKINVX1 U923 ( .A(res_di[2]), .Y(n848) );
  OAI22XL U924 ( .A0(n848), .A1(n594), .B0(n991), .B1(n620), .Y(n373) );
  CLKINVX1 U925 ( .A(res_di[1]), .Y(n849) );
  OAI22XL U926 ( .A0(n849), .A1(n594), .B0(n990), .B1(n620), .Y(n374) );
  CLKINVX1 U927 ( .A(res_di[0]), .Y(n850) );
  OAI22XL U928 ( .A0(n850), .A1(n594), .B0(n989), .B1(n620), .Y(n375) );
  CLKINVX1 U929 ( .A(res_di[4]), .Y(n851) );
  OAI22XL U930 ( .A0(n851), .A1(n594), .B0(n992), .B1(n620), .Y(n371) );
  OAI22XL U931 ( .A0(n859), .A1(n875), .B0(n994), .B1(n620), .Y(n368) );
  CLKINVX1 U932 ( .A(res_di[6]), .Y(n852) );
  OAI22XL U933 ( .A0(n852), .A1(n875), .B0(n996), .B1(n620), .Y(n369) );
  OAI22XL U934 ( .A0(n596), .A1(n851), .B0(n595), .B1(n971), .Y(n390) );
  OAI22XL U935 ( .A0(n596), .A1(n856), .B0(n595), .B1(n998), .Y(n386) );
  OAI22XL U936 ( .A0(n596), .A1(n852), .B0(n595), .B1(n967), .Y(n382) );
  OAI22XL U937 ( .A0(n596), .A1(n847), .B0(n595), .B1(n948), .Y(n394) );
  OAI22XL U938 ( .A0(n596), .A1(n848), .B0(n595), .B1(n975), .Y(n398) );
  OAI22XL U939 ( .A0(n596), .A1(n849), .B0(n595), .B1(n978), .Y(n402) );
  OAI22XL U940 ( .A0(n596), .A1(n850), .B0(n1000), .B1(n595), .Y(n406) );
  INVXL U941 ( .A(n693), .Y(n599) );
  INVXL U942 ( .A(n597), .Y(n598) );
  NAND2XL U943 ( .A(n866), .B(index[2]), .Y(n600) );
  NOR2X1 U944 ( .A(n604), .B(n603), .Y(n635) );
  INVXL U945 ( .A(n605), .Y(n607) );
  OAI211XL U946 ( .A0(n896), .A1(n608), .B0(n607), .C0(n606), .Y(nxt_state[2])
         );
  NOR2XL U947 ( .A(cur_state[2]), .B(n958), .Y(n613) );
  INVXL U948 ( .A(n875), .Y(n609) );
  MXI2X1 U949 ( .A(n615), .B(n955), .S0(n867), .Y(n423) );
  AO21X1 U950 ( .A0(n622), .A1(counter[2]), .B0(n621), .Y(n623) );
  INVXL U951 ( .A(n836), .Y(n630) );
  INVXL U952 ( .A(n625), .Y(n628) );
  NAND2XL U953 ( .A(n633), .B(n831), .Y(n627) );
  OAI22XL U954 ( .A0(n634), .A1(n633), .B0(n632), .B1(n830), .Y(n643) );
  NAND4BX1 U955 ( .AN(n643), .B(n642), .C(n641), .D(n640), .Y(nxt_state[0]) );
  MXI2X1 U956 ( .A(c[6]), .B(d[6]), .S0(n674), .Y(n691) );
  NOR2X1 U958 ( .A(n657), .B(n656), .Y(n659) );
  AOI21X1 U959 ( .A0(n660), .A1(n659), .B0(n658), .Y(n662) );
  AOI21X1 U960 ( .A0(n665), .A1(n664), .B0(n663), .Y(n667) );
  MXI2X1 U961 ( .A(a[6]), .B(b[6]), .S0(n675), .Y(n690) );
  MXI2X1 U962 ( .A(b[5]), .B(a[5]), .S0(n668), .Y(n703) );
  NOR2BX1 U963 ( .AN(n871), .B(n870), .Y(n669) );
  AOI211X1 U964 ( .A0(n874), .A1(n872), .B0(n670), .C0(n669), .Y(n672) );
  NOR2BX1 U965 ( .AN(n870), .B(n871), .Y(n671) );
  NOR2BX1 U966 ( .AN(n706), .B(n705), .Y(n676) );
  AOI211X1 U967 ( .A0(n745), .A1(n678), .B0(n677), .C0(n676), .Y(n680) );
  NOR2BX1 U968 ( .AN(n705), .B(n706), .Y(n679) );
  NOR2BX1 U969 ( .AN(n691), .B(n690), .Y(n682) );
  AOI211X1 U970 ( .A0(n704), .A1(n684), .B0(n683), .C0(n682), .Y(n687) );
  NOR2BX1 U971 ( .AN(n690), .B(n691), .Y(n686) );
  OAI22X1 U972 ( .A0(n687), .A1(n686), .B0(n685), .B1(n890), .Y(n688) );
  MXI2X1 U973 ( .A(n691), .B(n690), .S0(n439), .Y(C1_Z_6) );
  NOR2BX1 U974 ( .AN(n693), .B(n692), .Y(n862) );
  XOR2X1 U975 ( .A(n698), .B(n697), .Y(n699) );
  OAI2BB2XL U976 ( .B0(n922), .B1(n864), .A0N(n921), .A1N(res_addr[1]), .Y(
        n700) );
  MXI2X1 U977 ( .A(n704), .B(n703), .S0(n439), .Y(C1_Z_5) );
  MXI2X1 U978 ( .A(n706), .B(n705), .S0(n439), .Y(C1_Z_4) );
  INVX3 U979 ( .A(n707), .Y(n749) );
  XNOR2X1 U980 ( .A(n749), .B(n709), .Y(n710) );
  OAI21XL U981 ( .A0(n922), .A1(n711), .B0(n768), .Y(n712) );
  XOR2X1 U982 ( .A(n721), .B(n720), .Y(n728) );
  AOI21X1 U983 ( .A0(n749), .A1(n730), .B0(n729), .Y(n765) );
  XNOR2X1 U984 ( .A(n735), .B(n734), .Y(n743) );
  MXI2X1 U985 ( .A(n745), .B(n744), .S0(n439), .Y(C1_Z_3) );
  AOI21X1 U986 ( .A0(n749), .A1(n748), .B0(n747), .Y(n754) );
  XOR2X1 U987 ( .A(n754), .B(n753), .Y(n755) );
  OAI2BB2XL U988 ( .B0(n756), .B1(n922), .A0N(n937), .A1N(res_addr[4]), .Y(
        n757) );
  XOR2X1 U989 ( .A(n765), .B(n764), .Y(n766) );
  OAI21XL U990 ( .A0(n922), .A1(n769), .B0(n768), .Y(n770) );
  XNOR2X1 U991 ( .A(n778), .B(n777), .Y(n785) );
  INVX3 U992 ( .A(n786), .Y(n918) );
  XNOR2X1 U993 ( .A(n791), .B(n790), .Y(n799) );
  XNOR2X1 U994 ( .A(n806), .B(n805), .Y(n813) );
  XOR2X1 U995 ( .A(n818), .B(n817), .Y(n826) );
  OAI21XL U996 ( .A0(n557), .A1(n827), .B0(n953), .Y(n828) );
  OAI21XL U997 ( .A0(n829), .A1(n953), .B0(n828), .Y(n420) );
  OAI22XL U998 ( .A0(n832), .A1(n960), .B0(n831), .B1(n992), .Y(n363) );
  OAI22XL U999 ( .A0(n832), .A1(n963), .B0(n831), .B1(n995), .Y(n364) );
  OAI22XL U1000 ( .A0(n832), .A1(n964), .B0(n831), .B1(n993), .Y(n362) );
  OAI22XL U1001 ( .A0(n832), .A1(n938), .B0(n831), .B1(n990), .Y(n366) );
  OAI22XL U1002 ( .A0(n832), .A1(n956), .B0(n831), .B1(n991), .Y(n365) );
  OAI22XL U1003 ( .A0(n832), .A1(n961), .B0(n831), .B1(n996), .Y(n361) );
  OAI22XL U1004 ( .A0(n832), .A1(n962), .B0(n831), .B1(n994), .Y(n360) );
  OAI22XL U1005 ( .A0(n832), .A1(n959), .B0(n831), .B1(n989), .Y(n367) );
  MXI2X1 U1006 ( .A(d[0]), .B(c[0]), .S0(n833), .Y(n835) );
  MXI2X2 U1007 ( .A(n835), .B(n834), .S0(n439), .Y(C1_Z_0) );
  OAI21XL U1008 ( .A0(n844), .A1(n836), .B0(n842), .Y(n837) );
  OAI21X1 U1009 ( .A0(n839), .A1(counter[2]), .B0(n838), .Y(n846) );
  NAND2X2 U1010 ( .A(n858), .B(n846), .Y(n860) );
  OAI22XL U1011 ( .A0(n860), .A1(n856), .B0(n858), .B1(n999), .Y(n385) );
  OAI22XL U1012 ( .A0(n860), .A1(n851), .B0(n858), .B1(n970), .Y(n389) );
  OAI22XL U1013 ( .A0(n860), .A1(n847), .B0(n858), .B1(n947), .Y(n393) );
  OAI21XL U1014 ( .A0(n844), .A1(n840), .B0(n842), .Y(n841) );
  NAND2X2 U1015 ( .A(n855), .B(n846), .Y(n857) );
  OAI22XL U1016 ( .A0(n857), .A1(n847), .B0(n855), .B1(n951), .Y(n392) );
  OAI22XL U1017 ( .A0(n857), .A1(n849), .B0(n855), .B1(n950), .Y(n400) );
  OAI21XL U1018 ( .A0(n844), .A1(n843), .B0(n842), .Y(n845) );
  NAND2X2 U1019 ( .A(n853), .B(n846), .Y(n854) );
  OAI22XL U1020 ( .A0(n854), .A1(n847), .B0(n853), .B1(n946), .Y(n391) );
  OAI22XL U1021 ( .A0(n854), .A1(n850), .B0(n853), .B1(n949), .Y(n403) );
  OAI22XL U1022 ( .A0(n854), .A1(n848), .B0(n853), .B1(n974), .Y(n395) );
  OAI22XL U1023 ( .A0(n860), .A1(n848), .B0(n858), .B1(n977), .Y(n397) );
  OAI22XL U1024 ( .A0(n857), .A1(n848), .B0(n855), .B1(n976), .Y(n396) );
  OAI22XL U1025 ( .A0(n854), .A1(n849), .B0(n972), .B1(n853), .Y(n399) );
  OAI22XL U1026 ( .A0(n857), .A1(n850), .B0(n973), .B1(n855), .Y(n404) );
  OAI22XL U1027 ( .A0(n860), .A1(n849), .B0(n1003), .B1(n858), .Y(n401) );
  OAI22XL U1028 ( .A0(n854), .A1(n852), .B0(n853), .B1(n968), .Y(n379) );
  OAI22XL U1029 ( .A0(n854), .A1(n859), .B0(n853), .B1(n982), .Y(n376) );
  OAI22XL U1030 ( .A0(n857), .A1(n859), .B0(n855), .B1(n997), .Y(n377) );
  OAI22XL U1031 ( .A0(n860), .A1(n850), .B0(n858), .B1(n1002), .Y(n405) );
  OAI22XL U1032 ( .A0(n857), .A1(n851), .B0(n855), .B1(n442), .Y(n388) );
  OAI22XL U1033 ( .A0(n854), .A1(n851), .B0(n853), .B1(n441), .Y(n387) );
  OAI22XL U1034 ( .A0(n857), .A1(n852), .B0(n855), .B1(n969), .Y(n380) );
  OAI22XL U1035 ( .A0(n860), .A1(n852), .B0(n858), .B1(n966), .Y(n381) );
  OAI22XL U1036 ( .A0(n854), .A1(n856), .B0(n853), .B1(n945), .Y(n383) );
  OAI22XL U1037 ( .A0(n857), .A1(n856), .B0(n855), .B1(n944), .Y(n384) );
  OAI22XL U1038 ( .A0(n860), .A1(n859), .B0(n858), .B1(n943), .Y(n378) );
  AO22X1 U1039 ( .A0(n864), .A1(n863), .B0(n862), .B1(n861), .Y(n865) );
  NOR2XL U1040 ( .A(n867), .B(counter[0]), .Y(n868) );
  AO22X1 U1041 ( .A0(n869), .A1(n868), .B0(counter[0]), .B1(n867), .Y(n424) );
  MXI2X1 U1042 ( .A(n871), .B(n870), .S0(n439), .Y(C1_Z_2) );
  NAND2X1 U1043 ( .A(n439), .B(n872), .Y(n873) );
  NAND2BX1 U1044 ( .AN(forwardresult[5]), .B(e[5]), .Y(n887) );
  NAND2BX1 U1045 ( .AN(forwardresult[3]), .B(e[3]), .Y(n883) );
  NAND2BX1 U1046 ( .AN(forwardresult[1]), .B(e[0]), .Y(n879) );
  AOI2BB2X1 U1047 ( .B0(n881), .B1(n880), .A0N(forwardresult[2]), .A1N(n956), 
        .Y(n882) );
  AOI22X1 U1048 ( .A0(n883), .A1(n882), .B0(forwardresult[3]), .B1(n963), .Y(
        n885) );
  AOI2BB2X1 U1049 ( .B0(n885), .B1(n884), .A0N(forwardresult[4]), .A1N(n960), 
        .Y(n886) );
  NAND2X1 U1050 ( .A(forwardresult[5]), .B(n964), .Y(n888) );
  AOI2BB2X1 U1051 ( .B0(n889), .B1(n888), .A0N(forwardresult[6]), .A1N(n961), 
        .Y(n895) );
  MXI2X1 U1052 ( .A(n891), .B(n890), .S0(n439), .Y(n892) );
  XOR2X1 U1053 ( .A(DP_OP_17J1_122_7031_n1), .B(n892), .Y(n893) );
  OAI22X1 U1054 ( .A0(n910), .A1(e[6]), .B0(e[7]), .B1(n913), .Y(n894) );
  OAI22X2 U1055 ( .A0(n895), .A1(n894), .B0(n893), .B1(n962), .Y(n898) );
  INVX1 U1056 ( .A(n901), .Y(n359) );
  INVX1 U1057 ( .A(n902), .Y(n358) );
  INVX1 U1058 ( .A(n903), .Y(n357) );
  INVX1 U1059 ( .A(n905), .Y(n355) );
  INVX1 U1060 ( .A(n906), .Y(n354) );
  XOR2X1 U1061 ( .A(n918), .B(n917), .Y(n928) );
  OAI2BB2XL U1062 ( .B0(n923), .B1(n922), .A0N(n921), .A1N(res_addr[7]), .Y(
        n924) );
  AO22X1 U1064 ( .A0(n935), .A1(index[13]), .B0(sti_addr[9]), .B1(n934), .Y(
        n349) );
  AO22X1 U1065 ( .A0(n935), .A1(index[12]), .B0(sti_addr[8]), .B1(n934), .Y(
        n348) );
  AO22X1 U1066 ( .A0(n935), .A1(n930), .B0(sti_addr[7]), .B1(n934), .Y(n347)
         );
  AO22X1 U1067 ( .A0(n935), .A1(n931), .B0(sti_addr[6]), .B1(n934), .Y(n346)
         );
  AO22X1 U1068 ( .A0(n935), .A1(index[9]), .B0(sti_addr[5]), .B1(n934), .Y(
        n345) );
  AO22X1 U1069 ( .A0(n935), .A1(n932), .B0(sti_addr[4]), .B1(n934), .Y(n344)
         );
  AO22X1 U1070 ( .A0(n935), .A1(n933), .B0(sti_addr[3]), .B1(n934), .Y(n343)
         );
  AO22X1 U1071 ( .A0(n935), .A1(index[6]), .B0(sti_addr[2]), .B1(n934), .Y(
        n342) );
  AO22X1 U1072 ( .A0(n935), .A1(index[5]), .B0(sti_addr[1]), .B1(n934), .Y(
        n341) );
  AO22X1 U1073 ( .A0(cur_state[2]), .A1(n937), .B0(done), .B1(n936), .Y(n325)
         );
  CLKINVX1 U517 ( .A(n787), .Y(n916) );
  NOR2X1 U627 ( .A(n622), .B(n517), .Y(n844) );
  AND2X2 U815 ( .A(n604), .B(n453), .Y(n634) );
  OR2X1 U466 ( .A(n511), .B(index[13]), .Y(n514) );
  OR2X1 U470 ( .A(n511), .B(n930), .Y(n776) );
  OR2X1 U496 ( .A(n590), .B(n521), .Y(n591) );
  NOR2XL U513 ( .A(n978), .B(a[0]), .Y(n657) );
  INVX2 U550 ( .A(n568), .Y(n485) );
  NOR3XL U551 ( .A(n939), .B(n983), .C(n952), .Y(n446) );
  NAND2XL U574 ( .A(n495), .B(index[6]), .Y(n732) );
  BUFX2 U616 ( .A(n524), .Y(n926) );
  INVXL U631 ( .A(n558), .Y(n561) );
  INVX1 U840 ( .A(res_di[5]), .Y(n856) );
  AO22XL U850 ( .A0(n935), .A1(index[4]), .B0(sti_addr[0]), .B1(n934), .Y(n350) );
  CLKINVX3 U919 ( .A(n909), .Y(n436) );
endmodule

