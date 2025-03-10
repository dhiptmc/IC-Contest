/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Mar 10 22:46:48 2025
/////////////////////////////////////////////////////////////


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   n870, n871, n872, n873, n874, n875, n876, n877, n878, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, nxt_state_1_, done_flag,
         N348, N349, N350, N351, N352, N353, N354, N355, N356, N357, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n397, n398, n399, n400, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, intadd_0_CI, intadd_0_SUM_4_, intadd_0_SUM_3_,
         intadd_0_SUM_2_, intadd_0_SUM_1_, intadd_0_SUM_0_, intadd_0_n5,
         intadd_0_n4, intadd_0_n3, intadd_0_n2, intadd_0_n1, n451, n453, n455,
         n457, n459, n461, n465, n467, n470, n472, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719,
         n720, n721, n722, n723, n724, n725, n726, n727, n728, n729, n730,
         n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n861, n864, n865,
         n866, n867, n868, n869, n889;
  wire   [1:0] cur_state;
  wire   [3:0] counter;
  wire   [2:0] minlarge_index;
  wire   [23:0] label;
  wire   [2:0] pivot_reg;
  wire   [3:0] minlarge;
  wire   [9:0] cost_reg;

  DFFRX1 counter_reg_1_ ( .D(n392), .CK(CLK), .RN(n866), .Q(counter[1]), .QN(
        n842) );
  DFFRX1 counter_reg_2_ ( .D(n391), .CK(CLK), .RN(n866), .Q(counter[2]), .QN(
        n831) );
  DFFRX1 counter_reg_3_ ( .D(n390), .CK(CLK), .RN(n866), .Q(counter[3]) );
  DFFRX1 pivot_reg_reg_2_ ( .D(n408), .CK(CLK), .RN(n865), .Q(pivot_reg[2]) );
  DFFRX1 label_reg_0__0_ ( .D(n411), .CK(CLK), .RN(n865), .Q(label[0]), .QN(
        n858) );
  DFFRX1 label_reg_6__0_ ( .D(n424), .CK(CLK), .RN(n865), .Q(label[18]) );
  DFFRX1 pivot_reg_reg_1_ ( .D(n409), .CK(CLK), .RN(n865), .Q(pivot_reg[1]), 
        .QN(n856) );
  DFFRX1 label_reg_0__1_ ( .D(n412), .CK(CLK), .RN(n868), .Q(label[1]), .QN(
        n840) );
  DFFRX1 label_reg_0__2_ ( .D(n413), .CK(CLK), .RN(n865), .Q(label[2]), .QN(
        n843) );
  DFFRX1 minlarge_reg_2_ ( .D(n418), .CK(CLK), .RN(n865), .QN(n476) );
  DFFRX1 cost_reg_reg_2_ ( .D(N350), .CK(CLK), .RN(n868), .Q(cost_reg[2]), 
        .QN(n836) );
  DFFRX1 cost_reg_reg_3_ ( .D(N351), .CK(CLK), .RN(n868), .Q(cost_reg[3]), 
        .QN(n854) );
  DFFRX1 cost_reg_reg_4_ ( .D(N352), .CK(CLK), .RN(n868), .Q(cost_reg[4]), 
        .QN(n853) );
  DFFRX1 cost_reg_reg_5_ ( .D(N353), .CK(CLK), .RN(n868), .Q(cost_reg[5]), 
        .QN(n835) );
  DFFRX1 cost_reg_reg_6_ ( .D(N354), .CK(CLK), .RN(n865), .Q(cost_reg[6]) );
  DFFRX1 cost_reg_reg_7_ ( .D(N355), .CK(CLK), .RN(n383), .Q(cost_reg[7]), 
        .QN(n855) );
  DFFRX1 cost_reg_reg_8_ ( .D(N356), .CK(CLK), .RN(n868), .Q(cost_reg[8]), 
        .QN(n857) );
  DFFRX1 label_reg_1__1_ ( .D(n440), .CK(CLK), .RN(n868), .Q(label[4]), .QN(
        n839) );
  DFFRX1 pivot_reg_reg_0_ ( .D(n410), .CK(CLK), .RN(n866), .Q(pivot_reg[0]), 
        .QN(n828) );
  DFFRX1 label_reg_2__2_ ( .D(n438), .CK(CLK), .RN(n865), .Q(label[8]), .QN(
        n824) );
  DFFRX1 label_reg_3__2_ ( .D(n435), .CK(CLK), .RN(n868), .Q(label[11]) );
  DFFRX1 label_reg_4__0_ ( .D(n430), .CK(CLK), .RN(n865), .Q(label[12]), .QN(
        n847) );
  DFFRX1 label_reg_2__0_ ( .D(n436), .CK(CLK), .RN(n867), .Q(label[6]), .QN(
        n827) );
  DFFRX1 minlarge_reg_0_ ( .D(n420), .CK(CLK), .RN(n868), .Q(minlarge[0]), 
        .QN(n478) );
  DFFSX1 label_reg_7__2_ ( .D(n423), .CK(CLK), .SN(n867), .Q(label[23]), .QN(
        n832) );
  DFFSX1 label_reg_6__1_ ( .D(n425), .CK(CLK), .SN(n867), .Q(label[19]), .QN(
        n841) );
  DFFSX1 label_reg_1__0_ ( .D(n439), .CK(CLK), .SN(n867), .Q(label[3]), .QN(
        n852) );
  DFFSX1 label_reg_3__0_ ( .D(n433), .CK(CLK), .SN(n867), .Q(label[9]), .QN(
        n829) );
  DFFRX1 cost_reg_reg_1_ ( .D(N349), .CK(CLK), .RN(n868), .Q(cost_reg[1]), 
        .QN(n851) );
  DFFRX1 cost_reg_reg_0_ ( .D(N348), .CK(CLK), .RN(n865), .Q(cost_reg[0]), 
        .QN(n850) );
  DFFSX1 MinCost_reg_9_ ( .D(n398), .CK(CLK), .SN(n868), .Q(n880), .QN(n849)
         );
  DFFSX1 label_reg_3__1_ ( .D(n434), .CK(CLK), .SN(n867), .Q(label[10]), .QN(
        n822) );
  TLATX1 done_flag_reg ( .G(n442), .D(n443), .Q(done_flag) );
  DFFSX1 MinCost_reg_4_ ( .D(n403), .CK(CLK), .SN(n867), .Q(n884), .QN(n861)
         );
  DFFRX1 minlarge_index_reg_0_ ( .D(n416), .CK(CLK), .RN(n865), .Q(
        minlarge_index[0]), .QN(n848) );
  DFFRX1 label_reg_1__2_ ( .D(n441), .CK(CLK), .RN(n383), .Q(label[5]), .QN(
        n838) );
  ADDFXL intadd_0_U4 ( .A(Cost[4]), .B(cost_reg[4]), .CI(intadd_0_n4), .CO(
        intadd_0_n3), .S(intadd_0_SUM_2_) );
  ADDFXL intadd_0_U6 ( .A(Cost[2]), .B(cost_reg[2]), .CI(intadd_0_CI), .CO(
        intadd_0_n5), .S(intadd_0_SUM_0_) );
  DFFSX2 label_reg_7__1_ ( .D(n422), .CK(CLK), .SN(n866), .Q(label[22]), .QN(
        n869) );
  DFFSX2 cur_state_reg_0_ ( .D(n864), .CK(CLK), .SN(n865), .Q(n844), .QN(
        cur_state[0]) );
  DFFRX1 minlarge_reg_1_ ( .D(n419), .CK(CLK), .RN(n383), .Q(minlarge[1]), 
        .QN(n477) );
  DFFRX1 MatchCount_reg_1_ ( .D(n395), .CK(CLK), .RN(n868), .Q(n878), .QN(n472) );
  DFFSX1 MinCost_reg_1_ ( .D(n406), .CK(CLK), .SN(n868), .Q(n887), .QN(n470)
         );
  DFFRX1 MatchCount_reg_2_ ( .D(n394), .CK(CLK), .RN(n866), .Q(n877), .QN(n859) );
  DFFSX1 MinCost_reg_0_ ( .D(n407), .CK(CLK), .SN(n868), .Q(n888), .QN(n467)
         );
  DFFRX1 MatchCount_reg_3_ ( .D(n397), .CK(CLK), .RN(n865), .Q(n876), .QN(n465) );
  DFFSX1 MinCost_reg_5_ ( .D(n402), .CK(CLK), .SN(n867), .Q(n883), .QN(n846)
         );
  DFFSX1 MinCost_reg_8_ ( .D(n399), .CK(CLK), .SN(n867), .Q(n881), .QN(n826)
         );
  DFFRX1 W_reg_2_ ( .D(n386), .CK(CLK), .RN(n866), .Q(n870), .QN(n461) );
  DFFRX1 J_reg_0_ ( .D(n387), .CK(CLK), .RN(n866), .Q(n875), .QN(n459) );
  DFFRX1 J_reg_1_ ( .D(n388), .CK(CLK), .RN(n866), .Q(n874), .QN(n457) );
  DFFRX1 J_reg_2_ ( .D(n389), .CK(CLK), .RN(n866), .Q(n873), .QN(n455) );
  DFFRX1 W_reg_1_ ( .D(n385), .CK(CLK), .RN(n866), .Q(n871), .QN(n453) );
  DFFRX1 W_reg_0_ ( .D(n384), .CK(CLK), .RN(n866), .Q(n872), .QN(n451) );
  DFFSX1 MinCost_reg_7_ ( .D(n400), .CK(CLK), .SN(n867), .Q(n882), .QN(n834)
         );
  DFFSX1 MinCost_reg_2_ ( .D(n405), .CK(CLK), .SN(n868), .Q(n886), .QN(n845)
         );
  DFFSX1 MinCost_reg_3_ ( .D(n404), .CK(CLK), .SN(n867), .Q(n885), .QN(n833)
         );
  DFFRX2 cur_state_reg_1_ ( .D(nxt_state_1_), .CK(CLK), .RN(n865), .Q(
        cur_state[1]) );
  DFFRX1 MinCost_reg_6_ ( .D(n820), .CK(CLK), .RN(n867), .Q(n823) );
  DFFRX2 label_reg_5__1_ ( .D(n428), .CK(CLK), .RN(n383), .Q(label[16]), .QN(
        n830) );
  DFFRX2 label_reg_4__1_ ( .D(n431), .CK(CLK), .RN(n866), .Q(label[13]), .QN(
        n825) );
  DFFSX2 label_reg_5__2_ ( .D(n429), .CK(CLK), .SN(n867), .Q(label[17]), .QN(
        n837) );
  DFFRX2 minlarge_index_reg_1_ ( .D(n415), .CK(CLK), .RN(n865), .Q(
        minlarge_index[1]), .QN(n475) );
  DFFRX2 minlarge_index_reg_2_ ( .D(n414), .CK(CLK), .RN(n865), .Q(
        minlarge_index[2]), .QN(n474) );
  DFFRX1 cost_reg_reg_9_ ( .D(N357), .CK(CLK), .RN(n865), .Q(cost_reg[9]) );
  ADDFXL intadd_0_U5 ( .A(Cost[3]), .B(cost_reg[3]), .CI(intadd_0_n5), .CO(
        intadd_0_n4), .S(intadd_0_SUM_1_) );
  NOR2X1 U460 ( .A(n559), .B(n555), .Y(n556) );
  NAND2BX1 U461 ( .AN(n546), .B(n545), .Y(n559) );
  AOI222XL U462 ( .A0(label[14]), .A1(n748), .B0(label[14]), .B1(n539), .C0(
        n748), .C1(n539), .Y(n548) );
  AOI21XL U463 ( .A0(n545), .A1(n542), .B0(n546), .Y(n553) );
  AOI211XL U464 ( .A0(n799), .A1(n531), .B0(n530), .C0(minlarge[3]), .Y(n583)
         );
  INVXL U465 ( .A(n761), .Y(n759) );
  OAI2BB1X1 U466 ( .A0N(n798), .A1N(n609), .B0(n579), .Y(n580) );
  INVX1 U467 ( .A(n708), .Y(n785) );
  INVX1 U468 ( .A(n663), .Y(n789) );
  INVX1 U470 ( .A(n607), .Y(n637) );
  OAI21X1 U471 ( .A0(n578), .A1(n643), .B0(n577), .Y(n622) );
  INVX1 U474 ( .A(n731), .Y(n729) );
  INVX1 U475 ( .A(n751), .Y(n749) );
  INVX1 U476 ( .A(n766), .Y(N355) );
  INVX1 U478 ( .A(n488), .Y(n514) );
  NAND2X1 U479 ( .A(cost_reg[7]), .B(intadd_0_n1), .Y(n772) );
  INVX1 U480 ( .A(n643), .Y(n585) );
  AND2X1 U481 ( .A(n515), .B(MatchCount[0]), .Y(n762) );
  OAI2BB1X1 U482 ( .A0N(n798), .A1N(minlarge[1]), .B0(n529), .Y(n531) );
  OR2X1 U483 ( .A(n600), .B(n864), .Y(n608) );
  NAND4X2 U484 ( .A(n556), .B(n554), .C(n552), .D(n551), .Y(n615) );
  INVX1 U485 ( .A(n508), .Y(n768) );
  NAND2X1 U486 ( .A(n810), .B(n813), .Y(n513) );
  INVX2 U488 ( .A(n699), .Y(n691) );
  INVX1 U489 ( .A(n810), .Y(n815) );
  INVX2 U490 ( .A(n442), .Y(n808) );
  INVX2 U491 ( .A(n666), .Y(n664) );
  INVX2 U493 ( .A(label[18]), .Y(n739) );
  INVX2 U494 ( .A(label[11]), .Y(n748) );
  ADDFX2 U500 ( .A(Cost[6]), .B(cost_reg[6]), .CI(intadd_0_n2), .CO(
        intadd_0_n1), .S(intadd_0_SUM_4_) );
  CLKINVX1 U501 ( .A(n562), .Y(n674) );
  BUFX2 U502 ( .A(n841), .Y(n722) );
  OAI22XL U503 ( .A0(n674), .A1(n783), .B0(n838), .B1(n586), .Y(n566) );
  BUFX2 U504 ( .A(n832), .Y(n783) );
  AOI211XL U505 ( .A0(n779), .A1(label[1]), .B0(n568), .C0(n567), .Y(n572) );
  NOR2XL U506 ( .A(n674), .B(n722), .Y(n568) );
  AOI211XL U507 ( .A0(n779), .A1(label[0]), .B0(n574), .C0(n573), .Y(n578) );
  NAND2XL U508 ( .A(n608), .B(n606), .Y(n605) );
  NOR4XL U509 ( .A(n715), .B(n714), .C(n713), .D(n712), .Y(n717) );
  NOR2XL U510 ( .A(cost_reg[2]), .B(n845), .Y(n501) );
  NOR2XL U511 ( .A(n833), .B(cost_reg[3]), .Y(n490) );
  NAND2XL U512 ( .A(cost_reg[3]), .B(n833), .Y(n481) );
  NOR3XL U513 ( .A(n495), .B(n494), .C(n493), .Y(n505) );
  INVXL U514 ( .A(n490), .Y(n492) );
  NAND2XL U515 ( .A(n884), .B(n853), .Y(n491) );
  OAI22XL U516 ( .A0(n674), .A1(n869), .B0(n839), .B1(n586), .Y(n569) );
  NOR2XL U517 ( .A(n856), .B(n828), .Y(n655) );
  OAI2BB2XL U518 ( .B0(n499), .B1(n487), .A0N(n849), .A1N(cost_reg[9]), .Y(
        n510) );
  OAI2BB1XL U519 ( .A0N(cost_reg[8]), .A1N(n496), .B0(n881), .Y(n486) );
  INVXL U520 ( .A(n809), .Y(n696) );
  BUFX2 U521 ( .A(n514), .Y(n807) );
  INVXL U522 ( .A(n736), .Y(n706) );
  BUFX2 U523 ( .A(n587), .Y(n727) );
  BUFX2 U524 ( .A(n617), .Y(n744) );
  NAND3XL U525 ( .A(pivot_reg[1]), .B(n618), .C(n828), .Y(n617) );
  BUFX2 U526 ( .A(n588), .Y(n747) );
  INVXL U527 ( .A(n774), .Y(n765) );
  NOR2XL U528 ( .A(Cost[1]), .B(cost_reg[1]), .Y(n512) );
  BUFX2 U529 ( .A(n700), .Y(n774) );
  OAI21X2 U530 ( .A0(n583), .A1(n800), .B0(n810), .Y(n801) );
  NAND2X1 U531 ( .A(n810), .B(n801), .Y(n802) );
  OAI2BB2XL U532 ( .B0(n566), .B1(n565), .A0N(n564), .A1N(n563), .Y(n607) );
  NAND2XL U533 ( .A(label[2]), .B(n779), .Y(n563) );
  AOI211XL U534 ( .A0(label[20]), .A1(n562), .B0(n643), .C0(n561), .Y(n564) );
  NOR2X1 U535 ( .A(n558), .B(n562), .Y(n804) );
  NAND2XL U536 ( .A(n777), .B(n618), .Y(n612) );
  BUFX2 U537 ( .A(n619), .Y(n732) );
  NAND2XL U538 ( .A(n618), .B(n655), .Y(n619) );
  NAND2X1 U539 ( .A(n556), .B(n615), .Y(n805) );
  NOR2BX1 U540 ( .AN(cur_state[1]), .B(cur_state[0]), .Y(n705) );
  AOI21XL U541 ( .A0(n767), .A1(n510), .B0(n509), .Y(n511) );
  OAI2BB1XL U542 ( .A0N(cur_state[1]), .A1N(n872), .B0(n809), .Y(n384) );
  BUFX2 U543 ( .A(n513), .Y(n864) );
  AOI211XL U544 ( .A0(cost_reg[9]), .A1(n775), .B0(n774), .C0(n773), .Y(N357)
         );
  NOR2XL U545 ( .A(cost_reg[9]), .B(n775), .Y(n773) );
  INVXL U546 ( .A(n701), .Y(N348) );
  OAI211XL U547 ( .A0(cost_reg[0]), .A1(Cost[0]), .B0(n702), .C0(n765), .Y(
        n701) );
  NOR2XL U548 ( .A(Cost[1]), .B(n704), .Y(n703) );
  NOR3XL U549 ( .A(n669), .B(n668), .C(n667), .Y(n671) );
  AOI22XL U550 ( .A0(n731), .A1(n730), .B0(n729), .B1(n728), .Y(n432) );
  AOI32XL U551 ( .A0(n724), .A1(n742), .A2(n723), .B0(n740), .B1(n722), .Y(
        n425) );
  AOI211XL U552 ( .A0(label[22]), .A1(n736), .B0(n721), .C0(n720), .Y(n724) );
  NOR4XL U553 ( .A(n641), .B(n640), .C(n639), .D(n638), .Y(n642) );
  AOI22XL U554 ( .A0(n761), .A1(n760), .B0(n759), .B1(n824), .Y(n438) );
  AOI211XL U555 ( .A0(n857), .A1(n772), .B0(n775), .C0(n774), .Y(N356) );
  OAI211XL U556 ( .A0(cost_reg[7]), .A1(intadd_0_n1), .B0(n765), .C0(n772), 
        .Y(n766) );
  INVXL U557 ( .A(n609), .Y(n593) );
  AOI32XL U558 ( .A0(n743), .A1(n742), .A2(n741), .B0(n740), .B1(n739), .Y(
        n424) );
  INVXL U559 ( .A(n622), .Y(n598) );
  NOR2X2 U560 ( .A(n808), .B(n510), .Y(n488) );
  AOI211XL U561 ( .A0(n786), .A1(n747), .B0(n661), .C0(n660), .Y(n662) );
  AOI211XL U562 ( .A0(n786), .A1(n727), .B0(n629), .C0(n628), .Y(n630) );
  INVXL U563 ( .A(n786), .Y(n710) );
  AOI211XL U564 ( .A0(n791), .A1(n747), .B0(n658), .C0(n657), .Y(n659) );
  AOI211XL U565 ( .A0(n791), .A1(n727), .B0(n632), .C0(n631), .Y(n633) );
  INVXL U566 ( .A(n791), .Y(n665) );
  AOI211XL U567 ( .A0(n781), .A1(n727), .B0(n726), .C0(n725), .Y(n730) );
  AOI211XL U568 ( .A0(n781), .A1(n747), .B0(n746), .C0(n745), .Y(n750) );
  INVXL U569 ( .A(n781), .Y(n680) );
  NOR3X1 U570 ( .A(n474), .B(n848), .C(minlarge_index[1]), .Y(n666) );
  NAND2X2 U571 ( .A(n842), .B(counter[2]), .Y(n682) );
  NAND2X2 U572 ( .A(n560), .B(n559), .Y(n644) );
  OAI211XL U573 ( .A0(n819), .A1(n869), .B0(n521), .C0(n520), .Y(n695) );
  OAI211XL U574 ( .A0(n819), .A1(n783), .B0(n517), .C0(n516), .Y(n688) );
  NAND2X2 U575 ( .A(counter[1]), .B(counter[2]), .Y(n819) );
  NOR2X2 U576 ( .A(cur_state[1]), .B(n844), .Y(n442) );
  AOI222X1 U577 ( .A0(label[17]), .A1(n728), .B0(label[17]), .B1(n533), .C0(
        n728), .C1(n533), .Y(n545) );
  NOR2XL U578 ( .A(n674), .B(n739), .Y(n574) );
  INVX12 U579 ( .A(n823), .Y(MinCost[6]) );
  NAND2XL U580 ( .A(n693), .B(label[11]), .Y(n516) );
  NAND2XL U581 ( .A(n693), .B(label[10]), .Y(n520) );
  NAND2XL U582 ( .A(n693), .B(label[9]), .Y(n524) );
  INVX16 U583 ( .A(n861), .Y(MinCost[4]) );
  OAI22XL U584 ( .A0(label[12]), .A1(n532), .B0(label[13]), .B1(n830), .Y(n533) );
  OAI22XL U585 ( .A0(n609), .A1(n798), .B0(n797), .B1(n622), .Y(n579) );
  OAI22X1 U586 ( .A0(n814), .A1(n684), .B0(n528), .B1(n527), .Y(n797) );
  AOI222X4 U587 ( .A0(n779), .A1(n778), .B0(n806), .B1(n792), .C0(n777), .C1(
        n776), .Y(n796) );
  INVXL U588 ( .A(n803), .Y(n778) );
  NOR2X2 U589 ( .A(cur_state[1]), .B(cur_state[0]), .Y(n810) );
  OA22X1 U591 ( .A0(n488), .A1(n515), .B0(MatchCount[0]), .B1(n768), .Y(n767)
         );
  INVX12 U592 ( .A(n833), .Y(MinCost[3]) );
  INVX12 U593 ( .A(n845), .Y(MinCost[2]) );
  OAI22XL U594 ( .A0(n886), .A1(n836), .B0(n885), .B1(n854), .Y(n494) );
  INVX12 U595 ( .A(n834), .Y(MinCost[7]) );
  NAND2XL U596 ( .A(n882), .B(n855), .Y(n496) );
  INVX12 U597 ( .A(n451), .Y(W[0]) );
  INVX12 U598 ( .A(n453), .Y(W[1]) );
  INVX12 U599 ( .A(n455), .Y(J[2]) );
  OAI211XL U600 ( .A0(n808), .A1(n843), .B0(n690), .C0(n689), .Y(n389) );
  INVX12 U601 ( .A(n457), .Y(J[1]) );
  OAI211XL U602 ( .A0(n808), .A1(n840), .B0(n698), .C0(n697), .Y(n388) );
  INVX12 U603 ( .A(n459), .Y(J[0]) );
  INVX12 U604 ( .A(n461), .Y(W[2]) );
  INVX12 U605 ( .A(n826), .Y(MinCost[8]) );
  AOI211XL U606 ( .A0(n881), .A1(n857), .B0(n507), .C0(n506), .Y(n508) );
  INVX12 U607 ( .A(n846), .Y(MinCost[5]) );
  NOR2XL U608 ( .A(n883), .B(n835), .Y(n483) );
  OAI22XL U609 ( .A0(n883), .A1(n835), .B0(MinCost[4]), .B1(n853), .Y(n493) );
  INVX12 U610 ( .A(n465), .Y(MatchCount[3]) );
  OAI31XL U611 ( .A0(n859), .A1(n876), .A2(n771), .B0(n764), .Y(n397) );
  NAND2XL U612 ( .A(n876), .B(n763), .Y(n764) );
  INVX16 U613 ( .A(n467), .Y(MinCost[0]) );
  NAND2XL U614 ( .A(n850), .B(n888), .Y(n502) );
  OAI211XL U615 ( .A0(MinCost[0]), .A1(n850), .B0(n505), .C0(n504), .Y(n506)
         );
  INVX12 U616 ( .A(n859), .Y(MatchCount[2]) );
  OAI21XL U617 ( .A0(n877), .A1(n771), .B0(n770), .Y(n394) );
  NAND2XL U618 ( .A(n877), .B(n769), .Y(n770) );
  INVX16 U619 ( .A(n470), .Y(MinCost[1]) );
  NAND2XL U620 ( .A(n887), .B(n851), .Y(n498) );
  OAI211XL U621 ( .A0(MinCost[1]), .A1(n851), .B0(n492), .C0(n491), .Y(n507)
         );
  INVX12 U622 ( .A(n472), .Y(MatchCount[1]) );
  NAND2XL U623 ( .A(n878), .B(n762), .Y(n771) );
  AOI32XL U624 ( .A0(n878), .A1(n767), .A2(n877), .B0(n768), .B1(n767), .Y(
        n763) );
  OAI21XL U625 ( .A0(n768), .A1(n878), .B0(n767), .Y(n769) );
  NOR2XL U626 ( .A(n887), .B(n851), .Y(n479) );
  AOI211XL U627 ( .A0(n498), .A1(n502), .B0(n479), .C0(n494), .Y(n480) );
  AOI211XL U628 ( .A0(n501), .A1(n481), .B0(n490), .C0(n480), .Y(n482) );
  OAI22XL U629 ( .A0(n483), .A1(n491), .B0(n482), .B1(n493), .Y(n484) );
  OAI21XL U630 ( .A0(n495), .A1(n484), .B0(n503), .Y(n485) );
  NAND3XL U631 ( .A(pivot_reg[0]), .B(n618), .C(n856), .Y(n611) );
  OAI211XL U632 ( .A0(cost_reg[8]), .A1(n496), .B0(n486), .C0(n485), .Y(n487)
         );
  NOR3XL U633 ( .A(n515), .B(n488), .C(MatchCount[0]), .Y(n509) );
  NOR2X1 U634 ( .A(n768), .B(n808), .Y(n515) );
  AOI211XL U635 ( .A0(n781), .A1(n664), .B0(n651), .C0(n650), .Y(n652) );
  AOI211XL U636 ( .A0(label[23]), .A1(n736), .B0(n678), .C0(n677), .Y(n679) );
  OAI211XL U637 ( .A0(n819), .A1(n794), .B0(n525), .C0(n524), .Y(n684) );
  OAI2BB2XL U638 ( .B0(n702), .B1(n512), .A0N(Cost[1]), .A1N(cost_reg[1]), .Y(
        intadd_0_CI) );
  OAI21X1 U639 ( .A0(n572), .A1(n643), .B0(n571), .Y(n609) );
  NOR3XL U640 ( .A(n648), .B(n647), .C(n646), .Y(n649) );
  NOR4XL U641 ( .A(n626), .B(n625), .C(n624), .D(n623), .Y(n627) );
  AOI22XL U642 ( .A0(n718), .A1(n717), .B0(n716), .B1(n869), .Y(n422) );
  OAI211XL U643 ( .A0(n808), .A1(n858), .B0(n686), .C0(n685), .Y(n387) );
  AOI211XL U644 ( .A0(Cost[1]), .A1(n704), .B0(n774), .C0(n703), .Y(N349) );
  AOI22XL U645 ( .A0(n751), .A1(n750), .B0(n749), .B1(n748), .Y(n435) );
  NOR2XL U646 ( .A(n849), .B(cost_reg[9]), .Y(n499) );
  OAI22XL U647 ( .A0(cost_reg[6]), .A1(n823), .B0(cost_reg[5]), .B1(n846), .Y(
        n495) );
  AOI222XL U648 ( .A0(cost_reg[7]), .A1(n834), .B0(cost_reg[8]), .B1(n826), 
        .C0(cost_reg[6]), .C1(n823), .Y(n503) );
  OAI2BB2XL U649 ( .B0(n488), .B1(n823), .A0N(n488), .A1N(cost_reg[6]), .Y(
        n489) );
  INVXL U650 ( .A(n489), .Y(n820) );
  NAND2XL U651 ( .A(cost_reg[9]), .B(n849), .Y(n497) );
  NAND4BX1 U652 ( .AN(n499), .B(n498), .C(n497), .D(n496), .Y(n500) );
  NOR4BBX1 U653 ( .AN(n503), .BN(n502), .C(n501), .D(n500), .Y(n504) );
  INVXL U654 ( .A(n511), .Y(n821) );
  NAND2X1 U655 ( .A(cost_reg[0]), .B(Cost[0]), .Y(n702) );
  OAI2BB2XL U656 ( .B0(n807), .B1(n850), .A0N(n807), .A1N(MinCost[0]), .Y(n407) );
  OAI2BB2XL U657 ( .B0(n807), .B1(n851), .A0N(n807), .A1N(MinCost[1]), .Y(n406) );
  AOI2BB2X1 U658 ( .B0(n878), .B1(n767), .A0N(n878), .A1N(n762), .Y(n395) );
  AOI2BB2X1 U659 ( .B0(n691), .B1(label[5]), .A0N(n682), .A1N(n837), .Y(n517)
         );
  NAND2X1 U660 ( .A(n831), .B(counter[1]), .Y(n526) );
  CLKINVX1 U661 ( .A(n526), .Y(n693) );
  OAI22XL U663 ( .A0(n819), .A1(n754), .B0(n682), .B1(n728), .Y(n519) );
  OAI21XL U664 ( .A0(n526), .A1(n824), .B0(n814), .Y(n518) );
  OAI22X1 U665 ( .A0(n814), .A1(n688), .B0(n519), .B1(n518), .Y(n799) );
  AOI2BB2X1 U666 ( .B0(n691), .B1(label[4]), .A0N(n682), .A1N(n830), .Y(n521)
         );
  OAI22XL U667 ( .A0(n819), .A1(n722), .B0(n682), .B1(n825), .Y(n523) );
  OAI21XL U668 ( .A0(n526), .A1(n719), .B0(n814), .Y(n522) );
  OAI22X1 U669 ( .A0(n814), .A1(n695), .B0(n523), .B1(n522), .Y(n798) );
  AOI2BB2X1 U670 ( .B0(n691), .B1(label[3]), .A0N(n682), .A1N(n733), .Y(n525)
         );
  OAI22XL U671 ( .A0(n819), .A1(n739), .B0(n682), .B1(n847), .Y(n528) );
  OAI21XL U672 ( .A0(n526), .A1(n827), .B0(n814), .Y(n527) );
  OAI211XL U673 ( .A0(minlarge[1]), .A1(n798), .B0(n797), .C0(minlarge[0]), 
        .Y(n529) );
  AOI2BB1X1 U674 ( .A0N(n531), .A1N(n799), .B0(n476), .Y(n530) );
  OAI21XL U675 ( .A0(label[16]), .A1(n825), .B0(label[15]), .Y(n532) );
  OAI21XL U676 ( .A0(label[7]), .A1(n839), .B0(label[6]), .Y(n534) );
  OAI22XL U677 ( .A0(label[4]), .A1(n719), .B0(label[3]), .B1(n534), .Y(n535)
         );
  AOI222X1 U678 ( .A0(label[8]), .A1(n838), .B0(label[8]), .B1(n535), .C0(n838), .C1(n535), .Y(n551) );
  AOI2BB2X1 U679 ( .B0(label[10]), .B1(n719), .A0N(n829), .A1N(label[6]), .Y(
        n537) );
  OAI22XL U680 ( .A0(label[10]), .A1(n719), .B0(label[11]), .B1(n824), .Y(n536) );
  OAI22XL U681 ( .A0(label[8]), .A1(n748), .B0(n537), .B1(n536), .Y(n547) );
  OAI21XL U682 ( .A0(label[13]), .A1(n822), .B0(label[12]), .Y(n538) );
  OAI22XL U683 ( .A0(label[10]), .A1(n825), .B0(label[9]), .B1(n538), .Y(n539)
         );
  OAI21XL U684 ( .A0(n551), .A1(n547), .B0(n548), .Y(n542) );
  AOI2BB2X1 U685 ( .B0(n733), .B1(label[18]), .A0N(label[16]), .A1N(n722), .Y(
        n541) );
  OAI22XL U686 ( .A0(label[20]), .A1(n837), .B0(label[19]), .B1(n830), .Y(n540) );
  OAI22XL U687 ( .A0(n541), .A1(n540), .B0(label[17]), .B1(n754), .Y(n546) );
  AOI2BB2X1 U688 ( .B0(label[22]), .B1(n722), .A0N(n794), .A1N(label[18]), .Y(
        n544) );
  OAI22XL U689 ( .A0(label[22]), .A1(n722), .B0(label[23]), .B1(n754), .Y(n543) );
  OAI22X1 U690 ( .A0(label[20]), .A1(n783), .B0(n544), .B1(n543), .Y(n555) );
  NOR2BX1 U691 ( .AN(n548), .B(n547), .Y(n554) );
  OAI21XL U692 ( .A0(label[4]), .A1(n840), .B0(label[3]), .Y(n549) );
  OAI22XL U693 ( .A0(label[0]), .A1(n549), .B0(label[1]), .B1(n839), .Y(n550)
         );
  AOI222XL U694 ( .A0(label[5]), .A1(n843), .B0(label[5]), .B1(n550), .C0(n843), .C1(n550), .Y(n552) );
  OAI21X2 U695 ( .A0(n553), .A1(n555), .B0(n615), .Y(n643) );
  NOR2X1 U696 ( .A(n554), .B(n559), .Y(n558) );
  CLKINVX1 U697 ( .A(n555), .Y(n560) );
  NAND2X2 U698 ( .A(n560), .B(n615), .Y(n562) );
  AOI222XL U699 ( .A0(counter[1]), .A1(n585), .B0(counter[1]), .B1(n804), .C0(
        n585), .C1(n804), .Y(n557) );
  AOI222XL U700 ( .A0(n557), .A1(n805), .B0(n557), .B1(n831), .C0(n805), .C1(
        n831), .Y(n582) );
  NOR2BX4 U701 ( .AN(n804), .B(n805), .Y(n779) );
  CLKINVX1 U702 ( .A(n779), .Y(n586) );
  NAND2X2 U703 ( .A(n560), .B(n558), .Y(n654) );
  OAI22XL U704 ( .A0(n748), .A1(n654), .B0(n837), .B1(n644), .Y(n565) );
  OAI22XL U705 ( .A0(n824), .A1(n654), .B0(n728), .B1(n644), .Y(n561) );
  OAI22XL U706 ( .A0(n719), .A1(n654), .B0(n825), .B1(n644), .Y(n567) );
  OAI22XL U707 ( .A0(n822), .A1(n654), .B0(n830), .B1(n644), .Y(n570) );
  OAI21X1 U708 ( .A0(n570), .A1(n569), .B0(n643), .Y(n571) );
  OAI22XL U709 ( .A0(n827), .A1(n654), .B0(n847), .B1(n644), .Y(n573) );
  OAI22XL U710 ( .A0(n829), .A1(n654), .B0(n733), .B1(n644), .Y(n576) );
  OAI22XL U711 ( .A0(n674), .A1(n794), .B0(n852), .B1(n586), .Y(n575) );
  OAI21X1 U712 ( .A0(n576), .A1(n575), .B0(n643), .Y(n577) );
  AOI222XL U713 ( .A0(n637), .A1(n580), .B0(n637), .B1(n799), .C0(n580), .C1(
        n799), .Y(n581) );
  OAI21X1 U714 ( .A0(counter[3]), .A1(n582), .B0(n581), .Y(n800) );
  NOR2X1 U715 ( .A(n814), .B(n815), .Y(n812) );
  OAI2BB2XL U716 ( .B0(n801), .B1(n848), .A0N(n801), .A1N(n812), .Y(n416) );
  NAND2X1 U717 ( .A(n814), .B(n810), .Y(n809) );
  AOI2BB2X1 U718 ( .B0(n693), .B1(n812), .A0N(n682), .A1N(n815), .Y(n811) );
  NAND2XL U719 ( .A(cur_state[1]), .B(n870), .Y(n584) );
  OAI211XL U720 ( .A0(n809), .A1(n831), .B0(n811), .C0(n584), .Y(n386) );
  NAND3X1 U721 ( .A(n475), .B(n474), .C(n848), .Y(n600) );
  CLKINVX1 U722 ( .A(n864), .Y(n806) );
  NAND2X1 U723 ( .A(n585), .B(n806), .Y(n673) );
  OR2X1 U724 ( .A(n673), .B(n586), .Y(n606) );
  NOR3X1 U725 ( .A(n475), .B(n474), .C(n848), .Y(n711) );
  CLKINVX1 U726 ( .A(n711), .Y(n709) );
  OAI22XL U727 ( .A0(n869), .A1(n709), .B0(n840), .B1(n600), .Y(n592) );
  NAND3XL U728 ( .A(minlarge_index[2]), .B(n475), .C(n848), .Y(n587) );
  NOR3X1 U729 ( .A(n474), .B(n475), .C(minlarge_index[0]), .Y(n738) );
  CLKINVX1 U730 ( .A(n738), .Y(n737) );
  OAI22XL U731 ( .A0(n825), .A1(n727), .B0(n722), .B1(n737), .Y(n591) );
  NOR3X1 U732 ( .A(n475), .B(minlarge_index[2]), .C(minlarge_index[0]), .Y(
        n758) );
  CLKINVX1 U733 ( .A(n758), .Y(n757) );
  OAI22XL U734 ( .A0(n830), .A1(n664), .B0(n719), .B1(n757), .Y(n590) );
  NAND3XL U735 ( .A(minlarge_index[1]), .B(minlarge_index[0]), .C(n474), .Y(
        n588) );
  NAND3X1 U736 ( .A(n475), .B(n474), .C(minlarge_index[0]), .Y(n790) );
  OAI22XL U737 ( .A0(n822), .A1(n747), .B0(n839), .B1(n790), .Y(n589) );
  NOR4X1 U738 ( .A(n592), .B(n591), .C(n590), .D(n589), .Y(n610) );
  OAI222XL U739 ( .A0(n608), .A1(n593), .B0(n606), .B1(n610), .C0(n840), .C1(
        n605), .Y(n412) );
  OAI22XL U740 ( .A0(n794), .A1(n709), .B0(n858), .B1(n600), .Y(n597) );
  OAI22XL U741 ( .A0(n847), .A1(n727), .B0(n739), .B1(n737), .Y(n596) );
  OAI22XL U742 ( .A0(n733), .A1(n664), .B0(n827), .B1(n757), .Y(n595) );
  OAI22XL U743 ( .A0(n829), .A1(n747), .B0(n852), .B1(n790), .Y(n594) );
  NOR4X1 U744 ( .A(n597), .B(n596), .C(n595), .D(n594), .Y(n621) );
  OAI222XL U745 ( .A0(n608), .A1(n598), .B0(n606), .B1(n621), .C0(n858), .C1(
        n605), .Y(n411) );
  CLKINVX1 U746 ( .A(n812), .Y(n818) );
  OAI22XL U747 ( .A0(counter[1]), .A1(n818), .B0(n842), .B1(n809), .Y(n599) );
  AO21X1 U748 ( .A0(cur_state[1]), .A1(n871), .B0(n599), .Y(n385) );
  OAI22XL U749 ( .A0(n783), .A1(n709), .B0(n843), .B1(n600), .Y(n604) );
  OAI22XL U750 ( .A0(n728), .A1(n727), .B0(n754), .B1(n737), .Y(n603) );
  OAI22XL U751 ( .A0(n837), .A1(n664), .B0(n824), .B1(n757), .Y(n602) );
  OAI22XL U752 ( .A0(n748), .A1(n747), .B0(n838), .B1(n790), .Y(n601) );
  NOR4X1 U753 ( .A(n604), .B(n603), .C(n602), .D(n601), .Y(n636) );
  OAI222XL U754 ( .A0(n608), .A1(n607), .B0(n606), .B1(n636), .C0(n843), .C1(
        n605), .Y(n413) );
  NOR2X1 U755 ( .A(pivot_reg[2]), .B(n808), .Y(n776) );
  CLKINVX1 U756 ( .A(n776), .Y(n656) );
  OAI222X1 U757 ( .A0(n757), .A1(n864), .B0(n656), .B1(pivot_reg[1]), .C0(n654), .C1(n673), .Y(n761) );
  NAND2X1 U758 ( .A(n844), .B(n609), .Y(n708) );
  NOR2X1 U759 ( .A(cur_state[0]), .B(n610), .Y(n786) );
  NOR2X1 U760 ( .A(pivot_reg[2]), .B(n844), .Y(n618) );
  CLKBUFX3 U761 ( .A(n611), .Y(n755) );
  NOR2X1 U762 ( .A(pivot_reg[1]), .B(pivot_reg[0]), .Y(n777) );
  CLKBUFX3 U763 ( .A(n612), .Y(n753) );
  OAI22XL U764 ( .A0(n869), .A1(n755), .B0(n722), .B1(n753), .Y(n613) );
  AOI221XL U765 ( .A0(n785), .A1(n758), .B0(n786), .B1(n757), .C0(n613), .Y(
        n614) );
  OAI22XL U766 ( .A0(n759), .A1(n614), .B0(n761), .B1(n719), .Y(n437) );
  NOR2X1 U767 ( .A(pivot_reg[1]), .B(n808), .Y(n676) );
  AO21X1 U768 ( .A0(n615), .A1(n709), .B0(n864), .Y(n616) );
  NAND3BX1 U769 ( .AN(n676), .B(n656), .C(n616), .Y(n718) );
  OAI22XL U770 ( .A0(n852), .A1(n753), .B0(n827), .B1(n755), .Y(n626) );
  OAI22XL U771 ( .A0(n829), .A1(n744), .B0(n847), .B1(n732), .Y(n625) );
  NAND3X1 U772 ( .A(cur_state[0]), .B(pivot_reg[2]), .C(n828), .Y(n707) );
  NAND2XL U773 ( .A(cur_state[0]), .B(pivot_reg[2]), .Y(n620) );
  NOR2X1 U774 ( .A(n828), .B(n620), .Y(n736) );
  OAI22XL U775 ( .A0(n733), .A1(n707), .B0(n739), .B1(n706), .Y(n624) );
  NOR2X1 U776 ( .A(cur_state[0]), .B(n621), .Y(n791) );
  NAND2X1 U777 ( .A(n844), .B(n622), .Y(n663) );
  OAI22XL U778 ( .A0(n711), .A1(n665), .B0(n709), .B1(n663), .Y(n623) );
  OAI22XL U779 ( .A0(n716), .A1(n627), .B0(n718), .B1(n794), .Y(n421) );
  OAI222X1 U780 ( .A0(n727), .A1(n864), .B0(n656), .B1(n777), .C0(n644), .C1(
        n673), .Y(n731) );
  OAI22XL U781 ( .A0(n869), .A1(n732), .B0(n830), .B1(n755), .Y(n629) );
  OAI22XL U782 ( .A0(n722), .A1(n744), .B0(n727), .B1(n708), .Y(n628) );
  OAI22XL U783 ( .A0(n729), .A1(n630), .B0(n731), .B1(n825), .Y(n431) );
  OAI22XL U784 ( .A0(n794), .A1(n732), .B0(n733), .B1(n755), .Y(n632) );
  OAI22XL U785 ( .A0(n739), .A1(n744), .B0(n727), .B1(n663), .Y(n631) );
  OAI22XL U786 ( .A0(n729), .A1(n633), .B0(n731), .B1(n847), .Y(n430) );
  OAI22XL U787 ( .A0(n794), .A1(n755), .B0(n739), .B1(n753), .Y(n634) );
  AOI221XL U788 ( .A0(n789), .A1(n758), .B0(n791), .B1(n757), .C0(n634), .Y(
        n635) );
  OAI22XL U789 ( .A0(n759), .A1(n635), .B0(n761), .B1(n827), .Y(n436) );
  OAI22XL U790 ( .A0(n838), .A1(n753), .B0(n824), .B1(n755), .Y(n641) );
  OAI22XL U791 ( .A0(n748), .A1(n744), .B0(n728), .B1(n732), .Y(n640) );
  OAI22XL U792 ( .A0(n837), .A1(n707), .B0(n754), .B1(n706), .Y(n639) );
  NOR2X1 U793 ( .A(cur_state[0]), .B(n636), .Y(n781) );
  NAND2X1 U794 ( .A(n844), .B(n637), .Y(n752) );
  OAI21XL U795 ( .A0(n711), .A1(n680), .B0(n752), .Y(n638) );
  OAI22XL U796 ( .A0(n716), .A1(n642), .B0(n718), .B1(n783), .Y(n423) );
  NAND2X1 U797 ( .A(n643), .B(n806), .Y(n803) );
  OAI22XL U798 ( .A0(n644), .A1(n803), .B0(n864), .B1(n664), .Y(n645) );
  AOI221X1 U799 ( .A0(n776), .A1(pivot_reg[0]), .B0(n676), .B1(n828), .C0(n645), .Y(n672) );
  OAI22XL U800 ( .A0(n869), .A1(n707), .B0(n722), .B1(n732), .Y(n648) );
  OAI22XL U801 ( .A0(n822), .A1(n753), .B0(n825), .B1(n755), .Y(n647) );
  OAI22XL U802 ( .A0(n666), .A1(n710), .B0(n664), .B1(n708), .Y(n646) );
  OAI22XL U803 ( .A0(n672), .A1(n649), .B0(n670), .B1(n830), .Y(n428) );
  INVX1 U804 ( .A(RST), .Y(n383) );
  CLKBUFX3 U805 ( .A(n383), .Y(n868) );
  CLKBUFX3 U806 ( .A(n868), .Y(n867) );
  CLKBUFX3 U807 ( .A(n868), .Y(n865) );
  CLKBUFX3 U808 ( .A(n868), .Y(n866) );
  OAI22XL U809 ( .A0(n783), .A1(n707), .B0(n754), .B1(n732), .Y(n651) );
  OAI22XL U810 ( .A0(n748), .A1(n753), .B0(n728), .B1(n755), .Y(n650) );
  OAI21XL U811 ( .A0(n664), .A1(n752), .B0(n652), .Y(n653) );
  OA22X1 U812 ( .A0(n670), .A1(label[17]), .B0(n672), .B1(n653), .Y(n429) );
  OAI222X1 U813 ( .A0(n747), .A1(n864), .B0(n656), .B1(n655), .C0(n654), .C1(
        n803), .Y(n751) );
  OAI22XL U814 ( .A0(n794), .A1(n744), .B0(n739), .B1(n755), .Y(n658) );
  OAI22XL U815 ( .A0(n733), .A1(n753), .B0(n747), .B1(n663), .Y(n657) );
  OAI22XL U816 ( .A0(n749), .A1(n659), .B0(n751), .B1(n829), .Y(n433) );
  OAI22XL U817 ( .A0(n869), .A1(n744), .B0(n722), .B1(n755), .Y(n661) );
  OAI22XL U818 ( .A0(n830), .A1(n753), .B0(n747), .B1(n708), .Y(n660) );
  OAI22XL U819 ( .A0(n749), .A1(n662), .B0(n751), .B1(n822), .Y(n434) );
  OAI22XL U820 ( .A0(n794), .A1(n707), .B0(n739), .B1(n732), .Y(n669) );
  OAI22XL U821 ( .A0(n829), .A1(n753), .B0(n847), .B1(n755), .Y(n668) );
  OAI22XL U822 ( .A0(n666), .A1(n665), .B0(n664), .B1(n663), .Y(n667) );
  OAI22XL U823 ( .A0(n672), .A1(n671), .B0(n670), .B1(n733), .Y(n427) );
  OAI22XL U824 ( .A0(n488), .A1(n826), .B0(n807), .B1(n857), .Y(n399) );
  OAI22XL U825 ( .A0(n674), .A1(n673), .B0(n737), .B1(n864), .Y(n675) );
  AOI211X1 U826 ( .A0(pivot_reg[0]), .A1(n676), .B0(n776), .C0(n675), .Y(n740)
         );
  OAI22XL U827 ( .A0(n837), .A1(n732), .B0(n824), .B1(n753), .Y(n678) );
  OAI22XL U828 ( .A0(n748), .A1(n755), .B0(n728), .B1(n744), .Y(n677) );
  OAI221XL U829 ( .A0(n738), .A1(n680), .B0(n737), .B1(n752), .C0(n679), .Y(
        n681) );
  OA22X1 U830 ( .A0(n742), .A1(label[20]), .B0(n740), .B1(n681), .Y(n426) );
  OAI22XL U831 ( .A0(n488), .A1(n846), .B0(n807), .B1(n835), .Y(n402) );
  OAI22XL U832 ( .A0(n488), .A1(n845), .B0(n807), .B1(n836), .Y(n405) );
  OAI22XL U833 ( .A0(n488), .A1(n833), .B0(n807), .B1(n854), .Y(n404) );
  OAI22XL U834 ( .A0(n488), .A1(n834), .B0(n807), .B1(n855), .Y(n400) );
  INVXL U835 ( .A(n682), .Y(n692) );
  AOI222XL U836 ( .A0(n693), .A1(label[12]), .B0(n692), .B1(label[18]), .C0(
        n691), .C1(label[6]), .Y(n683) );
  AOI2BB2X1 U837 ( .B0(n696), .B1(n684), .A0N(n683), .A1N(n818), .Y(n686) );
  NAND2XL U838 ( .A(cur_state[1]), .B(n875), .Y(n685) );
  AOI222XL U839 ( .A0(n693), .A1(label[14]), .B0(n692), .B1(label[20]), .C0(
        n691), .C1(label[8]), .Y(n687) );
  AOI2BB2X1 U840 ( .B0(n696), .B1(n688), .A0N(n687), .A1N(n818), .Y(n690) );
  NAND2XL U841 ( .A(cur_state[1]), .B(n873), .Y(n689) );
  AOI222XL U842 ( .A0(n693), .A1(label[13]), .B0(n692), .B1(label[19]), .C0(
        n691), .C1(label[7]), .Y(n694) );
  AOI2BB2X1 U843 ( .B0(n696), .B1(n695), .A0N(n694), .A1N(n818), .Y(n698) );
  NAND2XL U844 ( .A(cur_state[1]), .B(n874), .Y(n697) );
  NOR3XL U845 ( .A(counter[0]), .B(counter[3]), .C(n699), .Y(n700) );
  INVX12 U846 ( .A(n849), .Y(MinCost[9]) );
  OAI2BB2XL U847 ( .B0(cost_reg[1]), .B1(n702), .A0N(cost_reg[1]), .A1N(n702), 
        .Y(n704) );
  NOR2BX1 U848 ( .AN(intadd_0_SUM_0_), .B(n774), .Y(N350) );
  BUFX12 U849 ( .A(n705), .Y(Valid) );
  NOR2BX1 U850 ( .AN(intadd_0_SUM_1_), .B(n774), .Y(N351) );
  NOR2BX1 U851 ( .AN(intadd_0_SUM_2_), .B(n774), .Y(N352) );
  OAI22XL U852 ( .A0(n839), .A1(n753), .B0(n719), .B1(n755), .Y(n715) );
  OAI22XL U853 ( .A0(n822), .A1(n744), .B0(n825), .B1(n732), .Y(n714) );
  OAI22XL U854 ( .A0(n830), .A1(n707), .B0(n722), .B1(n706), .Y(n713) );
  OAI22XL U855 ( .A0(n711), .A1(n710), .B0(n709), .B1(n708), .Y(n712) );
  NOR2BX1 U856 ( .AN(intadd_0_SUM_3_), .B(n774), .Y(N353) );
  OAI22XL U857 ( .A0(n830), .A1(n732), .B0(n719), .B1(n753), .Y(n721) );
  OAI22XL U858 ( .A0(n822), .A1(n755), .B0(n825), .B1(n744), .Y(n720) );
  OAI22XL U859 ( .A0(n738), .A1(n786), .B0(n737), .B1(n785), .Y(n723) );
  OAI22XL U860 ( .A0(n783), .A1(n732), .B0(n837), .B1(n755), .Y(n726) );
  OAI22XL U861 ( .A0(n754), .A1(n744), .B0(n727), .B1(n752), .Y(n725) );
  OAI22XL U862 ( .A0(n733), .A1(n732), .B0(n827), .B1(n753), .Y(n735) );
  OAI22XL U863 ( .A0(n829), .A1(n755), .B0(n847), .B1(n744), .Y(n734) );
  AOI211XL U864 ( .A0(label[21]), .A1(n736), .B0(n735), .C0(n734), .Y(n743) );
  OAI22XL U865 ( .A0(n738), .A1(n791), .B0(n737), .B1(n789), .Y(n741) );
  NOR2BX1 U866 ( .AN(intadd_0_SUM_4_), .B(n774), .Y(N354) );
  OAI22XL U867 ( .A0(n783), .A1(n744), .B0(n754), .B1(n755), .Y(n746) );
  OAI22XL U868 ( .A0(n837), .A1(n753), .B0(n747), .B1(n752), .Y(n745) );
  OAI22XL U869 ( .A0(n783), .A1(n755), .B0(n754), .B1(n753), .Y(n756) );
  AOI221XL U870 ( .A0(n780), .A1(n758), .B0(n781), .B1(n757), .C0(n756), .Y(
        n760) );
  NOR2X1 U871 ( .A(n857), .B(n772), .Y(n775) );
  AO21X1 U872 ( .A0(done_flag), .A1(n442), .B0(Valid), .Y(nxt_state_1_) );
  AND4X1 U873 ( .A(n477), .B(n476), .C(n478), .D(minlarge[3]), .Y(n443) );
  CLKINVX1 U874 ( .A(n790), .Y(n792) );
  OAI22XL U875 ( .A0(n792), .A1(n781), .B0(n790), .B1(n780), .Y(n782) );
  OAI21XL U876 ( .A0(n844), .A1(n783), .B0(n782), .Y(n784) );
  AOI2BB2X1 U877 ( .B0(n796), .B1(n838), .A0N(n796), .A1N(n784), .Y(n441) );
  OAI22XL U878 ( .A0(n792), .A1(n786), .B0(n790), .B1(n785), .Y(n787) );
  OAI21XL U879 ( .A0(n844), .A1(n869), .B0(n787), .Y(n788) );
  AOI2BB2X1 U880 ( .B0(n796), .B1(n839), .A0N(n796), .A1N(n788), .Y(n440) );
  OAI22XL U881 ( .A0(n792), .A1(n791), .B0(n790), .B1(n789), .Y(n793) );
  OAI21XL U882 ( .A0(n794), .A1(n844), .B0(n793), .Y(n795) );
  AOI2BB2X1 U883 ( .B0(n796), .B1(n852), .A0N(n796), .A1N(n795), .Y(n439) );
  OAI22XL U884 ( .A0(n797), .A1(n802), .B0(n478), .B1(n801), .Y(n420) );
  OAI22XL U885 ( .A0(n477), .A1(n801), .B0(n798), .B1(n802), .Y(n419) );
  OAI22XL U886 ( .A0(n476), .A1(n801), .B0(n799), .B1(n802), .Y(n418) );
  AO21X1 U887 ( .A0(minlarge[3]), .A1(n800), .B0(n815), .Y(n417) );
  OAI22XL U888 ( .A0(n842), .A1(n802), .B0(n801), .B1(n475), .Y(n415) );
  OAI22XL U889 ( .A0(n831), .A1(n802), .B0(n801), .B1(n474), .Y(n414) );
  OAI21XL U890 ( .A0(n806), .A1(n828), .B0(n803), .Y(n410) );
  OAI22XL U891 ( .A0(n806), .A1(n856), .B0(n864), .B1(n804), .Y(n409) );
  AO22X1 U892 ( .A0(n806), .A1(n805), .B0(n864), .B1(pivot_reg[2]), .Y(n408)
         );
  OAI2BB2XL U893 ( .B0(n807), .B1(n853), .A0N(n807), .A1N(MinCost[4]), .Y(n403) );
  OA21XL U894 ( .A0(n808), .A1(cost_reg[9]), .B0(n880), .Y(n398) );
  OAI22XL U895 ( .A0(n810), .A1(n814), .B0(n813), .B1(n809), .Y(n393) );
  OAI22XL U896 ( .A0(counter[1]), .A1(n818), .B0(n842), .B1(n812), .Y(n392) );
  OAI21XL U897 ( .A0(n812), .A1(n831), .B0(n811), .Y(n391) );
  AOI2BB1X1 U898 ( .A0N(n819), .A1N(n814), .B0(n813), .Y(n816) );
  OAI21XL U899 ( .A0(n816), .A1(n815), .B0(counter[3]), .Y(n817) );
  OAI31XL U900 ( .A0(counter[3]), .A1(n819), .A2(n818), .B0(n817), .Y(n390) );
  DFFSX2 label_reg_6__2_ ( .D(n426), .CK(CLK), .SN(n867), .Q(label[20]), .QN(
        n754) );
  DFFSX2 label_reg_5__0_ ( .D(n427), .CK(CLK), .SN(n867), .Q(label[15]), .QN(
        n733) );
  DFFSX2 label_reg_7__0_ ( .D(n421), .CK(CLK), .SN(n866), .Q(label[21]), .QN(
        n794) );
  DFFSX2 label_reg_2__1_ ( .D(n437), .CK(CLK), .SN(n867), .Q(label[7]), .QN(
        n719) );
  DFFSX2 label_reg_4__2_ ( .D(n432), .CK(CLK), .SN(n867), .Q(label[14]), .QN(
        n728) );
  DFFRX2 counter_reg_0_ ( .D(n393), .CK(CLK), .RN(n866), .Q(counter[0]), .QN(
        n814) );
  DFFRX1 MatchCount_reg_0_ ( .D(n821), .CK(CLK), .RN(n866), .Q(n889) );
  CMPR32X2 intadd_0_U3 ( .A(Cost[5]), .B(cost_reg[5]), .C(intadd_0_n3), .CO(
        intadd_0_n2), .S(intadd_0_SUM_3_) );
  DFFSX1 minlarge_reg_3_ ( .D(n417), .CK(CLK), .SN(n867), .Q(minlarge[3]) );
  NAND2XL U469 ( .A(n842), .B(n831), .Y(n699) );
  INVXL U472 ( .A(n752), .Y(n780) );
  AND3X1 U473 ( .A(n691), .B(counter[3]), .C(n814), .Y(n813) );
  INVXL U477 ( .A(n672), .Y(n670) );
  INVXL U487 ( .A(n718), .Y(n716) );
  INVXL U492 ( .A(n740), .Y(n742) );
  INVX16 U495 ( .A(n889), .Y(MatchCount[0]) );
endmodule

