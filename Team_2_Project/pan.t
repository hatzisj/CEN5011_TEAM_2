#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(4*sizeof(Trans **));

	/* proctype 2: f */

	trans[2] = (Trans **) emalloc(6*sizeof(Trans *));

	T = trans[2][3] = settr(373,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(373,0,1,0,0,"IF", 0, 2, 0);
	trans[2][1]	= settr(371,0,3,3,0,"(!((len(place_Deliver)==5)))", 1, 2, 0);
	trans[2][2]	= settr(372,0,3,1,0,"goto T0_init", 0, 2, 0);
	trans[2][4]	= settr(374,0,5,1,0,".(goto)", 0, 2, 0);
	trans[2][5]	= settr(375,0,0,4,4,"-end-", 0, 3500, 0);

	/* proctype 1: :init: */

	trans[1] = (Trans **) emalloc(24*sizeof(Trans *));

	trans[1][1]	= settr(348,0,2,5,5,"AckBuf.AckBuf_field1 = 1", 0, 2, 0);
	trans[1][2]	= settr(349,0,3,6,6,"place_AckBuf!AckBuf.AckBuf_field1", 1, 10, 0);
	trans[1][3]	= settr(350,0,5,7,7,"", 0, 2, 0); /* m: 4 -> 0,5 */
	reached1[4] = 1;
	trans[1][4]	= settr(0,0,0,0,0,"Accept.Accept_field1 = 1",0,0,0);
	trans[1][5]	= settr(352,0,6,8,8,"place_Accept!Accept.Accept_field1", 1, 11, 0);
	trans[1][6]	= settr(353,0,7,9,9,"Accept.Accept_field1 = 2", 0, 2, 0);
	trans[1][7]	= settr(354,0,8,10,10,"place_Accept!Accept.Accept_field1", 1, 11, 0);
	trans[1][8]	= settr(355,0,9,11,11,"Accept.Accept_field1 = 3", 0, 2, 0);
	trans[1][9]	= settr(356,0,10,12,12,"place_Accept!Accept.Accept_field1", 1, 11, 0);
	trans[1][10]	= settr(357,0,11,13,13,"Accept.Accept_field1 = 4", 0, 2, 0);
	trans[1][11]	= settr(358,0,12,14,14,"place_Accept!Accept.Accept_field1", 1, 11, 0);
	trans[1][12]	= settr(359,0,13,15,15,"Accept.Accept_field1 = 5", 0, 2, 0);
	trans[1][13]	= settr(360,0,14,16,16,"place_Accept!Accept.Accept_field1", 1, 11, 0);
	trans[1][14]	= settr(361,0,17,17,17,"", 0, 2, 0); /* m: 15 -> 0,17 */
	reached1[15] = 1;
	trans[1][15]	= settr(0,0,0,0,0,"DataBuf.DataBuf_field1 = 1",0,0,0);
	trans[1][16]	= settr(0,0,0,0,0,"DataBuf.DataBuf_field2 = 999",0,0,0);
	trans[1][17]	= settr(364,0,18,18,18,"place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2", 1, 12, 0);
	trans[1][18]	= settr(365,0,21,19,19,"", 0, 2, 0); /* m: 19 -> 0,21 */
	reached1[19] = 1;
	trans[1][19]	= settr(0,0,0,0,0,"",0,0,0);
	trans[1][20]	= settr(0,0,0,0,0,"AckIn.AckIn_field1 = 1",0,0,0);
	trans[1][21]	= settr(368,0,22,20,20,"place_AckIn!AckIn.AckIn_field1", 1, 14, 0);
	trans[1][22]	= settr(369,0,23,21,21,"(run Main())", 0, 2, 0);
	trans[1][23]	= settr(370,0,0,22,22,"-end-", 0, 3500, 0);

	/* proctype 0: Main */

	trans[0] = (Trans **) emalloc(349*sizeof(Trans *));

	trans[0][346]	= settr(345,0,345,1,0,".(goto)", 0, 2, 0);
	T = trans[0][345] = settr(344,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,24,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,48,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,72,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,94,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,116,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,138,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,167,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,194,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,225,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,254,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,276,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,298,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(344,0,321,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(344,0,344,0,0,"DO", 0, 2, 0);
	T = trans[ 0][24] = settr(23,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(23,2,23,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][23] = settr(22,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(22,0,11,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][11] = settr(10,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(10,0,1,0,0,"sub-sequence", 1, 2, 0);
	trans[0][1]	= settr(0,2,2,23,0,"(place_CDataOut?[CDataOut.CDataOut_field1,CDataOut.CDataOut_field2])", 1, 2, 0);
	trans[0][2]	= settr(1,2,9,24,24,"place_CDataOut?CDataOut.CDataOut_field1,CDataOut.CDataOut_field2", 1, 503, 0);
	T = trans[0][9] = settr(8,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(8,2,4,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(8,2,6,0,0,"IF", 1, 2, 0);
	T = trans[ 0][4] = settr(3,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(3,0,3,0,0,"sub-sequence", 1, 2, 0);
	trans[0][3]	= settr(2,2,21,25,25,"((1&&1))", 1, 2, 0); /* m: 5 -> 21,0 */
	reached0[5] = 1;
	trans[0][5]	= settr(0,0,0,0,0,"corrupted_is_enabled = 1",0,0,0);
	trans[0][10]	= settr(9,2,21,1,0,".(goto)", 1, 2, 0);
	trans[0][6]	= settr(5,2,8,2,0,"else", 1, 2, 0);
	T = trans[ 0][8] = settr(7,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(7,0,7,0,0,"sub-sequence", 1, 2, 0);
	trans[0][7]	= settr(6,2,21,26,26,"place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2", 1, 3, 0);
	T = trans[0][21] = settr(20,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(20,2,12,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(20,2,19,0,0,"IF", 1, 2, 0);
	trans[0][12]	= settr(11,2,18,27,27,"(corrupted_is_enabled)", 1, 2, 0);
	T = trans[ 0][18] = settr(17,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(17,0,17,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][17] = settr(16,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(16,0,13,0,0,"sub-sequence", 1, 2, 0);
	trans[0][13]	= settr(12,2,15,28,28,"CDataIn.CDataIn_field1 = 3", 1, 2, 0); /* m: 14 -> 0,15 */
	reached0[14] = 1;
	trans[0][14]	= settr(0,0,0,0,0,"CDataIn.CDataIn_field2 = 999",0,0,0);
	trans[0][15]	= settr(14,0,345,29,29,"place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2", 1, 6, 0); /* m: 16 -> 345,0 */
	reached0[16] = 1;
	trans[0][16]	= settr(0,0,0,0,0,"corrupted_is_enabled = 0",0,0,0);
	trans[0][22]	= settr(21,0,345,30,30,".(goto)", 1, 2, 0);
	trans[0][19]	= settr(18,2,20,2,0,"else", 1, 2, 0);
	trans[0][20]	= settr(19,0,345,31,31,"(1)", 1, 2, 0); /* m: 22 -> 345,0 */
	reached0[22] = 1;
	T = trans[ 0][48] = settr(47,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(47,2,47,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][47] = settr(46,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(46,0,35,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][35] = settr(34,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(34,0,25,0,0,"sub-sequence", 1, 2, 0);
	trans[0][25]	= settr(24,2,26,32,0,"(place_CDataOut?[CDataOut.CDataOut_field1,CDataOut.CDataOut_field2])", 1, 2, 0);
	trans[0][26]	= settr(25,2,33,33,33,"place_CDataOut?CDataOut.CDataOut_field1,CDataOut.CDataOut_field2", 1, 503, 0);
	T = trans[0][33] = settr(32,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(32,2,28,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(32,2,30,0,0,"IF", 1, 2, 0);
	T = trans[ 0][28] = settr(27,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(27,0,27,0,0,"sub-sequence", 1, 2, 0);
	trans[0][27]	= settr(26,2,45,34,34,"((1&&1))", 1, 2, 0); /* m: 29 -> 45,0 */
	reached0[29] = 1;
	trans[0][29]	= settr(0,0,0,0,0,"transmitted_is_enabled = 1",0,0,0);
	trans[0][34]	= settr(33,2,45,1,0,".(goto)", 1, 2, 0);
	trans[0][30]	= settr(29,2,32,2,0,"else", 1, 2, 0);
	T = trans[ 0][32] = settr(31,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(31,0,31,0,0,"sub-sequence", 1, 2, 0);
	trans[0][31]	= settr(30,2,45,35,35,"place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2", 1, 3, 0);
	T = trans[0][45] = settr(44,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(44,2,36,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(44,2,43,0,0,"IF", 1, 2, 0);
	trans[0][36]	= settr(35,2,42,36,36,"(transmitted_is_enabled)", 1, 2, 0);
	T = trans[ 0][42] = settr(41,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(41,0,41,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][41] = settr(40,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(40,0,37,0,0,"sub-sequence", 1, 2, 0);
	trans[0][37]	= settr(36,2,39,37,37,"CDataIn.CDataIn_field1 = CDataOut.CDataOut_field1", 1, 2, 0); /* m: 38 -> 0,39 */
	reached0[38] = 1;
	trans[0][38]	= settr(0,0,0,0,0,"CDataIn.CDataIn_field2 = CDataOut.CDataOut_field2",0,0,0);
	trans[0][39]	= settr(38,0,345,38,38,"place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2", 1, 6, 0); /* m: 40 -> 345,0 */
	reached0[40] = 1;
	trans[0][40]	= settr(0,0,0,0,0,"transmitted_is_enabled = 0",0,0,0);
	trans[0][46]	= settr(45,0,345,39,39,".(goto)", 1, 2, 0);
	trans[0][43]	= settr(42,2,44,2,0,"else", 1, 2, 0);
	trans[0][44]	= settr(43,0,345,40,40,"(1)", 1, 2, 0); /* m: 46 -> 345,0 */
	reached0[46] = 1;
	T = trans[ 0][72] = settr(71,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(71,2,71,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][71] = settr(70,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(70,0,59,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][59] = settr(58,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(58,0,49,0,0,"sub-sequence", 1, 2, 0);
	trans[0][49]	= settr(48,2,50,41,0,"(place_CDataOut?[CDataOut.CDataOut_field1,CDataOut.CDataOut_field2])", 1, 2, 0);
	trans[0][50]	= settr(49,2,57,42,42,"place_CDataOut?CDataOut.CDataOut_field1,CDataOut.CDataOut_field2", 1, 503, 0);
	T = trans[0][57] = settr(56,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(56,2,52,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(56,2,54,0,0,"IF", 1, 2, 0);
	T = trans[ 0][52] = settr(51,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(51,0,51,0,0,"sub-sequence", 1, 2, 0);
	trans[0][51]	= settr(50,2,69,43,43,"((1&&1))", 1, 2, 0); /* m: 53 -> 69,0 */
	reached0[53] = 1;
	trans[0][53]	= settr(0,0,0,0,0,"lost_is_enabled = 1",0,0,0);
	trans[0][58]	= settr(57,2,69,1,0,".(goto)", 1, 2, 0);
	trans[0][54]	= settr(53,2,56,2,0,"else", 1, 2, 0);
	T = trans[ 0][56] = settr(55,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(55,0,55,0,0,"sub-sequence", 1, 2, 0);
	trans[0][55]	= settr(54,2,69,44,44,"place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2", 1, 3, 0);
	T = trans[0][69] = settr(68,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(68,2,60,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(68,2,67,0,0,"IF", 1, 2, 0);
	trans[0][60]	= settr(59,2,66,45,45,"(lost_is_enabled)", 1, 2, 0);
	T = trans[ 0][66] = settr(65,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(65,0,65,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][65] = settr(64,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(64,0,61,0,0,"sub-sequence", 1, 2, 0);
	trans[0][61]	= settr(60,2,63,46,46,"CDataIn.CDataIn_field1 = 4", 1, 2, 0); /* m: 62 -> 0,63 */
	reached0[62] = 1;
	trans[0][62]	= settr(0,0,0,0,0,"CDataIn.CDataIn_field2 = 1000",0,0,0);
	trans[0][63]	= settr(62,0,345,47,47,"place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2", 1, 6, 0); /* m: 64 -> 345,0 */
	reached0[64] = 1;
	trans[0][64]	= settr(0,0,0,0,0,"lost_is_enabled = 0",0,0,0);
	trans[0][70]	= settr(69,0,345,48,48,".(goto)", 1, 2, 0);
	trans[0][67]	= settr(66,2,68,2,0,"else", 1, 2, 0);
	trans[0][68]	= settr(67,0,345,49,49,"(1)", 1, 2, 0); /* m: 70 -> 345,0 */
	reached0[70] = 1;
	T = trans[ 0][94] = settr(93,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(93,2,93,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][93] = settr(92,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(92,0,82,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][82] = settr(81,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(81,0,73,0,0,"sub-sequence", 1, 2, 0);
	trans[0][73]	= settr(72,2,74,50,0,"(place_CAckOut?[CAckOut.CAckOut_field1])", 1, 2, 0);
	trans[0][74]	= settr(73,2,80,51,51,"place_CAckOut?CAckOut.CAckOut_field1", 1, 505, 0);
	T = trans[0][80] = settr(79,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(79,2,75,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(79,2,77,0,0,"IF", 1, 2, 0);
	trans[0][75]	= settr(74,2,91,52,52,"(1)", 1, 2, 0); /* m: 76 -> 91,0 */
	reached0[76] = 1;
	trans[0][76]	= settr(0,0,0,0,0,"corrupted_ack_is_enabled = 1",0,0,0);
	trans[0][81]	= settr(80,2,91,1,0,".(goto)", 1, 2, 0);
	trans[0][77]	= settr(76,2,79,2,0,"else", 1, 2, 0);
	T = trans[ 0][79] = settr(78,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(78,0,78,0,0,"sub-sequence", 1, 2, 0);
	trans[0][78]	= settr(77,2,91,53,53,"place_CAckOut!CAckOut.CAckOut_field1", 1, 5, 0);
	T = trans[0][91] = settr(90,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(90,2,83,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(90,2,89,0,0,"IF", 1, 2, 0);
	trans[0][83]	= settr(82,2,88,54,54,"(corrupted_ack_is_enabled)", 1, 2, 0);
	T = trans[ 0][88] = settr(87,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(87,0,87,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][87] = settr(86,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(86,0,84,0,0,"sub-sequence", 1, 2, 0);
	trans[0][84]	= settr(83,2,85,55,55,"CAckIn.CAckIn_field1 = 3", 1, 2, 0);
	trans[0][85]	= settr(84,0,345,56,56,"place_CAckIn!CAckIn.CAckIn_field1", 1, 4, 0); /* m: 86 -> 345,0 */
	reached0[86] = 1;
	trans[0][86]	= settr(0,0,0,0,0,"corrupted_ack_is_enabled = 0",0,0,0);
	trans[0][92]	= settr(91,0,345,57,57,".(goto)", 1, 2, 0);
	trans[0][89]	= settr(88,2,90,2,0,"else", 1, 2, 0);
	trans[0][90]	= settr(89,0,345,58,58,"(1)", 1, 2, 0); /* m: 92 -> 345,0 */
	reached0[92] = 1;
	T = trans[ 0][116] = settr(115,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(115,2,115,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][115] = settr(114,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(114,0,104,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][104] = settr(103,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(103,0,95,0,0,"sub-sequence", 1, 2, 0);
	trans[0][95]	= settr(94,2,96,59,0,"(place_CAckOut?[CAckOut.CAckOut_field1])", 1, 2, 0);
	trans[0][96]	= settr(95,2,102,60,60,"place_CAckOut?CAckOut.CAckOut_field1", 1, 505, 0);
	T = trans[0][102] = settr(101,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(101,2,97,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(101,2,99,0,0,"IF", 1, 2, 0);
	trans[0][97]	= settr(96,2,113,61,61,"(1)", 1, 2, 0); /* m: 98 -> 113,0 */
	reached0[98] = 1;
	trans[0][98]	= settr(0,0,0,0,0,"transmitted_ack_is_enabled = 1",0,0,0);
	trans[0][103]	= settr(102,2,113,1,0,".(goto)", 1, 2, 0);
	trans[0][99]	= settr(98,2,101,2,0,"else", 1, 2, 0);
	T = trans[ 0][101] = settr(100,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(100,0,100,0,0,"sub-sequence", 1, 2, 0);
	trans[0][100]	= settr(99,2,113,62,62,"place_CAckOut!CAckOut.CAckOut_field1", 1, 5, 0);
	T = trans[0][113] = settr(112,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(112,2,105,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(112,2,111,0,0,"IF", 1, 2, 0);
	trans[0][105]	= settr(104,2,110,63,63,"(transmitted_ack_is_enabled)", 1, 2, 0);
	T = trans[ 0][110] = settr(109,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(109,0,109,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][109] = settr(108,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(108,0,106,0,0,"sub-sequence", 1, 2, 0);
	trans[0][106]	= settr(105,2,107,64,64,"CAckIn.CAckIn_field1 = CAckOut.CAckOut_field1", 1, 2, 0);
	trans[0][107]	= settr(106,0,345,65,65,"place_CAckIn!CAckIn.CAckIn_field1", 1, 4, 0); /* m: 108 -> 345,0 */
	reached0[108] = 1;
	trans[0][108]	= settr(0,0,0,0,0,"transmitted_ack_is_enabled = 0",0,0,0);
	trans[0][114]	= settr(113,0,345,66,66,".(goto)", 1, 2, 0);
	trans[0][111]	= settr(110,2,112,2,0,"else", 1, 2, 0);
	trans[0][112]	= settr(111,0,345,67,67,"(1)", 1, 2, 0); /* m: 114 -> 345,0 */
	reached0[114] = 1;
	T = trans[ 0][138] = settr(137,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(137,2,137,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][137] = settr(136,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(136,0,126,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][126] = settr(125,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(125,0,117,0,0,"sub-sequence", 1, 2, 0);
	trans[0][117]	= settr(116,2,118,68,0,"(place_CAckOut?[CAckOut.CAckOut_field1])", 1, 2, 0);
	trans[0][118]	= settr(117,2,124,69,69,"place_CAckOut?CAckOut.CAckOut_field1", 1, 505, 0);
	T = trans[0][124] = settr(123,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(123,2,119,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(123,2,121,0,0,"IF", 1, 2, 0);
	trans[0][119]	= settr(118,2,135,70,70,"(1)", 1, 2, 0); /* m: 120 -> 135,0 */
	reached0[120] = 1;
	trans[0][120]	= settr(0,0,0,0,0,"lost_ack_is_enabled = 1",0,0,0);
	trans[0][125]	= settr(124,2,135,1,0,".(goto)", 1, 2, 0);
	trans[0][121]	= settr(120,2,123,2,0,"else", 1, 2, 0);
	T = trans[ 0][123] = settr(122,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(122,0,122,0,0,"sub-sequence", 1, 2, 0);
	trans[0][122]	= settr(121,2,135,71,71,"place_CAckOut!CAckOut.CAckOut_field1", 1, 5, 0);
	T = trans[0][135] = settr(134,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(134,2,127,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(134,2,133,0,0,"IF", 1, 2, 0);
	trans[0][127]	= settr(126,2,132,72,72,"(lost_ack_is_enabled)", 1, 2, 0);
	T = trans[ 0][132] = settr(131,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(131,0,131,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][131] = settr(130,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(130,0,128,0,0,"sub-sequence", 1, 2, 0);
	trans[0][128]	= settr(127,2,129,73,73,"CAckIn.CAckIn_field1 = 4", 1, 2, 0);
	trans[0][129]	= settr(128,0,345,74,74,"place_CAckIn!CAckIn.CAckIn_field1", 1, 4, 0); /* m: 130 -> 345,0 */
	reached0[130] = 1;
	trans[0][130]	= settr(0,0,0,0,0,"lost_ack_is_enabled = 0",0,0,0);
	trans[0][136]	= settr(135,0,345,75,75,".(goto)", 1, 2, 0);
	trans[0][133]	= settr(132,2,134,2,0,"else", 1, 2, 0);
	trans[0][134]	= settr(133,0,345,76,76,"(1)", 1, 2, 0); /* m: 136 -> 345,0 */
	reached0[136] = 1;
	T = trans[ 0][167] = settr(166,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(166,2,166,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][166] = settr(165,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(165,0,151,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][151] = settr(150,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(150,0,139,0,0,"sub-sequence", 1, 2, 0);
	trans[0][139]	= settr(138,2,140,77,0,"((place_DataIn?[DataIn.DataIn_field1,DataIn.DataIn_field2]&&place_AckBuf?[AckBuf.AckBuf_field1]))", 1, 2, 0);
	trans[0][140]	= settr(139,2,141,78,78,"place_DataIn?DataIn.DataIn_field1,DataIn.DataIn_field2", 1, 507, 0);
	trans[0][141]	= settr(140,2,149,79,79,"place_AckBuf?AckBuf.AckBuf_field1", 1, 510, 0);
	T = trans[0][149] = settr(148,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(148,2,143,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(148,2,145,0,0,"IF", 1, 2, 0);
	T = trans[ 0][143] = settr(142,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(142,0,142,0,0,"sub-sequence", 1, 2, 0);
	trans[0][142]	= settr(141,2,164,80,80,"(((((((DataIn.DataIn_field1==0)||(DataIn.DataIn_field1==1))&&(DataIn.DataIn_field1==((AckBuf.AckBuf_field1+1)%2)))&&1)&&1)&&1))", 1, 2, 0); /* m: 144 -> 164,0 */
	reached0[144] = 1;
	trans[0][144]	= settr(0,0,0,0,0,"deliverData_is_enabled = 1",0,0,0);
	trans[0][150]	= settr(149,2,164,1,0,".(goto)", 1, 2, 0);
	trans[0][145]	= settr(144,2,148,2,0,"else", 1, 2, 0);
	T = trans[ 0][148] = settr(147,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(147,0,146,0,0,"sub-sequence", 1, 2, 0);
	trans[0][146]	= settr(145,2,147,81,81,"place_DataIn!DataIn.DataIn_field1,DataIn.DataIn_field2", 1, 7, 0);
	trans[0][147]	= settr(146,2,164,82,82,"place_AckBuf!AckBuf.AckBuf_field1", 1, 10, 0);
	T = trans[0][164] = settr(163,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(163,2,152,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(163,2,162,0,0,"IF", 1, 2, 0);
	trans[0][152]	= settr(151,2,161,83,83,"(deliverData_is_enabled)", 1, 2, 0);
	T = trans[ 0][161] = settr(160,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(160,0,160,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][160] = settr(159,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(159,0,153,0,0,"sub-sequence", 1, 2, 0);
	trans[0][153]	= settr(152,2,156,84,84,"Deliver.Deliver_field1 = DataIn.DataIn_field2", 1, 2, 0); /* m: 154 -> 0,156 */
	reached0[154] = 1;
	trans[0][154]	= settr(0,0,0,0,0,"AckOut.AckOut_field1 = DataIn.DataIn_field1",0,0,0);
	trans[0][155]	= settr(0,0,0,0,0,"AckBuf.AckBuf_field1 = DataIn.DataIn_field1",0,0,0);
	trans[0][156]	= settr(155,2,157,85,85,"place_Deliver!Deliver.Deliver_field1", 1, 8, 0);
	trans[0][157]	= settr(156,2,158,86,86,"place_AckOut!AckOut.AckOut_field1", 1, 9, 0);
	trans[0][158]	= settr(157,0,345,87,87,"place_AckBuf!AckBuf.AckBuf_field1", 1, 10, 0); /* m: 159 -> 345,0 */
	reached0[159] = 1;
	trans[0][159]	= settr(0,0,0,0,0,"deliverData_is_enabled = 0",0,0,0);
	trans[0][165]	= settr(164,0,345,88,88,".(goto)", 1, 2, 0);
	trans[0][162]	= settr(161,2,163,2,0,"else", 1, 2, 0);
	trans[0][163]	= settr(162,0,345,89,89,"(1)", 1, 2, 0); /* m: 165 -> 345,0 */
	reached0[165] = 1;
	T = trans[ 0][194] = settr(193,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(193,2,193,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][193] = settr(192,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(192,0,180,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][180] = settr(179,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(179,0,168,0,0,"sub-sequence", 1, 2, 0);
	trans[0][168]	= settr(167,2,169,90,0,"((place_DataIn?[DataIn.DataIn_field1,DataIn.DataIn_field2]&&place_AckBuf?[AckBuf.AckBuf_field1]))", 1, 2, 0);
	trans[0][169]	= settr(168,2,170,91,91,"place_DataIn?DataIn.DataIn_field1,DataIn.DataIn_field2", 1, 507, 0);
	trans[0][170]	= settr(169,2,178,92,92,"place_AckBuf?AckBuf.AckBuf_field1", 1, 510, 0);
	T = trans[0][178] = settr(177,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(177,2,172,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(177,2,174,0,0,"IF", 1, 2, 0);
	T = trans[ 0][172] = settr(171,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(171,0,171,0,0,"sub-sequence", 1, 2, 0);
	trans[0][171]	= settr(170,2,191,93,93,"(((((DataIn.DataIn_field1==3)||(DataIn.DataIn_field1==4))&&1)&&1))", 1, 2, 0); /* m: 173 -> 191,0 */
	reached0[173] = 1;
	trans[0][173]	= settr(0,0,0,0,0,"resendAck_is_enabled = 1",0,0,0);
	trans[0][179]	= settr(178,2,191,1,0,".(goto)", 1, 2, 0);
	trans[0][174]	= settr(173,2,177,2,0,"else", 1, 2, 0);
	T = trans[ 0][177] = settr(176,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(176,0,175,0,0,"sub-sequence", 1, 2, 0);
	trans[0][175]	= settr(174,2,176,94,94,"place_DataIn!DataIn.DataIn_field1,DataIn.DataIn_field2", 1, 7, 0);
	trans[0][176]	= settr(175,2,191,95,95,"place_AckBuf!AckBuf.AckBuf_field1", 1, 10, 0);
	T = trans[0][191] = settr(190,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(190,2,181,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(190,2,189,0,0,"IF", 1, 2, 0);
	trans[0][181]	= settr(180,2,188,96,96,"(resendAck_is_enabled)", 1, 2, 0);
	T = trans[ 0][188] = settr(187,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(187,0,187,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][187] = settr(186,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(186,0,182,0,0,"sub-sequence", 1, 2, 0);
	trans[0][182]	= settr(181,2,184,97,97,"AckBuf.AckBuf_field1 = AckBuf.AckBuf_field1", 1, 2, 0); /* m: 183 -> 0,184 */
	reached0[183] = 1;
	trans[0][183]	= settr(0,0,0,0,0,"AckOut.AckOut_field1 = AckBuf.AckBuf_field1",0,0,0);
	trans[0][184]	= settr(183,2,185,98,98,"place_AckOut!AckOut.AckOut_field1", 1, 9, 0);
	trans[0][185]	= settr(184,0,345,99,99,"place_AckBuf!AckBuf.AckBuf_field1", 1, 10, 0); /* m: 186 -> 345,0 */
	reached0[186] = 1;
	trans[0][186]	= settr(0,0,0,0,0,"resendAck_is_enabled = 0",0,0,0);
	trans[0][192]	= settr(191,0,345,100,100,".(goto)", 1, 2, 0);
	trans[0][189]	= settr(188,2,190,2,0,"else", 1, 2, 0);
	trans[0][190]	= settr(189,0,345,101,101,"(1)", 1, 2, 0); /* m: 192 -> 345,0 */
	reached0[192] = 1;
	T = trans[ 0][225] = settr(224,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(224,2,224,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][224] = settr(223,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(223,0,209,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][209] = settr(208,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(208,0,195,0,0,"sub-sequence", 1, 2, 0);
	trans[0][195]	= settr(194,2,196,102,0,"(((place_Accept?[Accept.Accept_field1]&&place_DataBuf?[DataBuf.DataBuf_field1,DataBuf.DataBuf_field2])&&place_AckIn?[AckIn.AckIn_field1]))", 1, 2, 0);
	trans[0][196]	= settr(195,2,197,103,103,"place_Accept?Accept.Accept_field1", 1, 511, 0);
	trans[0][197]	= settr(196,2,198,104,104,"place_DataBuf?DataBuf.DataBuf_field1,DataBuf.DataBuf_field2", 1, 512, 0);
	trans[0][198]	= settr(197,2,207,105,105,"place_AckIn?AckIn.AckIn_field1", 1, 514, 0);
	T = trans[0][207] = settr(206,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(206,2,200,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(206,2,202,0,0,"IF", 1, 2, 0);
	T = trans[ 0][200] = settr(199,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(199,0,199,0,0,"sub-sequence", 1, 2, 0);
	trans[0][199]	= settr(198,2,222,106,106,"((((((((AckIn.AckIn_field1==0)||(AckIn.AckIn_field1==1))&&(AckIn.AckIn_field1==DataBuf.DataBuf_field1))&&1)&&1)&&1)&&1))", 1, 2, 0); /* m: 201 -> 222,0 */
	reached0[201] = 1;
	trans[0][201]	= settr(0,0,0,0,0,"sendData_is_enabled = 1",0,0,0);
	trans[0][208]	= settr(207,2,222,1,0,".(goto)", 1, 2, 0);
	trans[0][202]	= settr(201,2,206,2,0,"else", 1, 2, 0);
	T = trans[ 0][206] = settr(205,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(205,0,203,0,0,"sub-sequence", 1, 2, 0);
	trans[0][203]	= settr(202,2,204,107,107,"place_Accept!Accept.Accept_field1", 1, 11, 0);
	trans[0][204]	= settr(203,2,205,108,108,"place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2", 1, 12, 0);
	trans[0][205]	= settr(204,2,222,109,109,"place_AckIn!AckIn.AckIn_field1", 1, 14, 0);
	T = trans[0][222] = settr(221,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(221,2,210,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(221,2,220,0,0,"IF", 1, 2, 0);
	trans[0][210]	= settr(209,2,219,110,110,"(sendData_is_enabled)", 1, 2, 0);
	T = trans[ 0][219] = settr(218,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(218,0,218,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][218] = settr(217,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(217,0,211,0,0,"sub-sequence", 1, 2, 0);
	trans[0][211]	= settr(210,2,215,111,111,"DataOut.DataOut_field1 = ((AckIn.AckIn_field1+1)%2)", 1, 2, 0); /* m: 212 -> 0,215 */
	reached0[212] = 1;
	trans[0][212]	= settr(0,0,0,0,0,"DataOut.DataOut_field2 = Accept.Accept_field1",0,0,0);
	trans[0][213]	= settr(0,0,0,0,0,"DataBuf.DataBuf_field1 = ((AckIn.AckIn_field1+1)%2)",0,0,0);
	trans[0][214]	= settr(0,0,0,0,0,"DataBuf.DataBuf_field2 = Accept.Accept_field1",0,0,0);
	trans[0][215]	= settr(214,2,216,112,112,"place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2", 1, 12, 0);
	trans[0][216]	= settr(215,0,345,113,113,"place_DataOut!DataOut.DataOut_field1,DataOut.DataOut_field2", 1, 13, 0); /* m: 217 -> 345,0 */
	reached0[217] = 1;
	trans[0][217]	= settr(0,0,0,0,0,"sendData_is_enabled = 0",0,0,0);
	trans[0][223]	= settr(222,0,345,114,114,".(goto)", 1, 2, 0);
	trans[0][220]	= settr(219,2,221,2,0,"else", 1, 2, 0);
	trans[0][221]	= settr(220,0,345,115,115,"(1)", 1, 2, 0); /* m: 223 -> 345,0 */
	reached0[223] = 1;
	T = trans[ 0][254] = settr(253,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(253,2,253,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][253] = settr(252,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(252,0,238,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][238] = settr(237,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(237,0,226,0,0,"sub-sequence", 1, 2, 0);
	trans[0][226]	= settr(225,2,227,116,0,"((place_DataBuf?[DataBuf.DataBuf_field1,DataBuf.DataBuf_field2]&&place_AckIn?[AckIn.AckIn_field1]))", 1, 2, 0);
	trans[0][227]	= settr(226,2,228,117,117,"place_DataBuf?DataBuf.DataBuf_field1,DataBuf.DataBuf_field2", 1, 512, 0);
	trans[0][228]	= settr(227,2,236,118,118,"place_AckIn?AckIn.AckIn_field1", 1, 514, 0);
	T = trans[0][236] = settr(235,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(235,2,230,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(235,2,232,0,0,"IF", 1, 2, 0);
	T = trans[ 0][230] = settr(229,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(229,0,229,0,0,"sub-sequence", 1, 2, 0);
	trans[0][229]	= settr(228,2,251,119,119,"(((((((AckIn.AckIn_field1==3)||(AckIn.AckIn_field1==4))&&1)&&1)&&1)&&1))", 1, 2, 0); /* m: 231 -> 251,0 */
	reached0[231] = 1;
	trans[0][231]	= settr(0,0,0,0,0,"resendData_is_enabled = 1",0,0,0);
	trans[0][237]	= settr(236,2,251,1,0,".(goto)", 1, 2, 0);
	trans[0][232]	= settr(231,2,235,2,0,"else", 1, 2, 0);
	T = trans[ 0][235] = settr(234,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(234,0,233,0,0,"sub-sequence", 1, 2, 0);
	trans[0][233]	= settr(232,2,234,120,120,"place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2", 1, 12, 0);
	trans[0][234]	= settr(233,2,251,121,121,"place_AckIn!AckIn.AckIn_field1", 1, 14, 0);
	T = trans[0][251] = settr(250,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(250,2,239,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(250,2,249,0,0,"IF", 1, 2, 0);
	trans[0][239]	= settr(238,2,248,122,122,"(resendData_is_enabled)", 1, 2, 0);
	T = trans[ 0][248] = settr(247,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(247,0,247,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][247] = settr(246,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(246,0,240,0,0,"sub-sequence", 1, 2, 0);
	trans[0][240]	= settr(239,2,244,123,123,"DataOut.DataOut_field1 = DataBuf.DataBuf_field1", 1, 2, 0); /* m: 241 -> 0,244 */
	reached0[241] = 1;
	trans[0][241]	= settr(0,0,0,0,0,"DataOut.DataOut_field2 = DataBuf.DataBuf_field2",0,0,0);
	trans[0][242]	= settr(0,0,0,0,0,"DataBuf.DataBuf_field1 = DataBuf.DataBuf_field1",0,0,0);
	trans[0][243]	= settr(0,0,0,0,0,"DataBuf.DataBuf_field2 = DataBuf.DataBuf_field2",0,0,0);
	trans[0][244]	= settr(243,2,245,124,124,"place_DataBuf!DataBuf.DataBuf_field1,DataBuf.DataBuf_field2", 1, 12, 0);
	trans[0][245]	= settr(244,0,345,125,125,"place_DataOut!DataOut.DataOut_field1,DataOut.DataOut_field2", 1, 13, 0); /* m: 246 -> 345,0 */
	reached0[246] = 1;
	trans[0][246]	= settr(0,0,0,0,0,"resendData_is_enabled = 0",0,0,0);
	trans[0][252]	= settr(251,0,345,126,126,".(goto)", 1, 2, 0);
	trans[0][249]	= settr(248,2,250,2,0,"else", 1, 2, 0);
	trans[0][250]	= settr(249,0,345,127,127,"(1)", 1, 2, 0); /* m: 252 -> 345,0 */
	reached0[252] = 1;
	T = trans[ 0][276] = settr(275,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(275,2,275,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][275] = settr(274,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(274,0,264,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][264] = settr(263,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(263,0,255,0,0,"sub-sequence", 1, 2, 0);
	trans[0][255]	= settr(254,2,256,128,0,"(place_AckOut?[AckOut.AckOut_field1])", 1, 2, 0);
	trans[0][256]	= settr(255,2,262,129,129,"place_AckOut?AckOut.AckOut_field1", 1, 509, 0);
	T = trans[0][262] = settr(261,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(261,2,257,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(261,2,259,0,0,"IF", 1, 2, 0);
	trans[0][257]	= settr(256,2,273,130,130,"(1)", 1, 2, 0); /* m: 258 -> 273,0 */
	reached0[258] = 1;
	trans[0][258]	= settr(0,0,0,0,0,"Conn5_is_enabled = 1",0,0,0);
	trans[0][263]	= settr(262,2,273,1,0,".(goto)", 1, 2, 0);
	trans[0][259]	= settr(258,2,261,2,0,"else", 1, 2, 0);
	T = trans[ 0][261] = settr(260,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(260,0,260,0,0,"sub-sequence", 1, 2, 0);
	trans[0][260]	= settr(259,2,273,131,131,"place_AckOut!AckOut.AckOut_field1", 1, 9, 0);
	T = trans[0][273] = settr(272,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(272,2,265,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(272,2,271,0,0,"IF", 1, 2, 0);
	trans[0][265]	= settr(264,2,270,132,132,"(Conn5_is_enabled)", 1, 2, 0);
	T = trans[ 0][270] = settr(269,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(269,0,269,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][269] = settr(268,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(268,0,266,0,0,"sub-sequence", 1, 2, 0);
	trans[0][266]	= settr(265,2,267,133,133,"CAckOut.CAckOut_field1 = AckOut.AckOut_field1", 1, 2, 0);
	trans[0][267]	= settr(266,0,345,134,134,"place_CAckOut!CAckOut.CAckOut_field1", 1, 5, 0); /* m: 268 -> 345,0 */
	reached0[268] = 1;
	trans[0][268]	= settr(0,0,0,0,0,"Conn5_is_enabled = 0",0,0,0);
	trans[0][274]	= settr(273,0,345,135,135,".(goto)", 1, 2, 0);
	trans[0][271]	= settr(270,2,272,2,0,"else", 1, 2, 0);
	trans[0][272]	= settr(271,0,345,136,136,"(1)", 1, 2, 0); /* m: 274 -> 345,0 */
	reached0[274] = 1;
	T = trans[ 0][298] = settr(297,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(297,2,297,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][297] = settr(296,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(296,0,286,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][286] = settr(285,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(285,0,277,0,0,"sub-sequence", 1, 2, 0);
	trans[0][277]	= settr(276,2,278,137,0,"(place_CAckIn?[CAckIn.CAckIn_field1])", 1, 2, 0);
	trans[0][278]	= settr(277,2,284,138,138,"place_CAckIn?CAckIn.CAckIn_field1", 1, 504, 0);
	T = trans[0][284] = settr(283,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(283,2,279,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(283,2,281,0,0,"IF", 1, 2, 0);
	trans[0][279]	= settr(278,2,295,139,139,"(1)", 1, 2, 0); /* m: 280 -> 295,0 */
	reached0[280] = 1;
	trans[0][280]	= settr(0,0,0,0,0,"Conn4_is_enabled = 1",0,0,0);
	trans[0][285]	= settr(284,2,295,1,0,".(goto)", 1, 2, 0);
	trans[0][281]	= settr(280,2,283,2,0,"else", 1, 2, 0);
	T = trans[ 0][283] = settr(282,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(282,0,282,0,0,"sub-sequence", 1, 2, 0);
	trans[0][282]	= settr(281,2,295,140,140,"place_CAckIn!CAckIn.CAckIn_field1", 1, 4, 0);
	T = trans[0][295] = settr(294,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(294,2,287,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(294,2,293,0,0,"IF", 1, 2, 0);
	trans[0][287]	= settr(286,2,292,141,141,"(Conn4_is_enabled)", 1, 2, 0);
	T = trans[ 0][292] = settr(291,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(291,0,291,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][291] = settr(290,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(290,0,288,0,0,"sub-sequence", 1, 2, 0);
	trans[0][288]	= settr(287,2,289,142,142,"AckIn.AckIn_field1 = CAckIn.CAckIn_field1", 1, 2, 0);
	trans[0][289]	= settr(288,0,345,143,143,"place_AckIn!AckIn.AckIn_field1", 1, 14, 0); /* m: 290 -> 345,0 */
	reached0[290] = 1;
	trans[0][290]	= settr(0,0,0,0,0,"Conn4_is_enabled = 0",0,0,0);
	trans[0][296]	= settr(295,0,345,144,144,".(goto)", 1, 2, 0);
	trans[0][293]	= settr(292,2,294,2,0,"else", 1, 2, 0);
	trans[0][294]	= settr(293,0,345,145,145,"(1)", 1, 2, 0); /* m: 296 -> 345,0 */
	reached0[296] = 1;
	T = trans[ 0][321] = settr(320,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(320,2,320,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][320] = settr(319,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(319,0,308,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][308] = settr(307,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(307,0,299,0,0,"sub-sequence", 1, 2, 0);
	trans[0][299]	= settr(298,2,300,146,0,"(place_CDataIn?[CDataIn.CDataIn_field1,CDataIn.CDataIn_field2])", 1, 2, 0);
	trans[0][300]	= settr(299,2,306,147,147,"place_CDataIn?CDataIn.CDataIn_field1,CDataIn.CDataIn_field2", 1, 506, 0);
	T = trans[0][306] = settr(305,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(305,2,301,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(305,2,303,0,0,"IF", 1, 2, 0);
	trans[0][301]	= settr(300,2,318,148,148,"(1)", 1, 2, 0); /* m: 302 -> 318,0 */
	reached0[302] = 1;
	trans[0][302]	= settr(0,0,0,0,0,"Conn3_is_enabled = 1",0,0,0);
	trans[0][307]	= settr(306,2,318,1,0,".(goto)", 1, 2, 0);
	trans[0][303]	= settr(302,2,305,2,0,"else", 1, 2, 0);
	T = trans[ 0][305] = settr(304,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(304,0,304,0,0,"sub-sequence", 1, 2, 0);
	trans[0][304]	= settr(303,2,318,149,149,"place_CDataIn!CDataIn.CDataIn_field1,CDataIn.CDataIn_field2", 1, 6, 0);
	T = trans[0][318] = settr(317,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(317,2,309,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(317,2,316,0,0,"IF", 1, 2, 0);
	trans[0][309]	= settr(308,2,315,150,150,"(Conn3_is_enabled)", 1, 2, 0);
	T = trans[ 0][315] = settr(314,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(314,0,314,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][314] = settr(313,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(313,0,310,0,0,"sub-sequence", 1, 2, 0);
	trans[0][310]	= settr(309,2,312,151,151,"DataIn.DataIn_field1 = CDataIn.CDataIn_field1", 1, 2, 0); /* m: 311 -> 0,312 */
	reached0[311] = 1;
	trans[0][311]	= settr(0,0,0,0,0,"DataIn.DataIn_field2 = CDataIn.CDataIn_field2",0,0,0);
	trans[0][312]	= settr(311,0,345,152,152,"place_DataIn!DataIn.DataIn_field1,DataIn.DataIn_field2", 1, 7, 0); /* m: 313 -> 345,0 */
	reached0[313] = 1;
	trans[0][313]	= settr(0,0,0,0,0,"Conn3_is_enabled = 0",0,0,0);
	trans[0][319]	= settr(318,0,345,153,153,".(goto)", 1, 2, 0);
	trans[0][316]	= settr(315,2,317,2,0,"else", 1, 2, 0);
	trans[0][317]	= settr(316,0,345,154,154,"(1)", 1, 2, 0); /* m: 319 -> 345,0 */
	reached0[319] = 1;
	T = trans[ 0][344] = settr(343,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(343,2,343,0,0,"ATOMIC", 1, 2, 0);
	T = trans[ 0][343] = settr(342,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(342,0,331,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][331] = settr(330,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(330,0,322,0,0,"sub-sequence", 1, 2, 0);
	trans[0][322]	= settr(321,2,323,155,0,"(place_DataOut?[DataOut.DataOut_field1,DataOut.DataOut_field2])", 1, 2, 0);
	trans[0][323]	= settr(322,2,329,156,156,"place_DataOut?DataOut.DataOut_field1,DataOut.DataOut_field2", 1, 513, 0);
	T = trans[0][329] = settr(328,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(328,2,324,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(328,2,326,0,0,"IF", 1, 2, 0);
	trans[0][324]	= settr(323,2,341,157,157,"(1)", 1, 2, 0); /* m: 325 -> 341,0 */
	reached0[325] = 1;
	trans[0][325]	= settr(0,0,0,0,0,"Conn2_is_enabled = 1",0,0,0);
	trans[0][330]	= settr(329,2,341,1,0,".(goto)", 1, 2, 0);
	trans[0][326]	= settr(325,2,328,2,0,"else", 1, 2, 0);
	T = trans[ 0][328] = settr(327,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(327,0,327,0,0,"sub-sequence", 1, 2, 0);
	trans[0][327]	= settr(326,2,341,158,158,"place_DataOut!DataOut.DataOut_field1,DataOut.DataOut_field2", 1, 13, 0);
	T = trans[0][341] = settr(340,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(340,2,332,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(340,2,339,0,0,"IF", 1, 2, 0);
	trans[0][332]	= settr(331,2,338,159,159,"(Conn2_is_enabled)", 1, 2, 0);
	T = trans[ 0][338] = settr(337,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(337,0,337,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 0][337] = settr(336,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(336,0,333,0,0,"sub-sequence", 1, 2, 0);
	trans[0][333]	= settr(332,2,335,160,160,"CDataOut.CDataOut_field1 = DataOut.DataOut_field1", 1, 2, 0); /* m: 334 -> 0,335 */
	reached0[334] = 1;
	trans[0][334]	= settr(0,0,0,0,0,"CDataOut.CDataOut_field2 = DataOut.DataOut_field2",0,0,0);
	trans[0][335]	= settr(334,0,345,161,161,"place_CDataOut!CDataOut.CDataOut_field1,CDataOut.CDataOut_field2", 1, 3, 0); /* m: 336 -> 345,0 */
	reached0[336] = 1;
	trans[0][336]	= settr(0,0,0,0,0,"Conn2_is_enabled = 0",0,0,0);
	trans[0][342]	= settr(341,0,345,162,162,".(goto)", 1, 2, 0);
	trans[0][339]	= settr(338,2,340,2,0,"else", 1, 2, 0);
	trans[0][340]	= settr(339,0,345,163,163,"(1)", 1, 2, 0); /* m: 342 -> 345,0 */
	reached0[342] = 1;
	trans[0][347]	= settr(346,0,348,1,0,"break", 0, 2, 0);
	trans[0][348]	= settr(347,0,0,164,164,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(2*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
